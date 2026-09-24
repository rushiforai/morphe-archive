package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import java.lang.reflect.Field;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Default restoration uses the applied-track callback, never the manual-menu callback.
 * Real source sessions/render ownership, fake source transport, translation I/O forbidden. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={SourceMode124Test.Flags.class,SourceMode124Test.Keys.class,
        AutomaticSource125Test.Access.class,SourceMode124Test.NoPaidApi.class})
public class AutomaticSource125Test {
    enum Origin { DEFAULT, PREFERRED_TRACK }
    static class Manager { final String modelOwner,track; String current; int refreshes;
        Manager(String video){modelOwner=video;track="https://www.youtube.com/api/timedtext?v="+video+"&lang=en";}
        void apply(String value,Object origin,int reason){
            current=value;
            // Mirror the patched dispatcher: ownership comes from the manager's caption model,
            // not the unrelated playback identifier on the native event.
            NativeCaptionBridge.onNativeAppliedEvent(this,current,value,origin,reason,NativeCaptionBridge.nativeModelVideo(this));
        }
    }
    @Implements(NativeCaptionBridge.class) public static class Access {
        @Implementation public static String language(Object t){return "en";}
        @Implementation public static String vss(Object t){return ".en";}
        @Implementation public static String url(Object t){return (String)t;}
        @Implementation public static String nativeModelVideo(Object m){return ((Manager)m).modelOwner;}
        @Implementation public static List<?> nativeTracks(Object m){return Collections.singletonList(((Manager)m).track);}
        @Implementation public static void selectNative(Object m,Object t,Object o,int reason){Manager manager=(Manager)m;manager.refreshes++;manager.apply((String)t,o,reason);}
    }
    @Test public void twentyAutomaticVideoSelectionsToggleRealSourceSessionsBothWays()throws Exception{
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();DeepSeekCaptionHook.setMainActivity(a);CaptionAddonSupport.initialize(a);
        SourceMode124Test.paidCalls.set(0);SourceCaptionCache.clear(a);
        Field transport=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");transport.setAccessible(true);Object old=transport.get(null);
        SourceMode124Test.Engine engine=new SourceMode124Test.Engine();transport.set(null,engine);
        try {
            for(int i=1;i<=20;i++){
                String video=String.format(Locale.ROOT,"%011d",i);Manager manager=new Manager(video);
                // Alternate AI already ON at transition and native-only at transition.
                DeepSeekConfig.saveEnabled(a,i%2==0);
                PageCaptionController.onVideoId(video);
                manager.apply(manager.track,Origin.DEFAULT,2);
                assertTrue(CaptionChoice.isOn());assertFalse(CaptionChoice.translates());
                assertTrue(CaptionQuickToggle.setEngine(a,true));SourceMode124Test.ready(video);
                assertTrue(NativeCaptionBridge.suppressNativeDraw());
                assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
                assertTrue(CaptionQuickToggle.setEngine(a,false));
                assertFalse(DynamicCaptionController.isVisibleActive());assertFalse(NativeCaptionBridge.suppressNativeDraw());
                assertEquals(manager.track,manager.current);assertEquals(6,manager.refreshes);
                assertTrue(CaptionQuickToggle.setEngine(a,true));SourceMode124Test.ready(video);
                assertTrue(DynamicCaptionController.isVisibleActive());
            }
            assertEquals(0,SourceMode124Test.paidCalls.get());
        } finally {ContextualUnitCaptionController.deactivateForCoreSwitch();transport.set(null,old);a.finish();}
    }
}
