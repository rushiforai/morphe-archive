package app.morphe.extension.chmate;
import java.nio.file.*;
import java.net.URI;
import java.util.*;
public final class FutabaUpdatesTest {
    static int checks;
    static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    public static void main(String[] args)throws Exception{
        String browserCookies="session=fixture; cxyl=14x6x4x1x1";
        for(String board:List.of("img","may")){
            for(String query:List.of("mode=cat","mode=cat&sort=3")){
                String url="https://"+board+".2chan.net/b/futaba.php?"+query;
                ok(SiteBoardProtocol.catalogueCookies(URI.create(url),browserCookies)
                        .equals("cxyl=14x6x100x0x0; session=fixture"),board+" catalogue requests longer titles and keeps session cookies");
            }
        }
        for(String url:List.of("https://img.2chan.net/b/res/123.htm",
                "https://may.2chan.net/b/res/123.htm","https://may.2chan.net/b/futaba.php?mode=catset")){
            ok(SiteBoardProtocol.catalogueCookies(URI.create(url),browserCookies).equals(browserCookies),
                    "catalogue preference is scoped to list requests");
        }
        var may=SiteBoardProtocol.address("https://may.2chan.net/b/");
        String fullTitle="カタログの長いタイトルを一覧に表示する";
        String popular="<table id=cattable><tr><td><a href='res/123.htm'>img</a><small>"
                +fullTitle+"</small><font>412</font></td></tr></table>";
        var popularTopic=SiteBoardProtocol.topics(may,popular).get(0);
        ok(popularTopic.title.equals(fullTitle)&&popularTopic.count==413,
                "popular catalogue keeps the long title and the reply count");
        String html="<table id=cattable><tr><td><a href='res/123.htm'>img</a><small>catalogue text</small><font>2</font></td></tr></table>";
        for(String host:new String[]{"may","img"}){
            var board=SiteBoardProtocol.address("https://"+host+".2chan.net/b/");
            var mirror=SiteBoardProtocol.address("http://die-or.work/"+host+"/b/");
            ok(mirror.url.equals(board.url),"mirror canonical identity");
            for(String subject:new String[]{"無念","無題",""}){
                String opening="<div class=thre data-res=123><span class=csb>"+subject+"</span><span class=cno>No.123</span><blockquote>本文でスレを識別<br>二行目</blockquote></div>";
                var topics=FutabaCatalogue.topics(board,html,url->opening,1);
                ok(topics.get(0).title.startsWith("本文でスレを識別"),host+" fallback "+subject);
                ok(topics.get(0).title.endsWith("("+host+")"),host+" list title label");
                ok(SiteBoardProtocol.thread(board,"123",opening).title.startsWith("本文でスレを識別"),host+" DAT fallback "+subject);
            }
            String opening="<div class=thre data-res=123><span class=csb>有効な題名</span><span class=cno>No.123</span><blockquote>本文</blockquote></div>";
            ok(SiteBoardProtocol.thread(board,"123",opening).title.equals("有効な題名"),"real subject retained");
            String second="<table><tr><td class=rtd><span class=cno>No.124</span><blockquote>画像<br>http://die-or.work/"+host+"/b/src/12345.png</blockquote></td></tr></table>";
            var page=SiteBoardProtocol.thread(board,"123",opening.replace("</div>",second+"</div>"));
            ok(page.entries.get(1).media.contains("https://"+host+".2chan.net/b/src/12345.png"),"plain second reply mirror image");
            String linked="<a href='http://"+host+".2chan.net/b/src/999.jpg'><img src='/b/thumb/999s.jpg'></a>";
            page=SiteBoardProtocol.thread(board,"123",opening.replace("<blockquote>",linked+"<blockquote>"));
            ok(page.entries.get(0).media.size()==1&&page.entries.get(0).media.get(0).contains("/src/999.jpg"),"HTTP attachment upgraded; no duplicate thumb");
        }
        String row="<tr><td class=title><a href='//may.2chan.net/b/res/123.htm'>スレ名</a></td><td class=ikioi>1,234</td><td class=res>45</td></tr>";
        var ranking=FutabaRanking.parse("<table>"+row+row+"<tr><td class=title><a href='https://evil.test/'>広告</a></td><td class=ikioi>1</td><td class=res>3</td></tr></table>");
        ok(ranking.size()==1,"ranking dedup and site boundaries");ok(ranking.get(0).speed==1234&&ranking.get(0).replies==45,"ranking counters");ok(ranking.get(0).url.equals("https://may.2chan.net/b/res/123.htm"),"ranking uses HTTPS");
        ok(ranking.get(0).title.endsWith("(may)"),"ranking shows source board");
        ok(!FutabaRanking.resultId("https://may.2chan.net/b/res/123.htm").equals(FutabaRanking.resultId("https://img.2chan.net/b/res/123.htm")),"same thread number in two boards stays distinct");
        if(args.length>0){var actual=FutabaRanking.parse(Files.readString(Path.of(args[0])));ok(actual.size()>10,"current public ranking parses");ok(actual.stream().anyMatch(r->r.url.startsWith("https://img.2chan.net/")),"img available");ok(actual.stream().anyMatch(r->r.url.startsWith("https://may.2chan.net/")),"may available");}
        System.out.println("PASS "+checks+" Futaba titles/ranking checks");
    }
}
