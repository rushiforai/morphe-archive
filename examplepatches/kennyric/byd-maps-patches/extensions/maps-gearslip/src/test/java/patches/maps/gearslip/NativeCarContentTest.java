package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.app.Activity;
import android.content.Context;
import java.lang.ref.WeakReference;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk=32)
public final class NativeCarContentTest {
    private final Object first=new Object();
    private Context context;
    private NativeCarContent content;

    public static final class Recent {
        final String title;int clicks;
        Recent(String title){this.title=title;}
        public String h(){return title;}public String i(){return "5 min";}public String g(){return "2 km";}public void j(){clicks++;}
    }
    public static final class Recents {
        final List<Recent> values;
        Recents(Recent... values){this.values=java.util.Arrays.asList(values);}
        public List<Recent> d(){return values;}
    }

    @Before public void setup(){
        context=Robolectric.buildActivity(Activity.class).setup().get();
        LocalCarUiSession.attach(first,intent->{},(text,duration)->{});content=new NativeCarContent(first,context,()->{});
    }
    @After public void cleanup(){content.close(first);LocalCarUiSession.detach(first);}
    private void recents(Recents value)throws Exception{
        java.lang.reflect.Field field=NativeCarContent.class.getDeclaredField("recents");field.setAccessible(true);
        field.set(content,new WeakReference<Object>(value));
    }

    @Test public void recentsReaderExportsTheWholeLogicalListAndOriginalCallback()throws Exception{
        Recent[] values=new Recent[80];for(int i=0;i<80;i++)values[i]=new Recent("Place "+i);
        List<NativeCarContent.Row> rows=NativeCarContent.readRecents(new Recents(values));assertEquals(80,rows.size());
        assertEquals("Place 79",rows.get(79).title);assertEquals(java.util.Arrays.asList("5 min","2 km"),rows.get(79).texts);
        rows.get(79).action.run();assertEquals(1,values[79].clicks);
    }
    /** Regression: with Maps' own UI there is no control exporter, and a host search row still runs. */
    @Test public void aHostSearchRowRunsWithoutTheControlExporter()throws Exception{
        Recents recents=new Recents(new Recent("Destination"));recents(recents);
        for(int i=0;i<2;i++){
            NativeCarContent.Page page=content.read("");
            assertNotNull(page);assertEquals(NativeCarContent.Kind.RECENTS,page.kind);
            content.invoke(page.rows.get(0).action,"");
        }
        assertEquals(2,recents.values.get(0).clicks);
    }
    @Test public void aRemovedNativeRowRevokesTheOldHostClick()throws Exception{
        Recent old=new Recent("Old"),next=new Recent("Next");
        recents(new Recents(old));NativeCarContent.Action stale=content.read("").rows.get(0).action;
        recents(new Recents(next));
        assertThrows(SecurityException.class,()->content.invoke(stale,""));assertEquals(0,old.clicks);
        content.invoke(content.read("").rows.get(0).action,"");assertEquals(1,next.clicks);
    }
    @Test public void aTypedQueryReadsSearchResultsNeverRecents()throws Exception{
        Recent recent=new Recent("Destination");recents(new Recents(recent));
        NativeCarContent.Page page=content.read("Dam");
        assertEquals(NativeCarContent.Kind.SEARCH,page.kind);assertEquals("Dam",page.title);assertTrue("No search model yet",page.rows.isEmpty());
        NativeCarContent.Action recentAction=content.read("").rows.get(0).action;
        assertThrows("A recents row cannot run under a typed query",SecurityException.class,()->content.invoke(recentAction,"Dam"));
        assertEquals(0,recent.clicks);
    }
    @Test public void withoutTheHostKeyboardThereIsNoHostContent()throws Exception{
        recents(new Recents(new Recent("Destination")));
        assertNull(content.read(null));
        NativeCarContent.Action action=content.read("").rows.get(0).action;
        assertThrows(SecurityException.class,()->content.invoke(action,null));
        content.close(first);assertNull("A closed reader offers nothing",content.read(""));
    }
    @Test public void aDisabledNativeRowNeverRuns()throws Exception{
        Recent recent=new Recent("Destination");
        NativeCarContent.Action disabled=new NativeCarContent.Action(recent,"Destination","j",-1,false);
        assertThrows(SecurityException.class,disabled::run);assertEquals(0,recent.clicks);
    }
}
