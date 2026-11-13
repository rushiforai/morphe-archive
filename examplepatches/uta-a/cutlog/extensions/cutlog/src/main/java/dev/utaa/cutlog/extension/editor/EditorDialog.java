package dev.utaa.cutlog.extension.editor;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Outline;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.Choreographer;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import dev.utaa.cutlog.extension.hook.CaptureReplacement;
import dev.utaa.cutlog.extension.hook.EditSession;
import dev.utaa.cutlog.extension.pref.Prefs;
import dev.utaa.cutlog.extension.record.RecordDuration;
import dev.utaa.cutlog.extension.render.EffectsFactory;
import dev.utaa.cutlog.extension.render.OutputProfile;
import dev.utaa.cutlog.extension.render.Renderer;
import dev.utaa.cutlog.extension.render.Reverser;
import dev.utaa.cutlog.shaded.androidx.media3.common.Effect;
import dev.utaa.cutlog.shaded.androidx.media3.common.MediaItem;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 撮影直後・取り込み直後に出す全画面の編集画面。
 *
 * <p>上から、プレビュー（左上の ✕ でキャンセル、右上のピンクの ↑ で書き出して投稿）、再生の行、
 * タイムライン、選んだツールのパネル、ツールバー。カメラ画面の Activity の上に重ねるだけなので、
 * 閉じれば本体の撮影画面の状態がそのまま残る。結果は {@link EditSession} を通して一度だけ本体へ返す。
 */
public final class EditorDialog extends Dialog implements EditorHost {
    private final Activity activity;
    private final EditSession session;
    /** 入力の動画（表示上の向きの幅・高さ）。 */
    private final CaptureReplacement source;
    /** 取り込んだ動画を公式撮影分の仕様へ揃える（トリムあり、そのまま投稿なし）。 */
    private final boolean normalize;
    /** 書き出しの幅・高さ。プレビューの縦横比と文字の描画もこれに合わせる。 */
    private final int outputWidth;
    private final int outputHeight;
    /** 取り込んだ動画から切り出す長さと、開始位置。 */
    private final long clipDurationMs;
    private long clipStartMs;
    private final EditSpec spec = new EditSpec();

    private PreviewController preview;
    private ThumbnailLoader thumbnails;
    /** 逆再生の中間ファイルを作っている間の処理と、できあがった中間ファイル。 */
    private Reverser reverser;
    private File reversedFile;
    private Renderer renderer;
    private Layer selected;

    private TextureView previewTexture;
    private LayerOverlayView overlay;
    private TimelineView timeline;
    private ToolBar toolBar;
    private final List<ToolPanel> panels = new ArrayList<>();
    private FrameLayout panelArea;
    private int textTool;
    private int stickerTool;
    private int motionTool;
    private final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
    /** 画像を選んでいる間の受け取り口。CaptureInterceptor は弱参照で持つため、ここで強参照を持つ。 */
    private java.util.function.Consumer<android.net.Uri> imagePicked;
    /** 表示区間をドラッグで変えている間か。 */
    private boolean rangeDragging;
    private TextView playButton;
    private TextView timeLabel;
    private TextView sendButton;
    private ProgressBar sendProgress;
    private TextView closeButton;
    private TextView originalButton;
    /** スクラブ前に再生していたか。 */
    private boolean playingBeforeScrub;

    public EditorDialog(Activity activity, EditSession session, CaptureReplacement source) {
        super(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
        this.activity = activity;
        this.session = session;
        this.source = source;
        this.normalize = session.requiresNormalization();
        int[] size = normalize ? OutputProfile.sizeFor(source.width, source.height) : new int[] {source.width, source.height};
        this.outputWidth = size[0];
        this.outputHeight = size[1];
        this.clipDurationMs = Math.min(OutputProfile.clipDurationMs(RecordDuration.selectedMs()), source.durationMs);
        spec.filter = Prefs.lastFilter(activity);
        spec.durationMs = durationMs();
        setCancelable(false);
        View content = buildContent(activity);
        setContentView(content);
        Window window = getWindow();
        if (window != null) {
            // 全画面のテーマと edge-to-edge（本体は targetSdk 36）では adjustResize が効かないため、
            // キーボードとシステムバーの高さを insets で受け取り、自分で余白にする。
            window.setDecorFitsSystemWindows(false);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_NOTHING);
            window.setStatusBarColor(Ui.BACKGROUND);
            window.setNavigationBarColor(Ui.BACKGROUND);
        }
        fitInsets(content);
        setOnKeyListener((dialog, keyCode, event) -> {
            if (keyCode == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
                confirmCancel();
                return true;
            }
            return false;
        });
        setOnDismissListener(dialog -> release());
        activity.registerActivityLifecycleCallbacks(lifecycle);
    }

