package com.music.bitchord.data.sources;

import kotlinx.coroutines.flow.*;

import java.util.*;

public final class SourceRegistry {
    public static final MutableStateFlow<List<SourceConfig>> configs =
            StateFlowKt.MutableStateFlow(new ArrayList<SourceConfig>());
    public static int publications;

    public static void publish(ArrayList<SourceConfig> next, boolean persist) {
        if (!persist) throw new AssertionError("Registry writes should persist");
        publications++;
        configs.setValue(next);
    }
}
