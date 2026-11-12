package app.morphe.extension.chmate;
import java.nio.file.*;import java.net.*;import java.io.*;import java.util.*;import org.jsoup.Jsoup;
public final class SitePostBugsTest {
 static int checks;static void ok(boolean value,String message){if(!value)throw new AssertionError(message);checks++;}
 public static void main(String[]args)throws Exception{
  Path dir=Path.of(args[0]);var board=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=1/ctgid=137/bid=5071/tid=13585881/");
  String older=Files.readString(dir.resolve("bakusai-android.raw")),first=Files.readString(dir.resolve("bakusai.raw"));
  ok(Jsoup.parse(older).selectFirst("#res0_body,option[selected]")==null,"actual Android response omits OP and selected option");
  List<String> requests=new ArrayList<>();var page=BakusaiPagination.thread(board,board.thread,older,url->{requests.add(url);if(!url.equals(board.threadUrl(board.thread)+"p=1/tp=1/"))throw new AssertionError(url);return first;});
  ok(requests.size()==1,"missing OP fetches latest page exactly once");ok(page.entries.size()==3&&page.entries.get(0).original.equals("0"),"article plus two responses restored");
  try{BakusaiPagination.thread(board,board.thread,older,url->older);throw new AssertionError("must reject missing OP");}catch(IOException expected){checks++;}
  ok(SiteBoardProtocol.bakusaiEmptyMobile(older)&&!SiteBoardProtocol.bakusaiEmptyMobile(first),"desktop retry limited to actual empty mobile representation");
  String desktop=Files.readString(dir.resolve("bakusai-desktop.raw"));var partial=BakusaiPagination.thread(board,board.thread,desktop,url->{throw new AssertionError("single-page upstream emptiness must not loop");});
  ok(partial.entries.size()==3&&partial.entries.get(0).body.contains("一部のレスが未取得"),"actual desktop article remains readable despite stale response count");
  ok(partial.entries.get(1).name.equals("未取得")&&partial.entries.get(1).body.contains("一覧を空"),"missing upstream responses never presented as fetched/deleted");
  var fb=SiteBoardProtocol.address("https://jun.2chan.net/oe/res/934731.htm");String success=new String(Files.readAllBytes(dir.resolve("futaba-spaced-post1.raw")),"windows-31j");
  ok(SitePostProtocol.success(fb,fb.thread,200,null,success),"actual titleless Futaba completion is success");
  ok(!SitePostProtocol.success(fb,"934732",200,null,success),"different thread is not success");
  ok(!SitePostProtocol.success(fb,fb.thread,200,null,success.replace("res/934731.htm","https://evil.test/oe/res/934731.htm")),"foreign redirect is not success");
  ok(!SitePostProtocol.success(fb,fb.thread,200,null,success.replace("に切り替えます","認証が必要です")),"redirect alone is not success");
  String cookie=new String(Files.readAllBytes(dir.resolve("futaba-spaced-post0.raw")),"windows-31j");
  ok(!SitePostProtocol.success(fb,fb.thread,200,null,cookie)&&SitePostProtocol.futabaRejection(cookie).contains("投稿されていません"),"explicit cookie rejection permits deliberate retry");
  ok(SitePostProtocol.futabaRejection(success).isEmpty(),"successful write never becomes retryable");
  ok(SitePostProtocol.futabaRejection("<body>操作が早すぎます あと2秒で再送できます").contains("2秒"),"upstream cooldown retained");
  ok(SitePostProtocol.futabaRejection("<body>cookieを有効にしてもう一度送信してください<script>x</script>").isEmpty(),"ambiguous response never automatically marked unsent");
  var cookies=new SiteSessionCookies();URI uri=URI.create("https://jun.2chan.net/oe/futaba.php?guid=on");
  cookies.receive(uri,Map.of("Set-Cookie",List.of("posttime=fixture; Path=/oe/; Secure","ptmt=fixture2; Path=/oe/; Secure")));
  ok(cookies.header(uri).contains("posttime=fixture")&&cookies.header(uri).contains("ptmt=fixture2"),"HTTP session retains upstream cookies");
  ok(cookies.header(URI.create("https://evil.test/oe/")).isEmpty(),"cookie host boundary");ok(cookies.header(URI.create("https://jun.2chan.net/other/")).isEmpty(),"cookie path boundary");
  ok(cookies.header(URI.create("http://jun.2chan.net/oe/")).isEmpty(),"secure cookies not sent over HTTP");ok(new SiteSessionCookies().header(uri).isEmpty(),"session is not global or persisted");
  for(String jump:List.of("","\"jump\":\"/board/7597656/1/?page=2#res14\",","\"jump\":\"https://untrusted.invalid/\",")){
   String receipt="{"+jump+"\"thread\":7597656,\"number\":14}";ok(AnimanchProtocol.postedReply(receipt,"7597656")==14,"receipt independent of unused browser hint");
   ok(SitePostProtocol.success(SiteBoardProtocol.address("https://bbs.animanch.com/board/7597656/"),"7597656",200,null,receipt),"native success emitted from matching receipt");
  }
  for(String receipt:List.of("{\"thread\":7597657,\"number\":14}","{\"thread\":7597656,\"number\":0}","{\"error\":\"rejected\"}","{\"thread\":\"bad\",\"number\":1}")){
   try{AnimanchProtocol.postedReply(receipt,"7597656");throw new AssertionError("invalid receipt");}catch(IOException expected){checks++;}
  }
  System.out.println("PASS "+checks+" reported thread/receipt/cookie-session/completion regressions");
 }
}
