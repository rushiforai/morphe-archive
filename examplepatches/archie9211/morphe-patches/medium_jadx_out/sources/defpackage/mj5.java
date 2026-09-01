package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mj5 {
    public static final mj5 b = new mj5();
    public final boolean a = true;

    public mj5() {
        if (o7f.C("")) {
            return;
        }
        o7f.C("");
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("NumberHexFormat(\n");
        a("    ", sb);
        sb.append('\n');
        sb.append(")");
        return sb.toString();
    }

    public final void a(String str, StringBuilder sb) {
        ka1.C(sb, str, PqkdNGCEoxOKZk.lJfq, "", "\",");
        sb.append('\n');
        sb.append(str);
        sb.append("suffix = \"");
        sb.append("");
        sb.append("\",");
        sb.append('\n');
        sb.append(str);
        sb.append("removeLeadingZeros = ");
        sb.append(false);
        sb.append(',');
        sb.append('\n');
        sb.append(str);
        sb.append("minLength = ");
        sb.append(1);
    }
}
