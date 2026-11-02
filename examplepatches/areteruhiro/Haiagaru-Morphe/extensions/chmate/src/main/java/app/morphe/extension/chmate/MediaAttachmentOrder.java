package app.morphe.extension.chmate;

import java.util.*;
import java.util.regex.*;

/** Insert resolved album media at its source URL, preserving other native attachments. */
final class MediaAttachmentOrder {
    private static final Pattern YOUTUBE=Pattern.compile("(?:youtu\\.be/|youtube\\.com/(?:watch\\?[^\\s]*?v=|embed/)|(?:i\\.ytimg\\.com|img\\.youtube\\.com)/vi(?:_webp)?/)([A-Za-z0-9_-]{11})");
    static List<String> reorder(String body,Collection<String> urls,Map<String,Integer> resolved){
        if(body==null||resolved.isEmpty())return new ArrayList<>(urls);
        Map<String,Integer> sources=new HashMap<>(),videos=new HashMap<>();
        for(String source:PreviewUrls.extract(body,4096)){
            int at=body.indexOf(source);
            if(at<0&&source.startsWith("http"))at=body.indexOf(source.substring(1));
            if(at<0)continue;
            sources.merge(source,at,Math::min);String video=videoId(source);if(video!=null)videos.merge(video,at,Math::min);
        }
        ArrayList<String> result=new ArrayList<>(),moving=new ArrayList<>();
        for(String url:urls){
            Integer album=resolved.get(url);
            if(album!=null&&album<position(url,sources,videos))moving.add(url);else result.add(url);
        }
        moving.sort(Comparator.comparingInt(resolved::get));
        for(String url:moving){
            int at=resolved.get(url),index=0;
            while(index<result.size()){
                String other=result.get(index);int position=Math.min(position(other,sources,videos),resolved.getOrDefault(other,Integer.MAX_VALUE));
                if(position!=Integer.MAX_VALUE&&position>at)break;
                index++;
            }
            result.add(index,url);
        }
        return result;
    }
    private static int position(String url,Map<String,Integer> sources,Map<String,Integer> videos){
        Integer at=sources.get(url);if(at!=null)return at;String id=videoId(url);return id==null?Integer.MAX_VALUE:videos.getOrDefault(id,Integer.MAX_VALUE);
    }
    private static String videoId(String url){if(url==null)return null;Matcher m=YOUTUBE.matcher(url);return m.find()?m.group(1):null;}
    private MediaAttachmentOrder(){}
}
