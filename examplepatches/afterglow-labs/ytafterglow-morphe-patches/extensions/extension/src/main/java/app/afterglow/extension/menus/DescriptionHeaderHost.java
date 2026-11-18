package app.afterglow.extension.menus;

import android.view.View;

/** Exact native header and its currently owning engagement-panel model. */
public interface DescriptionHeaderHost {
    View afterglow_descriptionRoot();
    Object afterglow_descriptionPanel();
    String afterglow_descriptionPanelId();
}
