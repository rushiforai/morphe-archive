package app.morphe.extension.youtube.bilibilidanmaku;

import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.patches.LegacyPlayerControlsPatch;
import app.morphe.extension.youtube.videoplayer.PlayerIcons;
import app.morphe.extension.youtube.videoplayer.PlayerOverlayButton;

/** Runtime entry point called by Morphe's AddOnManager. */
public final class BilibiliDanmakuAddOn {
    private static final String KEY = "morphe_bilibili_danmaku_overlay_button";
    private static BooleanSetting setting;
    private static boolean registered;
    private BilibiliDanmakuAddOn() {}

    public static synchronized void register() {
        if (registered) return;
        registered = true;
        Setting<?> existing = Setting.getSettingFromPath(KEY);
        setting = existing instanceof BooleanSetting ? (BooleanSetting) existing : new BooleanSetting(KEY, true, true);
        AddOnApi.addVideoIdListener(BilibiliDanmakuController::newVideoLoaded);
        AddOnApi.addVideoTimeListener(BilibiliDanmakuController::setVideoTime);
        AddOnApi.addPlayerOverlayButtonsListener(BilibiliDanmakuAddOn::modernButton);
        AddOnApi.addLegacyPlayerControlsListener(BilibiliDanmakuAddOn::legacyButton);
    }

    private static void modernButton(View view) {
        attach(view, 0);
        if (LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS || !setting.get()) return;
        ImageView button = PlayerOverlayButton.addButton(view, PlayerIcons.name("morphe_bilibili_danmaku_button_on"),
                v -> BilibiliDanmakuController.showMenu(v.getContext()), null);
        if (button != null) button.setContentDescription("B站弹幕设置");
    }

    private static void legacyButton(View view) {
        attach(view, 0);
        if (!LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS) return;
        AddOnApi.createLegacyButton("bilibili-danmaku", view, "morphe_bilibili_danmaku_button_on", setting,
                v -> BilibiliDanmakuController.showMenu(v.getContext()), null);
    }

    private static void attach(View view, int attempts) {
        View root = view.getRootView();
        int id = view.getResources().getIdentifier("inset_overlay_view_layout", "id", view.getContext().getPackageName());
        View overlay = id == 0 || root == null ? null : root.findViewById(id);
        if (overlay instanceof FrameLayout) {
            BilibiliDanmakuController.initialize((ViewGroup) overlay);
        } else if (attempts < 20) {
            view.postDelayed(() -> attach(view, attempts + 1), 250);
        }
    }
}
