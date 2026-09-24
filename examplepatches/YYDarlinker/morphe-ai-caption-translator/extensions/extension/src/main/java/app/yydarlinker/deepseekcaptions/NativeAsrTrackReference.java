package app.yydarlinker.deepseekcaptions;

import java.net.URI;
import java.net.URLDecoder;
import java.util.*;

/** Bounded, process-only, same-video ASR tracks. No language is privileged. */
final class NativeAsrTrackReference {
    private static final Map<String,Map<String,String>> tracks=new LinkedHashMap<>();
    static synchronized void remember(String language,String vss,String url){
        if(language==null||language.isEmpty()||vss==null||!vss.startsWith("a."))return;
        String video=query(url,"v");if(!WordTimingReference.safe(url,video))return;
        String declared=query(url,"lang");
        if(!declared.isEmpty()&&!declared.equalsIgnoreCase(language))return;
        if(!tracks.containsKey(video)&&tracks.size()>=4)tracks.remove(tracks.keySet().iterator().next());
        Map<String,String> languages=tracks.computeIfAbsent(video,key->new LinkedHashMap<>());
        if(languages.size()<16||languages.containsKey(language))languages.put(language,url);
    }
    static synchronized List<String> candidates(String video,String language){
        Map<String,String> languages=tracks.get(video);if(languages==null)return Collections.emptyList();
        List<String> out=new ArrayList<>();
        for(Map.Entry<String,String> entry:languages.entrySet())if(WordTimingReference.sameLanguage(entry.getKey(),language))out.add(entry.getValue());
        for(String url:languages.values())if(!out.contains(url))out.add(url);
        return out;
    }
    static synchronized String find(String video){List<String> all=candidates(video,"");return all.isEmpty()?"":all.get(0);}
    static synchronized void clear(){tracks.clear();}
    private static String query(String url,String key){try{String query=URI.create(url).getRawQuery();if(query!=null)for(String part:query.split("&")){String[] pair=part.split("=",2);if(pair.length==2&&pair[0].equals(key))return URLDecoder.decode(pair[1],"UTF-8");}}catch(Exception ignored){}return "";}
}
