package jb;

import ai.e3;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import b.c0;
import com.android.volley.AuthFailureError;
import com.android.volley.VolleyError;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public abstract class i implements Comparable {
    private static final String DEFAULT_PARAMS_ENCODING = "UTF-8";
    private a mCacheEntry;
    private boolean mCanceled;
    private final int mDefaultTrafficStatsTag;
    private k mErrorListener;
    private final p mEventLog;
    private final Object mLock;
    private final int mMethod;
    private g mRequestCompleteListener;
    private j mRequestQueue;
    private boolean mResponseDelivered;
    private n mRetryPolicy;
    private Integer mSequence;
    private boolean mShouldCache;
    private boolean mShouldRetryConnectionErrors;
    private boolean mShouldRetryServerErrors;
    private Object mTag;
    private final String mUrl;

    public i(String str, k kVar) {
        Uri uri;
        String host;
        this.mEventLog = p.f69421c ? new p() : null;
        this.mLock = new Object();
        this.mShouldCache = true;
        int iHashCode = 0;
        this.mCanceled = false;
        this.mResponseDelivered = false;
        this.mShouldRetryServerErrors = false;
        this.mShouldRetryConnectionErrors = false;
        this.mCacheEntry = null;
        this.mMethod = 0;
        this.mUrl = str;
        this.mErrorListener = kVar;
        setRetryPolicy(new c(2500, 1, 1.0f));
        if (!TextUtils.isEmpty(str) && (uri = Uri.parse(str)) != null && (host = uri.getHost()) != null) {
            iHashCode = host.hashCode();
        }
        this.mDefaultTrafficStatsTag = iHashCode;
    }

    public static byte[] a(String str, Map map) {
        StringBuilder sb2 = new StringBuilder();
        try {
            for (Map.Entry entry : map.entrySet()) {
                if (entry.getKey() == null || entry.getValue() == null) {
                    throw new IllegalArgumentException(String.format("Request#getParams() or Request#getPostParams() returned a map containing a null key or value: (%s, %s). All keys and values must be non-null.", entry.getKey(), entry.getValue()));
                }
                sb2.append(URLEncoder.encode((String) entry.getKey(), str));
                sb2.append('=');
                sb2.append(URLEncoder.encode((String) entry.getValue(), str));
                sb2.append('&');
            }
            return sb2.toString().getBytes(str);
        } catch (UnsupportedEncodingException e3) {
            throw new RuntimeException(c0.k("Encoding not supported: ", str), e3);
        }
    }

    public void addMarker(String str) {
        if (p.f69421c) {
            this.mEventLog.a(Thread.currentThread().getId(), str);
        }
    }

    public void cancel() {
        synchronized (this.mLock) {
            this.mCanceled = true;
            this.mErrorListener = null;
        }
    }

    public void deliverError(VolleyError volleyError) {
        k kVar;
        synchronized (this.mLock) {
            kVar = this.mErrorListener;
        }
        if (kVar != null) {
            kVar.onErrorResponse(volleyError);
        }
    }

    public abstract void deliverResponse(Object obj);

    public void finish(String str) {
        j jVar = this.mRequestQueue;
        if (jVar != null) {
            synchronized (jVar.f69404b) {
                jVar.f69404b.remove(this);
            }
            synchronized (jVar.f69412j) {
                Iterator it = jVar.f69412j.iterator();
                if (it.hasNext()) {
                    if (it.next() != null) {
                        throw new ClassCastException();
                    }
                    throw null;
                }
            }
            jVar.b();
        }
        if (p.f69421c) {
            long id2 = Thread.currentThread().getId();
            if (Looper.myLooper() != Looper.getMainLooper()) {
                new Handler(Looper.getMainLooper()).post(new e3(this, str, id2, 3));
            } else {
                this.mEventLog.a(id2, str);
                this.mEventLog.b(toString());
            }
        }
    }

    public byte[] getBody() throws AuthFailureError {
        Map<String, String> params = getParams();
        if (params == null || params.size() <= 0) {
            return null;
        }
        return a(getParamsEncoding(), params);
    }

    public String getBodyContentType() {
        return "application/x-www-form-urlencoded; charset=" + getParamsEncoding();
    }

    public a getCacheEntry() {
        return this.mCacheEntry;
    }

    public String getCacheKey() {
        String url = getUrl();
        int method = getMethod();
        if (method == 0 || method == -1) {
            return url;
        }
        return Integer.toString(method) + '-' + url;
    }

    public k getErrorListener() {
        k kVar;
        synchronized (this.mLock) {
            kVar = this.mErrorListener;
        }
        return kVar;
    }

    public abstract Map getHeaders();

    public int getMethod() {
        return this.mMethod;
    }

    public Map<String, String> getParams() throws AuthFailureError {
        return null;
    }

    public String getParamsEncoding() {
        return DEFAULT_PARAMS_ENCODING;
    }

    @Deprecated
    public byte[] getPostBody() throws AuthFailureError {
        Map<String, String> postParams = getPostParams();
        if (postParams == null || postParams.size() <= 0) {
            return null;
        }
        return a(getPostParamsEncoding(), postParams);
    }

    @Deprecated
    public String getPostBodyContentType() {
        return getBodyContentType();
    }

    @Deprecated
    public Map<String, String> getPostParams() throws AuthFailureError {
        return getParams();
    }

    @Deprecated
    public String getPostParamsEncoding() {
        return getParamsEncoding();
    }

    public h getPriority() {
        return h.f69401b;
    }

    public n getRetryPolicy() {
        return this.mRetryPolicy;
    }

    public final int getSequence() {
        Integer num = this.mSequence;
        if (num != null) {
            return num.intValue();
        }
        throw new IllegalStateException("getSequence called before setSequence");
    }

    public Object getTag() {
        return this.mTag;
    }

    public final int getTimeoutMs() {
        return ((c) getRetryPolicy()).f69384a;
    }

    public int getTrafficStatsTag() {
        return this.mDefaultTrafficStatsTag;
    }

    public String getUrl() {
        return this.mUrl;
    }

    public boolean hasHadResponseDelivered() {
        boolean z11;
        synchronized (this.mLock) {
            z11 = this.mResponseDelivered;
        }
        return z11;
    }

    public boolean isCanceled() {
        boolean z11;
        synchronized (this.mLock) {
            z11 = this.mCanceled;
        }
        return z11;
    }

    public void markDelivered() {
        synchronized (this.mLock) {
            this.mResponseDelivered = true;
        }
    }

    public void notifyListenerResponseNotUsable() {
        g gVar;
        synchronized (this.mLock) {
            gVar = this.mRequestCompleteListener;
        }
        if (gVar != null) {
            ((tm.o) gVar).t0(this);
        }
    }

    public void notifyListenerResponseReceived(m mVar) {
        g gVar;
        List list;
        synchronized (this.mLock) {
            gVar = this.mRequestCompleteListener;
        }
        if (gVar != null) {
            tm.o oVar = (tm.o) gVar;
            a aVar = mVar.f69415b;
            if (aVar != null) {
                if (aVar.f69373e >= System.currentTimeMillis()) {
                    String cacheKey = getCacheKey();
                    synchronized (oVar) {
                        list = (List) ((HashMap) oVar.f89493b).remove(cacheKey);
                    }
                    if (list != null) {
                        if (q.f69424a) {
                            q.c("Releasing %d waiting requests for cacheKey=%s.", Integer.valueOf(list.size()), cacheKey);
                        }
                        Iterator it = list.iterator();
                        while (it.hasNext()) {
                            ((gu.j) oVar.f89494c).k((i) it.next(), mVar, null);
                        }
                        return;
                    }
                    return;
                }
            }
            oVar.t0(this);
        }
    }

    public VolleyError parseNetworkError(VolleyError volleyError) {
        return volleyError;
    }

    public abstract m parseNetworkResponse(f fVar);

    public void sendEvent(int i5) {
        j jVar = this.mRequestQueue;
        if (jVar != null) {
            jVar.b();
        }
    }

    public i setCacheEntry(a aVar) {
        this.mCacheEntry = aVar;
        return this;
    }

    public void setNetworkRequestCompleteListener(g gVar) {
        synchronized (this.mLock) {
            this.mRequestCompleteListener = gVar;
        }
    }

    public i setRequestQueue(j jVar) {
        this.mRequestQueue = jVar;
        return this;
    }

    public i setRetryPolicy(n nVar) {
        this.mRetryPolicy = nVar;
        return this;
    }

    public final i setSequence(int i5) {
        this.mSequence = Integer.valueOf(i5);
        return this;
    }

    public final i setShouldCache(boolean z11) {
        this.mShouldCache = z11;
        return this;
    }

    public final i setShouldRetryConnectionErrors(boolean z11) {
        this.mShouldRetryConnectionErrors = z11;
        return this;
    }

    public final i setShouldRetryServerErrors(boolean z11) {
        this.mShouldRetryServerErrors = z11;
        return this;
    }

    public i setTag(Object obj) {
        this.mTag = obj;
        return this;
    }

    public final boolean shouldCache() {
        return this.mShouldCache;
    }

    public final boolean shouldRetryConnectionErrors() {
        return this.mShouldRetryConnectionErrors;
    }

    public final boolean shouldRetryServerErrors() {
        return this.mShouldRetryServerErrors;
    }

    public String toString() {
        String str = "0x" + Integer.toHexString(getTrafficStatsTag());
        StringBuilder sb2 = new StringBuilder();
        sb2.append(isCanceled() ? "[X] " : "[ ] ");
        sb2.append(getUrl());
        sb2.append(" ");
        sb2.append(str);
        sb2.append(" ");
        sb2.append(getPriority());
        sb2.append(" ");
        sb2.append(this.mSequence);
        return sb2.toString();
    }

    @Override // java.lang.Comparable
    public int compareTo(i iVar) {
        h priority = getPriority();
        h priority2 = iVar.getPriority();
        return priority == priority2 ? this.mSequence.intValue() - iVar.mSequence.intValue() : priority2.ordinal() - priority.ordinal();
    }
}
