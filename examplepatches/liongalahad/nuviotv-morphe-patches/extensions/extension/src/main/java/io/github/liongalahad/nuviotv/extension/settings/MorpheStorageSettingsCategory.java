package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Shared Playback settings contribution registered only by installed storage consumers. */
public final class MorpheStorageSettingsCategory implements MorpheSettingsCategory {
    @Override public String id() { return "playback"; }
    @Override public int order() { return 200; }
    @Override public int contentOrder() { return 110; }
    @Override public String title() { return "Playback"; }
    @Override public String description() { return "Configure playback patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return MorpheStorageSettingsContent.create(modifier);
    }
}
