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
        MorpheSettingsRows.lazyColumn(modifier, composer, new SectionList(modifier, sections));
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

        SectionList(Object modifier, List<SectionState> sections) {
            this.modifier = modifier;
            this.sections = sections;
        }

        @Override
        public Unit invoke(Object lazyListScope) {
            for (SectionState section : sections) {
                MorpheSettingsRows.lazyItem(
                        lazyListScope,
                        "morphe_" + section.category.id() + "_section",
                        new Section(modifier, section)
                );
            }
            return Unit.INSTANCE;
        }
    }

    private static final class Section implements Function3<Object, Object, Object, Unit> {
        private final Object modifier;
        private final SectionState section;

        Section(Object modifier, SectionState section) {
            this.modifier = modifier;
            this.section = section;
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
                    MorpheSettingsRows.booleanStateToggle(section.expanded),
                    section.focus,
                    NO_OP,
                    category.content(modifier)
            );
            return Unit.INSTANCE;
        }
    }
}
