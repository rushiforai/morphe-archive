/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide Meta upsells patch asks wherever Facebook pushes Meta's other products outside the
 * Menu. Seven switches, all off by default: Edits (the Reels composer header's button and badge, and
 * the server's Edits pill under feed videos, which the feed's requests stop asking for), Threads
 * cross-posting (the composer's onboarding), Threads in the share sheet, Meta Verified (the offer sheet after you post and the
 * label under some posts' headers), avatar stickers (the upsell components in comments and
 * Facebook's promotion slots) and Meta AI's Imagine (the Imagine me button under posts, the post
 * composer's Imagine and Create story's Imagine tile), and the other Meta AI buttons under posts
 * (AI styles, Meta AI's deep dive and chat starter, a business's AI agent and visual search, from
 * the same post button selector as Imagine me, plus the deep dive Facebook puts under a caption).
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, every answer is
 * Facebook's own.
 */
public final class MetaUpsells {
    /** Counted under the patch's name each time one of the seven is answered away. */
    static final String EDITS_HIDDEN = "Edits promotion kept out";
    static final String THREADS_HIDDEN = "Threads cross-posting prompt kept out";
    static final String VERIFIED_HIDDEN = "Meta Verified offer kept out";
    static final String AVATAR_HIDDEN = "Avatar sticker promotion kept out";
    static final String IMAGINE_HIDDEN = "Imagine entry kept out";
    static final String THREADS_SHARE_HIDDEN = "Threads share button kept out";
    static final String META_AI_BUTTON_HIDDEN = "Meta AI post button kept out";
    static final String CAPTION_DEEP_DIVE_HIDDEN = "Meta AI deep dive under a caption kept out";

    /** The post call-to-action plugin for Imagine me, as the CTA selector's name table gives it. */
    public static final String IMAGINE_ME_PLUGIN =
            "com.facebook.feed.plugins.calltoaction.impl.imagineme.ImagineMePlugin";

    /**
     * The other Meta AI post buttons, as the same name table gives them: AI styles, Meta AI's deep
     * dive and its chat starter, a business's AI agent and visual search. All five are in the table
     * on 577, 580 and 581.
     */
    public static final List<String> META_AI_POST_PLUGINS = Collections.unmodifiableList(Arrays.asList(
            "com.facebook.feed.plugins.calltoaction.impl.aistyles.AIStylesPlugin",
            "com.facebook.feed.plugins.calltoaction.impl.genaideepdive.GenAiDeepDiveCtaPlugin",
            "com.facebook.feed.plugins.calltoaction.impl.genaideedpdiveugcchaticebreakercta."
                    + "GenAiDeepDiveUgcChatIcebreakerCtaPlugin",
            "com.facebook.feed.plugins.calltoaction.impl.bizaiagent.BizAiAgentCtaPlugin",
            "com.facebook.feed.plugins.calltoaction.impl.findsvisualsearch.FindsVisualSearchCtaPlugin"));

    /** The name of Create story's Imagine tool, a constant of Facebook's enum of story tools. */
    static final String STORY_IMAGINE = "IMAGINE";

    /** The share sheet's Threads item, a constant of Facebook's enum of share sheet items. */
    static final String SHARE_TO_THREADS = "SHARE_TO_THREADS";

    private static final String FAMILY = FamilyNames.META_UPSELLS;

    private static volatile boolean logged;

    private MetaUpsells() {
    }

    private static void hid(String hook, String counter) {
        HookStatus.bound(FAMILY, hook);
        HookStatus.counted(FAMILY, counter);
        if (!logged) {
            logged = true;
            Logger.printDebug(() -> "Meta upsells: a promotion was kept out");
        }
    }

    /**
     * The hook after each read of the Reels composer's two Edits flags, the header button and its
     * badge, handed the flag. Answers false while the Edits switch is on.
     */
    public static boolean editsHeader(boolean show) {
        try {
            HookStatus.invoked(FAMILY);
            if (!show || !(Utils.settingsReady() && Settings.HIDE_EDITS_UPSELLS.get())) return show;
            hid("Edits header flag", EDITS_HIDDEN);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Edits header flag", failure);
            return show;
        }
    }

    /**
     * The hook on Facebook's own gate for asking the server for the Edits pill under feed videos,
     * before it goes into the request. Answers false while the Edits switch is on, so the server
     * leaves the pill out.
     */
    public static boolean fetchEditsPill(boolean fetch) {
        try {
            HookStatus.invoked(FAMILY);
            if (!fetch || !(Utils.settingsReady() && Settings.HIDE_EDITS_UPSELLS.get())) return fetch;
            hid("Edits pill request", EDITS_HIDDEN);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Edits pill request", failure);
            return fetch;
        }
    }

    /** {@link #fetchEditsPill(boolean)} for the video queries, which pass the gate's answer boxed. */
    @Nullable
    public static Boolean fetchEditsPill(@Nullable Boolean fetch) {
        try {
            HookStatus.invoked(FAMILY);
            if (Boolean.FALSE.equals(fetch) ||
                    !(Utils.settingsReady() && Settings.HIDE_EDITS_UPSELLS.get())) return fetch;
            hid("Edits pill request", EDITS_HIDDEN);
            return Boolean.FALSE;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Edits pill request", failure);
            return fetch;
        }
    }

    /**
     * The hook at each return of the composer capability that decides whether to show the Threads
     * cross-posting onboarding, handed its answer as an int: a boolean method may return a register
     * the verifier types as int. Answers false while the Threads switch is on.
     */
    public static boolean threadsOnboarding(int show) {
        boolean shows = show != 0;
        try {
            HookStatus.invoked(FAMILY);
            if (!shows || !(Utils.settingsReady() && Settings.HIDE_THREADS_CROSS_POSTING.get())) return shows;
            hid("Threads cross-posting onboarding", THREADS_HIDDEN);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Threads cross-posting onboarding", failure);
            return shows;
        }
    }

    /**
     * The hook at each return of the after-post Meta Verified sheet's eligibility check, a suspend
     * method: handed either its answer, a Boolean, or Kotlin's marker for "not yet", which passes
     * untouched. A yes becomes a no while the Meta Verified switch is on, so the sheet isn't shown.
     */
    @Nullable
    public static Object metaVerifiedSheet(@Nullable Object answer) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Boolean.TRUE.equals(answer) ||
                    !(Utils.settingsReady() && Settings.HIDE_META_VERIFIED_UPSELLS.get())) return answer;
            hid("Meta Verified sheet eligibility", VERIFIED_HIDDEN);
            return Boolean.FALSE;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Meta Verified sheet eligibility", failure);
            return answer;
        }
    }

    /**
     * The hook where Facebook's header subtitle plugins ask whether a post wants its Meta Verified
     * label, handed the label's text. Answers no text, so no label, while the Meta Verified switch is
     * on.
     */
    @Nullable
    public static String metaVerifiedLabel(@Nullable String label) {
        try {
            HookStatus.invoked(FAMILY);
            if (label == null || !(Utils.settingsReady() && Settings.HIDE_META_VERIFIED_UPSELLS.get())) return label;
            hid("Meta Verified label", VERIFIED_HIDDEN);
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Meta Verified label", failure);
            return label;
        }
    }

    /**
     * Asked first thing by each avatar sticker upsell component as it draws. A yes, while the avatar
     * sticker switch is on, makes it draw nothing.
     */
    public static boolean hidesAvatarUpsell() {
        try {
            HookStatus.invoked(FAMILY);
            if (!(Utils.settingsReady() && Settings.HIDE_AVATAR_UPSELLS.get())) return false;
            hid("avatar sticker upsell", AVATAR_HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "avatar sticker upsell", failure);
            return false;
        }
    }

    /**
     * The hook, first thing in the post call-to-action selector's check of whether a plugin
     * applies, handed the plugin's name. True answers no for the Imagine me button while the Imagine
     * switch is on, and for the other Meta AI buttons while theirs is, so the selector goes on to
     * the next button; false leaves the check to Facebook.
     */
    public static boolean hidesImagineCta(@Nullable String plugin) {
        try {
            HookStatus.invoked(FAMILY);
            if (plugin == null) return false;
            if (IMAGINE_ME_PLUGIN.equals(plugin)) {
                if (!Utils.settingsReady() || !Settings.HIDE_META_AI_IMAGINE.get()) return false;
                hid("Imagine me button", IMAGINE_HIDDEN);
                return true;
            }
            if (!META_AI_POST_PLUGINS.contains(plugin)) return false;
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_POST_BUTTONS.get()) return false;
            hid("Meta AI post button", META_AI_BUTTON_HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "post button check", failure);
            return false;
        }
    }

    /**
     * The hook, first thing in the getter Facebook's deep dive under a post's caption reads its
     * model through. The socket that collects what goes under a caption asks it whether the plugin
     * applies and the plugin asks it again to build the row, and both stop at a null. True answers
     * null while the other Meta AI buttons' switch is on; false leaves the getter to Facebook.
     */
    public static boolean hidesDeepDiveBelowCaption() {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_POST_BUTTONS.get()) return false;
            hid("Meta AI deep dive under a caption", CAPTION_DEEP_DIVE_HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "deep dive under a caption", failure);
            return false;
        }
    }

    /**
     * The hook after each time the post composer asks whether its Imagine capability is on, handed
     * the answer. Answers false while the Imagine switch is on, so the composer has no Imagine.
     */
    public static boolean imagineCapability(boolean on) {
        try {
            HookStatus.invoked(FAMILY);
            if (!on || !Utils.settingsReady() || !Settings.HIDE_META_AI_IMAGINE.get()) return on;
            hid("composer Imagine capability", IMAGINE_HIDDEN);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "composer Imagine capability", failure);
            return on;
        }
    }

    /**
     * The hook on the list of tools Create story builds its row of tiles from, constants of
     * Facebook's enum. Answers the same tools in the same order without Imagine while the Imagine
     * switch is on, and the list it was handed otherwise. The patch copies the answer back into an
     * ImmutableList.
     */
    @Nullable
    public static List<?> storyTools(@Nullable List<?> tools) {
        try {
            HookStatus.invoked(FAMILY);
            if (tools == null || tools.isEmpty()) return tools;
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_IMAGINE.get()) return tools;
            List<?> kept = without(tools, STORY_IMAGINE);
            if (kept != tools) hid("Create story Imagine tile", IMAGINE_HIDDEN);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "Create story tools", failure);
            return tools;
        }
    }

    /**
     * The hook in front of each return of the method that picks the share sheet's items, handed
     * the list of item types, constants of Facebook's enum. Answers the same items in the same order
     * without Threads while its switch is on, and the list it was handed otherwise. The patch copies
     * the answer back into an ImmutableList.
     */
    @Nullable
    public static List<?> shareTargets(@Nullable List<?> targets) {
        try {
            HookStatus.invoked(FAMILY);
            if (targets == null || targets.isEmpty()) return targets;
            if (!Utils.settingsReady() || !Settings.HIDE_THREADS_SHARE_BUTTON.get()) return targets;
            List<?> kept = without(targets, SHARE_TO_THREADS);
            if (kept != targets) hid("share sheet Threads button", THREADS_SHARE_HIDDEN);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "share sheet items", failure);
            return targets;
        }
    }

    /** [list] without the enum constants named [name], in the same order, or [list] itself when it has none. */
    private static List<?> without(List<?> list, String name) {
        List<Object> kept = null;
        for (int index = 0; index < list.size(); index++) {
            Object item = list.get(index);
            if (item instanceof Enum && name.equals(((Enum<?>) item).name())) {
                if (kept == null) kept = new ArrayList<>(list.subList(0, index));
            } else if (kept != null) {
                kept.add(item);
            }
        }
        return kept == null ? list : kept;
    }
}
