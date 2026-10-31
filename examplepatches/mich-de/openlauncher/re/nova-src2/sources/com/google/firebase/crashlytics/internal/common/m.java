package com.google.firebase.crashlytics.internal.common;

import android.content.Context;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.concurrent.Callable;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final /* synthetic */ class m implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34717a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f34718b;

    public /* synthetic */ m(Object obj, int i5) {
        this.f34717a = i5;
        this.f34718b = obj;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        xm.e eVarA;
        FileInputStream fileInputStreamOpenFileInput;
        Throwable th2;
        switch (this.f34717a) {
            case 0:
                return ((CrashlyticsCore) this.f34718b).lambda$checkForPreviousCrash$10();
            case 1:
                return AdvertisingIdClient.getAdvertisingIdInfo((Context) this.f34718b);
            case 2:
                return ((wm.g) this.f34718b).a();
            default:
                xm.o oVar = (xm.o) this.f34718b;
                synchronized (oVar) {
                    eVarA = null;
                    try {
                        fileInputStreamOpenFileInput = oVar.f96171a.openFileInput(oVar.f96172b);
                        try {
                            int iAvailable = fileInputStreamOpenFileInput.available();
                            byte[] bArr = new byte[iAvailable];
                            fileInputStreamOpenFileInput.read(bArr, 0, iAvailable);
                            eVarA = xm.e.a(new JSONObject(new String(bArr, "UTF-8")));
                            fileInputStreamOpenFileInput.close();
                        } catch (FileNotFoundException | JSONException unused) {
                            if (fileInputStreamOpenFileInput != null) {
                                fileInputStreamOpenFileInput.close();
                            }
                            return eVarA;
                        } catch (Throwable th3) {
                            th2 = th3;
                            if (fileInputStreamOpenFileInput != null) {
                                fileInputStreamOpenFileInput.close();
                            }
                            throw th2;
                        }
                    } catch (FileNotFoundException | JSONException unused2) {
                        fileInputStreamOpenFileInput = null;
                    } catch (Throwable th4) {
                        fileInputStreamOpenFileInput = null;
                        th2 = th4;
                    }
                }
                return eVarA;
        }
    }
}
