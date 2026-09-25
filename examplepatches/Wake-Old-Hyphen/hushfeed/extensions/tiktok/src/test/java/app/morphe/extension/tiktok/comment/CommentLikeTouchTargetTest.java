package app.morphe.extension.tiktok.comment;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Build;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {23, 35}, qualifiers = "mdpi")
@LooperMode(LooperMode.Mode.PAUSED)
public class CommentLikeTouchTargetTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private boolean originalSetting;

    @Before public void enable() {
        originalSetting = Settings.LARGER_COMMENT_LIKE_TARGET.get();
        Settings.LARGER_COMMENT_LIKE_TARGET.save(true);
    }
    @After public void restore() { Settings.LARGER_COMMENT_LIKE_TARGET.save(originalSetting); }

    @Test public void nearMissReachesNativeLikeWithoutMovingOrRelabelingTheControl() {
        try (Row f = new Row()) {
            Rect before = rect(f.like);
            f.tap(310, 170); // 10dp to the left of the native target.
            assertEquals(1, f.likes);
            assertEquals(List.of(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_UP), f.actions);
            assertEquals(0, f.dislikes);
            assertEquals(before, rect(f.like));
            assertEquals(240, f.row.getHeight());
            assertEquals("native like label", f.like.getContentDescription());
            assertFalse(f.like.isClickable()); // The native OnTouchListener owns it.
            f.tap(340, 170); // Original center is still native, exactly once.
            assertEquals(2, f.likes);
        }
    }

    @Test public void offHasOnlyNativeHitAreaAndDoesNotReplaceAnotherDelegate() {
        Settings.LARGER_COMMENT_LIKE_TARGET.save(false);
        try (Row f = new Row()) {
            assertNull(f.row.getTouchDelegate());
            f.tap(310, 170);
            assertEquals(0, f.likes);
            f.tap(340, 170);
            assertEquals(1, f.likes);
            assertEquals(Boolean.FALSE, Settings.LARGER_COMMENT_LIKE_TARGET.defaultValue);
            assertTrue(Settings.LARGER_COMMENT_LIKE_TARGET.rebootApp);
        }
    }

    @Test public void siblingTextReplyDislikeAndDiagonalsKeepTheirSpace() {
        try (Row f = new Row()) {
            TextView text = new TextView(f.activity);
            text.setText("comment body");
            f.add(f.row, text, 290, 125, 150, 35); // Ends exactly at the Like row.
            View reply = new View(f.activity);
            reply.setOnClickListener(v -> f.replies++);
            f.add(f.row, reply, 260, 160, 45, 24);
            f.layout();
            TouchDelegate delegate = f.row.getTouchDelegate();
            assertFalse(f.down(delegate, 340, 150)); // Text, even when nonclickable.
            assertFalse(f.down(delegate, 300, 170)); // Reply.
            assertFalse(f.down(delegate, 375, 190)); // Beyond the Like/Dislike dividing edge.
            f.tap(380, 170);
            assertEquals(1, f.dislikes);
            assertEquals(0, f.likes);
            f.tap(280, 170);
            assertEquals(1, f.replies);
            f.tap(310, 170);
            assertEquals(1, f.likes);
        }
    }

    @Test public void dragCancelLongHoldAndMultitouchNeverBecomeLikes() {
        try (Row f = new Row()) {
            for (String kind : List.of("drag", "cancel", "hold", "multi")) {
                f.actions.clear();
                f.event(MotionEvent.ACTION_DOWN, 310, 170, 0);
                if (kind.equals("drag")) f.event(MotionEvent.ACTION_MOVE, 310, 100, 20);
                if (kind.equals("cancel")) f.event(MotionEvent.ACTION_CANCEL, 310, 170, 20);
                if (kind.equals("multi")) {
                    MotionEvent.PointerProperties a = new MotionEvent.PointerProperties(); a.id = 0;
                    MotionEvent.PointerProperties b = new MotionEvent.PointerProperties(); b.id = 1;
                    MotionEvent.PointerCoords x = new MotionEvent.PointerCoords(); x.x = 310; x.y = 170;
                    MotionEvent.PointerCoords y = new MotionEvent.PointerCoords(); y.x = 312; y.y = 172;
                    MotionEvent event = MotionEvent.obtain(f.time, f.time + 20,
                            MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT),
                            2, new MotionEvent.PointerProperties[]{a,b}, new MotionEvent.PointerCoords[]{x,y},
                            0,0,1,1,0,0,0,0);
                    try { f.row.getTouchDelegate().onTouchEvent(event); } finally { event.recycle(); }
                }
                f.event(MotionEvent.ACTION_UP, 310, 170, kind.equals("hold") ? 1000 : 30);
                assertEquals(kind, 0, f.likes);
                assertTrue(kind, f.actions.contains(MotionEvent.ACTION_CANCEL));
                assertFalse(kind, f.actions.contains(MotionEvent.ACTION_UP));
            }
        }
    }

    @Test public void rebindDuringPressCancelsWithoutLikingTheNextComment() {
        try (Row f = new Row()) {
            f.event(MotionEvent.ACTION_DOWN, 310, 170, 0);
            CommentLikeTouchTarget.onCellBound(f.row);
            idle();
            f.event(MotionEvent.ACTION_UP, 310, 170, 30);
            assertEquals(0, f.likes);
            assertTrue(f.actions.contains(MotionEvent.ACTION_CANCEL));
            f.tap(310, 170);
            assertEquals(1, f.likes);
        }
    }

    @Test public void detachRestoresAndCachedReattachFindsTheSameRow() {
        try (Row f = new Row()) {
            f.event(MotionEvent.ACTION_DOWN, 310, 170, 0);
            f.activity.setContentView(new FrameLayout(f.activity));
            assertNull(f.row.getTouchDelegate());
            assertEquals(0, f.likes);
            f.mount();
            f.layout(); idle();
            assertNotNull(f.row.getTouchDelegate());
            f.tap(310, 170);
            assertEquals(1, f.likes);
        }
    }

    @Test public void disablingDuringPressCancelsAndRebindRemovesOnlyOurDelegate() {
        try (Row f = new Row()) {
            f.event(MotionEvent.ACTION_DOWN, 310, 170, 0);
            Settings.LARGER_COMMENT_LIKE_TARGET.save(false);
            f.event(MotionEvent.ACTION_UP, 310, 170, 30);
            assertEquals(0, f.likes);
            CommentLikeTouchTarget.onCellBound(f.row); idle();
            assertNull(f.row.getTouchDelegate());
            f.tap(340, 170);
            assertEquals(1, f.likes);
        }
    }

    @Test public void foreignDelegatesBeforeOrAfterBindingAreNeverOverwritten() {
        try (Row f = new Row()) {
            TouchDelegate foreign = new TouchDelegate(new Rect(1,1,20,20), f.other);
            f.row.setTouchDelegate(foreign);
            CommentLikeTouchTarget.onCellBound(f.row); idle();
            assertSame(foreign, f.row.getTouchDelegate());
            f.activity.setContentView(new FrameLayout(f.activity));
            assertSame(foreign, f.row.getTouchDelegate());
        }
        try (Row f = new Row(false)) {
            TouchDelegate foreign = new TouchDelegate(new Rect(1,1,20,20), f.other);
            f.row.setTouchDelegate(foreign);
            f.bind();
            assertSame(foreign, f.row.getTouchDelegate());
            f.tap(310,170);
            assertEquals(0, f.likes);
        }
    }

    @Test public void layoutChangesAndRtlUseCurrentGeometryAndNeverAnotherRow() {
        try (Row f = new Row()) {
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) f.actionsRow.getLayoutParams();
            params.leftMargin = 80;
            f.actionsRow.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
            ((FrameLayout.LayoutParams) f.like.getLayoutParams()).leftMargin = 48;
            ((FrameLayout.LayoutParams) f.other.getLayoutParams()).leftMargin = 0;
            f.layout();
            f.tap(310, 170);
            assertEquals(0, f.likes);
            f.tap(180, 170);
            assertEquals(1, f.likes);
            assertFalse(f.down(f.row.getTouchDelegate(), 80, 241));
            if (Build.VERSION.SDK_INT >= 29) {
                var info = f.row.getTouchDelegate().getTouchDelegateInfo();
                assertEquals(1, info.getRegionCount());
                assertTrue(info.getRegionAt(0).contains(180,170));
                assertFalse(info.getRegionAt(0).contains(120,170));
            }
        }
    }

    private static Rect rect(View v) { return new Rect(v.getLeft(), v.getTop(), v.getRight(), v.getBottom()); }
    private static void idle() { shadowOf(Looper.getMainLooper()).idle(); }

    private static final class Row implements AutoCloseable {
        final ActivityController<Activity> owner = Robolectric.buildActivity(Activity.class).setup().visible();
        final Activity activity = owner.get();
        final FrameLayout row = new FrameLayout(activity), actionsRow = new FrameLayout(activity);
        final View like = new View(activity), other = new View(activity);
        final List<Integer> actions = new ArrayList<>();
        int likes, dislikes, replies;
        long time;
        Row() { this(true); }
        Row(boolean bind) {
            like.setContentDescription("native like label");
            add(row, actionsRow, 320,160,96,24);
            add(actionsRow, like,0,0,48,24);
            add(actionsRow, other,48,0,48,24);
            other.setOnClickListener(v -> dislikes++);
            mount();
            layout();
            if (bind) bind();
        }
        void bind() {
            CommentLikeTouchTarget.setNativeListener(like, (v,e) -> {
                actions.add(e.getActionMasked());
                if (e.getActionMasked() == MotionEvent.ACTION_UP) likes++;
                return true;
            });
            CommentLikeTouchTarget.onCellBound(row);
            idle();
        }
        void add(ViewGroup parent, View view, int x, int y, int w, int h) {
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(w,h);
            params.gravity = android.view.Gravity.TOP | android.view.Gravity.LEFT;
            params.leftMargin=x; params.topMargin=y;
            parent.addView(view,params);
        }
        void mount() {
            if (row.getParent() instanceof ViewGroup) ((ViewGroup) row.getParent()).removeView(row);
            FrameLayout content = new FrameLayout(activity);
            add(content, row, 0, 0, 480, 240);
            activity.setContentView(content);
        }
        void layout() {
            row.measure(View.MeasureSpec.makeMeasureSpec(480,View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(240,View.MeasureSpec.EXACTLY));
            row.layout(0,0,480,240);
        }
        void tap(float x,float y) { event(MotionEvent.ACTION_DOWN,x,y,0); event(MotionEvent.ACTION_UP,x,y,30); idle(); }
        void event(int action,float x,float y,int delay) {
            if (action == MotionEvent.ACTION_DOWN) time=SystemClock.uptimeMillis();
            MotionEvent e=MotionEvent.obtain(time,time+delay,action,x,y,0);
            try { row.dispatchTouchEvent(e); } finally { e.recycle(); }
        }
        boolean down(TouchDelegate delegate,float x,float y) {
            MotionEvent e=MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,x,y,0);
            try { return delegate.onTouchEvent(e); } finally { e.recycle(); }
        }
        @Override public void close() { owner.close(); }
    }
}
