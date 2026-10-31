package mz;

import b.u4;
import e10.w;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class o {

    @NotNull
    public static final n Companion = new n();

    /* renamed from: f, reason: collision with root package name */
    public static final o f77358f = new o(-587202561, -587202561, -11316397, 12, 4);

    /* renamed from: a, reason: collision with root package name */
    public final int f77359a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77360b;

    /* renamed from: c, reason: collision with root package name */
    public final int f77361c;

    /* renamed from: d, reason: collision with root package name */
    public final int f77362d;

    /* renamed from: e, reason: collision with root package name */
    public final int f77363e;

    public /* synthetic */ o(int i5, int i11, int i12, int i13, int i14, int i15) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, m.f77357a.getDescriptor());
        }
        this.f77359a = i11;
        this.f77360b = i12;
        this.f77361c = i13;
        this.f77362d = i14;
        this.f77363e = i15;
    }

    public static o a(o oVar, int i5, int i11, int i12, int i13) {
        if ((i13 & 1) != 0) {
            i5 = oVar.f77359a;
        }
        int i14 = i5;
        int i15 = oVar.f77360b;
        int i16 = oVar.f77361c;
        if ((i13 & 8) != 0) {
            i11 = oVar.f77362d;
        }
        int i17 = i11;
        if ((i13 & 16) != 0) {
            i12 = oVar.f77363e;
        }
        oVar.getClass();
        return new o(i14, i15, i16, i17, i12);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return this.f77359a == oVar.f77359a && this.f77360b == oVar.f77360b && this.f77361c == oVar.f77361c && this.f77362d == oVar.f77362d && this.f77363e == oVar.f77363e;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f77363e) + u4.a(this.f77362d, u4.a(this.f77361c, u4.a(this.f77360b, Integer.hashCode(this.f77359a) * 31, 31), 31), 31);
    }

    public final String toString() {
        w wVar = w.f51855b;
        wVar.getClass();
        return wVar.encodeToString(Companion.serializer(), this);
    }

    public o(int i5, int i11, int i12, int i13, int i14) {
        this.f77359a = i5;
        this.f77360b = i11;
        this.f77361c = i12;
        this.f77362d = i13;
        this.f77363e = i14;
    }
}
