/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

/** Asks the profile hook about a section the way your profile's People you may know section does. */
public final class ProfileSuggestionsForTests {
    private ProfileSuggestionsForTests() {
    }

    /**
     * A stand-in for the section framework's base class: the name a section was built with, handed
     * back by the kept getLogTag().
     */
    public static class Section {
        private final String name;

        public Section(String name) {
            this.name = name;
        }

        public String getLogTag() {
            return name;
        }
    }

    /** The carousel's section, a subclass of the base like Facebook's own. */
    public static final class PeopleYouMayKnowSection extends Section {
        public PeopleYouMayKnowSection() {
            super(ProfileSuggestions.SECTION);
        }
    }

    /** True when your profile's People you may know section builds no children. */
    public static boolean hidesTheCarousel() {
        return ProfileSuggestions.hideSection(new PeopleYouMayKnowSection());
    }

    /** Forgets the kept reader and the debug lines, as a new Facebook process would start without them. */
    public static void newProcess() {
        ProfileSuggestions.forget();
    }
}
