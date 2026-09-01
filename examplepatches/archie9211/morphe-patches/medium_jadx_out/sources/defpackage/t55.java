package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t55 implements r55 {
    public exd a;
    public yv2 b;
    public c28 c;
    public g93 d;
    public s55 e;
    public e41 f;
    public List g;
    public final List h;
    public yq6 i;
    public yq6 j;
    public mn6 k;
    public n98 l;
    public boolean m;
    public boolean n;
    public boolean o;
    public boolean p;
    public boolean q;
    public List r;
    public ly s;
    public boolean t;
    public final LinkedHashMap u;
    public Boolean v;
    public boolean w;
    public final /* synthetic */ u55 x;

    public t55(u55 u55Var, exd exdVar, yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var, List list, List list2, yq6 yq6Var, mn6 mn6Var) {
        if (exdVar == null) {
            a(0);
            throw null;
        }
        if (yv2Var == null) {
            a(1);
            throw null;
        }
        if (c28Var == null) {
            a(2);
            throw null;
        }
        if (g93Var == null) {
            a(3);
            throw null;
        }
        if (e41Var == null) {
            a(4);
            throw null;
        }
        if (list == null) {
            a(5);
            throw null;
        }
        if (list2 == null) {
            a(6);
            throw null;
        }
        if (mn6Var == null) {
            a(7);
            throw null;
        }
        this.x = u55Var;
        this.e = null;
        this.j = u55Var.k;
        this.m = true;
        this.n = false;
        this.o = false;
        this.p = false;
        this.q = u55Var.t;
        this.r = null;
        this.s = null;
        this.t = u55Var.u;
        this.u = new LinkedHashMap();
        this.v = null;
        this.w = false;
        this.a = exdVar;
        this.b = yv2Var;
        this.c = c28Var;
        this.d = g93Var;
        this.f = e41Var;
        this.g = list;
        this.h = list2;
        this.i = yq6Var;
        this.k = mn6Var;
        this.l = null;
    }

    @Override // defpackage.r55
    public final r55 B() {
        this.q = true;
        return this;
    }

    @Override // defpackage.r55
    public final r55 C(yv2 yv2Var) {
        this.b = yv2Var;
        return this;
    }

    @Override // defpackage.r55
    public final r55 E(n98 n98Var) {
        this.l = n98Var;
        return this;
    }

    @Override // defpackage.r55
    public final r55 G() {
        this.n = true;
        return this;
    }

    @Override // defpackage.r55
    public final r55 b(e41 e41Var) {
        if (e41Var != null) {
            this.f = e41Var;
            return this;
        }
        a(14);
        throw null;
    }

    @Override // defpackage.r55
    public final s55 build() {
        return this.x.B0(this);
    }

    @Override // defpackage.r55
    public final r55 d(List list) {
        this.g = list;
        return this;
    }

    @Override // defpackage.r55
    public final r55 h(yq6 yq6Var) {
        this.j = yq6Var;
        return this;
    }

    @Override // defpackage.r55
    public final r55 i() {
        this.o = true;
        return this;
    }

    @Override // defpackage.r55
    public final r55 p() {
        this.u.put(g96.H, Boolean.TRUE);
        return this;
    }

    @Override // defpackage.r55
    public final r55 q() {
        this.t = true;
        return this;
    }

    @Override // defpackage.r55
    public final r55 r(ly lyVar) {
        if (lyVar != null) {
            this.s = lyVar;
            return this;
        }
        a(35);
        throw null;
    }

    @Override // defpackage.r55
    public final r55 t(g93 g93Var) {
        if (g93Var != null) {
            this.d = g93Var;
            return this;
        }
        a(12);
        throw null;
    }

    @Override // defpackage.r55
    public final r55 u() {
        this.m = false;
        return this;
    }

    @Override // defpackage.r55
    public final r55 x(c28 c28Var) {
        if (c28Var != null) {
            this.c = c28Var;
            return this;
        }
        a(10);
        throw null;
    }

    @Override // defpackage.r55
    public final r55 y() {
        this.r = ey3.a;
        return this;
    }

    @Override // defpackage.r55
    public final r55 z(mn6 mn6Var) {
        if (mn6Var != null) {
            this.k = mn6Var;
            return this;
        }
        a(23);
        throw null;
    }

    public static /* synthetic */ void a(int i) {
        String str;
        int i2;
        switch (i) {
            case 9:
            case 11:
            case 13:
            case 15:
            case 16:
            case 18:
            case 20:
            case 22:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 36:
            case 38:
            case 40:
            case 41:
            case 42:
                str = "@NotNull method %s.%s must not return null";
                break;
            case 10:
            case 12:
            case 14:
            case 17:
            case 19:
            case 21:
            case 23:
            case 25:
            case 35:
            case 37:
            case 39:
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 9:
            case 11:
            case 13:
            case 15:
            case 16:
            case 18:
            case 20:
            case 22:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 36:
            case 38:
            case 40:
            case 41:
            case 42:
                i2 = 2;
                break;
            case 10:
            case 12:
            case 14:
            case 17:
            case 19:
            case 21:
            case 23:
            case 25:
            case 35:
            case 37:
            case 39:
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
                objArr[0] = "newOwner";
                break;
            case 2:
                objArr[0] = "newModality";
                break;
            case 3:
                objArr[0] = "newVisibility";
                break;
            case 4:
            case 14:
                objArr[0] = "kind";
                break;
            case 5:
                objArr[0] = "newValueParameterDescriptors";
                break;
            case 6:
                objArr[0] = "newContextReceiverParameters";
                break;
            case 7:
                objArr[0] = "newReturnType";
                break;
            case 8:
                objArr[0] = "owner";
                break;
            case 9:
            case 11:
            case 13:
            case 15:
            case 16:
            case 18:
            case 20:
            case 22:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 36:
            case 38:
            case 40:
            case 41:
            case 42:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/FunctionDescriptorImpl$CopyConfiguration";
                break;
            case 10:
                objArr[0] = "modality";
                break;
            case 12:
                objArr[0] = "visibility";
                break;
            case 17:
                objArr[0] = "name";
                break;
            case 19:
            case 21:
                objArr[0] = "parameters";
                break;
            case 23:
                objArr[0] = "type";
                break;
            case 25:
                objArr[0] = "contextReceiverParameters";
                break;
            case 35:
                objArr[0] = "additionalAnnotations";
                break;
            case 37:
            default:
                objArr[0] = "substitution";
                break;
            case 39:
                objArr[0] = "userDataKey";
                break;
        }
        String str2 = ZVsviyDAr.CZKK;
        switch (i) {
            case 9:
                objArr[1] = "setOwner";
                break;
            case 10:
            case 12:
            case 14:
            case 17:
            case 19:
            case 21:
            case 23:
            case 25:
            case 35:
            case 37:
            case 39:
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/FunctionDescriptorImpl$CopyConfiguration";
                break;
            case 11:
                objArr[1] = "setModality";
                break;
            case 13:
                objArr[1] = "setVisibility";
                break;
            case 15:
                objArr[1] = "setKind";
                break;
            case 16:
                objArr[1] = "setCopyOverrides";
                break;
            case 18:
                objArr[1] = "setName";
                break;
            case 20:
                objArr[1] = "setValueParameters";
                break;
            case 22:
                objArr[1] = "setTypeParameters";
                break;
            case 24:
                objArr[1] = str2;
                break;
            case 26:
                objArr[1] = "setContextReceiverParameters";
                break;
            case 27:
                objArr[1] = "setExtensionReceiverParameter";
                break;
            case 28:
                objArr[1] = "setDispatchReceiverParameter";
                break;
            case 29:
                objArr[1] = "setOriginal";
                break;
            case 30:
                objArr[1] = "setSignatureChange";
                break;
            case 31:
                objArr[1] = "setPreserveSourceElement";
                break;
            case 32:
                objArr[1] = "setDropOriginalInContainingParts";
                break;
            case 33:
                objArr[1] = "setHiddenToOvercomeSignatureClash";
                break;
            case 34:
                objArr[1] = "setHiddenForResolutionEverywhereBesideSupercalls";
                break;
            case 36:
                objArr[1] = "setAdditionalAnnotations";
                break;
            case 38:
                objArr[1] = "setSubstitution";
                break;
            case 40:
                objArr[1] = "putUserData";
                break;
            case 41:
                objArr[1] = "getSubstitution";
                break;
            case 42:
                objArr[1] = "setJustForTypeSubstitution";
                break;
        }
        switch (i) {
            case 8:
                objArr[2] = "setOwner";
                break;
            case 9:
            case 11:
            case 13:
            case 15:
            case 16:
            case 18:
            case 20:
            case 22:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 36:
            case 38:
            case 40:
            case 41:
            case 42:
                break;
            case 10:
                objArr[2] = "setModality";
                break;
            case 12:
                objArr[2] = "setVisibility";
                break;
            case 14:
                objArr[2] = "setKind";
                break;
            case 17:
                objArr[2] = "setName";
                break;
            case 19:
                objArr[2] = "setValueParameters";
                break;
            case 21:
                objArr[2] = "setTypeParameters";
                break;
            case 23:
                objArr[2] = str2;
                break;
            case 25:
                objArr[2] = "setContextReceiverParameters";
                break;
            case 35:
                objArr[2] = "setAdditionalAnnotations";
                break;
            case 37:
                objArr[2] = "setSubstitution";
                break;
            case 39:
                objArr[2] = "putUserData";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str3 = String.format(str, objArr);
        switch (i) {
            case 9:
            case 11:
            case 13:
            case 15:
            case 16:
            case 18:
            case 20:
            case 22:
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 36:
            case 38:
            case 40:
            case 41:
            case 42:
                throw new IllegalStateException(str3);
            case 10:
            case 12:
            case 14:
            case 17:
            case 19:
            case 21:
            case 23:
            case 25:
            case 35:
            case 37:
            case 39:
            default:
                throw new IllegalArgumentException(str3);
        }
    }
}
