package local.maps.cluster;

import java.lang.reflect.*;

/** Exact schema of AAOS Maps 26.10.120001.E (member names unchanged from 26.09). No UI/bitmap recognition. */
final class MapsGuidanceSource {
    static String diagnostic(Object state) throws ReflectiveOperationException {
        String mode=name(field(state,"c"));
        if(!"GUIDING".equals(mode))return "mode="+mode;
        Object nav=field(field(state,"b"),"a");
        if(nav==null)return "mode=GUIDING nav=unavailable";
        Object progress=call(nav,"d"),step=field(progress,"c");
        Object next=step==null?null:field(step,"J");
        return "mode=GUIDING maneuver="+(step==null?"none":name(field(step,"c")))
            +" turn="+(step==null?"none":angle(number(field(step,"M"))))
            +" step="+(step==null?-1:number(field(step,"g")))+" stepMetres="+(step==null?-1:number(field(step,"k")))
            +" next="+(next==null?"none":name(field(next,"c")))
            +" metres="+number(field(progress,"h"))+" routeMetres="+number(field(progress,"l"))
            +" routeSeconds="+number(call(progress,"c"));
    }
    static GuidanceFrame read(Object state) throws ReflectiveOperationException {
        if(state==null||!"GUIDING".equals(name(field(state,"c"))))return null;
        Object nav=field(field(state,"b"),"a");
        if(nav==null)return null;
        Object progress=call(nav,"d"); // wvk.d: selected guided route progress (wjk).
        if(progress==null || Boolean.TRUE.equals(field(progress,"r")))return null;
        Object step=field(progress,"c");
        if(step==null)return null;
        String maneuver=name(field(step,"c")), side=name(field(step,"d"));
        String angle=angle(number(field(step,"M"))), traffic=name(field(step,"B"));
        int exit=number(field(step,"f")); // Also used as roundabout exit by Maps' Android Auto sender.
        boolean roundabout=maneuver.startsWith("ROUNDABOUT_");
        return new GuidanceFrame(icon(maneuver,side,angle,traffic,exit),roundabout?exit:0,
            number(field(progress,"h")),nextRoad(step),number(field(progress,"l")),
            number(call(progress,"c")));
    }
    private static String angle(int value) {
        // Verified against hir.c's Google maneuver conversion, normal TURN branch.
        switch(value){case 2:return "TURN_SLIGHT";case 3:return "TURN_NORMAL";case 4:return "TURN_SHARP";
            case 5:return "TURN_KEEP";case 6:return "TURN_UTURN";case 7:return "TURN_STRAIGHT";default:return "";}
    }
    static int icon(String maneuver,String side,String angle,String traffic,int exit) {
        boolean left="SIDE_LEFT".equals(side),right="SIDE_RIGHT".equals(side);
        if(maneuver.startsWith("ROUNDABOUT_")) {
            boolean cw="LEFT".equals(traffic),ccw="RIGHT".equals(traffic);
            if(!cw&&!ccw)return 0;
            boolean leaving="ROUNDABOUT_EXIT".equals(maneuver)&&exit<=0;
            return leaving?(cw?18:12):(cw?17:11);
        }
        if("DESTINATION".equals(maneuver))return 15;
        // Maps' own card draws the route start as an up arrow; icon 0 shows as a flag on BYD clusters.
        if("DEPART".equals(maneuver))return 9;
        if("STRAIGHT".equals(maneuver)||"NAME_CHANGE".equals(maneuver))return 9;
        if("UTURN".equals(maneuver)||("TURN".equals(maneuver)&&"TURN_UTURN".equals(angle))) {
            if(left)return 8;if(right)return 19;
            return "RIGHT".equals(traffic)?8:"LEFT".equals(traffic)?19:0;
        }
        if("TURN".equals(maneuver)||"COUNTED_TURN".equals(maneuver)) {
            if("TURN_STRAIGHT".equals(angle))return 9;
            if(!left&&!right)return 0;
            if("TURN_SHARP".equals(angle))return left?6:7;
            if("TURN_SLIGHT".equals(angle)||"TURN_KEEP".equals(angle))return left?4:5;
            return left?2:3;
        }
        if("FORK".equals(maneuver)||"MERGE".equals(maneuver)||"LANE_CHANGE".equals(maneuver)
                ||"ON_RAMP".equals(maneuver)||"OFF_RAMP".equals(maneuver))
            return left?4:right?5:0;
        return 0;
    }
    private static String nextRoad(Object step) throws ReflectiveOperationException {
        // Direct cues contain typed road names, exit numbers and addresses. Send only a road.
        for(String key:new String[]{"t","u"}) {
            Object cues=field(step,key);
            if(!(cues instanceof Iterable))continue;
            for(Object cue:(Iterable<?>)cues) {
                String type=name(call(cue,"b"));
                if("TYPE_TO_ROAD_NAME".equals(type)||"TYPE_TOWARD_ROAD_NAME".equals(type)) {
                    Object text=call(cue,"e");
                    if(text instanceof String&&!((String)text).isEmpty())return (String)text;
                }
            }
        }
        return "";
    }
    private static String name(Object value){return value instanceof Enum?((Enum<?>)value).name():"";}
    private static int number(Object value){return ((Number)value).intValue();}
    private static Object field(Object object,String key) throws ReflectiveOperationException {
        Field f=object.getClass().getDeclaredField(key);f.setAccessible(true);return f.get(object);
    }
    private static Object call(Object object,String key) throws ReflectiveOperationException {
        Method m=object.getClass().getMethod(key);m.setAccessible(true);return m.invoke(object);
    }
}
