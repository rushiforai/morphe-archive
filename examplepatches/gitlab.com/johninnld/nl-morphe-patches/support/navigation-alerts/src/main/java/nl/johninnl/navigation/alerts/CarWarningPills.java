package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.SystemClock;
import java.util.List;
import java.util.Locale;

/**
 * App-rendered, independent pills bounded by the current host-supplied visible area: warning and
 * average-zone pills, and below them one speed pill (speed-limit sign and current speed). Maps and
 * Vela draw the same stack on the phone and on every car display, at the mockup pack's 218x70 size.
 */
public final class CarWarningPills {
    private CarWarningPills() {}
    public static final float WIDTH=218,HEIGHT=WIDTH*70f/218f,GAP=12;
    private static float u(float value){return value*WIDTH/218f;}
    public static float height(boolean zone,int warnings){return height(zone,warnings,false);}
    public static float height(boolean zone,int warnings,boolean speed){int count=(zone?1:0)+warnings+(speed?1:0);return count==0?0:count*HEIGHT+(count-1)*GAP;}
    /** The current speed's readout, number then unit; unknown is a dash, never zero. */
    public static String speedLabel(Double speedKmh,boolean imperial){
        String unit=imperial?" mph":" km/h";
        if(speedKmh==null||!Double.isFinite(speedKmh)||speedKmh<0)return "—"+unit;
        return Math.round(imperial?speedKmh/1.609344:speedKmh)+unit;
    }
    /** The sign's number; an unknown limit stays a dash, never zero or a guessed default. */
    public static String limitLabel(Double limitKmh,boolean imperial){
        return limitKmh==null||!Double.isFinite(limitKmh)||limitKmh<=0?"—":String.valueOf(Math.round(imperial?limitKmh/1.609344:limitKmh));
    }
    /** More than 5 km/h over a known limit, as the earlier combined badge marked it. */
    public static boolean overspeed(Double speedKmh,Double limitKmh){
        return speedKmh!=null&&limitKmh!=null&&Double.isFinite(speedKmh)&&Double.isFinite(limitKmh)&&limitKmh>0&&speedKmh>limitKmh+5;
    }
    public static boolean zoneEvent(WarningEvent event){return (WarningPreferences.categoryOf(event)==WarningPreferences.ZONE||IndicatorContract.kind(event)==IndicatorContract.Kind.AVERAGE_SPEED)&&event.phase!=WarningEvent.Phase.EXIT&&!Boolean.TRUE.equals(event.fields().get("native_zone_alarm"));}
    public static String distance(Integer meters,boolean imperial){
        if(meters==null||meters<0)return "—";
        if(imperial)return meters<304.8?Math.round(meters*3.28084)+" ft":String.format(Locale.getDefault(),"%.1f mi",meters/1609.344);
        return meters<1000?meters+" m":String.format(Locale.getDefault(),"%.1f km",meters/1000d);
    }
    public static boolean fresh(Long at,long now){return WarningGeometry.fresh(at,now);}
    public static Float approachProgress(WarningEvent event,long now){
        WarningGeometry geometry=WarningGeometry.fromNative(event,now);return geometry==null?null:geometry.progress(event,now);
    }
    public static String relation(WarningEvent event,boolean dutch){
        return event.category.equals("emergency_vehicle")&&event.relationship.equals("behind")?(dutch?"Van achteren":"Behind"):"";
    }
    public static String relation(WarningEvent event,boolean dutch,long now){return WarningGeometry.relationshipKnown(event,now)?relation(event,dutch):"";}
    public static void draw(Context context,Canvas canvas,RectF area,float requestedScale,boolean dark,boolean imperial,
            boolean zone,Double averageKmh,Double limitKmh,Double progress,int remaining,boolean estimated,List<WarningEvent> events){
        draw(context,canvas,area,requestedScale,dark,imperial,zone,averageKmh,limitKmh,progress,remaining,estimated,events,null);
    }
    public static void draw(Context context,Canvas canvas,RectF area,float requestedScale,boolean dark,boolean imperial,
            boolean zone,Double averageKmh,Double limitKmh,Double progress,int remaining,boolean estimated,List<WarningEvent> events,Typeface nativeTypeface){
        draw(context,canvas,area,requestedScale,dark,imperial,zone,averageKmh,limitKmh,progress,remaining,estimated,events,nativeTypeface,null);
    }
    public static void draw(Context context,Canvas canvas,RectF area,float requestedScale,boolean dark,boolean imperial,
            boolean zone,Double averageKmh,Double limitKmh,Double progress,int remaining,boolean estimated,List<WarningEvent> events,Typeface nativeTypeface,java.util.Map<String,WarningGeometry> geometry){
        draw(context,canvas,area,requestedScale,dark,imperial,zone,averageKmh,limitKmh,progress,remaining,estimated,events,nativeTypeface,geometry,false);
    }
    /** Untyped legacy warnings keep an icon/placeholder; their prose stays in speech/accessibility. */
    public static void draw(Context context,Canvas canvas,RectF area,float requestedScale,boolean dark,boolean imperial,
            boolean zone,Double averageKmh,Double limitKmh,Double progress,int remaining,boolean estimated,List<WarningEvent> events,Typeface nativeTypeface,java.util.Map<String,WarningGeometry> geometry,boolean untypedWarning){
        draw(context,canvas,area,requestedScale,dark,imperial,zone,averageKmh,limitKmh,progress,remaining,estimated,events,nativeTypeface,geometry,untypedWarning,false,null);
    }
    /**
     * The whole stack, bottom-right in [area] and scaled down uniformly when it does not fit. With
     * [speed] the speed pill is its bottom row: limit sign from [limitKmh], readout from [speedKmh].
     */
    public static void draw(Context context,Canvas canvas,RectF area,float requestedScale,boolean dark,boolean imperial,
            boolean zone,Double averageKmh,Double limitKmh,Double progress,int remaining,boolean estimated,List<WarningEvent> events,Typeface nativeTypeface,java.util.Map<String,WarningGeometry> geometry,boolean untypedWarning,
            boolean speed,Double speedKmh){
        int warnings=events.size()+(untypedWarning?1:0),count=warnings+(zone?1:0)+(speed?1:0);if(count==0||area.isEmpty())return;
        float scale=Math.min(requestedScale,Math.min(area.width()/WIDTH,area.height()/height(zone,warnings,speed)));
        if(scale<.5f)return;
        int saved=canvas.save();canvas.clipRect(area);
        float left=area.right-WIDTH*scale,top=area.bottom-height(zone,warnings,speed)*scale;
        canvas.translate(left,top);canvas.scale(scale,scale);
        Paint text=new Paint(Paint.ANTI_ALIAS_FLAG),fill=new Paint(Paint.ANTI_ALIAS_FLAG);
        Typeface face=Typeface.create(nativeTypeface,Typeface.NORMAL);
        long now=SystemClock.elapsedRealtime();
        for(WarningEvent event:events){
            card(canvas,fill,dark);WarningIcons.draw(context,canvas,event,iconSlot());
            WarningGeometry point=geometry==null?WarningGeometry.fromNative(event,now):geometry.get(event.warningId);
            boolean known=point!=null&&fresh(point.observedAt,now);
            String value=IndicatorContract.valueText(event,imperial);
            // Native warning prose is for speech/accessibility, never a clipped car readout.
            IndicatorContract.Kind kind=IndicatorContract.kind(event);
            boolean nonspatial=kind==IndicatorContract.Kind.MAXIMUM_SPEED||kind==IndicatorContract.Kind.SPEED_130;
            String label=nonspatial?(value==null?"—":value):known?distance(point.distanceMeters,imperial):"—";
            readout(canvas,text,label,face,dark);
            Float fraction=point==null||nonspatial?null:point.progress(event,now);
            if(fraction==null&&known&&!nonspatial)fraction=approach(event,point.distanceMeters);
            if(fraction!=null)bar(canvas,fill,fraction,dark);
            canvas.translate(0,HEIGHT+GAP);
        }
        if(untypedWarning){
            card(canvas,fill,dark);WarningIcons.drawKey(context,canvas,"incident",iconSlot());
            readout(canvas,text,"—",face,dark);canvas.translate(0,HEIGHT+GAP);
        }
        if(zone){
            card(canvas,fill,dark);WarningIcons.drawKey(context,canvas,"average_speed",iconSlot());
            String average=averageKmh==null||!Double.isFinite(averageKmh)||averageKmh<0?"—":String.valueOf(Math.round(imperial?averageKmh/1.609344:averageKmh));
            readout(canvas,text,average+(imperial?" mph":" km/h"),face,dark);
            // This is section distance progress, independent of every approach event/span.
            Float section=progress!=null&&Double.isFinite(progress)&&progress>=0&&progress<=100?progress.floatValue()/100f:null;
            bar(canvas,fill,section,dark);
            canvas.translate(0,HEIGHT+GAP);
        }
        if(speed)speedPill(canvas,text,fill,face,dark,imperial,speedKmh,limitKmh);
        canvas.restoreToCount(saved);
    }
    /** The speed pill alone at ([left],[top]), [scale] pixels per unit. */
    public static void drawSpeed(Canvas canvas,float left,float top,float scale,boolean dark,boolean imperial,Double speedKmh,Double limitKmh,Typeface nativeTypeface){
        int saved=canvas.save();canvas.translate(left,top);canvas.scale(scale,scale);
        speedPill(canvas,new Paint(Paint.ANTI_ALIAS_FLAG),new Paint(Paint.ANTI_ALIAS_FLAG),Typeface.create(nativeTypeface,Typeface.NORMAL),dark,imperial,speedKmh,limitKmh);
        canvas.restoreToCount(saved);
    }
    private static void speedPill(Canvas canvas,Paint text,Paint fill,Typeface face,boolean dark,boolean imperial,Double speedKmh,Double limitKmh){
        card(canvas,fill,dark);
        // The limit sign takes the icon slot: white disc, red ring when known, grey with a dash when not.
        RectF slot=iconSlot();float cx=slot.centerX(),cy=slot.centerY(),radius=slot.width()/2,ring=u(5);
        boolean known=limitKmh!=null&&Double.isFinite(limitKmh)&&limitKmh>0;
        fill.setStyle(Paint.Style.FILL);fill.setColor(0xffffffff);canvas.drawCircle(cx,cy,radius,fill);
        fill.setStyle(Paint.Style.STROKE);fill.setStrokeWidth(ring);fill.setColor(known?0xffd32f2f:0xff8993a0);
        canvas.drawCircle(cx,cy,radius-ring/2,fill);fill.setStyle(Paint.Style.FILL);
        String sign=limitLabel(limitKmh,imperial);
        Paint number=new Paint(text);number.setTypeface(Typeface.create(face,Typeface.BOLD));number.setColor(0xff111111);number.setTextAlign(Paint.Align.CENTER);
        number.setTextSize(u(sign.length()>2?20:24));float room=(radius-ring)*1.6f;
        if(number.measureText(sign)>room)number.setTextSize(number.getTextSize()*room/number.measureText(sign));
        Paint.FontMetrics metrics=number.getFontMetrics();canvas.drawText(sign,cx,cy-(metrics.ascent+metrics.descent)/2,number);
        text.setTypeface(face);text.setColor(overspeed(speedKmh,limitKmh)?0xffe8514a:dark?0xffffffff:0xff242424);
        distanceLabel(canvas,text,speedLabel(speedKmh,imperial),u(44));
    }
    /** Distance at which each warning was first drawn (its largest), by warning; bounded. */
    private static final java.util.Map<String,Integer> FIRST_SHOWN=new java.util.LinkedHashMap<String,Integer>(16,.75f,true){
        @Override protected boolean removeEldestEntry(java.util.Map.Entry<String,Integer> eldest){return size()>64;}
    };
    /**
     * Approach line when the provider gives no visual span or trigger: progress from the distance at
     * which the pill first appeared (the mockup's approach_distance) to the point itself.
     */
    static synchronized Float approach(WarningEvent event,Integer meters){
        if(meters==null||meters<0)return null;
        String key=event.warningId;
        Integer span=FIRST_SHOWN.get(key);
        if(span==null||meters>span){FIRST_SHOWN.put(key,meters);span=meters;}
        return span<=0?null:Math.max(0,Math.min(1,1f-meters/span.floatValue()));
    }
    static synchronized void resetApproachForTest(){FIRST_SHOWN.clear();}
    private static RectF iconSlot(){return new RectF(u(14),u(9),u(66),u(61));}
    private static void readout(Canvas canvas,Paint text,String label,Typeface face,boolean dark){
        text.setTypeface(face);text.setColor(dark?0xffffffff:0xff242424);distanceLabel(canvas,text,label,u(37));
    }
    private static void distanceLabel(Canvas canvas,Paint text,String label,float baseline){
        int split=label.lastIndexOf(' ');String number=split<0?label:label.substring(0,split),unit=split<0?"":label.substring(split+1);
        float size=u(30),numberWidth,unitWidth,gap=unit.isEmpty()?0:u(5),width=u(128);
        do{text.setTextSize(size);numberWidth=text.measureText(number);text.setTextSize(size*16f/30f);unitWidth=text.measureText(unit);if(numberWidth+unitWidth+gap<=width||size<=u(20))break;size--;}while(true);
        float x=u(76)+(width-numberWidth-unitWidth-gap)/2;text.setTextAlign(Paint.Align.LEFT);text.setTextSize(size);canvas.drawText(number,x,baseline,text);
        if(!unit.isEmpty()){text.setTextSize(size*16f/30f);canvas.drawText(unit,x+numberWidth+gap,baseline,text);}
    }
    private static void card(Canvas c,Paint p,boolean dark){p.setColor(dark?0xff20242b:0xffffffff);p.setShadowLayer(2,0,1,0x40000000);c.drawRoundRect(new RectF(1,1,WIDTH-1,HEIGHT-1),HEIGHT/2,HEIGHT/2,p);p.clearShadowLayer();}
    private static void bar(Canvas c,Paint p,Float progress,boolean dark){
        float left=u(76),right=u(204),top=u(49),bottom=u(53),radius=u(2);
        p.setColor(dark?0xff697486:0xffd5d6d7);c.drawRoundRect(new RectF(left,top,right,bottom),radius,radius,p);
        if(progress!=null){p.setColor(0xff1686ff);c.drawRoundRect(new RectF(left,top,left+(right-left)*Math.max(0,Math.min(1,progress)),bottom),radius,radius,p);}
    }
}
