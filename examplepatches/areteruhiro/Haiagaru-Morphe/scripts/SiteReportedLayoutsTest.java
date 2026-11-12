package app.morphe.extension.chmate;

import java.nio.file.*;import java.nio.charset.*;import java.util.*;import java.io.*;

/** Regressions from reported boards; all upstream bytes are supplied files. */
public final class SiteReportedLayoutsTest {
    static int checks;static void ok(boolean v,String s){checks++;if(!v)throw new AssertionError(s);}
    static String text(String path,String encoding)throws Exception{return new String(Files.readAllBytes(Path.of(path)),Charset.forName(encoding));}
    public static void main(String[] args)throws Exception {
        String root=args[0];
        var disaster=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=15/ctgid=148/bid=1532/");
        var topics=SiteBoardProtocol.topics(disaster,text(root+"/site-bugs-bak-disaster.raw","UTF-8"));
        ok(!topics.isEmpty(),"reported text-only disaster board parses");ok(topics.stream().anyMatch(t->t.title.contains("渡良瀬遊水地")&&t.count==13),"text list title and response count remain distinct");
        var normal=SiteBoardProtocol.bakusaiSlice(disaster,"9332038",org.jsoup.Jsoup.parse(text(root+"/site-bugs-bak-disaster-android.raw","UTF-8"),disaster.threadUrl("9332038")));
        ok(normal.title.contains("渡良瀬遊水地"),"mobile #threadBody does not select desktop layout");
        ok(normal.entries.get(0).body.contains("夕方から燃えて"),"mobile ordinary OP extracted");
        var news=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=2/ctgid=137/bid=1098/");
        ok(SiteBoardProtocol.topics(news,text(root+"/site-bugs-bak-incidents.raw","UTF-8")).size()>5,"news cards continue to parse");
        var article=SiteBoardProtocol.bakusaiSlice(news,"13611011",org.jsoup.Jsoup.parse(text(root+"/site-bugs-bak-news-android.raw","UTF-8"),news.threadUrl("13611011")));
        ok(!article.entries.isEmpty()&&article.title.contains("所持金"),"news article mobile layout retained");
        for(String[] site:new String[][]{{"cat","https://may.2chan.net/27/"},{"showa","https://dec.2chan.net/76/"}}){
            var board=SiteBoardProtocol.address(site[1]);String cat=text(root+"/site-bugs-fut-"+site[0]+".raw","MS932"),index=text(root+"/site-bugs-fut-"+site[0]+"-index.raw","MS932");
            List<String> fetched=new ArrayList<>();var resolved=FutabaCatalogue.topics(board,cat,url->{fetched.add(url);return index;});
            ok(resolved.size()==SiteBoardProtocol.topics(board,cat).size(),"catalogue ordering and size retained");
            var title=resolved.get(0);ok(!title.title.equals("No."+title.id),"first title uses original OP rather than id");
            if(site[0].equals("showa"))ok(title.title.length()>4,"Showa title is not truncated to four characters");
            ok(fetched.size()<=10&&fetched.stream().allMatch(u->u.startsWith(board.url)),"index lookups stay bounded and on original board");
        }
        var board=SiteBoardProtocol.address("https://dec.2chan.net/76/");
        String cat="<table id=cattable><tr><td><a href='res/123.htm'>image</a><small>短い</small><font>0</font></td></tr></table>";
        String index="<form method=get action='1.htm'><input type=submit></form><a href='https://elsewhere.invalid/2.htm'>bad</a><form method=post action='futaba.php'>post</form>";
        String next="<div class=thre data-res=123><span class=csb>無題</span><blockquote>本来の長いタイトル本文</blockquote><table><td><blockquote>返信の混入は禁止</blockquote></td></table></div>";
        List<String> fetched=new ArrayList<>();var resolved=FutabaCatalogue.topics(board,cat,url->{fetched.add(url);return url.endsWith("1.htm")?next:index;});
        ok(resolved.get(0).title.equals("本来の長いタイトル本文"),"GET page form resolves title without reply contamination");
        ok(fetched.equals(Arrays.asList(board.url+"futaba.htm",board.url+"1.htm")),"never follows POST form or other host");
        var cached=FutabaCatalogue.topics(board,cat,url->{throw new AssertionError("full title should be reused without another page fetch");});
        ok(cached.get(0).title.equals("本来の長いタイトル本文"),"bounded title cache avoids repeated index downloads");
        System.out.println("PASS "+checks+" reported Bakusai/Futaba format and title regressions");
    }
}
