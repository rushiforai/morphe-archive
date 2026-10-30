package local.maps.cluster;

import java.util.LinkedHashMap;
import java.util.Map;

/** AdapterAmapService protocol for the user's DiLink 5 / Android 12 car; the package is chosen by AmapAdapter.
 * END (KEY_TYPE 10019) carries no TYPE: the adapter's 10019 branch reads only EXTRA_STATE (9 or 12 stops). */
final class BydGuidanceProtocol {
    static final String ACTION="AUTONAVI_STANDARD_BROADCAST_SEND";
    static final int FLAGS=0x01000000;
    static Map<String,Object> message(GuidanceFrame f) {
        Map<String,Object> data=new LinkedHashMap<>();
        data.put("KEY_TYPE",f==null?10019:10001);
        data.put("IS_BYD_MAP",true); data.put("IS_BYD_BAIDU_MAP",false);
        if(f!=null) data.put("TYPE",0);
        data.put("EXTRA_STATE",f==null?9:0);
        data.put("EXTRA_IS_FOREGROUND",f==null?1:0);
        data.put("NEW_ICON",f==null?-1:f.icon);
        if(f!=null)data.put("ROUNG_ABOUT_NUM",f.exit);
        data.put("SEG_REMAIN_DIS",f==null?-1:f.turnMeters);
        data.put("NEXT_ROAD_NAME",f==null?"":f.road);
        data.put("ROUTE_REMAIN_DIS",f==null?-1:f.routeMeters);
        data.put("ROUTE_REMAIN_TIME",f==null?-1:f.routeSeconds);
        return data;
    }
}
