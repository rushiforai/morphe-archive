/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.graphics.*;import android.graphics.drawable.Drawable;import android.text.*;import android.text.style.*;
import app.morphe.extension.shared.Utils;import app.morphe.extension.shared.theme.ThemeUtils;
import app.morphe.extension.shared.patches.components.ContextInterface;
/** Native inline image span; the underlying model retains readable accessible text. */
public final class DownloadText {
    private DownloadText(){}
    public static CharSequence onLithoTextLoaded(ContextInterface context,CharSequence original){return spans(original);}
    public static CharSequence spans(CharSequence original){
        if(original==null)return null;String text=original.toString();if(!text.startsWith("Downloaded · ")&&!text.startsWith("Downloading")&&!text.startsWith("Queued · "))return original;
        SpannableStringBuilder out=new SpannableStringBuilder(original);
        if(text.startsWith("Downloaded · ")){out.replace(0,"Downloaded · ".length(),"  ");Drawable icon=new Arrow();int size=Math.round(14*Utils.getContext().getResources().getDisplayMetrics().density);icon.setBounds(0,0,size,size);out.setSpan(new ImageSpan(icon,ImageSpan.ALIGN_BASELINE),0,1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);out.setSpan(new TtsSpan.TextBuilder("Downloaded").build(),0,1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
        else{int end=text.indexOf(" · ",text.startsWith("Downloading")?"Downloading · ".length():0);if(end<0)end=text.length();out.setSpan(new ForegroundColorSpan(0xff3ea6ff),0,end,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);}
        return out;
    }
    private static final class Arrow extends Drawable {
        final Paint p=new Paint(Paint.ANTI_ALIAS_FLAG);public void draw(Canvas c){Rect b=getBounds();float s=Math.min(b.width(),b.height()),x=b.left+s/2,y=b.top+s/2;p.setColor(ThemeUtils.getAppForegroundColor());p.setStyle(Paint.Style.FILL);c.drawCircle(x,y,s*.46f,p);p.setColor(ThemeUtils.getAppBackgroundColor());p.setStyle(Paint.Style.STROKE);p.setStrokeWidth(s*.1f);p.setStrokeCap(Paint.Cap.ROUND);c.drawLine(x,y-s*.24f,x,y+s*.2f,p);c.drawLine(x,y+s*.2f,x-s*.18f,y+s*.02f,p);c.drawLine(x,y+s*.2f,x+s*.18f,y+s*.02f,p);}public void setAlpha(int a){p.setAlpha(a);}public void setColorFilter(ColorFilter f){p.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
