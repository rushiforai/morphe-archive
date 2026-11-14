package app.soundsync.settings;

import android.app.PendingIntent;
import android.content.Intent;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;

/** Quick-settings button: opens the small -/+ panel over whatever is playing. */
public class SyncTileService extends TileService {

    @Override
    public void onStartListening() {
        super.onStartListening();
        refresh();
    }

    @Override
    public void onClick() {
        super.onClick();
        Intent i = new Intent(this, AdjustActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        PendingIntent pi = PendingIntent.getActivity(this, 0, i,
                PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
        try {
            startActivityAndCollapse(pi);
        } catch (Exception ignored) {
        }
    }

    private void refresh() {
        Tile t = getQsTile();
        if (t == null) return;
        int mode = Settings.mode(this);
        t.setState(mode == Settings.MODE_OFF ? Tile.STATE_INACTIVE : Tile.STATE_ACTIVE);
        t.setLabel(getString(R.string.tile_label));
        t.setSubtitle(mode == Settings.MODE_OFF ? "Off" : Settings.delay(this) + " ms");
        t.updateTile();
    }
}
