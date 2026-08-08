package io.github.liongalahad.nuviotv.extension.playback.bingenextepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Manifest-registered settings contribution owned by this playback patch. */
public final class BingeGroupManualFallbackSettingsCategory implements MorpheSettingsCategory {
    @Override public String id() { return "playback"; }
    @Override public int order() { return 200; }
    @Override public String title() { return "Playback"; }
    @Override public String description() { return "Configure playback patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return BingeGroupManualFallbackSettingsContent.create(modifier);
    }
}
