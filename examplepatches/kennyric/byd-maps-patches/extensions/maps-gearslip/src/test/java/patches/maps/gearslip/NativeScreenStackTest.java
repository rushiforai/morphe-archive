package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.os.Bundle;
import android.os.Parcel;
import androidx.car.app.model.TemplateWrapper;
import androidx.car.app.serialization.Bundleable;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32)
public final class NativeScreenStackTest {
    private static TemplateWrapper decode(Bundle value)throws Exception{
        Parcel wire=Parcel.obtain();try{wire.writeBundle(value);wire.setDataPosition(0);return (TemplateWrapper)Bundleable.CREATOR.createFromParcel(wire).get();}finally{wire.recycle();}
    }
    @Test public void theKeyboardSitsOnMapsOwnScreenAndBackReturnsToIt()throws Exception{
        NativeScreenStack stack=new NativeScreenStack();Bundle map=CarProtocol.mapTemplate(new android.os.Binder());stack.apply(map);
        assertEquals(1,decode(map).getTemplateInfosForScreenStack().size());
        Bundle input=CarProtocol.searchTemplate("","Search",new android.os.Binder());stack.apply(input);
        assertEquals(2,decode(input).getTemplateInfosForScreenStack().size());
        assertEquals("morphe-maps-input",decode(input).getTemplateInfosForScreenStack().get(0).getTemplateId());
        assertEquals("morphe-maps-native",decode(input).getTemplateInfosForScreenStack().get(1).getTemplateId());
        stack.apply(map);assertEquals(1,decode(map).getTemplateInfosForScreenStack().size());
    }
    @Test public void repeatedTemplatesDoNotGrowTheStack()throws Exception{
        NativeScreenStack stack=new NativeScreenStack();Bundle map=CarProtocol.mapTemplate(new android.os.Binder());stack.apply(map);stack.apply(map);
        assertEquals(1,decode(map).getTemplateInfosForScreenStack().size());
        Bundle input=CarProtocol.searchTemplate("","Search",new android.os.Binder());stack.apply(input);stack.apply(input);assertEquals(2,decode(input).getTemplateInfosForScreenStack().size());
        stack.apply(map);assertEquals(1,decode(map).getTemplateInfosForScreenStack().size());
    }
    @Test public void taskClassificationMatchesTheNormalSdkClientInsteadOfStackDepth()throws Exception{
        NativeScreenStack stack=new NativeScreenStack();
        for(Bundle value:new Bundle[]{CarProtocol.mapTemplate(new android.os.Binder()),CarProtocol.searchTemplate("","Search",new android.os.Binder()),CarProtocol.mapTemplate(new android.os.Binder())}){
            stack.apply(value);TemplateWrapper actual=decode(value),normal=TemplateWrapper.wrap(actual.getTemplate());
            assertEquals("Task depth is a host classification, not the app screen count",normal.getCurrentTaskStep(),actual.getCurrentTaskStep());
            assertEquals("Leave refresh classification with the host",normal.isRefresh(),actual.isRefresh());
        }
    }
}
