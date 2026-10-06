package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.lang.reflect.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk={28,35},shadows=N37SnapshotBindingTest.Keys.class)
@LooperMode(LooperMode.Mode.PAUSED) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N37SnapshotBindingTest {
  @Implements(SecureApiKey.class) public static class Keys {
    static AtomicInteger mainReads=new AtomicInteger();
    @Implementation public static String load(Context c){if(Looper.myLooper()==Looper.getMainLooper())mainReads.incrementAndGet();return "fixture-sensitive-key";}
  }
  Activity a;FrameLayout parent;CountDownLatch release;
  @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().visible().get();parent=new FrameLayout(a);a.setContentView(parent);CaptionDiagnostics.clear(a);CaptionDiagnosticSnapshot.invalidate();Keys.mainReads.set(0);}
  @After public void cleanup(){if(release!=null)release.countDown();a.finish();}
  void layout(View v){v.measure(View.MeasureSpec.makeMeasureSpec(1080,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(2400,View.MeasureSpec.AT_MOST));v.layout(0,0,v.getMeasuredWidth(),v.getMeasuredHeight());v.draw(new android.graphics.Canvas(android.graphics.Bitmap.createBitmap(1080,2400,android.graphics.Bitmap.Config.ARGB_8888)));}
  @Test public void collapsedBindAndClearReturnWhileArchiveIsDeliberatelyBlocked()throws Exception{
    Field f=CaptionDiagnosticArchive.class.getDeclaredField("IO");f.setAccessible(true);
    ExecutorService archive=(ExecutorService)f.get(null);CountDownLatch started=new CountDownLatch(1);release=new CountDownLatch(1);
    archive.execute(()->{started.countDown();try{release.await(10,TimeUnit.SECONDS);}catch(InterruptedException e){Thread.currentThread().interrupt();}});
    assertTrue(started.await(2,TimeUnit.SECONDS));
    CaptionDiagnostics.mark(a,"REQUEST","Authorization: Bearer fixture-sensitive-key;url=https://example.test/timedtext?signature=private",CaptionCredentialRef.of("fixture-sensitive-key"));
    DeepSeekDiagnosticsPreference pref=new DeepSeekDiagnosticsPreference(a);
    View row=pref.getView(null,parent);parent.addView(row);layout(row);
    TextView body=row.findViewWithTag("ai_diagnostics_body");
    assertEquals(CaptionStrings.settings(a,"diagnostics_loading"),body.getText().toString());
    assertFalse(body.getText().toString().contains("private"));
    for(int i=0;i<20;i++)assertSame(row,pref.getView(row,parent));
    assertEquals(1,release.getCount());assertEquals(0,Keys.mainReads.get());
    CaptionDiagnostics.clear(a);assertEquals(1,release.getCount());assertNull(CaptionDiagnosticSnapshot.peek(a));
    release.countDown();String report=N37DiagnosticsReports.read(a);
    assertFalse("old queued record cannot return after clear",report.contains("Authorization:"));
  }
  @Test public void sameLocaleAndWarmPreviewOuterRowHaveNoRepeatLayoutRequest()throws Exception{
    for(String locale:new String[]{"zh-Hans-CN","ja","ar"}){
      android.content.res.Configuration c=new android.content.res.Configuration(a.getResources().getConfiguration());c.setLocale(java.util.Locale.forLanguageTag(locale));a.getResources().updateConfiguration(c,a.getResources().getDisplayMetrics());
      TextView text=new TextView(a);text.setText("same");CaptionTextResolver.direction(text,false);layout(text);assertFalse(text.isLayoutRequested());
      CaptionTextResolver.direction(text,false);assertFalse(text.isLayoutRequested());
      SubtitleStylePreview pref=new SubtitleStylePreview(a);View row=pref.getView(null,parent);parent.addView(row);layout(row);assertFalse(row.isLayoutRequested());
      pref.getView(row,parent);assertFalse("same-input full preference row",row.isLayoutRequested());parent.removeView(row);
    }
    android.text.SpannableString first=new android.text.SpannableString("same"),second=new android.text.SpannableString("same");
    first.setSpan(new android.text.style.StyleSpan(android.graphics.Typeface.BOLD),0,4,android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    assertFalse(CaptionSettingPreference.sameText(first,second));
    assertTrue("selectable TextView buffers without style spans are still the same text",CaptionSettingPreference.sameText(second,"same"));
    second.setSpan(new android.text.NoCopySpan.Concrete(),0,0,android.text.Spanned.SPAN_MARK_MARK);
    assertTrue("native selection/watch markers are not authored styles",CaptionSettingPreference.sameText(second,"same"));
  }
  @Test public void explicitBackgroundRefreshPublishesOnlyRedactedCurrentEpoch()throws Exception{
    CaptionDiagnostics.mark(a,"REQUEST","Authorization: Bearer fixture-sensitive-key;url=https://example.test/timedtext?signature=private",CaptionCredentialRef.of("fixture-sensitive-key"));
    CountDownLatch ready=new CountDownLatch(1);AtomicReference<CaptionDiagnosticSnapshot.Snapshot> result=new AtomicReference<>();
    CaptionDiagnosticSnapshot.Callback cb=value->{result.set(value);ready.countDown();};
    CaptionDiagnosticSnapshot.request(a,cb);
    long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(8);
    while(ready.getCount()>0&&System.nanoTime()<end){Shadows.shadowOf(Looper.getMainLooper()).idle();Thread.yield();}
    java.lang.ref.Reference.reachabilityFence(cb);
    assertEquals(0,ready.getCount());assertNotNull(result.get());
    assertFalse(result.get().text.contains("fixture-sensitive-key"));assertFalse(result.get().text.contains("signature=private"));
    assertEquals(0,Keys.mainReads.get());assertEquals(result.get().text,CaptionDiagnostics.uiText(a));
    CaptionDiagnostics.clear(a);assertNull(CaptionDiagnosticSnapshot.peek(a));assertFalse(CaptionDiagnostics.uiText(a).contains("REQUEST"));
  }
}
