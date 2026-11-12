package app.morphe.extension.chmate;
import java.nio.file.*;
import java.util.*;
import java.io.IOException;
public final class BakusaiRecruitmentTest {
    static int checks;
    static void ok(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    static String row(String id,String title,String tail){return "<a href='/thr_res/acode=10/ctgid=135/bid=829/tid="+id+"/tp=1/'>"+title+"</a>"+tail+"<br>";}
    public static void main(String[] args)throws Exception {
        var board=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=10/ctgid=135/bid=829/");
        String html=Files.readString(Path.of("build/bakusai-fukuoka829/board.html"));
        var rows=SiteBoardProtocol.topics(board,html);
        ok(rows.size()==25,"25 real threads, excluding five external recruitment promotions");
        ok(rows.get(0).id.equals("5262240")&&rows.get(0).title.equals("小倉")&&rows.get(0).count==2,"first row keeps title and OP+one reply");
        ok(rows.get(1).id.equals("12309269")&&rows.get(1).count==3,"second row has independent count");
        ok(rows.stream().anyMatch(r->r.id.equals("12228803")&&r.count==1),"zero replies still includes OP");
        ok(rows.stream().anyMatch(r->r.id.equals("4276699")&&r.count==74),"multi-page thread counter");
        String thread=Files.readString(Path.of("build/bakusai-fukuoka829/thread5262240.html"));
        var page=BakusaiPagination.thread(board,"5262240",thread,u->{throw new AssertionError("one page expected");});
        ok(page.entries.size()==2&&page.entries.get(1).original.equals("1"),"actual source OP and reply readable");
        var plan=SitePostProtocol.reply(board,"5262240",thread,"","","test","");
        ok(plan.url.startsWith("https://bakusai.com/thr_cp/")&&plan.fields.get("tid").equals("5262240"),"existing reply form targets exact thread; no POST sent");
        String source="<div class=thr_list><div id=thr_list3>"+row("1","title (999件)","&nbsp;11/08 01:23&nbsp;(0件)")+row("2","second","<span>11/07 22:00</span> <b>（1,234件）</b>")+"</div></div>";
        var sample=SiteBoardProtocol.topics(board,source);ok(sample.size()==2&&sample.get(0).count==1&&sample.get(1).count==1235,"title digits and inline formatted counts stay separate");
        var times=SiteBoardProtocol.topics(board,"<div class=thr_list><div id=thr_list3>"+row("1","recent","12時間前 (8件)")+row("2","dated","2026/11/08 12:00 (1件)")+"</div></div>");ok(times.size()==2&&times.get(0).count==9&&times.get(1).count==2,"relative and full-year labels do not alter response count");
        String bad="<div class=thr_list><div id=thr_list3>"+row("1","missing","11/08 01:23")+row("2","valid","11/08 01:23 (3件)")+row("3","bad","(1件) unrelated")+row("4","bad","(1000000件)")+"<a href='/thr_res/acode=10/ctgid=135/bid=830/tid=5/'>other board</a>(2件)<br><a href='https://recruit.bakusai.com/view/uid=1/'>promotion</a>(7件)<br></div></div>";
        var filtered=SiteBoardProtocol.topics(board,bad);ok(filtered.size()==1&&filtered.get(0).id.equals("2")&&filtered.get(0).count==4,"no borrowing next row, foreign board, promotion or excessive count");
        try {SiteBoardProtocol.topics(board,"<div class=header>"+row("1","header","(2件)")+"</div>");throw new AssertionError("header accepted");}catch(IOException expected){checks++;}
        for(String[] item:new String[][]{{"1","注意喚起ページ"},{"2","外部求人サイト"}}){try{SiteBoardProtocol.topics(board,Files.readString(Path.of("build/bakusai-fukuoka829/prefectures/board-"+item[0]+".html")));throw new AssertionError("non-thread listing accepted");}catch(IOException expected){ok(expected.getMessage().contains(item[1]),"actual non-thread source gets precise explanation");}}
        String warning=Files.readString(Path.of("build/bakusai-fukuoka829/hokkaido-general-current.html"));
        ok("https://bakusai.com/yamibaito/".equals(SiteBoardProtocol.webDestination(board,warning)),"actual warning listing has exact browser destination");
        ok(SiteBoardProtocol.webDestination(board,html)==null,"ordinary recruitment threads retain native reader");
        ok(SiteBoardProtocol.webDestination(board,warning.replace("</div>",row("99","real thread","(1件)")+"</div>"))==null,"real thread mixed into listing prevents automatic web fallback");
        ok(SiteBoardProtocol.webDestination(board,warning.replace("/yamibaito/","https://elsewhere.invalid/yamibaito/"))==null,"foreign warning destinations rejected");
        ok(SiteBoardProtocol.webDestination(board,Files.readString(Path.of("build/bakusai-fukuoka829/prefectures/board-2.html")))==null,"external recruitment pages not redirected to unrelated warning site");
        System.out.println("PASS "+checks+" recruitment list/body/form/counter boundary checks; public posts=0");
    }
}