    /** 本体の Activity に合わせてプレビューを止め、Activity が破棄されたら編集を打ち切る。 */
    private final Application.ActivityLifecycleCallbacks lifecycle = new Application.ActivityLifecycleCallbacks() {
        @Override
        public void onActivityResumed(Activity a) {
            if (preview != null) {
                preview.resume();
            }
        }

        @Override
        public void onActivityPaused(Activity a) {
            if (preview != null) {
                preview.pause();
            }
        }

        @Override
        public void onActivityDestroyed(Activity a) {
            // 本体の撮影画面ごと破棄されるため、結果を返す先が無い。書き出しを止めて静かに閉じる。
            release();
            session.abandon();
            if (isShowing()) {
                dismiss();
            }
        }

        @Override
        public void onActivityCreated(Activity a, Bundle state) {}

        @Override
        public void onActivityStarted(Activity a) {}

        @Override
        public void onActivityStopped(Activity a) {}

        @Override
        public void onActivitySaveInstanceState(Activity a, Bundle state) {}
    };

    @Override
    public void show() {
        super.show();
        TextFont.preload();
        preview = new PreviewController(getContext(), previewTexture, new PreviewController.Source() {
            @Override
            public MediaItem mediaItem() {
                return previewItem();
            }

            @Override
            public List<Effect> effects() {
                return previewEffects();
            }
        });
        preview.start();
        loadThumbnails();
        Choreographer.getInstance().postFrameCallback(ticker);
    }

    @Override
    public void dismiss() {
        // 編集画面のキーボードが本体の画面に残らないよう、閉じる前に隠す。入力欄からフォーカスが
        // 外れていてもキーボードは出たままのことがあるため、画面全体の token で閉じる。
        Window window = getWindow();
        if (window != null) {
            View decor = window.getDecorView();
            View focus = getCurrentFocus();
            if (focus != null) {
                focus.clearFocus();
            }
            InputMethodManager imm = getContext().getSystemService(InputMethodManager.class);
            imm.hideSoftInputFromWindow(decor.getWindowToken(), 0);
        }
        super.dismiss();
    }

