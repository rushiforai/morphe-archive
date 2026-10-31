package com.android.volley.toolbox;

import android.util.Log;
import java.io.UnsupportedEncodingException;
import jb.k;
import jb.l;
import jb.q;

/* loaded from: classes2.dex */
public abstract class h extends jb.i {
    protected static final String PROTOCOL_CHARSET = "utf-8";
    private static final String PROTOCOL_CONTENT_TYPE = "application/json; charset=utf-8";
    private l mListener;
    private final Object mLock;
    private final String mRequestBody;

    public h(String str, String str2, l lVar, k kVar) {
        super(str, kVar);
        this.mLock = new Object();
        this.mListener = lVar;
        this.mRequestBody = str2;
    }

    @Override // jb.i
    public void cancel() {
        super.cancel();
        synchronized (this.mLock) {
            this.mListener = null;
        }
    }

    @Override // jb.i
    public void deliverResponse(Object obj) {
        l lVar;
        synchronized (this.mLock) {
            lVar = this.mListener;
        }
        if (lVar != null) {
            lVar.onResponse(obj);
        }
    }

    @Override // jb.i
    public byte[] getBody() {
        try {
            String str = this.mRequestBody;
            if (str == null) {
                return null;
            }
            return str.getBytes(PROTOCOL_CHARSET);
        } catch (UnsupportedEncodingException unused) {
            Log.wtf("Volley", q.a("Unsupported Encoding while trying to get the bytes of %s using %s", this.mRequestBody, PROTOCOL_CHARSET));
            return null;
        }
    }

    @Override // jb.i
    public String getBodyContentType() {
        return PROTOCOL_CONTENT_TYPE;
    }

    @Override // jb.i
    @Deprecated
    public byte[] getPostBody() {
        return getBody();
    }

    @Override // jb.i
    @Deprecated
    public String getPostBodyContentType() {
        return getBodyContentType();
    }
}
