package e.e.a;
import org.json.*;
final class DetailData {
 static JSONObject watchData(JSONObject response){JSONObject d=response.optJSONObject("data");if(d==null)return new JSONObject();JSONObject page=d.optJSONObject("response");return page==null?d:page;}
 static String target(JSONObject item){String watch=item.optString("watchURL","");if(watch.matches("https?://(?:www\\.)?nicovideo\\.jp/watch/(?:sm|nm|so)?[0-9]+.*"))return watch.replace("http://","https://");String id=item.optString("globalId",item.optString("watchId",item.optString("id","")));if(id.matches("(?:sm|nm|so)[0-9]+")||item.optString("contentKind").equals("video")&&id.matches("[0-9]+"))return "https://www.nicovideo.jp/watch/"+id;return watch.isEmpty()?"https://commons.nicovideo.jp/works/"+id:watch;}
 static String thumbnail(JSONObject item){String direct=item.optString("thumbnailURL",item.optString("thumbnailUrl",""));JSONObject t=item.optJSONObject("thumbnail");if(t!=null)for(String k:new String[]{"url","middleUrl","listingUrl"}){String v=t.optString(k,"");if(v.startsWith("https://"))return v;}return direct;}
}