    /**
     * システムバーとキーボードの高さを余白にする。キーボードが出ている間は、入力欄をキーボードの
     * すぐ上に出し、プレビューの場所を残すためにツールバーを隠す。
     */
    private void fitInsets(View root) {
        int gutter = Ui.dp(getContext(), 12);
        int bottomGutter = Ui.dp(getContext(), 4);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            android.graphics.Insets bars = insets.getInsets(
                    WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            android.graphics.Insets ime = insets.getInsets(WindowInsets.Type.ime());
            boolean keyboard = insets.isVisible(WindowInsets.Type.ime()) && ime.bottom > bars.bottom;
            view.setPadding(gutter + bars.left, gutter + bars.top, gutter + bars.right,
                    bottomGutter + Math.max(bars.bottom, ime.bottom));
            toolBar.setVisibility(keyboard ? View.GONE : View.VISIBLE);
            return WindowInsets.CONSUMED;
        });
    }

    /** 速さを変える前の動画の長さ（取り込んだ動画は切り出す長さ）。 */
    @Override
    public long baseDurationMs() {
        return normalize ? clipDurationMs : source.durationMs;
    }

    /** 書き出し後の動画の長さ。タイムラインの長さもこれ。 */
    private long durationMs() {
        return Speed.outputMs(baseDurationMs(), spec.speed);
    }

    /** 再生位置を毎フレーム、タイムラインと時間の表示に映す。 */
    private final Choreographer.FrameCallback ticker = new Choreographer.FrameCallback() {
        @Override
        public void doFrame(long frameTimeNanos) {
            if (preview == null) {
                return;
            }
            long position = preview.positionMs();
            timeline.setPositionMs(position);
            overlay.setTimeMs(position);
            timeLabel.setText(TrimPanel.seconds(position) + " / " + TrimPanel.seconds(durationMs()) + " 秒");
            playButton.setText(preview.isPlaying() ? "❚❚" : "▶");
            playButton.setContentDescription(preview.isPlaying() ? "一時停止" : "再生");
            Choreographer.getInstance().postFrameCallback(this);
        }
    };

    // ---- 画面構成 ----

    private View buildContent(Context context) {
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Ui.BACKGROUND);
        int gutter = Ui.dp(context, 12);
        root.setPadding(gutter, gutter, gutter, Ui.dp(context, 4));

        root.addView(buildPreview(context), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        root.addView(buildTransport(context));

        timeline = new TimelineView(context, spec, new TimelineView.Listener() {
            @Override
            public void onScrubStart() {
                playingBeforeScrub = preview.isPlaying();
                preview.setPlaying(false);
            }

            @Override
            public void onScrub(long positionMs) {
                preview.seekTo(positionMs);
            }

            @Override
            public void onScrubEnd() {
                preview.setPlaying(playingBeforeScrub);
            }

            @Override
            public void onLayerTapped(Layer layer) {
                selectLayer(layer);
            }

            @Override
            public void onLayerRangeChanged(Layer layer, long positionMs) {
                // 動かしている端の時刻で止めて見せる。表示が始まる・終わる瞬間を見ながら合わせられる。
                if (!rangeDragging) {
                    rangeDragging = true;
                    playingBeforeScrub = preview.isPlaying();
                    preview.setPlaying(false);
                }
                preview.seekTo(positionMs);
                overlay.setTimeMs(positionMs);
                overlay.invalidate();
                notifyPanels();
            }

            @Override
            public void onLayerRangeEnd() {
                rangeDragging = false;
                preview.setPlaying(playingBeforeScrub);
            }
        });
        timeline.setDurationMs(durationMs());
        MaxHeightScrollView timelineScroll = new MaxHeightScrollView(context, Ui.dp(context, 132));
        timelineScroll.addView(timeline);
        root.addView(timelineScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // パネルの中身が高さを超えたらスクロールする（項目の多いパネルでもツールバーに重ねない）。
        ScrollView panelScroll = new ScrollView(context);
        panelScroll.setVerticalScrollBarEnabled(false);
        panelArea = new FrameLayout(context);
        panelScroll.addView(panelArea);
        root.addView(panelScroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(context, 176)));

        toolBar = new ToolBar(context, this::showPanel);
        if (normalize) {
            toolBar.add("✂︎", "トリム");
            panels.add(new TrimPanel(context, this, source.durationMs, clipDurationMs, this::onTrimChanged));
        }
        toolBar.add("◐", "フィルター");
        panels.add(new FilterPanel(context, this));
        toolBar.add("☼", "調整");
        panels.add(new AdjustPanel(context, this));
        toolBar.add("✦", "効果");
        panels.add(new EffectPanel(context, this));
        toolBar.add("▣", "フレーム");
        panels.add(new FramePanel(context, this));
        toolBar.add("⇋", "反転・ズーム");
        panels.add(new TransformPanel(context, this));
        toolBar.add("»", "速度");
        panels.add(new SpeedPanel(context, this));
        textTool = toolBar.add("Aa", "文字");
        panels.add(new TextPanel(context, this));
        stickerTool = toolBar.add("☺︎", "スタンプ");
        panels.add(new StickerPanel(context, this));
        motionTool = toolBar.add("↗", "動き");
        panels.add(new MotionPanel(context, this));
        root.addView(toolBar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        toolBar.select(0);
        return root;
    }

    /** 送信先選択画面と同じく、角丸の動画の上に ✕ と ↑ を重ねる。 */
    private View buildPreview(Context context) {
        FrameLayout area = new FrameLayout(context);
        AspectFrame frame = new AspectFrame(context, outputWidth / (float) outputHeight);
        float radius = Ui.dp(context, 28);
        frame.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), radius);
            }
        });
        frame.setClipToOutline(true);
        frame.setBackgroundColor(Ui.SURFACE);

        previewTexture = new TextureView(context);
        frame.addView(previewTexture, matchParent());
        overlay = new LayerOverlayView(context, spec, new LayerOverlayView.Listener() {
            @Override
            public void onLayerTapped(Layer layer) {
                selectLayer(layer);
            }

            @Override
            public void onLayerTransformed(Layer layer) {
                // 2 本指で変えた大きさ・角度をパネルのスライダーに映す。
                notifyPanels();
            }
        });
        frame.addView(overlay, matchParent());

        int buttonSize = Ui.dp(context, 44);
        int inset = Ui.dp(context, 14);
        closeButton = Ui.text(context, "✕", 18, Ui.TEXT_PRIMARY, true);
        closeButton.setGravity(Gravity.CENTER);
        closeButton.setBackground(Ui.circle(Ui.SCRIM));
        closeButton.setContentDescription("キャンセル");
        closeButton.setOnClickListener(v -> confirmCancel());
        FrameLayout.LayoutParams closeParams = new FrameLayout.LayoutParams(buttonSize, buttonSize, Gravity.TOP | Gravity.START);
        closeParams.setMargins(inset, inset, inset, inset);
        frame.addView(closeButton, closeParams);

        FrameLayout send = new FrameLayout(context);
        sendButton = Ui.text(context, "↑", 22, Color.WHITE, true);
        sendButton.setGravity(Gravity.CENTER);
        sendButton.setBackground(Ui.circle(Ui.ACCENT));
        sendButton.setContentDescription(normalize ? "投稿" : "編集して投稿");
        sendButton.setOnClickListener(v -> exportAndDeliver());
        send.addView(sendButton, matchParent());
        sendProgress = new ProgressBar(context);
        sendProgress.setIndeterminateTintList(Ui.accentTint());
        sendProgress.setVisibility(View.GONE);
        send.addView(sendProgress, matchParent());
        int sendSize = Ui.dp(context, 52);
        FrameLayout.LayoutParams sendParams = new FrameLayout.LayoutParams(sendSize, sendSize, Gravity.TOP | Gravity.END);
        sendParams.setMargins(inset, inset, inset, inset);
        frame.addView(send, sendParams);

        // 送信先選択画面と同じく、プレビューは上に寄せる。
        area.addView(frame, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL));
        return area;
    }

    /** 再生・一時停止、再生位置、（撮影した動画なら）そのまま投稿。 */
    private View buildTransport(Context context) {
        LinearLayout row = Ui.row(context);
        int vertical = Ui.dp(context, 8);
        row.setPadding(Ui.dp(context, 4), vertical, 0, Ui.dp(context, 2));
        playButton = Ui.text(context, "❚❚", 14, Ui.TEXT_PRIMARY, true);
        playButton.setGravity(Gravity.CENTER);
        playButton.setBackground(Ui.circle(Ui.SURFACE));
        playButton.setOnClickListener(v -> preview.setPlaying(!preview.isPlaying()));
        int size = Ui.dp(context, 36);
        row.addView(playButton, new LinearLayout.LayoutParams(size, size));
        timeLabel = Ui.text(context, "", 13, Ui.TEXT_SECONDARY, false);
        timeLabel.setFontFeatureSettings("tnum");
        LinearLayout.LayoutParams timeParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        timeParams.leftMargin = Ui.dp(context, 10);
        row.addView(timeLabel, timeParams);
        // 取り込んだ動画は公式撮影分の仕様へ揃える必要があるため、「そのまま投稿」は出さない。
        originalButton = Ui.pillButton(context, "そのまま投稿");
        originalButton.setTextSize(13);
        originalButton.setPadding(Ui.dp(context, 14), Ui.dp(context, 8), Ui.dp(context, 14), Ui.dp(context, 8));
        originalButton.setOnClickListener(v -> deliverOriginal());
        originalButton.setVisibility(normalize ? View.GONE : View.VISIBLE);
        row.addView(originalButton);
        return row;
    }

    private void showPanel(int index) {
        panelArea.removeAllViews();
        ToolPanel panel = panels.get(index);
        panelArea.addView(panel.view(), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        panel.onLayerSelected(selected);
    }

    // ---- EditorHost ----

    @Override
    public EditSpec spec() {
        return spec;
    }

    @Override
    public void videoEffectsChanged() {
        if (preview != null) {
            preview.effectsChanged();
        }
    }

    @Override
    public void layersChanged() {
        overlay.invalidate();
        timeline.layersChanged();
    }

    @Override
    public Layer selectedLayer() {
        return selected;
    }

    @Override
    public void selectLayer(Layer layer) {
        selected = layer != null && spec.layers.contains(layer) ? layer : null;
        overlay.setSelected(selected);
        timeline.setSelected(selected);
        // 「動き」を開いているときは、要素を選び替えても「動き」のまま。
        if (toolBar.selected() != motionTool) {
            if (selected instanceof TextSpec) {
                toolBar.select(textTool);
            } else if (selected instanceof StickerSpec) {
                toolBar.select(stickerTool);
            }
        }
        notifyPanels();
    }

    @Override
    public void pickImage(java.util.function.Consumer<android.graphics.Bitmap> callback) {
        // CaptureInterceptor は受け取り口を弱参照で持つため、選び終わるまでここで持っておく。
        imagePicked = uri -> new Thread(() -> {
            android.graphics.Bitmap image = StickerImages.decode(getContext(), uri);
            handler.post(() -> {
                if (!isShowing()) {
                    return;
                }
                if (image == null) {
                    android.widget.Toast.makeText(getContext(), "この画像は読み込めませんでした",
                            android.widget.Toast.LENGTH_SHORT).show();
                    return;
                }
                callback.accept(image);
            });
        }, "cutlog-sticker").start();
        CaptureInterceptor.pickImage(activity, imagePicked);
    }

    @Override
    public void setSpeed(float speed) {
        float previous = spec.speed;
        if (speed == previous) {
            return;
        }
        // 文字・スタンプが同じ場面に出続けるよう、表示区間も同じ比率で伸び縮みさせる。
        for (Layer layer : spec.layers) {
            layer.startMs = Speed.rescale(layer.startMs, previous, speed);
            layer.endMs = Speed.rescale(layer.endMs, previous, speed);
        }
        spec.speed = speed;
        spec.durationMs = durationMs();
        timeline.setDurationMs(spec.durationMs);
        preview.setSpeed(speed);
        layersChanged();
        notifyPanels();
    }

    @Override
    public void previewMotion(Layer layer, boolean entering) {
        long start = layer.startMs;
        long end = layer.endMs(spec.durationMs);
        long lead = 300;
        long position = entering
                ? Math.max(0, start - lead)
                : Math.max(start, end - LayerAnimator.ANIMATION_MS - lead);
        preview.seekTo(position);
        preview.setPlaying(true);
    }

    private void notifyPanels() {
        for (ToolPanel panel : panels) {
            panel.onLayerSelected(selected);
        }
    }

    // ---- 操作 ----

    private void onTrimChanged(long startMs) {
        clipStartMs = startMs;
        if (spec.reverse) {
            // 逆再生の中間ファイルは前の区間で作ったため、使えなくなる。
            setReverse(false);
            android.widget.Toast.makeText(getContext(), "区間を変えたので逆再生を解除しました",
                    android.widget.Toast.LENGTH_SHORT).show();
            return;
        }
        preview.mediaChanged();
        loadThumbnails();
    }

    private void loadThumbnails() {
        if (thumbnails != null) {
            thumbnails.release();
        }
        thumbnails = new ThumbnailLoader(getContext(), input());
        long start = clipsInput() ? clipStartMs : 0;
        // サムネイルは入力の動画から読むため、速さを変える前の長さで区切る。
        thumbnails.load(start, baseDurationMs(), frames -> timeline.setThumbnails(frames));
    }

    @Override
    public void setReverse(boolean reverse) {
        if (reverse == spec.reverse || reverser != null) {
            return;
        }
        if (!reverse) {
            spec.reverse = false;
            deleteReversed();
            preview.mediaChanged();
            loadThumbnails();
            notifyPanels();
            return;
        }
        File dir = new File(getContext().getCacheDir(), "cutlog-reverse");
        deleteRecursively(dir);
        dir.mkdirs();
        File output = new File(dir, "reversed-" + System.currentTimeMillis() + ".mp4");
        ReverseProgress progress = new ReverseProgress();
        reverser = Reverser.start(getContext(), session.source(), normalize ? clipStartMs : 0, baseDurationMs(),
                source.width, source.height, output, new Reverser.Callback() {
                    @Override
                    public void onProgress(float value) {
                        progress.update(value);
                    }

                    @Override
                    public void onSuccess(File file) {
                        reverser = null;
                        progress.dismiss();
                        if (!isShowing()) {
                            file.delete();
                            return;
                        }
                        reversedFile = file;
                        spec.reverse = true;
                        preview.mediaChanged();
                        loadThumbnails();
                        notifyPanels();
                    }

                    @Override
                    public void onError(Exception error) {
                        reverser = null;
                        progress.dismiss();
                        if (isShowing()) {
                            showAlert(new AlertDialog.Builder(getContext(), android.R.style.Theme_DeviceDefault_Dialog_Alert)
                                    .setMessage("逆再生にできませんでした。")
                                    .setPositiveButton("閉じる", null));
                        }
                        notifyPanels();
                    }
                });
        progress.show();
    }

    /** 逆再生の中間ファイルを作っている間の進み具合。「やめる」で中断する。 */
    private final class ReverseProgress {
        private final android.widget.ProgressBar bar;
        private final AlertDialog dialog;

        ReverseProgress() {
            Context context = getContext();
            LinearLayout content = Ui.column(context);
            int padding = Ui.dp(context, 24);
            content.setPadding(padding, padding, padding, Ui.dp(context, 8));
            content.addView(Ui.text(context, "逆再生を準備しています", 15, Ui.TEXT_PRIMARY, false));
            bar = new android.widget.ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
            bar.setMax(100);
            bar.setProgressTintList(Ui.accentTint());
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = Ui.dp(context, 16);
            content.addView(bar, params);
            dialog = new AlertDialog.Builder(context, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                    .setView(content)
                    .setCancelable(false)
                    .setNegativeButton("やめる", (d, which) -> {
                        if (reverser != null) {
                            reverser.cancel();
                            reverser = null;
                        }
                        notifyPanels();
                    })
                    .create();
        }

        void show() {
            dialog.show();
            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(Ui.rounded(getContext(), Ui.SURFACE, 22));
            }
            dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(Ui.TEXT_PRIMARY);
        }

        void update(float value) {
            bar.setProgress(Math.round(value * 100f));
        }

        void dismiss() {
            if (dialog.isShowing()) {
                dialog.dismiss();
            }
        }
    }

    private void deleteReversed() {
        if (reversedFile != null) {
            reversedFile.delete();
            reversedFile = null;
        }
    }

    private static void deleteRecursively(File dir) {
        File[] files = dir.listFiles();
        if (files != null) {
            for (File file : files) {
                file.delete();
            }
        }
    }

    private void confirmCancel() {
        if (renderer != null) {
            return;
        }
        showAlert(new AlertDialog.Builder(getContext(), android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setMessage(session.cancelMessage())
                .setPositiveButton(normalize ? "やめる" : "破棄する", (dialog, which) -> {
                    dismiss();
                    session.cancel();
                })
                .setNegativeButton("戻る", null));
    }

    private void deliverOriginal() {
        if (renderer != null || normalize) {
            return;
        }
        dismiss();
        session.deliverOriginal();
    }

    private void exportAndDeliver() {
        if (renderer != null) {
            return;
        }
        if (spec.isEmpty() && !normalize) {
            deliverOriginal();
            return;
        }
        Prefs.setLastFilter(getContext(), spec.filter);
        setBusy(true);
        Renderer.Request request =
                new Renderer.Request(input(), spec, outputWidth, outputHeight, session.exportFile());
        if (normalize) {
            long start = clipsInput() ? clipStartMs : 0;
            request.normalized(start, start + clipDurationMs);
        }
        renderer = Renderer.start(getContext(), request,
                new Renderer.Callback() {
                    @Override
                    public void onSuccess(File output) {
                        renderer = null;
                        CaptureReplacement replacement;
                        try {
                            // 録画ファイルの置き換えまで済ませてから閉じる。失敗したら編集画面で選ばせる。
                            replacement = session.install(output);
                        } catch (IOException e) {
                            output.delete();
                            setBusy(false);
                            showExportError(e);
                            return;
                        }
                        dismiss();
                        session.deliver(replacement);
                    }

                    @Override
                    public void onError(Exception error) {
                        renderer = null;
                        setBusy(false);
                        showExportError(error);
                    }
                });
    }

    private void showExportError(Exception error) {
        Log.w(CaptureInterceptor.TAG, "Cannot deliver the edited video.", error);
        if (!isShowing()) {
            return;
        }
        showAlert(new AlertDialog.Builder(getContext(), android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setMessage("編集した動画を書き出せませんでした。")
                .setPositiveButton(normalize ? "閉じる" : "元の動画で投稿", (dialog, which) -> {
                    if (!normalize) {
                        deliverOriginal();
                    }
                })
                .setNegativeButton("編集に戻る", null));
    }

    /** 確認ダイアログも setlog の配色に合わせる。端末テーマのボタン色は暗い背景で読みにくい。 */
    private void showAlert(AlertDialog.Builder builder) {
        AlertDialog alert = builder.show();
        Window window = alert.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(Ui.rounded(getContext(), Ui.SURFACE, 22));
        }
        alert.getButton(AlertDialog.BUTTON_POSITIVE).setTextColor(Ui.ACCENT);
        alert.getButton(AlertDialog.BUTTON_NEGATIVE).setTextColor(Ui.TEXT_PRIMARY);
    }

    private void setBusy(boolean busy) {
        sendButton.setVisibility(busy ? View.INVISIBLE : View.VISIBLE);
        sendProgress.setVisibility(busy ? View.VISIBLE : View.GONE);
        for (View view : new View[] {closeButton, originalButton}) {
            view.setEnabled(!busy);
            view.setAlpha(busy ? 0.35f : 1f);
        }
    }

    // ---- プレビュー ----

    /**
     * プレビューの Effect。取り込んだ動画は書き出しと同じく出力解像度へ切り抜いてから効果をかける。
     * 文字・スタンプは View で重ねるため、ここには入れない。
     */
    private List<Effect> previewEffects() {
        List<Effect> effects = new ArrayList<>();
        if (normalize) {
            effects.addAll(EffectsFactory.normalizeEffects(outputWidth, outputHeight));
        }
        effects.addAll(EffectsFactory.videoEffects(spec));
        return effects;
    }

    /**
     * 今の入力。ふだんは撮影・取り込みの動画で、逆再生の間は逆再生にした中間ファイル。中間ファイルは
     * 取り込んだ動画でも選んだ区間だけなので、そのときは切り出さない。
     */
    private Uri input() {
        return reversedFile != null ? Uri.fromFile(reversedFile) : session.source();
    }

    /** 入力から切り出すか（取り込んだ動画で、逆再生でないとき）。 */
    private boolean clipsInput() {
        return normalize && reversedFile == null;
    }

    /** プレビューの入力。取り込んだ動画は選んだ区間だけをループ再生する。 */
    private MediaItem previewItem() {
        MediaItem.Builder item = new MediaItem.Builder().setUri(input());
        if (clipsInput()) {
            item.setClippingConfiguration(new MediaItem.ClippingConfiguration.Builder()
                    .setStartPositionMs(clipStartMs)
                    .setEndPositionMs(clipStartMs + clipDurationMs)
                    .build());
        }
        return item.build();
    }

    private void release() {
        activity.unregisterActivityLifecycleCallbacks(lifecycle);
        Choreographer.getInstance().removeFrameCallback(ticker);
        if (renderer != null) {
            renderer.cancel();
            renderer = null;
        }
        if (preview != null) {
            preview.release();
            preview = null;
        }
        if (thumbnails != null) {
            thumbnails.release();
            thumbnails = null;
        }
        if (reverser != null) {
            reverser.cancel();
            reverser = null;
        }
        deleteReversed();
    }

    // ---- 部品 ----

    private static FrameLayout.LayoutParams matchParent() {
        return new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    /** 子 View を動画と同じ縦横比で、親の中に収まる最大の大きさにする。 */
    private static final class AspectFrame extends FrameLayout {
        private final float aspect;

        AspectFrame(Context context, float aspect) {
            super(context);
            this.aspect = aspect;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int maxWidth = MeasureSpec.getSize(widthMeasureSpec);
            int maxHeight = MeasureSpec.getSize(heightMeasureSpec);
            int width = maxWidth;
            int height = Math.round(width / aspect);
            if (height > maxHeight) {
                height = maxHeight;
                width = Math.round(height * aspect);
            }
            super.onMeasure(
                    MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
                    MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY));
        }
    }

    /** 中身に合わせて伸びるが、maxHeight を超えたらスクロールする。要素が増えてもプレビューを潰さない。 */
    private static final class MaxHeightScrollView extends ScrollView {
        private final int maxHeight;

        MaxHeightScrollView(Context context, int maxHeight) {
            super(context);
            this.maxHeight = maxHeight;
            setVerticalScrollBarEnabled(false);
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
        }
    }
}
