package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Settings category owned exclusively by Local Media. */
public final class LocalMediaSettingsCategory implements MorpheSettingsCategory {
    @Override public String id() { return "playback"; }
    @Override public int order() { return 200; }
    @Override public int contentOrder() { return 100; }
    @Override public String title() { return "Playback"; }
    @Override public String description() { return "Configure playback patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return LocalMediaSettingsContent.create(modifier);
    }
}
