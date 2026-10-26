package app.hushfeed.verification;

import java.lang.ref.WeakReference;

/** Bounded native-owner comparisons. Identity values stay inside this process. */
final class AutoAdvanceWatchState {
    static final int MAX_SECONDS=60, MAX_SAMPLES=1202;
    interface SourceRead {
        Object source() throws Exception;
        Object model() throws Exception;
        String key(Object model) throws Exception;
        long position() throws Exception;
        boolean playing() throws Exception;
        boolean paused() throws Exception;
    }
    static final class SourceEvidence {
        final Object model;
        final String key;
        final long position;
        final boolean playing,paused,sourceMatches,sourceStable,modelStable;
        SourceEvidence(Object model,String key,long position,boolean playing,boolean paused,boolean matches,boolean stable,boolean modelStable){
            this.model=model;this.key=key;this.position=position;this.playing=playing;this.paused=paused;
            sourceMatches=matches;sourceStable=stable;this.modelStable=modelStable;
        }
        boolean valid(){return model!=null && key!=null && !key.isEmpty() && key.length()<=128 && position>=0 && sourceMatches && sourceStable && modelStable;}
    }
    static SourceEvidence readSource(SourceRead read)throws Exception {
        Object sourceBefore=read.source(),modelBefore=read.model();String keyBefore=read.key(modelBefore);
        long position=read.position();boolean playing=read.playing(),paused=read.paused();
        Object modelAfter=read.model();String keyAfter=read.key(modelAfter);Object sourceAfter=read.source();
        return new SourceEvidence(modelBefore,keyBefore,position,playing,paused,keyBefore!=null && keyBefore.equals(sourceBefore),
                sourceBefore instanceof String && sourceBefore.equals(sourceAfter),modelBefore==modelAfter && keyBefore!=null && keyBefore.equals(keyAfter));
    }
    static final class Frame {
        // Activity, window token, pager, adapter, cell, holder, model, ability, controller, manager.
        final Object[] owners;
        final String key;
        final int index;
        final long position,duration,elapsed;
        final boolean playing,paused;
        Frame(Object[] owners,String key,int index,long position,long duration,long elapsed,boolean playing,boolean paused){
            if(owners.length!=10 || key==null || key.isEmpty() || key.length()>128 || index<0 || position<0 || duration<=0 || elapsed<0)throw new IllegalArgumentException();
            for(Object owner:owners)if(owner==null)throw new IllegalArgumentException();
            this.owners=owners.clone();this.key=key;this.index=index;this.position=position;this.duration=duration;this.elapsed=elapsed;this.playing=playing;this.paused=paused;
        }
    }
    private static final class WeakFrame {
        final WeakReference<?>[] owners=new WeakReference<?>[10];final String key;final int index;
        final long position,duration,elapsed;final boolean playing,paused;
        WeakFrame(Frame frame){for(int n=0;n<10;n++)owners[n]=new WeakReference<>(frame.owners[n]);key=frame.key;index=frame.index;position=frame.position;duration=frame.duration;elapsed=frame.elapsed;playing=frame.playing;paused=frame.paused;}
        boolean matches(Frame frame,int count){for(int n=0;n<count;n++){Object owner=owners[n].get();if(owner==null || owner!=frame.owners[n])return false;}return true;}
        boolean routeAlive(){for(int n=0;n<4;n++)if(owners[n].get()==null)return false;return true;}
        Frame resolve(){Object[] values=new Object[10];for(int n=0;n<10;n++){values[n]=owners[n].get();if(values[n]==null)return null;}return new Frame(values,key,index,position,duration,elapsed,playing,paused);}
    }
    private WeakFrame first,previous,next;
    private int samples;
    private long lastObserved=-1;
    private long stoppedSince=-1;
    private boolean stoppedAtEnd;
    private boolean initialObserved,initialProgress,endWindow,loop,pagerAdvanced,nextObserved,nextProgress,initialCurrent=true;
    private boolean ownerDiscontinuity,windowDiscontinuity,unavailable,weakOwnerLost,boundExceeded;
    private String lastUnavailableReason="none";
    void unavailable(String reason){lastUnavailableReason=reason!=null && reason.matches("[a-z_]{1,64}")?reason:"native_reader_unavailable";observe(null);}
    void observe(Frame frame){
        if(++samples>MAX_SAMPLES){boundExceeded=true;resetStopped();return;}
        if(frame==null){resetStopped();unavailable=true;if("none".equals(lastUnavailableReason))lastUnavailableReason="native_observation_unavailable";return;}
        lastObserved=frame.elapsed;
        if(first==null){first=new WeakFrame(frame);previous=new WeakFrame(frame);initialObserved=true;return;}
        Frame last=previous==null?null:previous.resolve();
        if(!first.routeAlive()){weakOwnerLost=true;resetStopped();return;}
        if(!first.matches(frame,4)){windowDiscontinuity=true;resetStopped();return;}
        if(frame.index==first.index && frame.key.equals(first.key)){
            initialCurrent=true;
            if(!first.matches(frame,10)){ownerDiscontinuity=true;resetStopped();return;}
            if(progress(last,frame))initialProgress=true;
            if(initialProgress && frame.position>=Math.max(0,frame.duration-1000) && frame.position<=frame.duration+1000)endWindow=true;
            if(endWindow && last!=null && same(last,frame,10) && last.key.equals(frame.key) && last.index==frame.index
                    && last.position>500 && frame.position<500 && frame.playing && !frame.paused){loop=true;}
            observeStopped(last,frame);
            previous=new WeakFrame(frame);return;
        }
        resetStopped();initialCurrent=false;
        // A model copy or a recycled holder at the same pager index cannot establish an advance.
        if(frame.index==first.index || frame.key.equals(first.key)){ownerDiscontinuity=true;return;}
        pagerAdvanced=true;
        if(next==null){next=new WeakFrame(frame);previous=new WeakFrame(frame);nextObserved=true;return;}
        Frame candidate=next.resolve();
        if(candidate==null){weakOwnerLost=true;return;}
        if(candidate.index!=frame.index || !candidate.key.equals(frame.key) || !same(candidate,frame,10)){ownerDiscontinuity=true;return;}
        if(progress(last,frame))nextProgress=true;
        previous=new WeakFrame(frame);
    }
    private void resetStopped(){stoppedSince=-1;stoppedAtEnd=false;}
    private void observeStopped(Frame last,Frame frame){
        boolean atEnd=initialProgress && endWindow && frame.position>=Math.max(0,frame.duration-1000)
                && frame.position<=frame.duration+1000 && !frame.playing && !frame.paused;
        if(!atEnd){resetStopped();return;}
        boolean continuous=last!=null && same(last,frame,10) && last.key.equals(frame.key) && last.index==frame.index
                && last.duration==frame.duration && last.position==frame.position && !last.playing && !last.paused
                && frame.elapsed>last.elapsed && frame.elapsed-last.elapsed<=250;
        if(stoppedSince<0 || !continuous){stoppedSince=frame.elapsed;stoppedAtEnd=false;}
        else stoppedAtEnd=frame.elapsed-stoppedSince>=500;
    }
    boolean stoppedAtEndObserved(){return stoppedAtEnd && initialCurrent && valid();}
    boolean advanceObserved(){return initialProgress && endWindow && pagerAdvanced && nextObserved && nextProgress && valid();}
    boolean conclusive(){return initialObserved && initialProgress && (loop || advanceObserved() || stoppedAtEndObserved()) && valid();}
    private boolean valid(){return !ownerDiscontinuity && !windowDiscontinuity && !weakOwnerLost && !boundExceeded;}
    String report(boolean modeStable,long finishedAt){
        boolean fresh=lastObserved>=0 && finishedAt>=lastObserved && finishedAt-lastObserved<=250;
        boolean conclusive=modeStable && fresh && conclusive();
        return "ok startwatch done conclusive="+conclusive+" initialCurrentObserved="+initialObserved
                +" initialProgressObserved="+initialProgress+" endWindowObserved="+endWindow
                +" initialCurrentUnchanged="+(initialObserved && initialCurrent)+" loopObserved="+loop
                +" stoppedAtEndObserved="+(modeStable && fresh && stoppedAtEndObserved())+" stoppedAtEndHeuristic=true"
                +" advanceObserved="+(modeStable && fresh && advanceObserved())
                +" sameWindow="+(initialObserved && lastObserved>first.elapsed && !windowDiscontinuity && !weakOwnerLost)+" ownerDiscontinuity="+ownerDiscontinuity
                +" sourceOrOwnerUnavailable="+unavailable+" weakOwnerLost="+weakOwnerLost+" boundExceeded="+boundExceeded
                +" lastUnavailableReason="+lastUnavailableReason+" modeStable="+modeStable+" currentObservationFresh="+fresh+" completionCallbackObserved=false timingQualified=false";
    }
    static boolean progress(Frame a,Frame b){return a!=null && b!=null && same(a,b,10) && a.index==b.index && a.key.equals(b.key)
            && b.elapsed>a.elapsed && b.elapsed-a.elapsed<=1000 && a.playing && b.playing && !a.paused && !b.paused && b.position>a.position;}
    private static boolean same(Frame a,Frame b,int count){for(int n=0;n<count;n++)if(a.owners[n]!=b.owners[n])return false;return true;}
}
