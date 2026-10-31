package io.branch.search.internal;

import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.ad, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3067ad {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final long f63955a = System.currentTimeMillis();

    /* renamed from: io.branch.search.internal.ad$a */
    public static final class a {
        @JvmStatic
        @NotNull
        public static C3067ad a() {
            return new C3067ad();
        }
    }

    public final void a(@NotNull String sessionId, @NotNull I analyticalBufferRepository) throws JSONException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        long jCurrentTimeMillis = System.currentTimeMillis() - this.f63955a;
        JSONObject jSONObject = new JSONObject();
        jSONObject.putOpt("duration", Long.valueOf(jCurrentTimeMillis));
        analyticalBufferRepository.a(sessionId, "sdk_init_time", jSONObject, true);
    }
}
