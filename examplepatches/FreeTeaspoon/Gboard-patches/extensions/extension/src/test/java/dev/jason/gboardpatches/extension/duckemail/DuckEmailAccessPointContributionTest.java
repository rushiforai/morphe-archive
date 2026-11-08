package dev.jason.gboardpatches.extension.duckemail;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 33)
public final class DuckEmailAccessPointContributionTest {
    private static final int ICON = 0x7f080001;
    private static final DuckEmailAccessPointContribution CONTRIBUTION =
            DuckEmailAccessPointContribution.INSTANCE;
    private Context context;

    @Before public void setup() {
        Context base = RuntimeEnvironment.getApplication();
        Resources resources = new Resources(base.getAssets(),
                base.getResources().getDisplayMetrics(), base.getResources().getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String packageName) {
                return "ic_duck_email".equals(name) && "drawable".equals(type) ? ICON : 0;
            }
        };
        context = new ContextWrapper(base) {
            @Override public Resources getResources() { return resources; }
        };
        context.getSharedPreferences(DuckEmailStore.FILE, Context.MODE_PRIVATE)
                .edit().clear().commit();
    }

    @Test public void catalogRetainsNativeImmutableSetAndOrdering() throws Exception {
        Object stock = catalog("clipboard", "translate");
        Object actual = CONTRIBUTION.extendOrderCatalog(context, stock);
        assertTrue(Class.forName("wpa").isInstance(actual));
        assertEquals(Arrays.asList("clipboard", "translate", "duck_email"),
                new ArrayList<>((Collection<?>) actual));
        assertEquals(Arrays.asList("clipboard", "translate"),
                new ArrayList<>((Collection<?>) stock));
        assertSame(actual, CONTRIBUTION.extendOrderCatalog(context, actual));
        assertThrows(UnsupportedOperationException.class, () -> ((Collection<?>) actual).clear());
    }

    @Test public void disabledAndWrongCarriersPreserveStock() throws Exception {
        Object stock = catalog("clipboard");
        new DuckEmailStore(context).enabled(false);
        assertSame(stock, CONTRIBUTION.extendOrderCatalog(context, stock));
        new DuckEmailStore(context).enabled(true);
        Object list = new ArrayList<>(Arrays.asList("clipboard"));
        Object set = new LinkedHashSet<>(Arrays.asList("clipboard"));
        assertSame(list, CONTRIBUTION.extendOrderCatalog(context, list));
        assertSame(set, CONTRIBUTION.extendOrderCatalog(context, set));
        assertSame(stock, CONTRIBUTION.extendOrderCatalog(null, stock));
    }

    @Test public void registrationRetainsActionMapAndSavedToolbarOrder() throws Exception {
        Object controller = controller();
        @SuppressWarnings("unchecked")
        Collection<String> order = (Collection<String>) field(controller, "testSavedOrder");
        order.addAll(Arrays.asList("translate", "duck_email", "clipboard"));
        CONTRIBUTION.register(controller, context);
        CONTRIBUTION.register(controller, context);
        Map<?, ?> descriptors = (Map<?, ?>) field(controller, "testDescriptors");
        assertEquals(1, descriptors.size());
        Object descriptor = descriptors.get("duck_email");
        assertNotNull("Duck email must register against the current Gboard API", descriptor);
        assertEquals(ICON, ((Number) field(descriptor, "c")).intValue());
        assertEquals("Duck email", field(descriptor, "f"));
        Object actions = field(descriptor, "j");
        assertTrue(Class.forName("wnz").isInstance(actions));
        Object press = ((Map<?, ?>) actions).get("PRESS");
        assertTrue(field(press, "payload") instanceof Runnable);
        assertEquals(Arrays.asList("translate", "duck_email", "clipboard"),
                new ArrayList<>(order));
        assertEquals(false, field(controller, "testLastBoolean"));
    }

    @Test public void disabledOrMissingIconDoesNotRegister() throws Exception {
        Object controller = controller();
        new DuckEmailStore(context).enabled(false);
        CONTRIBUTION.register(controller, context);
        new DuckEmailStore(context).enabled(true);
        CONTRIBUTION.register(controller, RuntimeEnvironment.getApplication());
        assertTrue(((Map<?, ?>) field(controller, "testDescriptors")).isEmpty());
    }

    private static Object catalog(String... tokens) throws Exception {
        return Class.forName("wpa").getDeclaredMethod("n", Collection.class)
                .invoke(null, Arrays.asList(tokens));
    }

    private static Object controller() throws Exception {
        return Class.forName("mwv").getConstructor().newInstance();
    }

    private static Object field(Object owner, String name) throws Exception {
        return owner.getClass().getField(name).get(owner);
    }
}
