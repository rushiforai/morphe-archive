package e.e.a;
import org.json.*;import java.util.*;
/** Account-independent folders with stable identities, persisted in one atomic snapshot. */
public final class LocalPlaylistData {
 public final JSONObject data;public final JSONArray folders,videos;
 public LocalPlaylistData(String json)throws JSONException{data=new JSONObject(json);folders=data.optJSONArray("folders")==null?new JSONArray():data.getJSONArray("folders");videos=data.optJSONArray("videos")==null?new JSONArray():data.getJSONArray("videos");data.put("folders",folders).put("videos",videos);}
 public String folder(String name)throws JSONException{String id=UUID.randomUUID().toString();folders.put(new JSONObject().put("id",id).put("name",name));return id;}
 public void removeFolder(String id){if(id==null||id.isEmpty())return;for(int n=folders.length()-1;n>=0;n--)if(id.equals(folders.optJSONObject(n).optString("id")))folders.remove(n);for(int n=0;n<videos.length();n++){JSONObject video=videos.optJSONObject(n);if(video!=null&&id.equals(video.optString("folder")))video.remove("folder");}}
 public boolean hasFolder(String id){if(id.isEmpty())return true;for(int n=0;n<folders.length();n++)if(id.equals(folders.optJSONObject(n).optString("id")))return true;return false;}
 public void add(String folder,String url,String title,String owner,String image)throws JSONException{if(!hasFolder(folder))throw new JSONException("Missing folder");String id=HistoryRules.id(url);if(id==null||!id.matches("(?:sm|nm|so|ss)?[0-9]+"))throw new JSONException("Invalid video");for(int n=0;n<videos.length();n++){JSONObject v=videos.getJSONObject(n);if(folder.equals(v.optString("folder"))&&id.equals(v.optString("videoId")))return;}videos.put(new JSONObject().put("id",UUID.randomUUID().toString()).put("folder",folder).put("videoId",id).put("url","https://www.nicovideo.jp/watch/"+id).put("title",title).put("owner",owner).put("thumbnail",image).put("date",System.currentTimeMillis()));}
 public void delete(Set<String> ids){for(int n=videos.length()-1;n>=0;n--)if(ids.contains(videos.optJSONObject(n).optString("id")))videos.remove(n);}
 public void move(Set<String> ids,String folder)throws JSONException{if(!hasFolder(folder))throw new JSONException("Missing folder");Set<String> existing=new HashSet<>();for(int n=0;n<videos.length();n++){JSONObject v=videos.getJSONObject(n);if(folder.equals(v.optString("folder"))&&!ids.contains(v.optString("id")))existing.add(v.optString("videoId"));}for(int n=videos.length()-1;n>=0;n--){JSONObject v=videos.getJSONObject(n);if(ids.contains(v.optString("id"))){if(!existing.add(v.optString("videoId")))videos.remove(n);else v.put("folder",folder);}}}
 public String toString(){return data.toString();}
}
