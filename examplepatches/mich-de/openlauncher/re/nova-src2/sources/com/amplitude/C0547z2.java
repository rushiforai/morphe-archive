package com.amplitude;

import com.google.gson.JsonSyntaxException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.z2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0547z2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ JsonSyntaxException f20835a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0547z2(JsonSyntaxException jsonSyntaxException) {
        super(0);
        this.f20835a = jsonSyntaxException;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("Error parsing remote config from storage: ", this.f20835a.getMessage());
    }
}
