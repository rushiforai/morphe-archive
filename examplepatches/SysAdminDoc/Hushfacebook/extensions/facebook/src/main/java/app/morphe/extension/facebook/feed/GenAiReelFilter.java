/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.reels.ReelSections;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The GenAI rule for Reels and Watch: takes the reels and videos Facebook's own detection marked as
 * made with AI out of each page before it reaches the Reels item collection, the way the sponsored
 * reels filter takes the ads out, at the same two levels.
 *
 * <p>The Reels viewer draws its AI label from an attribution model of GraphQL type
 * {@link #ATTRIBUTION_TYPE} in the reel's attribution list, and that model carries
 * {@code was_detected_as_ai_generated} as a boolean of its own, beside the creator's
 * {@code was_self_disclosed_as_ai_generated}. Facebook finds the attribution with a static helper
 * that takes the reel's model and the type name, and the patch writes that helper into
 * {@link #transparencyAttribution}, because the model's class and the helper are Redex names. The
 * flag is then read through {@code TreeJNI.getBooleanValue}, the kept reader Facebook's own label
 * decision calls on the same attribution. A Watch video that comes as a GraphQLStory carries the
 * feed's flag instead, and it is read the way the feed rule reads it ({@link GenAiLabel}).
 *
 * <p>Only a definite true hides anything. A reel with no such attribution, one whose flag is unset
 * or false, an item holding neither a reel model nor a story, and anything this can't read all
 * stay, each counted under its own reason so a report says why. A reel only its creator labelled
 * as AI has the attribution with the flag false, and stays too.
 */
public final class GenAiReelFilter {
    /** The GraphQL type of the attribution the Reels viewer's AI label is built from. */
    static final String ATTRIBUTION_TYPE = "XFBFBShortsGenAITransparencyAttribution";

    /** The flag's GraphQL name, the same one the feed's model carries. A tree keys a field by its hash. */
    static final String DETECTED_FLAG = GenAiLabel.DETECTED_FLAG;
    static final int DETECTED_FLAG_KEY = DETECTED_FLAG.hashCode();

    /** The kept tree class every Facebook model extends, and the readers the flag is read through. */
    static final String TREE_CLASS = StoryFlag.TREE_CLASS;
    static final String BOOLEAN_READER = "getBooleanValue";
    static final String FIELD_CHECK = "hasFieldValue";
    static final String VALIDITY_CHECK = "isValidGraphServicesJNIModel";

    /** What the stub answers until its patch fills it in. */
    static final Object NOT_PATCHED = new Object();

    /** The source every event of this filter carries in the diagnostic report. */
    private static final String SOURCE = "GenAiReelFilter";

    /**
     * The diagnostic counter routes: the pages and sections handed in, each counted with what came
     * off it, and every item the rule read while its switch was on, with what the read found as the
     * kind. A kind is a shape, never content.
     */
    static final String PAGES_ROUTE = "GenAI reel pages";
    static final String SECTIONS_ROUTE = "GenAI reel sections";
    static final String ITEMS_ROUTE = "GenAI reel flag";

    /** What reading one item found. Only the two flagged kinds hide. */
    static final String FLAGGED = "flag true";
    static final String NOT_FLAGGED = "flag false";
    static final String UNSET = "flag unset";
    static final String NO_ATTRIBUTION = "no AI attribution";
    static final String NO_MODEL = "no model";
    static final String MODEL_CLASS_MISSING = "model class missing";
    static final String NO_READER = "reader missing";
    static final String NOT_PATCHED_KIND = "accessor not patched";
    static final String NOT_A_TREE = "ambiguous: attribution not a tree";
    static final String RELEASED = "attribution released";
    static final String TYPE_UNREADABLE = "attribution type unreadable";
    static final String OTHER_TYPE = "ambiguous: attribution of another type";
    static final String READ_FAILED = "read failed";
    /** A story-backed item's kinds are the feed rule's reasons behind this. */
    static final String STORY = "story ";
    static final String STORY_FLAGGED = STORY + "flag true";

    /** The attribution finder, however it's read: the stub the patch filled in, or a stand-in in a test. */
    interface Finder {
        @Nullable
        Object attribution(Object model);
    }

    static final Finder PATCHED = model -> transparencyAttribution(model, ATTRIBUTION_TYPE);

    private GenAiReelFilter() {
    }

    /**
     * Injection point, filled in by the patch: the reel model's attribution of GraphQL type
     * {@code typeName}, always {@link #ATTRIBUTION_TYPE}, or null when it has none. The patch
     * replaces this body with a call to Facebook's finder, whose class and name change every build,
     * handing it both parameters as they came. The name is a parameter so the filled body needs no
     * register of its own: compiled, this stub keeps none, because its marker goes in the register
     * of a parameter it never reads. Only a reel model may be passed.
     */
    public static Object transparencyAttribution(Object model, String typeName) {
        return NOT_PATCHED;
    }

    /**
     * Injection point, before a page of reels enters the item collection: the same items without
     * the ones Facebook's detection flagged, or the very same collection when none was. Never throws.
     *
     * @param page           the page about to be added to the Reels collection.
     * @param modelClassName binary name of the reel model's class, as the patch resolved it.
     */
    public static Collection<?> withoutAiReels(Collection<?> page, String modelClassName) {
        return withoutAiReels(page, modelClassName, PATCHED, GenAiLabel.PATCHED);
    }

    /** The page filter with the finder and the story accessor passed in, so a test can stand in for the stubs. */
    static Collection<?> withoutAiReels(Collection<?> page, String modelClassName, Finder finder,
            StoryFlag.Accessor storyAccessor) {
        try {
            HookStatus.invoked(FamilyNames.AI_DETECTED_REELS);
            FeedFilterCounters.sawList(PAGES_ROUTE, page == null ? 0 : page.size());
            if (page == null || page.isEmpty() || !switchedOn()) return page;

            Readers readers = readers(modelClassName);
            ArrayList<Object> kept = new ArrayList<>(page.size());
            int dropped = 0;
            for (Object item : page) {
                if (hides(item, readers, finder, storyAccessor)) dropped++;
                else kept.add(item);
            }
            if (dropped == 0) return page;

            FeedFilterCounters.removed(PAGES_ROUTE, dropped, DETECTED_FLAG);
            final int droppedItems = dropped;
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "dropped " + droppedItems + " of " + page.size());
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "reel page filter", failure);
            Logger.printException(() -> "GenAI reels: could not filter a page", failure);
            return page;
        }
    }

    /**
     * Injection point, before a page of sections reaches the Reels controller: the same page with
     * the flagged items taken out of each section's list, which is the list the screen reads. Never
     * throws.
     *
     * @param page           the sections about to be added to the Reels list.
     * @param modelClassName binary name of the reel model's class, as the patch resolved it.
     */
    public static List<?> withoutAiSections(List<?> page, String modelClassName) {
        return withoutAiSections(page, modelClassName, PATCHED, GenAiLabel.PATCHED);
    }

    /** The section filter with the finder and the story accessor passed in, so a test can stand in for the stubs. */
    static List<?> withoutAiSections(List<?> page, String modelClassName, Finder finder, StoryFlag.Accessor storyAccessor) {
        try {
            HookStatus.invoked(FamilyNames.AI_DETECTED_REELS);
            FeedFilterCounters.sawList(SECTIONS_ROUTE, page == null ? 0 : page.size());
            if (page == null || page.isEmpty() || !switchedOn()) return page;

            Readers readers = readers(modelClassName);
            ReelSections.Result result = ReelSections.strip(page, item -> hides(item, readers, finder, storyAccessor),
                    FamilyNames.AI_DETECTED_REELS, SOURCE);
            if (result.dropped == 0) return page;

            FeedFilterCounters.removed(SECTIONS_ROUTE, result.dropped, DETECTED_FLAG);
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "section filter dropped " + result.dropped + " item(s) from " + page.size() + " section(s)");
            return result.page;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "reel section filter", failure);
            Logger.printException(() -> "GenAI reels: could not filter a page of sections", failure);
            return page;
        }
    }

    /**
     * The switch. Off, unreadable, asked before the settings are ready or while Hushfacebook is
     * paused, the page passes as Facebook sent it and nothing of any item is read.
     */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.HIDE_AI_DETECTED_REELS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "switch read", failure);
            Logger.printException(() -> "GenAI reels: could not read the switch", failure);
            return false;
        }
    }

    /**
     * Whether the item comes off its page. Every item read is counted on the items route under what
     * the read found, and a hidden one as a removal, so a kept reel always has a reason in the report.
     */
    private static boolean hides(Object item, Readers readers, Finder finder, StoryFlag.Accessor storyAccessor) {
        String why = read(item, readers, finder, storyAccessor);
        FeedFilterCounters.sawList(ITEMS_ROUTE, 1);
        FeedFilterCounters.sawKind(ITEMS_ROUTE, why);
        if (!FLAGGED.equals(why) && !STORY_FLAGGED.equals(why)) return false;
        FeedFilterCounters.removed(ITEMS_ROUTE, 1, why);
        Logger.printDebug(() -> "GenAI reels: hid a reel (" + why + ")");
        return true;
    }

    /** What the rule makes of one item, as a kind for the report. Never throws. */
    static String read(Object item, Readers readers, Finder finder, StoryFlag.Accessor storyAccessor) {
        try {
            if (item == null) return NO_MODEL;
            if (!readers.complete()) return NO_READER;
            Object model = readers.model == null ? null : held(item, readers.model);
            if (model != null) return attributionKind(model, readers, finder);
            Object story = readers.story == null ? null : held(item, readers.story);
            if (story != null) {
                StoryFlag flag = GenAiLabel.FLAG;
                return STORY + flag.reason(flag.read(story, storyAccessor));
            }
            return readers.model == null ? MODEL_CLASS_MISSING : NO_MODEL;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "reel item reader", failure);
            return READ_FAILED;
        }
    }

    /** What the reel model's GenAI attribution says. */
    private static String attributionKind(Object model, Readers readers, Finder finder) {
        Object attribution;
        try {
            attribution = finder.attribution(model);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "GenAI attribution finder", failure);
            return READ_FAILED;
        }
        if (attribution == NOT_PATCHED) {
            HookStatus.missingMember(FamilyNames.AI_DETECTED_REELS, "method", model.getClass().getName(),
                    "the " + ATTRIBUTION_TYPE + " finder");
            return NOT_PATCHED_KIND;
        }
        if (attribution == null) return NO_ATTRIBUTION;
        if (!readers.tree.isInstance(attribution)) return NOT_A_TREE;

        try {
            if (readers.valid != null && !Boolean.TRUE.equals(readers.valid.invoke(attribution))) return RELEASED;
            String type = FeedFilter.typeName(attribution);
            if (type == null) return TYPE_UNREADABLE;
            if (!ATTRIBUTION_TYPE.equals(type)) return OTHER_TYPE;
            if (readers.hasField != null && !Boolean.TRUE.equals(readers.hasField.invoke(attribution, DETECTED_FLAG_KEY))) {
                return UNSET;
            }
            Object value = readers.booleanValue.invoke(attribution, DETECTED_FLAG_KEY);
            if (!(value instanceof Boolean)) return READ_FAILED;
            return (Boolean) value ? FLAGGED : NOT_FLAGGED;
        } catch (InvocationTargetException failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "GenAI reel flag reader", failure.getCause());
            return READ_FAILED;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            HookStatus.threw(FamilyNames.AI_DETECTED_REELS, "GenAI reel flag reader", failure);
            return READ_FAILED;
        }
    }

    /** The fields of each item class, looked up once: an item holds its model or its story in one of them. */
    private static final ConcurrentHashMap<Class<?>, Field[]> FIELDS = new ConcurrentHashMap<>();

    /**
     * The value of [type] the item holds in one of its instance fields, its superclasses' included,
     * or null. An item's class is one Redex renames, and which field holds the model changes with
     * it, so the fields are read by what they hold rather than by name.
     */
    @Nullable
    private static Object held(Object item, Class<?> type) throws IllegalAccessException {
        for (Field field : FIELDS.computeIfAbsent(item.getClass(), GenAiReelFilter::instanceFields)) {
            Object value = field.get(item);
            if (type.isInstance(value)) return value;
        }
        return null;
    }

    private static Field[] instanceFields(Class<?> itemClass) {
        List<Field> fields = new ArrayList<>();
        for (Class<?> type = itemClass; type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    fields.add(field);
                } catch (RuntimeException sealed) {
                    // A field this process may not read. The others are still looked at.
                }
            }
        }
        return fields.toArray(new Field[0]);
    }

    /**
     * The kept members the flag is read through, looked up once per reel model name. A member this
     * build doesn't have is null, and the rule then keeps every item while the report names what's
     * missing. The field check and the validity check are optional: without them the flag is read
     * as it is.
     */
    static final class Readers {
        @Nullable final Class<?> model;
        @Nullable final Class<?> story;
        @Nullable final Class<?> tree;
        @Nullable final Method booleanValue;
        @Nullable final Method hasField;
        @Nullable final Method valid;

        Readers(@Nullable Class<?> model, @Nullable Class<?> story, @Nullable Class<?> tree,
                @Nullable Method booleanValue, @Nullable Method hasField, @Nullable Method valid) {
            this.model = model;
            this.story = story;
            this.tree = tree;
            this.booleanValue = booleanValue;
            this.hasField = hasField;
            this.valid = valid;
        }

        boolean complete() {
            return tree != null && booleanValue != null;
        }

        static Readers lookUp(String modelClassName, ClassLoader loader) {
            Class<?> model = classOrNull(modelClassName, loader);
            Class<?> story = classOrNull(StoryFlag.STORY_CLASS, loader);
            Class<?> tree = classOrNull(TREE_CLASS, loader);
            Method booleanValue = null;
            Method hasField = null;
            Method valid = null;
            if (tree != null) {
                booleanValue = publicMethod(tree, BOOLEAN_READER, boolean.class, int.class);
                hasField = publicMethod(tree, FIELD_CHECK, boolean.class, int.class);
                valid = publicMethod(tree, VALIDITY_CHECK, boolean.class);
            }
            return new Readers(model, story, tree, booleanValue, hasField, valid);
        }

        /** What was found and what wasn't, into the reels row of Hook status. */
        void reportInto(String family, String modelClassName) {
            if (model != null) HookStatus.bound(family, "reel model class");
            else HookStatus.missingMember(family, "class", modelClassName, "reel model");
            if (booleanValue != null) HookStatus.bound(family, "TreeJNI#" + BOOLEAN_READER);
            else HookStatus.missingMember(family, "method", TREE_CLASS, BOOLEAN_READER + "(int)");
            if (hasField != null) HookStatus.bound(family, "TreeJNI#" + FIELD_CHECK);
            else HookStatus.missingMember(family, "method", TREE_CLASS, FIELD_CHECK + "(int)");
        }

        @Nullable
        private static Class<?> classOrNull(String name, ClassLoader loader) {
            try {
                return Class.forName(name, false, loader);
            } catch (Throwable missing) {
                return null;
            }
        }

        @Nullable
        private static Method publicMethod(Class<?> type, String name, Class<?> returns, Class<?>... parameters) {
            try {
                Method found = type.getMethod(name, parameters);
                return found.getReturnType() == returns ? found : null;
            } catch (NoSuchMethodException | RuntimeException missing) {
                return null;
            }
        }
    }

    /** The readers by reel model name, looked up on first use. A test sets one to stand in for a build missing a member. */
    static final ConcurrentHashMap<String, Readers> READERS = new ConcurrentHashMap<>();

    /** Which Hook status row the members were last reported into. */
    private static volatile long reportedGeneration = -1;

    /**
     * The readers for this reel model, reported into the reels row of Hook status once per row:
     * again after a diagnostic clear, which empties the row they were written into.
     */
    static Readers readers(String modelClassName) {
        Readers found = READERS.computeIfAbsent(modelClassName,
                name -> Readers.lookUp(name, GenAiReelFilter.class.getClassLoader()));
        long generation = HookStatus.generation();
        if (reportedGeneration != generation) {
            reportedGeneration = generation;
            found.reportInto(FamilyNames.AI_DETECTED_REELS, modelClassName);
            GenAiLabel.FLAG.report();
        }
        return found;
    }
}
