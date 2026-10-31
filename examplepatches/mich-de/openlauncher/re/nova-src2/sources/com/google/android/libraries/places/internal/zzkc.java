package com.google.android.libraries.places.internal;

import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzkc extends LinkedHashMap {
    public zzkc(int i5, float f11, boolean z11) {
        super(16, 0.75f, true);
    }

    @Override // java.util.LinkedHashMap
    public final boolean removeEldestEntry(Map.Entry entry) {
        return size() > 10;
    }
}
