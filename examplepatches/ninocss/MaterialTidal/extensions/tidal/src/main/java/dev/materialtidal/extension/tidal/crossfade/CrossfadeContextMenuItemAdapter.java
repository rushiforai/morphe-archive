package dev.materialtidal.extension.tidal.crossfade;

import android.app.Activity;

/**
 * Context menu item adapter injected into TIDAL's Now Playing track context menu.
 * At patch time, {@code CrossfadePlaybackPatch} reparents this class to TIDAL's
 * {@code ContextMenuItem} base class ({@code Lgs3;}), rewrites {@code <init>} to call
 * {@code Lgs3;.<init>}, and adds {@code c(Landroidx/fragment/app/FragmentActivity;)V}.
 */
@SuppressWarnings("unused")
public final class CrossfadeContextMenuItemAdapter {

    public CrossfadeContextMenuItemAdapter(
            Object titleSpec,
            int iconRes,
            String analyticsKey,
            Object contentMetadata,
            int zeroExtraIcon,
            int iconColorRes,
            int unusedTextColorRes,
            int defaultMask
    ) {
    }

    public void onClickedImpl(Object fragmentActivity) {
        if (fragmentActivity instanceof Activity) {
            CrossfadeBottomSheet.show((Activity) fragmentActivity);
        } else {
            CrossfadeTidalBridge.openBottomSheetFromSettings();
        }
    }
}
