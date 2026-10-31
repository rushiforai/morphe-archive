package io.branch.search.internal;

import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class E5 {

    public static final class a extends E5 {

        /* renamed from: a, reason: collision with root package name */
        public final int f62395a;

        /* renamed from: b, reason: collision with root package name */
        public final long f62396b;

        public a(long j11, int i5) {
            super(0);
            this.f62395a = i5;
            this.f62396b = j11;
        }

        @Override // io.branch.search.internal.E5
        @NotNull
        public final Map<String, Object> a() {
            return MapsKt.j0(new Pair("adv", Integer.valueOf(this.f62395a)), new Pair("param_type", "ad_id"), new Pair("instr_ts", Long.valueOf(this.f62396b)));
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            return this.f62395a == aVar.f62395a && this.f62396b == aVar.f62396b;
        }

        public final int hashCode() {
            return Long.hashCode(this.f62396b) + (Integer.hashCode(this.f62395a) * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AdId(adId=");
            sb2.append(this.f62395a);
            sb2.append(", timestamp=");
            return C3380t5.a(sb2, this.f62396b, ')');
        }
    }

    public static final class b extends E5 {

        /* renamed from: a, reason: collision with root package name */
        public final int f62397a;

        /* renamed from: b, reason: collision with root package name */
        public final long f62398b;

        public b(long j11, int i5) {
            super(0);
            this.f62397a = i5;
            this.f62398b = j11;
        }

        @Override // io.branch.search.internal.E5
        @NotNull
        public final Map<String, Object> a() {
            return MapsKt.j0(new Pair("adv", Integer.valueOf(this.f62397a)), new Pair("param_type", "campaign_id"), new Pair("instr_ts", Long.valueOf(this.f62398b)));
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return this.f62397a == bVar.f62397a && this.f62398b == bVar.f62398b;
        }

        public final int hashCode() {
            return Long.hashCode(this.f62398b) + (Integer.hashCode(this.f62397a) * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("CampaignId(campaignId=");
            sb2.append(this.f62397a);
            sb2.append(", timestamp=");
            return C3380t5.a(sb2, this.f62398b, ')');
        }
    }

    public static final class c extends E5 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f62399a;

        /* renamed from: b, reason: collision with root package name */
        public final long f62400b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(@NotNull String appName, long j11) {
            super(0);
            Intrinsics.g(appName, "appName");
            this.f62399a = appName;
            this.f62400b = j11;
        }

        @Override // io.branch.search.internal.E5
        @NotNull
        public final Map<String, Object> a() {
            return MapsKt.j0(new Pair("adv", this.f62399a), new Pair("param_type", "appname"), new Pair("instr_ts", Long.valueOf(this.f62400b)));
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof c)) {
                return false;
            }
            c cVar = (c) obj;
            return Intrinsics.b(this.f62399a, cVar.f62399a) && this.f62400b == cVar.f62400b;
        }

        public final int hashCode() {
            return Long.hashCode(this.f62400b) + (this.f62399a.hashCode() * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("DemoAppName(appName=");
            sb2.append(this.f62399a);
            sb2.append(", timestamp=");
            return C3380t5.a(sb2, this.f62400b, ')');
        }
    }

    public static final class d extends E5 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f62401a;

        /* renamed from: b, reason: collision with root package name */
        public final long f62402b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(@NotNull String pkg, long j11) {
            super(0);
            Intrinsics.g(pkg, "pkg");
            this.f62401a = pkg;
            this.f62402b = j11;
        }

        @Override // io.branch.search.internal.E5
        @NotNull
        public final Map<String, Object> a() {
            return MapsKt.j0(new Pair("adv", this.f62401a), new Pair("param_type", "pkg"), new Pair("instr_ts", Long.valueOf(this.f62402b)));
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof d)) {
                return false;
            }
            d dVar = (d) obj;
            return Intrinsics.b(this.f62401a, dVar.f62401a) && this.f62402b == dVar.f62402b;
        }

        public final int hashCode() {
            return Long.hashCode(this.f62402b) + (this.f62401a.hashCode() * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("DemoPackage(pkg=");
            sb2.append(this.f62401a);
            sb2.append(", timestamp=");
            return C3380t5.a(sb2, this.f62402b, ')');
        }
    }

    public E5() {
    }

    @NotNull
    public abstract Map<String, Object> a();

    public /* synthetic */ E5(int i5) {
        this();
    }
}
