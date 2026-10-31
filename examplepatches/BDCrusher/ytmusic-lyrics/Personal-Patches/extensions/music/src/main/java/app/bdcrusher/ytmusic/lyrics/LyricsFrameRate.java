/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.os.Build;import android.view.View;
/** A local adaptive-refresh vote, without changing window or system/user rate settings. */
final class LyricsFrameRate {
 private float last=Float.NaN,original;private boolean owned;
 void update(View view,boolean animate,String setting){
  if(Build.VERSION.SDK_INT<35)return;
  float rate=View.REQUESTED_FRAME_RATE_CATEGORY_DEFAULT;
  if(animate){rate=View.REQUESTED_FRAME_RATE_CATEGORY_HIGH;if(setting!=null&&!"DEFAULT".equals(setting))try{float requested=Float.parseFloat(setting);if(Float.isFinite(requested)&&requested>=24&&requested<=240)rate=requested;}catch(NumberFormatException ignored){}}
  if(Float.compare(rate,last)==0)return;
  if(!owned){original=view.getRequestedFrameRate();owned=true;}
  view.setRequestedFrameRate(rate);last=rate;LyricsDiagnostics.record("Frame-rate","viewVote="+rate+" animate="+animate+" setting="+setting);
 }
 void release(View view){if(Build.VERSION.SDK_INT>=35&&owned){view.setRequestedFrameRate(original);owned=false;last=Float.NaN;}}
}
