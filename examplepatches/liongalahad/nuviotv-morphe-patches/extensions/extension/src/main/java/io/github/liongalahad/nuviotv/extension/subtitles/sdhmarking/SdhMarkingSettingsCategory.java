package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

public final class SdhMarkingSettingsCategory implements MorpheSettingsCategory {
    @Override public String id() { return "subtitles"; }
    @Override public int order() { return 400; }
    @Override public int contentOrder() { return 200; }
    @Override public String title() { return "Subtitles"; }
    @Override public String description() { return "Configure subtitle patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return SdhMarkingSettingsContent.create(modifier);
    }
}
