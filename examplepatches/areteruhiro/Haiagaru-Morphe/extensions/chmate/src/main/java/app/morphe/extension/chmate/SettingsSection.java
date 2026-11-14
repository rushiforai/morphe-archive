package app.morphe.extension.chmate;

import android.widget.LinearLayout;
import java.util.function.BooleanSupplier;

/** Presentation only. The child controls retain their original preference writers. */
public final class SettingsSection extends LinearLayout {
    public static final int KEYWORDS_TAG = 0x7e0b0022;
    public static final int CATALOG_ONLY_TAG = 0x7e0b0023;
    public final String title, summary;
    public final boolean collapsed;
    public BooleanSupplier available = () -> true;
    public String unavailableMessage = "";

    private SettingsSection(LinearLayout root, String title, String summary, boolean collapsed) {
        super(root.getContext());
        this.title=title;this.summary=summary;this.collapsed=collapsed;
        setOrientation(VERTICAL);root.addView(this);
    }

    public static SettingsSection add(LinearLayout root, String title, String summary, boolean collapsed) {
        return new SettingsSection(root,title,summary,collapsed);
    }
}
