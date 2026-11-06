package dev.jason.gboardpatches.extension.featureflags;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageManager;
import android.os.Bundle;

import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class GboardFeatureFlagsRuntimeBehaviorTest {
    private static final String[][] ACTIVE_FLAGS = new String[][] {
            {
                    "enable_grammar_checker",
                    GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER
            },
            {
                    "enable_inline_suggestions_on_client_side",
                    GboardPatchesFeatureAvailability.FEATURE_INLINE_SUGGESTIONS
            },
            {
                    "show_multiple_categories",
                    GboardPatchesFeatureAvailability.FEATURE_MULTIPLE_SMART_SUGGESTIONS
            },
            {
                    "more_pill_keys",
                    GboardPatchesFeatureAvailability.FEATURE_KEY_SHAPE_SELECTION
            },
            {
                    "enable_device_intelligence",
                    GboardPatchesFeatureAvailability.FEATURE_DEVICE_INTELLIGENCE
            },
    };

    private Context context;

    @Before
    public void setUp() throws Exception {
        context = RuntimeEnvironment.getApplication();
        installMetaData(new Bundle());
        resetRuntimeState();
    }

    @After
    public void tearDown() throws Exception {
        installMetaData(new Bundle());
        clearRuntimeState();
    }

    @Test
    public void eachActiveMarkerOnlyForcesItsMatchingFalseFlag() throws Exception {
        for (int activeIndex = 0; activeIndex < ACTIVE_FLAGS.length; activeIndex++) {
            Bundle markers = new Bundle();
            markers.putBoolean(ACTIVE_FLAGS[activeIndex][1], true);
            installMetaData(markers);
            resetRuntimeState();

            for (int flagIndex = 0; flagIndex < ACTIVE_FLAGS.length; flagIndex++) {
                Object result = apply(ACTIVE_FLAGS[flagIndex][0], Boolean.FALSE);
                if (flagIndex == activeIndex) {
                    assertSame(Boolean.TRUE, result);
                } else {
                    assertSame(Boolean.FALSE, result);
                }
            }
        }
    }

    @Test
    public void selectedOnlyWrappersCannotApplySiblingPolicies() throws Exception {
        Bundle markers = new Bundle();
        for (String[] activeFlag : ACTIVE_FLAGS) {
            markers.putBoolean(activeFlag[1], true);
        }
        installMetaData(markers);
        resetRuntimeState();

        assertSame(Boolean.TRUE, GboardFeatureFlagsRuntime.applyDeviceIntelligenceFlagValue(
                "enable_device_intelligence", Boolean.FALSE));
        assertSame(Boolean.FALSE, GboardFeatureFlagsRuntime.applyDeviceIntelligenceFlagValue(
                "enable_grammar_checker", Boolean.FALSE));

        assertSame(Boolean.TRUE, GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue(
                "enable_grammar_checker", Boolean.FALSE));
        assertSame(Boolean.FALSE, GboardFeatureFlagsRuntime.applyGrammarCheckerFlagValue(
                "enable_inline_suggestions_on_client_side", Boolean.FALSE));

        assertSame(Boolean.TRUE, GboardFeatureFlagsRuntime.applyInlineSuggestionsFlagValue(
                "enable_inline_suggestions_on_client_side", Boolean.FALSE));
        assertSame(Boolean.FALSE, GboardFeatureFlagsRuntime.applyInlineSuggestionsFlagValue(
                "more_pill_keys", Boolean.FALSE));

        assertSame(Boolean.TRUE, GboardFeatureFlagsRuntime.applyKeyShapeSelectionFlagValue(
                "more_pill_keys", Boolean.FALSE));
        assertSame(Boolean.FALSE, GboardFeatureFlagsRuntime.applyKeyShapeSelectionFlagValue(
                "enable_device_intelligence", Boolean.FALSE));
    }

    @Test
    @SuppressWarnings({"deprecation", "removal"})
    public void deviceMarkerOnlyForcesCanonicalFalseForDeviceIntelligence() throws Exception {
        Bundle markers = new Bundle();
        markers.putBoolean(
                GboardPatchesFeatureAvailability.FEATURE_DEVICE_INTELLIGENCE,
                true);
        installMetaData(markers);
        resetRuntimeState();

        Object sentinel = new Object();
        Boolean nonCanonicalFalse = new Boolean(false);
        assertSame(Boolean.TRUE, apply("enable_device_intelligence", Boolean.FALSE));
        assertSame(Boolean.TRUE, apply("enable_device_intelligence", Boolean.TRUE));
        assertSame(nonCanonicalFalse,
                apply("enable_device_intelligence", nonCanonicalFalse));
        assertSame(sentinel, apply("enable_device_intelligence", sentinel));
        assertSame("false", apply("enable_device_intelligence", "false"));
        assertNull(apply("enable_device_intelligence", null));

        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));
        assertSame(Boolean.FALSE,
                apply("enable_inline_suggestions_on_client_side", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("more_pill_keys", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("writing_tools", Boolean.FALSE));
        assertSame(Boolean.FALSE,
                apply("enable_writing_tools_cooperative_mode", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("unrelated_flag", Boolean.FALSE));
        assertSame(Boolean.FALSE,
                apply("enable_clipboard_entity_extraction", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_clipboard_text_editor", Boolean.FALSE));
    }

    @Test
    public void deviceMarkerMissingInvalidAndThrowingContextsFailClosed() throws Exception {
        assertSame(Boolean.FALSE, apply("enable_device_intelligence", Boolean.FALSE));
        assertFalse(GboardPatchesFeatureAvailability.hasFeature(
                null,
                GboardPatchesFeatureAvailability.FEATURE_DEVICE_INTELLIGENCE));

        Bundle invalidMarker = new Bundle();
        invalidMarker.putString(
                GboardPatchesFeatureAvailability.FEATURE_DEVICE_INTELLIGENCE,
                "true");
        installMetaData(invalidMarker);
        resetRuntimeState();
        assertSame(Boolean.FALSE, apply("enable_device_intelligence", Boolean.FALSE));

        final boolean[] packageManagerRequested = {false};
        Context throwingContext = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public PackageManager getPackageManager() {
                packageManagerRequested[0] = true;
                throw new IllegalStateException("unavailable package manager");
            }
        };
        clearRuntimeState();
        installRuntimeContext(throwingContext);

        assertSame(Boolean.FALSE, apply("enable_device_intelligence", Boolean.FALSE));
        assertTrue(packageManagerRequested[0]);

        final boolean[] applicationContextRequested = {false};
        Context throwingApplicationContext = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                applicationContextRequested[0] = true;
                throw new IllegalStateException("unavailable application context");
            }
        };
        clearRuntimeState();
        installRuntimeContext(throwingApplicationContext);

        assertSame(Boolean.FALSE, apply("enable_device_intelligence", Boolean.FALSE));
        assertTrue(applicationContextRequested[0]);
    }

    @Test
    @SuppressWarnings({"deprecation", "removal"})
    public void inlineMarkerOnlyForcesCanonicalFalseForInlineSuggestions() throws Exception {
        Bundle markers = new Bundle();
        markers.putBoolean(
                GboardPatchesFeatureAvailability.FEATURE_INLINE_SUGGESTIONS,
                true);
        installMetaData(markers);
        resetRuntimeState();

        Object sentinel = new Object();
        Boolean nonCanonicalFalse = new Boolean(false);
        assertSame(nonCanonicalFalse,
                apply("enable_inline_suggestions_on_client_side", nonCanonicalFalse));
        assertSame(Boolean.TRUE,
                apply("enable_inline_suggestions_on_client_side", Boolean.FALSE));
        assertSame(Boolean.TRUE,
                apply("enable_inline_suggestions_on_client_side", Boolean.TRUE));
        assertSame(sentinel,
                apply("enable_inline_suggestions_on_client_side", sentinel));
        assertNull(apply("enable_inline_suggestions_on_client_side", null));

        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("more_pill_keys", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_device_intelligence", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("unrelated_flag", Boolean.FALSE));
        assertSame(Boolean.FALSE,
                apply("enable_clipboard_entity_extraction", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_clipboard_text_editor", Boolean.FALSE));
    }

    @Test
    public void inlineMarkerMissingInvalidAndThrowingContextsFailClosed() throws Exception {
        assertSame(Boolean.FALSE,
                apply("enable_inline_suggestions_on_client_side", Boolean.FALSE));

        Bundle invalidMarker = new Bundle();
        invalidMarker.putString(
                GboardPatchesFeatureAvailability.FEATURE_INLINE_SUGGESTIONS,
                "true");
        installMetaData(invalidMarker);
        resetRuntimeState();
        assertSame(Boolean.FALSE,
                apply("enable_inline_suggestions_on_client_side", Boolean.FALSE));

        final boolean[] packageManagerRequested = {false};
        Context throwingContext = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public PackageManager getPackageManager() {
                packageManagerRequested[0] = true;
                throw new IllegalStateException("unavailable package manager");
            }
        };
        clearRuntimeState();
        installRuntimeContext(throwingContext);

        assertSame(Boolean.FALSE,
                apply("enable_inline_suggestions_on_client_side", Boolean.FALSE));
        assertTrue(packageManagerRequested[0]);
    }

    @Test
    @SuppressWarnings({"deprecation", "removal"})
    public void keyShapeMarkerOnlyForcesCanonicalFalseForKeyShapeSelection() throws Exception {
        Bundle markers = new Bundle();
        markers.putBoolean(
                GboardPatchesFeatureAvailability.FEATURE_KEY_SHAPE_SELECTION,
                true);
        installMetaData(markers);
        resetRuntimeState();

        Object sentinel = new Object();
        Boolean nonCanonicalFalse = new Boolean(false);
        assertSame(nonCanonicalFalse, apply("more_pill_keys", nonCanonicalFalse));
        assertSame(Boolean.TRUE, apply("more_pill_keys", Boolean.FALSE));
        assertSame(Boolean.TRUE, apply("more_pill_keys", Boolean.TRUE));
        assertSame(sentinel, apply("more_pill_keys", sentinel));
        assertSame("false", apply("more_pill_keys", "false"));
        assertNull(apply("more_pill_keys", null));

        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));
        assertSame(Boolean.FALSE,
                apply("enable_inline_suggestions_on_client_side", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_device_intelligence", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("unrelated_flag", Boolean.FALSE));
        assertSame(Boolean.FALSE,
                apply("enable_clipboard_entity_extraction", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_clipboard_text_editor", Boolean.FALSE));
    }

    @Test
    public void keyShapeMarkerMissingInvalidAndThrowingContextsFailClosed() throws Exception {
        assertSame(Boolean.FALSE, apply("more_pill_keys", Boolean.FALSE));
        assertFalse(GboardPatchesFeatureAvailability.hasFeature(
                null,
                GboardPatchesFeatureAvailability.FEATURE_KEY_SHAPE_SELECTION));

        Bundle invalidMarker = new Bundle();
        invalidMarker.putString(
                GboardPatchesFeatureAvailability.FEATURE_KEY_SHAPE_SELECTION,
                "true");
        installMetaData(invalidMarker);
        resetRuntimeState();
        assertSame(Boolean.FALSE, apply("more_pill_keys", Boolean.FALSE));

        final boolean[] packageManagerRequested = {false};
        Context throwingContext = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public PackageManager getPackageManager() {
                packageManagerRequested[0] = true;
                throw new IllegalStateException("unavailable package manager");
            }
        };
        clearRuntimeState();
        installRuntimeContext(throwingContext);

        assertSame(Boolean.FALSE, apply("more_pill_keys", Boolean.FALSE));
        assertTrue(packageManagerRequested[0]);
    }

    @Test
    public void absentInvalidAndUnrelatedMarkersFailClosed() throws Exception {
        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));

        Bundle invalidMarker = new Bundle();
        invalidMarker.putString(
                GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER,
                "true");
        installMetaData(invalidMarker);
        resetRuntimeState();

        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_grammar_checker_sibling", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply(null, Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("", Boolean.FALSE));
    }

    @Test
    public void availabilityNullContextAndThrowingPackageManagerFailClosed() throws Exception {
        assertFalse(GboardPatchesFeatureAvailability.hasFeature(
                null,
                GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER));

        final boolean[] packageManagerRequested = {false};
        Context throwingContext = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public PackageManager getPackageManager() {
                packageManagerRequested[0] = true;
                throw new IllegalStateException("unavailable package manager");
            }
        };
        clearRuntimeState();
        installRuntimeContext(throwingContext);

        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));
        assertTrue(packageManagerRequested[0]);
    }

    @Test
    public void throwingApplicationContextLookupFailsClosed() throws Exception {
        final boolean[] applicationContextRequested = {false};
        Context throwingContext = new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                applicationContextRequested[0] = true;
                throw new IllegalStateException("unavailable application context");
            }
        };
        clearRuntimeState();
        installRuntimeContext(throwingContext);

        assertSame(Boolean.FALSE, apply("enable_grammar_checker", Boolean.FALSE));
        assertTrue(applicationContextRequested[0]);
    }

    @Test
    public void originalTrueNonBooleanAndNullKeepTheirIdentity() throws Exception {
        Bundle markers = new Bundle();
        markers.putBoolean(GboardPatchesFeatureAvailability.FEATURE_GRAMMAR_CHECKER, true);
        installMetaData(markers);
        resetRuntimeState();

        Object sentinel = new Object();
        assertSame(Boolean.TRUE, apply("enable_grammar_checker", Boolean.TRUE));
        assertSame(sentinel, apply("enable_grammar_checker", sentinel));
        assertNull(apply("enable_grammar_checker", null));
    }

    @Test
    public void retiredClipboardFlagsNeverReturnToTheActiveMap() throws Exception {
        Bundle retiredMarkers = new Bundle();
        retiredMarkers.putBoolean(
                "dev.jason.gboardpatches.feature.clipboard_entity_extraction",
                true);
        retiredMarkers.putBoolean(
                "dev.jason.gboardpatches.feature.clipboard_item_edit",
                true);
        installMetaData(retiredMarkers);
        resetRuntimeState();

        assertSame(Boolean.FALSE, apply("enable_clipboard_entity_extraction", Boolean.FALSE));
        assertSame(Boolean.FALSE, apply("enable_clipboard_text_editor", Boolean.FALSE));
    }

    @Test
    @SuppressWarnings("unchecked")
    public void recognizedFlagMapIsImmutableAndContainsOnlyTheFivePublicFlags()
            throws Exception {
        Field field = GboardFeatureFlagsRuntime.class.getDeclaredField("FLAG_TO_FEATURE_KEY");
        field.setAccessible(true);
        Map<String, String> flagMap = (Map<String, String>) field.get(null);

        assertEquals(5, flagMap.size());
        assertFalse(flagMap.containsKey("enable_clipboard_entity_extraction"));
        assertFalse(flagMap.containsKey("enable_clipboard_text_editor"));
        try {
            flagMap.put("unexpected", "unexpected");
            fail("Recognized flag map must be immutable");
        } catch (UnsupportedOperationException expected) {
            // Expected.
        }
    }

    private Object apply(String flagName, Object original) throws Exception {
        Method method;
        try {
            method = GboardFeatureFlagsRuntime.class.getDeclaredMethod(
                    "applyOverriddenFlagValue",
                    String.class,
                    Object.class);
        } catch (NoSuchMethodException exception) {
            throw new AssertionError(
                    "Runtime must expose applyOverriddenFlagValue(String, Object)",
                    exception);
        }

        try {
            return method.invoke(null, flagName, original);
        } catch (InvocationTargetException exception) {
            Throwable cause = exception.getCause();
            if (cause instanceof Exception) {
                throw (Exception) cause;
            }
            if (cause instanceof Error) {
                throw (Error) cause;
            }
            throw exception;
        }
    }

    private void installMetaData(Bundle metaData) {
        context.getApplicationInfo().metaData = metaData;
    }

    private void resetRuntimeState() throws Exception {
        clearRuntimeState();
        installRuntimeContext(context);
    }

    private static void installRuntimeContext(Context context) throws Exception {
        Field applicationContext = GboardFeatureFlagsRuntime.class
                .getDeclaredField("APPLICATION_CONTEXT");
        applicationContext.setAccessible(true);
        applicationContext.set(null, context);
    }

    @SuppressWarnings("unchecked")
    private static void clearRuntimeState() throws Exception {
        Field cache = GboardFeatureFlagsRuntime.class.getDeclaredField("FEATURE_ENABLED_CACHE");
        cache.setAccessible(true);
        ((Map<String, Boolean>) cache.get(null)).clear();

        Field applicationContext = GboardFeatureFlagsRuntime.class
                .getDeclaredField("APPLICATION_CONTEXT");
        applicationContext.setAccessible(true);
        applicationContext.set(null, null);
    }
}
