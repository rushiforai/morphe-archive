package e.e.a;
import java.io.*;import java.nio.charset.StandardCharsets;import java.util.*;import org.json.*;import org.junit.*;import static org.junit.Assert.*;
public class NicoliveProtocolTest {
 static byte[] v(long n){ByteArrayOutputStream b=new ByteArrayOutputStream();while((n&~127L)!=0){b.write((int)n&127|128);n>>>=7;}b.write((int)n);return b.toByteArray();}
 static byte[] join(byte[]... parts)throws IOException{ByteArrayOutputStream b=new ByteArrayOutputStream();for(byte[] p:parts)b.write(p);return b.toByteArray();}
 static byte[] field(int id,byte[] value)throws IOException{return join(v(id*8+2),v(value.length),value);}
 static byte[] number(int id,long value)throws IOException{return join(v(id*8),v(value));}
 @Test public void rankingAndFollowingKeepOnlyRelevantPrograms()throws Exception{
  JSONObject live=new JSONObject().put("nicoliveProgramId","lv1").put("title","生放送").put("status","ON_AIR");
  JSONObject future=new JSONObject().put("nicoliveProgramId","lv2").put("title","予定").put("status","RELEASED");
  JSONObject ended=new JSONObject().put("nicoliveProgramId","lv3").put("title","終了").put("status","ENDED");
  JSONArray ranking=new JSONArray().put(new JSONObject().put("value",future))
      .put(new JSONObject().put("value",live)).put(new JSONObject().put("value",future));
  JSONObject rank=new JSONObject().put("statusCategory","comingsoon").put("userPrograms",ranking)
      .put("officialAndChannelPrograms",new JSONArray());
  String html="<script id='embedded-data' data-props='"+new JSONObject().put("ranking",rank)+"'></script>";
  List<NicoliveData.Program> programs=NicoliveCatalog.ranking(html,NicoliveCatalog.Broadcast.UPCOMING,true);
  assertEquals(1,programs.size());
  assertEquals("lv2",programs.get(0).id);
  assertTrue(NicoliveCatalog.ranking(html,NicoliveCatalog.Broadcast.UPCOMING,false).isEmpty());
  try{NicoliveCatalog.ranking(html,NicoliveCatalog.Broadcast.ENDED,true);fail();}
  catch(JSONException expected){}

  JSONObject view=new JSONObject().put("favoriteProgramListSectionState",new JSONArray().put(live).put(future))
      .put("favoritePastProgramListSectionState",new JSONArray().put(ended))
      .put("recommendedProgramListSectionState",new JSONArray().put(new JSONObject(live.toString()).put("nicoliveProgramId","lv4")));
  JSONObject props=new JSONObject().put("view",view).put("user",new JSONObject().put("isLoggedIn",true));
  html="<script id='DAT-csr-data' data-value='"+new JSONObject().put("props",props)+"'></script>";
  programs=NicoliveCatalog.followed(html);
  assertEquals(3,programs.size());
  assertTrue(programs.stream().anyMatch(NicoliveData.Program::ended));
 }
 @Test public void accountFeedsParseNestedSchedulesAndReservationCounts()throws Exception{
  JSONObject row=new JSONObject().put("programId","lv101")
      .put("program",new JSONObject().put("title","放送前の番組").put("provider","official")
          .put("schedule",new JSONObject().put("status","released").put("beginTime","2026-11-13T22:00:00+09:00")))
      .put("statistics",new JSONObject().put("timeshiftReservations",1708))
      .put("programProvider",new JSONObject().put("name","番組チャンネル").put("type","official"));
  JSONObject wrapper=new JSONObject().put("reservations",new JSONArray().put(row).put(row));
  String header="<script id='embedded-data' data-props='";
  String footer="'></script>";
  List<NicoliveData.Program> list=NicoliveCatalog.reservations(header+new JSONObject().put("reservations",wrapper)+footer);
  assertEquals(1,list.size());
  NicoliveData.Program p=list.get(0);
  assertTrue(p.scheduled());
  assertEquals(1708,p.reservations);
  assertEquals("番組チャンネル",p.owner);
  assertEquals(java.time.Instant.parse("2026-11-13T13:00:00Z").getEpochSecond(),p.begin);

  JSONObject response=new JSONObject().put("user",new JSONObject().put("isLoggedIn",true))
      .put("domain",new JSONObject().put("followedPrograms",new JSONArray().put(row)));
  assertEquals("lv101",NicoliveCatalog.followed(header+response+footer).get(0).id);
  response.remove("domain");
  try{NicoliveCatalog.followed(header+response+footer);fail();}
  catch(JSONException expected){assertEquals("FOLLOW_LIST_MISSING",expected.getMessage());}
 }
 @Test public void tabletNormalViewportAvoidsDoubleInsets(){
  assertEquals(32,NormalVideoInsets.requiredMargin(0,0,0,32));
  assertEquals(32,NormalVideoInsets.requiredMargin(0,32,32,32));
  assertEquals(0,NormalVideoInsets.requiredMargin(0,32,64,32));
  assertEquals(4,NormalVideoInsets.requiredMargin(4,4,36,32));
 }
 @Test public void urlRoutingAcceptsOnlyLiveIdsAndKnownHosts(){assertEquals("lv123",NicoliveData.id("lv123"));assertEquals("lv123",NicoliveData.id("nicoid-re://live/lv123"));assertEquals("lv123",NicoliveData.id("https://live.nicovideo.jp/watch/lv123?ref=test"));assertEquals("lv123",NicoliveData.id("https://nico.ms/lv123"));assertNull(NicoliveData.id("https://example.com/watch/lv123"));assertNull(NicoliveData.id("https://live.nicovideo.jp.evil.test/watch/lv123"));assertNull(NicoliveData.id("sm123"));assertNull(NicoliveData.id("https://user:pw@live.nicovideo.jp/watch/lv123"));}
 @Test public void historyUsesLandscapeBroadcastThumbnailInsteadOfSmallIcon()throws Exception{
  String url="https://listing-thumbnail.live.nicovideo.jp/?image=prod-lv123/thumbnail.jpg&w=352&h=198";
  JSONObject thumbnail=new JSONObject().put("small","https://nicolive.cdn.nimg.jp/live/simg/img/blank_80x80.jpg")
   .put("huge",new JSONObject().put("s352x198",url).put("s1920x1080","https://listing-thumbnail.live.nicovideo.jp/full"));
  JSONObject program=new JSONObject().put("nicoliveProgramId","lv123").put("thumbnail",thumbnail);
  JSONObject data=new JSONObject().put("program",program).put("site",new JSONObject().put("relive",new JSONObject()));
  String html="<script id='embedded-data' data-props='"+data.toString().replace("&","&amp;")+"'></script>";
  NicoliveData.Program watched=NicoliveData.Program.watch(html,"lv123");
  assertEquals(url,watched.thumbnail);
  assertTrue(watched.programThumbnail);
  assertTrue(NicoliveData.Program.listing(watched.stored()).programThumbnail);
  assertEquals(url,NicoliveData.historyThumbnail(html,"lv123"));
  try{NicoliveData.historyThumbnail(html,"lv124");fail();}catch(IOException expected){}
  JSONObject old=new JSONObject().put("nicoliveProgramId","lv123").put("listingThumbnail",thumbnail.getString("small"));
  assertFalse(NicoliveData.Program.listing(old).programThumbnail);
  assertTrue(NicoliveData.Program.listing(old.put("listingThumbnail",url)).programThumbnail);
  assertEquals("",NicoliveData.broadcastThumbnail(new JSONObject().put("small","fallback")));
 }
 @Test public void programIdentityAndGuestEntitlementsAreNotInvented()throws Exception{String data="{\"program\":{\"nicoliveProgramId\":\"lv123\",\"title\":\"A & B\",\"status\":\"ON_AIR\",\"isChasePlayEnabled\":true},\"site\":{\"relive\":{\"webSocketUrl\":\"wss://a.live2.nicovideo.jp/watch\"}},\"user\":{\"isLoggedIn\":false,\"accountType\":\"non\"}}";String html="<script id='embedded-data' data-props='"+data.replace("&","&amp;")+"'></script>";NicoliveData.Program p=NicoliveData.Program.watch(html,"lv123");assertTrue(p.onAir());assertFalse(p.loggedIn);assertFalse(p.chaseCapable);assertEquals("A & B",p.title);try{NicoliveData.Program.watch(html,"lv999");fail();}catch(IOException expected){}}
 @Test public void framedReaderHandlesShortReadsAndRejectsTruncationAndHugeLengths()throws Exception{byte[] body="hello".getBytes(StandardCharsets.UTF_8);final InputStream input=new FilterInputStream(new ByteArrayInputStream(join(v(body.length),body))){public int read(byte[] b,int off,int length)throws IOException{return super.read(b,off,Math.min(1,length));}};assertArrayEquals(body,NicoliveData.frame(input));assertNull(NicoliveData.frame(input));try{NicoliveData.frame(new ByteArrayInputStream(new byte[]{3,1}));fail();}catch(EOFException expected){}try{NicoliveData.frame(new ByteArrayInputStream(v(1048577)));fail();}catch(IOException expected){}}
 @Test public void unknownProtobufFieldsDoNotTurnSystemMessagesIntoChat()throws Exception{assertNull(NicoliveData.chat(field(2,field(23,"system event".getBytes(StandardCharsets.UTF_8)))));byte[] chat=join(field(1,"hello".getBytes(StandardCharsets.UTF_8)),number(3,12345),field(6,"anonymous".getBytes(StandardCharsets.UTF_8)),field(7,join(number(1,2),number(2,2),number(3,1))),number(99,999));byte[] meta=join(field(1,"event-id".getBytes(StandardCharsets.UTF_8)),field(2,join(number(1,1790000000),number(2,500000000))));NicoliveData.Chat c=NicoliveData.chat(join(field(1,meta),field(2,field(1,chat)),number(100,1)));assertNotNull(c);assertEquals("hello",c.text);assertEquals("live-anon:anonymous",c.user);assertEquals(12345,c.vpos);assertEquals(1790000000500L,c.atMs);assertEquals(2,c.position);assertEquals(2,c.size);assertEquals(0xffff4444,c.color);}
 @Test public void viewCursorAndSegmentDecodeWithoutScanningHistory()throws Exception{String url="https://mpn.live.nicovideo.jp/api/segment/test";long[] next={0};assertEquals(url,NicoliveData.entry(field(1,field(3,url.getBytes(StandardCharsets.UTF_8))),next));assertNull(NicoliveData.entry(field(4,number(1,1234567)),next));assertEquals(1234567,next[0]);}
 @Test public void qualityIdsRemainServerSuppliedAndRetryIsBounded(){assertFalse(NicoliveData.qualityLabel("abr").isEmpty());assertEquals("1.5Mbps480p30fps",NicoliveData.qualityLabel("1.5Mbps480p30fps"));assertFalse(NicoliveData.qualityLabel("audio_only").isEmpty());assertEquals(1000,NicoliveData.retryDelay(0));assertEquals(30000,NicoliveData.retryDelay(999));}
}
