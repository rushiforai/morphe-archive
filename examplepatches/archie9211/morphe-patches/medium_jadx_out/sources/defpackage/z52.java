package defpackage;

import androidx.constraintlayout.core.parser.CLParsingException;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class z52 {
    public final q21 a;
    public int b;
    public int c;
    public zm7 d;
    public int e;
    public final ArrayList f;

    public z52() {
        new ArrayList();
        this.a = new q21(new char[0]);
        this.c = PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
        this.e = 0;
        this.f = new ArrayList();
    }

    public static r28 b(r28 r28Var, i52 i52Var, x45 x45Var) {
        return r28Var.b(new y52(i52Var, x45Var));
    }

    public static v52 c(z52 z52Var, pq6[] pq6VarArr) throws CLParsingException {
        int i = z52Var.c;
        z52Var.c = i + 1;
        qq6 qq6Var = new qq6(Integer.valueOf(i));
        k21 k21Var = new k21(new char[0]);
        for (pq6 pq6Var : pq6VarArr) {
            k21Var.u(s21.u(pq6Var.a().toString()));
        }
        q21 q21VarA = z52Var.a(qq6Var);
        q21VarA.J("type", "barrier");
        q21VarA.J("direction", "bottom");
        q21VarA.I("margin", new o21(0.0f));
        q21VarA.I("contains", k21Var);
        z52Var.g(15);
        for (pq6 pq6Var2 : pq6VarArr) {
            z52Var.g(pq6Var2.hashCode());
        }
        z52Var.g(Float.floatToIntBits(0.0f));
        return new v52(qq6Var.a, 0, qq6Var);
    }

    public final i52 d() {
        int i = this.e;
        this.e = i + 1;
        ArrayList arrayList = this.f;
        i52 i52Var = (i52) bu1.A0(i, arrayList);
        if (i52Var != null) {
            return i52Var;
        }
        i52 i52Var2 = new i52(Integer.valueOf(this.e));
        arrayList.add(i52Var2);
        return i52Var2;
    }

    public final zm7 e() {
        zm7 zm7Var = this.d;
        if (zm7Var != null) {
            return zm7Var;
        }
        zm7 zm7Var2 = new zm7(8, this);
        this.d = zm7Var2;
        return zm7Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z52)) {
            return false;
        }
        return this.a.equals(((z52) obj).a);
    }

    public final void f() {
        this.a.e.clear();
        this.c = PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
        this.b = 0;
        this.e = 0;
    }

    public final void g(int i) {
        this.b = ((this.b * PhotoshopDirectory.TAG_BORDER_INFORMATION) + i) % 1000000007;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final q21 a(pq6 pq6Var) throws CLParsingException {
        q21 q21Var;
        String string = pq6Var.a().toString();
        q21 q21Var2 = this.a;
        m21 m21VarC = q21Var2.C(string);
        if (m21VarC instanceof q21) {
            q21Var = (q21) m21VarC;
        } else {
            q21Var = null;
        }
        if (q21Var == null) {
            q21Var2.I(string, new q21(new char[0]));
        }
        m21 m21VarX = q21Var2.x(string);
        if (m21VarX instanceof q21) {
            return (q21) m21VarX;
        }
        StringBuilder sbU = lv8.u(AXoTRPEGKEve.aVjEz, string, ">, found [");
        sbU.append(m21VarX.s());
        sbU.append("] : ");
        sbU.append(m21VarX);
        throw new CLParsingException(sbU.toString(), q21Var2);
    }
}
