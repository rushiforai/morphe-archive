import e.e.a.PlaylistGesturePolicy;
public final class PlaylistGesturePolicyTest {
  static void ok(boolean value){if(!value)throw new AssertionError();}
  public static void main(String[] args){
    ok(PlaylistGesturePolicy.claim(true,true,"righttab",false));
    ok(PlaylistGesturePolicy.claim(true,true,"top",false));
    ok(!PlaylistGesturePolicy.claim(false,true,"top",false));
    ok(!PlaylistGesturePolicy.claim(true,false,"top",false));
    ok(!PlaylistGesturePolicy.claim(true,true,"",false));
    ok(!PlaylistGesturePolicy.claim(true,true,null,false));
    ok(!PlaylistGesturePolicy.claim(true,true,"top",true));
    ok(PlaylistGesturePolicy.blockedTag("nicoid_playlist_reorder"));
    ok(PlaylistGesturePolicy.blockedTag("nicoid_playlist_selection"));
    ok(!PlaylistGesturePolicy.blockedTag(null));
    System.out.println("PASS: local playlist gesture policy");
  }
}
