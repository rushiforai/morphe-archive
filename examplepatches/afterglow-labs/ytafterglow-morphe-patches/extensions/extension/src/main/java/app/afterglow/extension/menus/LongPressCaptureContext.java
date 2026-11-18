package app.afterglow.extension.menus;

import android.view.View;

/** Added to native ConversionContext; containerInternal is its actual Litho root. */
public interface LongPressCaptureContext {
    View afterglow_captureRoot();
    Object afterglow_captureBinding();
    String afterglow_captureIdentifier();
    StringBuilder afterglow_capturePath();
}
