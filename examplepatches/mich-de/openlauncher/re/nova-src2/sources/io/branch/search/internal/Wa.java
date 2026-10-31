package io.branch.search.internal;

import android.app.job.JobParameters;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Wa implements Cd {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final int f63592a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f63593b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final JobParameters f63594c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f63595d;

    public static final class a {
        @NotNull
        public static Wa a(@NotNull JobParameters jobParameters) {
            Intrinsics.g(jobParameters, "jobParameters");
            return new Wa(jobParameters.getJobId(), jobParameters.getExtras().getBoolean("WAKE_LOCKS", true), jobParameters, jobParameters.getExtras().getString("PING_PARAMS"));
        }
    }

    public Wa(int i5, boolean z11, @Nullable JobParameters jobParameters, @Nullable String str) {
        this.f63592a = i5;
        this.f63593b = z11;
        this.f63594c = jobParameters;
        this.f63595d = str;
    }

    @Override // io.branch.search.internal.Cd
    public final boolean a() {
        return this.f63593b;
    }

    @Override // io.branch.search.internal.Cd
    public final int b() {
        return this.f63592a;
    }

    @Override // io.branch.search.internal.Cd
    @Nullable
    public final JobParameters c() {
        return this.f63594c;
    }
}
