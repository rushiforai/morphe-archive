package nl.johninnl.vela;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.RectF;
import android.view.View;
import nl.johninnl.navigation.alerts.CarWarningPills;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningGeometry;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Phone counterpart of the Android Auto layout, in Vela's existing speed-widget slot: the shared
 * mockup-pack stack, warning pills above the speed pill (limit sign and current speed).
 */
public final class CompactSpeedView extends View {
    static final float SHADOW=3;
    private TelemetryStore.View data=TelemetryStore.View.empty("");
    private Float current;
    private Double limit;
    private boolean imperial,dark=true,untyped;
    private String warning="";
    private List<WarningEvent> events=Collections.emptyList();
    private Map<String,WarningGeometry> geometry=Collections.emptyMap();
    private float shownMps;
    private ValueAnimator animation;
    private final float density;
    private int bottomClearance;
    public CompactSpeedView(Context context) {
        super(context);density=getResources().getDisplayMetrics().density;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
    }
    public void refresh(boolean dark) {
        bottomClearance=TelemetryRuntime.phoneBottomClearanceDp();
        TelemetryStore.View view=TelemetryRuntime.view();
        // Same selection as the car frame: preferences, passed/off-route filtering, zone events in the zone pill.
        List<WarningEvent> all=TelemetryRuntime.carWarnings(),shown=new java.util.ArrayList<>();
        for(WarningEvent event:all)if(!view.zoneActive||!CarWarningPills.zoneEvent(event))shown.add(event);
        Map<String,WarningGeometry> points=new java.util.HashMap<>();long now=android.os.SystemClock.elapsedRealtime();
        for(WarningEvent event:shown)points.put(event.warningId,TelemetryRuntime.carWarningGeometry(event,now));
        boolean legacy=all.isEmpty()&&!TelemetryRuntime.compactCarWarningText().isEmpty();
        bind(view,TelemetryRuntime.phoneSpeedValue(),TelemetryRuntime.phoneLimitValue(),NativeUi.imperial(),dark,TelemetryRuntime.compactWarningText(),shown,points,legacy);
    }
    void bind(TelemetryStore.View snapshot,Float mps,Double maximum,boolean imperial,boolean dark,String warning) {
        bind(snapshot,mps,maximum,imperial,dark,warning,Collections.emptyList(),Collections.emptyMap(),!warning.isEmpty());
    }
    /** {@code warning} is the full source prose for accessibility; the pills never print it. */
    void bind(TelemetryStore.View snapshot,Float mps,Double maximum,boolean imperial,boolean dark,String warning,
            List<WarningEvent> events,Map<String,WarningGeometry> geometry,boolean untyped) {
        Float old=current;data=snapshot;current=mps;limit=maximum;this.imperial=imperial;this.dark=dark;this.warning=warning;
        this.events=events;this.geometry=geometry;this.untyped=untyped;
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
        StringBuilder out=new StringBuilder(speed).append(", ").append(maximum).append(average);
        if(!warning.isEmpty())out.append(", ").append(warning);
        long now=android.os.SystemClock.elapsedRealtime();
        for(WarningEvent event:events){
            String message=nl.johninnl.navigation.alerts.WarningView.carMessage(event);
            if(!warning.contains(message))out.append(", ").append(message);
            WarningGeometry point=geometry.get(event.warningId);
            if(point!=null&&WarningGeometry.fresh(point.observedAt,now))out.append(" · ").append(point.estimated?"≈":"").append(CarWarningPills.distance(point.distanceMeters,imperial));
        }
        return out.toString();
    }
    private int warnings(){return events.size()+(untyped?1:0);}
    private float stackHeight(){return CarWarningPills.height(data.zoneActive,warnings(),true)*density;}
    private float dp(float value){return value*density;}
    @Override protected void onMeasure(int widthSpec,int heightSpec) {
        float width=CarWarningPills.WIDTH+2*SHADOW;
        float height=stackHeight()+dp(2*SHADOW+bottomClearance);
        setMeasuredDimension(resolveSize((int)Math.ceil(dp(width)),widthSpec),resolveSize((int)Math.ceil(height),heightSpec));
    }
    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        float x=dp(SHADOW),y=dp(SHADOW);
        Double speed=current==null?null:(double)shownMps*3.6;
        CarWarningPills.draw(getContext(),canvas,new RectF(x,y,x+dp(CarWarningPills.WIDTH),y+stackHeight()),density,dark,imperial,
            data.zoneActive,data.averageKmh,limit,data.progressPercent,data.remainingMeters,data.progressEstimated,events,null,geometry,untyped,true,speed);
    }
    @Override protected void onDetachedFromWindow(){if(animation!=null)animation.cancel();super.onDetachedFromWindow();}
}
