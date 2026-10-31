package io.branch.search.internal;

import io.branch.search.internal.services.storage.JobInfoRaw;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.j2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3208j2 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ JobInfoRaw f64864a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f64865b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f64866c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3208j2(JobInfoRaw jobInfoRaw, boolean z11, long j11) {
        super(0);
        this.f64864a = jobInfoRaw;
        this.f64865b = z11;
        this.f64866c = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        String string;
        StringBuilder sb2 = new StringBuilder("checking job ");
        sb2.append(this.f64864a.f65787a);
        if (this.f64865b) {
            string = " is due";
        } else {
            StringBuilder sb3 = new StringBuilder(" due in ");
            JobInfoRaw.Companion companion = JobInfoRaw.INSTANCE;
            long j11 = this.f64864a.f65788b - this.f64866c;
            companion.getClass();
            sb3.append(JobInfoRaw.Companion.a(j11));
            string = sb3.toString();
        }
        sb2.append(string);
        return sb2.toString();
    }
}
