package app.morphe.extension.chmate;
import java.io.*;import java.nio.file.*;import java.util.*;import org.jsoup.Jsoup;

public final class BakusaiNavigationPagesTest {
 private static int checks;
 private static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 private static String html(String article,int... numbers){
  StringBuilder page=new StringBuilder("<title>試験｜4レス｜爆サイ.com</title><h1 id=title_thr>試験</h1><div class=thr_id>8520877</div><div id=threadBody>").append(article).append("</div><div id=res_list>");
  for(int n:numbers)page.append("<div class=res_list_article id=res").append(n).append("><div class=resbody>本文").append(n).append("</div></div>");
  return page.append("</div><a href='https://bakusai.com/thr_res/acode=15/ctgid=111/bid=4437/tid=8520877/p=2/tp=1/'>次</a>").toString();
 }
 public static void main(String[] args)throws Exception{
  var board=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=15/ctgid=111/bid=4437/tid=8520877/");
  String navigation="<div id=thr_pager><a href='/old'>前スレ</a></div>";
  var next=SiteBoardProtocol.bakusaiSlice(board,board.thread,Jsoup.parse(html(navigation,1,2)),false);
  ok(next.entries.size()==2&&next.entries.get(0).original.equals("1"),"navigation-only article is not an opening post");
  var full=BakusaiPagination.thread(board,board.thread,html("スレ本文",3,4),url->html(navigation,1,2));
  ok(full.entries.size()==5,"two actual pages form a complete DAT");
  for(int n=0;n<5;n++)ok(full.entries.get(n).original.equals(""+n),"continuous original numbering");
  List<String> fetched=new ArrayList<>();
  var older=BakusaiPagination.thread(board,board.thread,html("スレ本文",1,2),url->{fetched.add(url);return html("スレ本文",3,4);});
  ok(older.entries.size()==5&&fetched.size()==1&&fetched.get(0).endsWith("/p=1/tp=1/"),"older desktop initial page fetches latest page even without page selector");
  String error="<title>アクセスエラー｜爆サイ.com</title><div class=error_code_text>[ERROR_CODE:thr_res:759]<br>再アクセス</div>";
  fetched.clear();var recovered=BakusaiPagination.thread(board,board.thread,error,url->{fetched.add(url);return html(url.contains("/p=1/")?"スレ本文":navigation,url.contains("/p=1/")?3:1,url.contains("/p=1/")?4:2);});
  ok(recovered.entries.size()==5&&fetched.size()==2,"unpaged source error retries explicit first page then remaining pages");
  try{BakusaiPagination.thread(board,board.thread,error,url->error);throw new AssertionError("must fail");}catch(BakusaiAccessError source){ok(source.displayCode().equals("BKS-759")&&source.getMessage().contains("しばらくしてアクセスし直してください"),"bounded code and retry instruction retained when both forms fail");}
  ok(BakusaiAccessError.code(Jsoup.parse(html("[ERROR_CODE:thr_res:759]",3,4)))==null,"quoted source error in real post is not an error page");
  try{new BakusaiAccessError("<script>");throw new AssertionError("unsafe code");}catch(IllegalArgumentException expected){checks++;}
  try{BakusaiPagination.thread(board,board.thread,html("スレ本文",1,2),url->html("スレ本文",1,2));throw new AssertionError("repeated pages must fail");}catch(IOException expected){checks++;}
  Path root=Path.of("build/bakusai-8520877");String real=Files.readString(root.resolve("source.html"));
  var reported=BakusaiPagination.thread(board,board.thread,real,url->{var m=java.util.regex.Pattern.compile("/p=([0-9]+)/tp=1/$").matcher(url);if(!m.find())throw new AssertionError(url);try{return Files.readString(root.resolve("native-page-"+m.group(1)+".html"));}catch(IOException e){throw e;}});
  ok(reported.entries.size()==552,"actual 551 responses plus opening retain original slots");
  ok(reported.entries.stream().filter(row->row.name.equals("未取得")).count()==51,"actual source errors on old pages remain honestly unavailable");
  ok(reported.entries.get(0).body.contains("ネット検索")&&!reported.entries.get(0).body.contains("前スレ"),"actual first-page opening preserved");
  for(int n=0;n<reported.entries.size();n++)ok(reported.entries.get(n).original.equals(""+n),"actual native numbering");
  System.out.println("PASS "+checks+" explicit first-page/navigation-only/complete-pages/source-error/repeated-pages/actual-source checks");
 }
}
