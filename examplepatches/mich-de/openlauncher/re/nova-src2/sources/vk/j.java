package vk;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.Handler;
import android.view.Choreographer;
import android.view.Surface;
import b.c0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.stripe3ds2.exceptions.SDKRuntimeException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.io.TextStreamsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import o9.g2;

/* loaded from: classes3.dex */
public final class j implements we.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92816a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f92817b;

    /* renamed from: c, reason: collision with root package name */
    public Object f92818c;

    /* renamed from: d, reason: collision with root package name */
    public Object f92819d;

    public j(String url, tv.d errorReporter, CoroutineContext workContext) {
        this.f92816a = 2;
        Intrinsics.g(url, "url");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        this.f92817b = url;
        this.f92818c = errorReporter;
        this.f92819d = workContext;
    }

    public static final wv.j n(j jVar, String str, String str2) throws IOException {
        Object objA;
        BufferedReader bufferedReader;
        String url = (String) jVar.f92817b;
        Intrinsics.g(url, "url");
        URLConnection uRLConnectionOpenConnection = new URL(url).openConnection();
        Intrinsics.e(uRLConnectionOpenConnection, "null cannot be cast to non-null type java.net.HttpURLConnection");
        HttpURLConnection httpURLConnection = (HttpURLConnection) uRLConnectionOpenConnection;
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestProperty("Content-Type", str2);
        httpURLConnection.setRequestProperty("Content-Length", String.valueOf(str.length()));
        OutputStream outputStream = httpURLConnection.getOutputStream();
        try {
            Intrinsics.d(outputStream);
            Charset UTF_8 = StandardCharsets.UTF_8;
            Intrinsics.f(UTF_8, "UTF_8");
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream, UTF_8);
            try {
                outputStreamWriter.write(str);
                outputStreamWriter.flush();
                Unit unit = Unit.f71706a;
                outputStreamWriter.close();
                outputStream.close();
                httpURLConnection.connect();
                int responseCode = httpURLConnection.getResponseCode();
                if (200 > responseCode || responseCode >= 300) {
                    throw new SDKRuntimeException("Unsuccessful response code from " + url + ": " + responseCode, 0);
                }
                InputStream inputStream = httpURLConnection.getInputStream();
                Intrinsics.f(inputStream, "getInputStream(...)");
                try {
                    int i5 = Result.f71687b;
                    bufferedReader = new BufferedReader(new InputStreamReader(inputStream, Charsets.f72000b), UserMetadata.MAX_INTERNAL_KEY_SIZE);
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                try {
                    objA = TextStreamsKt.b(bufferedReader);
                    bufferedReader.close();
                    if (objA instanceof Result.Failure) {
                        objA = null;
                    }
                    String str3 = (String) objA;
                    if (str3 == null) {
                        str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    return new wv.j(str3, httpURLConnection.getContentType());
                } finally {
                }
            } finally {
            }
        } finally {
        }
    }

    @Override // we.j
    public MediaFormat a() {
        return ((MediaCodec) this.f92817b).getOutputFormat();
    }

    @Override // we.j
    public void b(ea.a aVar, Handler handler) {
        ((MediaCodec) this.f92817b).setOnFrameRenderedListener(new we.a(this, aVar, 1), handler);
    }

    @Override // we.j
    public void c(int i5) {
        ((MediaCodec) this.f92817b).setVideoScalingMode(i5);
    }

    @Override // we.j
    public ByteBuffer d(int i5) {
        return wf.v.f94376a >= 21 ? ((MediaCodec) this.f92817b).getInputBuffer(i5) : ((ByteBuffer[]) this.f92818c)[i5];
    }

    @Override // we.j
    public void e(Surface surface) {
        ((MediaCodec) this.f92817b).setOutputSurface(surface);
    }

    @Override // we.j
    public void f(int i5, ie.c cVar, long j11) throws MediaCodec.CryptoException {
        ((MediaCodec) this.f92817b).queueSecureInputBuffer(i5, 0, cVar.f61565i, j11, 0);
    }

    @Override // we.j
    public void flush() {
        ((MediaCodec) this.f92817b).flush();
    }

    @Override // we.j
    public void g(Bundle bundle) {
        ((MediaCodec) this.f92817b).setParameters(bundle);
    }

    @Override // we.j
    public void h(int i5, long j11) {
        ((MediaCodec) this.f92817b).releaseOutputBuffer(i5, j11);
    }

    @Override // we.j
    public int i() {
        return ((MediaCodec) this.f92817b).dequeueInputBuffer(0L);
    }

    @Override // we.j
    public int j(MediaCodec.BufferInfo bufferInfo) {
        int iDequeueOutputBuffer;
        MediaCodec mediaCodec = (MediaCodec) this.f92817b;
        do {
            iDequeueOutputBuffer = mediaCodec.dequeueOutputBuffer(bufferInfo, 0L);
            if (iDequeueOutputBuffer == -3 && wf.v.f94376a < 21) {
                this.f92819d = mediaCodec.getOutputBuffers();
            }
        } while (iDequeueOutputBuffer == -3);
        return iDequeueOutputBuffer;
    }

    @Override // we.j
    public void k(int i5, int i11, int i12, long j11) throws MediaCodec.CryptoException {
        ((MediaCodec) this.f92817b).queueInputBuffer(i5, 0, i11, j11, i12);
    }

    @Override // we.j
    public void l(int i5, boolean z11) {
        ((MediaCodec) this.f92817b).releaseOutputBuffer(i5, z11);
    }

    @Override // we.j
    public ByteBuffer m(int i5) {
        return wf.v.f94376a >= 21 ? ((MediaCodec) this.f92817b).getOutputBuffer(i5) : ((ByteBuffer[]) this.f92819d)[i5];
    }

    public void o(String str, String str2) {
        mh.c cVar = new mh.c(29, false);
        ((mh.c) this.f92819d).f76325d = cVar;
        this.f92819d = cVar;
        cVar.f76324c = str2;
        cVar.f76323b = str;
    }

    public void p(Object obj) {
        mh.c cVar = new mh.c(29, false);
        ((mh.c) this.f92819d).f76325d = cVar;
        this.f92819d = cVar;
        cVar.f76324c = obj;
    }

    @Override // we.j
    public void release() {
        this.f92818c = null;
        this.f92819d = null;
        ((MediaCodec) this.f92817b).release();
    }

    public String toString() {
        switch (this.f92816a) {
            case 0:
                StringBuilder sb2 = new StringBuilder(32);
                sb2.append((String) this.f92817b);
                sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
                mh.c cVar = (mh.c) ((mh.c) this.f92818c).f76325d;
                String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                while (cVar != null) {
                    Object obj = cVar.f76324c;
                    sb2.append(str);
                    String str2 = (String) cVar.f76323b;
                    if (str2 != null) {
                        sb2.append(str2);
                        sb2.append('=');
                    }
                    if (obj == null || !obj.getClass().isArray()) {
                        sb2.append(obj);
                    } else {
                        String strDeepToString = Arrays.deepToString(new Object[]{obj});
                        sb2.append((CharSequence) strDeepToString, 1, strDeepToString.length() - 1);
                    }
                    cVar = (mh.c) cVar.f76325d;
                    str = ", ";
                }
                sb2.append(AbstractJsonLexerKt.END_OBJ);
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    public j(tv.d errorReporter, CoroutineContext workContext) {
        this.f92816a = 6;
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        yv.b bVar = yv.b.f97656a;
        og.i iVar = new og.i(errorReporter, workContext);
        this.f92817b = workContext;
        this.f92818c = bVar;
        this.f92819d = iVar;
    }

    public j(MediaCodec mediaCodec) {
        this.f92816a = 1;
        this.f92817b = mediaCodec;
        if (wf.v.f94376a < 21) {
            this.f92818c = mediaCodec.getInputBuffers();
            this.f92819d = mediaCodec.getOutputBuffers();
        }
    }

    public j(String[] strArr) {
        this.f92816a = 4;
        this.f92818c = g2.f79844a;
        this.f92817b = "_id= ?";
        this.f92819d = strArr;
    }

    public j(String str) {
        this.f92816a = 0;
        mh.c cVar = new mh.c(29, false);
        this.f92818c = cVar;
        this.f92819d = cVar;
        this.f92817b = str;
    }

    public j(y90.f fVar) {
        this.f92816a = 5;
        this.f92816a = 5;
        this.f92817b = fVar;
        this.f92818c = Choreographer.getInstance();
        this.f92819d = new ib.d(this, 1);
    }

    public j() {
        this.f92816a = 3;
        String strJ = c0.j("randomUUID().toString()");
        m90.j jVar = m90.j.f76130d;
        this.f92817b = lm.e.n(strJ);
        this.f92818c = x80.c0.f95411g;
        this.f92819d = new ArrayList();
    }
}
