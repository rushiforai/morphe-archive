package xyz.urro.transit;
import java.util.*;

/** Exact getter/enum shapes captured from the native TripDetails callback. */
public final class GoVehicleStateTest {
 public enum ItemType { TransitLeg, WalkOutsideLeg, SomethingNew }
 public enum Path { Start, Riding, End, SomethingNew }
 public static final class Header {final Path p;Header(Path p){this.p=p;}public Path getPathType(){return p;}}
 public static final class Segment {final Header h;Segment(Path p){h=new Header(p);}public Header getHeaderSection(){return h;}}
 public static final class Leg {
  final ItemType type;final List<Segment> segments;
  Leg(ItemType t,Path p){type=t;segments=List.of(new Segment(p));}
  public ItemType getItemType(){return type;}public List<Segment> getSegments(){return segments;}
 }
 public static final class Trip {
  final boolean active;final List<Leg> items;
  Trip(boolean a,Leg... l){active=a;items=Arrays.asList(l);}
  public Object getGoSummaryCard(){return active?this:null;}public List<Leg> getItems(){return items;}
  public Object getMainInstruction(){throw new AssertionError("Do not inspect a reminder to detect boarding");}
 }
 public static final class Vehicle {final boolean member;Vehicle(boolean m){member=m;}public boolean getContainsCurrentUser(){return member;}}
 private static int checks;
 static void eq(Object expected,Object actual){checks++;if(!Objects.equals(expected,actual))throw new AssertionError("expected "+expected+" got "+actual);}
 public static void main(String[] args){
  eq(GoVehicleState.State.UNKNOWN,GoVehicleState.fromTrip(null));
  eq(GoVehicleState.State.UNKNOWN,GoVehicleState.fromTrip(new Object()));
  eq(GoVehicleState.State.INACTIVE,GoVehicleState.fromTrip(new Trip(false)));
  eq(GoVehicleState.State.NOT_ABOARD,GoVehicleState.fromTrip(new Trip(true,new Leg(ItemType.TransitLeg,Path.Start))));
  eq(GoVehicleState.State.ABOARD,GoVehicleState.fromTrip(new Trip(true,new Leg(ItemType.TransitLeg,Path.Riding))));
  // Alerts, translations and Bike mode never enter this API, so none can generate EXIT.
  eq(GoVehicleState.State.ABOARD,GoVehicleState.fromTrip(new Trip(true,new Leg(ItemType.WalkOutsideLeg,Path.End),new Leg(ItemType.TransitLeg,Path.Riding))));
  eq(GoVehicleState.State.NOT_ABOARD,GoVehicleState.fromTrip(new Trip(true,new Leg(ItemType.WalkOutsideLeg,Path.End))));
  eq(GoVehicleState.State.UNKNOWN,GoVehicleState.fromTrip(new Trip(true)));
  eq(GoVehicleState.State.UNKNOWN,GoVehicleState.fromTrip(new Trip(true,new Leg(ItemType.SomethingNew,Path.Start))));
  eq(GoVehicleState.State.UNKNOWN,GoVehicleState.fromTrip(new Trip(true,new Leg(ItemType.TransitLeg,Path.SomethingNew))));
  eq(true,GoVehicleState.vehicleMembership(new Vehicle(true)));
  eq(false,GoVehicleState.vehicleMembership(new Vehicle(false)));
  eq(null,GoVehicleState.vehicleMembership(new Object()));
  System.out.println("PASS GoVehicleStateTest "+checks+" checks");
 }
}
