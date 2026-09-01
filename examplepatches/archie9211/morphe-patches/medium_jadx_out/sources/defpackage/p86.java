package defpackage;

import androidx.credentials.playservices.controllers.CredentialProviderBaseController;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class p86 {
    public static final Map a = ei7.Q(new f09("PACKAGE", EnumSet.noneOf(ln6.class)), new f09(CredentialProviderBaseController.TYPE_TAG, EnumSet.of(ln6.CLASS, ln6.FILE)), new f09("ANNOTATION_TYPE", EnumSet.of(ln6.ANNOTATION_CLASS)), new f09("TYPE_PARAMETER", EnumSet.of(ln6.TYPE_PARAMETER)), new f09("FIELD", EnumSet.of(ln6.FIELD)), new f09("LOCAL_VARIABLE", EnumSet.of(ln6.LOCAL_VARIABLE)), new f09("PARAMETER", EnumSet.of(ln6.VALUE_PARAMETER)), new f09("CONSTRUCTOR", EnumSet.of(ln6.CONSTRUCTOR)), new f09("METHOD", EnumSet.of(ln6.FUNCTION, ln6.PROPERTY_GETTER, ln6.PROPERTY_SETTER)), new f09("TYPE_USE", EnumSet.of(ln6.TYPE)));
    public static final Map b = ei7.Q(new f09("RUNTIME", jn6.RUNTIME), new f09("CLASS", jn6.BINARY), new f09("SOURCE", jn6.SOURCE));

    public static g80 a(List list) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (obj instanceof v0b) {
                arrayList.add(obj);
            }
        }
        ArrayList<ln6> arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Iterable iterable = (EnumSet) a.get(n98.e(((v0b) it2.next()).b.name()).b());
            if (iterable == null) {
                iterable = ny3.a;
            }
            bu1.n0(iterable, arrayList2);
        }
        ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList2, 10));
        for (ln6 ln6Var : arrayList2) {
            y05 y05Var = lnc.u;
            y05Var.getClass();
            arrayList3.add(new r04(new mn1(y05Var.b(), y05Var.a.g()), n98.e(ln6Var.name())));
        }
        return new g80(arrayList3, h06.e);
    }
}
