package s90;

import java.util.Collection;
import java.util.Collections;
import org.chromium.net.CronetException;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes5.dex */
public abstract class d1 extends RequestFinishedInfo {

    /* renamed from: a, reason: collision with root package name */
    public final String f86899a;

    /* renamed from: b, reason: collision with root package name */
    public final Collection f86900b;

    /* renamed from: c, reason: collision with root package name */
    public final f0 f86901c;

    /* renamed from: d, reason: collision with root package name */
    public final int f86902d;

    /* renamed from: e, reason: collision with root package name */
    public final UrlResponseInfo f86903e;

    /* renamed from: f, reason: collision with root package name */
    public final CronetException f86904f;

    public d1(String str, Collection collection, f0 f0Var, int i5, UrlResponseInfo urlResponseInfo, CronetException cronetException) {
        this.f86899a = str;
        this.f86900b = collection;
        this.f86901c = f0Var;
        this.f86902d = i5;
        this.f86903e = urlResponseInfo;
        this.f86904f = cronetException;
    }

    @Override // org.chromium.net.RequestFinishedInfo
    public final Collection getAnnotations() {
        Collection collection = this.f86900b;
        return collection == null ? Collections.EMPTY_LIST : collection;
    }

    @Override // org.chromium.net.RequestFinishedInfo
    public final CronetException getException() {
        return this.f86904f;
    }

    @Override // org.chromium.net.RequestFinishedInfo
    public final int getFinishedReason() {
        return this.f86902d;
    }

    @Override // org.chromium.net.RequestFinishedInfo
    public final UrlResponseInfo getResponseInfo() {
        return this.f86903e;
    }

    @Override // org.chromium.net.RequestFinishedInfo
    public final String getUrl() {
        return this.f86899a;
    }
}
