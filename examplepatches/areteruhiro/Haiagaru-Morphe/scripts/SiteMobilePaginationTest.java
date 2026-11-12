package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;import java.util.*;import org.jsoup.Jsoup;

/** Saved real mobile thread: latest page has OP, older pages intentionally omit it. */
public final class SiteMobilePaginationTest {
 static int checks;static void ok(boolean value,String message){if(!value)throw new AssertionError(message);checks++;}
 interface Op{void run()throws Exception;}static void bad(Op op)throws Exception{try{op.run();throw new AssertionError("expected incomplete-thread rejection");}catch(IOException expected){checks++;}}
 public static void main(String[] args)throws Exception{
  Path dir=Path.of(args[0]);String initial=Files.readString(dir.resolve("site-live-corona.raw"));var board=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=1/ctgid=137/bid=5071/tid=13539922/");
  String older=Files.readString(dir.resolve("site-live-corona-page2.html"));ok(Jsoup.parse(older).getElementById("res0_body")==null,"real older page omits OP");
  bad(()->SiteBoardProtocol.bakusaiSlice(board,board.thread,Jsoup.parse(older)));
  var slice=SiteBoardProtocol.bakusaiSlice(board,board.thread,Jsoup.parse(older),false);ok(slice.entries.size()==7,"older mobile page provides seven replies without OP");
  List<String> fetched=new ArrayList<>();BakusaiPagination.Fetch fetch=url->{fetched.add(url);var matcher=java.util.regex.Pattern.compile("/p=([2-9]|1[01])/tp=1/$").matcher(url);if(!matcher.find())throw new AssertionError("unexpected source "+url);return Files.readString(dir.resolve("site-live-corona-page"+matcher.group(1)+".html"));};
  var page=BakusaiPagination.thread(board,board.thread,initial,fetch);ok(page.entries.size()==72,"OP plus all 71 real replies");ok(fetched.size()==10&&new HashSet<>(fetched).size()==10,"each older page fetched exactly once");
  for(int n=0;n<72;n++)ok(page.entries.get(n).original.equals(""+n),"complete ordered response "+n);
  String dat=new String(SiteNativeData.dat(board,page,x->x,x->x),"windows-31j");ok(dat.split("\n").length==72,"all responses emitted as native DAT");
  ok(page.entries.get(0).media.size()==2,"only two article images, no toolbar icons or loading images");ok(!page.entries.get(0).body.contains("ぶっちゃけ")&&!page.entries.get(0).body.contains("ハイハイ"),"replies are not duplicated inside OP");
  ok(SiteNativeData.originalQuotes(">>1 >>72",page).equals(">>0 >>71"),"standard editor quotes map across mobile continuation pages");
  bad(()->BakusaiPagination.thread(board,board.thread,initial.replace("id=\"res0_body\"","id=\"missing\""),fetch));
  bad(()->BakusaiPagination.thread(board,board.thread,initial,url->older));
  bad(()->SiteBoardProtocol.bakusaiSlice(board,"12345",Jsoup.parse(older),false));
  try{SitePostProtocol.reply(board,board.thread,initial,"","","投稿確認","" );throw new AssertionError("closed thread must reject before submission");}catch(IOException closed){ok(closed.getMessage().contains("30日")&&closed.getMessage().contains("投稿受付が終了"),"actual archived thread explains upstream posting closure");}
  String unavailable=Files.readString(dir.resolve("site-device-mobile-pages/page10.html"));
  var partial=BakusaiPagination.thread(board,board.thread,initial,url->url.contains("/p=10/")?unavailable:fetch.get(url));
  ok(partial.entries.size()==72,"upstream error preserves native response numbering");ok(partial.entries.get(0).body.contains("一部のレスが未取得"),"partial result is disclosed in OP");
  for(int n=2;n<=8;n++)ok(partial.entries.get(n).name.equals("未取得")&&partial.entries.get(n).body.contains("thr_res:778"),"explicit unavailable response "+n);
  ok(!partial.entries.get(1).name.equals("未取得")&&!partial.entries.get(71).name.equals("未取得"),"available pages before and after an error remain readable");
  String lastError=Files.readString(dir.resolve("site-last-page11.raw"));var twoErrors=BakusaiPagination.thread(board,board.thread,initial,url->url.contains("/p=10/")?unavailable:url.contains("/p=11/")?lastError:fetch.get(url));
  ok(twoErrors.entries.size()==72&&twoErrors.entries.get(1).name.equals("未取得"),"second real upstream error still preserves fetched body and numbering");ok(twoErrors.entries.get(1).body.contains("thr_res:759")&&twoErrors.entries.get(1).body.contains("thr_res:778"),"actual upstream error codes disclosed");
  List<String> failedRetry=new ArrayList<>();bad(()->BakusaiPagination.thread(board,board.thread,unavailable,url->{failedRetry.add(url);return unavailable;}));
  ok(failedRetry.size()==1&&failedRetry.get(0).endsWith("/p=1/tp=1/"),"source error retries explicit first page once, then reports the real failure");
  System.out.println("PASS "+checks+" real mobile pagination/OP/target/completeness checks; 72 native DAT rows; public posts=0");
 }
}
