package app.morphe.extension.chmate;

import java.net.URI;
import java.util.*;

/** Ordered media from one supplied attachment list, never a thread-wide URL cache. */
final class MediaGallery {
    static boolean supported(String value) {
        String url=PreviewUrls.normalize(value);
        if(url==null)return false;
        if(DirectVideoUrls.supported(url)||GifAutoFetchPolicy.supported(url))return true;
        try{return URI.create(url).getPath().matches("(?i).+\\.(?:png|jpe?g|webp|bmp|avif)");}
        catch(RuntimeException invalid){return false;}
    }
    static ArrayList<String> links(Collection<String> input,String selected) {
        return links(input,selected,128);
    }
    static ArrayList<String> links(Collection<String> input,String selected,int maximum) {
        String current=PreviewUrls.normalize(selected);
        LinkedHashSet<String> result=new LinkedHashSet<>();
        int characters=0;
        if(input!=null)for(String item:input){String url=PreviewUrls.normalize(item);
            if(supported(url)&&!result.contains(url)){if(characters+url.length()>96000)break;result.add(url);characters+=url.length();}
            if(result.size()>=Math.min(4096,Math.max(1,maximum)))break;}
        // Never associate a clicked link with a list from a different response.
        if(!result.contains(current)){result.clear();if(supported(current))result.add(current);}
        return new ArrayList<>(result);
    }
    static int step(float dx,float dy,float threshold) {
        return Math.abs(dx)>=threshold&&Math.abs(dx)>Math.abs(dy)*1.5f?(dx<0?1:-1):0;
    }
    private MediaGallery(){}
}
