package io.github.liongalahad.nuviotv.extension.settings;

import java.util.ArrayList;
import java.util.List;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/** Generic native category list for the shared Morphe settings page. */
@SuppressWarnings("unused")
public final class MorpheSettingsPageContent implements Function3<Object, Object, Object, Unit> {
    private static final Function0<Unit> NO_OP = () -> Unit.INSTANCE;
    private static final String ABOUT_SECTION_KEY = "morphe_about_section";

    private final Object modifier;
    private final Object initialFocusRequester;

    private MorpheSettingsPageContent(Object modifier, Object initialFocusRequester) {
        this.modifier = modifier;
        this.initialFocusRequester = initialFocusRequester;
    }

    public static Function3<Object, Object, Object, Unit> create(
            Object modifier,
            Object initialFocusRequester
    ) {
        return new MorpheSettingsPageContent(modifier, initialFocusRequester);
    }

    @Override
    public Unit invoke(Object ignoredScope, Object composer, Object flags) {
        if (!MorpheSettingsRows.beginComposition(composer, flags)) return Unit.INSTANCE;

        Object refreshState = MorpheSettingsRows.rememberBooleanState(composer, false);
        MorpheSettingsRows.booleanStateValue(refreshState);
        MorpheComposeModeAction.captureRefreshAction(
                MorpheSettingsRows.booleanStateToggle(refreshState)
        );

        List<SectionState> sections = new ArrayList<>();
        int sectionIndex = 0;
        for (MorpheSettingsCategory category : MorpheSettingsRuntime.enabledCategories()) {
            Object expanded = MorpheSettingsRows.rememberBooleanState(composer, false);
            Object rememberedFocusRequester = MorpheSettingsRows.rememberFocusRequester(composer);
            sections.add(new SectionState(
                    category,
                    expanded,
                    focusRequesterForSection(
                            initialFocusRequester,
                            rememberedFocusRequester,
                            sectionIndex
                    )
            ));
            sectionIndex += 1;
        }
        Object aboutExpanded = MorpheSettingsRows.rememberBooleanState(composer, false);
        Object aboutFocusRequester = MorpheSettingsRows.rememberFocusRequester(composer);
        MorpheSettingsRows.lazyColumn(
                modifier,
                composer,
                new SectionList(modifier, sections, aboutExpanded, aboutFocusRequester)
        );
        return Unit.INSTANCE;
    }

    static Object focusRequesterForSection(
            Object initialFocusRequester,
            Object rememberedFocusRequester,
            int sectionIndex
    ) {
        return sectionIndex == 0 && initialFocusRequester != null
                ? initialFocusRequester
                : rememberedFocusRequester;
    }

    static Function0<Unit> exclusiveToggle(Object target, List<Object> allStates) {
        return () -> {
            boolean opening = !MorpheSettingsRows.booleanStateValue(target);
            for (Object state : allStates) {
                MorpheSettingsRows.setBooleanState(state, opening && state == target);
            }
            return Unit.INSTANCE;
        };
    }

    private static final class SectionState {
        final MorpheSettingsCategory category;
        final Object expanded;
        final Object focus;

        SectionState(MorpheSettingsCategory category, Object expanded, Object focus) {
            this.category = category;
            this.expanded = expanded;
            this.focus = focus;
        }
    }

    private static final class SectionList implements Function1<Object, Unit> {
        private final Object modifier;
        private final List<SectionState> sections;
        private final Object aboutExpanded;
        private final Object aboutFocus;

        SectionList(
                Object modifier,
                List<SectionState> sections,
                Object aboutExpanded,
                Object aboutFocus
        ) {
            this.modifier = modifier;
            this.sections = sections;
            this.aboutExpanded = aboutExpanded;
            this.aboutFocus = aboutFocus;
        }

        @Override
        public Unit invoke(Object lazyListScope) {
            List<Object> expansionStates = new ArrayList<>();
            for (SectionState section : sections) expansionStates.add(section.expanded);
            expansionStates.add(aboutExpanded);
            for (SectionState section : sections) {
                MorpheSettingsRows.lazyItem(
                        lazyListScope,
                        "morphe_" + section.category.id() + "_section",
                        new Section(modifier, section, expansionStates)
                );
            }
            MorpheSettingsRows.lazyItem(
                    lazyListScope,
                    ABOUT_SECTION_KEY,
                    new AboutSection(modifier, aboutExpanded, aboutFocus, expansionStates)
            );
            return Unit.INSTANCE;
        }
    }

    private static final class AboutSection implements Function3<Object, Object, Object, Unit> {
        private final Object modifier;
        private final Object expanded;
        private final Object focus;
        private final List<Object> expansionStates;

        AboutSection(Object modifier, Object expanded, Object focus, List<Object> expansionStates) {
            this.modifier = modifier;
            this.expanded = expanded;
            this.focus = focus;
            this.expansionStates = expansionStates;
        }

        @Override
        public Unit invoke(Object ignoredItemScope, Object composer, Object flags) {
            if (!MorpheSettingsRows.beginComposition(composer, flags)) return Unit.INSTANCE;
            MorpheSettingsRows.collapsibleSection(
                    composer,
                    "About",
                    "Morphe Patches information and project links",
                    MorpheSettingsRows.booleanStateValue(expanded),
                    exclusiveToggle(expanded, expansionStates),
                    focus,
                    NO_OP,
                    MorpheAboutSettingsContent.create(modifier)
            );
            return Unit.INSTANCE;
        }
    }

    private static final class Section implements Function3<Object, Object, Object, Unit> {
        private final Object modifier;
        private final SectionState section;
        private final List<Object> expansionStates;

        Section(Object modifier, SectionState section, List<Object> expansionStates) {
            this.modifier = modifier;
            this.section = section;
            this.expansionStates = expansionStates;
        }

        @Override
        public Unit invoke(Object ignoredItemScope, Object composer, Object flags) {
            if (!MorpheSettingsRows.beginComposition(composer, flags)) return Unit.INSTANCE;
            MorpheSettingsCategory category = section.category;
            MorpheSettingsRows.collapsibleSection(
                    composer,
                    category.title(),
                    category.description(),
                    MorpheSettingsRows.booleanStateValue(section.expanded),
                    exclusiveToggle(section.expanded, expansionStates),
                    section.focus,
                    NO_OP,
                    category.content(modifier)
            );
            return Unit.INSTANCE;
        }
    }
}
