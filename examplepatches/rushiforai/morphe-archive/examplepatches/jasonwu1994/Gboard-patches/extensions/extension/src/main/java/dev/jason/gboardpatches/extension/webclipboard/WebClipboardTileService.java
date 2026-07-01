package dev.jason.gboardpatches.extension.webclipboard;

import android.content.SharedPreferences;
import android.os.Build;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import android.util.Log;

public final class WebClipboardTileService extends TileService {
    private static final String TAG = "GboardWebClipboard";
    private static final String TILE_LABEL = "Web Clipboard";

    @Override
    public void onStartListening() {
        try {
            super.onStartListening();
            syncTileState();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to start listening Web Clipboard tile", throwable);
        }
    }

    @Override
    public void onTileAdded() {
        try {
            super.onTileAdded();
            syncTileState();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to add Web Clipboard tile", throwable);
        }
    }

    @Override
    public void onClick() {
        try {
            super.onClick();
            if (isLocked()) {
                unlockAndRun(this::toggleTile);
                return;
            }
            toggleTile();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to handle Web Clipboard tile click", throwable);
        }
    }

    private void toggleTile() {
        boolean enabled = WebClipboardTileController.toggle(this);
        updateTile(enabled);
    }

    private void syncTileState() {
        SharedPreferences preferences = WebClipboardPreferences.preferences(this);
        boolean serviceRunning = WebClipboardTileController.isServiceRunning(this);
        if (WebClipboardTileController.shouldRestoreService(preferences, serviceRunning)) {
            ClipboardSyncService.startOrUpdate(this);
        }
        updateTile(WebClipboardTileController.isTileActive(preferences, serviceRunning));
    }

    private void updateTile(boolean enabled) {
        Tile tile = getQsTile();
        if (tile == null) {
            return;
        }
        SharedPreferences preferences = WebClipboardPreferences.preferences(this);
        int port = WebClipboardPreferences.getPort(preferences);
        java.util.List<String> urls = WebClipboardEndpointResolver.resolveUrls(port);
        tile.setLabel(TILE_LABEL);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            tile.setSubtitle(WebClipboardTileController.buildStatusSubtitle(urls));
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            tile.setStateDescription(
                    WebClipboardTileController.buildStateDescription(enabled, urls));
        }
        tile.setState(enabled ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
        tile.updateTile();
    }
}

