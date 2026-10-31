package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f30416a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public Map f30417b;

    public final synchronized Map a() {
        try {
            if (this.f30417b == null) {
                this.f30417b = Collections.unmodifiableMap(new HashMap(this.f30416a));
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.f30417b;
    }
}
