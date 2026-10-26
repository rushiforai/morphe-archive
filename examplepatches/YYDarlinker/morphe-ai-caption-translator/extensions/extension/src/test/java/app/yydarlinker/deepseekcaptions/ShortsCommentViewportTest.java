package app.yydarlinker.deepseekcaptions;
import android.graphics.Rect;import android.os.Looper;import android.view.View;import android.widget.FrameLayout;import android.widget.TextView;
import java.time.Duration;import java.util.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=35,shadows=N39UiGeometryFixture.Geometry.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class ShortsCommentViewportTest extends N39UiGeometryFixture {
    int plans;
    @Before public void before(){CaptionPlayerAuthority.resetForTests();super.setup();shorts=true;bounds=new Rect(0,0,1264,2200);
        CaptionActions.install(new app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort(){
            public void command(app.yydarlinker.caption.contracts.CaptionContracts.Action x,String v){}public boolean active(){return true;}public boolean ownsNativeTrack(){return true;}public String restoreTarget(String s){return s;}public String videoId(){return "fixture";}public void playback(long t){}
        },new CaptionActions.SettingsServices(){public String testApi(){return "fixture";}public List<String> models(String u){return Collections.emptyList();}
            public List<CaptionDisplayPage> displayPages(String body,long start,long end,CaptionPresentationBudget b,CaptionRenderSpec s){plans++;return TranslationPresentation.pages(body,start,end,b,s);}});
        layout();
    }
    @After public void after(){super.done();CaptionPlayerAuthority.resetForTests();}
    void layout(){View root=a.getWindow().getDecorView();root.measure(View.MeasureSpec.makeMeasureSpec(1264,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(2736,View.MeasureSpec.EXACTLY));root.layout(0,0,1264,2736);}
    void draw(){for(int i=0;i<5;i++){layout();a.getWindow().getDecorView().getViewTreeObserver().dispatchOnPreDraw();Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));}}
    @Test public void shortsCommentsKeepTheOriginalPlanAndUseTheSideBars() throws Exception {
        String line="这是一整行需要完整显示的中文字幕，左右黑边也是字幕可用空间。";
        CaptionOverlay.showEvent(line,()->true,"shorts-comment-test",0,60000,1000,CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        draw();awaitPreparedCaption();int width=CaptionOverlay.budget().width;int before=plans;float size=text().getTextSize();
        bounds=new Rect(400,40,864,860);draw();awaitPreparedCaption();
        assertEquals("comment panel height changes must not narrow the caption plan",width,CaptionOverlay.budget().width);
        assertEquals("a comment-only viewport change cannot request new pages",before,plans);
        System.out.println("SHORTS_COMMENT_PLAN width_before="+width+";width_after="+CaptionOverlay.budget().width+";plans_before="+before+";plans_after="+plans);
        assertEquals(size,text().getTextSize(),.01f);assertTrue(CaptionOverlay.anchorVisible());
        assertTrue("the caption is allowed to extend into the left/right black bars",anchor().getWidth()>bounds.width());
        assertTrue(anchor().getTranslationX()>=0);assertTrue(anchor().getTranslationX()+anchor().getWidth()<=1265);
        bounds=new Rect(0,0,1264,2200);draw();assertEquals(width,CaptionOverlay.budget().width);assertEquals(before,plans);
    }
    @Test public void nativeSourceTextStaysCompleteWhenShortsCommentsShrinkOnlyTheImage() throws Exception {
        String line="你可能应该把钻石省下来去做个附魔台，因为左右两侧黑边仍是字幕空间。";
        CaptionOverlay.showEvent(line,()->true,"source:shorts-comment",-1,-1,1000,CaptionLanguageContext.explicit("zh-Hans","zh-Hans").renderSpec);
        draw();awaitPreparedCaption();int width=CaptionOverlay.budget().width;float size=text().getTextSize();
        bounds=new Rect(400,40,864,860);draw();
        assertTrue("the original-caption fallback cannot become blank",CaptionOverlay.anchorVisible());
        assertEquals(line,text().getText().toString());assertEquals(width,CaptionOverlay.budget().width);
        assertEquals(size,text().getTextSize(),.01f);assertTrue(text().getLayout().getLineCount()<=2);
        assertTrue(anchor().getTranslationX()>=0);assertTrue(anchor().getTranslationX()+anchor().getWidth()<=1265);
    }
    @Test public void identicalViewportAndFontEventsKeepPlansTextLayoutsAndFrameWorkStableM6a() throws Exception {
        CaptionOverlay.showEvent("这是用于重复视口事件测量的中文字幕，分页必须保持稳定。",()->true,"m6a-stable-viewport",0,60000,1000,CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        draw();awaitPreparedCaption();int baseline=plans;int width=CaptionOverlay.budget().width;
        java.util.concurrent.atomic.AtomicInteger textChanges=new java.util.concurrent.atomic.AtomicInteger(),layouts=new java.util.concurrent.atomic.AtomicInteger();
        TextView caption=text();
        android.text.TextWatcher watcher=new android.text.TextWatcher(){
            public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            public void onTextChanged(CharSequence s,int start,int before,int count){textChanges.incrementAndGet();}
            public void afterTextChanged(android.text.Editable e){}
        };
        View.OnLayoutChangeListener listener=(v,l,t,r,b,ol,ot,or,ob)->layouts.incrementAndGet();
        caption.addTextChangedListener(watcher);caption.addOnLayoutChangeListener(listener);
        try {
            for(int i=0;i<20;i++)draw();
            assertEquals(baseline,plans);assertEquals(0,textChanges.get());assertEquals(0,layouts.get());assertEquals(width,CaptionOverlay.budget().width);
            assertFalse((Boolean)field("beforeTraversalScheduled"));assertFalse((Boolean)field("glyphFrameScheduled"));
            bounds=new Rect(400,40,864,860);draw();awaitPreparedCaption();int commentPlans=plans;
            for(int i=0;i<20;i++)draw();assertEquals(commentPlans,plans);assertEquals(width,CaptionOverlay.budget().width);
            int repeatedText=textChanges.get(),repeatedLayouts=layouts.get();float before=caption.getTextSize();
            DeepSeekConfig.saveCaptionSizeTier(a,4);CaptionOverlay.refreshStyle(a);draw();awaitPreparedCaption();
            assertTrue("real font change still plans",plans>baseline);assertTrue(caption.getTextSize()>before);
            System.out.println("M6A_VIEWPORT repeated_events=40;pre_draws=200;same_input_new_plans=0;same_input_text_changes=0;same_input_layout_changes=0;comment_repeat_text_changes="+repeatedText+";comment_repeat_layout_changes="+repeatedLayouts+";real_font_new_plans="+(plans-baseline)+";frame_pending=false");
        } finally {caption.removeTextChangedListener(watcher);caption.removeOnLayoutChangeListener(listener);}
    }
}
