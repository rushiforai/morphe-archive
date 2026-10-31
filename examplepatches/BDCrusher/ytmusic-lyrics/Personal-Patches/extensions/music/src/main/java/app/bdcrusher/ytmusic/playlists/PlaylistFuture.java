/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.*;
import java.util.concurrent.*;

/** Own future implementation; the host's obfuscated Guava implementation is never packaged. */
final class PlaylistFuture extends FutureTask<Object> implements ListenableFuture<Object> {
    private record Listener(Runnable action,Executor executor) {}
    private final List<Listener> listeners=new ArrayList<>();
    private final Future<?> upstream;
    PlaylistFuture(Callable<Object> task,Future<?> upstream){super(task);this.upstream=upstream;}
    @Override public void addListener(Runnable listener,Executor executor){
        Objects.requireNonNull(listener);Objects.requireNonNull(executor);
        synchronized(listeners){if(!isDone()){listeners.add(new Listener(listener,executor));return;}}
        dispatch(new Listener(listener,executor));
    }
    private static void dispatch(Listener listener){try{listener.executor.execute(listener.action);}catch(RuntimeException rejected){/* One rejected listener must not prevent the others. */}}
    @Override protected void done(){List<Listener> ready;synchronized(listeners){ready=List.copyOf(listeners);listeners.clear();}for(Listener listener:ready)dispatch(listener);}
    @Override public boolean cancel(boolean interrupt){boolean changed=super.cancel(interrupt);if(changed&&upstream!=null)upstream.cancel(interrupt);return changed;}
}
