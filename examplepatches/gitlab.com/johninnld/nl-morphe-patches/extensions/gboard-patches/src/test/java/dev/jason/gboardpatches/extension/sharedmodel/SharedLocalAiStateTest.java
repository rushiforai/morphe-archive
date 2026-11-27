package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.content.SharedPreferences;
import app.johninnl.modelhost.api.HostStatus;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=34,manifest=Config.NONE)
public class SharedLocalAiStateTest {
    private SharedPreferences preferences;
    @Before public void setup(){preferences=RuntimeEnvironment.getApplication().getSharedPreferences("shared-state-test",Context.MODE_PRIVATE);preferences.edit().clear().commit();}
    @Test public void selectingAndTurningOffRestoresTheUsersPreviousBackend(){
        GboardAiWritingToolsSettings.writeBackendType(preferences,GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA);
        assertTrue(SharedLocalAiState.select(preferences,true));assertTrue(SharedLocalAiState.selected(preferences));
        assertTrue(SharedLocalAiState.select(preferences,true));
        assertTrue(SharedLocalAiState.select(preferences,false));assertFalse(SharedLocalAiState.selected(preferences));
        assertEquals(GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA,GboardAiWritingToolsSettings.readBackendType(preferences));
        assertTrue(GboardAiWritingToolsSettings.readEnabled(preferences));
    }
    @Test public void repeatedLocalAiEnableRestoresDisabledGoogleOverride(){
        GboardAiWritingToolsSettings.writeEnabled(preferences,false);
        assertTrue(SharedLocalAiState.select(preferences,true));
        assertTrue(SharedLocalAiState.selected(preferences));
        assertTrue(SharedLocalAiState.select(preferences,true));
        assertTrue(SharedLocalAiState.select(preferences,false));
        assertEquals(GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER,GboardAiWritingToolsSettings.readBackendType(preferences));
        assertFalse(GboardAiWritingToolsSettings.readEnabled(preferences));
    }
    @Test public void legacySavedBackendDoesNotEnableAnUnknownPreviousOverride(){
        preferences.edit()
            .putString(GboardAiWritingToolsSettings.PREF_KEY_BACKEND_TYPE,GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL)
            .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED,true)
            .putString("pref_shared_previous_backend",GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE)
            .commit();
        assertTrue(SharedLocalAiState.select(preferences,false));
        assertEquals(GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE,GboardAiWritingToolsSettings.readBackendType(preferences));
        assertFalse(GboardAiWritingToolsSettings.readEnabled(preferences));
    }
    @Test public void turningOffDoesNotChangeAnAlreadySelectedGoogleBackend(){
        GboardAiWritingToolsSettings.writeBackendType(preferences,GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE);
        SharedLocalAiState.select(preferences,false);
        assertEquals(GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE,GboardAiWritingToolsSettings.readBackendType(preferences));
    }
    @Test public void disabledWritingToolsAreNotShownAsLocalAiOn(){
        SharedLocalAiState.select(preferences,true);GboardAiWritingToolsSettings.writeEnabled(preferences,false);
        assertFalse(SharedLocalAiState.selected(preferences));
    }
    @Test public void stoppedProviderIsNotReportedReadyDuringAnAsynchronousUnload(){
        HostStatus status=new HostStatus("{\"state\":\"READY\",\"enabled\":false}");
        assertTrue(SharedLocalAiState.providerSummary(status,"").contains("Provider OFF"));
    }
    @Test public void enabledProviderWithoutAModelIsNotReportedOnAndReady(){
        HostStatus status=new HostStatus("{\"state\":\"MODEL_MISSING\",\"enabled\":true}");
        assertTrue(SharedLocalAiState.providerSummary(status,"").contains("Model MISSING"));
        assertTrue(SharedLocalAiState.providerSummary(new HostStatus("{\"state\":\"READY\",\"enabled\":true}"),"").contains("Model READY"));
    }
    @Test public void failedLoadHasAnActionInsteadOfTheGenericInstalledMessage(){
        String message=SharedLocalAiState.providerSummary(new HostStatus("{\"state\":\"FAILED\",\"enabled\":true,\"code\":\"LOAD_FAILED\"}"),"");
        assertTrue(message.contains("could not load"));assertTrue(message.contains("off and on"));
    }
    @Test public void nativePreflightFailureIsVisibleInLocalAiStatus(){
        Context context=RuntimeEnvironment.getApplication();
        SharedPreferences settings=GboardAiWritingToolsSettings.preferences(context);
        settings.edit().clear().putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED,false).commit();
        java.util.concurrent.CompletableFuture<String> request=GboardSharedWritingRuntime.request(context,"proofread","Draft",null);
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertTrue(request.isCompletedExceptionally());
        assertEquals("SHARED_BACKEND_NOT_SELECTED",SharedModelClient.lastRequestError());
    }
    @Test public void wrappedProtocolErrorsRemainActionableWithoutExposingArbitraryText(){
        assertEquals("OUTPUT_TRUNCATED",SharedLocalAiState.failureCode(new java.util.concurrent.CompletionException(new IllegalStateException("OUTPUT_TRUNCATED"))));
        assertEquals("REQUEST_FAILED",SharedLocalAiState.failureCode(new IllegalStateException("private draft text 123")));
        assertFalse(SharedLocalAiState.failureMessage("private draft text 123").contains("private draft"));
    }
}
