package e.e.a;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.*;
import org.json.*;

/** Service data is kept independent of the video watch/series model. */
public final class NicoliveData {
 public static final String UA="Mozilla/5.0";
 static final Pattern ID=Pattern.compile("lv[0-9]{1,15}");
 public static String id(String input){
  if(input==null)return null;String s=input.trim();if(ID.matcher(s).matches())return s;
  try{URI u=new URI(s);String host=u.getHost();if("nicoid-re".equals(u.getScheme())&&"live".equals(host)&&u.getUserInfo()==null){String path=u.getPath();return path!=null&&path.startsWith("/")&&ID.matcher(path.substring(1)).matches()?path.substring(1):null;}if(host==null||u.getUserInfo()!=null||!(host.equals("live.nicovideo.jp")||host.equals("live2.nicovideo.jp")||host.equals("sp.live.nicovideo.jp")||host.equals("nico.ms")))return null;
   if(!"https".equalsIgnoreCase(u.getScheme())&&!"http".equalsIgnoreCase(u.getScheme()))return null;
   Matcher m=Pattern.compile("^/(?:watch/|gate/)?(lv[0-9]{1,15})/?$").matcher(u.getPath());return m.matches()?m.group(1):null;
  }catch(Exception e){return null;}
 }
 static String unescape(String s){
  if(s==null)return "";s=s.replace("&quot;","\"").replace("&#39;","'").replace("&apos;","'").replace("&lt;","<").replace("&gt;",">");
  Matcher m=Pattern.compile("&#(x[0-9a-fA-F]+|[0-9]+);").matcher(s);StringBuffer out=new StringBuffer();
  while(m.find()){String v=m.group(1),r=m.group();try{int cp=Integer.parseInt(v.startsWith("x")?v.substring(1):v,v.startsWith("x")?16:10);if(Character.isValidCodePoint(cp))r=new String(Character.toChars(cp));}catch(Exception ignored){}m.appendReplacement(out,Matcher.quoteReplacement(r));}m.appendTail(out);return out.toString().replace("&amp;","&");
 }
 static String attr(String tag,String name)throws IOException{Matcher m=Pattern.compile("\\b"+Pattern.quote(name)+"\\s*=\\s*([\"'])(.*?)\\1",Pattern.DOTALL).matcher(tag);if(!m.find())throw new IOException("PAGE_DATA_MISSING");return unescape(m.group(2));}
 public static JSONObject embedded(String html,String element,String attribute)throws Exception{
  Matcher m=Pattern.compile("<script\\b[^>]*\\bid\\s*=\\s*([\"'])"+Pattern.quote(element)+"\\1[^>]*>",Pattern.CASE_INSENSITIVE|Pattern.DOTALL).matcher(html);
  if(!m.find())throw new IOException("PAGE_DATA_MISSING");return new JSONObject(attr(m.group(),attribute));
 }
 public static final class Program {
  public String id,title="",owner="",description="",thumbnail="",status="",provider="",socket="",quality="abr";
  public long begin,open,end,vposBase,views=-1,comments=-1,reservations=-1;public boolean loggedIn,premium,chaseCapable,canWatch=true;public String access="";
  boolean programThumbnail;
  public JSONObject source;
  public Program(String id){this.id=id;}
  public String accessLabel(){return access==null?"":access;}
  public boolean onAir(){return "ON_AIR".equals(status);}
  public boolean ended(){return "ENDED".equals(status);}
  public boolean scheduled(){return "RELEASED".equals(status)||"BEFORE_OPEN".equals(status)||"COMING_SOON".equals(status);}
  public static Program watch(String html,String expected)throws Exception{
   JSONObject root=embedded(html,"embedded-data","data-props"),p=root.getJSONObject("program");String found=p.optString("nicoliveProgramId");if(!expected.equals(found))throw new IOException("PROGRAM_MISMATCH");
   Program v=new Program(found);v.source=root;v.title=p.optString("title");v.description=unescape(p.optString("description").replaceAll("(?is)<(?:script|style)[^>]*>.*?</(?:script|style)>","").replaceAll("(?i)<br\\s*/?>","\n").replaceAll("<[^>]+>",""));
   v.status=p.optString("status");v.begin=p.optLong("beginTime");v.open=p.optLong("openTime");v.end=p.optLong("endTime");v.vposBase=p.optLong("vposBaseTime",v.begin);
   JSONObject supplier=p.optJSONObject("supplier");if(supplier!=null){v.owner=supplier.optString("name");v.provider=supplier.optString("supplierType");}
   JSONObject stats=p.optJSONObject("statistics");if(stats!=null){v.views=stats.optLong("watchCount",-1);v.comments=stats.optLong("commentCount",-1);}
   JSONObject thumb=p.optJSONObject("thumbnail");
   v.thumbnail=broadcastThumbnail(thumb);
   v.programThumbnail=!v.thumbnail.isEmpty();
   if(!v.programThumbnail&&thumb!=null){
    v.thumbnail=thumb.optString("small");
    if(v.thumbnail.isEmpty())v.thumbnail=thumb.optString("large");
   }
   JSONObject user=root.optJSONObject("user");if(user!=null){v.loggedIn=user.optBoolean("isLoggedIn");v.premium="premium".equals(user.optString("accountType"));}
   v.chaseCapable=v.premium&&p.optBoolean("isChasePlayEnabled");v.access=NicoliveData.accessLabel(p);JSONObject watch=root.optJSONObject("userProgramWatch");if(watch!=null)v.canWatch=watch.optBoolean("canWatch",true);
   JSONObject site=root.getJSONObject("site"),relive=site.getJSONObject("relive");v.socket=relive.optString("webSocketUrl");if(v.socket.length()>0&&!secureServiceUri(v.socket,true))throw new IOException("INVALID_SESSION_HOST");return v;
  }
  static Program listing(JSONObject row){
   String id=row.optString("nicoliveProgramId",row.optString("id"));
   if(!ID.matcher(id).matches())return null;
   Program program=new Program(id);
   program.title=row.optString("title");
   program.status=row.optString("status",row.optString("liveCycle"));
   program.thumbnail=row.optString("listingThumbnail");
   program.programThumbnail=row.optBoolean("programThumbnail")||isListingThumbnail(program.thumbnail);
   program.begin=row.optLong("beginTime",row.optLong("beginAt")/1000);
   program.open=row.optLong("openTime");
   program.end=row.optLong("endTime",row.optLong("endAt")/1000);
   program.provider=row.optString("providerType");
   program.access=NicoliveData.accessLabel(row);
   if(program.access.isEmpty())program.access=NicoliveData.accessLabel(row.optJSONObject("program"));
   JSONObject supplier=row.optJSONObject("supplier");
   if(supplier==null)supplier=row.optJSONObject("socialGroup");
   if(supplier==null)supplier=row.optJSONObject("programProvider");
   if(supplier!=null)program.owner=supplier.optString("name");
   JSONObject stats=row.optJSONObject("statistics");
   if(stats!=null){
    program.views=stats.optLong("watchCount",-1);
    program.comments=stats.optLong("commentCount",-1);
    program.reservations=stats.optLong("timeshiftReservationCount",stats.optLong("reservationCount",-1));
   }
   return program;
  }
  public JSONObject stored()throws JSONException{return new JSONObject().put("nicoliveProgramId",id).put("title",title).put("status",status).put("nicoliveAccessLabel",accessLabel()).put("listingThumbnail",thumbnail).put("programThumbnail",programThumbnail).put("beginTime",begin).put("supplier",new JSONObject().put("name",owner)).put("providerType",provider).put("statistics",new JSONObject().put("watchCount",views).put("commentCount",comments));}
 }
 /** Only explicit flags from official response data are interpreted; absence is unknown. */
 static String accessLabel(JSONObject info){
  if(info==null)return "";
  String saved=info.optString("nicoliveAccessLabel","");
  if("有料".equals(saved)||"会員無料".equals(saved)||"一部無料".equals(saved))return saved;
  if(info.optBoolean("isPartialFree")||info.optBoolean("isPartiallyFree")||info.optBoolean("isFreePart"))return "一部無料";
  if(info.optBoolean("isPayProgram")||info.optBoolean("isPaidProgram"))return "有料";
  if(info.optBoolean("isMemberOnly")||info.optBoolean("isMemberFree"))return "会員無料";
  return "";
 }
 static String broadcastThumbnail(JSONObject thumbnail){
  JSONObject variants=thumbnail==null?null:thumbnail.optJSONObject("huge");
  if(variants!=null)for(String size:new String[]{"s352x198","s640x360","s1280x720","s1920x1080"}){
   String url=variants.optString(size);
   if(!url.isEmpty())return url;
  }
  return "";
 }
 static boolean isListingThumbnail(String url){
  try{return "listing-thumbnail.live.nicovideo.jp".equalsIgnoreCase(URI.create(url).getHost());}
  catch(IllegalArgumentException ignored){return false;}
 }
 static String historyThumbnail(String html,String id)throws Exception{
  JSONObject program=embedded(html,"embedded-data","data-props").getJSONObject("program");
  if(!id.equals(program.optString("nicoliveProgramId")))throw new IOException("PROGRAM_MISMATCH");
  return broadcastThumbnail(program.optJSONObject("thumbnail"));
 }
 public static List<Program> listings(String html)throws Exception{
  JSONObject root;try{root=embedded(html,"DAT-csr-data","data-value");}catch(IOException e){root=embedded(html,"embedded-data","data-props");}
  LinkedHashMap<String,Program> values=new LinkedHashMap<String,Program>();collect(root,values,0);return new ArrayList<Program>(values.values());
 }
 static void collect(Object obj,Map<String,Program> out,int depth)throws JSONException{
  if(obj==null||depth>18||out.size()>=200)return;
  if(obj instanceof JSONObject){JSONObject p=(JSONObject)obj;Program v=Program.listing(p);if(v!=null&&v.title.length()>0){if(!out.containsKey(v.id))out.put(v.id,v);return;}Iterator<String> it=p.keys();while(it.hasNext())collect(p.opt(it.next()),out,depth+1);}
  else if(obj instanceof JSONArray){JSONArray a=(JSONArray)obj;for(int i=0;i<a.length();i++)collect(a.opt(i),out,depth+1);}
 }
 public static boolean secureServiceUri(String value,boolean ws){try{URI u=new URI(value);String h=u.getHost();return h!=null&&(h.equals("nicovideo.jp")||h.endsWith(".nicovideo.jp"))&&(ws?"wss":"https").equalsIgnoreCase(u.getScheme())&&u.getUserInfo()==null;}catch(Exception e){return false;}}
 public static String qualityLabel(String id){if(id.equals("abr"))return "自動";if(id.startsWith("audio_"))return "音声のみ";if(id.equals("super_high"))return "最高画質";if(id.equals("high"))return "高画質";if(id.equals("normal"))return "標準画質";if(id.equals("low"))return "低画質";if(id.equals("super_low"))return "最低画質";return id;}
 public static long retryDelay(int attempts){return Math.min(30000,1000L<<Math.min(5,Math.max(0,attempts)));}
 public static String failure(String code){if(code==null)return "接続できませんでした";
  if(code.contains("NOT_ON_AIR")||code.contains("END_PROGRAM"))return "放送は終了しました";
  if(code.contains("NO_PERMISSION")||code.contains("FORBIDDEN")||code.contains("NO_AUTH"))return "この番組の視聴条件を確認してください";
  if(code.contains("NOT_FOUND"))return "番組が見つかりません";
  if(code.contains("COMMENT_LOCK"))return "コメントの投稿が制限されています";
  if(code.contains("POST"))return "コメントを送信できませんでした。投稿済みか確認してください";
  return "接続できませんでした。再接続をお試しください";
 }
 public static final class Chat {
  public String id="",text="",user="";public long atMs,vpos;public int position,size,color=0xffffffff;public boolean translucent,operator;
 }
 /** Minimal bounded protobuf reader; unknown fields are skipped, not interpreted as chat. */
 static final class Wire {
  final byte[] data;int pos;Wire(byte[] data){this.data=data;}
  long varint()throws IOException{long v=0;for(int shift=0;shift<64;shift+=7){if(pos>=data.length)throw new EOFException();int b=data[pos++]&255;if(shift==63&&(b&254)!=0)throw new IOException("INVALID_VARINT");v|=(long)(b&127)<<shift;if((b&128)==0)return v;}throw new IOException("INVALID_VARINT");}
  int length()throws IOException{long n=varint();if(n<0||n>1048576||n>data.length-pos)throw new IOException("INVALID_PROTO_LENGTH");return (int)n;}
  byte[] bytes()throws IOException{int n=length();byte[] out=Arrays.copyOfRange(data,pos,pos+n);pos+=n;return out;}
  void skip(int type)throws IOException{if(type==0)varint();else if(type==2){int n=length();pos+=n;}else if(type==1||type==5){pos+=type==1?8:4;if(pos>data.length)throw new EOFException();}else throw new IOException("INVALID_WIRE_TYPE");}
 }
 public static byte[] frame(InputStream in)throws IOException{int b=in.read();if(b<0)return null;long length=b&127;int shift=7;while((b&128)!=0){if(shift>28)throw new IOException("FRAME_TOO_LARGE");b=in.read();if(b<0)throw new EOFException();length|=(long)(b&127)<<shift;shift+=7;}if(length>1048576)throw new IOException("FRAME_TOO_LARGE");byte[] data=new byte[(int)length];int pos=0;while(pos<data.length){int count=in.read(data,pos,data.length-pos);if(count<0)throw new EOFException();if(count>0)pos+=count;}return data;}
 public static String entry(byte[] bytes,long[] next)throws IOException{Wire r=new Wire(bytes);String uri=null;while(r.pos<bytes.length){int tag=(int)r.varint(),field=tag>>>3;if((tag&7)==2&&(field==1||field==3)){Wire s=new Wire(r.bytes());while(s.pos<s.data.length){int t=(int)s.varint();if(t==26)uri=new String(s.bytes(),StandardCharsets.UTF_8);else s.skip(t&7);}}else if(tag==34){Wire s=new Wire(r.bytes());while(s.pos<s.data.length){int t=(int)s.varint();if(t==8)next[0]=s.varint();else s.skip(t&7);}}else r.skip(tag&7);}return uri;}
 public static Chat chat(byte[] bytes)throws IOException{
  Wire r=new Wire(bytes);Chat chat=new Chat();boolean found=false;
  while(r.pos<bytes.length){int tag=(int)r.varint();if(tag==10){Wire meta=new Wire(r.bytes());while(meta.pos<meta.data.length){int t=(int)meta.varint();if(t==10)chat.id=new String(meta.bytes(),StandardCharsets.UTF_8);else if(t==18){Wire time=new Wire(meta.bytes());long sec=0,nano=0;while(time.pos<time.data.length){int tt=(int)time.varint();if(tt==8)sec=time.varint();else if(tt==16)nano=time.varint();else time.skip(tt&7);}chat.atMs=sec*1000+nano/1000000;}else meta.skip(t&7);}}
   else if(tag==18){Wire body=new Wire(r.bytes());while(body.pos<body.data.length){int t=(int)body.varint();if(t==10||t==162){parseChat(new Wire(body.bytes()),chat);found=true;}else body.skip(t&7);}}
   else r.skip(tag&7);
  }return found&&!chat.text.isEmpty()?chat:null;
 }
 static void parseChat(Wire r,Chat c)throws IOException{while(r.pos<r.data.length){int t=(int)r.varint();if(t==10)c.text=new String(r.bytes(),StandardCharsets.UTF_8);else if(t==24)c.vpos=(int)r.varint();else if(t==40)c.user="raw:"+r.varint();else if(t==50)c.user="live-anon:"+new String(r.bytes(),StandardCharsets.UTF_8);else if(t==58)modifier(new Wire(r.bytes()),c);else r.skip(t&7);}}
 static final int[] COLORS={0xffffffff,0xffff4444,0xffff80b0,0xffffa040,0xffffff40,0xff60d060,0xff60dddd,0xff6090ff,0xffb080ff,0xff202020,0xffffffff,0xffcc3333,0xffcc6f96,0xffcc8230,0xffdddd30,0xff40b040,0xff40bbbb,0xff4070cc,0xff9060cc,0xff202020};
 static void modifier(Wire r,Chat c)throws IOException{while(r.pos<r.data.length){int t=(int)r.varint();if(t==8)c.position=(int)r.varint();else if(t==16)c.size=(int)r.varint();else if(t==24){int i=(int)r.varint();if(i>=0&&i<COLORS.length)c.color=COLORS[i];}else if(t==34){Wire rgb=new Wire(r.bytes());int red=255,green=255,blue=255;while(rgb.pos<rgb.data.length){int k=(int)rgb.varint();if(k==8)red=(int)rgb.varint();else if(k==16)green=(int)rgb.varint();else if(k==24)blue=(int)rgb.varint();else rgb.skip(k&7);}c.color=0xff000000|Math.max(0,Math.min(255,red))<<16|Math.max(0,Math.min(255,green))<<8|Math.max(0,Math.min(255,blue));}else if(t==48)c.translucent=r.varint()==1;else r.skip(t&7);}}
}
