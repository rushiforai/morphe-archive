package app.morphe.extension.chmate;
import java.util.*;

public final class SiteCardExclusionsTest {
    static int count;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);count++;}
    static void rejects(String value){try{SiteCardExclusions.parse(value);throw new AssertionError("accepted "+value);}catch(IllegalArgumentException expected){count++;}}
    public static void main(String[] args){
        var defaults=SiteCardExclusions.parse(SiteCardExclusions.DEFAULT);
        for(String url:List.of("https://imgur.com/","https://imgur.com/a/abc","http://imgur.com/gallery/abc","https://www.imgur.com/abc","https://m.imgur.com/abc","https://IMGUR.COM/abc?x=1#part","https://i.imgur.com/abc.png"))
            check(SiteCardExclusions.excluded(defaults,url),"default imgur root/descendants "+url);
        for(String url:List.of("https://notimgur.com/","https://imgur.com.example.org/","https://news.yahoo.co.jp/articles/abc","https://example.org/imgur.com/","bad URL"))
            check(!SiteCardExclusions.excluded(defaults,url),"host boundaries "+url);
        var paths=SiteCardExclusions.parse("example.org/news/\nhttps://blog.example.net/article\nhttp://EXAMPLE.org:80/news");
        check(paths.size()==2,"normalize equivalent domain/path rules");
        for(String url:List.of("https://example.org/news","https://example.org/news/","https://example.org/news/123?x=1","https://sub.example.org/news/123","https://blog.example.net/article","https://blog.example.net/article/part"))
            check(SiteCardExclusions.excluded(paths,url),"path and descendants "+url);
        for(String url:List.of("https://example.org/newsroom","https://example.org/NEWS/","https://other.example.net/article","https://example.org/news/../sports/"))
            check(!SiteCardExclusions.excluded(paths,url),"path boundaries "+url);
        check(SiteCardExclusions.parse("\n \r\n").isEmpty(),"explicit empty removes default");
        check(!SiteCardExclusions.excluded(SiteCardExclusions.parse(""),"https://imgur.com/a/abc"),"removing imgur rule permits card");
        check(SiteCardExclusions.normalize("IMGUR.com\r\n\nhttps://imgur.com/\nhttps://EXAMPLE.org:443/news/").equals("https://imgur.com/\nhttps://example.org/news"),"editable canonical list");
        for(String bad:new String[]{"https://","https://user:pw@example.org/","https://example.org/?a=1","https://example.org/#x","ftp://example.org/","javascript:alert(1)","https://example.org:8443/","*.example.org","example.org bad","x".repeat(8193),null})rejects(bad);
        StringBuilder many=new StringBuilder();for(int i=0;i<100;i++)many.append("example.org/").append(i).append('\n');
        check(SiteCardExclusions.parse(many.toString()).size()==100,"100 rule limit");rejects(many+"example.org/extra");
        System.out.println("PASS "+count+" website card exclusion cases");
    }
}
