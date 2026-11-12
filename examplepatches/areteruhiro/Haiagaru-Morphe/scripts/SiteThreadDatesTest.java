package app.morphe.extension.chmate;

import java.nio.file.*;
import java.time.*;
import java.util.Map;
import java.io.IOException;

public final class SiteThreadDatesTest {
    static int checks;
    static void ok(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public static void main(String[] args)throws Exception {
        long now=Instant.parse("2026-11-08T03:00:00Z").getEpochSecond();
        long day=Instant.parse("2026-11-07T03:00:00Z").getEpochSecond();
        for(String text:new String[]{"2026/11/07 12:00","26/11/07(土)12:00:00","2026年11月07日 12:00","2026-11-07 12:00:00"})
            ok(SiteThreadDates.parse(text,now)==day,"JST opening date: "+text);
        for(String text:new String[]{"2026/02/30 12:00","2027/11/07 12:00","No.9240000001","2026/11/07 24:00","昨日",""})
            ok(SiteThreadDates.parse(text,now)==0,"invalid/relative date is never guessed");
        ok(SiteThreadDates.momentum(100,day,now)==100000,"100 responses/day in thousandths");
        ok(SiteThreadDates.momentum(1,now,now)==86400000,"zero elapsed time remains finite");
        ok(SiteThreadDates.momentum(10,now+1,now)==0,"future date is not a negative momentum");
        ok(SiteThreadDates.momentum(0,day,now)==0,"no responses");
        Map<String,Long> cached=Map.of("hboard-one:7596018",day,"hboard-two:7596018",day);
        ok(SiteThreadDates.uniqueCachedDate(cached,"7596018",9247596018L)==day,"same synthetic thread ID resolves consistently across boards");
        ok(SiteThreadDates.uniqueCachedDate(Map.of("hboard-one:7596018",day,"hboard-two:7596018",day+60),"7596018",9247596018L)==9247596018L,"ambiguous synthetic thread ID is not assigned the wrong date");
        ok(SiteThreadDates.uniqueCachedDate(Map.of("hboard-one:17596018",day),"7596018",9247596018L)==9247596018L,"thread ID suffix must match exactly");
        var bak=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=1/ctgid=123/bid=1122/");
        String bakHtml=Files.readString(Path.of("build/external-board-dates/bakusai-football-thread.raw"));
        long actual=SiteThreadDates.opening(bak,"13031645",bakHtml);
        ok(actual==LocalDateTime.of(2025,12,16,19,29).atZone(ZoneId.of("Asia/Tokyo")).toEpochSecond(),"actual football opening date, not latest reply");
        var ani=SiteBoardProtocol.address("https://bbs.animanch.com/board/7596018/");
        String aniHtml=Files.readString(Path.of("build/site-boards-inst/assets/animanchThread.html"));
        ok(SiteThreadDates.opening(ani,"7596018",aniHtml)>0,"actual Animanch opening date selector");
        var fut=SiteBoardProtocol.address("https://dat.2chan.net/t/");
        String futHtml=Files.readString(Path.of("build/site-boards-inst/assets/futabaCookingReplies.txt"));
        var doc=org.jsoup.Jsoup.parse(futHtml);String id=doc.selectFirst(".thre[data-res]").attr("data-res");
        ok(SiteThreadDates.opening(fut,id,futHtml)>0,"actual Futaba opening date selector");
        ok(SiteThreadDates.opening(fut,"99999999999",futHtml)==0,"another thread cannot supply date");
        System.out.println("PASS "+checks+" creation-date and momentum checks");
    }
}
