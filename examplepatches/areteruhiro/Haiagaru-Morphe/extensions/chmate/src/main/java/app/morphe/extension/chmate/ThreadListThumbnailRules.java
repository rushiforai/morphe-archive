package app.morphe.extension.chmate;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/** Pure URL and opening-post rules for the opt-in thread-list experiment. */
final class ThreadListThumbnailRules {
    static final String FIVE_OPENING_SELECTOR=".thread .post:first-child .message, .post:first-child .message, .post:first-of-type .message, .post:first-child .post-content, dl.thread dd:first-of-type, .postMessage, .message, dd";
    static final class Board {
        final String host, name;
        Board(String host,String name){this.host=host;this.name=name;}
        String threadUrl(String id){
            // The current Edge site redirects legacy read.cgi URLs; the image fetcher
            // intentionally does not follow redirects.
            if(host.equals("bbs.eddibb.cc"))return "https://"+host+"/"+name+"/"+id;
            return "https://"+host+"/test/read.cgi/"+name+"/"+id+"/";
        }
        String openingDatUrl(String id){
            return host.equals("bbs.eddibb.cc")?"https://"+host+"/"+name+"/dat/"+id+".dat":null;
        }
        String settingsKey(){return "5ch:"+host+"/"+name;}
        String legacySettingsKey(){return "5ch:"+name;}
    }
    private static final Pattern DIAGNOSTIC=Pattern.compile("^\\{server:([^,]+), name:([^,]+), created:");
    private static final Pattern NAME=Pattern.compile("[a-zA-Z0-9_-]{1,80}");
    private static final Pattern IMAGE=Pattern.compile("(?i)\\.(?:jpe?g|png|webp|gif|avif)$");
    private static final Pattern TEXT_URL=Pattern.compile("https://[^\\s<>\"'\\u3000\\u3001\\u3002]+",Pattern.CASE_INSENSITIVE);

    static Board board(String address){
        if(address==null)return null;
        String value=address.trim().replace("%2F","/").replace("%2f","/");
        Matcher diagnostic=DIAGNOSTIC.matcher(value);
        if(diagnostic.find())value="https://"+diagnostic.group(1).trim()+"/"+diagnostic.group(2).trim()+"/";
        try{
            URI uri=URI.create(value.contains("://")?value:"https://"+value);
            String host=uri.getHost(),path=uri.getRawPath();
            if(!("https".equalsIgnoreCase(uri.getScheme())||"http".equalsIgnoreCase(uri.getScheme()))
                    ||host==null||uri.getUserInfo()!=null||uri.getPort()!=-1||uri.getRawQuery()!=null||uri.getRawFragment()!=null||path==null)return null;
            host=host.toLowerCase(Locale.ROOT);
            boolean edge=host.equals("bbs.eddibb.cc");
            if(!(host.endsWith(".5ch.io")||host.endsWith(".5ch.net")||edge))return null;
            Matcher thread=Pattern.compile("^/test/read\\.cgi/([a-zA-Z0-9_-]{1,80})/[0-9]{9,11}/?$",Pattern.CASE_INSENSITIVE).matcher(path);
            Matcher edgeThread=Pattern.compile("^/liveedge/[0-9]{9,11}/?$",Pattern.CASE_INSENSITIVE).matcher(path);
            String name=thread.matches()?thread.group(1):edge&&edgeThread.matches()?"liveedge":path.replaceFirst("^/","").replaceFirst("/$","");
            if(!NAME.matcher(name).matches())return null;
            if(edge&&!"liveedge".equalsIgnoreCase(name))return null;
            return new Board(host,name.toLowerCase(Locale.ROOT));
        }catch(IllegalArgumentException invalid){return null;}
    }

    static boolean publicImage(String address){
        try{
            URI u=URI.create(address);String host=u.getHost();
            if(!"https".equalsIgnoreCase(u.getScheme())||host==null||u.getUserInfo()!=null||u.getPort()!=-1
                    ||u.getRawPath()==null||u.getRawPath().length()>1024||u.getRawFragment()!=null)return false;
            host=host.toLowerCase(Locale.ROOT);
            return host.contains(".")&&!host.endsWith(".local")&&!host.endsWith(".localhost")&&!host.endsWith(".internal")
                    &&!host.endsWith(".test")&&!host.endsWith(".invalid")&&!host.endsWith(".onion")
                    &&!host.matches("[0-9.]+")&&!host.contains(":");
        }catch(IllegalArgumentException invalid){return false;}
    }

