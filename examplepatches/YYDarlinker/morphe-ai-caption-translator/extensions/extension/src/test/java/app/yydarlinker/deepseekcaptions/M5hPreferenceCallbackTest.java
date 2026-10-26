package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.SharedPreferences;
import android.widget.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real SharedPreferences listeners throw after in-process mutation; no apply proxy in this class.
 * The app does not currently register throwing listeners on these stores. This is a concrete
 * framework callback mechanism, not proof of disk failure or a field incident on a device.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows={ConfigCredentialFailureTest.Models.class,
        ConfigCredentialFailureTest.Actions.class,ConfigCredentialFailureTest.Catalog.class,
        ConfigCredentialFailureTest.Connections.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class M5hPreferenceCallbackTest {
    final ConfigCredentialFailureTest f=new ConfigCredentialFailureTest();
    final Map<SharedPreferences,SharedPreferences.OnSharedPreferenceChangeListener> listeners=new LinkedHashMap<>();
    final IllegalStateException problem=new IllegalStateException("fixture preference listener failed");
    @Before public void start() throws Exception {f.before();}
    @After public void finish() throws Exception {
        listeners.forEach(SharedPreferences::unregisterOnSharedPreferenceChangeListener);f.after();
    }
    void failListener(String store,String affected) {
        SharedPreferences p=f.c.getSharedPreferences(store,0);
        SharedPreferences.OnSharedPreferenceChangeListener listener=(prefs,key)->{if(affected.equals(key))throw problem;};
        listeners.put(p,listener);p.registerOnSharedPreferenceChangeListener(listener);
    }
    @Test public void changedActiveAfterRealListenerFailureStillRevisesAndRefreshesExactlyOnce() throws Exception {
        long revision=ApiProfiles.revision();Map<String,Map<String,?>> before=f.c.snapshot();
        failListener(ConfigCredentialFailureTest.INDEX,"active");
        try{ApiProfiles.select(f.c,f.b);fail();}catch(IllegalStateException e){assertSame(problem,e);}
        assertEquals(f.b,ApiProfiles.active(f.c));assertEquals(ConfigCredentialFailureTest.B,SecureApiKey.load(f.c));
        assertEquals(revision+1,ApiProfiles.revision());assertEquals(1,ConfigCredentialFailureTest.refreshes);
        assertEquals(1,ConfigCredentialFailureTest.notices);f.unchangedOthers(before,ConfigCredentialFailureTest.INDEX);
    }
    @Test public void actualListSelectionCatchesCallbackFailureAndReportsUnconfirmedOutcome() throws Exception {
        ApiProfilesPreference list=new ApiProfilesPreference(f.c);list.showProfiles();
        android.app.Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
        LinearLayout row=dialog.getWindow().getDecorView().findViewWithTag("profile_row:"+f.b);
        TextView name=(TextView)((LinearLayout)row.getChildAt(0)).getChildAt(0);
        failListener(ConfigCredentialFailureTest.INDEX,"active");assertTrue(name.performClick());
        assertEquals(f.b,ApiProfiles.active(f.c));assertEquals(1,ConfigCredentialFailureTest.refreshes);
        assertEquals(CaptionStrings.get(f.c,"config_operation_uncertain"),org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        dialog.dismiss();
    }
    @Test public void endpointApplyListenerFailurePreservesDraftButSynchronizesChangedConfiguration() throws Exception {
        DeepSeekTextPreference url=f.field(DeepSeekTextPreference.KEY_BASE_URL);
        Map<String,Map<String,?>> before=f.c.snapshot();failListener(ConfigCredentialFailureTest.GLOBAL,"base_url");
        url.editor.setText("https://listener-changed.invalid/v1");assertFalse(ApiProfiles.flushCurrent());
        assertEquals("https://listener-changed.invalid/v1",ApiProfiles.values(f.c).getString("base_url",""));
        assertEquals(1,ConfigCredentialFailureTest.refreshes);
        assertEquals("https://listener-changed.invalid/v1",url.editor.getText().toString());assertNotNull(url.editor.getError());
        assertFalse(DeepSeekConfig.load(f.c).ready());
        assertEquals(before.get(ConfigCredentialFailureTest.SECRET),f.c.snapshot().get(ConfigCredentialFailureTest.SECRET));
        f.unchangedOthers(before,ConfigCredentialFailureTest.GLOBAL);
    }
    @Test public void activeDeletePartialFailureStillRevokesPriorIdentityWithoutClaimingTransaction() throws Exception {
        ApiProfiles.select(f.c,f.b);long revision=ApiProfiles.revision();
        ConfigCredentialFailureTest.refreshes=ConfigCredentialFailureTest.notices=0;
        Map<String,Map<String,?>> before=f.c.snapshot();
        failListener(ConfigCredentialFailureTest.SECRET,ConfigCredentialFailureTest.VALUE+"_"+f.b);
        try{ApiProfiles.delete(f.c,f.b);fail();}catch(IllegalStateException e){assertSame(problem,e);}
        assertEquals("default",ApiProfiles.active(f.c));assertFalse(ApiProfiles.list(f.c).containsKey(f.b));
        assertFalse(f.secret().contains(ConfigCredentialFailureTest.VALUE+"_"+f.b));
        assertEquals(before.get("caption_profile_"+f.b),f.c.snapshot().get("caption_profile_"+f.b));
        assertEquals(revision+1,ApiProfiles.revision());assertEquals(1,ConfigCredentialFailureTest.refreshes);
        assertEquals(ConfigCredentialFailureTest.A,SecureApiKey.load(f.c));
    }
    @Test public void clearKeyListenerFailureStillSynchronizesTheRemovedCredential() throws Exception {
        Map<String,Map<String,?>> before=f.c.snapshot();
        failListener(ConfigCredentialFailureTest.SECRET,ConfigCredentialFailureTest.VALUE);
        try{ApiProfiles.clearKey(f.c,"default");fail();}catch(IllegalStateException e){assertSame(problem,e);}
        assertEquals("",SecureApiKey.load(f.c));assertFalse(DeepSeekConfig.load(f.c).ready());
        assertEquals(1,ConfigCredentialFailureTest.refreshes);assertEquals(1,ConfigCredentialFailureTest.notices);
        f.unchangedOthers(before,ConfigCredentialFailureTest.SECRET);f.otherStillReadable();
    }
}
