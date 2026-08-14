package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import io.github.liongalahad.nuviotv.extension.settings.MorpheStorageConsumers;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Settings category contribution owned by Local Downloads. */
public final class LocalDownloadsSettingsCategory implements MorpheSettingsCategory {
    public LocalDownloadsSettingsCategory() {
        MorpheStorageConsumers.register(
                "playback.local_downloads",
                LocalDownloadsSettings::isEnabled
        );
    }
    @Override public String id() { return "playback"; }
    @Override public int order() { return 200; }
    @Override public int contentOrder() { return 90; }
    @Override public String title() { return "Playback"; }
    @Override public String description() { return "Configure playback patch settings"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return LocalDownloadsSettingsContent.create(modifier);
    }
}
