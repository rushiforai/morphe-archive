package r10;

import android.net.Uri;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public class s1 {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f85241a;

    /* renamed from: b, reason: collision with root package name */
    public final CharSequence f85242b;

    /* renamed from: c, reason: collision with root package name */
    public final List f85243c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f85244d;

    /* renamed from: e, reason: collision with root package name */
    public final CharSequence f85245e;

    /* renamed from: f, reason: collision with root package name */
    public final Function1 f85246f;

    public s1(o1 o1Var, CharSequence charSequence, List list, Uri uri, CharSequence charSequence2, l10.z zVar, int i5) {
        list = (i5 & 4) != 0 ? EmptyList.f71733a : list;
        uri = (i5 & 8) != 0 ? null : uri;
        charSequence2 = (i5 & 16) != 0 ? null : charSequence2;
        zVar = (i5 & 64) != 0 ? null : zVar;
        this.f85241a = o1Var;
        this.f85242b = charSequence;
        this.f85243c = list;
        this.f85244d = uri;
        this.f85245e = charSequence2;
        this.f85246f = zVar;
    }

    public final o1 a() {
        return this.f85241a;
    }

    public final Uri b() {
        return this.f85244d;
    }

    public final CharSequence c() {
        return this.f85242b;
    }

    public final CharSequence d() {
        return this.f85245e;
    }

    public final Function1 e() {
        return this.f85246f;
    }

    public final List f() {
        return this.f85243c;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchRow(");
        sb2.append((Object) this.f85242b);
        sb2.append(", ");
        sb2.append((Object) this.f85245e);
        sb2.append(", ");
        return a80.m.j(sb2, this.f85243c, ")");
    }
}
