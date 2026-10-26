package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real UI -> application -> controller. Only device display/model discovery are replaced.
 * An already running scope is seeded explicitly, with real Session/Job/publication/render guards;
 * settings, endpoint binding, KeyStore provider, Cipher and refresh/activate are production code.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE, shadows={ConfigCredentialFailureTest.Models.class,
        ConfigCredentialFailureTest.Catalog.class, ConfigCredentialFailureTest.Connections.class,
        M5gApplicationConfigurationTest.Surface.class, M5gApplicationConfigurationTest.Native.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class M5gApplicationConfigurationTest {
    @Implements(CaptionOverlay.class) public static class Surface {
        @Implementation protected static void refreshStyle(Context c) {
            styles++;
            if(failStyle)throw new IllegalStateException("fixture display callback failed");
        }
    }
    @Implements(CaptionMusicSuppressor.class) public static class Native {
        @Implementation protected static void kick() {}
        @Implementation protected static void forceNativeRendererScan() {}
    }
    static int styles;
    static boolean failStyle;
    final ConfigCredentialFailureTest fixture=new ConfigCredentialFailureTest();
    final Map<Field,Object> originals=new LinkedHashMap<>();
    final List<RebuildController.Session> scopes=new ArrayList<>();
    CaptionApplication application;
    RebuildController.Session old;
    RebuildController.Job job;
    TranslationOutput.RenderGuard guard;
    final String source="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";

    Field field(Class<?> type,String name) throws Exception {
        Field f=type.getDeclaredField(name);f.setAccessible(true);return f;
    }
    void replace(Class<?> type,String name,Object value) throws Exception {
        Field f=field(type,name);originals.put(f,f.get(null));f.set(null,value);
    }
    RebuildController.Session current() throws Exception {
        return (RebuildController.Session)field(RebuildController.class,"active").get(null);
    }
    @Before public void start() throws Exception {
        fixture.before();styles=0;failStyle=false;
        application=(CaptionApplication)field(CaptionApplication.class,"INSTANCE").get(null);
        replace(CaptionApplication.class,"context",fixture.c);
        replace(CaptionActions.class,"port",application);
        replace(CaptionActions.class,"services",application);
        replace(TranslationRuntime.class,"host",application);
        replace(TranslationOutput.class,"sink",new TranslationOutput.Sink() {});
        replace(RebuildController.class,"video","abcdefghijk");
        replace(RebuildController.class,"active",null);
        replace(RebuildController.class,"publicationEpoch",0L);
        replace(RebuildController.class,"tickPosted",false);
        seedReadyScope();
    }
    void seedReadyScope() throws Exception {
        old=new RebuildController.Session(fixture.c,source,"abcdefghijk","fixture-running-scope",
                "zh-Hans",application.settings(fixture.c),false,true,
                CaptionLanguageContext.explicit("en","zh-Hans"));
        scopes.add(old);field(RebuildController.class,"active").set(null,old);
        job=new RebuildController.Job(old,0,true);
        Method m=RebuildController.class.getDeclaredMethod("positionGuard",RebuildController.Session.class);
        m.setAccessible(true);guard=(TranslationOutput.RenderGuard)m.invoke(null,old);
        assertTrue(old.config.ready());assertEquals(ConfigCredentialFailureTest.A,old.config.apiKey);
        assertTrue(RebuildController.current(old));assertTrue(job.tryBeginAttempt());assertTrue(guard.isValid());
    }
    @After public void finish() throws Exception {
        ExecutorService barrier=Executors.newSingleThreadExecutor();
        try {
            RebuildController.Session active=current();if(active!=null)scopes.add(active);
            RebuildController.stop();
            for(RebuildController.Session s:scopes) {
                s.cancel();barrier.submit(s::awaitRetirement).get(5,TimeUnit.SECONDS);
            }
            // Drain scheduled core/UI work while the test application and device substitutes live.
            ((android.os.Handler)field(RebuildController.class,"MAIN").get(null)).removeCallbacksAndMessages(null);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        } finally {
            barrier.shutdownNow();assertTrue(barrier.awaitTermination(3,TimeUnit.SECONDS));
            for(Map.Entry<Field,Object> e:originals.entrySet())e.getKey().set(null,e.getValue());
            fixture.after();
            failStyle=false;
        }
    }
    void assertNewUnreadyScope(String endpoint) throws Exception {
        RebuildController.Session replacement=current();assertNotNull(replacement);scopes.add(replacement);
        assertNotSame(old,replacement);assertTrue(RebuildController.current(replacement));
        assertEquals(endpoint,replacement.config.baseUrl);assertFalse(replacement.config.ready());
        assertEquals("",replacement.config.apiKey);assertTrue(replacement.terminal);
        assertTrue(old.cancelled);assertFalse(old.publication.isOpen());assertNull(old.publication.reserve());
        assertFalse(RebuildController.current(old));assertFalse(job.tryBeginAttempt());
        assertTrue(job.isCancelled());assertFalse(guard.isValid());
        assertEquals("actual application CONFIGURATION dispatch also refreshes style once",1,styles);
        assertEquals(0,ConfigCredentialFailureTest.connections);
        System.out.println("M5G_R1_APPLICATION endpoint="+replacement.config.baseUrl+
                ";new_ready="+replacement.config.ready()+";terminal="+replacement.terminal+
                ";old_current="+RebuildController.current(old)+";old_attempt="+job.tryBeginAttempt()+
                ";old_render="+guard.isValid()+";style_commands="+styles);
    }
    @Test public void realUrlSuccessKeyFailureRevokesOldApplicationScope() throws Exception {
        Map<String,Map<String,?>> entry=fixture.c.snapshot();
        DeepSeekTextPreference url=fixture.field(DeepSeekTextPreference.KEY_BASE_URL);
        DeepSeekTextPreference key=fixture.field(DeepSeekTextPreference.KEY_API_KEY);
        url.editor.setText("https://app-partial.invalid/v1");key.editor.setText("fixture-retry-draft");
        ConfigCredentialFailureTest.unavailable=true;
        assertFalse(ApiProfiles.select(fixture.c,fixture.b));
        assertEquals("default",ApiProfiles.active(fixture.c));
        assertEquals("fixture-retry-draft",key.editor.getText().toString());assertNotNull(key.editor.getError());
        assertEquals(entry.get(ConfigCredentialFailureTest.SECRET),fixture.c.snapshot().get(ConfigCredentialFailureTest.SECRET));
        fixture.unchangedOthers(entry,ConfigCredentialFailureTest.GLOBAL);
        assertNewUnreadyScope("https://app-partial.invalid/v1");
        ConfigCredentialFailureTest.unavailable=false;
        assertEquals("origin remains mismatched after Keystore recovery","",SecureApiKey.load(fixture.c));
        assertFalse(current().config.ready());assertFalse(job.tryBeginAttempt());
        fixture.otherStillReadable();
    }
    @Test public void successfulDirectFlushReachesRealApplicationAndCannotReuseOldPermit() throws Exception {
        Map<String,Map<String,?>> entry=fixture.c.snapshot();
        DeepSeekTextPreference url=fixture.field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://app-direct.invalid/v1");
        assertTrue(ApiProfiles.flushCurrent());
        assertNewUnreadyScope("https://app-direct.invalid/v1");
        fixture.unchangedOthers(entry,ConfigCredentialFailureTest.GLOBAL);fixture.otherStillReadable();
        RebuildController.Session replacement=current();
        assertTrue(ApiProfiles.flushCurrent());assertSame(replacement,current());assertEquals(1,styles);
        assertFalse(job.tryBeginAttempt());assertFalse(guard.isValid());
    }
    @Test public void corruptConfigurationRevokesActualOldScopeAndNeverAuthorizesNewRequests() throws Exception {
        android.content.SharedPreferences p=ApiProfiles.values(fixture.c);
        p.edit().putInt("model",7).apply();
        Map<String,Map<String,?>> before=fixture.c.snapshot();
        CaptionActions.refreshConfiguration(fixture.c);
        RebuildController.Session replacement=current();
        assertNotSame(old,replacement);
        assertTrue(old.cancelled);assertFalse(old.publication.isOpen());
        assertFalse(job.tryBeginAttempt());assertFalse(guard.isValid());
        if(replacement!=null) {
            scopes.add(replacement);assertFalse(replacement.config.ready());
            assertEquals("",replacement.config.apiKey);
        }
        assertFalse(application.settings(fixture.c).ready());
        ExecutorService background=Executors.newSingleThreadExecutor();
        try {
            TranslationSettings snapshot=background.submit(()->application.settings(fixture.c)).get(5,TimeUnit.SECONDS);
            assertFalse(snapshot.ready());assertEquals("",snapshot.apiKey);
        } finally {
            background.shutdownNow();assertTrue(background.awaitTermination(3,TimeUnit.SECONDS));
        }
        assertEquals(before,fixture.c.snapshot());
        assertEquals(0,ConfigCredentialFailureTest.connections);
        p.edit().putString("model","fixture-model-a").apply();
        assertTrue(application.settings(fixture.c).ready());
        assertEquals(ConfigCredentialFailureTest.A,application.settings(fixture.c).apiKey);
    }
    @Test public void actualApplicationPostSaveFailureRetainsSavedFactAndAllowsExplicitSynchronizationRetry() throws Exception {
        DeepSeekTextPreference url=fixture.field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://saved-app.invalid/v1");failStyle=true;
        try{ApiProfiles.flushCurrent();fail();}catch(IllegalStateException expected){
            assertEquals("fixture display callback failed",expected.getMessage());
        }
        assertEquals("https://saved-app.invalid/v1",ApiProfiles.values(fixture.c).getString("base_url",""));
        assertEquals(CaptionStrings.get(fixture.c,"config_saved_sync_pending"),url.state.getText().toString());
        assertNull(url.editor.getError());assertFalse(job.tryBeginAttempt());assertFalse(guard.isValid());
        assertTrue(old.cancelled);assertFalse(old.publication.isOpen());
        Map<String,Map<String,?>> saved=fixture.c.snapshot();
        failStyle=false;assertTrue(url.state.performClick());
        assertEquals(saved,fixture.c.snapshot());assertEquals(2,styles);
        assertEquals(CaptionStrings.get(fixture.c,"saved"),url.state.getText().toString());
        assertTrue(ApiProfiles.flushCurrent());assertEquals(2,styles);
        assertFalse(current().config.ready());
    }
    @Test public void typedEnabledCanBeCorrectedByActualUserSwitchWithoutTouchingProfiles() throws Exception {
        RebuildController.stop();
        replace(CaptionSessionReconciler.class,"session",null);
        replace(CaptionSessionReconciler.class,"context",null);
        replace(CaptionSessionReconciler.class,"appliedKey","");
        replace(CaptionSessionReconciler.class,"appliedSelection",-1L);
        replace(CaptionSessionReconciler.class,"applications",0);
        fixture.c.getSharedPreferences(ConfigCredentialFailureTest.GLOBAL,0).edit().putInt("enabled",7).apply();
        Map<String,Map<String,?>> before=fixture.c.snapshot();assertFalse(DeepSeekConfig.load(fixture.c).ready());
        DeepSeekEnabledPreference toggle=new DeepSeekEnabledPreference(fixture.c);
        toggle.getOnPreferenceChangeListener().onPreferenceChange(toggle,true);
        assertTrue("an explicit user toggle repairs only enabled, after validating the other settings",DeepSeekConfig.enabled(fixture.c));
        assertTrue(DeepSeekConfig.load(fixture.c).ready());assertTrue(toggle.isChecked());
        assertEquals(before.get(ConfigCredentialFailureTest.SECRET),fixture.c.snapshot().get(ConfigCredentialFailureTest.SECRET));
        assertEquals(before.get(ConfigCredentialFailureTest.INDEX),fixture.c.snapshot().get(ConfigCredentialFailureTest.INDEX));
        assertEquals(ConfigCredentialFailureTest.A,SecureApiKey.load(fixture.c));
        assertEquals(0,ConfigCredentialFailureTest.connections);
    }
    @Test public void realActiveApplyCallbackFailureRevokesApplicationScopeAfterExplicitSelection() throws Exception {
        ApiProfiles.values(fixture.c,fixture.b).edit().putString("model","").apply();
        android.content.SharedPreferences index=fixture.c.getSharedPreferences(ConfigCredentialFailureTest.INDEX,0);
        IllegalStateException problem=new IllegalStateException("fixture active listener");
        android.content.SharedPreferences.OnSharedPreferenceChangeListener listener=(prefs,key)->{if("active".equals(key))throw problem;};
        index.registerOnSharedPreferenceChangeListener(listener);
        try {
            try{ApiProfiles.select(fixture.c,fixture.b);fail();}catch(IllegalStateException expected){assertSame(problem,expected);}
            assertEquals(fixture.b,ApiProfiles.active(fixture.c));
            RebuildController.Session replacement=current();scopes.add(replacement);assertNotSame(old,replacement);
            assertEquals("https://beta.invalid/v1",replacement.config.baseUrl);
            assertEquals(ConfigCredentialFailureTest.B,replacement.config.apiKey);assertFalse(replacement.config.ready());
            assertTrue(old.cancelled);assertFalse(old.publication.isOpen());
            assertFalse(job.tryBeginAttempt());assertFalse(guard.isValid());assertEquals(1,styles);
        } finally {index.unregisterOnSharedPreferenceChangeListener(listener);}
    }
    @Test public void realClearKeyCallbackFailureRevokesApplicationScopeAndPreservesPrimaryFailure() throws Exception {
        android.content.SharedPreferences secret=fixture.secret();
        IllegalStateException problem=new IllegalStateException("fixture clear listener");
        android.content.SharedPreferences.OnSharedPreferenceChangeListener listener=(prefs,key)->{if(ConfigCredentialFailureTest.VALUE.equals(key))throw problem;};
        secret.registerOnSharedPreferenceChangeListener(listener);
        try {
            try{ApiProfiles.clearKey(fixture.c,"default");fail();}catch(IllegalStateException expected){assertSame(problem,expected);}
            assertNewUnreadyScope("https://alpha.invalid/v1");fixture.otherStillReadable();
        } finally {secret.unregisterOnSharedPreferenceChangeListener(listener);}
    }

    @Test public void testConnectionActionContainsPostSaveNotificationFailureWithoutStartingService() throws Exception {
        DeepSeekTextPreference url=fixture.field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://test-action-saved.invalid/v1");failStyle=true;
        DeepSeekActionPreference action=new DeepSeekActionPreference(fixture.c);
        action.setKey(DeepSeekActionPreference.KEY_TEST);
        assertTrue(action.getOnPreferenceClickListener().onPreferenceClick(action));
        assertEquals("https://test-action-saved.invalid/v1",ApiProfiles.values(fixture.c).getString("base_url",""));
        assertEquals(CaptionStrings.get(fixture.c,"config_saved_sync_pending"),url.state.getText().toString());
        assertEquals(CaptionStrings.get(fixture.c,"config_operation_uncertain"),org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        assertFalse(job.tryBeginAttempt());assertFalse(guard.isValid());assertEquals(1,styles);
        assertEquals(0,ConfigCredentialFailureTest.connections);
    }
}