    static String firstFiveChImage(String html,String threadUrl){
        List<String> images=firstFiveChImages(html,threadUrl,1);
        return images.isEmpty()?null:images.get(0);
    }
    static List<String> firstFiveChImages(String html,String threadUrl,int maxImages){
        if(maxImages<=0)return Collections.emptyList();
        Document doc=Jsoup.parse(html,threadUrl);
        boolean edge="bbs.eddibb.cc".equalsIgnoreCase(URI.create(threadUrl).getHost());
        Element opening=edge?doc.selectFirst("[data-ng-target=body][data-ng-response-id=1]"):
                doc.selectFirst(FIVE_OPENING_SELECTOR);
        if(opening==null)return Collections.emptyList();
        return collectMedia(opening,maxImages,edge);
    }
    /** Accept only images, public direct videos and official YouTube preview images. */
    static List<String> openingTextMedia(String html,String base,int limit){
        if(limit<=0)return Collections.emptyList();
        return collectMedia(Jsoup.parseBodyFragment(html,base).body(),limit,true);
    }
    private static List<String> collectMedia(Element opening,int maxImages,boolean scanText){
        LinkedHashSet<String> found=new LinkedHashSet<>();
        for(Element link:opening.select("a[href], video[src], video[poster], source[src], img[src], iframe[src], iframe[data-src]")){
            if("source".equals(link.normalName())){
                Element video=link.closest("video");
                if(video!=null&&(imageUrl(video.absUrl("poster"))||videoUrl(video.absUrl("src"))))continue;
            }
            String url=link.hasAttr("href")?link.absUrl("href"):
                    "video".equals(link.normalName())&&imageUrl(link.absUrl("poster"))?link.absUrl("poster"):
                    "iframe".equals(link.normalName())&&link.hasAttr("data-src")?link.absUrl("data-src"):
                    link.absUrl("src");
            // A linked file and its preview image are the same attachment.
            if("img".equals(link.normalName())){
                Element enclosing=link.closest("a[href]");
                if(enclosing!=null&&mediaUrl(enclosing.absUrl("href"))!=null)continue;
            }
            String media=mediaUrl(url);
            if(media!=null&&found.add(media)&&found.size()>=maxImages)return new ArrayList<>(found);
        }
        // Edge and site replies can contain plain, unlinked media URLs.
        if(scanText){
            Matcher urls=TEXT_URL.matcher(opening.text());
            while(urls.find()){
                String url=urls.group();
                while(url.endsWith(")")||url.endsWith("]")||url.endsWith(",")||url.endsWith(".")||url.endsWith(";"))
                    url=url.substring(0,url.length()-1);
                String media=mediaUrl(url);
                if(media!=null&&found.add(media)&&found.size()>=maxImages)break;
            }
        }
        return new ArrayList<>(found);
    }
    static boolean videoUrl(String url){return publicImage(url)&&DirectVideoUrls.supported(url);}
    private static String mediaUrl(String url){
        if(imageUrl(url)||videoUrl(url))return url;
        return youtubeImage(url);
    }
    private static String youtubeImage(String url){
        try{
            URI uri=URI.create(url);
            if(!"https".equalsIgnoreCase(uri.getScheme())||uri.getUserInfo()!=null||uri.getPort()!=-1)return null;
            String host=uri.getHost(),path=uri.getPath(),id=null;
            if(host==null||path==null)return null;
            host=host.toLowerCase(Locale.ROOT);
            if(host.equals("youtu.be")){
                id=path.startsWith("/")?path.substring(1):path;
            }else if(host.equals("youtube.com")||host.equals("www.youtube.com")||host.equals("m.youtube.com")
                    ||host.equals("www.youtube-nocookie.com")){
                if(path.equals("/watch")&&uri.getRawQuery()!=null){
                    Matcher m=Pattern.compile("(?:^|&)v=([A-Za-z0-9_-]{11})(?:&|$)").matcher(uri.getRawQuery());
                    if(m.find())id=m.group(1);
                }else{
                    Matcher m=Pattern.compile("^/(?:shorts|embed|live)/([A-Za-z0-9_-]{11})/?$").matcher(path);
                    if(m.matches())id=m.group(1);
                }
            }
            return id!=null&&id.matches("[A-Za-z0-9_-]{11}")
                    ?"https://i.ytimg.com/vi/"+id+"/hqdefault.jpg":null;
        }catch(IllegalArgumentException invalid){return null;}
    }
    private static boolean imageUrl(String url){
        if(!publicImage(url))return false;
        try{
            URI uri=URI.create(url);
            return IMAGE.matcher(uri.getPath()).find()||"pbs.twimg.com".equalsIgnoreCase(uri.getHost())
                    &&uri.getRawQuery()!=null&&uri.getRawQuery().matches("(?i).*(?:format|name)=(?:jpe?g|png|webp|gif)(?:&.*)?");
        }catch(IllegalArgumentException invalid){return false;}
    }
    private ThreadListThumbnailRules(){}
}
