package com.vungle.ads.internal.network.converters;

import com.vungle.ads.internal.network.j;
import java.io.IOException;
import java.io.InputStream;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KType;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;
import kotlinx.serialization.json.JvmStreamsKt;

/* loaded from: classes4.dex */
public final class d implements a {

    /* renamed from: b, reason: collision with root package name */
    public static final Json f47230b = JsonKt.Json$default(null, c.f47229a, 1, null);

    /* renamed from: a, reason: collision with root package name */
    public final KType f47231a;

    public d(KType kType) {
        Intrinsics.g(kType, "kType");
        this.f47231a = kType;
    }

    @Override // com.vungle.ads.internal.network.converters.a
    public final Object a(j jVar) throws IOException {
        try {
            InputStream inputStreamByteStream = jVar.byteStream();
            if (inputStreamByteStream == null) {
                jVar.close();
                return null;
            }
            Object objDecodeFromStream = JvmStreamsKt.decodeFromStream(f47230b, SerializersKt.serializer(Json.INSTANCE.getSerializersModule(), this.f47231a), inputStreamByteStream);
            jVar.close();
            return objDecodeFromStream;
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(jVar, th2);
                throw th3;
            }
        }
    }
}
