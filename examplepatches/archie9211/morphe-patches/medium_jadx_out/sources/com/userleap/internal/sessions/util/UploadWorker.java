package com.userleap.internal.sessions.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import com.userleap.SprigIdlingResource;
import defpackage.ajb;
import defpackage.cva;
import defpackage.dt2;
import defpackage.en7;
import defpackage.fn7;
import defpackage.g37;
import defpackage.h37;
import defpackage.iq1;
import defpackage.j37;
import defpackage.kbb;
import defpackage.n92;
import defpackage.oh4;
import defpackage.pbb;
import defpackage.qbb;
import defpackage.sbb;
import defpackage.up8;
import defpackage.x2b;
import java.io.File;
import kotlin.Metadata;
import org.json.JSONException;
import sprig.graphics.C0052d;
import sprig.graphics.q;
import sprig.j.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \u00162\u00020\u0001:\u0001\rB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0013\u0010\t\u001a\u00020\bH\u0096@ø\u0001\u0000¢\u0006\u0004\b\t\u0010\nJ \u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000bH\u0002ø\u0001\u0001ø\u0001\u0002ø\u0001\u0000¢\u0006\u0004\b\r\u0010\u000eR\u0016\u0010\u0011\u001a\u00020\u000f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\r\u0010\u0010R\u0016\u0010\u0015\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0013\u0010\u0014\u0082\u0002\u000f\n\u0002\b\u0019\n\u0002\b!\n\u0005\b¡\u001e0\u0001¨\u0006\u0017"}, d2 = {"Lcom/userleap/internal/sessions/util/UploadWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "Lj37;", "doWork", "(Ln92;)Ljava/lang/Object;", "Lbjb;", "", "a", "()Ljava/lang/Object;", "Lsprig/j/e;", "Lsprig/j/e;", "logger", "Lsprig/h/q;", "b", "Lsprig/h/q;", "uploadUrlManager", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class UploadWorker extends CoroutineWorker {
    public static final String KEY_DIRECTORY = "directory";
    public static final String KEY_FILE = "file name";
    public static final String KEY_GENERATE_URL_PAYLOAD = "upload URL";

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public e logger;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public q uploadUrlManager;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UploadWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        this.logger = new e();
        this.uploadUrlManager = new q();
    }

    public final Object a() {
        try {
            dt2 inputData = getInputData();
            inputData.getClass();
            String strNonEmptyString = C0052d.nonEmptyString(inputData, "directory");
            if (strNonEmptyString != null) {
                return Boolean.valueOf(oh4.H0(new File(strNonEmptyString)));
            }
            return null;
        } catch (Throwable th) {
            return new ajb(th);
        }
    }

    @Override // androidx.work.CoroutineWorker
    public Object doWork(n92<? super j37> n92Var) throws JSONException {
        Object ajbVar;
        dt2 inputData = getInputData();
        inputData.getClass();
        String strNonEmptyString = C0052d.nonEmptyString(inputData, KEY_FILE);
        if (strNonEmptyString == null) {
            return new g37();
        }
        dt2 inputData2 = getInputData();
        inputData2.getClass();
        String strNonEmptyString2 = C0052d.nonEmptyString(inputData2, KEY_GENERATE_URL_PAYLOAD);
        if (strNonEmptyString2 == null) {
            return new g37();
        }
        SharedPreferences sharedPreferences = getApplicationContext().getSharedPreferences("sprig_upload_data", 0);
        int i = sharedPreferences.getInt(strNonEmptyString2, 1);
        if (i > 5) {
            a();
            e.logError$default(this.logger, "UploadWorker: Invalid URL or too many attempts", null, "URL payload: " + strNonEmptyString2 + ", attempt: " + i, null, null, null, 58, null);
            return new g37();
        }
        try {
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        if (!new File(strNonEmptyString).exists()) {
            e.logError$default(this.logger, "UploadWorker: File does not exist", null, "File does not exist at path ".concat(strNonEmptyString), null, null, null, 58, null);
            return new g37();
        }
        qbb qbbVar = sbb.a;
        File file = new File(strNonEmptyString);
        x2b x2bVar = fn7.d;
        ajbVar = new pbb(en7.x("video/mp4"), file);
        if (ajbVar instanceof ajb) {
            ajbVar = null;
        }
        sbb sbbVar = (sbb) ajbVar;
        if (sbbVar == null) {
            a();
            e.logError$default(this.logger, "UploadWorker: Failed to prepare upload", null, "Failed to prepare upload for file at path ".concat(strNonEmptyString), null, null, null, 58, null);
            return new g37();
        }
        String strFetchUploadUrl = this.uploadUrlManager.fetchUploadUrl(strNonEmptyString2);
        iq1 iq1Var = new iq1(14);
        iq1Var.U(strFetchUploadUrl);
        iq1Var.J("PUT", sbbVar);
        if (!new cva(new up8(), new kbb(iq1Var), false).d().q) {
            sharedPreferences.edit().putInt(strNonEmptyString2, i + 1).apply();
            return new h37();
        }
        a();
        SprigIdlingResource sprigIdlingResource = SprigIdlingResource.INSTANCE;
        if (sprigIdlingResource.getSessionReplayExportIdlingResource().a.get() != 0) {
            int iDecrementAndGet = sprigIdlingResource.getSessionReplayExportIdlingResource().a.decrementAndGet();
            if (iDecrementAndGet == 0) {
                SystemClock.uptimeMillis();
            }
            if (iDecrementAndGet <= -1) {
                StringBuilder sb = new StringBuilder(50);
                sb.append("Counter has been corrupted! counterVal=");
                sb.append(iDecrementAndGet);
                throw new IllegalStateException(sb.toString());
            }
        }
        return j37.a();
    }
}
