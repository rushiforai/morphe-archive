package com.google.android.gms.internal.measurement;

import android.net.Uri;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class we {

    /* renamed from: a, reason: collision with root package name */
    public nf f33193a;

    /* renamed from: b, reason: collision with root package name */
    public xk.v0 f33194b;

    /* renamed from: c, reason: collision with root package name */
    public ArrayList f33195c;

    /* renamed from: d, reason: collision with root package name */
    public Uri f33196d;

    public ArrayList a(OutputStream outputStream) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(outputStream);
        ArrayList arrayList2 = this.f33195c;
        if (!arrayList2.isEmpty()) {
            int i5 = ve.f33146b;
            ArrayList arrayList3 = new ArrayList();
            Iterator it = arrayList2.iterator();
            if (it.hasNext()) {
                throw b.u4.e(it);
            }
            ve veVar = !arrayList3.isEmpty() ? new ve(outputStream, arrayList3) : null;
            if (veVar != null) {
                arrayList.add(veVar);
            }
        }
        Iterator it2 = this.f33194b.iterator();
        if (!it2.hasNext()) {
            Collections.reverse(arrayList);
            return arrayList;
        }
        if (it2.next() != null) {
            throw new ClassCastException();
        }
        throw null;
    }
}
