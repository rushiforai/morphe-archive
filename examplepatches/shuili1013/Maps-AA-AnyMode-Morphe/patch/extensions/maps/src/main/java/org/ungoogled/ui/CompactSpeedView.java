package org.ungoogled.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.View;

/** Supplementary warnings and observed average-zone progress; Maps draws speed and limit. */
public final class CompactSpeedView extends View {
    private final Paint ink=new Paint(Paint.ANTI_ALIAS_FLAG),fill=new Paint(Paint.ANTI_ALIAS_FLAG);
    private TelemetryStore.View data=TelemetryStore.View.empty("");
    private Double limit;
    private boolean imperial,dark=true;
    private String warning="";
    private final float density;
    private float totalHeight;
    private int bottomClearance;
    public CompactSpeedView(Context context) {
        super(context);density=getResources().getDisplayMetrics().density;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
        setLayerType(LAYER_TYPE_SOFTWARE,null); // text halos remain legible over either map palette
    }
    public void refresh(boolean dark) {
        bottomClearance=0;
        bind(ExternalTelemetry.view(),ExternalTelemetry.limitKmh(),PowerSaving.miles(),dark,ExternalTelemetry.compactWarning());
    }
    void bind(TelemetryStore.View snapshot,Double maximum,boolean imperial,boolean dark,String warning) {
        data=snapshot;limit=maximum;this.imperial=imperial;this.dark=dark;this.warning=warning;
        String average=!data.zoneActive?"":data.averageKmh==null?"Observed partial average pending":"Observed partial average "+Math.round(imperial?data.averageKmh/1.609344:data.averageKmh)+(imperial?" mph":" km/h");
        setContentDescription(average+(average.isEmpty()||warning.isEmpty()?"":", ")+warning);
        requestLayout();invalidate();
    }
    boolean hasContent(){return data.zoneActive||!warning.isEmpty();}
    private float dp(float value){return value*density;}
    private float sp(float value){return value*getResources().getDisplayMetrics().scaledDensity;}
    @Override protected void onMeasure(int widthSpec,int heightSpec) {
        if(!hasContent()){setMeasuredDimension(0,0);return;}
        float fontScale=Math.max(1,getResources().getDisplayMetrics().scaledDensity/density);
        int warningLines=warning.isEmpty()?0:Math.min(4,warning.split("\n").length);
        totalHeight=(data.zoneActive?sp(16)+sp(11)+dp(16):0)+warningLines*(sp(13)+dp(6))+(warningLines==0?0:dp(12));
        float measuredWidth=warningLines==0?dp(140)*Math.min(1.5f,fontScale):dp(240)*Math.min(1.5f,fontScale);
        setMeasuredDimension(resolveSize((int)Math.ceil(measuredWidth),widthSpec),resolveSize((int)Math.ceil(totalHeight+dp(4+bottomClearance)),heightSpec));
    }
    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);float x=dp(2),y=dp(2),width=Math.max(0,getWidth()-dp(4));
        int normal=dark?Color.WHITE:0xff111d2d,error=0xffe8514a;
        ink.setTextAlign(Paint.Align.LEFT);ink.setTypeface(Typeface.create("sans-serif",Typeface.NORMAL));ink.setColor(normal);
        ink.setShadowLayer(dp(2),0,dp(1),dark?0xaa000000:0xaaffffff);
        if(data.zoneActive) {
            boolean avgOver=data.averageKmh!=null&&limit!=null&&data.averageKmh>limit+5;
            ink.setColor(avgOver?error:normal);ink.setTextSize(sp(16));
            String average=data.averageKmh==null?"—":String.valueOf(Math.round(imperial?data.averageKmh/1.609344:data.averageKmh));
            String line="Ø "+average+(imperial?" mph":" km/h");
            while(ink.measureText(line)>width&&ink.getTextSize()>sp(11))ink.setTextSize(ink.getTextSize()-1);
            y+=sp(16)+dp(3);canvas.drawText(line,x,y,ink);
            fill.setStyle(Paint.Style.FILL);fill.setColor(dark?0xff697486:0xffb6bec7);y+=dp(5);
            canvas.drawRoundRect(new RectF(x,y,x+width,y+dp(3)),dp(2),dp(2),fill);
            fill.setColor(avgOver?error:0xff287cf6);
            float progress=data.progressPercent==null?0:Math.max(0,Math.min(1,data.progressPercent.floatValue()/100));
            canvas.drawRoundRect(new RectF(x,y,x+width*progress,y+dp(3)),dp(2),dp(2),fill);
            y+=sp(11)+dp(7);ink.setTextSize(sp(11));ink.setColor(normal);
            canvas.drawText((data.progressEstimated?"≈":"")+Math.round(data.progressPercent==null?0:data.progressPercent)+"%",x,y,ink);
            ink.setTextAlign(Paint.Align.RIGHT);canvas.drawText(ExternalTelemetry.distance(data.remainingMeters,imperial),x+width,y,ink);ink.setTextAlign(Paint.Align.LEFT);
        }
        if(!warning.isEmpty()) {
            // Warning text must remain legible over changing map and Explore-sheet imagery.
            fill.setStyle(Paint.Style.FILL);fill.setColor(dark?0xff20242b:0xfff5f7fa);
            canvas.drawRoundRect(new RectF(x,y+dp(3),getWidth()-dp(2),getHeight()-dp(2+bottomClearance)),dp(6),dp(6),fill);
            y+=dp(6);
            ink.setTextSize(sp(13));ink.setColor(dark?0xffffd482:0xff3b4350);
            ink.clearShadowLayer();
            android.text.TextPaint warningInk=new android.text.TextPaint(ink);
            for(String line:warning.split("\n",4)){
                y+=sp(13)+dp(5);
                String shown=android.text.TextUtils.ellipsize(line,warningInk,Math.max(0,getWidth()-dp(20)),android.text.TextUtils.TruncateAt.END).toString();
                canvas.drawText(shown,x+dp(8),y,warningInk);
            }
        }
    }
}
