package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;
public final class BakusaiNewsTest {
    static int checks;static void ok(boolean value,String text){checks++;if(!value)throw new AssertionError(text);}
    interface Run{void go()throws Exception;}static void bad(Run run)throws Exception{try{run.go();throw new AssertionError("invalid catalog accepted");}catch(IOException expected){checks++;}}
    public static void main(String[] args)throws Exception{
        String json=Files.readString(Path.of("build/bakusai-warning-browser/yami-news.json"));var items=BakusaiNews.catalogue(json);ok(items.size()==59,"all real news catalog rows, beyond first visible page");
        ok(items.get(0).id.equals("13607621")&&items.get(0).title.contains("医薬品"),"actual thread ID and title");
        for(var row:items)ok(row.id.equals(SiteBoardProtocol.address(row.url).thread),"every catalog row maps to own native source ID");
        var plan=BakusaiNews.request();ok(plan.url.equals("https://bakusai.com/img_newimgjson/")&&plan.fields.size()==2&&plan.fields.get("key").equals("YamiNewsTidList")&&plan.fields.get("newsFlg").equals("true"),"exact page's read-only catalog request, not submission form");
        var unknown=java.util.List.of(new SiteBoardProtocol.Topic(items.get(0).id,items.get(0).title,0));ok(new String(SiteNativeData.subject(unknown,true),"windows-31j").contains("(0)"),"explicit unknown-count catalog produces native subject without inventing replies");
        try{SiteNativeData.subject(unknown);throw new AssertionError("ordinary source count validation weakened");}catch(IllegalArgumentException expected){checks++;}
        String html=Files.readString(Path.of("build/bakusai-warning-browser/first-news.html"));var source=BakusaiNews.canonical(items.get(0).url,items.get(0).id,html);ok(source.path.contains("ctgid=137/"),"API's historical ctgid104 corrected from real canonical source");
        var page=BakusaiPagination.thread(source,items.get(0).id,html,url->{throw new AssertionError("single page expected");});ok(page.entries.size()==3,"real news OP plus two replies");
        var reply=SitePostProtocol.reply(source,items.get(0).id,html,"","","test","");ok(reply.fields.get("ctgid").equals("137")&&reply.fields.get("tid").equals("13607621"),"reply plan targets canonical real board and thread; no public POST");
        ok(SiteBoardProtocol.address("https://bakusai.com/yamibaito/").path.equals("yamibaito/"),"source page may be registered as a board");
        bad(()->BakusaiNews.catalogue(json.replace("bakusai.com%2Fthr_res","elsewhere.invalid%2Fthr_res")));
        bad(()->BakusaiNews.canonical(items.get(0).url,"123",html));bad(()->BakusaiNews.catalogue("[]"));
        System.out.println("PASS "+checks+" real dynamic news catalog/canonical source/native body/post target checks; public posts=0");
    }
}
