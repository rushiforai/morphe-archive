package santodan.patches;

import software.santodan.extension.nuvioupdate.UpdateProgress;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import java.util.*;

public final class VerifyNuvioUpdateProgressRuntime {
    public static final class Asset {
        public String f; public Long g;
        Asset(String url, Long size) { f = url; g = size; }
    }
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    @SuppressWarnings("unchecked") static Function2<Object,Object,Object> wrap(Asset asset, List<List<Object>> events) {
        return (Function2<Object,Object,Object>) UpdateProgress.wrap(asset,
            (Function2<Object,Object,Object>) (bytes, total) -> { events.add(Arrays.asList(bytes,total)); return Unit.INSTANCE; });
    }
    public static void main(String[] args) throws Exception {
        var background = new ArrayList<List<Object>>(); var foreground = new ArrayList<List<Object>>();
        Asset asset = new Asset("https://example.invalid/shared.apk", 1000L);
        var source = wrap(asset, background);
        source.invoke(250L, null);
        check(background.get(0).equals(List.of(250L,1000L)));
        var waiter = wrap(asset, foreground);
        check(foreground.get(0).equals(List.of(250L,1000L)));
        source.invoke(1000L, null);
        check(foreground.get(foreground.size()-1).equals(List.of(1000L,1000L)));
        var replacement = new ArrayList<List<Object>>(); wrap(new Asset(asset.f,2000L),replacement); check(replacement.isEmpty());
        var cached = new ArrayList<List<Object>>(); wrap(asset,cached); check(cached.isEmpty());
        check(UpdateProgress.wrap(asset, waiter) == waiter);
        var events = new ArrayList<List<Object>>(); var throttled = wrap(new Asset("throttle",10000L),events);
        for (long i=1;i<2000;i++) throttled.invoke(i,null);
        check(events.size() < 20);
        throttled.invoke(10000L,null);
        check(events.get(events.size()-1).equals(List.of(10000L,10000L)));
        var unknown = new ArrayList<List<Object>>();
        wrap(new Asset("unknown",null),unknown).invoke(123L,null);
        check(unknown.get(0).equals(Arrays.asList(123L,null)));
        var header = new ArrayList<List<Object>>();
        wrap(new Asset("header",null),header).invoke(500L,1000L);
        check(header.get(0).equals(List.of(500L,1000L)));
        var other = new ArrayList<List<Object>>(); wrap(new Asset("different",1000L),other);
        source.invoke(1000L,null); check(other.isEmpty());
        var faulty = (Function2<Object,Object,Object>) (a,b) -> { throw new IllegalStateException("disposed UI"); };
        var safe = wrap(new Asset("isolation",1000L),new ArrayList<>());
        Object disposed = UpdateProgress.wrap(new Asset("isolation",1000L),faulty);
        safe.invoke(500L,null); check(disposed != null);
        for(int i=0;i<100;i++) wrap(new Asset("bounded-"+i,1000L),new ArrayList<>());
        var field = UpdateProgress.class.getDeclaredField("TRANSFERS"); field.setAccessible(true);
        check(((Map<?,?>)field.get(null)).size() <= 16);
        check(UpdateProgress.wrap(null,null) == null);
        System.out.println("PASS: missing Content-Length fallback, shared background/foreground progress, replay, throttling, real completion, unknown size, observer isolation and bounded retention");
    }
}
