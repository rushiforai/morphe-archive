package app.afterglow.extension.interfaceui;

import android.content.Context;
import android.view.View;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.navigation.ShortsHeaderBindings;
import app.afterglow.extension.playback.PlayerOverlay;
import java.util.WeakHashMap;

/** Carries a subscription item's own primary click identity through native view mounting. */
public final class ShortsSubscriptionsBindings {
    /** Implemented only by the verified Lvmr builder and its Lwvq delegate. */
    public interface Owner { Object afterglow_subscriptionOwner(); }
    private enum Role { SUBSCRIPTIONS, MIXED_OR_UNKNOWN }
    // Values never retain their keys. Native Lvmr refuses mutation after its one build.
    private static final WeakHashMap<Object, Role> owners = new WeakHashMap<>();
    private static volatile int tagId;
    private static volatile boolean loggedFailure;
    private ShortsSubscriptionsBindings() {}

    public static boolean shouldInspect() {
        try { return InstalledTweaks.has("shorts-layout"); }
        catch (Throwable error) { failure(error); return false; }
    }

    private static int tagId() {
        int id = tagId;
        if (id != 0) return id;
        Context context = Afterglow.context();
        if (context == null) return 0;
        id = context.getResources().getIdentifier("afterglow_shorts_subscriptions_role", "id", context.getPackageName());
        if (id == 0) throw new IllegalStateException("Missing Shorts subscriptions role resource");
        tagId = id;
        return id;
    }

    /** Called only for Lwbv.s(), before the native primary click callback is installed. */
    public static void primaryCommand(Object builder, byte[] serializedElementsCommand) {
        if (!shouldInspect() || !(builder instanceof Owner)) return;
        try {
            Object owner = ((Owner) builder).afterglow_subscriptionOwner();
            if (!(owner instanceof ShortsHeaderBindings.TagBuilder)) return;
            boolean target = ShortsSubscriptionsCommand.classifyElements(serializedElementsCommand)
                    == ShortsSubscriptionsCommand.Source.PAUSED_SUBSCRIPTIONS;
            synchronized (owners) {
                Role previous = owners.get(owner);
                Role next = target && previous != Role.MIXED_OR_UNKNOWN
                        ? Role.SUBSCRIPTIONS : Role.MIXED_OR_UNKNOWN;
                owners.put(owner, next);
                // Ordinary commands require no native tag or SparseArray allocation.
                // A later mixed primary action removes a previously positive role.
                if (next == Role.SUBSCRIPTIONS || previous == Role.SUBSCRIPTIONS) {
                    int id = tagId();
                    if (id != 0) ((ShortsHeaderBindings.TagBuilder) owner).afterglow_putShortsTag(id, next);
                }
            }
        } catch (Throwable error) { failure(error); }
    }

    /** Native tags and click listeners have already been applied to this exact view. */
    public static void mounted(Object content) {
        if (!(content instanceof View) || tagId == 0) return;
        try {
            View view = (View) content;
            if (view.getTag(tagId) == Role.SUBSCRIPTIONS)
                PlayerOverlay.bind(view, "hideShortsSubscriptions", "shorts-layout");
        } catch (Throwable error) { failure(error); }
    }

    /** Restore before native tag removal and pooling, including a disabled preference. */
    public static void unmounted(Object content) {
        if (!(content instanceof View) || tagId == 0) return;
        try {
            View view = (View) content;
            if (view.getTag(tagId) == Role.SUBSCRIPTIONS) PlayerOverlay.unbind(view, "shorts-layout");
        } catch (Throwable error) { failure(error); }
    }

    public static void failure(Throwable error) {
        if (!loggedFailure) {
            loggedFailure = true;
            Afterglow.error("ShortsSubscriptions", error);
        }
    }
}
