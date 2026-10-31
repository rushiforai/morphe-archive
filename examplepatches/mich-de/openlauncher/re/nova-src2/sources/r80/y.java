package r80;

import android.net.Uri;
import b.c0;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.IdHash;

/* loaded from: classes5.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final IdHash f85732a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85733b;

    /* renamed from: c, reason: collision with root package name */
    public final long f85734c;

    /* renamed from: d, reason: collision with root package name */
    public final d f85735d;

    /* renamed from: e, reason: collision with root package name */
    public final String f85736e;

    /* renamed from: f, reason: collision with root package name */
    public final Uri f85737f;

    /* renamed from: g, reason: collision with root package name */
    public final long[] f85738g;

    /* renamed from: h, reason: collision with root package name */
    public final long[] f85739h;

    /* renamed from: i, reason: collision with root package name */
    public final w f85740i;

    public y(IdHash idHash, String str, long j11, d type, String label, Uri uri, long[] jArr, long[] jArr2, w wVar) {
        Intrinsics.g(idHash, "idHash");
        Intrinsics.g(type, "type");
        Intrinsics.g(label, "label");
        this.f85732a = idHash;
        this.f85733b = str;
        this.f85734c = j11;
        this.f85735d = type;
        this.f85736e = label;
        this.f85737f = uri;
        this.f85738g = jArr;
        this.f85739h = jArr2;
        this.f85740i = wVar;
    }

    public final Uri a() {
        return this.f85737f;
    }

    public final IdHash b() {
        return this.f85732a;
    }

    public final String c() {
        return this.f85736e;
    }

    public final w d() {
        return this.f85740i;
    }

    public final String e() {
        return this.f85733b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y)) {
            return false;
        }
        y yVar = (y) obj;
        return Intrinsics.b(this.f85732a, yVar.f85732a) && Intrinsics.b(this.f85733b, yVar.f85733b) && this.f85734c == yVar.f85734c && this.f85735d == yVar.f85735d && Intrinsics.b(this.f85736e, yVar.f85736e) && Intrinsics.b(this.f85737f, yVar.f85737f) && Intrinsics.b(this.f85738g, yVar.f85738g) && Intrinsics.b(this.f85739h, yVar.f85739h) && Intrinsics.b(this.f85740i, yVar.f85740i);
    }

    public final d f() {
        return this.f85735d;
    }

    public final long g() {
        return this.f85734c;
    }

    public final int hashCode() {
        int iHashCode = this.f85732a.hashCode() * 31;
        String str = this.f85733b;
        int iA = io.branch.engage.sesame_lite.internal.a.a(this.f85736e, (this.f85735d.hashCode() + c0.d((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f85734c)) * 31, 31);
        Uri uri = this.f85737f;
        return this.f85740i.hashCode() + ((Arrays.hashCode(this.f85739h) + ((Arrays.hashCode(this.f85738g) + ((iA + (uri != null ? uri.hashCode() : 0)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String string = Arrays.toString(this.f85738g);
        String string2 = Arrays.toString(this.f85739h);
        StringBuilder sb2 = new StringBuilder("ShortcutAction(idHash=");
        sb2.append(this.f85732a);
        sb2.append(", packageName=");
        sb2.append(this.f85733b);
        sb2.append(", userSerial=");
        sb2.append(this.f85734c);
        sb2.append(", type=");
        sb2.append(this.f85735d);
        sb2.append(", label=");
        sb2.append(this.f85736e);
        sb2.append(", iconUri=");
        sb2.append(this.f85737f);
        c0.D(sb2, ", searchTimes=", string, ", usageTimes=", string2);
        sb2.append(", openParams=");
        sb2.append(this.f85740i);
        sb2.append(")");
        return sb2.toString();
    }
}
