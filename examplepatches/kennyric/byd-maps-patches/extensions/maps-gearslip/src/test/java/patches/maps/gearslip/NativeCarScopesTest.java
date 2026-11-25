package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.content.Context;
import android.content.ContextWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32)
public final class NativeCarScopesTest {
    private static final class Emission {
        final Context context;final Object producer;
        Emission(Context context,Object producer){this.context=context;this.producer=producer;}
    }
    @Test public void aFreshRetiredEmissionKeepsItsOriginalWindowOwner(){
        Object first=new Object(),second=new Object(),oldProducer=new Object(),newProducer=new Object();
        Context app=RuntimeEnvironment.getApplication(),oldContext=new ContextWrapper(app),newContext=new ContextWrapper(app);
        NativeCarScopes.window(first,oldContext);NativeCarScopes.producer(oldProducer,first);
        NativeCarScopes.window(second,newContext);NativeCarScopes.producer(newProducer,second);
        // Create the value only after replacement. Arrival time cannot change its lifecycle.
        Emission late=new Emission(oldContext,oldProducer);
        assertSame(first,NativeCarScopes.owner(late.context,late.producer));
        assertSame(second,NativeCarScopes.owner(newContext,newProducer));
        assertNull(NativeCarScopes.owner(app,new Object()));
    }
    @Test public void sharedProcessContextsAndProducersAreNotTreatedAsWindows(){
        Object first=new Object(),second=new Object(),sharedProducer=new Object();Context app=RuntimeEnvironment.getApplication();
        Context shared=new ContextWrapper(app),oldWindow=new ContextWrapper(shared),newWindow=new ContextWrapper(shared);
        NativeCarScopes.window(first,oldWindow);NativeCarScopes.producer(sharedProducer,first);
        NativeCarScopes.window(second,newWindow);NativeCarScopes.producer(sharedProducer,second);
        assertNull(NativeCarScopes.contextOwner(shared));assertNull(NativeCarScopes.producerOwner(sharedProducer));
        assertSame(first,NativeCarScopes.owner(oldWindow,sharedProducer));assertSame(second,NativeCarScopes.owner(newWindow,sharedProducer));
        assertNull(NativeCarScopes.owner(app,sharedProducer));
    }
}
