package io.branch.search.internal;

import io.branch.search.internal.services.storage.JobInfoRaw;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.k2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3225k2 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f64908a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f64909b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ JobInfoRaw f64910c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3225k2(String str, long j11, JobInfoRaw jobInfoRaw) {
        super(0);
        this.f64908a = str;
        this.f64909b = j11;
        this.f64910c = jobInfoRaw;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f64908a);
        sb2.append(" jobFinished new delay:");
        sb2.append(this.f64909b);
        sb2.append(" [minL:");
        sb2.append(this.f64910c.f65789c);
        sb2.append(", initialBack:");
        return a2.c.i(this.f64910c.f65793g, " ]", sb2);
    }
}
