package org.chromium.net.httpflags;

import defpackage.cz7;
import defpackage.ez7;
import java.util.List;
import org.chromium.net.httpflags.FlagValue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public interface FlagValueOrBuilder extends ez7 {
    FlagValue.ConstrainedValue getConstrainedValues(int i);

    int getConstrainedValuesCount();

    List<FlagValue.ConstrainedValue> getConstrainedValuesList();

    @Override // defpackage.ez7
    /* synthetic */ cz7 getDefaultInstanceForType();

    /* synthetic */ boolean isInitialized();
}
