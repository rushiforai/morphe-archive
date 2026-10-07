package com.bitmovin.player;
import android.content.Context;
import android.content.res.Configuration;
import android.widget.FrameLayout;
import com.bitmovin.player.api.Player;
import com.bitmovin.player.api.ui.PictureInPictureHandler;
public class PlayerView extends FrameLayout {
    public Player player;
    public int pauses;
    public int callbacks;
    public boolean mode;
    public PlayerView(Context context) { super(context); }
    public Player getPlayer() { return player; }
    public void onPause() { pauses++; }
    public void setPictureInPictureHandler(PictureInPictureHandler handler) {}
    public void onPictureInPictureModeChanged(boolean mode, Configuration config) {
        callbacks++; this.mode = mode;
    }
}
