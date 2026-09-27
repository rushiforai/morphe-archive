package app.lchanc3.extension.localdream;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Insets;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedDispatcher;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The batch screen: the upscaler and scale to use, how far the batch has got,
 * and the pictures one at a time, each result next to its original.
 */
public final class BatchUpscaleActivity extends Activity implements BatchJob.Listener {

    private static final String EXTRA_URIS = "app.lchanc3.extension.localdream.URIS";
    private static final String STATE_SELECTED = "selected";

    /**
     * Longest side of the copy a picture is put on screen from. The same cap as
     * the upscale screen's: every GPU takes a 4096 texture, and it stays under
     * the size a hardware canvas refuses to draw.
     */
    private static final int MAX_DISPLAY = 4096;

    static void start(Context context, ArrayList<Uri> uris) {
        BatchJob.create(context, uris);
        Intent intent = new Intent(context, BatchUpscaleActivity.class);
        intent.putParcelableArrayListExtra(EXTRA_URIS, uris);
        ClipData clip = ClipData.newRawUri(null, uris.get(0));
        for (int i = 1; i < uris.size(); i++) {
            clip.addItem(new ClipData.Item(uris.get(i)));
        }
        intent.setClipData(clip);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(intent);
    }

    private Ui ui;
    private Strings strings;
    private BatchJob job;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final ExecutorService loader = Executors.newSingleThreadExecutor();
    private final ExecutorService thumbnails = Executors.newSingleThreadExecutor();
    private final ExecutorService saver = Executors.newSingleThreadExecutor();

    private TextView subtitle;
    private TextView saveAllButton;
    private final List<TextView> upscalerOptions = new ArrayList<>();
    private final List<String> upscalerIds = new ArrayList<>();
    private final List<TextView> scaleOptions = new ArrayList<>();
    private TextView messageText;
    private TextView progressText;
    private ProgressBar progressBar;
    private TextView startButton;

    private ZoomImageView viewer;
    private TextView positionChip;
    private TextView sizeChip;
    private LinearLayout statusPanel;
    private ProgressBar statusSpinner;
    private TextView statusText;

    private ImageView previousButton;
    private ImageView nextButton;
    private TextView compareButton;
    private TextView saveButton;

    private HorizontalScrollView thumbnailScroll;
    private final List<Thumbnail> thumbnailViews = new ArrayList<>();

    private int selected;
    private int shownIndex = -1;
    private boolean shownResult;
    private Bitmap shownOriginal;
    private int loadGeneration;
    private boolean saving;

