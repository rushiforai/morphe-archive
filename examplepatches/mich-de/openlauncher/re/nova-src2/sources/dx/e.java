package dx;

/* loaded from: classes4.dex */
public final class e implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f49695a;

    public e(String str) {
        this.f49695a = str;
        if (r70.k.U0("rewarded#video")) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (r70.k.U0(str)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }

    @Override // dx.f
    public final String a() {
        return "rewarded#video";
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && this.f49695a.equals(((e) obj).f49695a);
    }

    public final int hashCode() {
        return this.f49695a.hashCode() - 1044955910;
    }

    public final String toString() {
        return b.c0.l("Rewarded(candidateId=rewarded#video, adUnitId=", this.f49695a, ")");
    }
}
