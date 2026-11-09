package patches.maps.gearslip;

import static org.junit.Assert.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import org.junit.Test;

public final class NativeGuidanceTest {
    public interface Marker{}
    public interface Listener extends Marker{void rW(State value);}
    public enum Mode{OFF,GUIDING,CRUISING}
    public static final class Step{public CharSequence q="Turn right";}
    public static final class Progress{public Step d=new Step();public int i=120,j=15;}
    public static final class Model{public Progress e(){return new Progress();}}
    public static final class Route{public Model a=new Model();}
    public static final class State{public Mode c;public Route b=new Route();State(Mode value){c=value;}}
    public static final class Source{
        public volatile State b=new State(Mode.GUIDING);Listener listener;Executor executor;int removals;
        public void a(Marker value,Executor executor){listener=(Listener)value;this.executor=executor;}
        public void c(Marker value){assertSame(listener,value);removals++;}
        void emit(Mode mode){b=new State(mode);executor.execute(()->listener.rW(b));}
    }
    @Test public void registersSeedsAlreadyGuidingAndRemovesTheExactListener()throws Exception{
        Source source=new Source();List<NativeGuidance.Snapshot> values=new ArrayList<>();
        NativeGuidance guidance=new NativeGuidance(source,Listener.class,Marker.class,Runnable::run,values::add,error->{throw new AssertionError(error);});
        assertEquals(1,values.size());assertTrue(values.get(0).guiding);assertEquals("Turn right",values.get(0).cue);
        assertEquals(120,values.get(0).meters);assertEquals(15,values.get(0).seconds);
        source.emit(Mode.CRUISING);assertFalse(values.get(1).guiding);
        source.emit(Mode.OFF);assertFalse(values.get(2).guiding);
        guidance.close();guidance.close();source.emit(Mode.GUIDING);
        assertEquals(1,source.removals);assertEquals(3,values.size());
    }
    @Test public void guidingWithoutRouteDataRemainsLoadingRatherThanInventingProgress()throws Exception{
        State state=new State(Mode.GUIDING);state.b=null;
        NativeGuidance.Snapshot value=NativeGuidance.snapshot(state);assertTrue(value.guiding);assertNull(value.cue);
    }
}
