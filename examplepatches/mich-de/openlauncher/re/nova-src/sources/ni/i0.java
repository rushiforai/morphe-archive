package ni;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class i0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f78280a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f78281b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f78282c;

    public i0(boolean z11, boolean z12, boolean z13) {
        this.f78280a = z11;
        this.f78281b = z12;
        this.f78282c = z13;
    }

    public final boolean a() {
        return this.f78282c;
    }

    public final boolean b() {
        return this.f78281b;
    }

    public final boolean c() {
        return this.f78280a;
    }

    public final int hashCode() {
        return Objects.hash(Boolean.valueOf(this.f78280a), Boolean.valueOf(this.f78281b), Boolean.valueOf(this.f78282c));
    }
}
