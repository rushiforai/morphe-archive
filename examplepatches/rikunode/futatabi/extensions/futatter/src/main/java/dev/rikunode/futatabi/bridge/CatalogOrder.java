package dev.rikunode.futatabi.bridge;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/** Stock OrderMode mapping verified in CatalogProvider's AOT. */
final class CatalogOrder {
    static int fromPath(String path) {
        int q=path.indexOf('?');
        if(q<0)return 0;
        for(String part:path.substring(q+1).split("&")){
            switch(part){
                case "sort=1":return 1;
                case "sort=2":return 2;
                case "sort=3":return 3;
                case "sort=4":return 4;
                case "sort=6":return 6;
                case "sort=8":return 8;
            }
        }
        return 0;
    }
    static String aimoge(int sort) {
        switch(sort){
            case 1:return "new";
            case 2:return "old";
            case 3:return "replies";
            case 6:return "momentum";
            case 8:return "soudane";
            default:return "bump";
        }
    }
    static JSONArray replies(JSONArray rows,int sort) throws Exception {
        if(sort!=3&&sort!=4)return rows;
        List<JSONObject> ordered=new ArrayList<>();
        for(int i=0;i<rows.length();i++)ordered.add(rows.getJSONObject(i));
        Comparator<JSONObject> comparator=Comparator.comparingInt(row->row.optInt("replies",row.optInt("replyCount",0)));
        ordered.sort(sort==3?comparator.reversed():comparator);
        JSONArray result=new JSONArray();
        for(JSONObject row:ordered)result.put(row);
        return result;
    }
}
