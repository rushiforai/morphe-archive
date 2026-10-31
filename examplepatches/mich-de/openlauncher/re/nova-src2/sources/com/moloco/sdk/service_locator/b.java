package com.moloco.sdk.service_locator;

import androidx.compose.foundation.e;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.service_locator.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.c;
import d20.h;
import db0.b0;
import db0.c0;
import db0.d;
import db0.f;
import db0.g;
import db0.h0;
import db0.i;
import db0.j;
import db0.l;
import db0.n;
import db0.p;
import db0.q;
import db0.s;
import db0.t;
import db0.v;
import db0.w;
import db0.y;
import db0.z;
import e0.i0;
import e0.l1;
import e1.h1;
import e10.a3;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Annotation;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SealedClassSerializer;
import kotlinx.serialization.internal.EnumsKt;
import p1.m0;
import v70.o;

/* loaded from: classes.dex */
public final /* synthetic */ class b implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38330a;

    public /* synthetic */ b(int i5) {
        this.f38330a = i5;
    }

    /* JADX WARN: Finally extract failed */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws IOException {
        int iIntValue;
        switch (this.f38330a) {
            case 0:
                return a.e.e();
            case 1:
                return a.e.d();
            case 2:
                return a.e.a();
            case 3:
                return a.f.f();
            case 4:
                return a.f.d();
            case 5:
                return a.f.e();
            case 6:
                return a.h.m();
            case 7:
                return a.h.l();
            case 8:
                return a.h.b();
            case 9:
                return a.h.n();
            case 10:
                return a.h.a();
            case 11:
                return a.i.e();
            case 12:
                return a.i.f();
            case 13:
                return a.i.h();
            case 14:
                return a.i.g();
            case 15:
                return a.j.a();
            case 16:
                return a.k.g();
            case 17:
                return a.k.h();
            case 18:
                return a.k.a();
            case 19:
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.a();
            case 20:
                return c.b();
            case 21:
                return h.f48903a;
            case 22:
                ReflectionFactory reflectionFactory = Reflection.f71864a;
                return new SealedClassSerializer("rdl.Event", reflectionFactory.getOrCreateKotlinClass(c0.class), new KClass[]{reflectionFactory.getOrCreateKotlinClass(db0.c.class), reflectionFactory.getOrCreateKotlinClass(f.class), reflectionFactory.getOrCreateKotlinClass(i.class), reflectionFactory.getOrCreateKotlinClass(l.class), reflectionFactory.getOrCreateKotlinClass(p.class), reflectionFactory.getOrCreateKotlinClass(s.class), reflectionFactory.getOrCreateKotlinClass(v.class), reflectionFactory.getOrCreateKotlinClass(y.class), reflectionFactory.getOrCreateKotlinClass(b0.class)}, new KSerializer[]{db0.a.f49129a, d.f49138a, g.f49146a, j.f49161a, n.f49174a, q.f49186a, t.f49203a, w.f49210a, z.f49213a}, new Annotation[0]);
            case 23:
                return EnumsKt.createSimpleEnumSerializer("rdl.LifecycleEventType", h0.values());
            case 24:
                m0 m0Var = e.f13914a;
                return i0.f50020a;
            case 25:
                return new l1();
            case 26:
                m0 m0Var2 = e1.i0.f51312a;
                return null;
            case 27:
                return h1.f51307b;
            case 28:
                return Long.valueOf(a3.f51435a.f51545a.getLong("ssml_spotify_last_update", System.currentTimeMillis() - 604800000));
            default:
                ZipFile zipFile = new ZipFile(new File("/system/framework/framework.jar"));
                try {
                    Enumeration enumeration = b70.c.w0(zipFile.entries()).f71730a;
                    while (true) {
                        if (enumeration.hasMoreElements()) {
                            ZipEntry zipEntry = (ZipEntry) enumeration.nextElement();
                            if (r70.j.A0(zipEntry.getName(), ".dex", false)) {
                                try {
                                    InputStream inputStream = zipFile.getInputStream(zipEntry);
                                    BufferedInputStream bufferedInputStream = inputStream instanceof BufferedInputStream ? (BufferedInputStream) inputStream : new BufferedInputStream(inputStream, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                    try {
                                        Integer numG = o.g(bufferedInputStream);
                                        if (numG != null) {
                                            iIntValue = numG.intValue();
                                            bufferedInputStream.close();
                                            zipFile.close();
                                        } else {
                                            Unit unit = Unit.f71706a;
                                            bufferedInputStream.close();
                                        }
                                    } finally {
                                    }
                                } catch (Exception e3) {
                                    e3.printStackTrace();
                                }
                            }
                        } else {
                            Unit unit2 = Unit.f71706a;
                            zipFile.close();
                            iIntValue = -1;
                        }
                    }
                    return Integer.valueOf(iIntValue);
                } catch (Throwable th2) {
                    try {
                        throw th2;
                    } catch (Throwable th3) {
                        CloseableKt.a(zipFile, th2);
                        throw th3;
                    }
                }
        }
    }
}
