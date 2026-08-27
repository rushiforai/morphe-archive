package io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Manifest-registered Playback contribution owned by Restore Source Selection. */
public final class SourceSelectionRestoreSettingsCategory implements MorpheSettingsCategory {
    @Override public String id() { return "playback"; }
    @Override public int order() { return 200; }
    @Override public int contentOrder() { return 80; }
    @Override public String title() { return "Playback"; }
    @Override public String description() { return "Configure playback patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return SourceSelectionRestoreSettingsContent.create(modifier);
    }
}
