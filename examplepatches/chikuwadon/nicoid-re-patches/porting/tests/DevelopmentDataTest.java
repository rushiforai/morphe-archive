package e.e.a;
import java.util.*;import org.json.*;
public final class DevelopmentDataTest {
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[] args)throws Exception{
  LocalPlaylistData data=new LocalPlaylistData("{}");String a=data.folder("A"),b=data.folder("B");
  data.add(a,"https://www.nicovideo.jp/watch/sm9","First","Owner","https://example.com/a.jpg");
  data.add(a,"sm9","Duplicate","Owner","");check(data.videos.length()==1,"duplicate in same folder is ignored");
  data.add(b,"sm9","Same video in another folder","Owner","");data.add(a,"ss10","Short","Other","");data.add(a,"so11","Channel video","Channel","");
  Set<String> selected=new HashSet<>();selected.add(data.videos.getJSONObject(0).getString("id"));selected.add(data.videos.getJSONObject(2).getString("id"));
  data.move(selected,b);check(data.videos.length()==3,"moving duplicate merges the destination entry");
  check(b.equals(data.videos.getJSONObject(1).getString("folder")),"batch move changes the surviving short's folder");
  LocalPlaylistData restored=new LocalPlaylistData(data.toString());check(restored.folders.length()==2&&restored.videos.length()==3,"folder and video identity survive serialization");
  String snapshot=restored.toString();try{restored.move(selected,"missing");throw new AssertionError("missing target accepted");}catch(JSONException expected){}
  check(snapshot.equals(restored.toString()),"invalid destination preserves all data");
  Set<String> remove=new HashSet<>();for(int n=0;n<restored.videos.length();n++)if(b.equals(restored.videos.getJSONObject(n).getString("folder")))remove.add(restored.videos.getJSONObject(n).getString("id"));
  restored.delete(remove);check(restored.videos.length()==1&&restored.folders.length()==2,"batch deletion preserves other videos and folders");restored.delete(remove);check(restored.videos.length()==1,"repeated deletion is safe");
  check(SeekRules.target(20000,120000,1,60)==80000,"60-second seek is not capped at 30");
  check(SeekRules.target(20000,120000,1,0)==20000,"disabled seek does not move playback");
  for(int seconds=1;seconds<=60;seconds++)check(SeekRules.seconds(SeekRules.progress(seconds))==seconds,"one-second slider increments");
  check(SeekRules.seconds(0)==0&&SeekRules.progress(0)==0,"disabled is the leftmost slider position");
  check(ChannelFeed.channelId("user/http://ch.nicovideo.jp/ch2650274").equals("ch2650274"),"legacy user/channel route reaches the channel listing");
  check(ChannelFeed.channelId("https://ch.nicovideo.jp/ch2650274/video").equals("ch2650274"),"direct channel route");
  check(ChannelFeed.channelId("https://example.com/ch2650274").isEmpty(),"ordinary user link is not redirected");
  check(SeekRules.target(5000,100000,-1,10)==0,"rewind stops at zero");check(SeekRules.target(99000,100000,1,30)==100000,"forward stops at the end");check(SeekRules.target(20000,100000,1,5)==25000,"configured seconds are applied");
  JSONObject video=new JSONObject().put("video",new JSONObject().put("id","so11")).put("client",new JSONObject().put("watchId","1234"));
  for(JSONObject response:new JSONObject[]{new JSONObject().put("data",video),new JSONObject().put("data",new JSONObject().put("response",video)),new JSONObject().put("data",new JSONObject().put("response",new JSONObject().put("data",video)))})check("so11".equals(DetailData.watchData(response).getJSONObject("video").getString("id")),"all watch response envelopes expose metadata");
  check(DetailData.matchesWatch(video,"1234")&&!DetailData.matchesWatch(video,"sm9"),"watch aliases match without leaking another video's metadata");
  check("https://www.nicovideo.jp/watch/ss10".equals(DetailData.target(new JSONObject().put("id","ss10"))),"short works open as videos");
  String feed="<?xml version='1.0'?><rss><channel><item><title>A &amp; B</title><link>http://www.nicovideo.jp/watch/1234</link><description><![CDATA[<img src='https://cdn.example.com/1.jpg'/><strong class='nico-info-length'>1:02</strong>]]></description></item><item><title>duplicate</title><link>https://www.nicovideo.jp/watch/1234</link></item><item><title>invalid</title><link>https://other.example/watch/sm9</link></item></channel></rss>";
  List<ChannelFeed.Video> parsed=ChannelFeed.parse(feed);check(parsed.size()==1&&"A & B".equals(parsed.get(0).title)&&"1:02".equals(parsed.get(0).length),"channel feed decodes titles, numeric watch IDs, thumbnails and durations");
  String richFeed="<rss xmlns:media='http://search.yahoo.com/mrss/'><channel><item><title>Channel upload</title><link>https://www.nicovideo.jp/watch/1235</link><pubDate>Tue, 06 Oct 2026 22:00:00 +0900</pubDate><media:thumbnail url='https://cdn.example.com/thumb.jpg'/><description><![CDATA[<strong class='nico-info-length'>12:34</strong><span>再生：1,234</span><span>コメント：56</span><span>マイリスト：78</span>]]></description></item></channel></rss>";
  ChannelFeed.Video rich=ChannelFeed.parse(richFeed).get(0);check("https://cdn.example.com/thumb.jpg".equals(rich.image)&&rich.date.contains("2026年10月06日 22時00分")&&rich.date.endsWith("投稿"),"channel thumbnails and dates use the ordinary list format");check("再生数:1,234 コメント:56 マイリスト:78".equals(rich.counts),"channel RSS counters feed the shared native count row");
  JSONObject channelWatch=new JSONObject().put("data",new JSONObject().put("client",new JSONObject().put("watchId","1235")).put("video",new JSONObject().put("id","so1235").put("thumbnail",new JSONObject().put("url","https://cdn.example.com/current.jpg")).put("count",new JSONObject().put("view",12345).put("comment",678).put("mylist",90))));
  check(ChannelVideoMetadata.apply(rich,channelWatch)&&"https://cdn.example.com/current.jpg".equals(rich.image)&&"再生数:12345 コメント:678 マイリスト:90".equals(rich.counts),"numeric channel aliases receive current thumbnails and counters from watch metadata");
  check(ChannelVideoMetadata.apiUrl("1235",false).startsWith("https://www.nicovideo.jp/api/watch/v3/1235?"),"channel enrichment uses the same API as working playback, including numeric aliases");
  check(ChannelVideoMetadata.apiUrl("so1235",true).startsWith("https://www.nicovideo.jp/api/watch/v3_guest/so1235?"),"guest metadata has the same fallback as playback");
  channelWatch.getJSONObject("data").getJSONObject("client").put("watchId","999");check(!ChannelVideoMetadata.apply(rich,channelWatch),"another video's metadata never replaces the channel row");
  channelWatch.getJSONObject("data").getJSONObject("client").put("watchId","so1235");
  check(!ChannelVideoMetadata.apply(rich,channelWatch)&&ChannelVideoMetadata.applyFetched(rich,new ChannelVideoMetadata.Result("1235",channelWatch)),"numeric watch aliases accept canonical so responses only when bound to the original request");
  check(!ChannelVideoMetadata.applyFetched(rich,new ChannelVideoMetadata.Result("999",channelWatch)),"a response fetched for another row cannot overwrite this row");
  try{ChannelFeed.parse("<!DOCTYPE rss [<!ENTITY x SYSTEM 'file:///etc/passwd'>]><rss/>");throw new AssertionError("external entity accepted");}catch(java.io.IOException expected){}
  if(args.length>0)check(ChannelFeed.parse(new String(java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(args[0])),"UTF-8")).size()==2,"reported channel feed exposes both uploads");
  System.out.println("Development data regression checks passed");
 }
}
