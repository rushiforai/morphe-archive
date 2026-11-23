package nl.johninnl.deezer.auto;
import static org.junit.Assert.*;
import org.junit.Test;
public class PlaybackLeaseTest {
 @Test public void closingSurfaceRetainsRealOngoingPlaybackWithoutAnIdleLeak(){
  for(int state:new int[]{3,4,5,6,8,9,10,11})assertTrue(PlaybackLease.retain(state,false,-1,-1));
  for(int state:new int[]{0,1,2,7})assertFalse(PlaybackLease.retain(state,false,-1,-1));
  assertTrue(PlaybackLease.retain(2,false,1,-1));assertFalse(PlaybackLease.retain(2,false,0,-1));
  assertTrue(PlaybackLease.retain(0,true,-1,-1));assertFalse(PlaybackLease.retain(7,false,300000,15000));
 }
 @Test public void startingTrackRetainsConnectionBeforeNativeStateChanges(){
  for(int state:new int[]{0,1,2}){
   assertTrue(PlaybackLease.retain(state,false,-1,15000));
   assertFalse(PlaybackLease.retain(state,false,-1,0));
  }
  assertFalse(PlaybackLease.retain(1,false,300000,0));
  assertFalse(PlaybackLease.retain(0,false,300000,0));
 }
}
