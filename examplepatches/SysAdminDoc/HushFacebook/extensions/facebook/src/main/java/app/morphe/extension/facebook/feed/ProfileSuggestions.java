/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.lang.reflect.Method;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide suggested and promoted posts patch asks while Facebook builds your own profile.
 *
 * <p>Under the header of your own profile, below Add to story and Edit profile, Facebook can put a
 * "People you may know" carousel: a title with a close button, a row of large person cards and a
 * See all link. Facebook draws a profile as a list of sections, and that carousel is one of them,
 * the one that names itself {@value #SECTION}. The patch runs {@link #hideSection} first in the
 * builder of that section's children, and a yes has the section build none, so no row is drawn.
 * Your header, your friends, your posts and the rest of the profile are built as before.
 *
 * <p>The feed's "People you may know" row is the feed guard's, and both go by the same switch.
 * The section is known by the name it gives itself, which the section framework keeps and hands
 * out through {@code getLogTag()}, not by a class name Redex changes every week. It fails open:
 * with the switch off, a pause, settings that aren't ready, a section of any other name, or any
 * failure in here, Facebook builds the section as it would.
 */
public final class ProfileSuggestions {
    /** The name the carousel's section gives itself. The patch finds the section by it too. */
    static final String SECTION = "ProfilePeopleYouMayKnowSection";

    /** The section framework's kept getter of a section's name. */
    static final String LOG_TAG = "getLogTag";

    /** The counter route: each time the section was built, and the times it built nothing. */
    static final String ROUTE = "Profile sections";

    /** The Hook status name of the hook. */
    static final String HOOK = "profile People you may know section";

    /** Distinct debug lines kept, so a profile opened again and again doesn't fill the log. */
    private static final int MAX_LOGGED = 16;

    /** The debug lines already written this process. */
    private static final Set<String> LOGGED = ConcurrentHashMap.newKeySet();

    /** A section class and its {@code getLogTag()}, looked up once and kept together. */
    private static final class TagReader {
        final Class<?> type;
        final Method method;

        TagReader(Class<?> type, Method method) {
            this.type = type;
            this.method = method;
        }
    }

    /** The reader of the last section class asked about. The patch hooks one class, so one is enough. */
    @Nullable
    private static volatile TagReader reader;

    private ProfileSuggestions() {
    }

    /**
     * Injection point, first thing in the children builder of your profile's People you may know
     * section, handed the section. True has it build no children. Never throws.
     */
    public static boolean hideSection(@Nullable Object section) {
        try {
            HookStatus.invoked(FamilyNames.SUGGESTED_POSTS_PROFILE);
            String name = sectionName(section);
            if (name == null) return false;
            if (!SECTION.equals(name)) {
                // The patch hooks the one section that names itself this way, so another name means
                // the anchor took the wrong section and nothing here can be trusted.
                HookStatus.missingMember(FamilyNames.SUGGESTED_POSTS_PROFILE, "section named", SECTION, name);
                return false;
            }
            HookStatus.bound(FamilyNames.SUGGESTED_POSTS_PROFILE, SECTION);
            FeedFilterCounters.sawList(ROUTE, 1);
            FeedFilterCounters.sawKind(ROUTE, SECTION);
            // Ready first: Settings loads every switch, and it can't before the context is set.
            boolean hide = Utils.settingsReady() && Settings.HIDE_PEOPLE_YOU_MAY_KNOW.get();
            if (hide) FeedFilterCounters.removed(ROUTE, 1, SECTION);
            log(hide);
            return hide;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SUGGESTED_POSTS_PROFILE, HOOK, failure);
            return false;
        }
    }

    /**
     * The name [section] gives itself, read through the section framework's {@code getLogTag()}.
     * Null, with the miss reported, when there's no section or it has no such getter.
     */
    @Nullable
    static String sectionName(@Nullable Object section) throws ReflectiveOperationException {
        if (section == null) {
            HookStatus.missingMember(FamilyNames.SUGGESTED_POSTS_PROFILE, "section", HOOK, "null");
            return null;
        }
        Class<?> type = section.getClass();
        TagReader known = reader;
        if (known == null || known.type != type) {
            Method method;
            try {
                method = type.getMethod(LOG_TAG);
            } catch (NoSuchMethodException absent) {
                HookStatus.missingMember(FamilyNames.SUGGESTED_POSTS_PROFILE, "method", type.getName(), LOG_TAG);
                return null;
            }
            if (method.getReturnType() != String.class) {
                HookStatus.missingMember(FamilyNames.SUGGESTED_POSTS_PROFILE, "String method", type.getName(), LOG_TAG);
                return null;
            }
            method.setAccessible(true);
            known = new TagReader(type, method);
            reader = known;
        }
        Object name = known.method.invoke(section);
        return name == null ? "null" : (String) name;
    }

    /** One debug line per answer, so the phone check can see the section was asked about and what it got. */
    private static void log(boolean hidden) {
        String line = SECTION + (hidden ? " on your profile hidden" : " on your profile left in");
        if (LOGGED.size() >= MAX_LOGGED || !LOGGED.add(line)) return;
        Logger.printDebug(() -> FamilyNames.SUGGESTED_POSTS + ": " + line);
    }

    /** Forgets the kept reader and which debug lines were written, as a new Facebook process would. For tests. */
    static void forget() {
        reader = null;
        LOGGED.clear();
    }
}
