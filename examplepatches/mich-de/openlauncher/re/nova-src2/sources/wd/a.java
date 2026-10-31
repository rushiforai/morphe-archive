package wd;

import fl.l;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import td.n;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ int f94185e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final g f94186a;

    /* renamed from: b, reason: collision with root package name */
    public final List f94187b;

    /* renamed from: c, reason: collision with root package name */
    public final b f94188c;

    /* renamed from: d, reason: collision with root package name */
    public final String f94189d;

    static {
        Collections.unmodifiableList(new ArrayList());
    }

    public a(g gVar, List list, b bVar, String str) {
        this.f94186a = gVar;
        this.f94187b = list;
        this.f94188c = bVar;
        this.f94189d = str;
    }

    public final byte[] a() {
        l lVar = n.f88997a;
        lVar.getClass();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            lVar.k(this, byteArrayOutputStream);
        } catch (IOException unused) {
        }
        return byteArrayOutputStream.toByteArray();
    }
}
