package com.fyber.inneractive.sdk.privacy;

import android.content.SharedPreferences;
import android.os.Handler;
import com.fyber.inneractive.sdk.util.r;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class b implements SharedPreferences.OnSharedPreferenceChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c f30747a;

    public b(c cVar) {
        this.f30747a = cVar;
    }

    @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
    public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        if (str != null) {
            if (str.startsWith("IABTCF_") || str.startsWith("IABGPP_")) {
                c cVar = this.f30747a;
                cVar.getClass();
                synchronized (c.f30748g) {
                    try {
                        if (cVar.f30751c) {
                            String str2 = (String) cVar.f30750b.get();
                            AtomicReference atomicReference = cVar.f30750b;
                            if (str2 != null) {
                                str = str2 + "," + str;
                            }
                            atomicReference.set(str);
                            a aVar = cVar.f30752d;
                            Handler handler = r.f31216b;
                            handler.removeCallbacks(aVar);
                            handler.postDelayed(cVar.f30752d, 100L);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
        }
    }
}
