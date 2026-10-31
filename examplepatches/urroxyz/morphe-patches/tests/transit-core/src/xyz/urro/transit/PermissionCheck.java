package xyz.urro.transit;
public final class PermissionCheck {
 public enum Need { NONE, OVERLAY, USAGE, BOTH }
 public static Need evaluate(boolean enabled, boolean overlayGranted, boolean usageGranted) {
  if(!enabled) return Need.NONE;
  if(!overlayGranted && !usageGranted) return Need.BOTH;
  if(!overlayGranted) return Need.OVERLAY;
  if(!usageGranted) return Need.USAGE;
  return Need.NONE;
 }
}
