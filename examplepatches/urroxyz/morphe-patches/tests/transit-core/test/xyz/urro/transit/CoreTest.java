package xyz.urro.transit;
public class CoreTest {
 static void eq(Object a,Object b) { if(!a.equals(b))throw new AssertionError(a+" != "+b); }
 public static void main(String[] args) {
  eq(ReminderFormatter.STOPS,"Get bike in {N} stop[s]");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,2,"Retrieve bike in {N} stop[s].","old"),"Get bike in 2 stops");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.NEXT,-1,"Retrieve bike SOON. You're next!","old"),"Get bike SOON. You're next");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.CURRENT,-1,"Retrieve bike NOW. It's your stop!","old"),"Get bike NOW. It's your stop");
  eq(ReminderFormatter.NEXT,"Get bike SOON. You're next");
  eq(ReminderFormatter.CURRENT,"Get bike NOW. It's your stop");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,2,"My custom reminder!","old"),"My custom reminder!");
  for(int n:new int[]{0,1,2,4})eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,n,null,"old"),"Get bike in "+n+" stop"+(n==1?"":"s"));
  eq(ReminderFormatter.render(false,ReminderFormatter.Event.STOPS,2,null,"old"),"old");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,2,"{N} [away] 🚲 {BAD}","old"),"2 away 🚲 {BAD}");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,1,"{N} [away]","old"),"1 ");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,2,"[bad","old"),"[bad");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.NEXT,2,"{N} [x]","old"),"{N} [x]");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.NEXT,-1,null,"old"),ReminderFormatter.NEXT);
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.CURRENT,-1,null,"old"),ReminderFormatter.CURRENT);
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,2,"x".repeat(501),"old"),"Get bike in 2 stops");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.OTHER,2,null,"old"),"old");
  eq(ReminderFormatter.render(true,ReminderFormatter.Event.STOPS,-1,null,"old"),"old");
  final int[] counts={0,0};
  BoardingDetector d=new BoardingDetector(new BoardingDetector.Control(){public boolean acquire(String s){counts[0]++;return true;}public void release(String s){counts[1]++;}});
  d.update(0,"a","bus1",true,true,false,true);eq(counts[0],0);
  d.update(1000,"a","bus1",true,true,true,true);
  d.update(21000,"a","bus1",true,true,true,true);eq(counts[0],0);
  d.update(45000,"a","bus1",true,true,true,true);eq(counts[0],0);
  d.update(46000,"a","bus1",true,true,true,true);eq(counts[0],1);
  d.update(47000,"a","bus1",true,true,true,true);eq(counts[0],1);
  d.update(48000,"a","bus1",true,true,false,true);eq(counts[1],1);
  d.update(49000,"a","bus2",true,true,true,true);
  d.update(50000,"b","bus2",true,true,true,true);
  d.update(94000,"b","bus2",true,true,true,true);eq(counts[0],1);
  d.update(95000,"b","bus2",true,true,true,true);eq(counts[0],2);
  d.update(96000,"b","bus2",true,true,true,false);eq(counts[1],2);
  d.close();eq(counts[1],2);
  // Broken confidence resets the whole uninterrupted interval.
  d.update(100000,"c","bus",true,true,true,true);
  d.update(120000,"c","bus",true,true,false,true);
  d.update(130000,"c","bus",true,true,true,true);
  d.update(174999,"c","bus",true,true,true,true);eq(counts[0],2);
  d.update(175000,"c","bus",true,true,true,true);eq(counts[0],3);
  d.update(175001,"c","bus",false,true,true,true);eq(counts[1],3);
  // Train and walking legs cannot activate.
  d.update(180000,"d","train",true,false,true,true);
  d.update(280000,"d","train",true,false,true,true);eq(counts[0],3);
  // Manual-active control refuses acquisition; no Transit-owned stop follows.
  final int[] releases={0};
  BoardingDetector manual = new BoardingDetector(new BoardingDetector.Control(){public boolean acquire(String k){return false;}public void release(String k){releases[0]++;}});
  manual.update(0,"e","bus",true,true,true,true);
  manual.update(45000,"e","bus",true,true,true,true);
  manual.close();eq(releases[0],0);
  // New process starts with no inherited confirmed/owned state.
  eq(manual.state(),BoardingDetector.State.GO_INACTIVE);
  System.out.println("PASS: formatter and threshold/session/ownership core checks; Android integration untested");
 }
}
