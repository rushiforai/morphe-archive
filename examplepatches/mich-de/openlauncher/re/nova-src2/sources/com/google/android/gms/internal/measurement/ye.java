package com.google.android.gms.internal.measurement;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import androidx.compose.ui.node.LayoutNode;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.Matcher;

/* loaded from: classes3.dex */
public final class ye {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f33260a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f33261b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f33262c;

    public ye(ArrayList arrayList) {
        List list = Collections.EMPTY_LIST;
        this.f33260a = new HashMap();
        this.f33261b = new HashMap();
        this.f33262c = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            nf nfVar = (nf) it.next();
            if (TextUtils.isEmpty(nfVar.zzc())) {
                Log.w("MobStore.FileStorage", "Cannot register backend, name empty");
            } else {
                nf nfVar2 = (nf) this.f33260a.put(nfVar.zzc(), nfVar);
                if (nfVar2 != null) {
                    String canonicalName = nfVar2.getClass().getCanonicalName();
                    String canonicalName2 = nfVar.getClass().getCanonicalName();
                    throw new IllegalArgumentException(b.c0.s(new StringBuilder(String.valueOf(canonicalName).length() + 30 + String.valueOf(canonicalName2).length()), "Cannot override Backend ", canonicalName, " with ", canonicalName2));
                }
            }
        }
        Iterator it2 = list.iterator();
        if (it2.hasNext()) {
            throw b.u4.e(it2);
        }
        this.f33262c.addAll(list);
    }

    public final Object a(Uri uri, xe xeVar) {
        return xeVar.a(b(uri));
    }

    public final we b(Uri uri) {
        List listN;
        xk.s0 s0VarL = xk.v0.l();
        xk.s0 s0VarL2 = xk.v0.l();
        String encodedFragment = uri.getEncodedFragment();
        if (TextUtils.isEmpty(encodedFragment) || !encodedFragment.startsWith("transform=")) {
            listN = xk.r2.f96007e;
        } else {
            String strSubstring = encodedFragment.substring(10);
            cz.b bVarB = cz.b.b("+".charAt(0));
            listN = xk.v0.n(new cz.b((vk.t) bVarB.f48576d, true, (vk.b) bVarB.f48575c, LayoutNode.NotPlacedPlaceOrder).c(strSubstring));
        }
        int size = listN.size();
        for (int i5 = 0; i5 < size; i5++) {
            String str = (String) listN.get(i5);
            Matcher matcher = kf.f32740a.matcher(str);
            if (!matcher.matches()) {
                throw new IllegalArgumentException("Invalid fragment spec: ".concat(String.valueOf(str)));
            }
            s0VarL2.a(matcher.group(1));
        }
        xk.r2 r2VarF = s0VarL2.f();
        if (r2VarF.f96009d > 0) {
            String str2 = (String) r2VarF.get(0);
            if (this.f33261b.get(str2) != null) {
                throw new ClassCastException();
            }
            String strValueOf = String.valueOf(uri);
            throw new zzsk(b.c0.s(new StringBuilder(str2.length() + 40 + strValueOf.length()), "Requested transform isn't registered: ", str2, ": ", strValueOf));
        }
        xk.v0 v0VarU = s0VarL.f().u();
        we weVar = new we();
        String scheme = uri.getScheme();
        nf nfVar = (nf) this.f33260a.get(scheme);
        if (nfVar == null) {
            throw new zzsk(b.c0.k("Requested backend isn't registered: ", scheme));
        }
        weVar.f33193a = nfVar;
        weVar.f33195c = this.f33262c;
        weVar.f33194b = v0VarU;
        if (!v0VarU.isEmpty()) {
            ArrayList arrayList = new ArrayList(uri.getPathSegments());
            if (!arrayList.isEmpty() && !uri.getPath().endsWith("/")) {
                String str3 = (String) arrayList.get(arrayList.size() - 1);
                ListIterator listIterator = v0VarU.listIterator(v0VarU.size());
                while (listIterator.hasPrevious()) {
                    if (listIterator.previous() != null) {
                        throw new ClassCastException();
                    }
                }
                arrayList.set(arrayList.size() - 1, str3);
                uri = uri.buildUpon().path(TextUtils.join("/", arrayList)).encodedFragment(null).build();
            }
        }
        weVar.f33196d = uri;
        we weVar2 = new we();
        weVar2.f33193a = weVar.f33193a;
        weVar2.f33194b = weVar.f33194b;
        weVar2.f33195c = weVar.f33195c;
        weVar2.f33196d = weVar.f33196d;
        return weVar2;
    }
}
