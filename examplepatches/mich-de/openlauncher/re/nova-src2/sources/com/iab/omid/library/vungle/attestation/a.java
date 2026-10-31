package com.iab.omid.library.vungle.attestation;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public class a {

    /* renamed from: a, reason: collision with root package name */
    private final Map<String, String> f35160a;

    public a(Map<String, String> map) {
        this.f35160a = map == null ? Collections.EMPTY_MAP : Collections.unmodifiableMap(new HashMap(map));
    }

    public Map<String, String> a() {
        return this.f35160a;
    }
}
