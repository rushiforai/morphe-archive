package app.morphe.extension.chmate;

import java.net.URI;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.nio.charset.Charset;

/** Nuko search forms use Windows-31J for both query values and HTML. */
final class NukoArchive {
    static String query(String word,int page){
        String text=word==null?"":word;
        if(!Charset.forName("Windows-31J").newEncoder().canEncode(text))
            throw new IllegalArgumentException("ぬこで検索できない文字が含まれています");
        try{return "https://n2ch.net/q/-/?q="+URLEncoder.encode(text,"Windows-31J")
                +"&kako=1&p="+Math.max(0,page-1)+"&guid=ON";}
        catch(java.io.UnsupportedEncodingException impossible){throw new AssertionError(impossible);}
    }
    static boolean accepts(String url){
        try{URI u=URI.create(url);return "https".equalsIgnoreCase(u.getScheme())&&"n2ch.net".equalsIgnoreCase(u.getHost())
                &&u.getPort()==-1&&u.getUserInfo()==null&&u.getPath().matches("/(?:q/-/|r/-/[A-Za-z0-9_]+/[0-9]{9,12}/(?:[0-9l-]*)?)");}
        catch(RuntimeException invalid){return false;}
    }
    static String keyword(String url){
        try{String q=URI.create(url).getRawQuery();if(q!=null)for(String part:q.split("&"))
            if(part.startsWith("q="))return URLDecoder.decode(part.substring(2),"Windows-31J");}
        catch(Exception ignored){}return "";
    }
    private NukoArchive(){}
}
