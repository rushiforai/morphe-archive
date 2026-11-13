package app.morphe.extension.chmate;
public final class BbsMenuHtmlTest {
 static int checks;static void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 // Native HTML readers scan one line at a time and test links before headings.
 static java.util.List<String> nativeFolders(String html){
  java.util.List<String> result=new java.util.ArrayList<>();String folder=null;
  java.util.regex.Matcher lines=java.util.regex.Pattern.compile("[^\\r\\n]+").matcher(html);
  while(lines.find()){
   String line=lines.group();
   if(java.util.regex.Pattern.compile("href=(\"[^\"]+|[^ >]+).*?>(.*?)</a",2).matcher(line).find())result.add(folder);
   else {java.util.regex.Matcher heading=java.util.regex.Pattern.compile("<b>(.*?)</b>",2).matcher(line);if(heading.find())folder=heading.group(1);}
  }return result;
 }
 public static void main(String[]args)throws Exception{
  String bad="<!DOCTYPE html><title>エッヂ</title><script>gtag('config','UA-test');\nreturn text.toLowerCase().includes(rule.pattern.toLowerCase());\n</script><a href='/test/read.cgi/liveedge/1790000000/'>スレ名 (42)</a>";
  String fixed=BbsMenuHtml.prepare("https://bbs.eddibb.cc/liveedge",bad);
  ok(nativeFolders("<B>エッヂ</B><A HREF=\"https://bbs.eddibb.cc/liveedge/\">エッヂ</A>").equals(java.util.Arrays.asList((String)null)),"native link-first parser reproduces missing category on a single line");
  ok(nativeFolders(fixed).equals(java.util.List.of("エッヂ")),"prepared Edge link has a native-readable category");
  ok(fixed.contains("HREF=\"https://bbs.eddibb.cc/liveedge/\">エッヂ</A>"),"board URL becomes one board entry");
  ok(!fixed.contains("gtag")&&!fixed.contains("return text")&&!fixed.contains("スレ名")&&!fixed.contains("read.cgi"),"no script or thread title is imported");
  ok(fixed.equals(BbsMenuHtml.prepare("https://bbs.eddibb.cc/liveedge/",bad)),"trailing slash variants agree");
  for(String url:new String[]{"https://bbs.eddibb.cc/","https://bbs.eddibb.cc","https://bbs.eddibb.cc/liveedge/"}){
   String modern="<!DOCTYPE html><title>【画像】同じスレ名</title><a href='/other/'>【画像】同じスレ名</a>";
   ok(BbsMenuHtml.prepare(url,modern).contains(">エッヂ</A>"),"modern root/redirect page becomes canonical board");
   ok(!BbsMenuHtml.prepare(url,modern).contains("同じスレ名"),"thread headline cannot become repeated board names");
   ok(nativeFolders(BbsMenuHtml.prepare(url,modern)).equals(java.util.List.of("エッヂ")),"every Edge source variant retains the folder");
   ok(BbsMenuHtml.countForValidation(1,url)==2,"canonical singleton accepted after root redirect");
  }
  if(args.length>0){String live=java.nio.file.Files.readString(java.nio.file.Path.of(args[0]));String result=BbsMenuHtml.prepare("https://bbs.eddibb.cc/",live);ok(result.equals(fixed),"reported live homepage yields exactly one canonical Edge board");}
  String menu="<html><script><B>gtag('config');</B><a href='https://bad.invalid/fake/'>bad</a></script><style><b>bad</b></style><!--<B>bad</B>--><B>ニュース</B><a href='https://kenmo.org/poverty/'>嫌儲</a></html>";
  String clean=BbsMenuHtml.prepare("https://kenmo.org/bbsmenu.html",menu);
  ok(clean.contains("<B>ニュース</B>")&&clean.contains("https://kenmo.org/poverty/"),"real menu categories and URLs preserved");
  ok(!clean.contains("gtag")&&!clean.contains("bad")&&!clean.contains("script")&&!clean.contains("style"),"raw-text and comment content discarded");
  ok(BbsMenuHtml.prepare("https://example.org/menu.html","<B>正常</B><script>unterminated").equals("<B>正常</B>"),"unterminated script never becomes category text");
  String json="{\"categories\":[{\"title\":\"<script>literal</script>\"}]}";ok(BbsMenuHtml.prepare("https://example.org/menu.json",json)==json,"JSON byte-for-byte unchanged");
  ok(BbsMenuHtml.prepare("https://example.org/menu.html",null)==null,"null unchanged");
  ok(BbsMenuHtml.prepare("https://example.org/news/","<title>A &amp; B &#x1F423;</title><a href='/test/read.cgi/news/1234567890/'>x</a>").contains("A &amp; B 🐣"),"HTML entity decoded exactly once and non-BMP title preserved");
  ok(!BbsMenuHtml.prepare("https://example.org/about","<title>About</title><p>Info</p>").contains("HREF="),"ordinary page is not invented into a board");
  for(String url:new String[]{"https://example.org/menu.html","https://example.org/","https://example.org/about?x=1","file:///local/news/","https://name@example.org/news/"})ok(BbsMenuHtml.countForValidation(1,url)==1,"menu minimum retained: "+url);
  ok(BbsMenuHtml.countForValidation(1,"https://bbs.eddibb.cc/liveedge")==2,"single board accepted by native minimum check");
  ok(BbsMenuHtml.countForValidation(0,"https://bbs.eddibb.cc/liveedge")==0,"empty parse still fails");
  ok(BbsMenuHtml.countForValidation(4,"https://bbs.eddibb.cc/liveedge")==4,"multi-board count not changed");
  for(String text:new String[]{"gtag('config','UA-x');","return text.toLowerCase().includes(rule.pattern.toLowerCase());","});"})ok(BbsMenuHtml.scriptCategory(text),"observed damaged categories recognized");
  for(String text:new String[]{"ニュース","その他","JavaScript","returnの話題","A (2)"})ok(!BbsMenuHtml.scriptCategory(text),"normal category retained: "+text);
  ok(BbsMenuHtml.siteKey("bbs.eddibb.cc").equals("eddibb.cc")&&BbsMenuHtml.siteTitle("bbs.eddibb.cc").equals("エッヂ"),"Edge site group");
  ok(BbsMenuHtml.siteKey("jbbs.livedoor.jp").equals("shitaraba.net"),"Shitaraba alias unified");
  ok(BbsMenuHtml.siteKey("news.livedoor.jp").equals("news.livedoor.jp"),"unrelated Livedoor hosts not conflated");
  ok(BbsMenuHtml.siteKey("evilkenmo.org").equals("evilkenmo.org"),"domain boundary checked");
  ok(BbsMenuHtml.siteTitle("kenmo.org").equals("オルグ板")&&BbsMenuHtml.siteTitle("00c.org").equals("オルグ板"),"Org provider/site group names agree");
  for(java.util.List<String> categories:java.util.Arrays.<java.util.List<String>>asList(null,java.util.List.of(),java.util.List.of(""),java.util.List.of("無題"),java.util.Arrays.asList((String)null),java.util.List.of("  "))){
   ok(BbsMenuHtml.repairCategories("bbs.eddibb.cc","bbs.eddibb.cc%2Fliveedge",categories).equals(java.util.List.of("エッヂ")),"saved missing Edge categories repaired: "+categories);
  }
  java.util.List<String> custom=java.util.List.of("お気に入りの分類");
  ok(BbsMenuHtml.repairCategories("bbs.eddibb.cc","bbs.eddibb.cc/liveedge",custom)==custom,"meaningful Edge category preserved");
  java.util.List<String> untitled=java.util.List.of("無題");
  ok(BbsMenuHtml.repairCategories("example.org","example.org/liveedge",untitled)==untitled,"other hosts are not repaired as Edge");
  ok(BbsMenuHtml.repairCategories("bbs.eddibb.cc","bbs.eddibb.cc/other",untitled)==untitled,"other board identity preserved");
  ok(BbsMenuHtml.repairCategories("example.org","example.org/news",null)==null,"unrelated null categories preserved");
  ok(BbsMenuHtml.repairCategories("bbs.eddibb.cc","liveedge",java.util.List.of("無題","ニュース")).equals(java.util.List.of("ニュース")),"valid custom category survives damaged Edge category");
  ok(BbsMenuHtml.repairCategories("kenmo.org","kenmo.org/poverty",java.util.List.of("gtag('x')")).equals(java.util.List.of("オルグ板")),"legacy script repair uses current Org name");
  System.out.println("PASS "+checks+" BBS menu HTML and external-site rules");
 }
}
