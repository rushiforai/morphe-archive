package app.morphe.extension.chmate;

import java.util.*;

/** Content-keyed, bounded cache. No response identity, settings or NG decision is cached. */
final class NgPlainTextCache {
    interface Converter { String convert(String html); }
    private final LinkedHashMap<String,String> entries=new LinkedHashMap<>(64,.75f,true);
    private int maxEntries,maxCharacters;
    private long characters;
    NgPlainTextCache(int maxEntries,int maxCharacters){this.maxEntries=maxEntries;this.maxCharacters=maxCharacters;}
    synchronized void configure(int count,int capacity){
        maxEntries=Math.max(0,count);maxCharacters=Math.max(0,capacity);trim();
    }
    private void trim(){
        Iterator<Map.Entry<String,String>> iterator=entries.entrySet().iterator();
        while(entries.size()>maxEntries||characters>maxCharacters||maxCharacters==0&&!entries.isEmpty()){
            Map.Entry<String,String> first=iterator.next();characters-=(long)first.getKey().length()+first.getValue().length();iterator.remove();
        }
    }
    String plain(String html,Converter converter){
        if(html==null)return "";
        synchronized(this){String cached=entries.get(html);if(cached!=null)return cached;}
        // HTML parsing can be expensive. Never hold a shared lock while converting.
        String text=converter.convert(html);
        long cost=(long)html.length()+text.length();
        synchronized(this){
            if(cost>maxCharacters||maxEntries<=0||maxCharacters<=0)return text;
            String cached=entries.get(html);if(cached!=null)return cached;
            entries.put(html,text);characters+=cost;
            trim();
        }
        return text;
    }
}
