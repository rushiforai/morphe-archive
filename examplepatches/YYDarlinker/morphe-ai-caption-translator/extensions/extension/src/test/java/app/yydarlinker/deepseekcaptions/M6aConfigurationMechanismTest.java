package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.os.Looper;
import java.lang.reflect.Field;
import javax.crypto.Cipher;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Real strict preferences, SecureApiKey and Conscrypt; only AndroidKeyStore SPI is in memory. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows={ConfigCredentialFailureTest.Models.class,
        ConfigCredentialFailureTest.Actions.class,ConfigCredentialFailureTest.Catalog.class,ConfigCredentialFailureTest.Connections.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class M6aConfigurationMechanismTest {
    final ConfigCredentialFailureTest f=new ConfigCredentialFailureTest();
    @Before public void before() throws Exception {f.before();}
    @After public void after() throws Exception {f.after();}
    @Test public void oneStrictApplicationSettingsReadNeedsOneCredentialResolution() throws Exception {
        assertSame(Looper.getMainLooper(),Looper.myLooper());
        Field instance=CaptionApplication.class.getDeclaredField("INSTANCE");instance.setAccessible(true);CaptionApplication app=(CaptionApplication)instance.get(null);
        int before=ConfigCredentialFailureTest.reads;TranslationSettings settings=app.settings(f.c);int resolutions=ConfigCredentialFailureTest.reads-before;
        assertEquals(ConfigCredentialFailureTest.A,settings.apiKey);assertTrue(settings.enabled);assertEquals("fixture-model-a",settings.model);
        System.out.println("M6A_CONFIG strict_settings_thread="+Thread.currentThread().getName()+";main=true;keystore_reads="+resolutions+";cipher="+Cipher.getInstance("AES/GCM/NoPadding").getProvider().getName());
        assertEquals("one validated request snapshot must not decrypt the same credential twice",1,resolutions);
        before=ConfigCredentialFailureTest.reads;SecureApiKey.save(f.c,ConfigCredentialFailureTest.A);
        assertEquals("explicit user save performs its own crypto operation",1,ConfigCredentialFailureTest.reads-before);
    }
    @Test public void unreadableMetadataNeverSuppliesAPartialCredentialAndOriginGuardStillApplies() throws Exception {
        Field instance=CaptionApplication.class.getDeclaredField("INSTANCE");instance.setAccessible(true);CaptionApplication app=(CaptionApplication)instance.get(null);
        int before=ConfigCredentialFailureTest.reads;
        f.c.getSharedPreferences(ConfigCredentialFailureTest.GLOBAL,0).edit().putInt("enabled",7).apply();
        TranslationSettings settings=app.settings(f.c);assertFalse(settings.enabled);assertEquals("",settings.apiKey);assertEquals(before,ConfigCredentialFailureTest.reads);
        f.c.getSharedPreferences(ConfigCredentialFailureTest.GLOBAL,0).edit().putBoolean("enabled",true).apply();
        DeepSeekConfig.saveBaseUrl(f.c,"https://different-origin.invalid/v1");settings=app.settings(f.c);
        assertTrue(settings.enabled);assertEquals("",settings.apiKey);assertFalse(settings.ready());assertEquals(before,ConfigCredentialFailureTest.reads);
        DeepSeekConfig.saveBaseUrl(f.c,"https://alpha.invalid/v1");assertEquals(ConfigCredentialFailureTest.A,app.settings(f.c).apiKey);
    }
}
