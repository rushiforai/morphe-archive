package com.vungle.ads.internal.omsdk;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.iab.omid.library.vungle.Omid;
import com.iab.omid.library.vungle.internal.l;
import com.vungle.ads.R;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import g.p;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47313a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f47314b;

    /* renamed from: c, reason: collision with root package name */
    public AtomicReference f47315c;

    /* renamed from: d, reason: collision with root package name */
    public AtomicReference f47316d;

    public c(Context context) {
        Intrinsics.g(context, "context");
        this.f47313a = context;
        this.f47314b = new Handler(Looper.getMainLooper());
        this.f47315c = new AtomicReference(null);
        this.f47316d = new AtomicReference(null);
    }

    public static final void a(c this$0) {
        Object objA;
        Intrinsics.g(this$0, "this$0");
        try {
            int i5 = Result.f71687b;
            if (!Omid.isActive()) {
                Omid.activate(this$0.f47313a);
            }
            objA = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = l.a("error: ");
            sbA.append(thA.getLocalizedMessage());
            t.b("OMInjector", sbA.toString());
        }
    }

    public final void b() {
        this.f47314b.post(new p(this, 2));
    }

    public final void a(File dir) {
        FileWriter fileWriter;
        Intrinsics.g(dir, "dir");
        ArrayList arrayList = new ArrayList();
        File file = new File(dir, "omsdk.js");
        if (!file.exists()) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = l.a("injecting omsdk.js to ");
            sbA.append(file.getAbsolutePath());
            t.a("OMInjector", sbA.toString());
            String strA = a();
            if (strA != null) {
                fileWriter = new FileWriter(file);
                try {
                    fileWriter.write(strA);
                    fileWriter.flush();
                    fileWriter.close();
                } finally {
                }
            }
            arrayList.add(file);
        }
        File file2 = new File(dir, "omsdk-session.js");
        if (file2.exists()) {
            return;
        }
        boolean z12 = u.f47714a;
        StringBuilder sbA2 = l.a("injecting omsdk-session.js to ");
        sbA2.append(file2.getAbsolutePath());
        t.a("OMInjector", sbA2.toString());
        String strA2 = (String) this.f47316d.get();
        if (strA2 == null) {
            strA2 = a(R.raw.omid_session_client_v1_6_2);
            this.f47316d.set(strA2);
        }
        if (strA2 != null) {
            fileWriter = new FileWriter(file2);
            try {
                fileWriter.write(strA2);
                fileWriter.flush();
                fileWriter.close();
            } finally {
            }
        }
        arrayList.add(file2);
    }

    public final String a() {
        String str = (String) this.f47315c.get();
        if (str != null) {
            return str;
        }
        String strA = a(R.raw.omsdk_v1_6_2);
        this.f47315c.set(strA);
        return strA;
    }

    public final String a(int i5) {
        Object objA;
        try {
            int i11 = Result.f71687b;
            InputStream inputStreamOpenRawResource = this.f47313a.getResources().openRawResource(i5);
            Intrinsics.f(inputStreamOpenRawResource, "context.resources.openRawResource(resId)");
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpenRawResource, Charsets.f72000b), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                objA = TextStreamsKt.b(bufferedReader);
                bufferedReader.close();
            } finally {
            }
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        return (String) objA;
    }
}
