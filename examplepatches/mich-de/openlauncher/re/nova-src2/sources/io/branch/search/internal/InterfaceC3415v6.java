package io.branch.search.internal;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3415v6 {

    /* renamed from: io.branch.search.internal.v6$a */
    public static final class a implements InterfaceC3415v6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final Map<String, String> f66170a;

        public a(@NotNull LinkedHashMap map) {
            Intrinsics.g(map, "map");
            this.f66170a = map;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f66170a, ((a) obj).f66170a);
        }

        public final int hashCode() {
            return this.f66170a.hashCode();
        }

        @NotNull
        public final String toString() {
            return b.c9.l(new StringBuilder("ArbitraryMap(map="), this.f66170a, ')');
        }
    }

    /* renamed from: io.branch.search.internal.v6$b */
    public static final class b implements InterfaceC3415v6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final Set<String> f66171a;

        public b(@NotNull Set<String> container) {
            Intrinsics.g(container, "container");
            this.f66171a = container;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && Intrinsics.b(this.f66171a, ((b) obj).f66171a);
        }

        public final int hashCode() {
            return this.f66171a.hashCode();
        }

        @NotNull
        public final String toString() {
            return "Containers(container=" + this.f66171a + ')';
        }
    }

    /* renamed from: io.branch.search.internal.v6$c */
    public static final class c implements InterfaceC3415v6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f66172a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f66173b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f66174c;

        public c(@NotNull String lcsExperimentId, @NotNull String cohortId, @NotNull String experimentIds) {
            Intrinsics.g(lcsExperimentId, "lcsExperimentId");
            Intrinsics.g(cohortId, "cohortId");
            Intrinsics.g(experimentIds, "experimentIds");
            this.f66172a = lcsExperimentId;
            this.f66173b = cohortId;
            this.f66174c = experimentIds;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof c)) {
                return false;
            }
            c cVar = (c) obj;
            return Intrinsics.b(this.f66172a, cVar.f66172a) && Intrinsics.b(this.f66173b, cVar.f66173b) && Intrinsics.b(this.f66174c, cVar.f66174c);
        }

        public final int hashCode() {
            return this.f66174c.hashCode() + C3248l8.a(this.f66173b, this.f66172a.hashCode() * 31, 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("SqlAds(lcsExperimentId=");
            sb2.append(this.f66172a);
            sb2.append(", cohortId=");
            sb2.append(this.f66173b);
            sb2.append(", experimentIds=");
            return Z.a(sb2, this.f66174c, ')');
        }
    }
}
