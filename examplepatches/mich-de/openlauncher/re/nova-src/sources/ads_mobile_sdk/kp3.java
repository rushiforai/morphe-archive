package ads_mobile_sdk;

import androidx.webkit.StartUpLocation;
import androidx.webkit.WebViewStartUpResult;
import b.f6;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public final class kp3 implements f6 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ WebViewStartUpResult f5930a;

    public kp3(WebViewStartUpResult webViewStartUpResult) {
        this.f5930a = webViewStartUpResult;
    }

    @Override // b.f6
    public final List a() {
        try {
            List<StartUpLocation> nonUiThreadBlockingStartUpLocations = this.f5930a.getNonUiThreadBlockingStartUpLocations();
            if (nonUiThreadBlockingStartUpLocations != null) {
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = nonUiThreadBlockingStartUpLocations.iterator();
                while (it.hasNext()) {
                    String stackInformation = ((StartUpLocation) it.next()).getStackInformation();
                    if (stackInformation == null) {
                        stackInformation = null;
                    }
                    if (stackInformation != null) {
                        arrayList.add(stackInformation);
                    }
                }
                return arrayList;
            }
        } catch (Throwable unused) {
        }
        return null;
    }

    @Override // b.f6
    public final List b() {
        try {
            List<StartUpLocation> uiThreadBlockingStartUpLocations = this.f5930a.getUiThreadBlockingStartUpLocations();
            if (uiThreadBlockingStartUpLocations != null) {
                ArrayList arrayList = new ArrayList();
                Iterator<T> it = uiThreadBlockingStartUpLocations.iterator();
                while (it.hasNext()) {
                    String stackInformation = ((StartUpLocation) it.next()).getStackInformation();
                    if (stackInformation == null) {
                        stackInformation = null;
                    }
                    if (stackInformation != null) {
                        arrayList.add(stackInformation);
                    }
                }
                return arrayList;
            }
        } catch (Throwable unused) {
        }
        return null;
    }

    @Override // b.f6
    public final Long getMaxTimePerTaskInUiThreadMillis() {
        try {
            return this.f5930a.getMaxTimePerTaskInUiThreadMillis();
        } catch (Throwable unused) {
            return null;
        }
    }

    @Override // b.f6
    public final Long getTotalTimeInUiThreadMillis() {
        try {
            return this.f5930a.getTotalTimeInUiThreadMillis();
        } catch (Throwable unused) {
            return null;
        }
    }
}
