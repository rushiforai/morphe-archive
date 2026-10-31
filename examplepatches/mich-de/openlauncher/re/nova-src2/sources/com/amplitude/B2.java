package com.amplitude;

import com.google.gson.JsonSyntaxException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class B2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ JsonSyntaxException f20187a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public B2(JsonSyntaxException jsonSyntaxException) {
        super(0);
        this.f20187a = jsonSyntaxException;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("Error parsing remote config: ", this.f20187a.getMessage());
    }
}
