package org.chromium.net.httpflags;

import defpackage.cz7;
import defpackage.ez7;
import java.util.Map;
import org.chromium.net.httpflags.BaseFeatureOverrides;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public interface BaseFeatureOverridesOrBuilder extends ez7 {
    boolean containsFeatureStates(String str);

    @Override // defpackage.ez7
    /* synthetic */ cz7 getDefaultInstanceForType();

    @Deprecated
    Map<String, BaseFeatureOverrides.FeatureState> getFeatureStates();

    int getFeatureStatesCount();

    Map<String, BaseFeatureOverrides.FeatureState> getFeatureStatesMap();

    BaseFeatureOverrides.FeatureState getFeatureStatesOrDefault(String str, BaseFeatureOverrides.FeatureState featureState);

    BaseFeatureOverrides.FeatureState getFeatureStatesOrThrow(String str);

    /* synthetic */ boolean isInitialized();
}
