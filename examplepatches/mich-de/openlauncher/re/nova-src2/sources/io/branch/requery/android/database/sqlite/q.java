package io.branch.requery.android.database.sqlite;

import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: k, reason: collision with root package name */
    public static final Pattern f61856k = Pattern.compile("[\\w\\.\\-]+@[\\w\\.\\-]+");

    /* renamed from: a, reason: collision with root package name */
    public final String f61857a;

    /* renamed from: b, reason: collision with root package name */
    public final String f61858b;

    /* renamed from: c, reason: collision with root package name */
    public int f61859c;

    /* renamed from: d, reason: collision with root package name */
    public int f61860d;

    /* renamed from: e, reason: collision with root package name */
    public Locale f61861e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f61862f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f61863g = true;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f61864h = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f61865i = new ArrayList();

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f61866j = new ArrayList();

    public q(String str, int i5) {
        if (str == null) {
            throw new IllegalArgumentException("path must not be null.");
        }
        this.f61857a = str;
        this.f61858b = str.indexOf(64) != -1 ? f61856k.matcher(str).replaceAll("XX@YY") : str;
        this.f61859c = i5;
        this.f61860d = 25;
        this.f61861e = Locale.getDefault();
    }

    public final boolean a() {
        return this.f61857a.equalsIgnoreCase(":memory:");
    }

    public final void b(q qVar) {
        if (qVar == null) {
            throw new IllegalArgumentException("other must not be null.");
        }
        if (!this.f61857a.equals(qVar.f61857a)) {
            throw new IllegalArgumentException("other configuration must refer to the same database.");
        }
        this.f61859c = qVar.f61859c;
        this.f61860d = qVar.f61860d;
        this.f61861e = qVar.f61861e;
        this.f61862f = qVar.f61862f;
        this.f61863g = qVar.f61863g;
        ArrayList arrayList = this.f61864h;
        arrayList.clear();
        arrayList.addAll(qVar.f61864h);
        ArrayList arrayList2 = this.f61866j;
        arrayList2.clear();
        arrayList2.addAll(qVar.f61866j);
        ArrayList arrayList3 = this.f61865i;
        arrayList3.clear();
        arrayList3.addAll(qVar.f61865i);
    }

    public q(q qVar) {
        if (qVar != null) {
            this.f61857a = qVar.f61857a;
            this.f61858b = qVar.f61858b;
            b(qVar);
            return;
        }
        throw new IllegalArgumentException("other must not be null.");
    }
}
