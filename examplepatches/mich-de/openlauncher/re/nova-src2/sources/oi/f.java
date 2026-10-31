package oi;

import android.os.Bundle;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import ni.k;

/* loaded from: classes3.dex */
public final class f extends k implements h {

    /* renamed from: j, reason: collision with root package name */
    public final d f80450j;

    /* renamed from: k, reason: collision with root package name */
    public final ni.b f80451k;

    /* renamed from: l, reason: collision with root package name */
    public final String f80452l;

    public f(String str, LinkedHashSet linkedHashSet, String str2, LinkedHashMap linkedHashMap, Bundle bundle, HashSet hashSet, HashSet hashSet2, LinkedHashMap linkedHashMap2, String str3, d dVar, ni.b bVar, String str4) {
        super(str, linkedHashSet, str2, linkedHashMap, bundle, hashSet, hashSet2, linkedHashMap2, str3);
        this.f80450j = dVar;
        this.f80451k = bVar;
        this.f80452l = str4;
    }

    public final ni.b e() {
        return this.f80451k;
    }

    public final String m() {
        return this.f80452l;
    }

    public final d n() {
        return this.f80450j;
    }
}
