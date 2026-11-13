package app.morphe.extension.chmate;

import java.io.*;
import java.nio.charset.Charset;
import java.util.regex.*;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.parser.StreamParser;

/** Stream only as far as the post needed by a list preview; never complete the document. */
final class OpeningPostHtml {
    static final int MAX_BYTES=256*1024;
    interface HasMedia { boolean test(String html) throws IOException; }
    static String read(InputStream input,String type,String address,String kind,String id,HasMedia hasMedia)throws IOException {
        InputStream bounded=new FilterInputStream(input){
            int count;
            @Override public int read(byte[] b,int off,int len)throws IOException {
                if(count>=MAX_BYTES)throw new IOException("冒頭レスの取得上限を超えました");
                int n=super.read(b,off,Math.min(len,MAX_BYTES-count));if(n>0)count+=n;return n;
            }
            @Override public int read()throws IOException {
                byte[] one=new byte[1];return read(one,0,1)<0?-1:one[0]&255;
            }
        };
        PushbackInputStream stream=new PushbackInputStream(bounded,4096);
        byte[] head=new byte[4096];int count=0;
        while(count<head.length){int n=stream.read(head,count,head.length-count);if(n<0)break;if(n>0)count+=n;}
        if(count==0)throw new IOException("本文がありません");
        stream.unread(head,0,count);
        String charset="UTF-8";
        Pattern encoding=Pattern.compile("(?i)charset\\s*=\\s*[\"']?([A-Za-z0-9_-]+)");
        Matcher match=encoding.matcher(type==null?"":type);
        if(match.find())charset=match.group(1);
        else {match=encoding.matcher(new String(head,0,count,"ISO-8859-1"));if(match.find())charset=match.group(1);}
        if(charset.equalsIgnoreCase("Shift_JIS"))charset="windows-31j";
        Reader reader;
        try{reader=new InputStreamReader(stream,Charset.forName(charset));}
        catch(RuntimeException invalid){throw new IOException("未対応の文字コードです",invalid);}
        try(StreamParser parser=new StreamParser(Parser.htmlParser()).parse(reader,address)) {
            parser.document().outputSettings().prettyPrint(false);
            String selector=kind.equals("animanch")?"#resList > li#res1":kind.equals("futaba")?
                    ".thre[data-res="+id+"] > blockquote":ThreadListThumbnailRules.FIVE_OPENING_SELECTOR;
            Element opening=parser.selectFirst(selector);
            if(opening==null)throw new IOException("冒頭レスを取得できません");
            String headHtml=parser.document().head().outerHtml();
            if(kind.equals("animanch"))return headHtml+"<body><ul id=resList>"+opening.outerHtml()+"</ul></body>";
            if(!kind.equals("futaba"))return headHtml+"<body><div class=thread><div class=post>"+opening.outerHtml()+"</div></div></body>";
            Element root=opening.closest(".thre").clone();root.select("table").remove();
            String first=headHtml+root.outerHtml();
            if(hasMedia.test(first))return first;
            // Only img/may's existing second-entry fallback is needed, not the rest of the thread.
            Element reply=parser.selectNext(".thre[data-res="+id+"] td.rtd");
            if(reply!=null)root.appendElement("table").appendElement("tbody").appendElement("tr").appendChild(reply.clone());
            return headHtml+root.outerHtml();
        }
    }
    private OpeningPostHtml(){}
}
