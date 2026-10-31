package kotlin;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.jvm.internal.Intrinsics;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0002\b\u0002\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/KotlinVersion;", b.f42142b, k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class KotlinVersion implements Comparable<KotlinVersion> {

    /* renamed from: e, reason: collision with root package name */
    public static final KotlinVersion f71674e;

    /* renamed from: a, reason: collision with root package name */
    public final int f71675a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71676b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71677c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71678d;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\b"}, d2 = {"Lkotlin/KotlinVersion$Companion;", b.f42142b, "<init>", "()V", "MAX_COMPONENT_VALUE", b.f42142b, "CURRENT", "Lkotlin/KotlinVersion;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    static {
        new Companion(0);
        f71674e = new KotlinVersion(2, 1, 10);
    }

    public KotlinVersion(int i5, int i11, int i12) {
        this.f71675a = i5;
        this.f71676b = i11;
        this.f71677c = i12;
        if (i5 >= 0 && i5 < 256 && i11 >= 0 && i11 < 256 && i12 >= 0 && i12 < 256) {
            this.f71678d = (i5 << 16) + (i11 << 8) + i12;
            return;
        }
        throw new IllegalArgumentException(("Version components are out of range: " + i5 + '.' + i11 + '.' + i12).toString());
    }

    @Override // java.lang.Comparable
    public final int compareTo(KotlinVersion kotlinVersion) {
        KotlinVersion other = kotlinVersion;
        Intrinsics.g(other, "other");
        return this.f71678d - other.f71678d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        KotlinVersion kotlinVersion = obj instanceof KotlinVersion ? (KotlinVersion) obj : null;
        return kotlinVersion != null && this.f71678d == kotlinVersion.f71678d;
    }

    /* renamed from: hashCode, reason: from getter */
    public final int getF71678d() {
        return this.f71678d;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f71675a);
        sb2.append('.');
        sb2.append(this.f71676b);
        sb2.append('.');
        sb2.append(this.f71677c);
        return sb2.toString();
    }
}
