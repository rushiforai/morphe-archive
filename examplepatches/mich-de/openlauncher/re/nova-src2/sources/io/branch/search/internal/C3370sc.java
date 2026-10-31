package io.branch.search.internal;

import io.branch.engage.sesame_lite.internal.DataImporters;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.sc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3370sc extends Lambda implements Function0<DataImporters> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3269mc f65770a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3370sc(C3269mc c3269mc) {
        super(0);
        this.f65770a = c3269mc;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws Exception {
        if (((Boolean) this.f65770a.f65157d.getValue()).booleanValue()) {
            return ((u40.h) this.f65770a.f65159f.getValue()).getIngester();
        }
        throw new Exception("SSML not initialized");
    }
}
