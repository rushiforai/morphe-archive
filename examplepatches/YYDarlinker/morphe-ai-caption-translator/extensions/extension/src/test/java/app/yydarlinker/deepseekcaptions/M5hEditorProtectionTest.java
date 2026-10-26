package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import java.time.Duration;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE, shadows={M5hEditorProtectionTest.Models.class,
        M5hEditorProtectionTest.Actions.class, ConfigCredentialFailureTest.Catalog.class,
        ConfigCredentialFailureTest.Connections.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class M5hEditorProtectionTest {
    final ConfigCredentialFailureTest f=new ConfigCredentialFailureTest();
    static boolean failModel,failRefresh;
    @Implements(DeepSeekModelPreference.class) public static class Models {
        @Implementation protected static void onCredentialsChanged(Context c) {
            ConfigCredentialFailureTest.notices++;
            if(failModel)throw new IllegalStateException("fixture model callback denied");
        }
    }
    @Implements(CaptionActions.class) public static class Actions {
        @Implementation protected static void refreshConfiguration(Context c) {
            ConfigCredentialFailureTest.refreshes++;
            if(failRefresh)throw new IllegalStateException("fixture runtime callback denied");
        }
    }
    @Before public void start() throws Exception { failModel=failRefresh=false;f.before(); }
    @After public void finish() throws Exception { failModel=failRefresh=false;f.after(); }
    View recreate(ProfileEditorPreference field) {
        LinearLayout holder=new LinearLayout(f.c);
        View original=field.getView(null,holder);holder.addView(original);
        View replacement=field.getView(null,new LinearLayout(f.c));
        assertNotSame("must execute onCreateView, not reuse a row",original,replacement);
        return replacement;
    }
    @Test public void rejectedUrlSurvivesActualGetViewRecreationAndLateOldViewCannotWrite() throws Exception {
        DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
        EditText old=url.editor;old.setText("relative-draft");assertFalse(url.flushProfile());
        assertNotNull(old.getError());Map<String,Map<String,?>> before=f.c.snapshot();
        recreate(url);assertNotSame(old,url.editor);
        assertEquals("relative-draft",url.editor.getText().toString());assertNotNull(url.editor.getError());
        assertFalse(url.flushProfile());assertEquals(before,f.c.snapshot());
        old.setText("https://late.invalid/v1");Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals(before,f.c.snapshot());assertEquals("relative-draft",url.editor.getText().toString());
        url.editor.setText("https://repaired.invalid/v1");assertTrue(url.flushProfile());
        assertEquals("https://repaired.invalid/v1",ApiProfiles.values(f.c).getString("base_url",""));
        assertEquals(before.get(ConfigCredentialFailureTest.SECRET),f.c.snapshot().get(ConfigCredentialFailureTest.SECRET));
    }
    @Test public void rejectedKeySurvivesActualDetachAndRecreationThenSavesOnceDependencyRecovers() throws Exception {
        DeepSeekTextPreference key=f.field(DeepSeekTextPreference.KEY_API_KEY);
        LinearLayout host=new LinearLayout(f.c);f.activity.setContentView(host);
        host.addView(key.getView(null,host));
        key.editor.setText("fixture-failed-draft");ConfigCredentialFailureTest.unavailable=true;
        assertFalse(key.flushProfile());Map<String,Map<String,?>> before=f.c.snapshot();
        host.removeAllViews();assertEquals("fixture-failed-draft",key.editor.getText().toString());
        recreate(key);assertEquals("fixture-failed-draft",key.editor.getText().toString());
        assertNotNull(key.editor.getError());assertFalse(key.flushProfile());assertEquals(before,f.c.snapshot());
        ConfigCredentialFailureTest.unavailable=false;assertTrue(ApiProfiles.flushCurrent());
        assertEquals("fixture-failed-draft",SecureApiKey.load(f.c));assertEquals(1,ConfigCredentialFailureTest.refreshes);
        assertTrue(ApiProfiles.select(f.c,f.b));
        assertEquals("",key.editor.getText().toString());
        assertEquals(ConfigCredentialFailureTest.B,SecureApiKey.load(f.c));
    }
    @Test public void invalidMultilineKeyRetainsErrorAcrossRecreation() throws Exception {
        DeepSeekTextPreference key=f.field(DeepSeekTextPreference.KEY_API_KEY);
        // setSingleLine transforms display, but the Editable still holds the rejected characters.
        key.editor.setText("fixture-first\nfixture-second");assertFalse(key.flushProfile());
        Map<String,Map<String,?>> before=f.c.snapshot();recreate(key);
        assertEquals("fixture-first\nfixture-second",key.editor.getText().toString());
        assertNotNull(key.editor.getError());assertFalse(key.flushProfile());assertEquals(before,f.c.snapshot());
    }
    @Test public void savedValueWithFailingModelCallbackStillRefreshesAndIsNeverReportedAsRetained() throws Exception {
        DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
        failModel=true;url.editor.setText("https://saved.invalid/v1");assertTrue(url.flushProfile());
        assertEquals("https://saved.invalid/v1",ApiProfiles.values(f.c).getString("base_url",""));
        assertEquals(1,ConfigCredentialFailureTest.refreshes);
        assertEquals(CaptionStrings.get(f.c,"config_saved_sync_pending"),url.state.getText().toString());
        assertNull(url.editor.getError());assertTrue(url.flushChanged());
        assertTrue(url.flushProfile());assertFalse(url.flushChanged());assertEquals(1,ConfigCredentialFailureTest.refreshes);
    }
    @Test public void automaticSaveRuntimeFailureKeepsSavedFactAcrossRecreationWithoutDuplicateWrite() throws Exception {
        DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);failRefresh=true;
        url.editor.setText("https://saved-runtime.invalid/v1");
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals("https://saved-runtime.invalid/v1",ApiProfiles.values(f.c).getString("base_url",""));
        assertEquals(CaptionStrings.get(f.c,"config_saved_sync_pending"),url.state.getText().toString());
        assertNull(url.editor.getError());Map<String,Map<String,?>> saved=f.c.snapshot();
        recreate(url);assertEquals(saved,f.c.snapshot());
        assertEquals(CaptionStrings.get(f.c,"config_saved_sync_pending"),url.state.getText().toString());
        assertTrue(url.flushProfile());assertFalse(url.flushChanged());assertEquals(1,ConfigCredentialFailureTest.refreshes);
    }
    @Test public void dequeuedOldDebounceCannotWriteAfterProfileOrRevisionRebinding() throws Exception {
        DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
        java.lang.reflect.Field pending=ProfileEditorPreference.class.getDeclaredField("pendingSave");pending.setAccessible(true);
        url.editor.setText("https://old-view.invalid/v1");Runnable old=(Runnable)pending.get(url);
        assertTrue(ApiProfiles.select(f.c,f.b));url.getView(null,new LinearLayout(f.c));
        Map<String,Map<String,?>> selected=f.c.snapshot();old.run();
        assertEquals("an already dequeued old callback cannot edit the newly bound profile",selected,f.c.snapshot());
        url.editor.setText("https://same-id-old-revision.invalid/v1");old=(Runnable)pending.get(url);
        // Another explicit credential/profile change revokes this revision even with the same id.
        ApiProfiles.changed(f.c);url.getView(null,new LinearLayout(f.c));
        Map<String,Map<String,?>> revised=f.c.snapshot();old.run();
        assertEquals("a prior revision cannot regain write authority",revised,f.c.snapshot());
    }
}
