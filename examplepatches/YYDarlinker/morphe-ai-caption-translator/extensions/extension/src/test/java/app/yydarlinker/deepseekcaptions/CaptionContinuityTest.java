package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import java.time.Duration;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/**
 * Captured flicker (diagnostics session 26): at each page change the box was hidden when the old
 * window ended (outside_owned_window) and again while the next page was laid out (preparing_layout).
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,qualifiers="w1280dp-h1000dp-mdpi",shadows={N39UiGeometryFixture.Geometry.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class CaptionContinuityTest {
  N39UiGeometryFixture h;FrameLayout host;final AtomicLong position=new AtomicLong();
  final CaptionOverlay.RenderGuard guard=new CaptionOverlay.RenderGuard(){
    public boolean isValid(){return true;}
    public long displayPosition(long supplied){return position.get();}
  };
  final CaptionRenderSpec zh=CaptionLanguageContext.explicit("en","zh-Hans").renderSpec;

  @Before public void setup(){CaptionPlayerAuthority.resetForTests();h=new N39UiGeometryFixture();h.setup();host=(FrameLayout)h.a.findViewById(android.R.id.content);}
  @After public void done(){h.done();CaptionPlayerAuthority.resetForTests();}

  void layout(){host.measure(1073743104,1073742824);host.layout(0,0,1280,1000);host.getViewTreeObserver().dispatchOnPreDraw();}
  void show(String text,String id,long start,long end){CaptionOverlay.showEvent(text,guard,id,start,end,position.get(),zh);}
  void at(long time){position.set(time);CaptionOverlay.position(time,guard);Shadows.shadowOf(Looper.getMainLooper()).idle();layout();}

  @Test public void adjacentCaptionsChangeTextInsideABoxThatStaysVisible() throws Exception {
    position.set(2000);show("第一句话说完了。","a",1000,3000);h.awaitPreparedCaption();layout();
    assertEquals("第一句话说完了。",h.text().getText().toString());
    // The old window ended; the engine's next unit has not arrived yet.
    at(3040);
    assertEquals(View.VISIBLE,h.anchor().getVisibility());
    assertEquals("第一句话说完了。",h.text().getText().toString());
    // The next unit arrives and is laid out off the main thread: the box never disappears.
    show("第二句话紧接着开始。","b",3000,5000);Shadows.shadowOf(Looper.getMainLooper()).idle();layout();
    assertEquals(View.VISIBLE,h.anchor().getVisibility());
    h.awaitPreparedCaption();layout();
    assertEquals("第二句话紧接着开始。",h.text().getText().toString());
  }

  @Test public void aLongerPauseOrAnExplicitHideStillClearsTheBox() throws Exception {
    position.set(2000);show("第一句话说完了。","a",1000,3000);h.awaitPreparedCaption();layout();
    at(3900);
    assertNotEquals("nothing followed within the hold: the box is cleared",View.VISIBLE,h.anchor().getVisibility());
    position.set(4000);show("第二句。","b",4000,6000);h.awaitPreparedCaption();layout();
    CaptionOverlay.hide(guard);Shadows.shadowOf(Looper.getMainLooper()).idle();
    assertNotEquals(View.VISIBLE,h.anchor().getVisibility());
  }

  /** Diagnostics 22:01: a block whose reply failed reached showEvent with "" and killed the app. */
  @Test public void anEventWithoutTextClearsTheBoxInsteadOfThrowing() throws Exception {
    position.set(2000);show("第一句话说完了。","a",1000,3000);h.awaitPreparedCaption();layout();
    assertEquals(View.VISIBLE,h.anchor().getVisibility());
    position.set(2500);show("","b",1000,4000);
    Shadows.shadowOf(Looper.getMainLooper()).idle();layout();
    assertNotEquals(View.VISIBLE,h.anchor().getVisibility());
  }
  @Test public void statusAndWaitingDoNotHoldAnExpiredCaption() throws Exception {
    position.set(2000);CaptionOverlay.showStatus("处理中",guard);layout();
    assertEquals("处理中",h.text().getText().toString());
    CaptionOverlay.showWaitingEvent("等待",guard,"waiting",1000,3000,2000);layout();
    assertEquals("等待",h.text().getText().toString());
    at(3100);assertNotEquals(View.VISIBLE,h.anchor().getVisibility());
    position.set(2000);show("正常字幕。","next",1000,3000);h.awaitPreparedCaption();layout();
    assertEquals("正常字幕。",h.text().getText().toString());
    show(null,"empty",1000,3000);layout();assertNotEquals(View.VISIBLE,h.anchor().getVisibility());
  }

  @Test public void reentrantWaitingCommandDoesNotAcquireTheOuterEventWindow() throws Exception {
    position.set(2000);
    java.util.concurrent.atomic.AtomicBoolean once=new java.util.concurrent.atomic.AtomicBoolean();
    CaptionOverlay.RenderGuard outer=new CaptionOverlay.RenderGuard(){
      public boolean isValid(){return true;}
      public long displayPosition(long supplied){
        if(once.compareAndSet(false,true))
          CaptionOverlay.showWaitingEvent("等待",guard,"inner",1000,3000,2000);
        return position.get();
      }
    };
    CaptionOverlay.showStatus("旧状态",guard);
    CaptionOverlay.showEvent("外层字幕",outer,"outer",1000,3000,2000,zh);
    h.awaitPreparedCaption();layout();
    assertEquals("等待",h.text().getText().toString());
    at(3100);assertNotEquals("waiting must not acquire a caption hold",View.VISIBLE,h.anchor().getVisibility());
  }

}
