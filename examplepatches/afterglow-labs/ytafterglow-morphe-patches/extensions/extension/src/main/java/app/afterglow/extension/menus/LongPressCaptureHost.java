package app.afterglow.extension.menus;

import java.util.List;

/** Typed access to the text actually mounted in native ComponentHost. */
public interface LongPressCaptureHost {
    List<CharSequence> afterglow_captureTextItems();
}
