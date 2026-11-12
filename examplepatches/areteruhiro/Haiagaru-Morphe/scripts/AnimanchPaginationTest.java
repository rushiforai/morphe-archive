package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;import java.util.*;
public class AnimanchPaginationTest{
 static int checks;static void ok(boolean v,String s){checks++;if(!v)throw new AssertionError(s);}interface Run{void run()throws Exception;}static void bad(Run task)throws Exception{try{task.run();throw new AssertionError("expected failure");}catch(IOException expected){checks++;}}
 static String html(String ids,String links,String marker){StringBuilder out=new StringBuilder("<title>試験｜あにまん掲示板</title><base href='https://bbs.animanch.com/board/'><link rel=canonical href='https://bbs.animanch.com/board/7596018/'><ul id=resList>");for(String id:ids.split(","))out.append("<li id=res").append(id).append("><div class=resbody>本文").append(id).append("</div></li>");return out+"</ul><a id=autoCheck name='"+marker+"'></a><ul class=pagination>"+links+"</ul>";}
 public static void main(String[]args)throws Exception{
 var board=SiteBoardProtocol.address("https://bbs.animanch.com/board/7596018/");String root="build/animanch-7596018/",initial=Files.readString(Path.of(root+"android.raw")),page=Files.readString(Path.of(root+"page1.raw"));
 bad(()->AnimanchProtocol.thread(initial,board.threadUrl("7596018")));List<String> fetched=new ArrayList<>();var all=AnimanchPagination.thread(board,"7596018",initial,u->{fetched.add(u);return page;});ok(all.entries.size()>=274,"real mobile OP plus latest 200 merges with older page");ok(fetched.equals(List.of("https://bbs.animanch.com/board/7596018/1/")),"base-relative older link resolves to exactly same thread page");for(int n=0;n<all.entries.size();n++)ok(all.entries.get(n).original.equals(""+(n+1)),"original numbering is contiguous and preserved");
 var full=AnimanchPagination.thread(board,"7596018",Files.readString(Path.of(root+"source.raw")),u->{throw new AssertionError("complete desktop page needs no requests");});ok(full.entries.size()==273,"desktop full thread remains supported");
 String latest=html("1,4,5","<a href='./7596018/1/'>1</a>","5"),older=html("1,2,3","<a href='./7596018/2/'>2</a>","5");var merged=AnimanchPagination.thread(board,"7596018",latest,u->older);ok(merged.entries.size()==5,"mobile page boundaries merge without duplicate OP");
 var first=AnimanchPagination.thread(board,"7596018",older,u->latest);ok(first.entries.size()==5,"first-page response uses total counter to request later page");
 bad(()->AnimanchPagination.thread(board,"7596018",latest,u->html("1,2","","5")));
 bad(()->AnimanchPagination.thread(board,"7596018",latest,u->{throw new IOException("HTTP 403");}));
 var overlap=AnimanchPagination.thread(board,"7596018",latest,u->older.replace("本文1","別のプレビュー表示"));ok(overlap.entries.get(0).body.contains("本文1"),"cross-page overlap retains the initial response snapshot despite preview markup changes");
 bad(()->AnimanchPagination.thread(board,"7596018",latest,u->html("1,2,2,3","","5")));
 bad(()->AnimanchPagination.thread(board,"7596018",latest,u->older.replace("7596018/'","999/'")));
 for(String url:List.of("https://bbs.animanch.com/board/999/1/","https://evil.invalid/board/7596018/1/","http://bbs.animanch.com/board/7596018/1/","https://u@bbs.animanch.com/board/7596018/1/","https://bbs.animanch.com:443/board/7596018/1/","https://bbs.animanch.com/board/7596018/1/?x=1","https://bbs.animanch.com/board/7596018/%31/"))ok(AnimanchPagination.pageUrl(url,"7596018")==null,"reject foreign/ambiguous pagination targets");
 List<String> requests=new ArrayList<>();bad(()->AnimanchPagination.thread(board,"7596018",html("1,4,5","<a href='https://evil.invalid/board/7596018/1/'>bad</a>","5"),u->{requests.add(u);return older;}));ok(requests.isEmpty(),"bad links never reach transport");
 System.out.println("PASS "+checks+" mobile Animanch pagination/real-source/sequence/isolation regressions; rows="+all.entries.size());
 }
}
