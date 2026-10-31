package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.content.res.AssetManager;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final /* synthetic */ class vd implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33143a = 1;

    /* renamed from: b, reason: collision with root package name */
    public Object f33144b;

    /* renamed from: c, reason: collision with root package name */
    public Object f33145c;

    public /* synthetic */ vd() {
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f33143a) {
            case 0:
                Context context = ((ob) this.f33144b).f32922b;
                xk.w2 w2Var = wd.f33190d;
                if (w2Var == null) {
                    synchronized (wd.f33189c) {
                        w2Var = wd.f33190d;
                        if (w2Var == null) {
                            c30.c cVarA = xk.x0.a();
                            try {
                                String[] list = context.getAssets().list("phenotype");
                                if (list != null) {
                                    for (String str : list) {
                                        if (str.endsWith("_package_metadata.binarypb")) {
                                            try {
                                                AssetManager assets = context.getAssets();
                                                StringBuilder sb2 = new StringBuilder(str.length() + 10);
                                                sb2.append("phenotype/");
                                                sb2.append(str);
                                                InputStream inputStreamOpen = assets.open(sb2.toString());
                                                try {
                                                    e1 e1Var = e1.f32488a;
                                                    int i5 = p0.f32944a;
                                                    wd wdVar = new wd(context, xd.z(inputStreamOpen, e1.f32489b));
                                                    cVarA.p(wdVar.f33192b, wdVar);
                                                    if (inputStreamOpen != null) {
                                                        inputStreamOpen.close();
                                                    }
                                                } catch (Throwable th2) {
                                                    if (inputStreamOpen != null) {
                                                        try {
                                                            inputStreamOpen.close();
                                                        } catch (Throwable th3) {
                                                            th2.addSuppressed(th3);
                                                        }
                                                    }
                                                    throw th2;
                                                    break;
                                                }
                                            } catch (zzaeh e3) {
                                                StringBuilder sb3 = new StringBuilder(str.length() + 45);
                                                sb3.append("Unable to read Phenotype PackageMetadata for ");
                                                sb3.append(str);
                                                Log.e("PackageInfo", sb3.toString(), e3);
                                            }
                                        }
                                    }
                                }
                            } catch (IOException e11) {
                                Log.e("PackageInfo", "Unable to read Phenotype PackageMetadata from assets.", e11);
                            }
                            xk.w2 w2VarC = cVarA.c(true);
                            wd.f33190d = w2VarC;
                            w2Var = w2VarC;
                        }
                    }
                }
                String str2 = (String) this.f33145c;
                if (w2Var.containsKey(str2)) {
                    return;
                }
                StringBuilder sb4 = new StringBuilder(str2.length() + TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173);
                sb4.append("Config package ");
                sb4.append(str2);
                sb4.append(" cannot use FILE backing without declarative registration. See go/phenotype-android-integration#phenotype for more information. This will lead to stale flags.");
                Log.e("FilePhenotypeFlags", sb4.toString());
                return;
            default:
                this.f33144b = null;
                this.f33145c = null;
                return;
        }
    }

    public /* synthetic */ vd(ob obVar, String str) {
        this.f33144b = obVar;
        this.f33145c = str;
    }
}
