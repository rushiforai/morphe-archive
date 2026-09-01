package com.userleap.internal.sessions.util;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import defpackage.ajb;
import defpackage.bjb;
import defpackage.ct2;
import defpackage.dt2;
import defpackage.ey3;
import defpackage.f09;
import defpackage.g37;
import defpackage.i37;
import defpackage.j37;
import defpackage.k80;
import defpackage.kyd;
import defpackage.n92;
import defpackage.oh4;
import java.io.File;
import java.util.List;
import kotlin.Metadata;
import org.json.JSONException;
import sprig.graphics.C0052d;
import sprig.graphics.r;
import sprig.j.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \u000f2\u00020\u0001:\u0001\fB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0013\u0010\t\u001a\u00020\bH\u0096@ø\u0001\u0000¢\u0006\u0004\b\t\u0010\nR\u0014\u0010\u000e\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\r\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u0010"}, d2 = {"Lcom/userleap/internal/sessions/util/ReplayEncoderWorker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "Lj37;", "doWork", "(Ln92;)Ljava/lang/Object;", "Lsprig/j/e;", "a", "Lsprig/j/e;", "logger", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class ReplayEncoderWorker extends CoroutineWorker {
    public static final String KEY_DIRECTORY = "directory";
    public static final String KEY_FRAME_RATE = "frame rate";
    public static final String VIDEO_FILE = "recording.mp4";
    public static final String WORK_TAG = "ReplayEncoderWorker";

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final e logger;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ReplayEncoderWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        this.logger = new e();
    }

    @Override // androidx.work.CoroutineWorker
    public Object doWork(n92<? super j37> n92Var) throws JSONException {
        Object ajbVar;
        dt2 inputData = getInputData();
        inputData.getClass();
        String strNonEmptyString = C0052d.nonEmptyString(inputData, "directory");
        if (strNonEmptyString == null) {
            return new g37();
        }
        File file = new File(strNonEmptyString);
        try {
            File[] fileArrListFiles = file.listFiles();
            ajbVar = fileArrListFiles != null ? k80.Q0(fileArrListFiles) : null;
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            e.logError$default(this.logger, "ReplayEncoderWorker: Error loading files", null, "Error loading files: " + thB, kyd.h0(thB), null, null, 50, null);
        }
        if (bjb.b(ajbVar) != null) {
            ajbVar = ey3.a;
        }
        List<? extends File> list = (List) ajbVar;
        if (list == null || list.isEmpty()) {
            e.logError$default(this.logger, "ReplayEncoderWorker: No files to encode", null, null, null, null, null, 62, null);
            oh4.H0(file);
            return new g37();
        }
        File file2 = new File(file, VIDEO_FILE);
        r rVar = new r();
        String path = file2.getPath();
        path.getClass();
        Object objM174encodegIAlus = rVar.m174encodegIAlus(path, list);
        Throwable thB2 = bjb.b(objM174encodegIAlus);
        if (thB2 == null) {
            f09[] f09VarArr = {new f09(UploadWorker.KEY_FILE, file2.getPath())};
            ct2 ct2Var = new ct2(0, false);
            f09 f09Var = f09VarArr[0];
            ct2Var.d((String) f09Var.a, f09Var.b);
            return new i37(ct2Var.a());
        }
        e.logError$default(this.logger, "ReplayEncoderWorker: Error encoding", null, "Error encoding: " + thB2, kyd.h0(thB2), null, null, 50, null);
        oh4.H0(file);
        return new g37();
    }
}
