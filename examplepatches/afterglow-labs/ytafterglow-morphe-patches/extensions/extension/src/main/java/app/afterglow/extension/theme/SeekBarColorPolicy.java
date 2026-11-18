package app.afterglow.extension.theme;

import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;

/** Color ownership and current-video matching without Android drawing or native class dependencies. */
public final class SeekBarColorPolicy {
    private SeekBarColorPolicy() {}

    public static int resolve(int original,ThemePalette palette,ThemeRole role,boolean installed,boolean redProgress) {
        if(!installed||palette==null)return original;
        Integer color=palette.color(role);
        if(color!=null)return color;
        // The legacy red progress option owns played/live progress and its thumb, not buffering.
        return redProgress&&role!=ThemeRole.SEEK_BUFFERED?0xFFFF0000:original;
    }
    public static boolean liveForVideo(String current,String response,boolean live) {
        return live&&current!=null&&!current.isEmpty()&&current.equals(response);
    }
    public static ThemeRole scrubberRole(boolean currentVideoLive) {
        return currentVideoLive?ThemeRole.SEEK_SCRUBBER_LIVE:ThemeRole.SEEK_SCRUBBER;
    }
}
