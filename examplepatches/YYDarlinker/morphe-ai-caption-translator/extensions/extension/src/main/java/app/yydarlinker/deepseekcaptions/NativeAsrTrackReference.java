package app.yydarlinker.deepseekcaptions;

import java.net.URI;
import java.net.URLDecoder;
import java.util.*;

/**
 * Bounded, process-only, same-video ASR descriptors.  A language may expose more than one
 * signed descriptor (for example a rich and a coarse variant).  The old implementation stored
 * one URL per language, so a parseable coarse response could silently evict the useful one before
 * the source worker had a chance to inspect its timing capability.
 */
final class NativeAsrTrackReference {
    static final int MAX_VIDEOS=4, MAX_LANGUAGES=16, MAX_URLS_PER_LANGUAGE=4;
    private static final class Descriptor {
        final String language,vss,url;
        Descriptor(String language,String vss,String url){this.language=language;this.vss=vss;this.url=url;}
    }
    private static final Map<String,Map<String,List<Descriptor>>> tracks=new LinkedHashMap<>();
    static synchronized void remember(String language,String vss,String url){
        if(language==null||language.isEmpty()||vss==null||!vss.startsWith("a.")||url==null)return;
        String video=query(url,"v");if(!WordTimingReference.safe(url,video))return;
        String declared=query(url,"lang");
        if(!declared.isEmpty()&&!declared.equalsIgnoreCase(language))return;
        if(!tracks.containsKey(video)&&tracks.size()>=MAX_VIDEOS)
            tracks.remove(tracks.keySet().iterator().next());
        Map<String,List<Descriptor>> languages=tracks.computeIfAbsent(video,key->new LinkedHashMap<>());
        String key=languageKey(language);
        List<Descriptor> values=languages.get(key);
        if(values==null){
            if(languages.size()>=MAX_LANGUAGES)return;
            values=new ArrayList<>();languages.put(key,values);
        }
        for(Iterator<Descriptor> it=values.iterator();it.hasNext();)if(it.next().url.equals(url)){it.remove();break;}
        values.add(new Descriptor(language,vss,url));
        while(values.size()>MAX_URLS_PER_LANGUAGE)values.remove(0);
    }
    static synchronized List<String> candidates(String video,String language){
        Map<String,List<Descriptor>> languages=tracks.get(video);if(languages==null)return Collections.emptyList();
        List<String> out=new ArrayList<>();
        // Exact language first, then a valid primary-language alias, then the remaining descriptors.
        String exact=languageKey(language);
        List<Descriptor> first=languages.get(exact);
        append(first,out);
        for(Map.Entry<String,List<Descriptor>> entry:languages.entrySet()){
            if(entry.getKey().equals(exact)||!WordTimingReference.sameLanguage(entry.getKey(),language))continue;
            append(entry.getValue(),out);
        }
        for(List<Descriptor> values:languages.values())append(values,out);
        return out;
    }
    static synchronized String find(String video){List<String> all=candidates(video,"");return all.isEmpty()?"":all.get(0);}
    static synchronized void clear(){tracks.clear();}
    private static void append(List<Descriptor> values,List<String> out){
        if(values==null)return;for(Descriptor d:values)if(!out.contains(d.url))out.add(d.url);
    }
    private static String languageKey(String value){return value==null?"":value.trim().toLowerCase(Locale.ROOT);}
    private static String query(String url,String key){try{String query=URI.create(url).getRawQuery();if(query!=null)for(String part:query.split("&")){String[] pair=part.split("=",2);if(pair.length==2&&pair[0].equals(key))return URLDecoder.decode(pair[1],"UTF-8");}}catch(Exception ignored){}return "";}
}
