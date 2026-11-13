package app.morphe.extension.chmate;

import java.io.*;
import java.nio.charset.*;
import java.util.*;

public final class OpeningPostFetchTest {
    static int checks;
    static void check(boolean value,String why){if(!value)throw new AssertionError(why);checks++;}
    interface Action{void run()throws Exception;}
    static void fails(Action action)throws Exception{try{action.run();throw new AssertionError("expected rejection");}catch(IOException expected){checks++;}}
    static class Counted extends ByteArrayInputStream {
        int consumed;boolean closed;
        Counted(byte[] bytes){super(bytes);}
        @Override public synchronized int read(byte[] bytes,int off,int len){int n=super.read(bytes,off,len);if(n>0)consumed+=n;return n;}
        @Override public void close(){closed=true;}
    }
    static String html(String source,String kind,OpeningPostHtml.HasMedia media)throws Exception{
        Counted in=new Counted(source.getBytes(StandardCharsets.UTF_8));
        String result=OpeningPostHtml.read(in,"text/html; charset=UTF-8","https://example.org/board/123/",kind,"123",media);
        check(in.consumed<65536,"no full-thread read-ahead");check(in.closed,"reader closed at opening post");
        return result;
    }
    static EdgeOpeningDat.Transport ranges(byte[] dat,List<Integer> starts){return (first,last)->{
        starts.add(first);int end=Math.min(last,dat.length-1);
        byte[] chunk=EdgeOpeningDat.read(new ByteArrayInputStream(Arrays.copyOfRange(dat,first,end+1)),last-first+2);
        return new EdgeOpeningDat.Part(206,"bytes "+first+"-"+end+"/"+dat.length,"text/plain; charset=Shift_JIS",chunk);
    };}
    public static void main(String[] args)throws Exception{
        String tail="<li id=res3><div class=resbody>https://cdn.example.org/ignored.jpg "+"x".repeat(1000000)+"</div></li>";
        String animanch=html("<title>あにまん</title><ul id=resList><li id=res1><div class=resbody>https://cdn.example.org/first.jpg</div></li><li id=res2><div class=resbody>second</div></li>"+tail+"</ul>","animanch",unused->false);
        check(animanch.contains("first.jpg")&&!animanch.contains("res2")&&!animanch.contains("ignored.jpg"),"only Animanch post 1 retained");
        check(ThreadListThumbnailRules.openingTextMedia(animanch,"https://example.org/",4).equals(List.of("https://cdn.example.org/first.jpg")),"only first-post media extracted");
        String five=html("<div class=thread><div class=post><div class=message><a href='https://cdn.example.org/first.jpg'>image</a></div></div><div class=post><div class=message>"+tail+"</div></div></div>","five",unused->false);
        check(ThreadListThumbnailRules.firstFiveChImages(five,"https://egg.5ch.io/test/read.cgi/test/123/1",4).equals(List.of("https://cdn.example.org/first.jpg")),"5ch opening selector preserved");
        String thread="<div class=thre data-res=123><a href='https://img.2chan.net/b/src/op.jpg'>image</a><blockquote>opening</blockquote><table><tr><td class=rtd><blockquote>fallback.jpg</blockquote></td></tr></table>"+tail+"</div>";
        String futaba=html(thread,"futaba",prefix->prefix.contains("op.jpg"));
        check(futaba.contains("op.jpg")&&!futaba.contains("fallback.jpg"),"Futaba opening image stops before replies");
        String fallback=html(thread.replace("<a href='https://img.2chan.net/b/src/op.jpg'>image</a>",""),"futaba",unused->false);
        check(fallback.contains("fallback.jpg")&&!fallback.contains("ignored.jpg"),"Futaba existing second-entry fallback only");
        byte[] sjis=("<meta charset=Shift_JIS><ul id=resList><li id=res1><div class=resbody>画像</div></li><li id=res2>"+tail).getBytes("windows-31j");
        String decoded=OpeningPostHtml.read(new ByteArrayInputStream(sjis),"text/html","https://example.org/","animanch","123",unused->false);
        check(decoded.contains("画像"),"HTML meta charset preserved");
        InputStream fragmented=new ByteArrayInputStream(sjis){
            @Override public synchronized int read(byte[] b,int off,int len){return super.read(b,off,Math.min(len,7));}
        };
        check(OpeningPostHtml.read(fragmented,"text/html","https://example.org/","animanch","123",unused->false).contains("画像"),"charset detection survives fragmented network reads");
        fails(()->OpeningPostHtml.read(new ByteArrayInputStream(("<p>"+"x".repeat(OpeningPostHtml.MAX_BYTES+50000)).getBytes()),"text/html","https://example.org/","animanch","123",unused->false));
        String body="画像 https://cdn.example.org/one.jpg";
        List<Integer> requests=new ArrayList<>();
        byte[] dat=("名前<>メール<>日時<>"+body+"<>題名\r\n名前<>メール<>日時<>second.jpg<>\n"+"x".repeat(1000000)).getBytes("windows-31j");
        check(EdgeOpeningDat.body(ranges(dat,requests)).equals(body),"DAT post 1 decoded as Windows-31J");
        check(requests.equals(List.of(0)),"normal DAT uses one prefix request");
        String longBody="長".repeat(1600)+" https://cdn.example.org/last.jpg";
        byte[] longDat=("名<>mail<>date<>"+longBody+"<>title\nsecond").getBytes("windows-31j");requests.clear();
        check(EdgeOpeningDat.body(ranges(longDat,requests)).equals(longBody),"long opening record spans non-overlapping ranges");
        check(requests.equals(List.of(0,1024,3072)),"range windows grow without refetching prefixes");
        Counted ignoredRange=new Counted(dat);
        check(EdgeOpeningDat.body((first,last)->new EdgeOpeningDat.Part(200,null,"text/plain; charset=Shift_JIS",EdgeOpeningDat.read(ignoredRange,EdgeOpeningDat.MAX_BYTES+1))).equals(body),"server ignoring Range still yields post 1");
        check(ignoredRange.consumed<=128,"no full DAT read when Range ignored");
        fails(()->EdgeOpeningDat.body((first,last)->new EdgeOpeningDat.Part(206,"bytes 5-10/100","text/plain",new byte[6])));
        fails(()->EdgeOpeningDat.body((first,last)->new EdgeOpeningDat.Part(404,null,"text/html",new byte[0])));
        fails(()->EdgeOpeningDat.body((first,last)->new EdgeOpeningDat.Part(200,null,"text/plain",new byte[EdgeOpeningDat.MAX_BYTES+1])));
        var edge=ThreadListThumbnailRules.board("https://bbs.eddibb.cc/liveedge/");
        check(edge.openingDatUrl("1794543005").equals("https://bbs.eddibb.cc/liveedge/dat/1794543005.dat"),"Edge preview endpoint is DAT, not full HTML");
        check(ThreadListThumbnailRules.board("https://egg.5ch.io/android/").openingDatUrl("1794543005")==null,"5ch keeps first-response HTML route");
        var futabaBoard=SiteBoardProtocol.address("https://img.2chan.net/b/");
        String first="<span class=cno>No.123</span><span class=cnm>名</span><span class=cnw>日付</span><blockquote>本文</blockquote>";
        String second="<table><tr><td class=rtd><span class=cno>No.124</span><span class=cnm>名</span><span class=cnw>日付</span><a href='https://img.2chan.net/b/src/reply.jpg'>画像</a><blockquote>返信</blockquote></td></tr></table>";
        for(boolean image:new boolean[]{true,false}){
            String source="<div class=thre data-res=123>"+(image?"<a href='https://img.2chan.net/b/src/op.jpg'>画像</a>":"")+first+second+tail+"</div>";
            String prefix=OpeningPostHtml.read(new ByteArrayInputStream(source.getBytes(StandardCharsets.UTF_8)),"text/html; charset=UTF-8",futabaBoard.threadUrl("123"),"futaba","123",
                    h->!SiteBoardProtocol.thread(futabaBoard,"123",h).entries.get(0).media.isEmpty());
            var parsed=SiteBoardProtocol.thread(futabaBoard,"123",prefix);
            check(parsed.entries.size()==(image?1:2),"native Futaba conversion accepts exactly the required entries");
            check(parsed.entries.get(0).original.equals("123")&&parsed.entries.get(0).body.contains("本文"),"opening identity and body retained");
            check(parsed.entries.get(image?0:1).media.get(0).endsWith(image?"op.jpg":"reply.jpg"),"image survives native conversion");
        }
        if(args.length>0){
            String source=java.nio.file.Files.readString(java.nio.file.Path.of(args[0]));
            String url=org.jsoup.Jsoup.parse(source).selectFirst("link[rel=canonical]").attr("href");
            String id=AnimanchProtocol.threadId(url);var board=SiteBoardProtocol.address(url);
            var full=SiteBoardProtocol.thread(board,id,source);
            String prefix=OpeningPostHtml.read(new ByteArrayInputStream(source.getBytes(StandardCharsets.UTF_8)),"text/html; charset=UTF-8",url,"animanch",id,unused->false);
            var partial=SiteBoardProtocol.thread(board,id,prefix);
            check(partial.entries.size()==1&&partial.entries.get(0).original.equals("1"),"saved Animanch page yields just response 1");
            check(partial.entries.get(0).body.equals(full.entries.get(0).body),"Animanch body and embed conversion preserved");
            check(partial.entries.get(0).media.equals(full.entries.get(0).media),"Animanch image attachments preserved");
        }
        System.out.println("Opening post fetch: "+checks+" checks passed");
    }
}
