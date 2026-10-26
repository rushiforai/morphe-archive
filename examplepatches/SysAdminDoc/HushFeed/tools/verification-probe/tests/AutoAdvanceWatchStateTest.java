package app.hushfeed.verification;

public final class AutoAdvanceWatchStateTest {
    static int checks;
    static void check(boolean value,String name){checks++;if(!value)throw new AssertionError(name);}
    static Object[] owners(){Object[] values=new Object[10];for(int n=0;n<10;n++)values[n]=new Object();return values;}
    static AutoAdvanceWatchState.Frame frame(Object[] owners,String key,int index,long position,long duration,long time){return new AutoAdvanceWatchState.Frame(owners,key,index,position,duration,time,true,false);}
    static AutoAdvanceWatchState started(Object[] base){AutoAdvanceWatchState state=new AutoAdvanceWatchState();state.observe(frame(base,"test_first",2,1800,3000,1000));state.observe(frame(base,"test_first",2,2400,3000,1500));return state;}
    static Object[] following(Object[] original){Object[] next=owners();for(int n=0;n<4;n++)next[n]=original[n];return next;}
    static void nextProgress(AutoAdvanceWatchState state,Object[] next){state.observe(frame(next,"test_next",3,0,4000,1600));state.observe(frame(next,"test_next",3,200,4000,1800));}
    static final class Reader implements AutoAdvanceWatchState.SourceRead {
        final Object first=new Object(),second=new Object();int sourceCalls,modelCalls,positionCalls,playingCalls,pausedCalls;
        boolean changeSource,changeModel,changeKey;boolean advancedRead;
        public Object source(){sourceCalls++;return changeSource && sourceCalls==2?"test_other":"test_source";}
        public Object model(){modelCalls++;return changeModel && modelCalls==2?second:first;}
        public String key(Object model){return changeKey && advancedRead?"test_other":"test_source";}
        public long position(){positionCalls++;advancedRead=true;return 123;}
        public boolean playing(){playingCalls++;return true;}
        public boolean paused(){pausedCalls++;return false;}
    }
    public static void main(String[] args)throws Exception {
        Reader normal=new Reader();AutoAdvanceWatchState.SourceEvidence source=AutoAdvanceWatchState.readSource(normal);
        check(source.valid(),"stable native source/model callbacks");
        check(normal.sourceCalls==2 && normal.modelCalls==2 && normal.positionCalls==1 && normal.playingCalls==1 && normal.pausedCalls==1,"bounded source callbacks");
        Reader changedSource=new Reader();changedSource.changeSource=true;check(!AutoAdvanceWatchState.readSource(changedSource).valid(),"source changed during native query");
        Reader changedModel=new Reader();changedModel.changeModel=true;check(!AutoAdvanceWatchState.readSource(changedModel).valid(),"model recycled during native query");
        Reader changedKey=new Reader();changedKey.changeKey=true;check(!AutoAdvanceWatchState.readSource(changedKey).valid(),"same model changed source key during query");
        Object[] base=owners(),next=following(base);AutoAdvanceWatchState good=started(base);nextProgress(good,next);
        check(good.advanceObserved() && good.conclusive(),"native pager/source transition with real next-owner progress");
        check(good.report(true,1800).contains("conclusive=true") && good.report(true,1800).contains("advanceObserved=true"),"boolean positive report");
        check(!good.report(false,1800).contains("conclusive=true"),"setting mode changed");
        check(!good.report(true,2100).contains("conclusive=true"),"current observation expired");
        AutoAdvanceWatchState modelCopy=started(base);Object[] copy=base.clone();copy[6]=new Object();modelCopy.observe(frame(copy,"test_first",2,2600,3000,1600));
        check(!modelCopy.advanceObserved() && !modelCopy.conclusive(),"model copy at unchanged pager index");
        AutoAdvanceWatchState recycled=started(base);Object[] recycledOwner=base.clone();recycledOwner[6]=new Object();recycled.observe(frame(recycledOwner,"test_next",2,0,4000,1600));recycled.observe(frame(recycledOwner,"test_next",2,200,4000,1800));
        check(!recycled.advanceObserved() && !recycled.conclusive(),"same recycled holder did not move the native pager");
        AutoAdvanceWatchState mutated=started(base);mutated.observe(frame(base,"test_next",2,2600,3000,1600));
        check(!mutated.advanceObserved() && !mutated.conclusive(),"same model object changed logical source without pager movement");
        AutoAdvanceWatchState sameSource=started(base);sameSource.observe(frame(next,"test_first",3,0,4000,1600));sameSource.observe(frame(next,"test_first",3,200,4000,1800));
        check(!sameSource.advanceObserved(),"new pager position with duplicate source is not a second video");
        AutoAdvanceWatchState stalled=started(base);stalled.observe(frame(next,"test_next",3,0,4000,1600));stalled.observe(frame(next,"test_next",3,0,4000,1800));
        check(!stalled.advanceObserved() && !stalled.conclusive(),"next native player did not progress");
        AutoAdvanceWatchState noSource=started(base);noSource.observe(null);check(!noSource.advanceObserved(),"unavailable native source cannot advance");
        AutoAdvanceWatchState longVideo=new AutoAdvanceWatchState();longVideo.observe(frame(base,"test_first",2,0,120000,0));longVideo.observe(frame(base,"test_first",2,200,120000,200));
        check(!longVideo.conclusive(),"a long clip without end evidence is inconclusive");
        AutoAdvanceWatchState loop=started(base);loop.observe(frame(base,"test_first",2,2950,3000,1700));loop.observe(frame(base,"test_first",2,100,3000,1900));
        check(loop.conclusive() && !loop.advanceObserved(),"a real source-stable loop can disprove enabled advance");
        check(loop.report(true,1900).contains("initialCurrentUnchanged=true") && loop.report(true,1900).contains("loopObserved=true"),"off case proves a loop");
        Object[] changedWindow=following(base);changedWindow[0]=new Object();AutoAdvanceWatchState differentWindow=started(base);nextProgress(differentWindow,changedWindow);
        check(!differentWindow.conclusive() && !differentWindow.advanceObserved(),"different resumed activity cannot qualify");
        for(int index=0;index<10;index++){Object[] changed=base.clone();changed[index]=new Object();check(!AutoAdvanceWatchState.progress(frame(base,"test_first",2,100,3000,1000),frame(changed,"test_first",2,200,3000,1100)),"changed owner cannot prove progress");}
        check(!AutoAdvanceWatchState.progress(frame(base,"test_first",2,100,3000,1000),frame(base,"test_other",2,200,3000,1100)),"same holder/model with changed native source cannot prove progress");
        check(!AutoAdvanceWatchState.progress(frame(base,"test_first",2,100,3000,1000),frame(base,"test_first",2,200,3000,1000)),"duplicate clock sample cannot prove progress");
        AutoAdvanceWatchState missing=new AutoAdvanceWatchState();missing.observe(null);check(missing.report(false,0).contains("conclusive=false"),"missing runtime/mode is inconclusive");
        AutoAdvanceWatchState bounded=new AutoAdvanceWatchState();for(int n=0;n<AutoAdvanceWatchState.MAX_SAMPLES+1;n++)bounded.observe(null);
        check(bounded.report(true,0).contains("boundExceeded=true") && !bounded.conclusive(),"sample bound");
        String report=good.report(true,1800);
        check(!report.contains("test_first") && !report.contains("test_next") && !report.matches(".*video [0-9]+.*"),"identity keys and ordinal labels never leave the watcher");
        check(missing.report(false,0).contains("sameWindow=false") && missing.report(false,0).contains("initialCurrentUnchanged=false"),"missing observations cannot claim identity continuity");
        AutoAdvanceWatchState prerequisite=new AutoAdvanceWatchState();prerequisite.unavailable("existing_manager_unavailable");
        check(prerequisite.report(true,0).contains("lastUnavailableReason=existing_manager_unavailable"),"missing native prerequisite stays actionable");
        prerequisite.unavailable("/private/source/123");
        check(prerequisite.report(true,0).contains("lastUnavailableReason=native_reader_unavailable") && !prerequisite.report(true,0).contains("/private"),"raw exception or identity text cannot enter prerequisite reasons");
        AutoAdvanceWatchState stopped=started(base);
        for(int n=0;n<=5;n++)stopped.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,1800+n*100,false,false));
        check(stopped.stoppedAtEndObserved() && stopped.conclusive(),"source-stable end position quiescent for 500ms");
        check(stopped.report(true,2300).contains("stoppedAtEndObserved=true") && stopped.report(true,2300).contains("stoppedAtEndHeuristic=true")
                && stopped.report(true,2300).contains("completionCallbackObserved=false"),"stop evidence is explicitly heuristic, not a callback");
        stopped.observe(frame(base,"test_first",2,2980,3000,2400));
        check(!stopped.stoppedAtEndObserved() && !stopped.conclusive(),"resumed native playback invalidates a previous stop observation");
        AutoAdvanceWatchState paused=started(base);
        for(int n=0;n<=5;n++)paused.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,1800+n*100,false,true));
        check(!paused.stoppedAtEndObserved() && !paused.conclusive(),"a near-end pause does not qualify as stopped-at-end");
        AutoAdvanceWatchState noProgress=new AutoAdvanceWatchState();
        for(int n=0;n<=5;n++)noProgress.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,1800+n*100,false,false));
        check(!noProgress.stoppedAtEndObserved() && !noProgress.conclusive(),"initially nonplaying end position has no prior progress evidence");
        AutoAdvanceWatchState longStopped=new AutoAdvanceWatchState();longStopped.observe(frame(base,"test_first",2,1000,120000,1000));longStopped.observe(frame(base,"test_first",2,1500,120000,1500));
        for(int n=0;n<=5;n++)longStopped.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,1500,120000,1800+n*100,false,false));
        check(!longStopped.stoppedAtEndObserved() && !longStopped.conclusive(),"quiescence in a long clip is not end evidence");
        AutoAdvanceWatchState changedAtEnd=started(base);changedAtEnd.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,1800,false,false));
        for(int n=0;n<=5;n++)changedAtEnd.observe(new AutoAdvanceWatchState.Frame(base,"test_other",2,2950,3000,1900+n*100,false,false));
        check(!changedAtEnd.stoppedAtEndObserved() && !changedAtEnd.conclusive(),"changed source invalidates a stopped-at-end candidate");
        AutoAdvanceWatchState gap=started(base);gap.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,1800,false,false));gap.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,2300,false,false));
        check(!gap.stoppedAtEndObserved(),"two samples 500ms apart do not prove continuous observed quiescence");
        AutoAdvanceWatchState interrupted=started(base);for(int n=0;n<4;n++)interrupted.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,1800+n*100,false,false));
        interrupted.unavailable("native_source_changed_or_mismatched");interrupted.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2950,3000,2300,false,false));
        check(!interrupted.stoppedAtEndObserved(),"missing source sample resets the end-state interval");
        AutoAdvanceWatchState moving=started(base);for(int n=0;n<=5;n++)moving.observe(new AutoAdvanceWatchState.Frame(base,"test_first",2,2900+n,3000,1800+n*100,false,false));
        check(!moving.stoppedAtEndObserved(),"changing positions are not quiescent");
        check(!loop.stoppedAtEndObserved(),"a native loop is not a stopped-at-end observation");
        System.out.println(checks+" native source/weak-owner watcher contracts passed");
    }
}
