package nl.johninnl.vela;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.View;

/** Compact native content embedded in Vela's existing speed-widget slot; transparent by design. */
public final class CompactSpeedView extends View {
    private final Paint ink=new Paint(Paint.ANTI_ALIAS_FLAG),fill=new Paint(Paint.ANTI_ALIAS_FLAG);
    private TelemetryStore.View data=TelemetryStore.View.empty("");
    private Float current;
    private Double limit;
    private boolean imperial,dark=true;
    private String warning="";
    private float shownMps;
    private ValueAnimator animation;
    private final float density;
    private float pairWidth,signSize,rowHeight,totalHeight;
    private int bottomClearance;
    public CompactSpeedView(Context context) {
        super(context);density=getResources().getDisplayMetrics().density;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
        setLayerType(LAYER_TYPE_SOFTWARE,null); // text halos remain legible over either map palette
    }
    public void refresh(boolean dark) {
        bottomClearance=TelemetryRuntime.phoneBottomClearanceDp();
        bind(TelemetryRuntime.view(),TelemetryRuntime.phoneSpeedValue(),TelemetryRuntime.phoneLimitValue(),NativeUi.imperial(),dark,TelemetryRuntime.compactWarningText());
    }
    void bind(TelemetryStore.View snapshot,Float mps,Double maximum,boolean imperial,boolean dark,String warning) {
        Float old=current;data=snapshot;current=mps;limit=maximum;this.imperial=imperial;this.dark=dark;this.warning=warning;
        if(animation!=null)animation.cancel();
        if(mps!=null&&old!=null&&isAttachedToWindow()&&Math.abs(mps-shownMps)>.05f) {
            animation=ValueAnimator.ofFloat(shownMps,mps);animation.setDuration(600);
            animation.addUpdateListener(a->{shownMps=(float)a.getAnimatedValue();invalidate();});animation.start();
        } else if(mps!=null)shownMps=mps;
        setContentDescription(accessibility());
        requestLayout();invalidate();
    }
    private String accessibility() {
        String speed=current==null?"Current speed unknown":"Current speed "+Math.round(current*(imperial?2.236936f:3.6f))+(imperial?" mph":" km/h");
        String maximum=limit==null?"speed limit unknown":"speed limit "+Math.round(imperial?limit/1.609344:limit);
        String average=!data.zoneActive?"":data.averageKmh==null?", observed partial average pending":", observed partial average "+Math.round(imperial?data.averageKmh/1.609344:data.averageKmh);
        return speed+", "+maximum+average+(warning.isEmpty()?"":", "+warning);
    }
    private float dp(float value){return value*density;}
    private float sp(float value){return value*getResources().getDisplayMetrics().scaledDensity;}
    @Override protected void onMeasure(int widthSpec,int heightSpec) {
        float fontScale=Math.max(1,getResources().getDisplayMetrics().scaledDensity/density);
        signSize=dp(44)*Math.min(1.5f,fontScale);
        ink.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));ink.setTextSize(sp(32));
        float factor=imperial?2.236936f:3.6f;
        float numberWidth=Math.max(dp(48),Math.max(ink.measureText(current==null?"—":String.valueOf(Math.round(current*factor))),ink.measureText(String.valueOf(Math.round(shownMps*factor)))));
        pairWidth=numberWidth+dp(6)+signSize;
        rowHeight=Math.max(signSize,sp(32)+sp(10)+dp(3));
        totalHeight=rowHeight+(data.zoneActive?sp(16)+sp(11)+dp(16):0)+(warning.isEmpty()?0:sp(13)+dp(6));
        setMeasuredDimension(resolveSize((int)Math.ceil(pairWidth+dp(4)),widthSpec),resolveSize((int)Math.ceil(totalHeight+dp(4+bottomClearance)),heightSpec));
    }
    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);float x=dp(2),y=dp(2),width=Math.min(pairWidth,getWidth()-dp(4));
        int normal=dark?Color.WHITE:0xff111d2d,error=0xffe8514a;
        float unitFactor=imperial?2.236936f:3.6f;
        double maxDisplay=limit==null?Double.NaN:imperial?limit/1.609344:limit;
        boolean over=current!=null&&Double.isFinite(maxDisplay)&&shownMps*unitFactor>maxDisplay+(imperial?3:5);
        float numberWidth=Math.max(0,width-signSize-dp(6)),cx=x+numberWidth/2;
        ink.setTextAlign(Paint.Align.CENTER);ink.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));ink.setTextSize(sp(32));
        ink.setColor(over?error:normal);ink.setShadowLayer(dp(2),0,dp(1),dark?0xaa000000:0xaaffffff);
        String speed=current==null?"—":String.valueOf(Math.round(shownMps*unitFactor));
        canvas.drawText(speed,cx,y+sp(30),ink);
        ink.setTypeface(Typeface.create("sans-serif",Typeface.NORMAL));ink.setTextSize(sp(10));ink.setColor(normal);
        canvas.drawText(imperial?"mph":"km/h",cx,y+sp(30)+sp(11),ink);
        float radius=signSize/2,signX=x+width-radius,signY=y+radius;
        fill.setStyle(Paint.Style.FILL);fill.setColor(Color.WHITE);canvas.drawCircle(signX,signY,radius,fill);
        fill.setStyle(Paint.Style.STROKE);fill.setStrokeWidth(dp(4));fill.setColor(limit==null?0xff8993a0:error);canvas.drawCircle(signX,signY,radius-dp(2),fill);
        ink.clearShadowLayer();ink.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));ink.setColor(0xff202124);ink.setTextSize(Math.min(sp(21),signSize*.49f));
        String maximum=limit==null?"—":String.valueOf(Math.round(maxDisplay));
        while(ink.measureText(maximum)>signSize-dp(10)&&ink.getTextSize()>sp(12))ink.setTextSize(ink.getTextSize()-1);
        canvas.drawText(maximum,signX,signY-(ink.ascent()+ink.descent())/2,ink);
        y+=rowHeight;
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
            ink.setTextAlign(Paint.Align.RIGHT);canvas.drawText(NativeUi.distance(data.remainingMeters,imperial),x+width,y,ink);ink.setTextAlign(Paint.Align.LEFT);
        }
        if(!warning.isEmpty()) {
            ink.setTextSize(sp(13));ink.setColor(dark?0xffffd482:0xff3b4350);y+=sp(13)+dp(5);
            String line=warning;while(ink.measureText(line)>width&&line.length()>2)line=line.substring(0,line.length()-1);
            canvas.drawText(line,x,y,ink);
        }
    }
    @Override protected void onDetachedFromWindow(){if(animation!=null)animation.cancel();super.onDetachedFromWindow();}
}
