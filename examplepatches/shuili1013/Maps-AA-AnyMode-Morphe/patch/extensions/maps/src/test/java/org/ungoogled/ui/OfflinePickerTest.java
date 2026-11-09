package org.ungoogled.ui;

import android.app.Activity;
import android.graphics.RectF;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=35)
public class OfflinePickerTest {
    public static class State { Object value; State(Object v){value=v;} public Object a(){return value;} public void b(Object v){value=v;} }
    public static class Estimate { public long b; public Estimate(boolean ready,long mb){b=mb;} }
    public static class Model { public Activity a; public State d=new State(new Estimate(true,225)); public State h=new State(new RectF()); public Runnable f; }
    public static class Presenter { public int refreshes,downloads; public void h(){refreshes++;} public void j(String name){downloads++;} }
    public static class Download implements Runnable { public Presenter a; Download(Presenter p){a=p;} public void run(){a.j("");} }
    @Test public void stateWritesUseCurrentComposeSetter(){State s=new State(null);Object value=new RectF(1,2,3,4);OfflinePicker.pickerSet(s,value);assertSame(value,s.a());}
    @Test public void estimatesUseCurrentComposeGetter(){Model m=new Model();assertEquals(225,OfflinePicker.pickerEstimateMb(m));Object e=OfflinePicker.pickerInject(m,900);assertNotNull(e);assertEquals(900,OfflinePicker.pickerEstimateMb(m));}
    @Test public void splitQueuesEveryCellAndRestoresWindow(){Model m=new Model();Presenter p=new Presenter();m.f=new Download(p);RectF bounds=new RectF(0,0,100,200);OfflinePicker.pickerSplit(m,2,3,bounds,0,0);m.f.run();assertEquals(6,p.downloads);assertEquals(bounds,m.h.a());OfflinePicker.pickerSplit(m,1,1,bounds,0,0);assertTrue(m.f instanceof Download);}
    @Test public void refreshReachesPresenter(){Model m=new Model();Presenter p=new Presenter();m.f=new Download(p);OfflinePicker.pickerRefresh(m);assertEquals(1,p.refreshes);}
}
