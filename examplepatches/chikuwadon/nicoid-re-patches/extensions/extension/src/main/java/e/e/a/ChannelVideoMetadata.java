package e.e.a;
import org.json.JSONObject;

/** Fill fields omitted by channel RSS from the existing watch-metadata API. */
final class ChannelVideoMetadata {
 static final class Result {
  final String requestedId;final JSONObject response;
  Result(String requestedId,JSONObject response){this.requestedId=requestedId;this.response=response;}
 }
 static String apiUrl(String id, boolean guest) {
  if(!id.matches("(?:sm|nm|so)?[0-9]+"))throw new IllegalArgumentException("Invalid video ID");
  return "https://www.nicovideo.jp/api/watch/"+(guest?"v3_guest/":"v3/")+id+"?actionTrackId=AAAAAAAAAA_"+System.currentTimeMillis();
 }
 static Result fetch(ChannelFeed.Video item,NetworkTask task)throws Exception {
  String requestedId=item.id;
  boolean guest=!VideoDetails.cookie().contains("user_session=");
  try{return new Result(requestedId,VideoDetails.request(apiUrl(requestedId,guest),"GET",!guest,task));}
  catch(Exception failure){if(guest||task.cancelled())throw failure;return new Result(requestedId,VideoDetails.request(apiUrl(requestedId,true),"GET",false,task));}
 }
 static boolean applyFetched(ChannelFeed.Video item,Result result){
  if(!item.id.equals(result.requestedId))return false;
  JSONObject watch=DetailData.watchData(result.response),video=watch.optJSONObject("video");
  if(video==null)return false;
  // Numeric channel watch URLs can resolve to an so ID without echoing the alias.
  // Accept it only from the response bound to this exact request, never cached data.
  if(!DetailData.matchesWatch(watch,item.id)&&!(item.id.matches("[0-9]+")&&video.optString("id").matches("so[0-9]+")))return false;
  return applyVideo(item,video);
 }
 static boolean apply(ChannelFeed.Video item, JSONObject response) {
  JSONObject watch=DetailData.watchData(response);
  if(!DetailData.matchesWatch(watch,item.id))return false;
  JSONObject video=watch.optJSONObject("video");
  return applyVideo(item,video);
 }
 private static boolean applyVideo(ChannelFeed.Video item,JSONObject video){
  String image=DetailData.thumbnail(video);
  if(image.startsWith("https://"))item.image=image;
  JSONObject count=video.optJSONObject("count");
  if(count!=null&&count.has("view")&&count.has("comment")&&count.has("mylist"))
   item.counts="再生数:"+count.optLong("view")+" コメント:"+count.optLong("comment")+" マイリスト:"+count.optLong("mylist");
  return true;
 }
}
