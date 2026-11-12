package app.template.extension.hevalcontrols;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * One feature of the patched app, as registered by its patch at patch time. Immutable.
 *
 * <p>Runtime features are gated in the app's code by {@link HevalSettings#isEnabled(String)}.
 * Build-time-only features were applied at patch time (manifest, resources, removed code) and are
 * listed for information only; they cannot be switched at runtime.
 *
 * <p>A list feature ({@link #isList()}, kind {@link #KIND_LIST}) is not a switch: the user picks
 * items to hide in a picker, and app hooks read the picked keys through
 * {@link HevalSettings#getHidden(String)}. An empty pick is stock behaviour, so a list feature is
 * never on by default and never build-time-only.
 */
@SuppressWarnings("unused")
public final class Feature {
    /** Feature ids: lower case, digits, '_' and '.', starting with a letter, at most 64 chars. */
    public static boolean isValidId(String id) {
        if (id == null || id.isEmpty() || id.length() > 64) return false;
        char first = id.charAt(0);
        if (first < 'a' || first > 'z') return false;
        for (int i = 1; i < id.length(); i++) {
            char c = id.charAt(i);
            boolean ok = (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '_' || c == '.';
            if (!ok) return false;
        }
        return true;
    }

    /** An on/off switch (every feature before list settings existed). */
    public static final String KIND_SWITCH = "switch";
    /** A multi-select "pick items to hide" list. */
    public static final String KIND_LIST = "list";

    public final String id;
    public final String name;
    public final String description;
    public final String category;
    public final boolean defaultEnabled;
    /** The app reads this feature once per process, so a change applies after a restart. */
    public final boolean restartRequired;
    /** Applied at patch time; shown read-only. */
    public final boolean buildTimeOnly;
    /** Ids of features that must be on for this one to take effect. */
    public final List<String> dependencies;
    /** {@link #KIND_SWITCH} or {@link #KIND_LIST}. */
    public final String kind;

    /**
     * Key of the row's icon on the settings screen (for example {@code "eye_off"}), or empty to use
     * the icon of the feature's category. Purely visual; an unknown key draws the generic icon.
     */
    public final String icon;

    /**
     * Title of a single-choice group this switch belongs to, or empty. Switches of one category that
     * share a non-empty title are shown as ONE row ("Animation speed: Normal, Faster, Off") instead
     * of one switch each: picking an option turns that switch on and the others off, and "Normal"
     * turns all of them off. The switches and their ids are unchanged, so hooks and saved choices
     * work as before. Only meaningful for switches.
     */
    public final String choice;

    /**
     * Part of the "Calm mode" preset: the preset turns this switch on. Only meaningful for runtime
     * switches; a list or a patch-time-only feature is never calm.
     */
    public final boolean calm;

    public Feature(String id, String name, String description, String category, boolean defaultEnabled,
                   boolean restartRequired, boolean buildTimeOnly, List<String> dependencies) {
        this(id, name, description, category, defaultEnabled, restartRequired, buildTimeOnly, dependencies, KIND_SWITCH);
    }

    public Feature(String id, String name, String description, String category, boolean defaultEnabled,
                   boolean restartRequired, boolean buildTimeOnly, List<String> dependencies, String kind) {
        this(id, name, description, category, defaultEnabled, restartRequired, buildTimeOnly, dependencies, kind, "");
    }

    public Feature(String id, String name, String description, String category, boolean defaultEnabled,
                   boolean restartRequired, boolean buildTimeOnly, List<String> dependencies, String kind, String icon) {
        this(id, name, description, category, defaultEnabled, restartRequired, buildTimeOnly, dependencies, kind, icon, "");
    }

    public Feature(String id, String name, String description, String category, boolean defaultEnabled,
                   boolean restartRequired, boolean buildTimeOnly, List<String> dependencies, String kind, String icon,
                   String choice) {
        this(id, name, description, category, defaultEnabled, restartRequired, buildTimeOnly, dependencies, kind, icon, choice, false);
    }

    public Feature(String id, String name, String description, String category, boolean defaultEnabled,
                   boolean restartRequired, boolean buildTimeOnly, List<String> dependencies, String kind, String icon,
                   String choice, boolean calm) {
        if (!isValidId(id)) throw new IllegalArgumentException("Invalid feature id");
        boolean list = KIND_LIST.equals(kind);
        if (list && buildTimeOnly) throw new IllegalArgumentException("A list feature cannot be build-time-only");
        this.kind = list ? KIND_LIST : KIND_SWITCH;
        this.icon = icon == null ? "" : icon;
        // A choice option is a runtime switch: a list or a patch-time-only row cannot join one.
        this.choice = list || buildTimeOnly || choice == null ? "" : choice;
        this.calm = calm && !list && !buildTimeOnly;
        this.id = id;
        this.name = name == null || name.isEmpty() ? id : name;
        this.description = description == null ? "" : description;
        this.category = category == null || category.isEmpty() ? "General" : category;
        // A list starts empty (stock), whatever the record says.
        this.defaultEnabled = !list && defaultEnabled;
        this.restartRequired = restartRequired;
        this.buildTimeOnly = buildTimeOnly;
        this.dependencies = dependencies == null || dependencies.isEmpty()
                ? Collections.<String>emptyList()
                : Collections.unmodifiableList(new ArrayList<>(dependencies));
    }

    /** Whether this is a "pick items to hide" list rather than a switch. */
    public boolean isList() {
        return KIND_LIST.equals(kind);
    }
}
