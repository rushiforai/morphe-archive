package io.github.liongalahad.nuviotv.extension.ratings.ratingsvisibility;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsCategory;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

public final class RatingsSettingsCategory implements MorpheSettingsCategory {
    @Override public String id() { return "ratings"; }
    @Override public int order() { return 300; }
    @Override public String title() { return "Ratings"; }
    @Override public String description() { return "Configure rating visibility"; }
    @Override public Function3<Object, Object, Object, Unit> content(Object modifier) {
        return RatingsSettingsContent.create(modifier);
    }
}
