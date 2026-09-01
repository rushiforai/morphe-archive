package sprig.graphics;

import android.app.Activity;
import com.userleap.internal.data.ReplayRequest;
import defpackage.b55;
import defpackage.br7;
import defpackage.c1e;
import defpackage.ch5;
import defpackage.g76;
import defpackage.gy2;
import defpackage.n92;
import defpackage.o7f;
import defpackage.oh4;
import defpackage.p4d;
import defpackage.r13;
import defpackage.sb2;
import defpackage.uv2;
import defpackage.vx0;
import defpackage.vz2;
import defpackage.wk1;
import defpackage.xg3;
import defpackage.ygf;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.Metadata;
import sprig.g.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000 #2\u00020\u0001:\u0002\u0012\u001bB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u0015\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\t\u0010\bJ\u0017\u0010\r\u001a\u0004\u0018\u00010\f2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000eJ\u0017\u0010\u000f\u001a\u0004\u0018\u00010\f2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u000f\u0010\u000eJ\r\u0010\u0010\u001a\u00020\u0006¢\u0006\u0004\b\u0010\u0010\u0003J\u0017\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\fH\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\f0\u0014H\u0002¢\u0006\u0004\b\u0015\u0010\u0016R\u0014\u0010\u0019\u001a\u00020\u00178\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\u0018R\u0014\u0010\u001d\u001a\u00020\u001a8\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u001b\u0010\u001cR\u0014\u0010\u001e\u001a\u00020\u001a8\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0015\u0010\u001cR\u0016\u0010!\u001a\u0004\u0018\u00010\u001f8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010 R\u0016\u0010\"\u001a\u0004\u0018\u00010\u001f8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010 ¨\u0006$"}, d2 = {"Lsprig/h/l;", "", "<init>", "()V", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "Lc1e;", "queueSessionForUploading", "(Lcom/userleap/internal/data/ReplayRequest;)V", "removeSessionFromUploadQueue", "", "id", "Lsprig/h/l$b;", "getQueueRecordById", "(I)Lsprig/h/l$b;", "getQueueRecordBySurveyId", "clearQueue", "queueRecord", "a", "(Lsprig/h/l$b;)V", "", "c", "()[Lsprig/h/l$b;", "Lsb2;", "Lsb2;", "ioCoroutineScope", "", "b", "Ljava/lang/String;", "QUEUE_DIR_NAME", "QUEUE_FILE_NAME", "Ljava/io/File;", "()Ljava/io/File;", "queueDirectory", "queueFile", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class l {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static l d = new l();

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final sb2 ioCoroutineScope;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final String QUEUE_DIR_NAME;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final String QUEUE_FILE_NAME;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0004¢\u0006\u0004\b\u0017\u0010\u0018J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\u001d\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u0004HÆ\u0001J\t\u0010\n\u001a\u00020\tHÖ\u0001J\t\u0010\u000b\u001a\u00020\u0002HÖ\u0001J\u0013\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R\u0017\u0010\u0007\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0019"}, d2 = {"Lsprig/h/l$b;", "", "", "component1", "Lcom/userleap/internal/data/ReplayRequest;", "component2", "id", "replayRequest", "copy", "", "toString", "hashCode", "other", "", "equals", "a", "I", "getId", "()I", "b", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "<init>", "(ILcom/userleap/internal/data/ReplayRequest;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class b {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final int id;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final ReplayRequest replayRequest;

        public b(int i, ReplayRequest replayRequest) {
            replayRequest.getClass();
            this.id = i;
            this.replayRequest = replayRequest;
        }

        public static /* synthetic */ b copy$default(b bVar, int i, ReplayRequest replayRequest, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                i = bVar.id;
            }
            if ((i2 & 2) != 0) {
                replayRequest = bVar.replayRequest;
            }
            return bVar.copy(i, replayRequest);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final int getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ReplayRequest getReplayRequest() {
            return this.replayRequest;
        }

        public final b copy(int id, ReplayRequest replayRequest) {
            replayRequest.getClass();
            return new b(id, replayRequest);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof b)) {
                return false;
            }
            b bVar = (b) other;
            return this.id == bVar.id && g76.L(this.replayRequest, bVar.replayRequest);
        }

        public final int getId() {
            return this.id;
        }

        public final ReplayRequest getReplayRequest() {
            return this.replayRequest;
        }

        public int hashCode() {
            return this.replayRequest.hashCode() + (this.id * 31);
        }

        public String toString() {
            return "QueueRecord(id=" + this.id + ", replayRequest=" + this.replayRequest + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionUploadQueue$appendQueueRecord$1", f = "SessionUploadQueue.kt", l = {}, m = "invokeSuspend")
    public static final class c extends p4d implements b55 {
        final /* synthetic */ File $queueFile;
        final /* synthetic */ b $queueRecord;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(b bVar, File file, n92<? super c> n92Var) {
            super(2, n92Var);
            this.$queueRecord = bVar;
            this.$queueFile = file;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return l.this.new c(this.$queueRecord, this.$queueFile, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((c) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws IOException {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            b[] bVarArrC = l.this.c();
            ch5 ch5Var = new ch5();
            b bVar = this.$queueRecord;
            bVarArrC.getClass();
            int length = bVarArrC.length;
            Object[] objArrCopyOf = Arrays.copyOf(bVarArrC, length + 1);
            objArrCopyOf[length] = bVar;
            oh4.L0(this.$queueFile, ch5Var.h(objArrCopyOf));
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionUploadQueue$clearQueue$1", f = "SessionUploadQueue.kt", l = {}, m = "invokeSuspend")
    public static final class d extends p4d implements b55 {
        final /* synthetic */ File $queueFile;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(File file, n92<? super d> n92Var) {
            super(2, n92Var);
            this.$queueFile = file;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return new d(this.$queueFile, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((d) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws IOException {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            oh4.L0(this.$queueFile, "");
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.SessionUploadQueue$removeSessionFromUploadQueue$1", f = "SessionUploadQueue.kt", l = {}, m = "invokeSuspend")
    public static final class e extends p4d implements b55 {
        final /* synthetic */ File $queueFile;
        final /* synthetic */ ReplayRequest $replayRequest;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(File file, ReplayRequest replayRequest, n92<? super e> n92Var) {
            super(2, n92Var);
            this.$queueFile = file;
            this.$replayRequest = replayRequest;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return l.this.new e(this.$queueFile, this.$replayRequest, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((e) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws IOException {
            b bVar = null;
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            b[] bVarArrC = l.this.c();
            ReplayRequest replayRequest = this.$replayRequest;
            int length = bVarArrC.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                b bVar2 = bVarArrC[i];
                if (bVar2.getId() == replayRequest.getSurveyId()) {
                    bVar = bVar2;
                    break;
                }
                i++;
            }
            c1e c1eVar = c1e.a;
            if (bVar == null) {
                return c1eVar;
            }
            ch5 ch5Var = new ch5();
            ReplayRequest replayRequest2 = this.$replayRequest;
            ArrayList arrayList = new ArrayList();
            for (b bVar3 : bVarArrC) {
                if (bVar3.getId() != replayRequest2.getSurveyId()) {
                    arrayList.add(bVar3);
                }
            }
            oh4.L0(this.$queueFile, ch5Var.h(arrayList));
            return c1eVar;
        }
    }

    public l() {
        r13 r13Var = xg3.a;
        this.ioCoroutineScope = o7f.c(vz2.c);
        this.QUEUE_DIR_NAME = "sprig_queue";
        this.QUEUE_FILE_NAME = "sprig_queue_records.json";
    }

    public final File a() {
        Activity currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
        if (currentActivity == null) {
            return null;
        }
        File file = new File(currentActivity.getApplicationContext().getFilesDir(), this.QUEUE_DIR_NAME);
        if (file.exists() || file.mkdir()) {
            return file;
        }
        return null;
    }

    public final File b() {
        File fileA = a();
        if (fileA == null) {
            return null;
        }
        File file = new File(fileA, this.QUEUE_FILE_NAME);
        if (file.exists() || file.createNewFile()) {
            return file;
        }
        return null;
    }

    public final b[] c() throws IOException {
        File fileB = b();
        if (fileB == null) {
            return new b[0];
        }
        String strK0 = oh4.K0(fileB, wk1.a);
        if (strK0.length() == 0) {
            return new b[0];
        }
        Object objC = new ch5().c(b[].class, strK0);
        objC.getClass();
        return (b[]) objC;
    }

    public final void clearQueue() {
        File fileB = b();
        if (fileB == null) {
            return;
        }
        vx0.c0(this.ioCoroutineScope, null, null, new d(fileB, null), 3);
    }

    public final b getQueueRecordById(int id) throws IOException {
        File fileB = b();
        if (fileB == null) {
            return null;
        }
        String strK0 = oh4.K0(fileB, wk1.a);
        if (strK0.length() == 0) {
            return null;
        }
        b[] bVarArr = (b[]) new ch5().c(b[].class, strK0);
        bVarArr.getClass();
        for (b bVar : bVarArr) {
            if (bVar.getId() == id) {
                return bVar;
            }
        }
        return null;
    }

    public final b getQueueRecordBySurveyId(int id) throws IOException {
        File fileB = b();
        if (fileB == null) {
            return null;
        }
        String strK0 = oh4.K0(fileB, wk1.a);
        if (strK0.length() == 0) {
            return null;
        }
        b[] bVarArr = (b[]) new ch5().c(b[].class, strK0);
        bVarArr.getClass();
        for (b bVar : bVarArr) {
            if (bVar.getReplayRequest().getSurveyId() == id) {
                return bVar;
            }
        }
        return null;
    }

    public final void queueSessionForUploading(ReplayRequest replayRequest) {
        replayRequest.getClass();
        if (replayRequest.getSessionRecorderOutcome() instanceof b.C0022b) {
            a(new b(replayRequest.getSurveyId(), replayRequest));
        }
    }

    public final void removeSessionFromUploadQueue(ReplayRequest replayRequest) {
        replayRequest.getClass();
        File fileB = b();
        if (fileB == null) {
            return;
        }
        vx0.c0(this.ioCoroutineScope, null, null, new e(fileB, replayRequest, null), 3);
    }

    /* JADX INFO: renamed from: sprig.h.l$a, reason: from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000f\u0010\u0007\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\f\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\n\u0010\u000bR\u0016\u0010\r\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lsprig/h/l$a;", "", "<init>", "()V", "Lsprig/h/l;", "get$userleap_release", "()Lsprig/h/l;", "get", "override", "Lc1e;", "set$userleap_release", "(Lsprig/h/l;)V", "set", "instance", "Lsprig/h/l;", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final l get$userleap_release() {
            return l.d;
        }

        public final void set$userleap_release(l override) {
            override.getClass();
            l.d = override;
        }

        private Companion() {
        }
    }

    public final void a(b queueRecord) {
        File fileB = b();
        if (fileB != null && getQueueRecordById(queueRecord.getId()) == null) {
            vx0.c0(this.ioCoroutineScope, null, null, new c(queueRecord, fileB, null), 3);
        }
    }
}