    private final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            renderProgress();
            renderOverlay();
            if (job != null && job.running) handler.postDelayed(this, 1000);
        }
    };

    private Object backCallback;

    // ---------------------------------------------------------------- lifecycle

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        job = BatchJob.current();
        if (job == null) {
            // The process was restarted under this screen and the batch with it.
            ArrayList<Uri> uris = getIntent().getParcelableArrayListExtra(EXTRA_URIS);
            if (uris == null || uris.isEmpty()) {
                finish();
                return;
            }
            job = BatchJob.create(this, uris);
        }

        ui = new Ui(this);
        strings = Strings.get(this);
        setupWindow();
        setContentView(buildLayout());
        setupWindowAppearance();

        job.addListener(this);
        loadThumbnails();
        select(savedInstanceState != null ? savedInstanceState.getInt(STATE_SELECTED, 0) : 0);
        onBatchChanged();

        if (Build.VERSION.SDK_INT >= 33) {
            android.window.OnBackInvokedCallback callback = this::onBack;
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            backCallback = callback;
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt(STATE_SELECTED, selected);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        handler.removeCallbacksAndMessages(null);
        if (job != null) job.removeListener(this);
        if (Build.VERSION.SDK_INT >= 33 && backCallback != null) {
            getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(
                (android.window.OnBackInvokedCallback) backCallback);
        }
        loader.shutdownNow();
        thumbnails.shutdownNow();
        saver.shutdown();
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        onBack();
    }

    private void onBack() {
        boolean running = job.running;
        int unsaved = job.unsavedCount();
        if (!running && unsaved == 0) {
            leave();
            return;
        }
        String message = running ? strings.leaveRunning : "";
        if (unsaved > 0) {
            message += (message.isEmpty() ? "" : "\n") + String.format(Locale.getDefault(), strings.leaveUnsaved, unsaved);
        }
        new AlertDialog.Builder(this, ui.night
            ? android.R.style.Theme_DeviceDefault_Dialog_Alert
            : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
            .setTitle(strings.leaveTitle)
            .setMessage(message)
            .setPositiveButton(strings.leave, (dialog, which) -> leave())
            .setNegativeButton(strings.stay, null)
            .show();
    }

    private void leave() {
        BatchJob.discardCurrent();
        finish();
    }

    // ---------------------------------------------------------------- window

    @SuppressWarnings("deprecation")
    private void setupWindow() {
        Window window = getWindow();
        window.setStatusBarColor(Color.TRANSPARENT);
        window.setNavigationBarColor(Color.TRANSPARENT);
        if (Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false);
        } else {
            int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
            if (!ui.night) {
                flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
            }
            window.getDecorView().setSystemUiVisibility(flags);
        }
    }

    private void setupWindowAppearance() {
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsetsController controller = getWindow().getInsetsController();
            if (controller != null) {
                int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                    | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                controller.setSystemBarsAppearance(ui.night ? 0 : light, light);
            }
        }
    }

    // ---------------------------------------------------------------- layout

    private View buildLayout() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(ui.background);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int left;
            int top;
            int right;
            int bottom;
            if (Build.VERSION.SDK_INT >= 30) {
                Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                left = bars.left;
                top = bars.top;
                right = bars.right;
                bottom = bars.bottom;
            } else {
                left = insets.getSystemWindowInsetLeft();
                top = insets.getSystemWindowInsetTop();
                right = insets.getSystemWindowInsetRight();
                bottom = insets.getSystemWindowInsetBottom();
            }
            view.setPadding(left, top, right, bottom);
            return insets;
        });

        root.addView(buildTopBar(), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(64)));
        LinearLayout.LayoutParams controlsParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        controlsParams.setMargins(ui.dp(16), 0, ui.dp(16), 0);
        root.addView(buildControls(), controlsParams);

        LinearLayout.LayoutParams viewerParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        viewerParams.setMargins(ui.dp(16), ui.dp(12), ui.dp(16), 0);
        root.addView(buildViewer(), viewerParams);

        LinearLayout.LayoutParams actionsParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(64));
        actionsParams.setMargins(ui.dp(8), 0, ui.dp(8), 0);
        root.addView(buildActions(), actionsParams);

        root.addView(buildThumbnails(), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(84)));
        return root;
    }

    private View buildTopBar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(ui.dp(4), 0, ui.dp(8), 0);

        ImageView back = ui.iconButton(Ui.ICON_BACK, 0, ui.onSurface);
        back.setContentDescription(strings.leave);
        back.setOnClickListener(v -> onBack());
        bar.addView(back, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));

        LinearLayout titles = new LinearLayout(this);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(22, ui.onSurface, false);
        title.setText(strings.title);
        title.setSingleLine();
        titles.addView(title);
        subtitle = ui.text(12, ui.onSurfaceVariant, false);
        titles.addView(subtitle);
        LinearLayout.LayoutParams titlesParams = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titlesParams.setMarginStart(ui.dp(8));
        bar.addView(titles, titlesParams);

        saveAllButton = ui.button(strings.saveAll, 0, ui.primary);
        saveAllButton.setOnClickListener(v -> saveAll());
        bar.addView(saveAllButton, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(40)));
        return bar;
    }

    private View buildControls() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(ui.rounded(ui.surfaceContainer, 16));
        card.setPadding(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));

        List<String> downloaded = BatchJob.downloadedUpscalers(this);
        List<String> upscalerLabels = new ArrayList<>();
        for (String id : downloaded) {
            upscalerIds.add(id);
            upscalerLabels.add(BatchJob.upscalerName(this, id));
        }
        if (!upscalerLabels.isEmpty()) {
            card.addView(optionRow(strings.upscaler, upscalerLabels, upscalerOptions, index -> {
                job.upscalerId = upscalerIds.get(index);
                renderControls();
            }));
        }

        List<String> scaleLabels = new ArrayList<>();
        for (int scale : BatchJob.SCALES) scaleLabels.add(scale + "×");
        View scaleRow = optionRow(strings.scale, scaleLabels, scaleOptions, index -> {
            job.scale = BatchJob.SCALES[index];
            renderControls();
        });
        LinearLayout.LayoutParams scaleParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        scaleParams.topMargin = ui.dp(8);
        card.addView(scaleRow, scaleParams);

        messageText = ui.text(13, ui.onSurfaceVariant, false);
        messageText.setVisibility(View.GONE);
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        messageParams.topMargin = ui.dp(10);
        card.addView(messageText, messageParams);

        LinearLayout progressRow = new LinearLayout(this);
        progressRow.setOrientation(LinearLayout.HORIZONTAL);
        progressRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout progressColumn = new LinearLayout(this);
        progressColumn.setOrientation(LinearLayout.VERTICAL);
        progressText = ui.text(13, ui.onSurface, false);
        progressText.setSingleLine();
        progressColumn.addView(progressText);
        progressBar = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        progressBar.setProgressTintList(android.content.res.ColorStateList.valueOf(ui.primary));
        progressBar.setProgressBackgroundTintList(android.content.res.ColorStateList.valueOf(ui.outlineVariant));
        progressBar.setMax(job.items.size());
        LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ui.dp(8));
        barParams.topMargin = ui.dp(6);
        progressColumn.addView(progressBar, barParams);
        progressRow.addView(progressColumn, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        startButton = ui.button(strings.start, ui.primary, ui.onPrimary);
        startButton.setOnClickListener(v -> {
            if (job.running) {
                job.stop();
            } else {
                job.start();
                handler.removeCallbacks(ticker);
                handler.post(ticker);
            }
        });
        LinearLayout.LayoutParams startParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(40));
        startParams.setMarginStart(ui.dp(16));
        progressRow.addView(startButton, startParams);

        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowParams.topMargin = ui.dp(10);
        card.addView(progressRow, rowParams);
        return card;
    }

    private interface OnOption {
        void onOption(int index);
    }

    /** A label and a row of connected toggle buttons, as the app's upscaler dialog has for the scale. */
    private View optionRow(String label, List<String> options, List<TextView> views, OnOption onOption) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        TextView name = ui.text(14, ui.onSurfaceVariant, false);
        name.setText(label);
        row.addView(name, new LinearLayout.LayoutParams(ui.dp(80), ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout group = new LinearLayout(this);
        group.setOrientation(LinearLayout.HORIZONTAL);
        for (int i = 0; i < options.size(); i++) {
            TextView option = ui.text(14, ui.onSurface, true);
            option.setText(options.get(i));
            option.setGravity(Gravity.CENTER);
            option.setSingleLine();
            option.setClickable(true);
            int index = i;
            option.setOnClickListener(v -> onOption.onOption(index));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, ui.dp(36), 1f);
            if (i > 0) params.setMarginStart(ui.dp(2));
            group.addView(option, params);
            views.add(option);
        }
        row.addView(group, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return row;
    }

    private void styleOption(TextView option, int index, int count, boolean checked) {
        float outer = 18;
        float inner = 4;
        float left = index == 0 ? outer : inner;
        float right = index == count - 1 ? outer : inner;
        android.graphics.drawable.GradientDrawable shape = new android.graphics.drawable.GradientDrawable();
        float l = ui.dp(left);
        float r = ui.dp(right);
        shape.setCornerRadii(new float[]{l, l, r, r, r, r, l, l});
        shape.setColor(checked ? ui.secondaryContainer : ui.surfaceContainerHigh);
        int content = checked ? ui.onSecondaryContainer : ui.onSurfaceVariant;
        option.setBackground(ui.ripple(shape, content, 18));
        option.setTextColor(content);
    }

    private View buildViewer() {
        FrameLayout frame = new FrameLayout(this);
        frame.setBackground(ui.rounded(ui.surfaceContainer, 16));
        frame.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
        frame.setClipToOutline(true);

        viewer = new ZoomImageView(this);
        viewer.setOnSwipeListener(direction -> select(selected + direction));
        frame.addView(viewer, new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        positionChip = chip(ui.secondaryContainer, ui.onSecondaryContainer);
        FrameLayout.LayoutParams positionParams = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START);
        positionParams.setMargins(ui.dp(12), ui.dp(12), ui.dp(12), 0);
        frame.addView(positionChip, positionParams);

        sizeChip = chip(ui.secondaryContainer, ui.onSecondaryContainer);
        FrameLayout.LayoutParams sizeParams = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.START);
        sizeParams.setMargins(ui.dp(12), 0, ui.dp(12), ui.dp(12));
        frame.addView(sizeChip, sizeParams);

        statusPanel = new LinearLayout(this);
        statusPanel.setOrientation(LinearLayout.VERTICAL);
        statusPanel.setGravity(Gravity.CENTER_HORIZONTAL);
        statusPanel.setBackground(ui.rounded(Ui.withAlpha(ui.surfaceContainerHigh, 0.94f), 16));
        statusPanel.setPadding(ui.dp(20), ui.dp(16), ui.dp(20), ui.dp(16));
        statusSpinner = new ProgressBar(this);
        statusSpinner.setIndeterminateTintList(android.content.res.ColorStateList.valueOf(ui.primary));
        statusPanel.addView(statusSpinner, new LinearLayout.LayoutParams(ui.dp(40), ui.dp(40)));
        statusText = ui.text(14, ui.onSurface, false);
        statusText.setGravity(Gravity.CENTER);
        statusText.setMaxWidth(ui.dp(260));
        LinearLayout.LayoutParams statusTextParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        statusTextParams.topMargin = ui.dp(8);
        statusPanel.addView(statusText, statusTextParams);
        frame.addView(statusPanel, new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        return frame;
    }

    private TextView chip(int container, int content) {
        TextView chip = ui.text(12, content, true);
        chip.setBackground(ui.rounded(container, 8));
        chip.setPadding(ui.dp(8), ui.dp(4), ui.dp(8), ui.dp(4));
        chip.setSingleLine();
        return chip;
    }

    private View buildActions() {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        previousButton = ui.iconButton(Ui.ICON_PREVIOUS, 0, ui.onSurface);
        previousButton.setOnClickListener(v -> select(selected - 1));
        row.addView(previousButton, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));

        LinearLayout middle = new LinearLayout(this);
        middle.setOrientation(LinearLayout.HORIZONTAL);
        middle.setGravity(Gravity.CENTER);

        compareButton = ui.button(strings.original, ui.secondaryContainer, ui.onSecondaryContainer);
        compareButton.setPadding(ui.dp(16), 0, ui.dp(20), 0);
        compareButton.setCompoundDrawablesRelativeWithIntrinsicBounds(
            new Ui.Icon(Ui.ICON_COMPARE, ui.onSecondaryContainer, ui.dp(1.5f)), null, null, null);
        compareButton.setCompoundDrawablePadding(ui.dp(8));
        compareButton.setOnTouchListener((v, event) -> {
            if (!v.isEnabled()) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    v.setPressed(true);
                    if (shownOriginal != null) viewer.setAlternate(shownOriginal);
                    return true;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    v.setPressed(false);
                    viewer.setAlternate(null);
                    return true;
                default:
                    return true;
            }
        });
        middle.addView(compareButton, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(40)));

        saveButton = ui.button(strings.save, ui.primary, ui.onPrimary);
        saveButton.setPadding(ui.dp(16), 0, ui.dp(20), 0);
        saveButton.setCompoundDrawablePadding(ui.dp(8));
        saveButton.setOnClickListener(v -> saveSelected());
        LinearLayout.LayoutParams saveParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(40));
        saveParams.setMarginStart(ui.dp(8));
        middle.addView(saveButton, saveParams);

        row.addView(middle, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        nextButton = ui.iconButton(Ui.ICON_NEXT, 0, ui.onSurface);
        nextButton.setOnClickListener(v -> select(selected + 1));
        row.addView(nextButton, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(48)));
        return row;
    }

    private View buildThumbnails() {
        thumbnailScroll = new HorizontalScrollView(this);
        thumbnailScroll.setHorizontalScrollBarEnabled(false);
        thumbnailScroll.setClipToPadding(false);
        thumbnailScroll.setPadding(ui.dp(12), 0, ui.dp(12), ui.dp(12));

        LinearLayout strip = new LinearLayout(this);
        strip.setOrientation(LinearLayout.HORIZONTAL);
        strip.setGravity(Gravity.CENTER_VERTICAL);
        for (BatchJob.Item item : job.items) {
            Thumbnail thumbnail = new Thumbnail(this, item.index);
            thumbnail.setOnClickListener(v -> select(thumbnail.index));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ui.dp(64), ui.dp(64));
            params.setMargins(ui.dp(4), 0, ui.dp(4), 0);
            strip.addView(thumbnail, params);
            thumbnailViews.add(thumbnail);
        }
        thumbnailScroll.addView(strip);
        return thumbnailScroll;
    }

    /** A picture in the strip along the bottom, and how far it has got. */
    private final class Thumbnail extends FrameLayout {
        final int index;
        final ImageView image;
        final ProgressBar spinner;
        final ImageView badge;

        Thumbnail(Context context, int index) {
            super(context);
            this.index = index;
            setBackground(ui.rounded(ui.surfaceContainerHigh, 12));
            setOutlineProvider(ViewOutlineProvider.BACKGROUND);
            setClipToOutline(true);

            image = new ImageView(context);
            image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            addView(image, new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            spinner = new ProgressBar(context);
            spinner.setIndeterminateTintList(android.content.res.ColorStateList.valueOf(ui.primary));
            spinner.setBackground(ui.rounded(Ui.withAlpha(ui.surfaceContainerHigh, 0.85f), 16));
            spinner.setPadding(ui.dp(4), ui.dp(4), ui.dp(4), ui.dp(4));
            addView(spinner, new LayoutParams(ui.dp(32), ui.dp(32), Gravity.CENTER));

            badge = new ImageView(context);
            badge.setPadding(ui.dp(2), ui.dp(2), ui.dp(2), ui.dp(2));
            LayoutParams badgeParams = new LayoutParams(ui.dp(20), ui.dp(20), Gravity.BOTTOM | Gravity.END);
            badgeParams.setMargins(0, 0, ui.dp(4), ui.dp(4));
            addView(badge, badgeParams);
        }

        void render(BatchJob.Item item, boolean isSelected) {
            int state = item.state;
            image.setAlpha(state == BatchJob.DONE ? 1f : 0.55f);
            spinner.setVisibility(state == BatchJob.RUNNING ? VISIBLE : GONE);
            if (state == BatchJob.FAILED) {
                badge.setImageDrawable(new Ui.Icon(Ui.ICON_ERROR, ui.onErrorContainer, ui.dp(2)));
                badge.setBackground(ui.rounded(ui.errorContainer, 10));
                badge.setVisibility(VISIBLE);
            } else if (state == BatchJob.DONE && item.saved) {
                badge.setImageDrawable(new Ui.Icon(Ui.ICON_CHECK, ui.onPrimary, ui.dp(2)));
                badge.setBackground(ui.rounded(ui.primary, 10));
                badge.setVisibility(VISIBLE);
            } else {
                badge.setVisibility(GONE);
            }
            setForeground(isSelected ? ui.outlined(ui.primary, 3, 12) : null);
        }
    }

    // ---------------------------------------------------------------- state

    @Override
    public void onBatchChanged() {
        if (isDestroyed()) return;
        renderControls();
        renderProgress();
        for (Thumbnail thumbnail : thumbnailViews) {
            thumbnail.render(job.items.get(thumbnail.index), thumbnail.index == selected);
        }
        showSelected();
        renderActions();

        if (job.running) {
            getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            handler.removeCallbacks(ticker);
            handler.postDelayed(ticker, 1000);
        } else {
            getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            handler.removeCallbacks(ticker);
        }
    }

    private void renderControls() {
        boolean running = job.running;
        for (int i = 0; i < upscalerOptions.size(); i++) {
            styleOption(upscalerOptions.get(i), i, upscalerOptions.size(), upscalerIds.get(i).equals(job.upscalerId));
            Ui.setEnabled(upscalerOptions.get(i), !running);
        }
        for (int i = 0; i < scaleOptions.size(); i++) {
            styleOption(scaleOptions.get(i), i, scaleOptions.size(), BatchJob.SCALES[i] == job.scale);
            Ui.setEnabled(scaleOptions.get(i), !running);
        }

        String message = null;
        boolean isError = false;
        if (upscalerIds.isEmpty()) {
            message = strings.noUpscaler;
            isError = true;
        } else if (job.problem != null) {
            message = job.problem;
            isError = true;
        } else if (job.waitingForBackend) {
            message = strings.waitingForBackend;
        }
        messageText.setVisibility(message == null ? View.GONE : View.VISIBLE);
        messageText.setText(message);
        messageText.setTextColor(isError ? ui.error : ui.onSurfaceVariant);

        int remaining = job.items.size() - job.count(BatchJob.DONE);
        boolean started = remaining < job.items.size()
            || job.count(BatchJob.FAILED) > 0 || job.count(BatchJob.CANCELLED) > 0;
        if (running) {
            startButton.setText(strings.stop);
            startButton.setTextColor(ui.onSecondaryContainer);
            startButton.setBackground(ui.ripple(ui.rounded(ui.secondaryContainer, 20), ui.onSecondaryContainer, 20));
        } else {
            startButton.setText(started ? strings.resume : strings.start);
            startButton.setTextColor(ui.onPrimary);
            startButton.setBackground(ui.ripple(ui.rounded(ui.primary, 20), ui.onPrimary, 20));
        }
        Ui.setEnabled(startButton, running || (remaining > 0 && job.upscalerId != null));

        int unsaved = job.unsavedCount();
        Ui.setEnabled(saveAllButton, unsaved > 0 && !saving);
    }

    private void renderProgress() {
        int total = job.items.size();
        int done = job.count(BatchJob.DONE);
        int failed = job.count(BatchJob.FAILED);
        subtitle.setText(done + " / " + total);
        progressBar.setProgress(done + failed);

        StringBuilder text = new StringBuilder();
        if (job.running) {
            int current = -1;
            for (BatchJob.Item item : job.items) {
                if (item.state == BatchJob.RUNNING) current = item.index;
            }
            text.append(strings.upscaling);
            if (current >= 0) text.append(' ').append(current + 1).append(" / ").append(total);
            long left = estimateLeft();
            if (left > 0) text.append(" · ~").append(duration(left));
        } else {
            text.append(done).append(" / ").append(total);
            if (failed > 0) text.append(" · ").append(failed).append(' ').append(strings.failed);
        }
        progressText.setText(text);
    }

    /** From the pictures done so far, by pixels, since their sizes can differ a lot. */
    private long estimateLeft() {
        double msPerPixel = 0;
        long pixelsDone = 0;
        long msDone = 0;
        for (BatchJob.Item item : job.items) {
            if (item.state == BatchJob.DONE && item.sourceWidth > 0) {
                pixelsDone += (long) item.sourceWidth * item.sourceHeight;
                msDone += item.durationMs;
            }
        }
        if (pixelsDone == 0) return 0;
        msPerPixel = msDone / (double) pixelsDone;
        long averagePixels = pixelsDone / Math.max(1, job.count(BatchJob.DONE));
        long left = 0;
        long now = System.currentTimeMillis();
        for (BatchJob.Item item : job.items) {
            long pixels = item.sourceWidth > 0 ? (long) item.sourceWidth * item.sourceHeight : averagePixels;
            if (item.state == BatchJob.QUEUED) {
                left += (long) (pixels * msPerPixel);
            } else if (item.state == BatchJob.RUNNING) {
                left += Math.max(0, (long) (pixels * msPerPixel) - (now - item.startedAt));
            }
        }
        return left;
    }

    private static String duration(long ms) {
        long seconds = Math.max(0, ms / 1000);
        return String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60);
    }

    // ---------------------------------------------------------------- viewer

    private void select(int index) {
        if (index < 0 || index >= job.items.size()) return;
        selected = index;
        viewer.setAlternate(null);
        for (Thumbnail thumbnail : thumbnailViews) {
            thumbnail.render(job.items.get(thumbnail.index), thumbnail.index == selected);
        }
        Thumbnail thumbnail = thumbnailViews.get(index);
        thumbnailScroll.post(() -> thumbnailScroll.smoothScrollTo(
            thumbnail.getLeft() - (thumbnailScroll.getWidth() - thumbnail.getWidth()) / 2, 0));
        showSelected();
        renderActions();
    }

    /** Puts the selected picture on screen: its result once there is one, the original until then. */
    private void showSelected() {
        BatchJob.Item item = job.items.get(selected);
        boolean result = item.state == BatchJob.DONE && item.output != null;
        if (shownIndex == selected && shownResult == result) {
            renderOverlay();
            return;
        }
        shownIndex = selected;
        shownResult = result;
        shownOriginal = null;
        int generation = ++loadGeneration;
        if (!result) viewer.clear();

        loader.execute(() -> {
            try {
                if (result) {
                    Bitmap base = BatchJob.decodeSampled(item.output, MAX_DISPLAY);
                    runOnUiThread(() -> {
                        if (generation != loadGeneration) return;
                        viewer.setImage(item.outputWidth, item.outputHeight, base, item.output);
                    });
                    Bitmap original = BatchJob.decodeSampled(getContentResolver(), item.source, MAX_DISPLAY);
                    runOnUiThread(() -> {
                        if (generation == loadGeneration) shownOriginal = original;
                    });
                } else {
                    if (item.sourceWidth == 0) {
                        int[] size = BatchJob.uprightSize(getContentResolver(), item.source);
                        if (item.sourceWidth == 0) {
                            item.sourceWidth = size[0];
                            item.sourceHeight = size[1];
                        }
                    }
                    Bitmap original = BatchJob.decodeSampled(getContentResolver(), item.source, MAX_DISPLAY);
                    runOnUiThread(() -> {
                        if (generation != loadGeneration) return;
                        viewer.setImage(original.getWidth(), original.getHeight(), original, null);
                        renderOverlay();
                    });
                }
            } catch (Throwable ex) {
                Log.e(BatchUpscalePatch.LOG_TAG, "Could not show " + item.source, ex);
                runOnUiThread(() -> {
                    if (generation != loadGeneration) return;
                    viewer.clear();
                    statusPanel.setVisibility(View.VISIBLE);
                    statusSpinner.setVisibility(View.GONE);
                    statusText.setText(ex.getMessage());
                });
            }
        });
        renderOverlay();
    }

    private void renderOverlay() {
        if (job == null) return;
        BatchJob.Item item = job.items.get(selected);
        String name = item.name;
        positionChip.setText((selected + 1) + " / " + job.items.size() + (name != null ? "  " + name : ""));
        positionChip.setMaxWidth(viewer.getWidth() > 0 ? viewer.getWidth() - ui.dp(24) : ui.dp(280));
        positionChip.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);

        String size = null;
        if (item.state == BatchJob.DONE) {
            size = item.sourceWidth + " × " + item.sourceHeight + "  →  " + item.outputWidth + " × " + item.outputHeight;
            sizeChip.setBackground(ui.rounded(ui.primaryContainer, 8));
            sizeChip.setTextColor(ui.onPrimaryContainer);
        } else if (item.sourceWidth > 0) {
            size = item.sourceWidth + " × " + item.sourceHeight;
            sizeChip.setBackground(ui.rounded(ui.secondaryContainer, 8));
            sizeChip.setTextColor(ui.onSecondaryContainer);
        }
        sizeChip.setVisibility(size == null ? View.GONE : View.VISIBLE);
        sizeChip.setText(size);

        String status = null;
        boolean spinning = false;
        switch (item.state) {
            case BatchJob.RUNNING:
                status = strings.upscaling + " · " + duration(System.currentTimeMillis() - item.startedAt);
                spinning = true;
                break;
            case BatchJob.QUEUED:
                if (job.running) status = strings.waiting;
                break;
            case BatchJob.FAILED:
                status = strings.failed + (item.error != null ? "\n" + item.error : "");
                break;
            case BatchJob.CANCELLED:
                status = strings.cancelled;
                break;
            default:
                break;
        }
        statusPanel.setVisibility(status == null ? View.GONE : View.VISIBLE);
        statusSpinner.setVisibility(spinning ? View.VISIBLE : View.GONE);
        statusText.setText(status);
        statusText.setTextColor(item.state == BatchJob.FAILED ? ui.error : ui.onSurface);
    }

    private void renderActions() {
        BatchJob.Item item = job.items.get(selected);
        Ui.setEnabled(previousButton, selected > 0);
        Ui.setEnabled(nextButton, selected < job.items.size() - 1);
        boolean done = item.state == BatchJob.DONE;
        Ui.setEnabled(compareButton, done);
        if (item.saved) {
            saveButton.setText(strings.saved);
            saveButton.setCompoundDrawablesRelativeWithIntrinsicBounds(
                new Ui.Icon(Ui.ICON_CHECK, ui.onPrimary, ui.dp(1.5f)), null, null, null);
        } else {
            saveButton.setText(strings.save);
            saveButton.setCompoundDrawablesRelativeWithIntrinsicBounds(
                new Ui.Icon(Ui.ICON_SAVE, ui.onPrimary, ui.dp(1.5f)), null, null, null);
        }
        Ui.setEnabled(saveButton, done && !item.saved && !saving);
    }

    private void loadThumbnails() {
        int size = ui.dp(64) * 2;
        for (BatchJob.Item item : job.items) {
            thumbnails.execute(() -> {
                try {
                    Bitmap bitmap = BatchJob.decodeSampled(getContentResolver(), item.source, size);
                    runOnUiThread(() -> thumbnailViews.get(item.index).image.setImageBitmap(bitmap));
                } catch (Throwable ex) {
                    Log.w(BatchUpscalePatch.LOG_TAG, "No thumbnail for " + item.source, ex);
                }
            });
        }
    }

    // ---------------------------------------------------------------- saving

    /** Android 9 writes to the Pictures folder directly, which needs the storage permission. */
    private boolean canSave() {
        if (Build.VERSION.SDK_INT >= 29) return true;
        if (checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED) {
            return true;
        }
        requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 1);
        return false;
    }

    private void saveSelected() {
        if (!canSave()) return;
        BatchJob.Item item = job.items.get(selected);
        saving = true;
        renderActions();
        renderControls();
        saver.execute(() -> {
            String error = null;
            try {
                job.save(item);
            } catch (Throwable ex) {
                Log.e(BatchUpscalePatch.LOG_TAG, "Could not save " + item.source, ex);
                error = ex.getMessage();
            }
            String failure = error;
            runOnUiThread(() -> {
                saving = false;
                Toast.makeText(this, failure == null ? strings.saved
                    : String.format(strings.saveFailed, failure), Toast.LENGTH_SHORT).show();
                if (!isDestroyed()) onBatchChanged();
            });
        });
    }

    private void saveAll() {
        if (!canSave()) return;
        if (job.unsavedCount() == 0) {
            Toast.makeText(this, strings.nothingToSave, Toast.LENGTH_SHORT).show();
            return;
        }
        saving = true;
        renderActions();
        renderControls();
        saver.execute(() -> {
            int count = 0;
            String error = null;
            for (BatchJob.Item item : job.items) {
                if (item.state != BatchJob.DONE || item.saved) continue;
                try {
                    job.save(item);
                    count++;
                } catch (Throwable ex) {
                    Log.e(BatchUpscalePatch.LOG_TAG, "Could not save " + item.source, ex);
                    error = ex.getMessage();
                }
            }
            int saved = count;
            String failure = error;
            runOnUiThread(() -> {
                saving = false;
                String message = String.format(Locale.getDefault(), strings.allSaved, saved);
                if (failure != null) message += "\n" + String.format(strings.saveFailed, failure);
                Toast.makeText(this, message, Toast.LENGTH_LONG).show();
                if (!isDestroyed()) onBatchChanged();
            });
        });
    }
}
