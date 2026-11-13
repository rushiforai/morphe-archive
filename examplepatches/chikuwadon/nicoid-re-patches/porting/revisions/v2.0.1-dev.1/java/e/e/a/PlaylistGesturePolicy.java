package e.e.a;
/** Pure recognition policy for repeatable local playlist tests. */
public final class PlaylistGesturePolicy {
  private PlaylistGesturePolicy(){}
  public static boolean blockedTag(Object tag){
    return "nicoid_playlist_reorder".equals(tag)||"nicoid_playlist_selection".equals(tag);
  }
  public static boolean claim(boolean valid,boolean axisAllowed,String mapped,boolean editing){
    return valid&&axisAllowed&&!editing&&mapped!=null&&!mapped.isEmpty();
  }
}
