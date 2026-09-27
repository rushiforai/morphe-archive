package app.yydarlinker.deepseekcaptions;

/** Native-hook ownership guard. Scheduling belongs only to RebuildController. */
final class ContextualUnitCorePolicy {
  static boolean shouldPassThroughUnresolvedActivation(
      boolean installed, boolean requested, String urlVideo, String foreground) {
    return installed
        && requested
        && (urlVideo == null || urlVideo.trim().isEmpty())
        && (foreground == null || foreground.trim().isEmpty());
  }
}
