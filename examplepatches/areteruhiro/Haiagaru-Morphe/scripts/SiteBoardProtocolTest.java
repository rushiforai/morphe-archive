package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;
public class SiteBoardProtocolTest {
 static int checks;static void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 interface Op{void run()throws Exception;}static void bad(Op f)throws Exception{try{f.run();throw new AssertionError("must reject");}catch(IOException expected){checks++;}}
 public static void main(String[]a)throws Exception{
  var bk=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=1/ctgid=137/bid=5071/tid=13601530/");
  ok(bk.thread.equals("13601530"),"bakusai thread link");ok(bk.url.endsWith("bid=5071/"),"stable board identity");var bp=SiteBoardProtocol.thread(bk,"13601530",Files.readString(Path.of(a[0])));ok(bp.entries.size()==17,"OP plus all 16 replies, skip hidden template");ok(bp.entries.get(1).original.equals("1"),"original numbering preserved");ok(bp.entries.get(7).body.contains("削除"),"deleted slot retained");
  var bt=SiteBoardProtocol.topics(bk,Files.readString(Path.of(a[1])));ok(!bt.isEmpty(),"bakusai list");ok(bt.stream().anyMatch(t->t.id.equals("13601530")&&t.count>=17),"same board count");
  var fb=SiteBoardProtocol.address("https://dat.2chan.net/t/res/380645.htm");ok(fb.thread.equals("380645"),"futaba thread link");var fp=SiteBoardProtocol.thread(fb,"380645",Files.readString(Path.of(a[2])));ok(fp.entries.size()==1&&fp.entries.get(0).original.equals("380645"),"futaba OP-only thread");ok(fp.title.contains("そら豆"),"Shift-JIS decoded text");ok(fp.entries.get(0).media.size()==1,"original image, no thumb duplicate");var ft=SiteBoardProtocol.topics(fb,Files.readString(Path.of(a[3])));ok(ft.size()>10,"futaba catalogue");ok(ft.stream().anyMatch(t->t.id.equals("380645")&&t.count==1),"zero-reply OP counted once");
  var fr=SiteBoardProtocol.thread(fb,"380363",Files.readString(Path.of(a[4])));ok(fr.entries.size()>2,"futaba replies");ok(fr.entries.stream().map(e->e.original).distinct().count()==fr.entries.size(),"board-global numbers unique");
  var games=SiteBoardProtocol.address("https://bbs.animanch.com/category32/");
  var fate=SiteBoardProtocol.address("https://bbs.animanch.com/category9/");
  ok(!SiteBoardProtocol.sameBoard(games,fate),"animanch category32 must not route to category9");
  ok(!SiteBoardCatalog.key(games).equals(SiteBoardCatalog.key(fate)),"categories have separate stable keys");
  var linked=SiteBoardProtocol.address("https://bbs.animanch.com/board/7607346/");
  ok(!SiteBoardProtocol.sameBoard(games,linked)&&!SiteBoardProtocol.sameBoard(fate,linked),"unclassified thread is not a board identity");
  ok(SiteBoardProtocol.threadIn(games,"https://bbs.animanch.com/board/7607346/").equals("7607346"),"catalogue may extract an unclassified thread ID");
  ok(SiteBoardProtocol.matchesRegisteredBoard(games,linked,"/category32/"),"thread must resolve to games when category32 is known");
  ok(!SiteBoardProtocol.matchesRegisteredBoard(fate,linked,"/category32/"),"thread must not resolve to Fate when category32 is known");
  ok(!SiteBoardProtocol.matchesRegisteredBoard(games,linked,null)&&!SiteBoardProtocol.matchesRegisteredBoard(fate,linked,null),"unknown category must not guess");
  ok(SiteBoardProtocol.matchesRegisteredBoard(games,SiteBoardProtocol.address("https://bbs.animanch.com/category32/"),null),"exact category match");
  var bakusaiOtherRegion=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=2/ctgid=137/bid=5071/");
  var bakusaiOtherBoard=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=2/ctgid=137/bid=5072/");
  ok(SiteBoardProtocol.sameBoard(bk,bakusaiOtherRegion)&&!SiteBoardProtocol.sameBoard(bk,bakusaiOtherBoard),"regional aliases retain only the same board");
  for(String origin:new String[]{"https://img.2chan.net/b/","https://may.2chan.net/b/"}){
    var board=SiteBoardProtocol.address(origin);
    ok(board.url.equals(origin)&&board.threadUrl("123456").equals(origin+"res/123456.htm"),"img/may board URL identity");
    String html="<div class='thre' data-res='123456'><span class='csb'>二次元裏</span><span class='cno'>No.123456</span>"
      +"<a href='/b/src/123456.jpg'><img src='/b/thumb/123456s.jpg'></a><blockquote>本文</blockquote>"
      +"<table><td class='rtd'><span class='cno'>No.123457</span><blockquote>返信</blockquote></td></table></div>";
    var page=SiteBoardProtocol.thread(board,"123456",html);
    ok(page.entries.size()==2&&page.entries.get(0).media.equals(java.util.List.of(origin+"src/123456.jpg")),"img/may OP media differs from reply or thumbnail");
    ok(SiteBoardProtocol.threadIn(board,origin+"res/123456.htm").equals("123456"),"img/may thread belongs to board");
  }
  ok(!SiteBoardCatalog.key(SiteBoardProtocol.address("https://img.2chan.net/b/")).equals(SiteBoardCatalog.key(SiteBoardProtocol.address("https://may.2chan.net/b/"))),"img/may keys remain distinct");
  ok(!SiteBoardProtocol.sameBoard(SiteBoardProtocol.address("https://img.2chan.net/b/"),SiteBoardProtocol.address("https://may.2chan.net/b/")),"futaba hosts remain distinct");
  ok(!SiteBoardProtocol.sameBoard(SiteBoardProtocol.address("https://img.2chan.net/b/"),SiteBoardProtocol.address("https://img.2chan.net/dec/")),"futaba paths remain distinct");
  if(a.length>6){
    String[] hosts={"img","may"},ids={"1486065756","1447081005"},media={"1794378856807.jpg","1794367201737.jpg"};
    for(int i=0;i<hosts.length;i++){
      final String expectedId=ids[i];
      var board=SiteBoardProtocol.address("https://"+hosts[i]+".2chan.net/b/");
      var page=SiteBoardProtocol.thread(board,ids[i],Files.readString(Path.of(a[5+i]),java.nio.charset.Charset.forName("Windows-31J")));
      ok(page.entries.size()>1&&page.entries.get(0).original.equals(ids[i]),hosts[i]+" actual opening post first");
      ok(page.entries.get(0).media.contains(board.url+"src/"+media[i]),hosts[i]+" actual full-size opening image");
      ok(page.entries.get(0).media.stream().noneMatch(m->m.contains("/thumb/")),hosts[i]+" actual thumbnail not selected as original");
      ok(page.entries.stream().skip(1).noneMatch(e->e.original.equals(expectedId)),hosts[i]+" actual replies are distinct from opening post");
    }
  }
  for(String x:new String[]{"http://bakusai.com/thr_tl/acode=1/ctgid=137/bid=5071/","https://evil.test/t/","https://dat.2chan.net.evil.test/t/","https://user@dat.2chan.net/t/","https://dat.2chan.net/t/../t/","https://dat.2chan.net/t/?x=y","https://bakusai.com/img_nl/acode=1/ctgid=137/"})bad(()->SiteBoardProtocol.address(x));
  bad(()->SiteBoardProtocol.thread(fb,"380645","<html>Forbidden</html>"));bad(()->SiteBoardProtocol.thread(bk,"99999",Files.readString(Path.of(a[0]))));bad(()->SiteBoardProtocol.topics(fb,"<html>認証が必要です</html>"));
  System.out.println("PASS "+checks+" independent site-address/list/thread/media checks; bakusai="+bp.entries.size()+" futaba="+fr.entries.size()+" catalogue="+ft.size());
 }
}
