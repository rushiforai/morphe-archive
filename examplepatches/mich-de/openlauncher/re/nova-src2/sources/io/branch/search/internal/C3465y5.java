package io.branch.search.internal;

import android.app.job.JobParameters;
import io.branch.search.internal.services.storage.ExtraValue;
import io.branch.search.internal.services.storage.JobInfoRaw;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.y5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3465y5 implements Cd {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final int f66307a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f66308b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final JobParameters f66309c;

    public C3465y5(int i5, boolean z11, @Nullable JobParameters jobParameters) {
        this.f66307a = i5;
        this.f66308b = z11;
        this.f66309c = jobParameters;
    }

    @Override // io.branch.search.internal.Cd
    public final boolean a() {
        return this.f66308b;
    }

    @Override // io.branch.search.internal.Cd
    public final int b() {
        return this.f66307a;
    }

    @Override // io.branch.search.internal.Cd
    @Nullable
    public final JobParameters c() {
        return this.f66309c;
    }

    /* renamed from: io.branch.search.internal.y5$a */
    public static final class a {
        @NotNull
        public static C3465y5 a(@NotNull JobParameters jobParameters) {
            Intrinsics.g(jobParameters, "jobParameters");
            return new C3465y5(jobParameters.getJobId(), jobParameters.getExtras().getBoolean("WAKE_LOCKS", true), jobParameters);
        }

        @NotNull
        public static C3465y5 a(@NotNull JobInfoRaw jobInfoRaw) {
            Object next;
            Intrinsics.g(jobInfoRaw, "jobInfoRaw");
            int i5 = jobInfoRaw.f65787a;
            Iterator<T> it = jobInfoRaw.f65796j.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((ExtraValue) next).getF65784a(), "WAKE_LOCKS")) {
                    break;
                }
            }
            ExtraValue extraValue = (ExtraValue) next;
            return new C3465y5(i5, extraValue != null ? ((ExtraValue.BooleanValue) extraValue).f65778b : true, null);
        }
    }
}
