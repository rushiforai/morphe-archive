package app.morphe.extension.chmate;
import java.io.*;import java.nio.file.*;import java.util.*;
public final class SiteMenuPaginationTest {
 static int checks;static void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}interface Op{void run()throws Exception;}static void bad(Op op)throws Exception{try{op.run();throw new AssertionError("must reject incomplete data");}catch(IOException expected){checks++;}}
 public static void main(String[] a)throws Exception{
  Path dir=Path.of(a[0]);var bk=SiteBoardMenuProtocol.parse("bakusai",Files.readString(dir.resolve("bakusaiMenu.txt")));var fb=SiteBoardMenuProtocol.parse("futaba",Files.readString(dir.resolve("futabaMenu.txt")));var an=SiteBoardMenuProtocol.parse("animanch",Files.readString(dir.resolve("animanchMenu.json")));
  ok(bk.size()>100,"Bakusai real region boards");ok(fb.size()>30,"Futaba public menu");ok(an.size()>20,"Animanch saved categories");
  for(var menu:List.of(bk,fb,an)){Set<String> urls=new HashSet<>();for(var row:menu){ok(urls.add(row.url),"dedup URL");ok(SiteBoardProtocol.address(row.url).thread==null,"only board addresses");}}
  for(int n=0;n<15;n++)ok(SiteBoardMenuProtocol.source("bakusai",n).endsWith(SiteBoardMenuProtocol.REGIONS[n]+"_bbsmenu.json"),"15 exact source menus");bad(()->SiteBoardMenuProtocol.source("bakusai",15));bad(()->SiteBoardMenuProtocol.parse("futaba","<html>auth</html>"));
  int total=0;for(String region:SiteBoardMenuProtocol.REGIONS){var boards=SiteBoardMenuProtocol.parse("bakusai",Files.readString(dir.resolve("bakusaiMenu-"+region+".json")));ok(!boards.isEmpty(),"downloaded region "+region);total+=boards.size();}ok(total>5000,"all fifteen public region menus");
  var category=SiteBoardProtocol.address("https://bbs.animanch.com/category11/");ok(category.threadUrl("7591383").equals("https://bbs.animanch.com/board/7591383/"),"category independent thread URL");ok(SiteBoardProtocol.threadIn(category,"https://bbs.animanch.com/board/7591383/").equals("7591383"),"thread link in category");
  var board=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=1/ctgid=137/bid=5071/tid=13548303/");String html=Files.readString(dir.resolve("bakusaiPaged.txt"));List<String> calls=new ArrayList<>();
  BakusaiPagination.Fetch fetch=url->{calls.add(url);var match=java.util.regex.Pattern.compile("/p=([2-4])/tp=1/$").matcher(url);if(!match.find())throw new AssertionError("unexpected URL "+url);return Files.readString(dir.resolve("bakusaiPage"+match.group(1)+".txt"));};
  var thread=BakusaiPagination.thread(board,board.thread,html,fetch);ok(thread.entries.size()==182,"181 replies plus OP across real four pages");ok(calls.size()==3&&new HashSet<>(calls).size()==3,"only missing three pages once");for(int n=0;n<182;n++)ok(thread.entries.get(n).original.equals(""+n),"ordered complete response sequence");
  String dat=new String(SiteNativeData.dat(board,thread,x->x,x->x),"windows-31j");ok(dat.split("\n").length==182,"complete DAT");
  bad(()->BakusaiPagination.thread(board,board.thread,html,url->html));bad(()->BakusaiPagination.thread(board,board.thread,html,url->{throw new IOException("network");}));
  bad(()->BakusaiPagination.thread(board,board.thread,html.replace("/p=2/tp=1/","/p=2/tp=1/../../evil/"),url->"<html>challenge</html>"));
  System.out.println("PASS "+checks+" board-menu/pagination checks: Bakusai fifteen-region entries="+total+", Futaba="+fb.size()+", Animanch="+an.size()+", 182 DAT records; no public posts");
 }
}
