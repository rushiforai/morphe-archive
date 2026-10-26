package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Only the AI rendering mode is persistent. Native language changes never write a preference. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE)
public class CaptionSessionIntentTest {
    Activity a;
    @Before public void before(){a=Robolectric.buildActivity(Activity.class).setup().get();CaptionSessionIntent.resetForTests(a);CaptionNativeProjection.resetForTests();}
    @After public void after(){CaptionSessionIntent.resetForTests(a);CaptionNativeProjection.resetForTests();a.finish();}

    @Test public void anUntouchedInstallHasNoIntent(){
        CaptionSessionIntent intent=CaptionSessionIntent.load(a);
        assertFalse(intent.aiEnabled);assertEquals(0L,intent.revision);
        assertEquals(CaptionSessionIntent.PROVENANCE_NONE,intent.provenance);
    }
    @Test public void theAiSwitchIsStoredAndReadBack(){
        CaptionSessionIntent on=CaptionSessionIntent.userToggled(a,true);
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertEquals(1L,on.revision);assertEquals(CaptionSessionIntent.PROVENANCE_USER,on.provenance);
        CaptionSessionIntent off=CaptionSessionIntent.userToggled(a,false);
        assertFalse(CaptionSessionIntent.load(a).aiEnabled);assertEquals(2L,off.revision);
    }
    @Test public void aLegacyTargetIsIgnoredAndRemovedByTheNextSwitchAct(){
        SharedPreferences old=a.getSharedPreferences("deepseek_caption_session",Context.MODE_PRIVATE);
        old.edit().putBoolean("ai_enabled",true).putString("target_language","en").putBoolean("translate_target",false).apply();
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertFalse(CaptionSessionIntent.load(a).summary().contains("target="));
        assertFalse(CaptionNativeProjection.snapshot().hasTarget());
        CaptionSessionIntent.userToggled(a,true);
        assertFalse(old.contains("target_language"));assertFalse(old.contains("translate_target"));
    }
    @Test public void nativeLanguageSelectionNeverWritesTheAiMode(){
        CaptionSessionIntent before=CaptionSessionIntent.userToggled(a,false);
        CaptionNativeProjection.selection("abcdefghijk","fr","https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=fr",false,true,true,7);
        assertEquals("fr",CaptionNativeProjection.snapshot().target());
        assertFalse(CaptionSessionIntent.load(a).aiEnabled);
        assertEquals(before.revision,CaptionSessionIntent.load(a).revision);
    }
    @Test public void aNewVisitHasNoRememberedNativeLanguage(){
        CaptionNativeProjection.selection("abcdefghijk","en","https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en",false,false,true,7);
        assertTrue(CaptionNativeProjection.snapshot().hasTarget());
        CaptionNativeProjection.beginVideo("lmnopqrstuv");
        assertFalse(CaptionNativeProjection.snapshot().hasTarget());assertEquals("",CaptionNativeProjection.snapshot().target());
        CaptionNativeProjection.beginVideo("abcdefghijk");
        assertFalse(CaptionNativeProjection.snapshot().hasTarget());
    }
    @Test public void repeatedIdenticalNativeSelectionsKeepTheSameIdentity(){
        String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";
        CaptionNativeProjection.selection("abcdefghijk","zh-Hans",url,false,true,false,7);
        long revision=CaptionNativeProjection.snapshot().revision;
        CaptionNativeProjection.selection("abcdefghijk","zh-Hans",url,false,true,true,8);
        assertEquals(revision,CaptionNativeProjection.snapshot().revision);
    }
}
