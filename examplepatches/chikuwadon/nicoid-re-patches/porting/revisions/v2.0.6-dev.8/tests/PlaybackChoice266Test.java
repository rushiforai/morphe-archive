package e.e.a;

/** Regression for video-menu explicit action precedence, without Android UI stubs. */
public final class PlaybackChoice266Test {
 private static void eq(int expected,int actual,String msg){
  if(expected!=actual)throw new AssertionError(msg+" expected "+expected+" actual "+actual);
 }
 public static void main(String[] args){
  PlaybackChoice266.cancel();
  eq(PlaybackChoice266.NONE,PlaybackChoice266.consume(100),"No menu action");
  // The tap preference may be full, but an explicit normal menu action wins.
  PlaybackChoice266.armNormal(100);
  eq(PlaybackChoice266.NORMAL,PlaybackChoice266.consume(105),
     "Video menu normal must not use the tap fullscreen setting");
  eq(PlaybackChoice266.NONE,PlaybackChoice266.consume(106),"Single use");
  PlaybackChoice266.armFullscreen(1000);
  eq(PlaybackChoice266.FULLSCREEN,PlaybackChoice266.consume(1001),
     "Explicit fullscreen menu");
  PlaybackChoice266.armFullscreen(2000);
  PlaybackChoice266.armNormal(2001);
  eq(PlaybackChoice266.NORMAL,PlaybackChoice266.consume(2002),
     "Normal action must override previous fullscreen");
  PlaybackChoice266.armNormal(3000);
  PlaybackChoice266.armFullscreen(3001);
  eq(PlaybackChoice266.FULLSCREEN,PlaybackChoice266.consume(3002),
     "Fullscreen action must override previous normal");
  PlaybackChoice266.armNormal(1000);
  eq(PlaybackChoice266.NONE,PlaybackChoice266.consume(14000),"Expired menu choice");
  PlaybackChoice266.armFullscreen(20000);
  PlaybackChoice266.cancel();
  eq(PlaybackChoice266.NONE,PlaybackChoice266.consume(20002),"Cancel failed launch");
  PlaybackChoice266.armNormal(30000);
  eq(PlaybackChoice266.NONE,PlaybackChoice266.consume(1),"Reboot/unexpected clock");
  System.out.println("PASS: tap preference isolated from explicit normal/fullscreen menu actions");
 }
}
