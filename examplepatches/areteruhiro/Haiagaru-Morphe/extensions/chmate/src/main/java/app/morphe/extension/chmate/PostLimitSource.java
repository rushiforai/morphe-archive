package app.morphe.extension.chmate;

import android.content.Context;
import java.io.*;import java.net.*;import java.nio.charset.Charset;import java.util.*;
import org.jsoup.Jsoup;import org.jsoup.nodes.*;

/** Read-only public settings/form lookup for the native composer's selected board. */
final class PostLimitSource {
    static final class Values {
        final int title,body,lines;final boolean characters;
        Values(int title,int body,int lines,boolean characters){this.title=title;this.body=body;this.lines=lines;this.characters=characters;}
        boolean known(){return title>0||body>0||lines>0;}
    }
    static String address(String board){
        BoardAddress parsed=BoardAddress.parse(board);URI uri=URI.create(parsed.url);
        if(parsed.engine().equals("shitaraba"))return uri.getScheme()+"://"+uri.getRawAuthority()+"/bbs/api/setting.cgi/"+parsed.path+"/";
        return parsed.url+"SETTING.TXT";
    }
    static Values parse(String board,String text){
        Map<String,String> values=PostLimitRules.settings(text);
        return new Values(PostLimitRules.positive(values.get("BBS_SUBJECT_COUNT")),PostLimitRules.positive(values.get("BBS_MESSAGE_COUNT")),PostLimitRules.lines(values,URI.create(board).getHost()),false);
    }
    static int maximum(Element doc,String selector){
        Element input=doc.selectFirst(selector);return input==null?0:PostLimitRules.positive(input.attr("maxlength"));
    }
    static Values form(String kind,String html,boolean thread){
        Document doc=Jsoup.parse(html);Element posting=new Element("form");
        for(Element candidate:doc.select("form"))if(candidate.selectFirst("textarea[name=text],textarea[name=body],textarea[name=com],textarea[name=MESSAGE]")!=null){posting=candidate;break;}
        int title=maximum(posting,"input[name=title][maxlength],input[name=sub][maxlength],input[name=subject][maxlength]");
        int body=maximum(posting,"textarea[name=text][maxlength],textarea[name=body][maxlength],textarea[name=com][maxlength],textarea[name=MESSAGE][maxlength]");
        Element lines=posting.selectFirst("textarea[data-maxlines],textarea[data-max-lines]");
        int count=lines==null?0:PostLimitRules.positive(lines.hasAttr("data-maxlines")?lines.attr("data-maxlines"):lines.attr("data-max-lines"));
        // Current native-to-Animanch creation adapter enforces these even if the public form omits them.
        if(thread&&kind.equals("animanch")){title=title>0?Math.min(64,title):64;body=body>0?Math.min(1000,body):1000;count=count>0?Math.min(30,count):30;}
        return new Values(title,body,count,true);
    }
    static Values fetch(Context context,String board,boolean thread)throws Exception{
        SiteBoardGateway gateway=SiteBoardGateway.get(context);
        SiteBoardProtocol.Board site=gateway.postingLimitBoard(board);
        if(site!=null){
            return form(site.kind,gateway.postingLimitPage(site),thread);
        }
        return parse(board,read(address(board)));
    }
    private static String read(String address)throws Exception{
        URI initial=URI.create(address);String next=address;
        for(int redirect=0;redirect<3;redirect++){
            HttpURLConnection connection=(HttpURLConnection)new URL(next).openConnection();connection.setInstanceFollowRedirects(false);connection.setConnectTimeout(5000);connection.setReadTimeout(5000);
            try{
                int status=connection.getResponseCode();
                if(status>=300&&status<400){String location=connection.getHeaderField("Location");if(location==null)throw new IOException("Location missing");URI target=URI.create(next).resolve(location);
                    boolean same=Objects.equals(initial.getScheme(),target.getScheme())&&port(initial)==port(target);
                    boolean upgrade="http".equals(initial.getScheme())&&port(initial)==80&&"https".equals(target.getScheme())&&port(target)==443;
                    if(!Objects.equals(initial.getHost(),target.getHost())||target.getUserInfo()!=null||!(same||upgrade))throw new IOException("Board settings redirected to another origin");next=target.toString();continue;}
                if(status!=200)throw new IOException("HTTP "+status);
                ByteArrayOutputStream out=new ByteArrayOutputStream();try(InputStream input=connection.getInputStream()){
                    byte[] buffer=new byte[4096];int n;while(out.size()<131072&&(n=input.read(buffer))!=-1)out.write(buffer,0,Math.min(n,131072-out.size()));}
                byte[] data=out.toByteArray();String header=connection.getContentType();String prefix=new String(data,0,Math.min(data.length,4096),java.nio.charset.StandardCharsets.ISO_8859_1).toLowerCase(Locale.ROOT);
                String encoding=header!=null&&header.toLowerCase(Locale.ROOT).contains("utf-8")||prefix.contains("charset=utf-8")||prefix.contains("charset=\"utf-8")?"UTF-8":initial.getHost().contains("shitaraba")?"EUC-JP":"windows-31j";
                return new String(data,Charset.forName(encoding));
            }finally{connection.disconnect();}
        }
        throw new IOException("Too many board settings redirects");
    }
    private static int port(URI uri){return uri.getPort()!=-1?uri.getPort():"https".equals(uri.getScheme())?443:80;}
    private PostLimitSource(){}
}
