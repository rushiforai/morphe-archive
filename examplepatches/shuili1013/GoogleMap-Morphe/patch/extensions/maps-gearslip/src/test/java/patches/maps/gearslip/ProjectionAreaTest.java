package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.app.Service;
import android.content.Intent;
import android.graphics.Rect;
import android.os.IBinder;
import java.lang.reflect.Field;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class ProjectionAreaTest {
    public static final class HarnessService extends Service {
        @Override public IBinder onBind(Intent intent) { return null; }
    }
    public static final class Presentation {
        Rect insets;
        int updates;
        public void A(Rect value) { insets = new Rect(value); updates++; }
    }
    public static final class Controller {
        public final Rect v = new Rect();
        public final Presentation k = new Presentation();
    }
    private final Controller controller = new Controller();
    private ProjectionRenderer renderer() throws Exception {
        ProjectionRenderer renderer = new ProjectionRenderer(
                Robolectric.buildService(HarnessService.class).create().get(),
                error -> { throw new AssertionError(error); });
        set(renderer, "controller", controller);
        set(renderer, "created", true);
        set(renderer, "nativeWidth", 1280); set(renderer, "nativeHeight", 480);
        return renderer;
    }
    private static void set(Object target, String name, Object value) throws Exception {
        Field field = target.getClass().getDeclaredField(name); field.setAccessible(true); field.set(target, value);
    }
    @Test public void visibleBoundsBecomeEdgeInsetsWithoutChangingTheCanvas() throws Exception {
        ProjectionRenderer renderer = renderer();
        renderer.visibleArea(new Rect(0, 0, 920, 396));
        assertEquals(new Rect(0, 0, 360, 84), controller.k.insets);
        assertEquals(controller.k.insets, controller.v);
        Field width = ProjectionRenderer.class.getDeclaredField("nativeWidth"); width.setAccessible(true);
        assertEquals(1280, width.getInt(renderer));
    }
    @Test public void leftPlayerAndBottomBarUseSurfaceCoordinates() throws Exception {
        renderer().visibleArea(new Rect(360, 0, 1280, 396));
        assertEquals(new Rect(360, 0, 0, 84), controller.k.insets);
    }
    @Test public void unknownVisibleAreaFallsBackToStableBounds() throws Exception {
        ProjectionRenderer renderer = renderer();
        renderer.stableArea(new Rect(0, 0, 1280, 396));
        renderer.visibleArea(new Rect());
        assertEquals(new Rect(0, 0, 0, 84), controller.k.insets);
    }
    @Test public void updatesAreCopiedAndStableDoesNotReplaceKnownVisibleBounds() throws Exception {
        ProjectionRenderer renderer = renderer();
        Rect visible = new Rect(0, 0, 920, 396);
        renderer.visibleArea(visible); visible.setEmpty();
        renderer.stableArea(new Rect(0, 0, 1280, 480));
        assertEquals(new Rect(0, 0, 360, 84), controller.k.insets);
        assertEquals(1, controller.k.updates);
    }
    @Test public void closingPlayerRestoresNormalInsets() throws Exception {
        ProjectionRenderer renderer = renderer();
        renderer.visibleArea(new Rect(0, 0, 920, 396));
        renderer.visibleArea(new Rect(0, 0, 1280, 480));
        assertEquals(new Rect(), controller.k.insets);
    }
    @Test public void malformedOrOffCanvasAreasCannotCollapseTheDrawingTarget() throws Exception {
        ProjectionRenderer renderer = renderer();
        renderer.visibleArea(new Rect(1400, 0, 1500, 480));
        assertEquals(new Rect(), controller.k.insets);
        renderer.visibleArea(new Rect(-10, -10, 1400, 600));
        assertEquals(new Rect(), controller.k.insets);
    }
}
