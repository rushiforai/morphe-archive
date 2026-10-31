package e.e.a;

import org.json.JSONObject;
import java.util.concurrent.*;

public final class SearchBoundsTest {
    static void check(boolean value,String reason){if(!value)throw new AssertionError(reason);}
    public static void main(String[] args)throws Exception{
        String request="https://nvapi.nicovideo.jp/search?minDuration=60&maxDuration=300&minRegisteredAt=2026-10-11T00%3A00%3A00%2B09%3A00&maxRegisteredAt=2026-10-17T23%3A59%3A59%2B09%3A00";
        SearchFilterRules.Bounds cached=SearchFilterRules.bounds(request);
        JSONObject video=new JSONObject().put("duration",60).put("registeredAt","2026-10-10T15:00:00Z");
        check(SearchFilterRules.matches(video,request),"timezone-equivalent lower boundary");
        check(cached==SearchFilterRules.bounds(request),"compiled conditions reused");
        video.put("duration",300).put("registeredAt","2026-10-17T23:59:59+09:00");
        check(SearchFilterRules.matches(video,request),"inclusive upper boundaries");
        video.put("duration",301);check(!SearchFilterRules.matches(video,request),"duration above maximum");
        video.put("duration",60).put("registeredAt","2026-10-18T00:00:00+09:00");
        check(!SearchFilterRules.matches(video,request),"next day excluded");
        for(String bad:new String[]{"minDuration=no","minDuration=-1","minDuration=301&maxDuration=300","minRegisteredAt=2026-02-30T00:00:00Z","minRegisteredAt=2026-10-11T00:00:00Zjunk"})
            check(!SearchFilterRules.matches(video,"https://example.com/?"+bad),"malformed bounds rejected safely");
        check(SearchFilterRules.matches(new JSONObject(),"https://example.com/"),"unfiltered metadata unchanged");
        ExecutorService workers=Executors.newFixedThreadPool(4);
        try{java.util.List<Future<?>> results=new java.util.ArrayList<>();for(int i=0;i<20;i++)results.add(workers.submit(()->{
            JSONObject item=new JSONObject();try{item.put("duration",60).put("registeredAt","2026-10-11T00:00:00+09:00");}catch(Exception e){throw new RuntimeException(e);}
            for(int n=0;n<100;n++)check(SearchFilterRules.matches(item,request),"concurrent parsing");
        }));for(Future<?> result:results)result.get();}finally{workers.shutdownNow();}
        for(int n=0;n<10;n++)SearchFilterRules.bounds("https://example.com/?maxDuration="+n);
        check(cached!=SearchFilterRules.bounds(request),"bounded condition cache evicts oldest request");
        System.out.println("Search bounds: inclusive dates/durations, invalid input, reuse, eviction and 2000 concurrent matches passed");
    }
}
