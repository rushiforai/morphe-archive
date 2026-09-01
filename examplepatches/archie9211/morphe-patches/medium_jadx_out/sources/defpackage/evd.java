package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.util.BitSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class evd extends jud {
    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        BitSet bitSet = new BitSet();
        gd6Var.f();
        jd6 jd6VarP0 = gd6Var.p0();
        int i = 0;
        while (jd6VarP0 != jd6.END_ARRAY) {
            int i2 = hvd.a[jd6VarP0.ordinal()];
            boolean zNextBoolean = true;
            if (i2 == 1 || i2 == 2) {
                int iNextInt = gd6Var.nextInt();
                if (iNextInt == 0) {
                    zNextBoolean = false;
                } else if (iNextInt != 1) {
                    StringBuilder sbC = ev6.C("Invalid bitset value ", iNextInt, ", expected 0 or 1; at path ");
                    sbC.append(gd6Var.R());
                    throw new JsonSyntaxException(sbC.toString());
                }
            } else {
                if (i2 != 3) {
                    StringBuilder sb = new StringBuilder("Invalid bitset value type: ");
                    sb.append(jd6VarP0);
                    String strN = gd6Var.N();
                    sb.append("; at path ");
                    sb.append(strN);
                    throw new JsonSyntaxException(sb.toString());
                }
                zNextBoolean = gd6Var.nextBoolean();
            }
            if (zNextBoolean) {
                bitSet.set(i);
            }
            i++;
            jd6VarP0 = gd6Var.p0();
        }
        gd6Var.D();
        return bitSet;
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        BitSet bitSet = (BitSet) obj;
        yd6Var.m();
        int length = bitSet.length();
        for (int i = 0; i < length; i++) {
            yd6Var.o0(bitSet.get(i) ? 1L : 0L);
        }
        yd6Var.D();
    }
}
