package w0;

import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class d extends b {

    /* renamed from: b, reason: collision with root package name */
    public final String f93417b;

    /* renamed from: c, reason: collision with root package name */
    public final int f93418c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f93419d;

    public d(Object obj, String str, int i5, Function1 function1) {
        super(obj);
        this.f93417b = str;
        this.f93418c = i5;
        this.f93419d = function1;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TextContextMenuItem(key=");
        sb2.append(this.f93414a);
        sb2.append(", label=\"");
        sb2.append(this.f93417b);
        sb2.append("\", leadingIcon=");
        return a2.c.m(sb2, this.f93418c, ')');
    }
}
