package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.LruCache;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.afterglow.extension.settings.ThemeRole;
import app.afterglow.extension.settings.ThemeStore;
import app.afterglow.extension.settings.AfterglowPrefs;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Shared native views for the iOS Afterglow download sheet and Vault layout. */
final class VaultViews {
    static final Handler MAIN = new Handler(Looper.getMainLooper());
    static final ExecutorService IMAGES = Executors.newFixedThreadPool(2);
    private static final LruCache<String, Bitmap> THUMBNAILS = new LruCache<String, Bitmap>(6 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Bitmap value) { return value.getByteCount(); }
    };
    final Activity activity;
    final RowViews rows;
    final RowViews.Palette palette;
    final int background, surface, muted, text, secondary, accent;

    VaultViews(Activity activity) {
        this.activity = activity;
        palette = RowViews.Palette.from(activity.getResources().getConfiguration());
        rows = new RowViews(activity, palette);
        Integer color = ThemeStore.snapshot().palette.color(ThemeRole.BACKGROUND);
        background = color == null ? palette.groupedBackground : color;
        color = ThemeStore.snapshot().palette.color(ThemeRole.ELEVATED_SURFACE);
        surface = color == null ? palette.groupedCell : color;
        muted = blend(surface, palette.text, palette.dark ? 0.07f : 0.04f);
        text = palette.text; secondary = palette.secondaryText; accent = palette.accent;
    }

    int dp(float value) { return rows.dp(value); }
    LinearLayout column() { LinearLayout v = new LinearLayout(activity); v.setOrientation(LinearLayout.VERTICAL); return v; }
    LinearLayout row() { LinearLayout v = new LinearLayout(activity); v.setGravity(Gravity.CENTER_VERTICAL); return v; }
    TextView text(String label, float size, int color, boolean bold) { return rows.text(label, size, color, bold); }
    TextView label(String label, float size, boolean bold) { return text(label, size, text, bold); }
    TextView pickerText(String label,float size,int color,boolean bold) {
        int scale=AfterglowPrefs.getInt("downloadPickerFontScaleMode"),face=AfterglowPrefs.getInt("downloadPickerFontFaceMode");
        TextView view=text(label,size*DownloadUiPolicy.pickerScale(scale),color,bold);
        String family=DownloadUiPolicy.pickerFamily(face);
        view.setTypeface(Typeface.create(family,bold?Typeface.BOLD:Typeface.NORMAL));return view;
    }
    void pad(View view, int left, int top, int right, int bottom) { view.setPadding(dp(left), dp(top), dp(right), dp(bottom)); }
    void gap(LinearLayout parent, int size) { parent.addView(new View(activity), new LinearLayout.LayoutParams(1, dp(size))); }
    GradientDrawable rounded(int color, int radius) { GradientDrawable d = new GradientDrawable(); d.setColor(color); d.setCornerRadius(dp(radius)); return d; }
    Drawable clickable(int color, int radius) { return new RippleDrawable(ColorStateList.valueOf((accent & 0x00ffffff) | 0x28000000), rounded(color,radius), rounded(Color.WHITE,radius)); }
    LinearLayout card(int padding) { LinearLayout v=column(); pad(v,padding,padding,padding,padding); v.setBackground(rounded(surface,8)); return v; }
    TextView button(String title, Runnable action) {
        TextView button = text(title,13,accent,true); button.setGravity(Gravity.CENTER); button.setMinHeight(dp(44));
        pad(button,8,7,8,7); button.setBackground(clickable(surface,7)); button.setOnClickListener(v -> action.run()); return button;
    }
    View heading(String title, String detail) {
        LinearLayout c = column(); pad(c,0,18,0,8); c.addView(label(title,19,true));
        if(detail != null && !detail.isEmpty()) { TextView t=text(detail,11,secondary,false); pad(t,0,3,0,0);c.addView(t); }
        return c;
    }
    TextView pill(String value) { TextView v=text(value,10,Color.WHITE,true); v.setGravity(Gravity.CENTER); pad(v,6,3,6,3); v.setBackground(rounded(0xa6000000,4)); return v; }
    View pickerRow(String title,String subtitle,String symbol,Runnable action) {
        LinearLayout row=row(); pad(row,14,10,14,10); row.setMinimumHeight(dp(58)); row.setBackground(clickable(surface,8));
        ImageView icon=new ImageView(activity);icon.setImageDrawable(new Icon(symbol,accent));
        LinearLayout.LayoutParams ip=new LinearLayout.LayoutParams(dp(26),dp(26)); ip.rightMargin=dp(14);row.addView(icon,ip);
        LinearLayout labels=column();TextView t=pickerText(title,15,text,true);t.setMaxLines(2);t.setEllipsize(TextUtils.TruncateAt.END);labels.addView(t);
        if(subtitle!=null&&!subtitle.isEmpty()) { TextView s=pickerText(subtitle,12,secondary,false);s.setMaxLines(2);s.setEllipsize(TextUtils.TruncateAt.END);labels.addView(s); }
        row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));row.setOnClickListener(v->action.run());return row;
    }
    Dialog sheet(LinearLayout content) {
        Dialog dialog=new Dialog(activity); dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout shell=column(); shell.setBackground(rounded(surface,20)); pad(shell,0,9,0,18);
        View grabber=new View(activity);grabber.setBackground(rounded(blend(surface,text,0.25f),3));
        LinearLayout.LayoutParams gp=new LinearLayout.LayoutParams(dp(36),dp(5));gp.gravity=Gravity.CENTER_HORIZONTAL;gp.bottomMargin=dp(12);shell.addView(grabber,gp);
        ScrollView scroll=new ScrollView(activity);scroll.setFillViewport(false);scroll.setClipToPadding(false);scroll.addView(content);shell.addView(scroll,new LinearLayout.LayoutParams(-1,-2));
        dialog.setContentView(shell); dialog.setCanceledOnTouchOutside(true);
        Window window=dialog.getWindow(); if(window!=null) { window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);window.setGravity(Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE); }
        dialog.setOnShowListener(d->{
            Window w=dialog.getWindow();if(w==null)return;
            int width=Math.min(activity.getResources().getDisplayMetrics().widthPixels,dp(640));
            int height=(int)(activity.getResources().getDisplayMetrics().heightPixels*0.84f);
            shell.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.AT_MOST));
            w.setLayout(width,Math.min(height,shell.getMeasuredHeight()));
        });
        return dialog;
    }
    void thumbnail(ImageView image,String url) {
        image.setTag(url); image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        if(url==null||url.isEmpty())return;
        Bitmap cached=THUMBNAILS.get(url);if(cached!=null){image.setImageBitmap(cached);return;}
        WeakReference<ImageView> target=new WeakReference<>(image);
        IMAGES.execute(()->{
            HttpURLConnection connection=null;
            try {
                URL parsed=new URL(url);if(!"https".equalsIgnoreCase(parsed.getProtocol()))return;
                connection=(HttpURLConnection)parsed.openConnection();connection.setConnectTimeout(8000);connection.setReadTimeout(8000);
                if(connection.getResponseCode()!=200)return;
                ByteArrayOutputStream bytes=new ByteArrayOutputStream();
                try(InputStream in=connection.getInputStream()) {byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1){if(bytes.size()+n>4*1024*1024)return;bytes.write(buffer,0,n);}}
                byte[] data=bytes.toByteArray();BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(data,0,data.length,options);
                options.inSampleSize=1;while(options.outWidth/options.inSampleSize>960||options.outHeight/options.inSampleSize>960)options.inSampleSize*=2;
                options.inJustDecodeBounds=false;Bitmap result=BitmapFactory.decodeByteArray(data,0,data.length,options);if(result==null)return;
                THUMBNAILS.put(url,result);MAIN.post(()->{ImageView view=target.get();if(view!=null&&url.equals(view.getTag()))view.setImageBitmap(result);});
            } catch(Exception ignored) { /* Artwork is optional; the media card retains its type icon. */ }
            finally {if(connection!=null)connection.disconnect();}
        });
    }
    static String bytes(long count) { if(count<0)return "Unknown size";if(count<1000)return count+" B";if(count<1000000)return String.format(Locale.US,"%.0f KB",count/1000d);if(count<1000000000)return String.format(Locale.US,"%.1f MB",count/1000000d);return String.format(Locale.US,"%.2f GB",count/1000000000d); }
    static String duration(long ms) { return DownloadUiPolicy.duration(ms); }
    static String value(String text,String fallback) {return text==null||text.isEmpty()?fallback:text;}
    static int blend(int a,int b,float f) {return Color.rgb(Math.round(Color.red(a)*(1-f)+Color.red(b)*f),Math.round(Color.green(a)*(1-f)+Color.green(b)*f),Math.round(Color.blue(a)*(1-f)+Color.blue(b)*f));}

    /** Outline symbols mirror the six iOS SF-symbol roles without shipping platform art. */
    static final class Icon extends Drawable {
        private final String name;private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        Icon(String name,int color){this.name=name;paint.setColor(color);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.6f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);}
        @Override public void draw(Canvas c){c.save();c.translate(getBounds().left,getBounds().top);c.scale(getBounds().width()/24f,getBounds().height()/24f);
            switch(name){
                case "video":c.drawLine(12,3,12,16,paint);line(c,7,11,12,16,17,11);line(c,4,17,4,21,20,21,20,17);break;
                case "audio":line(c,9,17,9,5,20,3,20,15);c.drawOval(new RectF(3,15,9,20),paint);c.drawOval(new RectF(14,13,20,18),paint);break;
                case "captions":c.drawRoundRect(new RectF(2,4,22,19),3,3,paint);line(c,6,19,6,22,10,19);c.drawLine(6,9,10,9,paint);c.drawLine(14,9,18,9,paint);c.drawLine(6,13,10,13,paint);c.drawLine(14,13,18,13,paint);break;
                case "thumbnail":c.drawRoundRect(new RectF(2,3,22,21),2,2,paint);c.drawCircle(8,8,2,paint);line(c,3,18,10,11,14,15,17,12,22,17);break;
                case "details":c.drawRoundRect(new RectF(7,6,21,22),2,2,paint);line(c,17,3,4,3,4,18);c.drawLine(11,11,17,11,paint);c.drawLine(11,15,17,15,paint);break;
                case "external":line(c,13,3,21,3,21,11);c.drawLine(21,3,10,14,paint);line(c,10,5,3,5,3,21,19,21,19,14);break;
                case "play":line(c,8,4,20,12,8,20,8,4);break;
                case "close":c.drawLine(6,6,18,18,paint);c.drawLine(18,6,6,18,paint);break;
                default:c.drawRoundRect(new RectF(3,3,21,21),3,3,paint);c.drawLine(7,8,17,8,paint);c.drawLine(7,12,17,12,paint);c.drawLine(7,16,14,16,paint);
            }c.restore();}
        private void line(Canvas c,float...points){Path p=new Path();p.moveTo(points[0],points[1]);for(int i=2;i<points.length;i+=2)p.lineTo(points[i],points[i+1]);c.drawPath(p,paint);}
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);}@Override public void setColorFilter(ColorFilter f){paint.setColorFilter(f);}@Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
