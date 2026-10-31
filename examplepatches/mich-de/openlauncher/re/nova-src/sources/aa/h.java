package aa;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class h implements ba.d, o50.x {

    /* renamed from: a, reason: collision with root package name */
    public boolean f592a;

    /* renamed from: b, reason: collision with root package name */
    public Object f593b;

    public h(o50.x encodedParametersBuilder) {
        Intrinsics.g(encodedParametersBuilder, "encodedParametersBuilder");
        this.f593b = encodedParametersBuilder;
        this.f592a = encodedParametersBuilder.b();
    }

    @Override // s50.k
    public Set a() {
        return ((s50.m) bh.g.J((o50.x) this.f593b)).a();
    }

    @Override // s50.k
    public boolean b() {
        return this.f592a;
    }

    @Override // s50.k
    public void c(String name, Iterable values) {
        Intrinsics.g(name, "name");
        Intrinsics.g(values, "values");
        o50.x xVar = (o50.x) this.f593b;
        String strE = o50.a.e(name, false);
        ArrayList arrayList = new ArrayList(b70.c.u0(values, 10));
        Iterator it = values.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            Intrinsics.g(str, "<this>");
            arrayList.add(o50.a.e(str, true));
        }
        xVar.c(strE, arrayList);
    }

    @Override // s50.k
    public void clear() {
        ((o50.x) this.f593b).clear();
    }

    @Override // s50.k
    public boolean contains(String name) {
        Intrinsics.g(name, "name");
        return ((o50.x) this.f593b).contains(o50.a.e(name, false));
    }

    @Override // ba.d
    public CharSequence d(Object obj) {
        return ((j) obj).a((PackageManager) this.f593b);
    }

    @Override // s50.k
    public List g(String name) {
        Intrinsics.g(name, "name");
        List listG = ((o50.x) this.f593b).g(o50.a.e(name, false));
        if (listG == null) {
            return null;
        }
        List list = listG;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(o50.a.d(0, 0, 11, (String) it.next()));
        }
        return arrayList;
    }

    public void h(Runnable runnable) {
        if (runnable == null) {
            return;
        }
        if (this.f592a) {
            runnable.run();
            return;
        }
        if (((ArrayList) this.f593b) == null) {
            this.f593b = new ArrayList();
        }
        ((ArrayList) this.f593b).add(runnable);
    }

    @Override // ba.d
    public UserHandle i(Object obj) {
        return ((j) obj).getUser();
    }

    @Override // s50.k
    public boolean isEmpty() {
        return ((o50.x) this.f593b).isEmpty();
    }

    public void j() {
        this.f592a = true;
        ArrayList arrayList = (ArrayList) this.f593b;
        if (arrayList != null) {
            this.f593b = null;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                ((Runnable) arrayList.get(i5)).run();
            }
        }
    }

    @Override // ba.d
    public boolean l() {
        return this.f592a;
    }

    @Override // ba.d
    public ComponentName m(Object obj) {
        return ((j) obj).d();
    }

    @Override // ba.d
    /* renamed from: n, reason: merged with bridge method [inline-methods] */
    public BitmapInfo e(Context context, j jVar) {
        return BitmapInfo.f21150d;
    }

    @Override // s50.k
    public Set names() {
        Set setNames = ((o50.x) this.f593b).names();
        ArrayList arrayList = new ArrayList(b70.c.u0(setNames, 10));
        Iterator it = setNames.iterator();
        while (it.hasNext()) {
            arrayList.add(o50.a.d(0, 0, 15, (String) it.next()));
        }
        return b70.g.N1(arrayList);
    }

    public h() {
        this.f593b = null;
        this.f592a = false;
    }

    public h(Context context, boolean z11) {
        this.f593b = context.getPackageManager();
        this.f592a = z11;
    }
}
