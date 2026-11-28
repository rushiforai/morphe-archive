package app.yydarlinker.aicaptions.overlay;

import app.yydarlinker.aicaptions.CaptionDisplayPage;
import app.yydarlinker.aicaptions.CaptionLanguageContext;
import app.yydarlinker.aicaptions.CaptionPresentationBudget;
import app.yydarlinker.aicaptions.CaptionRenderSpec;
import app.yydarlinker.aicaptions.TranslationPresentation;
import app.yydarlinker.aicaptions.host.CaptionActions;
import app.yydarlinker.aicaptions.host.NativeCaptionBridge;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.yydarlinker.caption.contracts.CaptionContracts;
import java.time.Duration;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, shadows = CaptionUiGeometryFixture.Geometry.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public abstract class CaptionViewportFixture {
    static final String ANCHOR = "yydarlinker.ai.caption.anchor";
    static final String TEXT = "yydarlinker.ai.caption.overlay";
    static final CaptionOverlay.RenderGuard OWNER = () -> true;
    static final int WIDTH = 1264, HEIGHT = 1800;
    Activity activity;
    FrameLayout host;

    @Before public void setup() {
        NativeCaptionBridge.setCc(NativeCaptionBridge.ON);
        CaptionUiGeometryFixture.shorts = false;
        CaptionUiGeometryFixture.bounds = new Rect(110, 30, 1010, 810);
        CaptionActions.install(new CaptionContracts.CaptionPort() {
            public void command(CaptionContracts.Action action, String value) {}
            public boolean active() { return false; }
            public boolean ownsNativeTrack() { return false; }
            public String restoreTarget(String url) { return url; }
            public String videoId() { return "fixture"; }
            public void playback(long at) {}
        }, new CaptionActions.SettingsServices() {
            public String testApi() { throw new AssertionError(); }
            public java.util.List<String> models(String endpoint) { throw new AssertionError(); }
            public java.util.List<CaptionDisplayPage> displayPages(String body, long start, long end,
                    CaptionPresentationBudget budget, CaptionRenderSpec spec) {
                return TranslationPresentation.pages(body, start, end, budget, spec);
            }
        });
        attach(Robolectric.buildActivity(Activity.class).setup().visible().get());
    }

    @After public void done() {
        CaptionOverlay.clear();
        CaptionOverlay.setActivity(null);
        activity.finish();
    }

    void attach(Activity next) {
        activity = next;
        activity.getApplicationInfo().flags |= android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL;
        activity.getResources().getDisplayMetrics().widthPixels = WIDTH;
        activity.getResources().getDisplayMetrics().heightPixels = HEIGHT;
        host = activity.findViewById(android.R.id.content);
        AiCaptionConfig.saveCaptionSizeTier(activity, 2);
        CaptionOverlay.setActivity(activity);
        layout();
    }

    void layout() {
        host.measure(View.MeasureSpec.makeMeasureSpec(WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(HEIGHT, View.MeasureSpec.EXACTLY));
        host.layout(0, 0, WIDTH, HEIGHT);
        host.getViewTreeObserver().dispatchOnPreDraw();
    }

    TextView text() { return host.findViewWithTag(TEXT); }
    FrameLayout anchor() { return host.findViewWithTag(ANCHOR); }

    TextView show(String body, String target) throws Exception {
        CaptionOverlay.showEvent(body, OWNER, "viewport:" + body, 1000, 61_000, 2000,
                CaptionLanguageContext.explicit("en", target).renderSpec);
        String start = body.split("[\\s\\n]", 2)[0];
        for (int i = 0; i < 180; i++) {
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(22));
            layout();
            TextView text = text();
            if (text != null && anchor().getVisibility() == View.VISIBLE
                    && text.getText().toString().startsWith(start)) return text;
            Thread.sleep(5);
        }
        throw new AssertionError("caption did not reach the view: " + start);
    }

    void assertCenter(float expected) {
        FrameLayout box = anchor();
        assertEquals(View.VISIBLE, box.getVisibility());
        assertEquals(expected, box.getX() + box.getWidth() / 2f - host.getScrollX(), 1f);
    }

}
