package app.afterglow.extension.navigation;

import android.content.Context;
import android.view.View;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.litho.ShortsHeaderPolicy;
import app.afterglow.extension.playback.PlayerOverlay;

/** Carries a narrow renderer identity through Litho's native view-tag lifecycle. */
public final class ShortsHeaderBindings {
    public interface TagBuilder { void afterglow_putShortsTag(int id, Object value); }
    private static final Role SEARCH = new Role("hideShortsSearch");
    private static final Role MORE = new Role("hideShortsMore");
    private static volatile int tagId;

    private static final class Role {
        final String key;
        Role(String key) { this.key = key; }
    }

    private ShortsHeaderBindings() {}

    private static int tagId() {
        int id = tagId;
        if (id != 0) return id;
        Context context = Afterglow.context();
        if (context == null) return 0;
        id = context.getResources().getIdentifier("afterglow_shorts_header_role", "id", context.getPackageName());
        if (id == 0) throw new IllegalStateException("Missing Shorts header role resource");
        tagId = id;
        return id;
    }

    /** Runs before the native builder copies its tag map into the completed component. */
    public static void prepare(LithoContext context, Object element, String accessibilityId, Object builder) {
        if (!InstalledTweaks.has("shorts-layout") || context == null || !(builder instanceof TagBuilder)) return;
        try {
            String key = ShortsHeaderPolicy.key(context, element, accessibilityId);
            Role role = "hideShortsSearch".equals(key) ? SEARCH : "hideShortsMore".equals(key) ? MORE : null;
            if (role == null) return;
            int id = tagId();
            if (id != 0) ((TagBuilder) builder).afterglow_putShortsTag(id, role);
        } catch (Throwable error) { Afterglow.error("ShortsHeader.prepare", error); }
    }

    /** Native mounting has applied all view properties, including the role tag. */
    public static void mounted(Object content) {
        if (!(content instanceof View) || tagId == 0) return;
        try {
            View view = (View) content;
            Object role = view.getTag(tagId);
            if (role instanceof Role) PlayerOverlay.bind(view, ((Role) role).key, "shorts-layout");
        } catch (Throwable error) { Afterglow.error("ShortsHeader.mounted", error); }
    }

    /** Restore our changes before native unmount clears properties and pools the view. */
    public static void unmounted(Object content) {
        if (!(content instanceof View) || tagId == 0) return;
        try {
            View view = (View) content;
            if (view.getTag(tagId) instanceof Role) PlayerOverlay.unbind(view, "shorts-layout");
        } catch (Throwable error) { Afterglow.error("ShortsHeader.unmounted", error); }
    }
}
