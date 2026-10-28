package e.e.a;

/** One live presentation. Closing invalidates every queued animation callback. */
final class MiniState225 {
 static final int MINI=0,DRAG=1,SETTLING=2,RESTORING=3,CLOSED=4;
 int phase=MINI,generation;float fraction;
 boolean live(){return phase!=CLOSED;}
 int cancel(){generation++;if(live()){phase=MINI;fraction=0;}return generation;}
 boolean drag(float distance,float travel){if(!live()||phase==RESTORING)return false;generation++;phase=DRAG;fraction=Math.max(0,Math.min(1,distance/Math.max(1,travel)));return true;}
 boolean expand(float velocity){return fraction>=.35f||velocity< -900;}
 int settle(boolean expand){if(!live())return -1;phase=expand?RESTORING:SETTLING;return ++generation;}
 boolean current(int token){return live()&&generation==token;}
 void close(){generation++;phase=CLOSED;fraction=0;}
}
