package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Movie;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.widget.*;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** GIF playback uses the platform decoder, including on Android 5–8. */
public final class GifViewerActivity extends HaiagaruComposeActivity {
    private ViewerCornerControls cornerControls;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private volatile boolean closed;
    private volatile int generation;
    private String url;
    private GifCanvas image;
    private TextView status;
    private Button play;
    private boolean playing = true, foreground;
    private Runnable unregisterBack;
    private boolean pendingSave;

    static boolean supported(String value) {
        return GifAutoFetchPolicy.supported(value);
    }

    /** Called after the native image activity's super.onCreate, before it loads images. */
    public static boolean redirectNative(Activity activity) {
        if (!Haiagaru.videoViewerEnabled()) return false;
        MediaViewerNavigation.nativeOpening(activity);
        Intent incoming = activity.getIntent();
        if (incoming == null) return false;
        java.util.ArrayList<String> links = incoming.getStringArrayListExtra("links");
        int index = incoming.getIntExtra("index", 0);
        if (links == null || index < 0 || index >= links.size()) return false;
        String selected=PreviewUrls.normalize(links.get(index));
        if(!supported(selected)&&!DirectVideoUrls.supported(selected))return false;
        if(supported(selected)?VideoViewerSettings.nativeGif(activity):VideoViewerSettings.nativeVideo(activity))return false;
        java.util.ArrayList<String> group=MediaViewerNavigation.links(activity);
        activity.startActivity(MediaViewerNavigation.destination(activity,group,group.indexOf(selected)));
        activity.finish(); return true;
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        Uri uri = getIntent().getData();
        if (!Haiagaru.videoViewerEnabled() || uri == null || !supported(uri.toString())) { finish(); return; }
        url = PreviewUrls.normalize(uri.toString());
        playing=VideoViewerSettings.prefs(this).getBoolean(VideoViewerSettings.GIF_AUTOPLAY,true);
        if (state != null) { playing = state.getBoolean("playing", true); pendingSave = state.getBoolean("save", false); }
        unregisterBack = VideoViewerBack.register(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL); root.setBackgroundColor(Color.BLACK);
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom()); return insets;
        });
        // Compact bottom controller proposed by contributor: ﾜｯﾁｮｲ 3f3c-gNc7.
        // Keep these actual Views attached: popup anchors and dp sizing must not
        // be lost when converting a model toolbar into Compose controls.
        LinearLayout toolbar = new LinearLayout(this); toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(dp(8), 0, dp(8), 0);
        TextView title = new TextView(this); title.setText("GIF"+MediaViewerNavigation.counter(this)); title.setTextColor(Color.WHITE);
        title.setTextSize(16); title.setGravity(Gravity.CENTER_VERTICAL); title.setPadding(dp(8), 0, dp(12), 0);
        toolbar.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
        play = button(playing ? "一時停止" : "再生"); play.setEnabled(false);
        play.setOnClickListener(v -> {
            playing = !playing; image.setPlaying(playing && foreground); play.setText(playing ? "一時停止" : "再生");
        }); toolbar.addView(play, new LinearLayout.LayoutParams(-2, -2));
        Button more = button("︙"); more.setContentDescription("GIFメニュー");
        more.setOnClickListener(this::showMenu);
        Button back = button("戻る"); back.setOnClickListener(v -> finish());
        cornerControls = new ViewerCornerControls(this, back, more);
        FrameLayout frame = new FrameLayout(this);
        image = new GifCanvas(); frame.addView(image, new FrameLayout.LayoutParams(-1,-1));
        frame.addView(cornerControls, new FrameLayout.LayoutParams(-1,-1));
        root.addView(frame, new LinearLayout.LayoutParams(-1,0,1));
        status = new TextView(this); status.setTextColor(Color.WHITE); status.setPadding(dp(16), dp(8), dp(16), dp(8)); root.addView(status);
        root.addView(toolbar);
        HaiagaruUi.showPlayer(this, root); root.requestApplyInsets(); load();
    }

    private Button button(String label) {
        Button b = new Button(this); b.setText(label); b.setTextColor(Color.WHITE); b.setAllCaps(false); b.setTextSize(14);
        b.setMinWidth(0); b.setMinimumWidth(0); b.setMinHeight(dp(48)); b.setMinimumHeight(dp(48));
        b.setPadding(dp(8), 0, dp(8), 0); b.setBackgroundColor(Color.TRANSPARENT); return b;
    }
    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }

    private void load() {
        final int request = ++generation;
        final boolean refresh=forceReload;
        image.setMovie(null); play.setEnabled(false); status.setVisibility(View.VISIBLE); status.setText("GIFを読み込み中…");
        worker.execute(() -> {
            try {
                if (closed || request != generation) return;
                java.io.File file=GifMediaLoader.load(this,url,GifFileCache.MAX_FILE,refresh,()->closed||request!=generation);
                Movie movie;android.graphics.drawable.Drawable animation;
                if(android.os.Build.VERSION.SDK_INT>=28){
                    try{animation=ModernGif.decode(file,getResources().getDisplayMetrics().widthPixels,
                            getResources().getDisplayMetrics().heightPixels);}
                    catch(java.io.IOException|RuntimeException invalid){GifFileCache.invalidate(new java.io.File(getCacheDir(),"haiagaru-gif-files"),url,file);throw invalid;}
                    movie=null;
                }else{
                    movie=Movie.decodeFile(file.getAbsolutePath());animation=null;
                    if(movie==null||movie.width()<=0||movie.height()<=0){
                        GifFileCache.invalidate(new java.io.File(getCacheDir(),"haiagaru-gif-files"),url,file);
                        throw new java.io.IOException("GIFを読み取れません");
                    }
                }
                runOnUiThread(() -> {
                    if (closed || request != generation) {if(animation!=null&&android.os.Build.VERSION.SDK_INT>=28)ModernGif.stop(animation);return;}
                    if(animation!=null)image.setAnimation(animation);else image.setMovie(movie);
                    image.setPlaying(playing && foreground);
                    play.setEnabled(true); status.setText(""); status.setVisibility(View.GONE);
                });
            } catch (Exception | OutOfMemoryError failure) {
                runOnUiThread(() -> { if (!closed && request == generation)
                    status.setText("GIFを再生できません。︙から再読み込み、または外部アプリで開いてください。"); });
            }
        });
    }
    private boolean forceReload;

    @Override public boolean dispatchTouchEvent(android.view.MotionEvent event) {
        if(event.getActionMasked()==android.view.MotionEvent.ACTION_DOWN && cornerControls.contains(event.getRawX(),event.getRawY())) return super.dispatchTouchEvent(event);
        if(MediaViewerNavigation.onTouch(this,event,image))return true;
        return super.dispatchTouchEvent(event);
    }

    private void showMenu(View anchor) {
        HaiagaruPopupMenu menu = new HaiagaruPopupMenu(this, anchor);
        menu.getMenu().add(0, 1, 0, "再読み込み");
        menu.getMenu().add(0, 2, 1, "外部アプリで開く");
        menu.getMenu().add(0, 3, 2, "URLをコピー");
        menu.getMenu().add(0, 4, 3, "GIFを保存");
        menu.getMenu().add(0, 5, 4, "画面を回転");
        menu.getMenu().add(0, 6, 5, "ビューアの操作設定");
        menu.setOnMenuItemClickListener(item -> {
            switch (item.getItemId()) {
                case 1: forceReload=true;load();forceReload=false;return true;
                case 2:
                    try { startActivity(Intent.createChooser(new Intent(Intent.ACTION_VIEW)
                            .setDataAndType(Uri.parse(url), "image/gif"), "GIFを開く")); }
                    catch (RuntimeException unavailable) { Toast.makeText(this, "GIFを開けるアプリがありません", Toast.LENGTH_SHORT).show(); }
                    return true;
                case 3:
                    android.content.ClipboardManager clipboard = (android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE);
                    if (clipboard != null) clipboard.setPrimaryClip(android.content.ClipData.newPlainText("GIF URL", url)); return true;
                case 4: VideoDownloads.confirm(this, url, this::save); return true;
                case 5: setRequestedOrientation(getResources().getConfiguration().orientation == 2
                        ? android.content.pm.ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
                        : android.content.pm.ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE); return true;
                case 6: VideoViewerSettings.show(this);return true;
                default: return false;
            }
        }); menu.show();
    }
    private void save() {
        if (VideoDownloads.needsStoragePermission(this)) {
            pendingSave = true;
            requestPermissions(new String[]{android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, VideoDownloads.REQUEST_STORAGE);
        } else VideoDownloads.enqueue(this, url);
    }
    @Override public void onRequestPermissionsResult(int request, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(request, permissions, results);
        if (request == VideoDownloads.REQUEST_STORAGE && pendingSave) {
            pendingSave = false;
            if (results.length > 0 && results[0] == android.content.pm.PackageManager.PERMISSION_GRANTED) VideoDownloads.enqueue(this, url);
        }
    }
    @Override protected void onResume() { super.onResume(); foreground = true; if (image != null) image.setPlaying(playing); }
    @Override protected void onPause() { foreground = false; if (image != null) image.setPlaying(false); super.onPause(); }
    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("playing", playing); state.putBoolean("save", pendingSave); super.onSaveInstanceState(state);
    }
    @Override protected void onDestroy() {
        closed = true; generation++; worker.shutdownNow();
        if (image != null) image.setMovie(null);
        if (unregisterBack != null) unregisterBack.run(); super.onDestroy();
    }
    private final class GifCanvas extends View {
        private Movie movie;
        private android.graphics.drawable.Drawable animation;
        private boolean animating;
        private long elapsed, started;
        GifCanvas() { super(GifViewerActivity.this); setLayerType(View.LAYER_TYPE_SOFTWARE, null); setContentDescription("GIFアニメーション"); }
        void setMovie(Movie value) {
            if(animation!=null){if(android.os.Build.VERSION.SDK_INT>=28)ModernGif.stop(animation);animation.setCallback(null);animation=null;}
            setLayerType(value==null?View.LAYER_TYPE_NONE:View.LAYER_TYPE_SOFTWARE,null);
            movie = value; elapsed = 0; started = SystemClock.uptimeMillis(); invalidate();
        }
        void setAnimation(android.graphics.drawable.Drawable value){
            setMovie(null);animation=value;animation.setCallback(this);setLayerType(View.LAYER_TYPE_NONE,null);invalidate();
        }
        void setPlaying(boolean value) {
            if(animation!=null&&android.os.Build.VERSION.SDK_INT>=28)ModernGif.play(animation,value);
            if (animating == value) return;
            long now = SystemClock.uptimeMillis();
            if (animating) elapsed += now - started; else started = now;
            animating = value; invalidate();
        }
        @Override protected boolean verifyDrawable(android.graphics.drawable.Drawable value){return value==animation||super.verifyDrawable(value);}
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if(animation!=null){
                float ratio=Math.min((float)getWidth()/Math.max(1,animation.getIntrinsicWidth()),(float)getHeight()/Math.max(1,animation.getIntrinsicHeight()));
                int width=Math.round(animation.getIntrinsicWidth()*ratio),height=Math.round(animation.getIntrinsicHeight()*ratio);
                int left=(getWidth()-width)/2,top=(getHeight()-height)/2;
                animation.setBounds(left,top,left+width,top+height);animation.draw(canvas);return;
            }
            if (movie == null) return;
            int duration = Math.max(1, movie.duration());
            movie.setTime((int)((elapsed + (animating ? SystemClock.uptimeMillis() - started : 0)) % duration));
            float scale = Math.min((float)getWidth()/movie.width(), (float)getHeight()/movie.height());
            canvas.save(); canvas.translate((getWidth()-movie.width()*scale)/2, (getHeight()-movie.height()*scale)/2);
            canvas.scale(scale, scale); movie.draw(canvas, 0, 0); canvas.restore();
            if (animating && movie.duration() > 0) postInvalidateDelayed(16);
        }
    }
    /** API 28+ decodes/advances frames on the platform animation pipeline instead of Movie.setTime on UI. */
    private static final class ModernGif {
        static android.graphics.drawable.Drawable decode(java.io.File file,int width,int height)throws java.io.IOException{
            return android.graphics.ImageDecoder.decodeDrawable(android.graphics.ImageDecoder.createSource(file),(decoder,info,source)->{
                decoder.setAllocator(android.graphics.ImageDecoder.ALLOCATOR_SOFTWARE);
                double ratio=Math.min(1d,Math.min((double)Math.max(1,width)/info.getSize().getWidth(),(double)Math.max(1,height)/info.getSize().getHeight()));
                decoder.setTargetSize(Math.max(1,(int)Math.round(info.getSize().getWidth()*ratio)),Math.max(1,(int)Math.round(info.getSize().getHeight()*ratio)));
            });
        }
        static void play(android.graphics.drawable.Drawable value,boolean playing){
            if(value instanceof android.graphics.drawable.AnimatedImageDrawable){
                android.graphics.drawable.AnimatedImageDrawable gif=(android.graphics.drawable.AnimatedImageDrawable)value;
                gif.setRepeatCount(android.graphics.drawable.AnimatedImageDrawable.REPEAT_INFINITE);
                if(playing)gif.start();else gif.stop();
            }
        }
        static void stop(android.graphics.drawable.Drawable value){play(value,false);}
    }
}
