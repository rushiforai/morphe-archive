package t0;

import androidx.compose.ui.text.input.ImeOptions;
import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.DefaultConstructorMarker;

/* loaded from: classes.dex */
public final class w0 {

    /* renamed from: d, reason: collision with root package name */
    public static final w0 f88258d;

    /* renamed from: a, reason: collision with root package name */
    public final int f88259a;

    /* renamed from: b, reason: collision with root package name */
    public final int f88260b;

    /* renamed from: c, reason: collision with root package name */
    public final int f88261c;

    static {
        int i5 = 0;
        f88258d = new w0(i5, i5, i5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
    }

    public w0(int i5, int i11, int i12) {
        this.f88259a = i5;
        this.f88260b = i11;
        this.f88261c = i12;
    }

    public static w0 a(int i5, int i11) {
        int i12 = i11 & 1;
        w0 w0Var = f88258d;
        int i13 = i12 != 0 ? w0Var.f88259a : 2;
        int i14 = (i11 & 4) != 0 ? w0Var.f88260b : 8;
        if ((i11 & 8) != 0) {
            i5 = w0Var.f88261c;
        }
        return new w0(i13, i14, i5);
    }

    public final ImeOptions b(boolean z11) {
        r3.l lVar;
        int i5 = this.f88259a;
        r3.n nVar = new r3.n(i5);
        if (i5 == -1) {
            nVar = null;
        }
        int i11 = nVar != null ? nVar.f85452a : 0;
        int i12 = this.f88260b;
        r3.o oVar = new r3.o(i12);
        if (i12 == 0) {
            oVar = null;
            lVar = null;
        } else {
            lVar = null;
        }
        int i13 = oVar != null ? oVar.f85453a : 1;
        int i14 = this.f88261c;
        r3.l lVar2 = new r3.l(i14);
        if (i14 != -1) {
            lVar = lVar2;
        }
        return new ImeOptions(z11, i11, true, i13, lVar != null ? lVar.f85451a : 1, (r3.t) null, t3.b.f88510c, (DefaultConstructorMarker) null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w0)) {
            return false;
        }
        w0 w0Var = (w0) obj;
        return this.f88259a == w0Var.f88259a && this.f88260b == w0Var.f88260b && this.f88261c == w0Var.f88261c;
    }

    public final int hashCode() {
        return u4.a(this.f88261c, u4.a(this.f88260b, Integer.hashCode(this.f88259a) * 961, 31), 29791);
    }

    public final String toString() {
        return "KeyboardOptions(capitalization=" + ((Object) r3.n.a(this.f88259a)) + ", autoCorrectEnabled=null, keyboardType=" + ((Object) r3.o.a(this.f88260b)) + ", imeAction=" + ((Object) r3.l.a(this.f88261c)) + ", platformImeOptions=nullshowKeyboardOnFocus=null, hintLocales=null)";
    }

    public /* synthetic */ w0(int i5, int i11, int i12, int i13) {
        this((i13 & 1) != 0 ? -1 : i5, (i13 & 4) != 0 ? 0 : i11, (i13 & 8) != 0 ? -1 : i12);
    }
}
