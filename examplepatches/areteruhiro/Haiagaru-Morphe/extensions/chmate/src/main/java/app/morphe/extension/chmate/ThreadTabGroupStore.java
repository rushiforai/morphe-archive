package app.morphe.extension.chmate;

import org.json.*;
import java.util.*;

/** Versioned local metadata only. Native tabs remain ChMate's responsibility. */
final class ThreadTabGroupStore {
    static String encode(ThreadTabGroups state)throws JSONException{
        JSONObject data=new JSONObject().put("version",1).put("display",state.display.name()).put("expanded",state.expanded);
        data.put("order",new JSONArray(state.order()));JSONArray groups=new JSONArray();
        for(ThreadTabGroups.Group group:state.groups())groups.put(new JSONObject()
                .put("id",group.id).put("name",group.name).put("color",group.color)
                .put("active",group.active).put("tabs",new JSONArray(group.tabs)));
        return data.put("groups",groups).toString();
    }
    static ThreadTabGroups decode(String text)throws JSONException{
        ThreadTabGroups state=new ThreadTabGroups();
        if(text==null||text.isEmpty())return state;
        JSONObject data=new JSONObject(text);
        if(data.getInt("version")!=1)throw new JSONException("Unknown tab group format");
        state.reconcile(strings(data.getJSONArray("order")));
        state.display="ONE_ROW".equals(data.optString("display"))?ThreadTabGroups.Display.ONE_ROW:ThreadTabGroups.Display.TWO_ROWS;
        JSONArray groups=data.getJSONArray("groups");
        for(int i=0;i<groups.length();i++){
            JSONObject group=groups.getJSONObject(i);
            state.restore(group.getString("id"),group.getString("name"),group.getInt("color"),
                    strings(group.getJSONArray("tabs")),group.optString("active"));
        }
        String expanded=data.optString("expanded",null);
        for(ThreadTabGroups.Group group:state.groups())if(group.id.equals(expanded))state.expanded=expanded;
        return state;
    }
    private static List<String> strings(JSONArray values)throws JSONException{
        List<String> result=new ArrayList<>();for(int i=0;i<values.length();i++)result.add(values.getString(i));return result;
    }
}
