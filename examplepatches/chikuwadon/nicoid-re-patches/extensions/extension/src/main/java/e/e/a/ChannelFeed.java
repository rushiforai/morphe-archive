package e.e.a;
import java.io.*;import java.text.*;import java.util.*;import java.util.regex.*;import javax.xml.parsers.*;import org.w3c.dom.*;import org.xml.sax.InputSource;
/** Read the channel's public RSS listing without relying on the retired uploaded-video endpoint. */
final class ChannelFeed {
 static String channelId(String url){if(url==null)return "";Matcher m=Pattern.compile("https?://ch\\.nicovideo\\.jp/(ch[0-9]+)(?:[/?#]|$)").matcher(url);return m.find()?m.group(1):"";}
 static final class Video {String id,title,url,image,date,length,counts;}
 static String text(Element e,String tag){NodeList list=e.getElementsByTagName(tag);if(list.getLength()==0)list=e.getElementsByTagNameNS("*",tag);return list.getLength()==0?"":list.item(0).getTextContent().trim();}
 static String decode(String value){return value.replace("&amp;","&").replace("&#x2F;","/").replace("&#47;","/").replace("&quot;", "\"").replace("&#39;","'");}
 static String match(String html,String regex){Matcher m=Pattern.compile(regex,Pattern.CASE_INSENSITIVE|Pattern.DOTALL).matcher(html);return m.find()?decode(m.group(1).trim()):"";}
 private static String thumbnail(Element item,String description){
  NodeList all=item.getElementsByTagName("*");for(int i=0;i<all.getLength();i++){Element el=(Element)all.item(i);String local=el.getLocalName();if(local==null)local=el.getTagName();if(local.toLowerCase(Locale.ROOT).endsWith("thumbnail")){String url=el.getAttribute("url");if(url.isEmpty())url=el.getAttribute("href");if(url.startsWith("//"))url="https:"+url;if(url.startsWith("https://")||url.startsWith("http://"))return decode(url).replace("http://","https://");}}
  String image=match(description,"<(?:img|source)\\b[^>]*?\\b(?:src|data-src|data-original)\\s*=\\s*[\"']([^\"']+)");
  if(image.isEmpty())image=match(description,"\\b(?:src|data-src|data-original)\\s*=\\s*[\"']([^\"']+)");
  if(image.startsWith("//"))image="https:"+image;return image.replace("http://","https://");
 }
 private static String date(String raw){try{SimpleDateFormat input=new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z",Locale.US);Date parsed=input.parse(raw);if(parsed==null)return raw;return new SimpleDateFormat("yyyy年MM月dd日 HH時mm分",Locale.JAPAN).format(parsed)+" 投稿";}catch(Exception ignored){return raw;}}
 private static String counts(String html){String plain=html.replaceAll("(?i)<br\\s*/?>"," ").replaceAll("<[^>]+>"," ").replace("&nbsp;"," ").replace("&#160;"," ");String views=match(plain,"(?:再生(?:数)?|Views?)\\s*[:：]\\s*([0-9,]+)");String comments=match(plain,"(?:コメント|コメ|Comments?)\\s*[:：]\\s*([0-9,]+)");String mylists=match(plain,"(?:マイリスト|マイリス|Mylists?)\\s*[:：]\\s*([0-9,]+)");if(views.isEmpty()||comments.isEmpty()||mylists.isEmpty())return "";return "再生数:"+views+" コメント:"+comments+" マイリスト:"+mylists;}
 static List<Video> parse(String xml)throws Exception{
  if(xml.length()>2*1024*1024||Pattern.compile("<!\\s*(?:DOCTYPE|ENTITY)",Pattern.CASE_INSENSITIVE).matcher(xml).find())throw new IOException("Unsupported XML declaration");
  DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();factory.setNamespaceAware(true);factory.setExpandEntityReferences(false);DocumentBuilder builder=factory.newDocumentBuilder();builder.setEntityResolver((publicId,systemId)->new InputSource(new StringReader("")));
  Document doc=builder.parse(new InputSource(new StringReader(xml)));if(!"rss".equals(doc.getDocumentElement().getTagName()))throw new IOException("Not a channel feed");
  ArrayList<Video> result=new ArrayList<>();Set<String> seen=new HashSet<>();NodeList items=doc.getElementsByTagName("item");
  for(int n=0;n<items.getLength();n++){Element item=(Element)items.item(n);Video v=new Video();v.url=text(item,"link").replace("http://","https://");if(!v.url.matches("https://www\\.nicovideo\\.jp/watch/(?:sm|so|nm)?[0-9]+"))continue;v.id=HistoryRules.id(v.url);if(!seen.add(v.id))continue;v.title=text(item,"title");v.date=date(text(item,"pubDate"));String description=text(item,"description");v.image=thumbnail(item,description);v.length=match(description,"class=[\"']nico-info-length[\"'][^>]*>([^<]+)");v.counts=counts(description);result.add(v);}
  return result;
 }
}
