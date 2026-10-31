package xyz.urro.transit;

/** Process-local test inputs. No route, location, native protocol or history is written. */
public final class SimulationState {
 public enum Phase { WAIT_TO_LEAVE, WALK_TO_STOP, WAITING, BOARDING, RIDING, NEXT, CURRENT, ALIGHTED, WALK_TO_DESTINATION, ARRIVED }
 public boolean active;
 public Phase phase=Phase.WAITING;
 public int stops=5;
 public long generation,advanceMs;
 public void start(){active=true;phase=Phase.WAITING;stops=5;advanceMs=0;generation++;}
 public void stop(){active=false;advanceMs=0;generation++;}
 public void phase(Phase p){if(!active)throw new IllegalStateException("Start simulation first");phase=p;}
 public void remaining(int n){if(n<0||n>99)throw new IllegalArgumentException("Use 0–99 stops");stops=n;phase=n==0?Phase.CURRENT:n==1?Phase.NEXT:Phase.RIDING;}
 public boolean onboard(){return active&&(phase==Phase.RIDING||phase==Phase.NEXT||phase==Phase.CURRENT);}
 public String instruction(){switch(phase){case WAIT_TO_LEAVE:return "Wait until it is time to leave";case WALK_TO_STOP:return "Walk to the bus stop";case BOARDING:return "Board the bus";case WALK_TO_DESTINATION:return "Walk to your destination";case WAITING:return "Wait for the bus";case RIDING:return "Get off in "+stops+(stops==1?" stop":" stops");case NEXT:return "Your stop is next!";case CURRENT:return "This is your stop!";case ARRIVED:return "Arrived";default:return "Walk to your destination";}}
}
