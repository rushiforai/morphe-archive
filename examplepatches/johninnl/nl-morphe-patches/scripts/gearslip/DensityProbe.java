package nl.johninnl.gearslip.densityprobe;

import android.app.Instrumentation;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.SurfaceTexture;
import android.os.Bundle;
import android.view.Surface;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/** Exercises density hooks in the installed patched DEX, without connecting a real car app. */
public final class DensityProbe extends Instrumentation {
    private int checks;
    private Method begin;
    private Method hosted;
    private Method previewDpi;
    private Class<?> connectionClass;
    private Class<?> templateClass;
    private Class<?> lentClass;
    private SharedPreferences preferences;

    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        start();
    }

    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Context target = getTargetContext();
            ClassLoader loader = target.getClassLoader();
            Class<?> density = loader.loadClass("patches.gearslip.CarDensity");
            begin = density.getMethod("begin", int.class, String.class);
            hosted = density.getMethod("hosted", int.class);
            previewDpi = density.getMethod("previewDpi", int.class);
            connectionClass = loader.loadClass("app.seb3thehacker.gearslip.host.CarAppConnection");
            templateClass = loader.loadClass("app.seb3thehacker.gearslip.host.TemplateApp");
            lentClass = loader.loadClass("app.seb3thehacker.gearslip.host.CarAppConnection$Lent");
            preferences = target.getSharedPreferences("morphe_car_density", Context.MODE_PRIVATE);

            choose(0);
            equal(160, startSession(160, "gearslip-projection"), "Automatic projection DPI");
            equal(180, (Integer) hosted.invoke(null, 180), "Automatic hosted DPI preserves original");
            verifyHosted(160, 160, "Automatic");

            // The caption composes before the display-start effect; it must read the new choice
            // without replacing the existing session snapshot used by hosted app metadata.
            for (int dpi : new int[]{200, 240}) {
                choose(dpi);
                equal(dpi, (Integer) previewDpi.invoke(null, 160), "Preview caption reads selected " + dpi);
                equal(160, (Integer) hosted.invoke(null, 160), "Preview caption preserves automatic session");
            }
            choose(0);
            equal(180, (Integer) previewDpi.invoke(null, 180), "Automatic caption preserves original DPI");

            for (int dpi : new int[]{200, 240}) {
                choose(dpi);
                equal(dpi, startSession(160, "gearslip-projection"), dpi + " projection DPI");
                verifyHosted(160, dpi, dpi + " DPI");
            }

            choose(200);
            equal(200, startSession(160, "gearslip-preview"), "Preview snapshots 200 DPI");
            choose(240);
            equal(200, (Integer) hosted.invoke(null, 160), "Preference change waits for new projection");
            verifyHosted(160, 200, "Pending preference");
            equal(120, startSession(120, "gearslip-cluster"), "Cluster keeps original DPI");
            equal(200, (Integer) hosted.invoke(null, 160), "Cluster preserves active snapshot");
            equal(420, startSession(420, "unrelated-display"), "Unrelated display keeps original DPI");
            equal(200, (Integer) hosted.invoke(null, 160), "Unrelated display preserves snapshot");
            equal(240, startSession(160, "gearslip-preview"), "Reopened preview applies 240 DPI");
            verifyHosted(160, 240, "Reopened preview");

            choose(0);
            equal(240, (Integer) hosted.invoke(null, 160), "Automatic selection waits for reconnect");
            equal(180, startSession(180, "gearslip-projection"), "Reconnect restores original DPI");
            verifyHosted(180, 180, "Restored automatic");

            Class<?> group = loader.loadClass("app.seb3thehacker.gearslip.ui.CarGroup");
            Object[] originalConstants = group.getEnumConstants();
            int drawerCards = 0;
            int densityCards = 0;
            for (Object item : originalConstants) {
                String name = ((Enum<?>) item).name();
                if (name.equals("MORPHE_APPS")) drawerCards++;
                if (name.equals("MORPHE_DENSITY")) densityCards++;
            }
            equal(1, drawerCards, "Exactly one Apps card");
            equal(0, densityCards, "Density has no top-level settings card");
            Field entriesField = group.getDeclaredField("$ENTRIES");
            entriesField.setAccessible(true);
            Object entries = entriesField.get(null);
            List<Object> originalEntries = new ArrayList<>();
            for (Object entry : (Iterable<?>) entries) originalEntries.add(entry);
            Class<?> drawer = loader.loadClass("patches.gearslip.DrawerApps");
            Iterator<?> reordered = (Iterator<?>) drawer.getMethod("orderedCards", Iterable.class)
                    .invoke(null, entries);
            List<Object> visibleCards = new ArrayList<>();
            while (reordered.hasNext()) visibleCards.add(reordered.next());
            equal(originalConstants.length, visibleCards.size(), "Settings card count unchanged");
            require(((Enum<?>) visibleCards.get(0)).name().equals("MORPHE_APPS"), "Apps is first in visible settings");
            List<Object> expectedStock = new ArrayList<>();
            for (Object entry : originalEntries) {
                if (!((Enum<?>) entry).name().equals("MORPHE_APPS")) expectedStock.add(entry);
            }
            require(visibleCards.subList(1, visibleCards.size()).equals(expectedStock), "Stock settings retain their display order");
            Object[] afterConstants = group.getEnumConstants();
            for (int index = 0; index < originalConstants.length; index++) {
                require(originalConstants[index] == afterConstants[index], "Enum order unchanged at " + index);
                equal(index, ((Enum<?>) afterConstants[index]).ordinal(), "Enum ordinal unchanged at " + index);
            }
            List<Object> afterEntries = new ArrayList<>();
            for (Object entry : (Iterable<?>) entriesField.get(null)) afterEntries.add(entry);
            require(originalEntries.equals(afterEntries), "Original enum entries sequence is unchanged");
            require(entries == entriesField.get(null), "Original enum entries object is unchanged");
            require(!((String) density.getMethod("title").invoke(null)).isEmpty(), "Density submenu title is available");

            // Leave the disposable validation copy at its original setting for later UI checks.
            choose(0);
            startSession(160, "gearslip-projection");
            result.putString("result", "PASS " + checks + " actual-DEX density checks");
            result.putString("scope", "Real modified connect/Lent/configuration code; no live app binding, car, or rendered readability claim");
            finish(-1, result);
        } catch (Throwable failure) {
            while (failure instanceof InvocationTargetException && failure.getCause() != null) {
                failure = failure.getCause();
            }
            result.putString("result", "FAIL after " + checks + " checks: " + failure);
            result.putString("stack", android.util.Log.getStackTraceString(failure));
            finish(1, result);
        }
    }

    private void choose(int dpi) {
        require(preferences.edit().putInt("dpi", dpi).commit(), "Preference saved: " + dpi);
    }

    private int startSession(int original, String name) throws Exception {
        return (Integer) begin.invoke(null, original, name);
    }

    private void verifyHosted(int original, int expected, String label) throws Exception {
        Throwable[] error = new Throwable[1];
        runOnMainSync(() -> {
            Object connection = null;
            try {
                Context target = getTargetContext();
                connection = connectionClass.getConstructor(Context.class).newInstance(target);
                ComponentName component = new ComponentName("nl.johninnl.fixture", "nl.johninnl.fixture.AbsentCarService");
                Object template = templateClass.getConstructor(ComponentName.class, String.class, ArrayList.class)
                        .newInstance(component, "Density fixture", new ArrayList<>(Collections.singletonList("androidx.car.app.category.NAVIGATION")));
                connectionClass.getMethod("connect", templateClass, int.class, int.class, int.class, String.class)
                        .invoke(connection, template, 1280, 480, original, null);
                equal(expected, integerField(connection, "frameDensity"), label + ": connection density");
                equal(1280, integerField(connection, "frameWidth"), label + ": connection width unchanged");
                equal(480, integerField(connection, "frameHeight"), label + ": connection height unchanged");
                Method configMethod = connectionClass.getDeclaredMethod("carConfiguration");
                configMethod.setAccessible(true);
                Configuration config = (Configuration) configMethod.invoke(connection);
                equal(expected, config.densityDpi, label + ": Configuration DPI");
                equal(1280 * 160 / expected, config.screenWidthDp, label + ": Configuration width dp");
                equal(480 * 160 / expected, config.screenHeightDp, label + ": Configuration height dp");
                equal(Math.min(config.screenWidthDp, config.screenHeightDp), config.smallestScreenWidthDp,
                        label + ": Configuration smallest width dp");

                Constructor<?> constructor = lentClass.getDeclaredConstructor(Surface.class, int.class, int.class, int.class);
                constructor.setAccessible(true);
                SurfaceTexture texture = new SurfaceTexture(false);
                Surface surface = new Surface(texture);
                try {
                    Object lent = constructor.newInstance(surface, 1280, 480, original);
                    equal(expected, integerField(lent, "dpi"), label + ": Lent DPI");
                    equal(1280, integerField(lent, "width"), label + ": Lent width unchanged");
                    equal(480, integerField(lent, "height"), label + ": Lent height unchanged");
                } finally {
                    surface.release();
                    texture.release();
                }
            } catch (Throwable failure) {
                error[0] = failure;
            } finally {
                if (connection != null) {
                    try {
                        // The queued bind callback sees binding cleared and never contacts a real app.
                        connectionClass.getMethod("disconnect", boolean.class).invoke(connection, false);
                    } catch (Throwable failure) {
                        if (error[0] == null) error[0] = failure;
                    }
                }
            }
        });
        if (error[0] != null) {
            if (error[0] instanceof Exception) throw (Exception) error[0];
            throw new AssertionError(label, error[0]);
        }
        waitForIdleSync();
    }

    private static int integerField(Object object, String name) throws Exception {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getInt(object);
    }

    private void equal(int expected, int actual, String label) {
        require(expected == actual, label + ": expected " + expected + ", got " + actual);
    }

    private void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        checks++;
    }
}
