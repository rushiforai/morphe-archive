package ca0;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import y90.g;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f19928a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f19929b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f19930c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashSet f19931d = g.f97029p;

    public final void a(Set set) {
        if (set == null) {
            throw new NullPointerException("extensions must not be null");
        }
        Iterator it = set.iterator();
        while (it.hasNext()) {
            if (((w90.g) it.next()) instanceof w90.g) {
                this.f19928a.add(new x90.a(0));
            }
        }
    }
}
