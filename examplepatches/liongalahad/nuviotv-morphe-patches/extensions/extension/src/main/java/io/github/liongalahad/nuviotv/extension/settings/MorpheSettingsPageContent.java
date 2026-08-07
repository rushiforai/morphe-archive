package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/** Native Layout-style scrollable category list for the shared Morphe settings page. */
@SuppressWarnings("unused")
public final class MorpheSettingsPageContent implements Function3<Object, Object, Object, Unit> {
    private static final Function0<Unit> NO_OP = () -> Unit.INSTANCE;

    private final Object modifier;

    private MorpheSettingsPageContent(Object modifier) {
        this.modifier = modifier;
    }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new MorpheSettingsPageContent(modifier);
    }

    @Override
    public Unit invoke(Object ignoredScope, Object composer, Object flags) {
        if (!MorpheSettingsRows.beginComposition(composer, flags)) return Unit.INSTANCE;

        Object refreshState = MorpheSettingsRows.rememberBooleanState(composer, false);
        MorpheSettingsRows.booleanStateValue(refreshState);
        MorpheComposeModeAction.captureRefreshAction(
                MorpheSettingsRows.booleanStateToggle(refreshState)
        );
        Object ratingsExpanded = MorpheSettingsRuntime.hasRatingsCategory()
                ? MorpheSettingsRows.rememberBooleanState(composer, false)
                : null;
        Object ratingsFocus = ratingsExpanded != null
                ? MorpheSettingsRows.rememberFocusRequester(composer)
                : null;
        Object subtitlesExpanded = MorpheSettingsRuntime.hasSubtitlesCategory()
                ? MorpheSettingsRows.rememberBooleanState(composer, false)
                : null;
        Object subtitlesFocus = subtitlesExpanded != null
                ? MorpheSettingsRows.rememberFocusRequester(composer)
                : null;
        MorpheSettingsRows.lazyColumn(
                modifier,
                composer,
                new SectionList(
                        modifier,
                        ratingsExpanded,
                        ratingsFocus,
                        subtitlesExpanded,
                        subtitlesFocus
                )
        );
        return Unit.INSTANCE;
    }

    private static final class SectionList implements Function1<Object, Unit> {
        private final Object modifier;
        private final Object ratingsExpanded;
        private final Object ratingsFocus;
        private final Object subtitlesExpanded;
        private final Object subtitlesFocus;

        SectionList(
                Object modifier,
                Object ratingsExpanded,
                Object ratingsFocus,
                Object subtitlesExpanded,
                Object subtitlesFocus
        ) {
            this.modifier = modifier;
            this.ratingsExpanded = ratingsExpanded;
            this.ratingsFocus = ratingsFocus;
            this.subtitlesExpanded = subtitlesExpanded;
            this.subtitlesFocus = subtitlesFocus;
        }

        @Override
        public Unit invoke(Object lazyListScope) {
            if (ratingsExpanded != null) {
                MorpheSettingsRows.lazyItem(
                        lazyListScope,
                        "morphe_ratings_section",
                        new Section(true, ratingsFocus, modifier, ratingsExpanded)
                );
            }
            if (subtitlesExpanded != null) {
                MorpheSettingsRows.lazyItem(
                        lazyListScope,
                        "morphe_subtitles_section",
                        new Section(false, subtitlesFocus, modifier, subtitlesExpanded)
                );
            }
            return Unit.INSTANCE;
        }
    }

    private static final class Section implements Function3<Object, Object, Object, Unit> {
        private final boolean ratings;
        private final Object focusRequester;
        private final Object modifier;
        private final Object expandedState;

        Section(boolean ratings, Object focusRequester, Object modifier, Object expandedState) {
            this.ratings = ratings;
            this.focusRequester = focusRequester;
            this.modifier = modifier;
            this.expandedState = expandedState;
        }

        @Override
        public Unit invoke(Object ignoredItemScope, Object composer, Object flags) {
            if (!MorpheSettingsRows.beginComposition(composer, flags)) return Unit.INSTANCE;
            MorpheSettingsRows.collapsibleSection(
                    composer,
                    ratings ? MorpheSettingsRuntime.ratingsCategoryTitle()
                            : MorpheSettingsRuntime.subtitlesCategoryTitle(),
                    ratings ? MorpheSettingsRuntime.ratingsCategoryDescription()
                            : MorpheSettingsRuntime.subtitlesCategoryDescription(),
                    MorpheSettingsRows.booleanStateValue(expandedState),
                    MorpheSettingsRows.booleanStateToggle(expandedState),
                    focusRequester,
                    NO_OP,
                    ratings ? MorpheRatingsGroupContent.create(modifier)
                            : MorpheSubtitlesGroupContent.create(modifier)
            );
            return Unit.INSTANCE;
        }
    }
}
