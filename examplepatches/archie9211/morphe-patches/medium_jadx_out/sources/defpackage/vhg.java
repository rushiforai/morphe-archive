package defpackage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vhg {
    public static final qvg b = qvg.a(new byte[0]);
    public final HashMap a;

    public vhg(HashMap map) {
        this.a = map;
    }

    public final Iterable a(byte[] bArr) {
        List list;
        qvg qvgVar = b;
        HashMap map = this.a;
        List list2 = (List) map.get(qvgVar);
        if (bArr.length >= 5) {
            list = (List) map.get(new qvg(bArr, 5 > bArr.length ? bArr.length : 5));
        } else {
            list = null;
        }
        return (list2 == null && list == null) ? new ArrayList() : list2 == null ? list : list == null ? list2 : new xhg(this, list, list2, 0);
    }
}
