package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Generic boundary implemented independently by configurable patch compartments. */
public interface MorpheSettingsCategory {
    String id();
    int order();
    default int contentOrder() { return 0; }
    String title();
    String description();
    Function3<Object, Object, Object, Unit> content(Object modifier);
}
