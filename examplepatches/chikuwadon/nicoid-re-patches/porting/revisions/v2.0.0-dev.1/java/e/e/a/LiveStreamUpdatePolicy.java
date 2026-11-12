package e.e.a;

/** Avoid resetting a healthy live HLS player for unchanged stream announcements. */
public final class LiveStreamUpdatePolicy {
 private LiveStreamUpdatePolicy(){}
 public static boolean reuse(String oldUri,String newUri,String oldQuality,String newQuality,boolean playerActive){
  return playerActive && oldUri!=null && !oldUri.isEmpty()
      && newUri!=null && !newUri.isEmpty()
      && oldUri.equals(newUri) && oldQuality!=null && oldQuality.equals(newQuality);
 }
}
