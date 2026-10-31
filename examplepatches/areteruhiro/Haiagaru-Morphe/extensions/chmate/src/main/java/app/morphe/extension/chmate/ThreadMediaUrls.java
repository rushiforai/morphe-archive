package app.morphe.extension.chmate;

import java.util.*;

/** Launch-time supplement: native getters can omit PNGs or return no URLs on 242. */
final class ThreadMediaUrls {
    static List<String> collect(String body,String[] nativeUrls) {
        LinkedHashSet<String> urls=new LinkedHashSet<>();
        if(body!=null)for(String raw:PreviewUrls.extract(body.replace('\u0003',' '),4096))add(urls,raw);
        if(nativeUrls!=null)for(String raw:nativeUrls)add(urls,raw);
        return new ArrayList<>(urls);
    }
    private static void add(Set<String> urls,String raw){
        if(urls.size()>=4096)return;
        String url=PreviewUrls.normalize(raw);if(url==null)return;
        String twimg=TwimgImageUrls.canonical(url);if(twimg!=null)url=twimg;
        if(url.matches("(?i)https?://(?:img\\.[25]ch\\.(?:net|io)/ico/|o\\.8ch\\.net/).*")||!MediaGallery.supported(url))return;
        urls.add(url);
    }
    private ThreadMediaUrls(){}
}
