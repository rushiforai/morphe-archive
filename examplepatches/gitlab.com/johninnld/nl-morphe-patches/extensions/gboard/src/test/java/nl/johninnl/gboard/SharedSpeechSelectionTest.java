package nl.johninnl.gboard;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import java.lang.reflect.Proxy;
import org.junit.Test;
import static org.junit.Assert.*;

public class SharedSpeechSelectionTest {
    private Context context(boolean selected){
        return context(selected, false);
    }
    private Context context(boolean selected, boolean rambler){
        SharedPreferences preferences=(SharedPreferences)Proxy.newProxyInstance(getClass().getClassLoader(),new Class<?>[]{SharedPreferences.class},(proxy,method,args)->{
            if(method.getName().equals("getBoolean"))return "enable_jetson".equals(args[0]) ? rambler : selected;
            if(method.getName().equals("getString"))return args[1];
            return null;
        });
        return new ContextWrapper(null){
            @Override public Context getApplicationContext(){return this;}
            @Override public String getPackageName(){return "keyboard.test";}
            @Override public SharedPreferences getSharedPreferences(String name,int mode){return preferences;}
            @Override public int checkSelfPermission(String permission){return PackageManager.PERMISSION_DENIED;}
        };
    }
    @Test public void selectedLocalSpeechDoesNotFallBackToGoogleWhenPermissionIsRevoked(){ParakeetRecognizer recognizer=ParakeetRecognizer.create(context(true));assertNotNull(recognizer);recognizer.shutdown();}
    @Test public void explicitlyUnselectedLocalSpeechKeepsTheOriginalFactory(){assertNull(ParakeetRecognizer.create(context(false)));}
    @Test public void unarmedRamblerKeepsTheOriginalRecognizerEvenWithSharedSpeechSelected() {
        assertNull(ParakeetRecognizer.createForVoiceRequest(context(true), true));
    }
    @Test public void standardVoiceRequestUsesSharedSpeechWhenSelected() {
        ParakeetRecognizer recognizer = ParakeetRecognizer.createForVoiceRequest(context(true), false);
        assertNotNull(recognizer);
        recognizer.shutdown();
    }
    @Test public void enhancedVoiceYieldsOnlyForSelectedSharedStandardSpeech() {
        assertTrue(ParakeetRecognizer.shouldUseSharedStandard(context(true, false)));
        assertFalse(ParakeetRecognizer.shouldUseSharedStandard(context(true, true)));
        assertFalse(ParakeetRecognizer.shouldUseSharedStandard(context(false, false)));
    }
    @Test public void consolidatedDictationYieldsOnlyToSelectedSharedStandardSpeech() {
        assertFalse(ParakeetRecognizer.allowConsolidatedDictation(context(true, false), true));
        assertTrue(ParakeetRecognizer.allowConsolidatedDictation(context(true, true), true));
        assertTrue(ParakeetRecognizer.allowConsolidatedDictation(context(false, false), true));
        assertFalse(ParakeetRecognizer.allowConsolidatedDictation(context(false, false), false));
    }
}
