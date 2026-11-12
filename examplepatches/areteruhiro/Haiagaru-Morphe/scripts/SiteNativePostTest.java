package app.morphe.extension.chmate;
import java.nio.file.*;import java.nio.charset.*;import java.io.*;import java.util.*;
public final class SiteNativePostTest {
 static int checks;static void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}interface Op{void run()throws Exception;}static void bad(Op f)throws Exception{try{f.run();throw new AssertionError("must reject");}catch(IOException expected){checks++;}}
 static String read(String file)throws Exception{return Files.readString(Path.of(file));}
 public static void main(String[]a)throws Exception{
  var bk=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=1/ctgid=137/bid=5071/tid=13601530/");var fb=SiteBoardProtocol.address("https://dat.2chan.net/t/res/380363.htm");var an=SiteBoardProtocol.address("https://bbs.animanch.com/board/7589284/");
  String bhtml=read(a[0]),fhtml=read(a[1]),ahtml=read(a[2]);var bp=SiteBoardProtocol.thread(bk,bk.thread,bhtml);var fp=SiteBoardProtocol.thread(fb,fb.thread,fhtml);var ap=SiteBoardProtocol.thread(an,an.thread,ahtml);
  for(var page:List.of(bp,fp,ap)){
   var board=page==bp?bk:page==fp?fb:an;
   String dat=new String(SiteNativeData.dat(board,page,x->x,x->x),"windows-31j");String[] lines=dat.split("\n");ok(lines.length==page.entries.size(),"exactly one DAT line per source response");
   for(String line:lines)ok(line.split("<>",-1).length==5,"native DAT field boundary");ok(lines[0].endsWith(page.title)||lines[0].contains("&#x"),"first line title");
   String quote=SiteNativeData.originalQuotes(">>1 >>2-3",page);ok(quote.equals(">>"+page.entries.get(0).original+" >>"+page.entries.get(1).original+"-"+page.entries.get(2).original),"native quotes map back to original numbers");
  }
  String emoji=new String(SiteNativeData.wire("日本語😀"),"windows-31j");ok(emoji.equals("日本語&#x1f600;"),"no question-mark loss for unsupported characters");
  var subject=SiteNativeData.subject(List.of(new SiteBoardProtocol.Topic("123","title<>\nnext",3)));String sub=new String(subject,"windows-31j");ok(sub.split("\n").length==1&&sub.contains("&lt;&gt;"),"subject cannot inject extra records");
  var bplan=SitePostProtocol.reply(bk,bk.thread,bhtml,"fixture","",">>0\r\n本文","delete");ok(bplan.multipart&&bplan.url.startsWith("https://bakusai.com/thr_cp/")&&bplan.fields.get("body").equals(">>0\n本文"),"Bakusai own current form and text");ok(bplan.fields.get("tid").equals(bk.thread)&&bplan.fields.get("bid").equals("5071"),"hidden target preserved");
  var fplan=SitePostProtocol.reply(fb,fb.thread,fhtml,"fixture","sage","返信","secret");ok(fplan.multipart&&fplan.charset.equals("windows-31j")&&fplan.fields.get("resto").equals(fb.thread),"Futaba current reply form");ok(fplan.fields.get("js").equals("off"),"no fabricated JavaScript proof");ok(fplan.fields.get("pwd").equals("secret"),"explicit deletion key only");
  var aplan=SitePostProtocol.reply(an,an.thread,ahtml,"fixture","","返信","");ok(aplan.check.endsWith("?preCheck")&&!aplan.multipart,"Animanch preflight required");ok(aplan.fields.size()==3&&aplan.fields.get("thread").equals(an.thread),"only site fields, no native account fields forwarded");
  for(var plan:List.of(bplan,fplan,aplan)){byte[] data=SitePostProtocol.encoded(plan,"Fixture-boundary-123456");ok(data.length>0,"post body encoded");String body=new String(data,plan.charset);if(plan.multipart)ok(body.endsWith("--Fixture-boundary-123456--\r\n"),"closed multipart");else ok(body.contains("text="),"URL-encoded body");}
  bad(()->SitePostProtocol.reply(fb,"1",fhtml,"","","reply",""));bad(()->SitePostProtocol.reply(bk,bk.thread,bhtml.replace("action=\"/thr_cp/","action=\"https://evil.test/thr_cp/"),"","","reply",""));bad(()->SitePostProtocol.reply(fb,fb.thread,fhtml.replace("<form", "<form" ).replace("id=\"fm\">","id=\"fm\"><input type=checkbox required name=agree>"),"","","reply",""));
  ok(SitePostProtocol.success(an,an.thread,200,null,"{\"thread\":7589284,\"number\":80,\"jump\":\"/board/7589284/\"}"),"explicit Animanch success");
  for(var board:List.of(bk,fb)){
   String id=board.thread;ok(SitePostProtocol.success(board,id,303,board.threadUrl(id),""),"same-thread redirect result");ok(!SitePostProtocol.success(board,id,303,"https://evil.test/",""),"foreign redirect not success");ok(!SitePostProtocol.success(board,id,200,null,"<title>認証が必要です</title>"),"authentication is not posting success");ok(!SitePostProtocol.success(board,id,200,null,"<title>投稿完了</title><div class=thre>user data</div>"),"thread title cannot spoof success");
  }
  System.out.println("PASS "+checks+" native DAT/subject/quote/multipart/post-result checks; no public posts");
 }
}
