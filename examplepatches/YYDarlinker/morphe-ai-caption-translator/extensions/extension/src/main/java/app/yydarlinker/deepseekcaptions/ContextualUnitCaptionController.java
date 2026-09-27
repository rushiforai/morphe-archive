package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;

/** Host ABI adapter, not a second engine. */
final class ContextualUnitCaptionController {
  static boolean isVisibleActive() {
    return RebuildController.visible();
  }

  static String activeTranslatedUrl() {
    return RebuildController.activeUrl();
  }

  static void deactivateFromCaptionButton() {
    RebuildController.stop();
  }

  static void deactivateFromNativeCaptionState() {
    RebuildController.stop();
  }

  static void deactivateForCoreSwitch() {
    RebuildController.stop();
  }

  static void setMainActivity(Activity a) {
    RebuildController.activity(a);
  }

  static void onPlayerType(String t) {
    RebuildController.player(t);
  }

  static String restoreTargetAfterMiniplayer(String u) {
    return RebuildController.restore(u);
  }

  static void onVideoId(String id) {
    RebuildController.video(id);
  }

  static void refreshConfiguration(Context c) {
    RebuildController.refresh(c);
  }

  static void activate(Context c, String u) {
    RebuildController.activate(c, u, false, true);
  }

  static void activateSource(Context c, String u) {
    RebuildController.activate(c, u, true, true);
  }

  static void prewarm(Context c, String u) {
    RebuildController.prewarm(c, u);
  }

  static void observeTimedTextUrl(String u) {
    RebuildController.observe(u);
  }

  static void onVideoTime(long ms) {
    RebuildController.time(ms);
  }
}
