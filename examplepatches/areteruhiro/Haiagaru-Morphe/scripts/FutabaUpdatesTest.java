package app.morphe.extension.chmate;
import java.nio.file.*;
import java.util.*;
public final class FutabaUpdatesTest {
    static int checks;
    static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    public static void main(String[] args)throws Exception{
        String html="<table id=cattable><tr><td><a href='res/123.htm'>img</a><small>catalogue text</small><font>2</font></td></tr></table>";
        for(String host:new String[]{"may","img"}){
            var board=SiteBoardProtocol.address("https://"+host+".2chan.net/b/");
            for(String subject:new String[]{"無念","無題",""}){
                String opening="<div class=thre data-res=123><span class=csb>"+subject+"</span><span class=cno>No.123</span><blockquote>本文でスレを識別<br>二行目</blockquote></div>";
                var topics=FutabaCatalogue.topics(board,html,url->opening,1);
                ok(topics.get(0).title.startsWith("本文でスレを識別"),host+" fallback "+subject);
                ok(SiteBoardProtocol.thread(board,"123",opening).title.startsWith("本文でスレを識別"),host+" DAT fallback "+subject);
            }
            String opening="<div class=thre data-res=123><span class=csb>有効な題名</span><span class=cno>No.123</span><blockquote>本文</blockquote></div>";
            ok(SiteBoardProtocol.thread(board,"123",opening).title.equals("有効な題名"),"real subject retained");
        }
        String row="<tr><td class=title><a href='//may.2chan.net/b/res/123.htm'>スレ名</a></td><td class=ikioi>1,234</td><td class=res>45</td></tr>";
        var ranking=FutabaRanking.parse("<table>"+row+row+"<tr><td class=title><a href='https://evil.test/'>広告</a></td><td class=ikioi>1</td><td class=res>3</td></tr></table>");
        ok(ranking.size()==1,"ranking dedup and site boundaries");ok(ranking.get(0).speed==1234&&ranking.get(0).replies==45,"ranking counters");ok(ranking.get(0).url.equals("https://may.2chan.net/b/res/123.htm"),"ranking uses HTTPS");
        if(args.length>0){var actual=FutabaRanking.parse(Files.readString(Path.of(args[0])));ok(actual.size()>10,"current public ranking parses");ok(actual.stream().anyMatch(r->r.url.startsWith("https://img.2chan.net/")),"img available");ok(actual.stream().anyMatch(r->r.url.startsWith("https://may.2chan.net/")),"may available");}
        System.out.println("PASS "+checks+" Futaba titles/ranking checks");
    }
}
