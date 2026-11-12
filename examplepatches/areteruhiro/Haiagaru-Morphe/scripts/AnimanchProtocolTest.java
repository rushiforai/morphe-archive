package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;import java.net.*;import java.util.*;
public class AnimanchProtocolTest {
 static int checks;static void ok(boolean b,String msg){if(!b)throw new AssertionError(msg);checks++;}
 interface Op{void run()throws Exception;}static void rejected(Op op)throws Exception{try{op.run();throw new AssertionError("must reject");}catch(IOException expected){checks++;}}
 public static void main(String[] args)throws Exception{
  String html=Files.readString(Path.of(args[0])),index=Files.readString(Path.of(args[1])),url="https://bbs.animanch.com/board/7589284/";
  var page=AnimanchProtocol.thread(html,url);ok(page.id.equals("7589284"),"canonical saved thread");ok(page.replies.size()==79,"all saved replies, no ad/recommendation/popup duplicates");int images=0;
  for(int n=0;n<page.replies.size();n++){var row=page.replies.get(n);ok(row.number==n+1,"response numbering");ok(!row.html.contains("<script")&&!row.html.contains("onclick=")&&!row.html.contains("_files/"),"safe native body without saved filenames");for(String image:row.images){ok(image.startsWith("https://bbs.animanch.com/img/7589284/"),"original media URL");images++;}}
  ok(images==34,"all 34 original images");ok(page.title.equals("思い出の駄菓子ってある？"),"native title");
  var topics=AnimanchProtocol.catalogue(index);ok(topics.size()>100,"saved catalogue");ok(topics.stream().map(t->t.id).distinct().count()==topics.size(),"deduplicate popular/recent tabs");ok(topics.stream().allMatch(t->t.replies>=0&&!t.title.isEmpty()),"titles and counts");
  rejected(()->AnimanchProtocol.thread(html,"https://bbs.animanch.com/board/7591383/"));rejected(()->AnimanchProtocol.thread("<html>認証が必要です</html>",url));rejected(()->AnimanchProtocol.catalogue("<html>Forbidden</html>"));
  for(String bad:new String[]{"https://bbs.animanch.com.evil.test/board/7589284/","https://u@bbs.animanch.com/board/7589284/","http://bbs.animanch.com/board/7589284/","https://bbs.animanch.com:443/board/7589284/","https://bbs.animanch.com/board/../7589284/","https://bbs.animanch.com/board/7589284/?x=y"})ok(AnimanchProtocol.threadId(bad)==null,"strict URL boundary");
  for(String reply:new String[]{"https://bbs.animanch.com/board/7589284/98","https://bbs.animanch.com/board/7589284/98/"}){
   ok("7589284".equals(AnimanchProtocol.threadId(reply)),"reply URL keeps thread id");
   ok("98".equals(AnimanchProtocol.replyNumber(reply)),"reply URL keeps response number");
  }
  ok(AnimanchProtocol.replyNumber(url)==null,"thread URL has no reply selection");
  for(String bad:new String[]{"https://bbs.animanch.com/board/7589284/0","https://bbs.animanch.com/board/7589284/98/extra","https://bbs.animanch.com/board/7589284/%39%38","https://bbs.animanch.com/board/7589284/9999999"})
   ok(AnimanchProtocol.threadId(bad)==null,"reject ambiguous or out-of-range reply URLs");
  String form=AnimanchProtocol.replyForm("7589284","名前&=","a\r\nb\rc+&=");ok(form.contains("thread=7589284")&&form.contains("a%0Ab%0Ac%2B%26%3D"),"encoded text, normalized line endings");ok(form.contains("%26%3D"),"no extra fields from user text");rejected(()->AnimanchProtocol.replyForm("../2","","a"));rejected(()->AnimanchProtocol.replyForm("7589284","","  "));rejected(()->AnimanchProtocol.replyForm("7589284","あ".repeat(16),"a"));
  for(String number:new String[]{"80","\"80\""})ok(AnimanchProtocol.postedReply("{\"thread\":7589284,\"number\":"+number+",\"jump\":\"/board/7589284/#res80\"}","7589284")==80,"numeric or string server fields");
  rejected(()->AnimanchProtocol.postedReply("<html>Forbidden</html>","7589284"));rejected(()->AnimanchProtocol.postedReply("{\"error\":\"failed\"}","7589284"));ok(AnimanchProtocol.postedReply("{\"thread\":7589284,\"number\":80,\"jump\":\"https://evil.test/board/7589284/\"}","7589284")==80,"navigation hint is never followed and does not invalidate a receipt");
  String sample="<title>fixture｜あにまん掲示板</title><ul id=resList><li id=res1><span class=resname>name</span><div class=resbody><script>bad()</script><a href='javascript:bad()'>unsafe</a><a class=reslink href='#res2'>&gt;&gt;2</a><img src='file:///private/secret'></div></li></ul>";
  var safe=AnimanchProtocol.thread(sample,url).replies.get(0);ok(!safe.html.contains("script")&&!safe.html.contains("javascript:")&&!safe.html.contains("file:"),"strip executable/local media");ok(safe.html.contains("&gt;&gt;2"),"native anchor text preserved");
  rejected(()->AnimanchProtocol.thread(sample.replace("id=res1","id=res2"),url));rejected(()->AnimanchProtocol.thread(sample.replace("class=resbody","class=unknown"),url));
  var numbered=AnimanchProtocol.catalogue("<div class=card><a href='/board/123/'>level79</a><span class=threadCount>79</span></div>");ok(numbered.get(0).title.equals("level79"),"count must not truncate matching digits in the title");
  var anchorCards=AnimanchProtocol.catalogue("<a class=card href='/board/321/'><div class=card-body>ゲーム32 <p class=threadCount>24</p></div></a>"
      +"<a class=card href='https://evil.example/board/999/'><span class=threadCount>99</span>evil</a>"
      +"<a class=card href='https://bbs.animanch.com/board/321/'><span class=threadCount>30</span>duplicate</a>");
  ok(anchorCards.size()==1&&anchorCards.get(0).id.equals("321")&&anchorCards.get(0).title.equals("ゲーム32")&&anchorCards.get(0).replies==24,"anchor-card catalogue and strict URL/dedup");
  if(args.length>4){
   var games=AnimanchProtocol.catalogue(Files.readString(Path.of(args[3])));
   var fate=AnimanchProtocol.catalogue(Files.readString(Path.of(args[4])));
   ok(games.size()>10&&fate.size()>10,"real category32 and category9 contain visible topics");
   ok(games.stream().allMatch(t->t.replies>=1&&t.replies<=1000000&&!t.title.isEmpty())
       &&fate.stream().allMatch(t->t.replies>=1&&t.replies<=1000000&&!t.title.isEmpty()),"real category topics have usable counts and titles");
   ok(!games.get(0).id.equals(fate.get(0).id),"category32 does not reuse category9 catalogue");
  }
  var other=AnimanchProtocol.thread(sample.replace("href='#res2'","href='https://evil.test/#res2'"),url);ok(other.replies.get(0).html.contains("https://evil.test/#res2"),"foreign link never becomes a local reply anchor");
  ok(AnimanchProtocol.postingError("<p class='alert bg-danger'>Error: posting is closed</p><script>secret()</script><form><input value=private></form>").equals("\nError: posting is closed"),"only the explicit server error is surfaced, not scripts/forms");
  ok(AnimanchProtocol.postingError("{\"error\":\"本文が長すぎます\"}").contains("本文が長すぎます"),"JSON rejection text remains visible");ok(AnimanchProtocol.postingError("<html>arbitrary thread page</html>").isEmpty(),"ordinary page is not treated as an error message");ok(AnimanchProtocol.postingError("x".repeat(32769)).isEmpty(),"large error body never dumped into native dialog");
  if(args.length>2){String rejected=AnimanchProtocol.postingError(Files.readString(Path.of(args[2])));ok(rejected.contains("Cloudflare")&&rejected.contains("あにまんの認証"),"actual preCheck challenge explains normal authentication entry");ok(!rejected.contains("nonce-")&&!rejected.contains("<script"),"challenge markup and nonce are not dumped into native error UI");}
  System.out.println("PASS "+checks+" saved-page/native-data/post-construction checks; replies="+page.replies.size()+" images="+images+" topics="+topics.size());
 }
}
