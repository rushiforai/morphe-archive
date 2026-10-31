package hn;

import b.u4;
import com.google.gson.Gson;
import com.google.gson.h0;
import com.google.gson.i0;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public final class e implements i0, Cloneable {

    /* renamed from: g, reason: collision with root package name */
    public static final e f59902g = new e();

    /* renamed from: a, reason: collision with root package name */
    public double f59903a = -1.0d;

    /* renamed from: b, reason: collision with root package name */
    public int f59904b = Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE;

    /* renamed from: c, reason: collision with root package name */
    public boolean f59905c = true;

    /* renamed from: d, reason: collision with root package name */
    public boolean f59906d;

    /* renamed from: e, reason: collision with root package name */
    public List f59907e;

    /* renamed from: f, reason: collision with root package name */
    public List f59908f;

    public e() {
        List list = Collections.EMPTY_LIST;
        this.f59907e = list;
        this.f59908f = list;
    }

    @Override // com.google.gson.i0
    public final h0 a(Gson gson, mn.a aVar) {
        Class cls = aVar.f76504a;
        boolean zD = d(cls, true);
        boolean zD2 = d(cls, false);
        if (zD || zD2) {
            return new d(this, zD2, zD, gson, aVar);
        }
        return null;
    }

    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final e clone() {
        try {
            return (e) super.clone();
        } catch (CloneNotSupportedException e3) {
            throw new AssertionError(e3);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x002f, code lost:
    
        if (r7.f59903a < r2.value()) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean d(Class cls, boolean z11) {
        if (this.f59903a != -1.0d) {
            gn.d dVar = (gn.d) cls.getAnnotation(gn.d.class);
            gn.e eVar = (gn.e) cls.getAnnotation(gn.e.class);
            if (dVar != null) {
                if (this.f59903a >= dVar.value()) {
                }
                return true;
            }
            if (eVar != null) {
            }
        }
        if (!this.f59905c && cls.isMemberClass()) {
            ul.b bVar = kn.c.f71660a;
            if (!Modifier.isStatic(cls.getModifiers())) {
                return true;
            }
        }
        if (!z11 && !Enum.class.isAssignableFrom(cls)) {
            ul.b bVar2 = kn.c.f71660a;
            if (!Modifier.isStatic(cls.getModifiers()) && (cls.isAnonymousClass() || cls.isLocalClass())) {
                return true;
            }
        }
        Iterator it = (z11 ? this.f59907e : this.f59908f).iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        return false;
    }

    public final e e(boolean z11, boolean z12) {
        e eVarClone = clone();
        if (z11) {
            ArrayList arrayList = new ArrayList(this.f59907e);
            eVarClone.f59907e = arrayList;
            arrayList.add(null);
        }
        if (z12) {
            ArrayList arrayList2 = new ArrayList(this.f59908f);
            eVarClone.f59908f = arrayList2;
            arrayList2.add(null);
        }
        return eVarClone;
    }
}
