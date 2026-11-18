package app.afterglow.extension.settings;

import java.util.ArrayList;
import java.util.List;

import app.afterglow.extension.i18n.L10n;

/** Settings categories, in the order the iOS settings show them. */
public enum Category {
    PRIVACY_SAFETY("Privacy & Safety"),
    APPEARANCE("Appearance"),
    PLAYBACK("Playback"),
    PLAYER_OVERLAY("Player & Overlay"),
    SHORTS("Shorts"),
    FEED("Feed"),
    DOWNLOADS_VAULT("Downloads & Vault"),
    EXPERIMENTS("Experiments"),
    ADVANCED("Advanced");

    public final String fallbackTitle;

    Category(String fallbackTitle) {
        this.fallbackTitle = fallbackTitle;
    }

    public String title() {
        return L10n.get(fallbackTitle, fallbackTitle);
    }

    public List<Descriptor> descriptors() {
        List<Descriptor> list = new ArrayList<>();
        for (Descriptor descriptor : Registry.ALL) {
            if (descriptor.category == this) list.add(descriptor);
        }
        return list;
    }
}
