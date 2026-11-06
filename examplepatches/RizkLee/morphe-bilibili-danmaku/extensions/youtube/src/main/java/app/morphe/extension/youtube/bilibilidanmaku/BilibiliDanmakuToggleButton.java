package app.morphe.extension.youtube.bilibilidanmaku;

import android.view.View;
import android.widget.ImageView;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.patches.LegacyPlayerControlsPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.videoplayer.LegacyPlayerControlButton;
import app.morphe.extension.youtube.videoplayer.PlayerIcons;
import app.morphe.extension.youtube.videoplayer.PlayerOverlayButton;

/** Integrates Bilibili danmaku into Morphe's regular player button row. */
@SuppressWarnings("unused")
public final class BilibiliDanmakuToggleButton {
    private static final String ICON = "morphe_bilibili_danmaku_button_on";

    private BilibiliDanmakuToggleButton() {}

    public static void initializeButton(View controlsView) {
        try {
            if (LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS
                    || !Settings.BILIBILI_DANMAKU_OVERLAY_BUTTON.get()) return;
            ImageView button = PlayerOverlayButton.addButton(controlsView,
                    PlayerIcons.name(ICON),
                    view -> BilibiliDanmakuController.showMenu(view.getContext()), null);
            if (button != null) button.setContentDescription("B站弹幕设置");
        } catch (Exception ex) {
            Logger.printException(() -> "Bilibili player button initialization", ex);
        }
    }

    public static void initializeLegacyButton(View controlsView) {
        try {
            if (!LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS) return;
            new LegacyPlayerControlButton(controlsView,
                    "morphe_bilibili_danmaku_button", null, PlayerIcons.name(ICON),
                    Settings.BILIBILI_DANMAKU_OVERLAY_BUTTON,
                    view -> BilibiliDanmakuController.showMenu(view.getContext()), null);
        } catch (Exception ex) {
            Logger.printException(() -> "Bilibili legacy player button initialization", ex);
        }
    }
}
