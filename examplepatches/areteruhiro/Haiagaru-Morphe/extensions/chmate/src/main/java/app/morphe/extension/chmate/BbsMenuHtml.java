package app.morphe.extension.chmate;

import java.net.URI;
import java.util.*;
import java.net.URLDecoder;
import java.util.regex.*;

/** Clean only HTML menu input; JSON and native board identities are left to ChMate. */
public final class BbsMenuHtml {
 private static final Pattern RAW=Pattern.compile("(?is)<!--.*?(?:-->|\\z)|<(script|style)\\b[^>]*>.*?(?:</\\1\\s*>|\\z)");
 private static final Pattern TITLE=Pattern.compile("(?is)<title\\b[^>]*>(.*?)</title\\s*>");
 static String siteKey(String server){
  String host=server.toLowerCase(Locale.ROOT);
  if(host.equals("jbbs.livedoor.jp"))return "shitaraba.net";
  if(host.equals("00c.org")||host.endsWith(".00c.org"))return "kenmo.org";
  for(String domain:new String[]{"eddibb.cc","eddibb.org","kenmo.org","shitaraba.net","open2ch.net","2ch.sc","talk.jp"})
   if(host.equals(domain)||host.endsWith("."+domain))return domain;
  return host;
 }
 static String siteTitle(String server){
  String key=siteKey(server);
  if(key.equals("eddibb.cc")||key.equals("eddibb.org"))return "エッヂ";
  if(key.equals("kenmo.org"))return "オルグ板";
  if(key.equals("shitaraba.net"))return "したらば";
  return key;
 }
 static boolean scriptCategory(String value){
  if(value==null)return false;String s=value.trim().toLowerCase(Locale.ROOT);
  return s.startsWith("gtag(")||s.startsWith("return ")||s.startsWith("function(")||s.startsWith("function ")
   ||s.equals("});")||s.equals("});;")||s.equals("}")||s.contains(".tolowercase()")||s.contains("<script");
 }
 static boolean edgeBoard(String server,String board){
  if(server==null||board==null||!(server.equalsIgnoreCase("bbs.eddibb.cc")||server.equalsIgnoreCase("bbs.eddibb.org")))return false;
  try{String decoded=URLDecoder.decode(board,"UTF-8").replaceFirst("/+$","");return decoded.equals("liveedge")||decoded.endsWith("/liveedge");}
  catch(Exception invalid){return false;}
 }
 /** Repair only malformed labels; identity and persisted board data remain unchanged. */
 static List<String> repairCategories(String server,String board,List<String> categories){
  boolean edge=edgeBoard(server,board),invalid=edge&&(categories==null||categories.isEmpty());
  if(categories==null&&!edge)return null;
  LinkedHashSet<String> clean=new LinkedHashSet<>();
  if(categories!=null)for(String category:categories){
   if(scriptCategory(category)||(edge&&(category==null||category.trim().isEmpty()||category.trim().equals("無題"))))invalid=true;
   else if(category!=null&&!category.isEmpty())clean.add(category);
  }
  if(!invalid)return categories;
  if(clean.isEmpty())clean.add(siteTitle(server));
  return new ArrayList<>(clean);
 }
 static URI boardAddress(String url){
  try{
   URI u=URI.create(url);String path=u.getPath();
   if(u.getHost()==null||u.getUserInfo()!=null||u.getQuery()!=null||u.getFragment()!=null
    ||!("http".equalsIgnoreCase(u.getScheme())||"https".equalsIgnoreCase(u.getScheme()))||path==null)return null;
   path=path.replaceAll("^/+|/+$","");
   if(path.isEmpty()||path.contains(".")||path.contains("%")||path.contains("read.cgi")||path.contains("\\"))return null;
   if(u.getHost().equals("jbbs.shitaraba.net")||u.getHost().equals("jbbs.livedoor.jp")){
    if(!path.matches("[a-zA-Z0-9_-]+/[0-9]+"))return null;
   }else if(!path.matches("[a-zA-Z0-9_-]+")||path.matches("(?i)(?:menu|bbsmenu|ranking|search|about|commands|test)"))return null;
   return new URI(u.getScheme(),null,u.getHost(),u.getPort(),"/"+path+"/",null,null);
  }catch(Exception invalid){return null;}
 }
 private static URI menuBoard(String url){
  try{URI uri=URI.create(url);String path=uri.getRawPath();
   if("bbs.eddibb.cc".equalsIgnoreCase(uri.getHost())&&uri.getUserInfo()==null&&uri.getQuery()==null&&uri.getFragment()==null
    &&("http".equalsIgnoreCase(uri.getScheme())||"https".equalsIgnoreCase(uri.getScheme()))
    &&(uri.getPort()==-1||uri.getPort()==("https".equalsIgnoreCase(uri.getScheme())?443:80))
    &&(path==null||path.isEmpty()||path.equals("/")))return new URI(uri.getScheme(),null,uri.getHost(),uri.getPort(),"/liveedge/",null,null);
  }catch(Exception invalid){}return boardAddress(url);
 }
 public static String prepare(String url,String html){
  if(html==null||!html.trim().startsWith("<"))return html;
  String clean=RAW.matcher(html).replaceAll("");URI board=menuBoard(url);
  if(board==null)return clean;
  String path=board.getPath().replaceAll("^/+|/+$","");
  boolean boardPage=clean.contains("/test/read.cgi/"+path+"/")||clean.contains("/bbs/read.cgi/"+path+"/")
    ||clean.contains("subject.txt");
  boolean edge="bbs.eddibb.cc".equalsIgnoreCase(board.getHost())&&path.equals("liveedge");
  if(!boardPage&&!edge)return clean;
  String title=null;Matcher matcher=TITLE.matcher(clean);
  if(matcher.find())title=decode(matcher.group(1).replaceAll("(?is)<[^>]+>","").trim());
  if(siteTitle(board.getHost()).equals("エッヂ")&&path.equals("liveedge"))title="エッヂ";
  if(title==null||title.isEmpty()||scriptCategory(title))title=path;
  // Native readers test links before headings on each line. Keep them separate.
  return "<html><body>\n<B>"+escape(siteTitle(board.getHost()))+"</B><BR>\n<A HREF=\""+escape(board.toASCIIString())+"\">"+escape(title)+"</A><BR>\n</body></html>";
 }
 public static int countForValidation(int count,String url){return count==1&&menuBoard(url)!=null?2:count;}
 private static String decode(String text){
  Matcher m=Pattern.compile("&(#(?:[xX][0-9a-fA-F]+|[0-9]+)|amp|lt|gt|quot|apos|nbsp);").matcher(text);StringBuffer out=new StringBuffer();
  while(m.find()){String token=m.group(1),value=m.group();
   try{if(token.startsWith("#")){int point=token.matches("#[xX].*")?Integer.parseInt(token.substring(2),16):Integer.parseInt(token.substring(1));if(Character.isValidCodePoint(point)&&!(point>=0xd800&&point<=0xdfff))value=new String(Character.toChars(point));}
    else {switch(token){case "amp":value="&";break;case "lt":value="<";break;case "gt":value=">";break;case "quot":value="\"";break;case "apos":value="'";break;case "nbsp":value=" ";break;}}
   }catch(IllegalArgumentException ignored){}m.appendReplacement(out,Matcher.quoteReplacement(value));
  }m.appendTail(out);return out.toString();
 }
 private static String escape(String s){return s.replace("&","&amp;").replace("\"","&quot;").replace("<","&lt;").replace(">","&gt;");}
 private BbsMenuHtml(){}
}
