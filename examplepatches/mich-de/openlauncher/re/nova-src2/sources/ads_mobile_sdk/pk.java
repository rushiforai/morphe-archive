package ads_mobile_sdk;

import b.k9;
import b.u1;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class pk implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f8287a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f8288b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f8289c;

    /* renamed from: d, reason: collision with root package name */
    public final int f8290d;

    /* renamed from: e, reason: collision with root package name */
    public final Pair f8291e;

    /* renamed from: f, reason: collision with root package name */
    public final int f8292f;

    /* renamed from: g, reason: collision with root package name */
    public final int f8293g;

    /* renamed from: h, reason: collision with root package name */
    public final float f8294h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f8295i;

    /* renamed from: j, reason: collision with root package name */
    public final Double f8296j;

    public pk(int i5, boolean z11, boolean z12, int i11, Pair pair, int i12, int i13, float f11, boolean z13, Double d5) {
        this.f8287a = i5;
        this.f8288b = z11;
        this.f8289c = z12;
        this.f8290d = i11;
        this.f8291e = pair;
        this.f8292f = i12;
        this.f8293g = i13;
        this.f8294h = f11;
        this.f8295i = z13;
        this.f8296j = d5;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.audioMode = this.f8287a;
        signals.isMusicActive = this.f8288b;
        signals.isSpeakerPhoneOn = this.f8289c;
        signals.musicVolume = this.f8290d;
        Pair pair = this.f8291e;
        if (pair != null) {
            signals.minMusicVolume = (Integer) pair.f71683a;
            signals.maxMusicVolume = (Integer) pair.f71684b;
        }
        signals.ringerMode = this.f8292f;
        signals.ringerVolume = this.f8293g;
        signals.appVolume = this.f8294h;
        signals.isAppMuted = this.f8295i;
        signals.musicVolumePercent = this.f8296j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pk)) {
            return false;
        }
        pk pkVar = (pk) obj;
        return this.f8287a == pkVar.f8287a && this.f8288b == pkVar.f8288b && this.f8289c == pkVar.f8289c && this.f8290d == pkVar.f8290d && Intrinsics.b(this.f8291e, pkVar.f8291e) && this.f8292f == pkVar.f8292f && this.f8293g == pkVar.f8293g && Float.compare(this.f8294h, pkVar.f8294h) == 0 && this.f8295i == pkVar.f8295i && Intrinsics.b(this.f8296j, pkVar.f8296j);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f8287a) * 31;
        boolean z11 = this.f8288b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        boolean z12 = this.f8289c;
        int i12 = z12;
        if (z12 != 0) {
            i12 = 1;
        }
        int iB = k9.b(this.f8290d, (i11 + i12) * 31);
        Pair pair = this.f8291e;
        int iD = a80.m.d(this.f8294h, k9.b(this.f8293g, k9.b(this.f8292f, (iB + (pair == null ? 0 : pair.hashCode())) * 31)), 31);
        boolean z13 = this.f8295i;
        int i13 = (iD + (z13 ? 1 : z13 ? 1 : 0)) * 31;
        Double d5 = this.f8296j;
        return i13 + (d5 != null ? d5.hashCode() : 0);
    }

    public final String toString() {
        return "AudioSignal(audioMode=" + this.f8287a + ", isMusicActive=" + this.f8288b + ", isSpeakerPhoneOn=" + this.f8289c + ", musicVolume=" + this.f8290d + ", minMaxMusicVolume=" + this.f8291e + ", ringerMode=" + this.f8292f + ", ringerVolume=" + this.f8293g + ", appVolume=" + this.f8294h + ", isAppMuted=" + this.f8295i + ", musicVolumePercent=" + this.f8296j + ")";
    }
}
