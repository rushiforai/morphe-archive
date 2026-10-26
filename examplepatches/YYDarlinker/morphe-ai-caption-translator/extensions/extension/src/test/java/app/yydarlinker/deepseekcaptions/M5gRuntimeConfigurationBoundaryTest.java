package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.yydarlinker.caption.contracts.CaptionContracts.Action;
import app.yydarlinker.caption.contracts.CaptionContracts.CaptionPort;

/** Verifies that a partial flush reaches the real UI-to-application configuration port. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class M5gRuntimeConfigurationBoundaryTest {
    Activity activity;
    final List<Action> actions = new ArrayList<>();
    final List<String> runtimeEndpoints = new ArrayList<>();
    final List<ProfileEditorPreference> fields = new ArrayList<>();
    final List<Field> staticFields = new ArrayList<>();
    final List<Object> staticValues = new ArrayList<>();
    boolean rejectNotification;
    Object previousPort;
    Object previousServices;

    @Before
    public void setUp() throws Exception {
        for (String name : new String[] {"editors", "flushing", "revision"}) {
            Field field = ApiProfiles.class.getDeclaredField(name);
            field.setAccessible(true);
            Object value = field.get(null);
            staticFields.add(field);
            staticValues.add(value instanceof List ? new ArrayList<>((List<?>) value) : value);
            if (value instanceof List) ((List<?>) value).clear();
        }
        Field port = CaptionActions.class.getDeclaredField("port");
        Field services = CaptionActions.class.getDeclaredField("services");
        port.setAccessible(true);
        services.setAccessible(true);
        previousPort = port.get(null);
        previousServices = services.get(null);
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        CaptionActions.install(
                new CaptionPort() {
                    public void command(Action action, String value) {
                        assertFalse("callback outside profile lock", Thread.holdsLock(ApiProfiles.LOCK));
                        assertFalse("flush state cleared before callback", ApiProfiles.flushing());
                        actions.add(action);
                        if (action == Action.CONFIGURATION)
                            runtimeEndpoints.add(DeepSeekConfig.load(activity).baseUrl);
                        if (rejectNotification) throw new IllegalArgumentException("fixture notification");
                    }

                    public boolean active() {
                        return false;
                    }

                    public boolean ownsNativeTrack() {
                        return false;
                    }

                    public String restoreTarget(String url) {
                        return url;
                    }

                    public String videoId() {
                        return "";
                    }

                    public void playback(long mediaTimeMs) {}
                },
                new CaptionActions.SettingsServices() {
                    public String testApi() {
                        return "fixture";
                    }

                    public List<String> models(String endpoint) {
                        return new ArrayList<>();
                    }
                });
    }

    @After
    public void tearDown() throws Exception {
        for (ProfileEditorPreference field : fields) {
            field.cancelPendingSave();
            ApiProfiles.unregister(field);
        }
        if (activity != null) activity.finish();
        Field port = CaptionActions.class.getDeclaredField("port");
        Field services = CaptionActions.class.getDeclaredField("services");
        port.setAccessible(true);
        services.setAccessible(true);
        port.set(null, previousPort);
        services.set(null, previousServices);
        for (int i = 0; i < staticFields.size(); i++) {
            Field field = staticFields.get(i);
            Object value = staticValues.get(i);
            if (value instanceof List) {
                List current = (List) field.get(null);
                current.clear();
                current.addAll((List) value);
            } else field.set(null, value);
        }
    }

    @Test
    public void partialFlushReachesCaptionActionsConfigurationBoundary() {
        String target = ApiProfiles.create(activity, "Target", "https://target.invalid/v1");
        assertEquals(0, actions.size());
        actions.clear();

        DeepSeekTextPreference url = new DeepSeekTextPreference(activity);
        url.setKey(DeepSeekTextPreference.KEY_BASE_URL);
        View row = url.getView(null, new LinearLayout(activity));
        fields.add(url);
        EditText editor = CaptionEditorIds.editorIn(row);
        editor.setText("https://edited.invalid/v1");

        ApiProfiles.Editor failing =
                new ApiProfiles.Editor() {
                    public boolean flushProfile() {
                        throw new IllegalStateException("fixture later editor");
                    }

                    public void profileChanged() {}
                };
        ApiProfiles.register(failing);
        try {
            try {
                ApiProfiles.select(activity, target);
                throw new AssertionError("expected later editor failure");
            } catch (IllegalStateException expected) {
                // The caller's exception semantics remain unchanged.
            }
            assertEquals(ApiProfiles.LEGACY, ApiProfiles.active(activity));
            assertEquals(
                    "https://edited.invalid/v1",
                    ApiProfiles.values(activity).getString("base_url", ""));
            assertEquals(1, actions.size());
            assertEquals(Action.CONFIGURATION, actions.get(0));
            assertEquals("https://edited.invalid/v1", runtimeEndpoints.get(0));
        } finally {
            ApiProfiles.unregister(failing);
        }
    }

    DeepSeekTextPreference editedUrl() {
        DeepSeekTextPreference url=new DeepSeekTextPreference(activity);
        url.setKey(DeepSeekTextPreference.KEY_BASE_URL);
        url.getView(null,new LinearLayout(activity));fields.add(url);
        url.editor.setText("https://saved-before-operation.invalid/v1");return url;
    }
    @Test public void successfulSelectionOnlyNotifiesWithNewActiveSnapshotR1() {
        String target=ApiProfiles.create(activity,"Next","https://next-profile.invalid/v1");
        editedUrl();assertTrue(ApiProfiles.select(activity,target));
        assertEquals(1,actions.size());assertEquals(Action.CONFIGURATION,actions.get(0));
        assertEquals("https://next-profile.invalid/v1",runtimeEndpoints.get(0));
    }
    @Test public void notificationFailureDoesNotLeakFlushStateOrPretendTheSaveWasUndoneR1() {
        DeepSeekTextPreference url=editedUrl();rejectNotification=true;
        try { ApiProfiles.flushCurrent();fail("expected notification failure"); }
        catch(IllegalArgumentException expected){assertEquals("fixture notification",expected.getMessage());}
        assertFalse(ApiProfiles.flushing());assertEquals(1,actions.size());
        assertEquals("https://saved-before-operation.invalid/v1",DeepSeekConfig.load(activity).baseUrl);
        rejectNotification=false;assertTrue(ApiProfiles.flushCurrent());assertEquals(1,actions.size());
        url.editor.setText("https://later-operation.invalid/v1");
        assertTrue(ApiProfiles.flushCurrent());assertEquals(2,actions.size());
    }
    @Test public void editorExceptionStaysPrimaryWhenNotificationAlsoThrowsR1() {
        editedUrl();rejectNotification=true;
        IllegalStateException original=new IllegalStateException("fixture editor primary");
        ApiProfiles.Editor bad=new ApiProfiles.Editor() {
            public boolean flushProfile(){throw original;}
            public void profileChanged(){fail("no rebind");}
        };
        ApiProfiles.register(bad);
        try {
            try { ApiProfiles.flushCurrent();fail("expected editor failure"); }
            catch(IllegalStateException actual){
                assertSame(original,actual);assertEquals(1,actual.getSuppressed().length);
                assertEquals("fixture notification",actual.getSuppressed()[0].getMessage());
            }
            assertEquals(1,actions.size());assertFalse(ApiProfiles.flushing());
        } finally {ApiProfiles.unregister(bad);rejectNotification=false;}
    }
}
