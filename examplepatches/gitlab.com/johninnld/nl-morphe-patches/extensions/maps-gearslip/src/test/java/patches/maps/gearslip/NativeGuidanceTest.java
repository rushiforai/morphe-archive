package patches.maps.gearslip;

import static org.junit.Assert.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import org.junit.Test;

public final class NativeGuidanceTest {
    public interface Marker{}
    public interface Listener extends Marker{void se(State value);}
    public enum Mode{OFF,GUIDING,CRUISING}
    public enum Maneuver{TURN,MERGE}
    public enum Side{SIDE_LEFT,SIDE_RIGHT,SIDE_UNSPECIFIED}
    public enum Turn{TURN_NORMAL,TURN_STRAIGHT}
    public enum DrivingSide{NONE,LEFT,RIGHT}
    public enum Shape{STRAIGHT,NORMAL}
    public enum Units{KILOMETERS,MILES,MILES_YARDS,REGIONAL}
    public static final class Path{public Units N=Units.KILOMETERS;}
    public static final class DistanceUtil{
        public Units preference=Units.MILES_YARDS;
        public Units c(Units route){return preference==Units.REGIONAL?route:preference;}
    }
    public static final class Direction{public Shape a=Shape.NORMAL;public boolean b=true;}
    public static final class Lane{public List<Direction> a=new ArrayList<>();public int b=1;}
    public static final class Step{
        public CharSequence q="Turn right",t="Secondary cue";
        public Maneuver c=Maneuver.TURN;public Side d=Side.SIDE_RIGHT;public Turn e=Turn.TURN_NORMAL;
        public DrivingSide I=DrivingSide.RIGHT;public int f=-1,g=-1;public Step S;
        public List<Lane> F=new ArrayList<>();
    }
    public static final class Progress{
        public Path b=new Path();
        public Step d=new Step();public int i=120,j=15,m=55000,n=12000;
        public int c(){return 2220;}public int d(){return 600;}
    }
    public static final class Model{public Progress value=new Progress();public Progress e(){return value;}}
    public static final class Route{public Model a=new Model();}
    public static final class State{public Mode c;public Route b=new Route();State(Mode value){c=value;}}
    public static final class Source{
        public volatile State b=new State(Mode.GUIDING);Listener listener;Executor executor;int removals;
        public void a(Marker value,Executor executor){listener=(Listener)value;this.executor=executor;}
        public void c(Marker value){assertSame(listener,value);removals++;}
        void emit(Mode mode){b=new State(mode);executor.execute(()->listener.se(b));}
    }
    public static final class Provider{
        final Source source=new Source();
        public Object a(){return source;}
    }
    public static final class Component{public Provider bR=new Provider();}
    public static class ApplicationBase{
        final Component component=new Component();
        public Object rS(){return component;}
        protected Object e(){throw new AssertionError("Must not create another component manager");}
    }
    public static final class Application extends ApplicationBase{}
    @Test public void acquiresExistingGuidanceThroughTheInheritedCachedComponent()throws Exception{
        Application app=new Application();
        assertSame(app.component.bR.source,NativeGuidance.acquire(app));
        assertSame(NativeGuidance.acquire(app),NativeGuidance.acquire(app));
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
    @Test public void refreshReportsAuthoritativeCessationEvenIfTheListenerWasMissed()throws Exception{
        Source source=new Source();List<NativeGuidance.Snapshot> values=new ArrayList<>();
        NativeGuidance guidance=new NativeGuidance(source,Listener.class,Marker.class,Runnable::run,values::add,error->{throw new AssertionError(error);});
        assertEquals(1,values.size());
        source.b=new State(Mode.CRUISING); // Listener never delivered this transition.
        guidance.refresh();assertEquals(2,values.size());assertFalse("A stale listener must not hide native cessation",values.get(1).guiding);
        source.b=new State(Mode.GUIDING);
        guidance.refresh();assertEquals("Refresh must never announce a navigation start",2,values.size());
        guidance.close();
    }
    @Test public void guidingWithoutRouteDataRemainsLoadingRatherThanInventingProgress()throws Exception{
        State state=new State(Mode.GUIDING);state.b=null;
        NativeGuidance.Snapshot value=NativeGuidance.snapshot(state);assertTrue(value.guiding);assertNull(value.cue);
    }
    @Test public void stepAndRouteEstimatesRemainSeparateAndNativeNextStepIsPreserved()throws Exception{
        State state=new State(Mode.GUIDING);
        Step next=new Step();next.c=Maneuver.MERGE;next.q="Then merge";state.b.a.value.d.S=next;
        Lane lane=new Lane();lane.a.add(new Direction());state.b.a.value.d.F.add(lane);
        NativeGuidance.Snapshot snapshot=NativeGuidance.snapshot(state);
        assertEquals(120,snapshot.meters);assertEquals(15,snapshot.seconds);
        assertEquals(55000,snapshot.routeMeters);assertEquals(2220,snapshot.routeSeconds);
        assertEquals(12000,snapshot.destinationMeters);assertEquals(600,snapshot.destinationSeconds);
        assertEquals("KILOMETERS",snapshot.distanceUnits);
        assertEquals("TURN",snapshot.current.maneuver);assertEquals("SIDE_RIGHT",snapshot.current.side);
        assertEquals("TURN_NORMAL",snapshot.current.turn);assertEquals("RIGHT",snapshot.current.drivingSide);
        assertEquals(-1,snapshot.current.roundaboutExit);assertEquals(-1,snapshot.current.roundaboutAngle);
        assertEquals("Then merge",snapshot.next.cue);assertEquals("MERGE",snapshot.next.maneuver);
        assertTrue(snapshot.current.lanes.get(0).get(0).right);assertTrue(snapshot.current.lanes.get(0).get(0).recommended);
        lane.a.clear();assertEquals(1,snapshot.current.lanes.get(0).size());
    }
    @Test public void distanceUnitsComeFromTheNativePreferencePolicyRatherThanRoadSpeedUnits()throws Exception{
        State state=new State(Mode.GUIDING);DistanceUtil units=new DistanceUtil();
        assertEquals("MILES_YARDS",NativeGuidance.snapshot(state,units).distanceUnits);
        units.preference=Units.REGIONAL;assertEquals("KILOMETERS",NativeGuidance.snapshot(state,units).distanceUnits);
    }
}
