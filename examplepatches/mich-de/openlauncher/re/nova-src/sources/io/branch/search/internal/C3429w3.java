package io.branch.search.internal;

import android.app.job.JobParameters;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.w3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3429w3 implements Cd {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final int f66205a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f66206b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final JobParameters f66207c;

    /* renamed from: io.branch.search.internal.w3$a */
    public static final class a {
        @NotNull
        public static C3429w3 a(@NotNull JobParameters jobParameters) {
            Intrinsics.g(jobParameters, "jobParameters");
            return new C3429w3(jobParameters.getJobId(), jobParameters.getExtras().getBoolean("WAKE_LOCKS", true), jobParameters);
        }
    }

    public C3429w3(int i5, boolean z11, @Nullable JobParameters jobParameters) {
        this.f66205a = i5;
        this.f66206b = z11;
        this.f66207c = jobParameters;
    }

    @Override // io.branch.search.internal.Cd
    public final boolean a() {
        return this.f66206b;
    }

    @Override // io.branch.search.internal.Cd
    public final int b() {
        return this.f66205a;
    }

    @Override // io.branch.search.internal.Cd
    @Nullable
    public final JobParameters c() {
        return this.f66207c;
    }
}
