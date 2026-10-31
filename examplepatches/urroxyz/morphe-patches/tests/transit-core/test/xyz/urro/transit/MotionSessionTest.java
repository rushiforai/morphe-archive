package xyz.urro.transit;
public final class MotionSessionTest {
 static void eq(Object a,Object b){if(!a.equals(b))throw new AssertionError(a+" != "+b);}
 public static void main(String[] args){
  MotionSession s=new MotionSession(); long g=s.desire("trip",true);
  eq(s.next(g),MotionSession.Action.NONE); // unknown isn't OFF
  s.observe(MotionSession.State.ON,1);eq(s.next(g),MotionSession.Action.NONE);
  s.desire("trip",false);eq(s.next(s.generation()),MotionSession.Action.NONE); // manual remains
  s.observe(MotionSession.State.OFF,2);g=s.desire("new",true);
  eq(s.next(g),MotionSession.Action.START);eq(s.dispatched(g,MotionSession.Action.START,3),true);
  s.observe(MotionSession.State.ON,3);eq(s.ownsActivation(),false); // same-ms can't prove causation
  s.observe(MotionSession.State.ON,4);eq(s.ownsActivation(),true);
  eq(s.matchesOwner("old-trip"),false);eq(s.matchesOwner("new"),true);
  long old=g;g=s.desire("new",false);eq(s.next(old),MotionSession.Action.NONE);
  eq(s.next(g),MotionSession.Action.STOP);
  g=s.desire("newer",true);eq(s.dispatched(g-1,MotionSession.Action.STOP,5),false);
  s.observe(MotionSession.State.ON,6);eq(s.ownsActivation(),false); // independent start loses attribution
  s.desire("newer",false);eq(s.next(s.generation()),MotionSession.Action.NONE);
  MotionSession restart=new MotionSession();restart.observe(MotionSession.State.ON,8);
  long r=restart.desire("restored",false);eq(restart.next(r),MotionSession.Action.NONE);
  // Cancel before START confirmation: late ON must never create new ownership.
  s.observe(MotionSession.State.OFF,9);g=s.desire("cancel",true);
  eq(s.dispatched(g,MotionSession.Action.START,10),true);s.desire("cancel",false);
  s.observe(MotionSession.State.ON,11);eq(s.ownsActivation(),false);
  s.uncertain(s.generation());eq(s.observed(),MotionSession.State.UNKNOWN);
  // An unconfirmed dispatch that times out cannot authorize STOP merely because a later query is ON.
  MotionSession unconfirmed=new MotionSession();unconfirmed.observe(MotionSession.State.OFF,1);
  long u=unconfirmed.desire("ride",true);eq(unconfirmed.dispatched(u,MotionSession.Action.START,2),true);
  unconfirmed.uncertain(u);unconfirmed.observe(MotionSession.State.ON,30000);
  u=unconfirmed.desire("ride",false);eq(unconfirmed.ownsActivation(),false);eq(unconfirmed.next(u),MotionSession.Action.NONE);
  MotionSession reasons=new MotionSession();long token=reasons.desire("reason",true);
  eq(reasons.decision(token),"external_state_unknown");
  reasons.observe(MotionSession.State.ON,1);eq(reasons.decision(token),"already_on_unowned");
  reasons.observe(MotionSession.State.OFF,2);eq(reasons.decision(token),"dispatch_start");
  reasons.dispatched(token,MotionSession.Action.START,3);eq(reasons.decision(token),"pending_start");
  reasons.observe(MotionSession.State.ON,4);eq(reasons.decision(token),"already_owned_on");
  long stop=reasons.desire("reason",false);eq(reasons.decision(token),"stale_generation");eq(reasons.decision(stop),"dispatch_stop");
  reasons.dispatched(stop,MotionSession.Action.STOP,5);eq(reasons.decision(stop),"pending_stop");
  reasons.observe(MotionSession.State.OFF,6);eq(reasons.decision(stop),"stop_unowned");
  System.out.println("MotionSession PASS: stale generations, manual ownership, restart, cancellation, timestamps");
 }
}
