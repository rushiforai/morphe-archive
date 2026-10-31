package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.AssetManager;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
public final class ModelUpdateBadgeTest {
    private static final String GEMMA = repeat('a');
    private static final String WHISPER = repeat('b');
    private static final String UPDATED = repeat('c');
    private Context context;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        ExtensionSettings.local(context).edit().clear().commit();
    }

    @Test public void observationDoesNotAcknowledgeUntilModelScreenDisplaysPair() {
        String pair = ModelUpdateBadge.identity(GEMMA, WHISPER);
        assertTrue(ModelUpdateBadge.state(context, pair).available());
        assertTrue(ModelUpdateBadge.state(context, pair).unseen);
        assertTrue(ModelUpdateBadge.state(context, pair).unseen);
        assertTrue(ModelUpdateBadge.acknowledge(context, pair));
        assertFalse(ModelUpdateBadge.state(context, pair).unseen);
        // A fresh context/view after returning or process recreation uses persisted acknowledgement.
        Context freshContext = new ContextWrapper(context);
        assertFalse(ModelUpdateBadge.state(freshContext, pair).unseen);
    }

    @Test public void eitherPinnedHashChangesDiscoveryRegardlessOfDownloadState() {
        String pair = ModelUpdateBadge.identity(GEMMA, WHISPER);
        assertTrue(ModelUpdateBadge.acknowledge(context, pair));
        assertTrue(ModelUpdateBadge.state(context, ModelUpdateBadge.identity(UPDATED, WHISPER)).unseen);
        assertTrue(ModelUpdateBadge.state(context, ModelUpdateBadge.identity(GEMMA, UPDATED)).unseen);
        assertFalse(ModelUpdateBadge.state(context, pair).unseen);
        // Download completion/verification preferences are not model acknowledgement.
        ExtensionSettings.local(context).edit().putString("verified_model", UPDATED)
                .putString("verified_whisper_model", WHISPER).commit();
        assertTrue(ModelUpdateBadge.state(context, ModelUpdateBadge.identity(UPDATED, WHISPER)).unseen);
    }

    @Test public void incompleteMetadataDoesNotReplaceAcknowledgement() {
        String pair = ModelUpdateBadge.identity(GEMMA, WHISPER);
        assertTrue(ModelUpdateBadge.acknowledge(context, pair));
        assertEquals("", ModelUpdateBadge.identity(null, WHISPER));
        assertEquals("", ModelUpdateBadge.identity(GEMMA, "invalid"));
        assertFalse(ModelUpdateBadge.state(context, "").available());
        assertFalse(ModelUpdateBadge.state(context, "").unseen);
        assertFalse(ModelUpdateBadge.acknowledge(context, ""));
        assertFalse(ModelUpdateBadge.state(context, pair).unseen);
    }

    @Test public void absentSummaryPatchDoesNotOpenModelAssets() {
        Context recordingOnly = new ContextWrapper(context) {
            @Override public AssetManager getAssets() {
                throw new AssertionError("Recording-only settings must not access model assets");
            }
        };
        ModelUpdateBadge.State state = ModelUpdateBadge.observe(recordingOnly);
        assertFalse(state.available());
        assertFalse(state.unseen);
    }

    private static String repeat(char value) {
        char[] hash = new char[64];
        java.util.Arrays.fill(hash, value);
        return new String(hash);
    }
}
