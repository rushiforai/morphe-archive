package app.morphe.extension.chmate;

import java.nio.charset.Charset;
import org.jsoup.Jsoup;

/** Saved-site markup shapes: do not turn cards, incoming replies or formatting into post text. */
public final class AnimanchBodyPresentationTest {
    private static int checks;
    private static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    private static String document(String first,String second){return "<title>表示検証｜あにまん掲示板</title><ul id=resList><li id=res1><span class=resname>名無し</span><div class=resbody>\n  "+first+"\n</div></li><li id=res2><span class=resname>名無し</span><div class=resbody>"+second+"</div></li></ul>";}
    public static void main(String[] args)throws Exception{
        String address="https://bbs.animanch.com/board/7585502/",image="https://bbs.animanch.com/img/7585502/1";
        String first="<p>先頭本文</p><a class='row g-0' href='http://example.org/article'><div><img src='/ogp_s/123/'></div><div><strong>カードの見出し</strong><span>カードの説明</span><small>example.org</small></div></a><div class=reply><a class=reslink href='#res2'>&gt;&gt;2</a></div><a class=thumb href='"+image+"'><img src='/thumb_m/7585502/1'></a>";
        String second="<p><a class=reslink href='#res1'>&gt;&gt;1</a></p>\n<p>返信本文<br><br>意図した空行</p>";
        var parsed=AnimanchProtocol.thread(document(first,second),address);
        ok(!parsed.replies.get(0).html.contains("カードの"),"site preview text excluded");
        ok(parsed.replies.get(0).html.contains("http://example.org/article"),"original HTTP link remains visible");
        ok(!parsed.replies.get(0).html.contains("&gt;&gt;2"),"inbound reply badge is not authored text");
        ok(parsed.replies.get(1).html.contains("&gt;&gt;1"),"outbound reply anchor retained");
        ok(parsed.replies.get(0).images.size()==1&&parsed.replies.get(0).images.get(0).equals(image),"original image identity retained");
        var board=SiteBoardProtocol.address(address);
        var page=SiteBoardProtocol.thread(board,"7585502",document(first,second));
        String local="http://127.0.0.1:12345/m/ha00000000000000000000000000000000/img/7585502/1.jpg";
        String dat=new String(SiteNativeData.dat(board,page,url->local,url->url),Charset.forName("windows-31j"));
        String[] rows=dat.split("\n"),one=rows[0].split("<>",-1),two=rows[1].split("<>",-1);
        ok(one[3].startsWith("先頭本文"),"no artificial leading line");
        ok(one[3].contains("href=\""+local+"\""),"native image route retained for extensionless site images");
        String visible=Jsoup.parseBodyFragment(one[3]).text();
        ok(visible.contains(image)&&!visible.contains("127.0.0.1"),"image label exposes the original URL");
        ok(two[3].startsWith("&gt;&gt;1<br>返信本文"),"single line break after authored reply anchor");
        ok(two[3].contains("返信本文<br><br>意図した空行"),"authored blank line retained");
        var onlyImage=SiteBoardProtocol.thread(board,"7585502",document("<a class=thumb href='"+image+"'><img src='/thumb_m/7585502/1'></a>","<p>second</p>"));
        String imageDat=new String(SiteNativeData.dat(board,onlyImage,url->local,url->url),Charset.forName("windows-31j"));
        ok(imageDat.split("<>",-1)[3].startsWith("<a "),"image-only response has no prepended blank line");
        var explicit=SiteBoardProtocol.thread(board,"7585502",document("<p><br>意図した先頭空行</p>","second"));
        String explicitDat=new String(SiteNativeData.dat(board,explicit,url->local,url->url),Charset.forName("windows-31j"));
        ok(explicitDat.split("<>",-1)[3].startsWith("<br>意図した先頭空行"),"explicit leading break is preserved");
        for(String[] sample:new String[][]{{"<p>一行目<br></p><p>二行目</p>","一行目<br>二行目"},{"<p>一行目</p><p><br></p><p>二行目</p>","一行目<br><br>二行目"}}){
            var paragraphs=SiteBoardProtocol.thread(board,"7585502",document(sample[0],"second"));
            String result=new String(SiteNativeData.dat(board,paragraphs,url->local,url->url),Charset.forName("windows-31j"));
            ok(result.split("<>",-1)[3].equals(sample[1]),"paragraph boundaries do not duplicate existing breaks");
        }
        System.out.println("PASS "+checks+" Animanch card/image/paragraph/reply presentation checks");
    }
}
