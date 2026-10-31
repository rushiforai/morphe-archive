/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;
import android.os.*;import android.view.*;
/** Platform deadlines are authoritative; older estimates are explicitly separate. */
final class FrameDiagnostics implements AutoCloseable {
 private final Window window;private HandlerThread thread;private final Handler main=new Handler(Looper.getMainLooper());private final Runnable expiry=this::update;
 private long frames,missed,deadlineFrames,worst,layout,draw,unknown,reportAt,lost,previousVsync,vsyncMax;private boolean closed,unavailableWindow;private volatile long epoch;private Window.OnFrameMetricsAvailableListener listener;
 private synchronized void collect(long expected,Window w,FrameMetrics m,int dropped){
  if(expected!=epoch||!FeatureDiagnostics.detailed())return;lost+=dropped;if(m.getMetric(FrameMetrics.FIRST_DRAW_FRAME)!=0)return;
  long total=m.getMetric(FrameMetrics.TOTAL_DURATION);if(total<=0)return;frames++;worst=Math.max(worst,total);layout=Math.max(layout,m.getMetric(FrameMetrics.LAYOUT_MEASURE_DURATION));draw=Math.max(draw,m.getMetric(FrameMetrics.DRAW_DURATION));unknown=Math.max(unknown,m.getMetric(FrameMetrics.UNKNOWN_DELAY_DURATION));
  long deadline=Build.VERSION.SDK_INT>=31?m.getMetric(FrameMetrics.DEADLINE):-1;if(deadline>0){deadlineFrames++;if(total>=deadline)missed++;}
  long vsync=Build.VERSION.SDK_INT>=26?m.getMetric(FrameMetrics.VSYNC_TIMESTAMP):-1;if(vsync>0&&previousVsync>0&&vsync>previousVsync)vsyncMax=Math.max(vsyncMax,vsync-previousVsync);if(vsync>0)previousVsync=vsync;
  long now=SystemClock.elapsedRealtime();if(now>=reportAt){float hz=w.getDecorView().getDisplay()==null?0:w.getDecorView().getDisplay().getRefreshRate();FeatureDiagnostics.event("Android-frames","entry="+FeatureDiagnostics.entry()+" lyricsOpen="+FeatureDiagnostics.panelOpen()+" frames="+frames+" deadlineFrames="+deadlineFrames+" missedDeadlines="+missed+" noDeadline="+(frames-deadlineFrames)+" worstMs="+worst/1000000.0+" layoutMaxMs="+layout/1000000.0+" drawMaxMs="+draw/1000000.0+" uiWaitMaxMs="+unknown/1000000.0+" vsyncGapMaxMs="+vsyncMax/1000000.0+" displayHz="+hz+" listenerDrops="+lost);frames=missed=deadlineFrames=worst=layout=draw=unknown=lost=vsyncMax=0;reportAt=now+2000;}
 }
 FrameDiagnostics(Window w){window=w;}
 synchronized void update(){main.removeCallbacks(expiry);if(closed)return;if(FeatureDiagnostics.detailed()){
  if(unavailableWindow)return;
  if(thread==null)try{thread=new HandlerThread("YTMusic-frame-diagnostics");thread.start();frames=missed=deadlineFrames=worst=layout=draw=unknown=lost=previousVsync=vsyncMax=0;long expected=++epoch;listener=(w,m,d)->collect(expected,w,m,d);reportAt=SystemClock.elapsedRealtime()+2000;window.addOnFrameMetricsAvailableListener(listener,new Handler(thread.getLooper()));}
  catch(Exception failure){unavailableWindow=true;release();FeatureDiagnostics.record("Android-frames","Window metrics unavailable: "+failure.getClass().getSimpleName());return;}
  main.postDelayed(expiry,2000);
 }else{unavailableWindow=false;release();}}
 private synchronized void release(){if(thread!=null){epoch++;try{window.removeOnFrameMetricsAvailableListener(listener);}catch(Exception ignored){}finally{thread.quitSafely();thread=null;}}}
 public void close(){closed=true;main.removeCallbacks(expiry);release();}
}
