package dev.jason.gboardpatches.extension.advancedvoice;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.List;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsTestHost;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public final class GboardAdvancedVoiceBackendSettingsFeatureTest {
    private Context context;
    private SharedPreferences preferences;

    @Before
    public void resetPreferences() {
        context = RuntimeEnvironment.getApplication();
        preferences = GboardAdvancedVoiceSettings.preferences(context);
        preferences.edit().clear().commit();
        GboardAdvancedVoiceSettings.ensureDefaults(preferences);
    }

    @Test
    public void masterOffSelectsStandardAndDisablesBackendChoice() {
        CapturingHost host = new CapturingHost(context);
        GboardPatchesSettingsContract.Screen screen =
                new GboardAdvancedVoiceSettingsFeature(context).buildScreen(host);

        GboardPatchesSettingsContract.SelectorRow backend = findSelector(
                screen.getRows(), "Voice typing backend");
        Assert.assertNotNull(backend);
        Assert.assertFalse(backend.isEnabled());
        Assert.assertEquals("Advanced Voice Typing", backend.getCurrentValue());
        Assert.assertEquals(GboardVoiceInputMode.STANDARD,
                GboardVoiceInputMode.resolve(
                        GboardAdvancedVoiceSettings.readEnabled(preferences),
                        GboardAdvancedVoiceSettings.readBackend(preferences)));
    }

    @Test
    public void backendDialogPersistsRamblerAndRefreshesTheScreen() {
        GboardAdvancedVoiceSettings.writeEnabled(preferences, true);
        CapturingHost host = new CapturingHost(context);
        GboardPatchesSettingsContract.SelectorRow backend = findSelector(
                new GboardAdvancedVoiceSettingsFeature(context)
                        .buildScreen(host)
                        .getRows(),
                "Voice typing backend");

        Assert.assertTrue(backend.isEnabled());
        backend.getAction().run();
        Assert.assertArrayEquals(
                new String[] {
                        GboardAdvancedVoiceSettings.BACKEND_ADVANCED,
                        GboardAdvancedVoiceSettings.BACKEND_RAMBLER
                },
                host.choiceValues);
        host.choiceConsumer.accept(GboardAdvancedVoiceSettings.BACKEND_RAMBLER);

        Assert.assertEquals(GboardAdvancedVoiceSettings.BACKEND_RAMBLER,
                GboardAdvancedVoiceSettings.readBackend(preferences));
        Assert.assertEquals(1, host.refreshCount);
    }

    private static GboardPatchesSettingsContract.SelectorRow findSelector(
            List<GboardPatchesSettingsContract.Row> rows,
            String title) {
        for (GboardPatchesSettingsContract.Row row : rows) {
            if (row instanceof GboardPatchesSettingsContract.SelectorRow selector
                    && title.contentEquals(selector.getTitle())) {
                return selector;
            }
        }
        return null;
    }

    private static final class CapturingHost extends GboardPatchesSettingsTestHost {
        private final Context context;
        private String[] choiceValues;
        private GboardPatchesSettingsContract.StringValueConsumer choiceConsumer;
        private int refreshCount;

        private CapturingHost(Context context) {
            this.context = context;
        }

        @Override
        public Context getContext() {
            return context;
        }

        @Override
        public void refresh() {
            refreshCount++;
        }

        @Override
        public void showChoiceDialog(String title, String[] labels, String[] values,
                String currentValue, String customValue, Runnable customAction,
                GboardPatchesSettingsContract.StringValueConsumer valueConsumer) {
            choiceValues = values;
            choiceConsumer = valueConsumer;
        }
    }
}
