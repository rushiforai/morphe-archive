package a7;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import m.m;

/* loaded from: classes2.dex */
public final class a implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f433a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f434b;

    public a(e eVar) {
        this.f433a = 0;
        this.f434b = new LinkedHashSet();
        eVar.b("androidx.savedstate.Restarter", this);
    }

    @Override // a7.d
    public final Bundle a() {
        switch (this.f433a) {
            case 0:
                Bundle bundleA = w.b.a((Pair[]) Arrays.copyOf(new Pair[0], 0));
                List value = b70.g.I1((LinkedHashSet) this.f434b);
                Intrinsics.g(value, "value");
                List list = value;
                bundleA.putStringArrayList("classes_to_restore", list instanceof ArrayList ? (ArrayList) list : new ArrayList<>(list));
                return bundleA;
            default:
                Bundle bundle = new Bundle();
                ((m) this.f434b).getDelegate().getClass();
                return bundle;
        }
    }

    public void b(String str) {
        ((LinkedHashSet) this.f434b).add(str);
    }

    public a(m mVar) {
        this.f433a = 1;
        this.f434b = mVar;
    }
}
