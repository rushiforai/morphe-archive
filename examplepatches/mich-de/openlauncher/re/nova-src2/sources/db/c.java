package db;

import ga.h;
import java.util.List;
import java.util.stream.Collectors;
import jz.m;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public final h f49120a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49121b;

    /* renamed from: c, reason: collision with root package name */
    public final List f49122c;

    public c(h hVar, String str, List list) {
        this.f49120a = hVar;
        this.f49121b = str;
        this.f49122c = (List) list.stream().sorted(new m(0)).collect(Collectors.toList());
    }

    public abstract int b();
}
