package app.morphe.extension.chmate;

import java.util.*;

/** Owned by one immutable rule index. Content changes and new indexes cannot reuse stale decisions. */
final class NgResponseDecisionCache {
    interface Evaluation { boolean run(); }
    interface Decoder { String plain(String html); }
    private static final int MAX_ENTRIES=4096,MAX_CHARACTERS=4_000_000;
    private final LinkedHashMap<List<String>,Boolean> results=new LinkedHashMap<>(64,.75f,true);
    private long characters;
    boolean match(String board,String id,String name,String body,boolean cacheNegative,Evaluation evaluation){
        return match(board,id,name,body,()->cacheNegative,evaluation);
    }
    boolean match(String board,String id,String name,String body,Evaluation cacheNegative,Evaluation evaluation){
        List<String> key=Arrays.asList(board,id,name==null?"":name,body==null?"":body);
        synchronized(this){Boolean result=results.get(key);if(result!=null)return result;}
        boolean result=evaluation.run();
        // A regex timeout is not proof of no match; allow the next rebuild to retry it.
        if(!result&&!cacheNegative.run())return false;
        long cost=cost(key);if(cost>MAX_CHARACTERS)return result;
        synchronized(this){
            if(!results.containsKey(key)){results.put(key,result);characters+=cost;}
            Iterator<Map.Entry<List<String>,Boolean>> iterator=results.entrySet().iterator();
            while(results.size()>MAX_ENTRIES||characters>MAX_CHARACTERS){characters-=cost(iterator.next().getKey());iterator.remove();}
        }
        return result;
    }
    private static long cost(List<String> key){long size=0;for(String value:key)if(value!=null)size+=value.length();return size;}
}
