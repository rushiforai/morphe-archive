package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Rect;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Native Android text measurement with controlled player bounds; not a real YouTube screenshot. */
class N39UiGeometryFixture {
  static Rect bounds;
  static boolean shorts;
  Activity a;

  @Implements(CaptionSurface.class)
  public static class Geometry {
    @Implementation
    public static boolean isShorts() {
      return shorts;
    }

    @Implementation
    public static boolean shortsSurfaceNow() {
      return shorts;
    }

    @Implementation
    public static View refresh() {
      return null;
    }

    @Implementation
    public static Rect currentVideoBounds(View h) {
      return bounds == null ? null : new Rect(bounds);
    }
  }

  public void setup() {
    CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
    shorts = false;
    bounds = new Rect(0, 0, 600, 340);
    a = Robolectric.buildActivity(Activity.class).setup().visible().get();
    a.getResources().getDisplayMetrics().widthPixels = 1264;
    a.getResources().getDisplayMetrics().heightPixels = 2736;
    DeepSeekConfig.saveCaptionSizeTier(a, 2);
    CaptionActions.install(new app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort(){
      public void command(app.yydarlinker.caption.contracts.CaptionContracts.Action action,String value){}public boolean active(){return false;}public boolean ownsNativeTrack(){return false;}public String restoreTarget(String u){return u;}public String videoId(){return "fixture";}public void playback(long t){}
    },new CaptionActions.SettingsServices(){public String testApi(){return "fixture";}public java.util.List<String> models(String endpoint){return java.util.Collections.emptyList();}
      public java.util.List<CaptionDisplayPage> displayPages(String body,long start,long end,CaptionPresentationBudget geometry,CaptionRenderSpec spec){return TranslationPresentation.pages(body,start,end,geometry,spec);}
    });
    CaptionOverlay.resetPresentationDedupForTests();
    CaptionOverlay.clear();
    CaptionOverlay.setActivity(a);
  }

  void awaitPreparedCaption(){
    long deadline=System.nanoTime()+java.util.concurrent.TimeUnit.SECONDS.toNanos(4);
    while(System.nanoTime()<deadline){
      org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(20));
      try{TextView view=text();FrameLayout box=anchor();if(view!=null&&view.getText().length()>0&&box!=null&&box.getVisibility()==View.VISIBLE
          &&((Long)field("layoutHoldSince"))<0)return;}catch(Exception ignored){} // not the previous caption held during layout
      try{Thread.sleep(2);}catch(InterruptedException stopped){Thread.currentThread().interrupt();throw new AssertionError(stopped);}
    }
    throw new AssertionError("Upstream page never became visible: "+presentationHistory());
  }

  public void done() {
    CaptionOverlay.clear();
    CaptionOverlay.setActivity(null);
    a.finish();
  }

  static Object field(String name) throws Exception {
    Field f = CaptionOverlay.class.getDeclaredField(name);
    f.setAccessible(true);
    return f.get(null);
  }

  TextView text() throws Exception {
    return (TextView) ((WeakReference<?>) field("textRef")).get();
  }

  FrameLayout anchor() throws Exception {
    return (FrameLayout) ((WeakReference<?>) field("anchorRef")).get();
  }

  String presentationHistory() {
    return CaptionDiagnostics.history(a);
  }

}
