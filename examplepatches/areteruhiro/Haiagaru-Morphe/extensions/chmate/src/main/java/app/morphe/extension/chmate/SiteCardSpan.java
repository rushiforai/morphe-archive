package app.morphe.extension.chmate;

import android.graphics.*;
import android.text.*;
import android.text.style.ReplacementSpan;
import android.widget.TextView;

/** A measured native card, responsive to body width and native font size. */
final class SiteCardSpan extends ReplacementSpan {
    private final SiteCardMetadata.Data data;
    private final Bitmap image;
    private final int width;
    private final float density;
    private final java.lang.ref.WeakReference<TextView> host;
    private final int fallbackColor;
    private final boolean compact;
    SiteCardSpan(SiteCardMetadata.Data data,Bitmap image,TextView view) {
        this.data=data;this.image=image;this.width=SiteCards.width(view);
        compact=SiteCards.option(SiteCards.COMPACT,false);
        host=new java.lang.ref.WeakReference<>(view);fallbackColor=view.getCurrentTextColor();
        density=view.getResources().getDisplayMetrics().density;
    }
    private int height(Paint paint){return compact?Math.round(paint.getFontSpacing()*2+24*density):Math.round(Math.max(124*density,paint.getTextSize()*7.5f+24*density));}
    @Override public int getSize(Paint paint,CharSequence text,int start,int end,Paint.FontMetricsInt fm){
        if(fm!=null){fm.ascent=-height(paint);fm.top=fm.ascent;fm.descent=0;fm.bottom=0;}return width;
    }
    @Override public void draw(Canvas c,CharSequence text,int start,int end,float x,int top,int y,int bottom,Paint original){
        Paint paint=new Paint(original);float h=height(original),pad=12*density;
        TextView current=host.get();int color=current==null?fallbackColor:current.getCurrentTextColor();
        boolean dark=Color.red(color)*299+Color.green(color)*587+Color.blue(color)*114>=150000;
        RectF card=new RectF(x,top,x+width,top+h);paint.setColor(dark?0xff172321:0xfff3f6f4);
        c.drawRoundRect(card,10*density,10*density,paint);
        float imageSize=Math.min(80*density,h-pad*2),left=x+pad;
        if(!compact&&image!=null&&!image.isRecycled()) {
            float scale=Math.max(imageSize/image.getWidth(),imageSize/image.getHeight());
            float cropW=imageSize/scale,cropH=imageSize/scale;
            Rect src=new Rect((int)((image.getWidth()-cropW)/2),(int)((image.getHeight()-cropH)/2),
                    (int)((image.getWidth()+cropW)/2),(int)((image.getHeight()+cropH)/2));
            c.drawBitmap(image,src,new RectF(left,top+pad,left+imageSize,top+pad+imageSize),null);
            left+=imageSize+pad;
        }
        int textWidth=Math.max(1,(int)(x+width-pad-left));
        TextPaint tp=new TextPaint(original);tp.setUnderlineText(false);tp.setColor(color);tp.setTypeface(Typeface.create(original.getTypeface(),Typeface.BOLD));
        StaticLayout title=layout(data.title,tp,textWidth,2);
        c.save();c.translate(left,top+pad);title.draw(c);c.restore();
        if(compact)return;
        float next=top+pad+title.getHeight()+6*density;
        tp.setTypeface(original.getTypeface());tp.setTextSize(original.getTextSize()*.88f);tp.setColor(dark?0xffbdc9c3:0xff53625a);
        if(!data.description.isEmpty()) {
            StaticLayout description=layout(data.description,tp,textWidth,2);
            c.save();c.translate(left,next);description.draw(c);c.restore();
        }
        tp.setTextSize(original.getTextSize()*.8f);
        String host=android.net.Uri.parse(data.url).getHost();
        String footer=(data.site.isEmpty()?"":data.site+" · ")+(host==null?"":host);
        CharSequence label=TextUtils.ellipsize(footer,tp,textWidth,TextUtils.TruncateAt.END);
        c.drawText(label.toString(),left,top+h-pad,tp);
    }
    private static StaticLayout layout(String text,TextPaint paint,int width,int lines) {
        if(android.os.Build.VERSION.SDK_INT>=23)return StaticLayout.Builder.obtain(text,0,text.length(),paint,width)
                .setMaxLines(lines).setEllipsize(TextUtils.TruncateAt.END).setIncludePad(false).build();
        StaticLayout measured=new StaticLayout(text,paint,width,Layout.Alignment.ALIGN_NORMAL,1f,0f,false);
        if(measured.getLineCount()<=lines)return measured;
        int end=measured.getLineEnd(lines-1);
        String prefix=text.substring(0,Math.max(0,end-1))+"…";
        return new StaticLayout(prefix,paint,width,Layout.Alignment.ALIGN_NORMAL,1f,0f,false);
    }
}
