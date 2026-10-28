package e.e.a;
import org.json.*;import java.util.*;
/** Persist descriptors, never live Views, account credentials or fetched pages. */
final class SavedTabs227 {
 static final int MAX=64;final ArrayList<Tab> tabs=new ArrayList<Tab>();String selected="";
 static final class Tab {String id=UUID.randomUUID().toString(),label="",url="",item="",subtitle="",screen="list";int kind,type,folder=-1,position,top;Tab(){}Tab(JSONObject j){id=j.optString("id",id);label=j.optString("label");url=j.optString("url");item=j.optString("item");subtitle=j.optString("subtitle");screen=j.optString("screen",kind==2?"playlist":"list");kind=j.optInt("kind");if(!j.has("screen")&&kind==2)screen="playlist";type=j.optInt("type");folder=j.optInt("folder",-1);position=Math.max(0,j.optInt("position"));top=j.optInt("top");}JSONObject json()throws JSONException{return new JSONObject().put("id",id).put("label",label).put("url",url).put("item",item).put("subtitle",subtitle).put("screen",screen).put("kind",kind).put("type",type).put("folder",folder).put("position",position).put("top",top);}}
 SavedTabs227(String text){try{JSONObject j=new JSONObject(text);JSONArray a=j.optJSONArray("tabs");if(a!=null)for(int n=0;n<Math.min(MAX,a.length());n++){JSONObject row=a.optJSONObject(n);if(row==null)continue;Tab t=new Tab(row);if(t.id.isEmpty()||t.kind<0||t.kind>3||!Arrays.asList("list","playlist","mypage","nicorepo","mylist","following","cache").contains(t.screen)||find(t.id)!=null)continue;tabs.add(t);}selected=j.optString("selected");if(find(selected)==null)selected=tabs.isEmpty()?"":tabs.get(0).id;}catch(JSONException ignored){}}
 Tab find(String id){for(Tab t:tabs)if(t.id.equals(id))return t;return null;}
 void add(Tab tab){if(tabs.size()>=MAX)throw new IllegalStateException("Tab limit");tabs.add(tab);selected=tab.id;}
 void remove(String id){int at=-1;for(int n=0;n<tabs.size();n++)if(tabs.get(n).id.equals(id)){at=n;break;}if(at<0)return;tabs.remove(at);if(selected.equals(id))selected=tabs.isEmpty()?"":tabs.get(Math.min(at,tabs.size()-1)).id;}
 String save(){try{JSONArray a=new JSONArray();for(Tab t:tabs)a.put(t.json());return new JSONObject().put("tabs",a).put("selected",selected).toString();}catch(JSONException e){throw new IllegalStateException(e);}}
}
