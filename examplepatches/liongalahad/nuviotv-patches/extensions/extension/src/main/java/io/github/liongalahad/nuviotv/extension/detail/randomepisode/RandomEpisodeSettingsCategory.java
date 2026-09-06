package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Manifest-registered settings contribution owned by Random Episode. */
public final class RandomEpisodeSettingsCategory implements MorpheSettingsCategory {
    { PatchTranslations.register(); }
    @Override public String id() { return "detail_page"; }
    @Override public int order() { return 100; }
    @Override public String title() { return "Detail Page"; }
    @Override public String description() { return "Configure detail page patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return RandomEpisodeSettingsContent.create(modifier);
    }
}
