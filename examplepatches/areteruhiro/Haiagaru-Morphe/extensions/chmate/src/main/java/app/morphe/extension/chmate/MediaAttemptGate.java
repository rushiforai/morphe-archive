package app.morphe.extension.chmate;

import java.util.*;

/** Bounded retry history. Queued/running work is never expired or duplicated. */
final class MediaAttemptGate {
    private final int limit;
    private final long cooldown;
    private long nextPrune;
    private static final class Attempt {
        final boolean running;final long time;
        Attempt(boolean running,long time){this.running=running;this.time=time;}
    }
    private final Map<String,Attempt> attempts=new HashMap<>();
    MediaAttemptGate(int limit,long cooldown){if(limit<1||cooldown<0)throw new IllegalArgumentException();this.limit=limit;this.cooldown=cooldown;}
    synchronized boolean begin(String key,long now){
        if(now>=nextPrune||attempts.size()>=limit){
            attempts.entrySet().removeIf(entry->!entry.getValue().running&&now-entry.getValue().time>=cooldown);
            nextPrune=now+1000;
        }
        Attempt previous=attempts.get(key);
        if(previous!=null&&(previous.running||now-previous.time<cooldown))return false;
        if(previous==null&&attempts.size()>=limit)return false;
        attempts.put(key,new Attempt(true,now));return true;
    }
    synchronized void finish(String key,boolean success,long now){
        if(!attempts.containsKey(key))return;
        if(success)attempts.remove(key);else attempts.put(key,new Attempt(false,now));
    }
    synchronized void cancel(String key){attempts.remove(key);}
}
