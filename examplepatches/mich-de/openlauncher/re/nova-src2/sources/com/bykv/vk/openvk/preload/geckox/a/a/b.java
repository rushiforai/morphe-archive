package com.bykv.vk.openvk.preload.geckox.a.a;

import android.annotation.SuppressLint;
import java.io.File;
import java.util.List;

@SuppressLint({"CI_StaticFieldLeak"})
/* loaded from: classes2.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f21999a = new d();

    /* renamed from: b, reason: collision with root package name */
    public static final b f22000b;

    /* renamed from: c, reason: collision with root package name */
    protected a f22001c;

    /* renamed from: d, reason: collision with root package name */
    protected File f22002d;

    /* renamed from: e, reason: collision with root package name */
    protected List<String> f22003e;

    static {
        new f();
        f22000b = new e();
    }

    public abstract void a();

    public void a(a aVar, File file, List<String> list) {
        this.f22001c = aVar;
        this.f22002d = file;
        this.f22003e = list;
    }
}
