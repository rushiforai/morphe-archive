package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.pc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3320pc extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f65485a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3320pc(String str) {
        super(0);
        this.f65485a = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Invalid idHash: " + this.f65485a;
    }
}
