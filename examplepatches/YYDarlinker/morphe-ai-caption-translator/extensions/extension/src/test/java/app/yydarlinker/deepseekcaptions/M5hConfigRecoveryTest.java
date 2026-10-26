package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.SharedPreferences;
import android.os.Looper;
import android.view.View;
import android.widget.LinearLayout;
import java.time.Duration;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real stores, AES/GCM and settings rows; no fake config or credential reads. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE, shadows={ConfigCredentialFailureTest.Models.class,
        ConfigCredentialFailureTest.Actions.class, ConfigCredentialFailureTest.Catalog.class,
        ConfigCredentialFailureTest.Connections.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class M5hConfigRecoveryTest {
    final ConfigCredentialFailureTest f=new ConfigCredentialFailureTest();
    @Before public void start() throws Exception { f.before(); }
    @After public void finish() throws Exception { f.after(); }
    SharedPreferences index() { return f.c.getSharedPreferences(ConfigCredentialFailureTest.INDEX,0); }
    void restore(SharedPreferences p,String key,Object value) {
        SharedPreferences.Editor e=p.edit();
        if(value instanceof String)e.putString(key,(String)value);
        else if(value instanceof Boolean)e.putBoolean(key,(Boolean)value);
        else if(value instanceof Integer)e.putInt(key,(Integer)value);
        else e.remove(key);
        e.apply();
    }
    void unreadable() {
        assertFalse("corrupt settings cannot authorize a model request",DeepSeekConfig.load(f.c).ready());
        assertFalse(DeepSeekConfig.load(f.c).readable);
        assertEquals("",SecureApiKey.load(f.c));
    }
    @Test public void corruptIndexOpensRealListAndRowsWithoutWritingAndCanRereadBackup() throws Exception {
        Object original=index().getAll().get("names");
        for(Object bad:Arrays.asList("{",7,"{\"x\":7}")) {
            restore(index(),"names",bad);
            Map<String,Map<String,?>> before=f.c.snapshot();
            unreadable();
            ApiProfilesPreference list=new ApiProfilesPreference(f.c);
            list.getView(null,new LinearLayout(f.c));
            assertEquals(CaptionStrings.get(f.c,"config_unreadable"),list.getSummary());
            list.showProfiles();
            f.field(DeepSeekTextPreference.KEY_BASE_URL);
            f.field(DeepSeekTextPreference.KEY_API_KEY);
            new DeepSeekEnabledPreference(f.c).getView(null,new LinearLayout(f.c));
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            assertEquals("opening and debounce must preserve every original value",before,f.c.snapshot());
            android.app.Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
            assertNotNull(dialog);assertTrue(dialog.isShowing());dialog.dismiss();
            restore(index(),"names",original);
            assertTrue(DeepSeekConfig.load(f.c).ready());
            assertEquals(ConfigCredentialFailureTest.A,SecureApiKey.load(f.c));
            for(ProfileEditorPreference p:f.fields) {p.cancelPendingSave();ApiProfiles.unregister(p);}
            f.fields.clear();
        }
    }
    @Test public void unknownOrTypedActiveRequiresExplicitValidSelection() throws Exception {
        for(Object bad:Arrays.asList("ghost",7)) {
            restore(index(),"active",bad);Map<String,Map<String,?>> before=f.c.snapshot();
            unreadable();assertEquals(before,f.c.snapshot());
            ApiProfilesPreference list=new ApiProfilesPreference(f.c);list.showProfiles();
            android.app.Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
            LinearLayout row=dialog.getWindow().getDecorView().findViewWithTag("profile_row:"+f.b);
            android.widget.TextView name=(android.widget.TextView)((LinearLayout)row.getChildAt(0)).getChildAt(0);
            assertTrue("valid index permits an actual user selection",name.performClick());
            assertEquals(f.b,ApiProfiles.active(f.c));assertEquals(ConfigCredentialFailureTest.B,SecureApiKey.load(f.c));
            dialog.dismiss();
            assertTrue(ApiProfiles.select(f.c,"default"));
        }
    }
    @Test public void wrongFieldTypesDoNotAuthorizeOrOverwriteOnRealRowInitialization() throws Exception {
        for(String key:Arrays.asList("base_url","model","prompt","enabled",ConfigCredentialFailureTest.VALUE,
                ConfigCredentialFailureTest.VALUE+"_origin")) {
            SharedPreferences p=f.c.getSharedPreferences(key.startsWith("api_key")?ConfigCredentialFailureTest.SECRET:ConfigCredentialFailureTest.GLOBAL,0);
            Object original=p.getAll().get(key);restore(p,key,7);
            Map<String,Map<String,?>> before=f.c.snapshot();
            assertFalse(DeepSeekConfig.load(f.c).ready());
            DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
            f.field(DeepSeekTextPreference.KEY_API_KEY);
            DeepSeekModelPreference model=new DeepSeekModelPreference(f.c);model.setKey(DeepSeekModelPreference.KEY_MODEL);
            f.fields.add(model);model.getView(null,new LinearLayout(f.c));
            new DeepSeekEnabledPreference(f.c).getView(null,new LinearLayout(f.c));
            url.getView(null,new LinearLayout(f.c));model.getView(null,new LinearLayout(f.c));
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
            assertEquals(key,before,f.c.snapshot());
            for(ProfileEditorPreference field:f.fields){field.cancelPendingSave();ApiProfiles.unregister(field);}f.fields.clear();
            restore(p,key,original);assertTrue(DeepSeekConfig.load(f.c).ready());
            assertEquals(ConfigCredentialFailureTest.A,SecureApiKey.load(f.c));f.otherStillReadable();
        }
    }
    @Test public void invalidEndpointHasActualEditRecoveryAndNeverRebindsOriginalKey() throws Exception {
        for(Object bad:Arrays.asList("not a URI","relative",7,"","  ")) {
            SharedPreferences p=ApiProfiles.values(f.c);restore(p,"base_url",bad);
            Map<String,Map<String,?>> before=f.c.snapshot();unreadable();
            DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
            assertTrue(url.state.getText().toString().contains(CaptionStrings.get(f.c,"config_unreadable")));
            assertEquals(before,f.c.snapshot());
            url.editor.setText("https://recovered.invalid/v1");assertTrue(url.flushProfile());
            assertEquals("https://recovered.invalid/v1",p.getString("base_url",""));
            assertEquals(before.get(ConfigCredentialFailureTest.SECRET),f.c.snapshot().get(ConfigCredentialFailureTest.SECRET));
            assertEquals("",SecureApiKey.load(f.c));assertFalse(DeepSeekConfig.load(f.c).ready());
            url.editor.setText("https://alpha.invalid/v1");assertTrue(url.flushProfile());
            assertEquals(ConfigCredentialFailureTest.A,SecureApiKey.load(f.c));assertTrue(DeepSeekConfig.load(f.c).ready());
            f.otherStillReadable();url.cancelPendingSave();ApiProfiles.unregister(url);f.fields.clear();
        }
    }
    @Test public void typedModelCanBeCorrectedThroughActualEditorWithoutTouchingCredential() throws Exception {
        SharedPreferences p=ApiProfiles.values(f.c);p.edit().putInt("model",7).apply();
        Map<String,Map<String,?>> before=f.c.snapshot();
        DeepSeekModelPreference model=new DeepSeekModelPreference(f.c);model.setKey(DeepSeekModelPreference.KEY_MODEL);
        f.fields.add(model);model.getView(null,new LinearLayout(f.c));
        assertEquals("",model.editor.getText().toString());
        assertEquals(before,f.c.snapshot());model.editor.setText("fixture-repaired-model");assertTrue(model.flushProfile());
        assertTrue(DeepSeekConfig.load(f.c).ready());assertEquals("fixture-repaired-model",DeepSeekConfig.load(f.c).model);
        f.unchangedOthers(before,ConfigCredentialFailureTest.GLOBAL);f.otherStillReadable();
    }
    @Test public void unboundCredentialAndLostOriginalEndpointRequireExplicitRecoveryDecision() throws Exception {
        f.secret().edit().remove(ConfigCredentialFailureTest.VALUE+"_origin").apply();
        ApiProfiles.values(f.c).edit().putString("base_url","relative").apply();
        Map<String,Map<String,?>> damaged=f.c.snapshot();
        DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://must-not-rebind.invalid/v1");assertFalse(url.flushProfile());
        assertEquals(damaged,f.c.snapshot());assertEquals("",SecureApiKey.load(f.c));
        assertTrue(url.state.getText().toString().contains(CaptionStrings.get(f.c,"config_origin_recovery")));
        // Only the test-owned pre-damage endpoint is restored; opening/typing did not guess it.
        ApiProfiles.values(f.c).edit().putString("base_url","https://alpha.invalid/v1").apply();
        assertEquals(ConfigCredentialFailureTest.A,SecureApiKey.load(f.c));
        assertFalse(f.secret().contains(ConfigCredentialFailureTest.VALUE+"_origin"));
    }
}
