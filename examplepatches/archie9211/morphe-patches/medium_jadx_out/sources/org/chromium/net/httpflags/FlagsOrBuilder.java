package org.chromium.net.httpflags;

import defpackage.cz7;
import defpackage.ez7;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public interface FlagsOrBuilder extends ez7 {
    boolean containsFlags(String str);

    @Override // defpackage.ez7
    /* synthetic */ cz7 getDefaultInstanceForType();

    @Deprecated
    Map<String, FlagValue> getFlags();

    int getFlagsCount();

    Map<String, FlagValue> getFlagsMap();

    FlagValue getFlagsOrDefault(String str, FlagValue flagValue);

    FlagValue getFlagsOrThrow(String str);

    /* synthetic */ boolean isInitialized();
}
