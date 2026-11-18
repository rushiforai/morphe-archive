package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.math.BigDecimal;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.downloads.DownloadHooks;
import app.afterglow.extension.playback.PremiumControls;
import app.afterglow.extension.video.VideoState;

/** Afterglow's transport row and six circular utility tiles, backed by the active native player. */
public final class PremiumControlsSheet {
    private static final int BACKGROUND = 0xff141416, TILE = 0xff303032, SECONDARY = 0xffb7b7bb;
    private static final float[] SPEEDS = {.25f,.5f,.75f,1f,1.25f,1.5f,1.75f,2f,2.25f,2.5f,3f,3.5f,4f,4.5f,5f};
    private static WeakReference<Dialog> shown = new WeakReference<>(null);
    private final Activity activity;
    private final PremiumControls.Session session;
    private final VaultViews views;
    private final Dialog dialog;
    private final LinearLayout content, shell;
    private final TextView title, channel;
    private final ImageView play, next;
    private final Tile download, speed, stable, mute, lite, lock;
    private Dialog speedPicker;
    private boolean disposed;
    private final Runnable tick = this::refresh;

    public static void show(Activity activity, PremiumControls.Session session) {
        Dialog old = shown.get();
        if (old != null && old.isShowing()) { session.close(); return; }
        PremiumControlsSheet sheet = new PremiumControlsSheet(activity, session);
        shown = new WeakReference<>(sheet.dialog);
        sheet.dialog.show();
        DebugLog.write("premium-controls", "Opened controls");
        session.attachWindow(sheet.dialog.getWindow().getDecorView());
        sheet.refresh();
    }
    private PremiumControlsSheet(Activity activity, PremiumControls.Session session) {
        this.activity = activity; this.session = session; views = new VaultViews(activity);
        dialog = new Dialog(activity) {
            @Override protected void onStop() { dispose(); super.onStop(); }
        };
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        content = views.column(); views.pad(content,12,0,12,20);
        LinearLayout header = views.row(); views.pad(header,4,0,4,0);
        LinearLayout pill = views.row(); views.pad(pill,5,4,12,4); pill.setBackground(views.rounded(TILE,22));
        TextView badge = views.text("P",15,Color.WHITE,true); badge.setGravity(Gravity.CENTER);
        badge.setBackground(views.rounded(views.accent,14)); pill.addView(badge,new LinearLayout.LayoutParams(views.dp(26),views.dp(26)));
        TextView heading = views.text("Premium controls",15,Color.WHITE,true); views.pad(heading,8,0,0,0); pill.addView(heading);
        header.addView(pill); header.addView(new View(activity),new LinearLayout.LayoutParams(0,1,1));
        ImageView close = iconButton("close","Close Premium controls",22,44,() -> dialog.dismiss()); header.addView(close);
        content.addView(header); views.gap(content,21);
        title = views.text("",22,Color.WHITE,true); title.setGravity(Gravity.CENTER); title.setMaxLines(2); title.setEllipsize(TextUtils.TruncateAt.END);
        views.pad(title,16,0,16,0); content.addView(title);
        channel = views.text("",14,SECONDARY,false); channel.setGravity(Gravity.CENTER); channel.setMaxLines(1); channel.setEllipsize(TextUtils.TruncateAt.END);
        views.pad(channel,12,7,12,0); content.addView(channel); views.gap(content,29);
        LinearLayout transport = views.row(); transport.setGravity(Gravity.CENTER);
        addTransport(transport,iconButton("restart","Restart video",25,68,() -> action("Restart",session::restart)));
        addTransport(transport,iconButton("back10","Go back 10 seconds",31,68,() -> action("Seek",() -> session.skip(-10000))));
        play = iconButton("play","Play",42,68,() -> action("Play/pause",session::togglePlaying)); addTransport(transport,play);
        addTransport(transport,iconButton("forward10","Go forward 10 seconds",31,68,() -> action("Seek",() -> session.skip(10000))));
        next = iconButton("next","Next video",25,68,() -> action("Next",session::next)); addTransport(transport,next);
        content.addView(transport); views.gap(content,25);
        download = new Tile("download","Download",() -> {
            String id = session.videoId();
            if (!session.active()) return;
            dialog.dismiss(); DownloadHooks.open(id);
        });
        speed = new Tile("speed","1x",this::speeds);
        stable = new Tile("stable","Stable volume",() -> action("Stable volume",session::toggleStableVolume));
        mute = new Tile("volume","Mute",() -> action("Mute",session::toggleMuted));
        lite = new Tile("lite","Lite",() -> action("Lite mode",session::toggleLite));
        lock = new Tile("lock","Lock",() -> action("Lock",session::toggleLocked));
        addTileRow(download,speed,stable); views.gap(content,18); addTileRow(mute,lite,lock);

        shell = views.column(); shell.setBackground(views.rounded(BACKGROUND,18)); views.pad(shell,0,9,0,0);
        View grabber = new View(activity); grabber.setBackground(views.rounded(0xff66666a,3));
        LinearLayout.LayoutParams grab = new LinearLayout.LayoutParams(views.dp(36),views.dp(5)); grab.gravity = Gravity.CENTER_HORIZONTAL; grab.bottomMargin = views.dp(12);
        shell.addView(grabber,grab);
        ScrollView scroll = new ScrollView(activity); scroll.setFillViewport(false); scroll.setClipToPadding(false); scroll.addView(content);
        shell.addView(scroll,new LinearLayout.LayoutParams(-1,-2)); dialog.setContentView(shell);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT)); window.setGravity(Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);
            window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        dialog.setOnShowListener(d -> {
            Window w = dialog.getWindow(); if (w == null) return;
            int width = Math.min(activity.getResources().getDisplayMetrics().widthPixels,views.dp(560));
            int height = (int)(activity.getResources().getDisplayMetrics().heightPixels*.88f);
            shell.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.AT_MOST));
            w.setLayout(width,Math.min(height,shell.getMeasuredHeight()));
        });
        dialog.setOnDismissListener(d -> dispose());
        shell.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View v) {}
            @Override public void onViewDetachedFromWindow(View v) { dispose(); }
        });
    }
    private void addTransport(LinearLayout parent,View view) {
        parent.addView(view,new LinearLayout.LayoutParams(0,views.dp(68),1));
    }
    private ImageView iconButton(String symbol,String label,int size,int touch,Runnable action) {
        ImageView view = new ImageView(activity); view.setImageDrawable(new Symbol(symbol,Color.WHITE));
        view.setScaleType(ImageView.ScaleType.FIT_CENTER); int padding=(touch-size)/2; views.pad(view,padding,padding,padding,padding);
        view.setLayoutParams(new LinearLayout.LayoutParams(views.dp(touch),views.dp(touch)));
        view.setBackground(views.clickable(Color.TRANSPARENT,touch/2)); view.setContentDescription(label); view.setFocusable(true);
        view.setOnClickListener(v -> { if (dialog.isShowing() && v.hasWindowFocus()) { DebugLog.write("premium-controls", "Action: " + view.getContentDescription()); action.run(); } }); return view;
    }
    private void addTileRow(Tile...tiles) {
        LinearLayout row = views.row(); row.setGravity(Gravity.TOP);
        for (Tile tile:tiles) row.addView(tile.root,new LinearLayout.LayoutParams(0,views.dp(96),1));
        content.addView(row);
    }
    private final class Tile {
        final LinearLayout root = views.column();
        final ImageView image = new ImageView(activity);
        final TextView label;
        String symbol;
        boolean active;
        Tile(String symbol,String text,Runnable action) {
            this.symbol = symbol; root.setGravity(Gravity.CENTER_HORIZONTAL); root.setFocusable(true);
            root.setBackground(views.clickable(Color.TRANSPARENT,12));
            image.setScaleType(ImageView.ScaleType.FIT_CENTER); views.pad(image,17,17,17,17);
            root.addView(image,new LinearLayout.LayoutParams(views.dp(62),views.dp(62)));
            label = views.text(text,13,Color.WHITE,false); label.setGravity(Gravity.CENTER); label.setMaxLines(2); views.pad(label,2,9,2,0); root.addView(label);
            root.setOnClickListener(v -> { if (dialog.isShowing() && v.hasWindowFocus()) { DebugLog.write("premium-controls", "Action: " + label.getText()); action.run(); } }); update(symbol,text,false,true);
        }
        void update(String symbol,String text,boolean active,boolean enabled) {
            if (!symbol.equals(this.symbol) || image.getDrawable() == null) { image.setImageDrawable(new Symbol(symbol,Color.WHITE)); this.symbol = symbol; }
            if (this.active != active || image.getBackground() == null) { image.setBackground(views.rounded(active?views.accent:TILE,32)); this.active = active; }
            if (!text.contentEquals(label.getText())) label.setText(text);
            root.setEnabled(enabled); root.setAlpha(enabled?1f:.38f);
            root.setContentDescription(text+(enabled?"":" unavailable")+(active?", on":""));
        }
    }
    private interface Action { boolean run(); }
    private void action(String name,Action action) {
        if (!action.run()) Toast.makeText(activity,name+" is unavailable right now",Toast.LENGTH_SHORT).show();
        refresh();
    }
    static String rate(float value) {
        if (!Float.isFinite(value) || value<=0) return "1x";
        return new BigDecimal(Float.toString(value)).stripTrailingZeros().toPlainString()+"x";
    }
    private void refresh() {
        shell.removeCallbacks(tick);
        if (disposed || !dialog.isShowing()) return;
        if (!session.active()) { dialog.dismiss(); return; }
        String name = session.title(), by = session.channel();
        title.setText(name == null || name.isEmpty()?"Current video":name);
        channel.setText(by); channel.setVisibility(by == null || by.isEmpty()?View.GONE:View.VISIBLE);
        boolean playing = session.playing(); play.setImageDrawable(new Symbol(playing?"pause":"play",Color.WHITE));
        play.setContentDescription(playing?"Pause":"Play"); play.setEnabled(session.canPlay()); play.setAlpha(play.isEnabled()?1f:.38f);
        next.setEnabled(session.canNext()); next.setAlpha(next.isEnabled()?1f:.38f);
        speed.update("speed",rate(session.speed()),false,true);
        int stableState = session.stableVolume(), muted = session.muted(), lockState = session.lockState();
        stable.update("stable","Stable volume",stableState == 1,stableState >= 0);
        mute.update(muted == 1?"muted":"volume",muted == 1?"Unmute":"Mute",muted == 1,muted >= 0);
        lite.update("lite",session.lite()?"Lite on":"Lite",session.lite(),session.canLite());
        lock.update(lockState >= 2?"unlock":"lock",session.lockPending()?"Locking…":lockState >= 2?"Unlock":"Lock",lockState >= 2,lockState != 0&&!session.lockPending());
        download.update("download","Download",false,InstalledTweaks.has("downloads"));
        dialog.setCancelable(lockState < 2); dialog.setCanceledOnTouchOutside(lockState < 2);
        shell.postDelayed(tick,250);
    }
    private void speeds() {
        if (speedPicker != null && speedPicker.isShowing()) return;
        LinearLayout list = views.column(); views.pad(list,16,0,16,4);
        list.addView(views.heading("Playback speed",null));
        Dialog picker = views.sheet(list); speedPicker = picker;
        for (float value:SPEEDS) {
            boolean selected = Math.abs(session.speed()-value)<.01f;
            TextView row = views.text(rate(value)+(selected?"  ✓":""),16,views.text,selected); views.pad(row,16,13,16,13);
            row.setMinHeight(views.dp(48)); row.setBackground(views.clickable(views.surface,8)); list.addView(row);
            row.setOnClickListener(v -> {
                DebugLog.write("premium-controls", "Selected speed=" + value);
                if (!session.speed(value)) Toast.makeText(activity,"Playback speed is unavailable right now",Toast.LENGTH_SHORT).show();
                picker.dismiss(); refresh();
            });
        }
        picker.setOnDismissListener(d -> {
            speedPicker = null;
            if (!disposed && dialog.getWindow()!=null) session.attachWindow(dialog.getWindow().getDecorView());
        });
        picker.show(); session.attachWindow(picker.getWindow().getDecorView());
    }
    private void dispose() {
        if (disposed) return; disposed = true; shell.removeCallbacks(tick);
        DebugLog.write("premium-controls", "Closed controls");
        if (speedPicker != null) speedPicker.dismiss(); session.close();
        if (shown.get() == dialog) shown.clear();
    }

    private static final class Symbol extends Drawable {
        private final String name;
        private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        Symbol(String name,int color) { this.name=name; p.setColor(color); p.setStrokeWidth(1.65f); p.setStrokeCap(Paint.Cap.ROUND); p.setStrokeJoin(Paint.Join.ROUND); }
        @Override public void draw(Canvas c) {
            c.save(); c.translate(getBounds().left,getBounds().top); c.scale(getBounds().width()/24f,getBounds().height()/24f); p.setStyle(Paint.Style.STROKE);
            switch (name) {
                case "close":line(c,6,6,18,18);line(c,18,6,6,18);break;
                case "play":p.setStyle(Paint.Style.FILL);line(c,7,3,21,12,7,21,7,3);break;
                case "pause":p.setStyle(Paint.Style.FILL);c.drawRoundRect(new RectF(5,3,10,21),1,1,p);c.drawRoundRect(new RectF(14,3,19,21),1,1,p);break;
                case "next":p.setStyle(Paint.Style.FILL);line(c,3,4,17,12,3,20,3,4);c.drawRect(18,4,21,20,p);break;
                case "restart":p.setStyle(Paint.Style.FILL);line(c,21,4,7,12,21,20,21,4);c.drawRect(3,4,6,20,p);break;
                case "back10":case "forward10":
                    boolean forward=name.equals("forward10"); if(forward){c.translate(24,0);c.scale(-1,1);} c.drawArc(new RectF(3,4,21,22),-115,310,false,p);line(c,9,1,5,5,10,7);if(forward){c.scale(-1,1);c.translate(-24,0);} p.setStyle(Paint.Style.FILL);p.setTextSize(8);p.setTextAlign(Paint.Align.CENTER);c.drawText("10",12,16,p);break;
                case "download":line(c,12,2,12,16);line(c,7,11,12,16,17,11);line(c,4,17,4,21,20,21,20,17);break;
                case "speed":c.drawArc(new RectF(3,3,21,21),145,250,false,p);line(c,12,12,18,6);c.drawCircle(12,12,1.3f,p);break;
                case "stable":for(int i=0;i<5;i++){float x=4+i*4,half=i==2?9:i==1||i==3?6:3;c.drawLine(x,12-half,x,12+half,p);}break;
                case "volume":case "muted":line(c,3,9,7,9,12,4,12,20,7,15,3,15,3,9);if(name.equals("muted")){line(c,16,9,22,15);line(c,22,9,16,15);}else{c.drawArc(new RectF(9,3,23,21),-65,130,false,p);c.drawArc(new RectF(11,7,19,17),-60,120,false,p);}break;
                case "lite":c.drawCircle(12,12,8,p);line(c,12,5,12,19);break;
                case "lock":case "unlock":c.drawRoundRect(new RectF(5,10,19,22),2,2,p);if(name.equals("unlock")){c.drawArc(new RectF(9,1,19,13),180,180,false,p);}else{c.drawArc(new RectF(7,2,17,14),180,180,false,p);}c.drawCircle(12,15,1,p);line(c,12,16,12,18);break;
            }
            c.restore();
        }
        private void line(Canvas c,float...points) { Path path = new Path(); path.moveTo(points[0],points[1]); for(int i=2;i<points.length;i+=2)path.lineTo(points[i],points[i+1]);c.drawPath(path,p); }
        @Override public void setAlpha(int alpha) { p.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { p.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
