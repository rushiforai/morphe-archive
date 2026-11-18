package nl.johninnl.navigation.alerts;

import static org.junit.Assert.*;
import android.os.Bundle;
import android.os.SystemClock;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Provider alert sounds are plain asset names read at runtime from the provider app. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=32,manifest=Config.NONE)
public class ProviderSoundTest {
    @After public void after(){ProviderSound.resetForTest(null);}

    private WarningEvent announce(String sound){
        long now=SystemClock.elapsedRealtime();Bundle b=new Bundle();b.putInt("protocol_version",1);
        b.putString("provider_session","123e4567-e89b-12d3-a456-426614174000");b.putLong("sequence",1);b.putString("warning_id","SpeedCam:1");
        b.putLong("revision",1);b.putLong("announcement_index",1);b.putString("operation","ANNOUNCE");b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);
        b.putString("phase","enter");b.putString("native_type","SPEED_CAM");b.putString("category","speed_control");b.putInt("priority",1);
        b.putString("message","Flitspaal");b.putString("language_tag","nl");b.putString("message_origin","native_text");b.putString("relevance","point_ahead");b.putString("relationship","unknown");
        b.putLong("announce_until_elapsed_ms",now+5000);b.putLong("state_until_elapsed_ms",now+30000);
        if(sound!=null)b.putString("native_sound",sound);
        return WarningCodec.decode(b,now);
    }

    @Test public void onlyPlainKnownAudioAssetNamesAreAccepted(){
        for(String good:new String[]{"flitser.m4a","flitser_hard.m4a","subtle_beep.mp3","hoppa_olav_mol.wav"})assertTrue(good,ProviderSound.validName(good));
        for(String bad:new String[]{null,"","../flitser.m4a","audio/flitser.m4a","Flitser.m4a","flitser.ogg","flitser","a.m4a/b"})assertFalse(String.valueOf(bad),ProviderSound.validName(bad));
    }

    @Test public void eventsCarryTheirSoundAndRejectUnsafeNames(){
        assertEquals("flitser.m4a",ProviderSound.name(announce("flitser.m4a")));
        assertNull(ProviderSound.name(announce(null)));
        try{announce("../../data/x.m4a");fail("Unsafe sound names must not cross the wire");}catch(IllegalArgumentException expected){/* Rejected. */}
    }

    @Test public void aMissingProviderAppYieldsNoSoundAndIsNotRetriedAtOnce(){
        int[] decodes=new int[1];
        ProviderSound.resetForTest(bytes->{decodes[0]++;return null;});
        assertNull(ProviderSound.load(RuntimeEnvironment.getApplication(),"nl.example.absent","flitser.m4a"));
        assertNull(ProviderSound.load(RuntimeEnvironment.getApplication(),"nl.example.absent","flitser.m4a"));
        assertEquals(0,decodes[0]);
        assertNull(ProviderSound.cached("nl.example.absent","flitser.m4a"));
        assertNull(ProviderSound.load(RuntimeEnvironment.getApplication(),ProviderSound.FLITSMEISTER,"../escape.m4a"));
    }

    @Test public void pcmRejectsMalformedAudio(){
        assertEquals(2,new ProviderSound.Pcm(new short[4],48000,2).frames());
        for(Runnable bad:new Runnable[]{()->new ProviderSound.Pcm(new short[3],48000,2),()->new ProviderSound.Pcm(new short[0],48000,1),()->new ProviderSound.Pcm(new short[4],4000,1)}){
            try{bad.run();fail();}catch(IllegalArgumentException expected){/* Rejected. */}
        }
    }
}
