package e.e.a;
import java.io.*;import java.net.*;import java.util.*;import java.util.regex.*;
/** A finite HLS media plan. Network and file writes are provided by the worker. */
public final class Mp4Playlist115 {
 static final Pattern ATTR=Pattern.compile("([A-Z0-9-]+)=(?:\"([^\"]*)\"|([^,]*))");
 static Map<String,String> attrs(String line){Map<String,String> out=new LinkedHashMap<>();Matcher m=ATTR.matcher(line.substring(line.indexOf(':')+1));while(m.find())out.put(m.group(1),m.group(2)!=null?m.group(2):m.group(3));return out;}
 static URL resolve(URL base,String child)throws IOException{URL u=new URL(base,child);if(!"https".equalsIgnoreCase(u.getProtocol())||u.getUserInfo()!=null||u.getPort()!=-1&&u.getPort()!=443)throw new IOException("安全な配信URLではありません");return u;}
 static final class Segment{URL url,key;long length=-1,offset,sequence;byte[] iv;boolean init;}
 static final class Plan{final List<Segment> segments=new ArrayList<>();long bytes=-1;}
 interface Fetch{String text(URL url)throws Exception;}
 static List<Plan> load(URL root,Fetch fetch)throws Exception{
  String text=fetch.text(root);if(!text.trim().startsWith("#EXTM3U"))throw new IOException("HLS情報が不正です");
  URL video=null,audio=null;String audioGroup=null;String[] lines=text.split("\\r?\\n");
  for(int i=0;i<lines.length;i++)if(lines[i].startsWith("#EXT-X-STREAM-INF:")){Map<String,String> a=attrs(lines[i]);audioGroup=a.get("AUDIO");int j=i+1;while(j<lines.length&&lines[j].trim().isEmpty())j++;if(j>=lines.length||lines[j].startsWith("#"))throw new IOException("映像プレイリストがありません");video=resolve(root,lines[j].trim());break;}
  if(video==null)return Arrays.asList(parse(root,text));
  for(String line:lines)if(line.startsWith("#EXT-X-MEDIA:")){Map<String,String>a=attrs(line);if("AUDIO".equals(a.get("TYPE"))&&Objects.equals(audioGroup,a.get("GROUP-ID"))&&a.containsKey("URI")){audio=resolve(root,a.get("URI"));break;}}
  List<Plan> plans=new ArrayList<>();plans.add(parse(video,fetch.text(video)));if(audio!=null&&!audio.equals(video))plans.add(parse(audio,fetch.text(audio)));return plans;
 }
 static byte[] iv(String value,long sequence)throws IOException{byte[] b=new byte[16];if(value==null){for(int i=15;i>=8;i--){b[i]=(byte)sequence;sequence>>>=8;}return b;}String hex=value.replaceFirst("^0[xX]","");if(!hex.matches("[0-9a-fA-F]{1,32}"))throw new IOException("HLSのIVが不正です");if(hex.length()%2!=0)hex="0"+hex;for(int i=0;i<hex.length()/2;i++)b[16-hex.length()/2+i]=(byte)Integer.parseInt(hex.substring(i*2,i*2+2),16);return b;}
 static Plan parse(URL base,String text)throws IOException{
  if(!text.trim().startsWith("#EXTM3U")||!text.contains("#EXT-X-ENDLIST"))throw new IOException("完結していない配信には対応していません");
  Plan out=new Plan();URL key=null,last=null;String iv=null,range=null,map=null;long sequence=0,end=0;boolean previousRange=false;long total=0;boolean known=true;
  for(String raw:text.split("\\r?\\n")){String line=raw.trim();try{
   if(line.startsWith("#EXT-X-MEDIA-SEQUENCE:")){sequence=Long.parseLong(line.substring(22));if(sequence<0)throw new NumberFormatException();}
   else if(line.equals("#EXT-X-DISCONTINUITY")||line.startsWith("#EXT-X-GAP"))throw new IOException("不連続な配信はMP4へ保存できません");
   else if(line.startsWith("#EXT-X-KEY:")){Map<String,String>a=attrs(line);String method=a.get("METHOD");if("NONE".equals(method)){key=null;iv=null;}else if("AES-128".equals(method)&&(!a.containsKey("KEYFORMAT")||"identity".equals(a.get("KEYFORMAT")))){key=resolve(base,a.get("URI"));iv=a.get("IV");}else throw new IOException("この暗号化形式には対応していません");}
   else if(line.startsWith("#EXT-X-MAP:")){Map<String,String>a=attrs(line);String identity=a.get("URI")+"|"+a.get("BYTERANGE");if(map!=null&&!map.equals(identity))throw new IOException("途中で形式が変わる配信には対応していません");if(map==null){Segment s=new Segment();s.url=resolve(base,a.get("URI"));s.init=true;s.key=key;if(key!=null&&iv==null)throw new IOException("初期化データのIVがありません");s.iv=iv(iv,sequence);range(s,a.get("BYTERANGE"),0,false);out.segments.add(s);}map=identity;}
   else if(line.startsWith("#EXT-X-BYTERANGE:"))range=line.substring(17);
   else if(!line.isEmpty()&&!line.startsWith("#")){Segment s=new Segment();s.url=resolve(base,line);s.key=key;s.iv=iv(iv,sequence);s.sequence=sequence++;range(s,range,end,previousRange&&s.url.equals(last));out.segments.add(s);end=s.offset+(s.length>0?s.length:0);last=s.url;previousRange=range!=null;range=null;}
  }catch(NumberFormatException e){throw new IOException("HLSの数値が不正です",e);}}
  if(out.segments.isEmpty())throw new IOException("動画データがありません");if(out.segments.size()>200000)throw new IOException("動画が長すぎます");for(Segment s:out.segments){if(s.length<0)known=false;else{if(Long.MAX_VALUE-total<s.length)throw new IOException("容量が大きすぎます");total+=s.length;}}out.bytes=known?total:-1;return out;
 }
 static void range(Segment s,String text,long implicit,boolean allowed)throws IOException{if(text==null)return;try{String[] p=text.split("@",-1);if(p.length>2||p.length==1&&!allowed)throw new NumberFormatException();s.length=Long.parseLong(p[0]);s.offset=p.length==2?Long.parseLong(p[1]):implicit;if(s.length<=0||s.offset<0||s.offset>Long.MAX_VALUE-s.length)throw new NumberFormatException();}catch(NumberFormatException e){throw new IOException("HLSの範囲が不正です",e);}}
 static String filename(String title,String id){String s=(title==null?"":title).replaceAll("[\\p{Cntrl}\\\\/:*?\"<>|]","_").trim();if(s.isEmpty())s=id;if(s.length()>100)s=s.substring(0,100);return s+" ["+id+"].mp4";}
}
