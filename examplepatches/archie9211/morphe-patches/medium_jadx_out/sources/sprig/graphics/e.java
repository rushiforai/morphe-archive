package sprig.graphics;

import android.content.Context;
import android.graphics.Bitmap;
import android.text.TextUtils;
import androidx.credentials.playservices.controllers.identitycredentials.signalcredentialstate.SignalCredentialStateController;
import defpackage.ajb;
import defpackage.b55;
import defpackage.bjb;
import defpackage.br7;
import defpackage.c1e;
import defpackage.co6;
import defpackage.ev6;
import defpackage.flb;
import defpackage.gy2;
import defpackage.hi3;
import defpackage.kb2;
import defpackage.kyd;
import defpackage.lh4;
import defpackage.n92;
import defpackage.o7f;
import defpackage.oh4;
import defpackage.p4d;
import defpackage.p92;
import defpackage.qq7;
import defpackage.r13;
import defpackage.sb2;
import defpackage.uv2;
import defpackage.vx0;
import defpackage.vz2;
import defpackage.x45;
import defpackage.xg3;
import defpackage.ygf;
import java.io.File;
import java.io.FilenameFilter;
import java.util.Iterator;
import java.util.UUID;
import kotlin.Metadata;
import org.json.JSONException;
import sprig.graphics.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\u0018\u0000 ?2\u00020\u0001:\u0001'B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J3\u0010\u000f\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\b2\u0014\u0010\u000e\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\f\u0012\u0004\u0012\u00020\r0\u000b¢\u0006\u0004\b\u000f\u0010\u0010JE\u0010\u001a\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\f2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00162\u0016\b\u0002\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\r\u0018\u00010\u000b¢\u0006\u0004\b\u001a\u0010\u001bJ-\u0010\u001a\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\f2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u001a\u0010\u001cJ%\u0010\u001f\u001a\u00020\r2\u0006\u0010\u001d\u001a\u00020\b2\b\b\u0002\u0010\u001e\u001a\u00020\bH\u0086@ø\u0001\u0000¢\u0006\u0004\b\u001f\u0010 J\r\u0010!\u001a\u00020\u0014¢\u0006\u0004\b!\u0010\"J\r\u0010#\u001a\u00020\b¢\u0006\u0004\b#\u0010$J\u001d\u0010'\u001a\u0004\u0018\u00010&2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\fH\u0002¢\u0006\u0004\b'\u0010(J/\u0010'\u001a\u0012\u0012\u000e\b\u0001\u0012\n **\u0004\u0018\u00010\f0\f0)2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\bH\u0002¢\u0006\u0004\b'\u0010+R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b'\u0010,R\u001c\u0010/\u001a\n **\u0004\u0018\u00010\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b-\u0010.R\u0014\u00103\u001a\u0002008\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b1\u00102R\u0014\u00107\u001a\u0002048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b5\u00106R$\u0010>\u001a\u0004\u0018\u00010&8F@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b8\u00109\u001a\u0004\b:\u0010;\"\u0004\b<\u0010=\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006@"}, d2 = {"Lsprig/h/e;", "", "Landroid/content/Context;", "context", "Lkb2;", "dispatcher", "<init>", "(Landroid/content/Context;Lkb2;)V", "", "startTime", "endTime", "Lkotlin/Function1;", "", "Lc1e;", "callback", "copyFiles", "(JJLx45;)V", "name", "Landroid/graphics/Bitmap;", "bitmap", "", "jpegQuality", "Lsprig/h/i;", "metrics", "", "onComplete", "saveImage", "(Ljava/lang/String;Landroid/graphics/Bitmap;ILsprig/h/i;Lx45;)V", "(Ljava/lang/String;Landroid/graphics/Bitmap;ILsprig/h/i;)V", "currentTime", "threshold", "removeOldFiles", "(JJLn92;)Ljava/lang/Object;", "getFileCount", "()I", "getDirectorySize", "()J", "subDirectory", "Ljava/io/File;", "a", "(Ljava/lang/String;)Ljava/io/File;", "", "kotlin.jvm.PlatformType", "(JJ)[Ljava/lang/String;", "Lkb2;", "b", "Landroid/content/Context;", "appContext", "Lsprig/j/e;", "c", "Lsprig/j/e;", "logger", "Lsb2;", "d", "Lsb2;", "coroutineScope", "e", "Ljava/io/File;", "getCurrentDirectory", "()Ljava/io/File;", "setCurrentDirectory", "(Ljava/io/File;)V", "currentDirectory", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class e {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final kb2 dispatcher;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final Context appContext;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final sprig.j.e logger;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public final sb2 coroutineScope;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public File currentDirectory;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.FileManager$copyFiles$1", f = "FileManager.kt", l = {}, m = "invokeSuspend")
    public static final class b extends p4d implements b55 {
        final /* synthetic */ x45 $callback;
        final /* synthetic */ long $endTime;
        final /* synthetic */ long $startTime;
        public /* synthetic */ Object a;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(long j, long j2, x45 x45Var, n92<? super b> n92Var) {
            super(2, n92Var);
            this.$startTime = j;
            this.$endTime = j2;
            this.$callback = x45Var;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            b bVar = e.this.new b(this.$startTime, this.$endTime, this.$callback, n92Var);
            bVar.a = obj;
            return bVar;
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((b) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws JSONException {
            Object ajbVar;
            c1e c1eVar = c1e.a;
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            try {
                File currentDirectory = e.this.getCurrentDirectory();
                if (currentDirectory == null) {
                    sprig.j.e.logError$default(e.this.logger, "Current directory is null in copyFiles", null, "startTime: " + this.$startTime + ", endTime: " + this.$endTime, null, null, null, 58, null);
                    this.$callback.invoke(null);
                    return c1eVar;
                }
                String string = UUID.randomUUID().toString();
                string.getClass();
                File fileA = e.this.a(string);
                e eVar = e.this;
                if (fileA == null) {
                    sprig.j.e.logError$default(eVar.logger, "Failed to create recording directory", null, "ID: " + string + ", startTime: " + this.$startTime + ", endTime: " + this.$endTime, null, null, null, 58, null);
                    this.$callback.invoke(null);
                    return c1eVar;
                }
                String[] strArrA = eVar.a(this.$startTime, this.$endTime);
                sprig.j.e.logDebug$default(e.this.logger, "Copying " + strArrA.length + " files from " + this.$startTime + " to " + this.$endTime, null, null, null, null, null, 62, null);
                int length = strArrA.length;
                e eVar2 = e.this;
                if (length == 0) {
                    sprig.j.e.logWarning$default(eVar2.logger, "No files found to copy in time range " + this.$startTime + " to " + this.$endTime, null, null, null, null, null, 62, null);
                    oh4.H0(fileA);
                    this.$callback.invoke(null);
                    return c1eVar;
                }
                try {
                    for (String str : strArrA) {
                        str.getClass();
                        File fileA2 = f.a(str, currentDirectory);
                        File file = new File(fileA, str);
                        if (fileA2.exists()) {
                            oh4.G0(fileA2, file);
                            sprig.j.e.logDebug$default(eVar2.logger, "Copied file: " + str, null, null, null, null, null, 62, null);
                        } else {
                            sprig.j.e.logWarning$default(eVar2.logger, "Source file does not exist: " + fileA2.getPath(), null, null, null, null, null, 62, null);
                        }
                    }
                    ajbVar = fileA.getPath();
                } catch (Throwable th) {
                    ajbVar = new ajb(th);
                }
                e eVar3 = e.this;
                long j = this.$startTime;
                long j2 = this.$endTime;
                Throwable thB = bjb.b(ajbVar);
                if (thB != null) {
                    oh4.H0(fileA);
                    sprig.j.e.logError$default(eVar3.logger, "Error copying files", null, "Exception: " + thB.getMessage() + ", Files: " + strArrA.length + ", StartTime: " + j + ", EndTime: " + j2, kyd.h0(thB), null, null, 50, null);
                }
                if (ajbVar instanceof ajb) {
                    ajbVar = null;
                }
                this.$callback.invoke((String) ajbVar);
            } catch (Exception e) {
                sprig.j.e eVar4 = e.this.logger;
                String message = e.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logError$default(eVar4, "Unexpected error in copyFiles", null, message, kyd.h0(e), null, null, 50, null);
                this.$callback.invoke(null);
            }
            return c1eVar;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n¢\u0006\u0004\b\u0004\u0010\u0005"}, d2 = {"<anonymous>", "", "it", "Ljava/io/File;", "invoke", "(Ljava/io/File;)Ljava/lang/Long;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class c extends co6 implements x45 {
        public static final c INSTANCE = new c();

        public c() {
            super(1);
        }

        @Override // defpackage.x45
        public final Long invoke(File file) {
            file.getClass();
            return Long.valueOf(file.length());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @uv2(c = "com.userleap.internal.sessions.util.FileManager", f = "FileManager.kt", l = {225}, m = "removeOldFiles")
    public static final class d extends p92 {
        int I$0;
        int I$1;
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        int label;
        /* synthetic */ Object result;

        public d(n92<? super d> n92Var) {
            super(n92Var);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return e.this.removeOldFiles(0L, 0L, this);
        }
    }

    /* JADX INFO: renamed from: sprig.h.e$e, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.FileManager$saveImage$1", f = "FileManager.kt", l = {}, m = "invokeSuspend")
    public static final class C0025e extends p4d implements b55 {
        final /* synthetic */ Bitmap $bitmap;
        final /* synthetic */ int $jpegQuality;
        final /* synthetic */ i $metrics;
        final /* synthetic */ String $name;
        final /* synthetic */ x45 $onComplete;
        int label;
        final /* synthetic */ e this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0025e(i iVar, e eVar, String str, x45 x45Var, Bitmap bitmap, int i, n92<? super C0025e> n92Var) {
            super(2, n92Var);
            this.$metrics = iVar;
            this.this$0 = eVar;
            this.$name = str;
            this.$onComplete = x45Var;
            this.$bitmap = bitmap;
            this.$jpegQuality = i;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return new C0025e(this.$metrics, this.this$0, this.$name, this.$onComplete, this.$bitmap, this.$jpegQuality, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((C0025e) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        /* JADX WARN: Can't wrap try/catch for region: R(15:20|(5:113|21|103|22|101)|(1:24)(5:29|(1:31)(18:33|99|34|35|97|36|37|38|111|39|(1:41)|42|73|74|75|(1:88)|89|90)|28|105|57)|25|38|111|39|(0)|42|73|74|75|(0)|89|90) */
        /* JADX WARN: Code restructure failed: missing block: B:43:0x0193, code lost:
        
            r0 = th;
         */
        /* JADX WARN: Code restructure failed: missing block: B:44:0x0194, code lost:
        
            r6 = r27;
         */
        /* JADX WARN: Code restructure failed: missing block: B:45:0x0198, code lost:
        
            r0 = e;
         */
        /* JADX WARN: Code restructure failed: missing block: B:46:0x0199, code lost:
        
            r6 = r27;
         */
        /* JADX WARN: Code restructure failed: missing block: B:85:0x0226, code lost:
        
            sprig.j.e.logError$default(r29.this$0.logger, "Unexpected error in saveImage", null, "Image name: " + r29.$name + ", Error: " + r0.getMessage(), defpackage.kyd.h0(r0), null, null, 50, null);
         */
        /* JADX WARN: Code restructure failed: missing block: B:86:0x0253, code lost:
        
            r0 = r29.$onComplete;
            r6 = r6;
         */
        /* JADX WARN: Code restructure failed: missing block: B:87:0x0255, code lost:
        
            if (r0 != null) goto L88;
         */
        /* JADX WARN: Code restructure failed: missing block: B:91:0x0261, code lost:
        
            r1 = r29.$onComplete;
         */
        /* JADX WARN: Code restructure failed: missing block: B:92:0x0263, code lost:
        
            if (r1 != null) goto L93;
         */
        /* JADX WARN: Code restructure failed: missing block: B:93:0x0265, code lost:
        
            r1.invoke(java.lang.Boolean.valueOf((boolean) r6));
         */
        /* JADX WARN: Code restructure failed: missing block: B:94:0x026c, code lost:
        
            throw r0;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Not initialized variable reg: 27, insn: 0x019f: MOVE (r6 I:??[int, float, boolean, short, byte, char, OBJECT, ARRAY]) = (r27 I:??[int, float, boolean, short, byte, char, OBJECT, ARRAY]) (LINE:416), block:B:48:0x019e */
        /* JADX WARN: Not initialized variable reg: 27, insn: 0x01a4: MOVE (r6 I:??[int, float, boolean, short, byte, char, OBJECT, ARRAY]) = (r27 I:??[int, float, boolean, short, byte, char, OBJECT, ARRAY]) (LINE:421), block:B:50:0x01a4 */
        /* JADX WARN: Removed duplicated region for block: B:41:0x018c A[Catch: all -> 0x0193, Exception -> 0x0198, TRY_LEAVE, TryCatch #16 {Exception -> 0x0198, all -> 0x0193, blocks: (B:39:0x0186, B:41:0x018c), top: B:111:0x0186 }] */
        /* JADX WARN: Removed duplicated region for block: B:68:0x01f5 A[Catch: all -> 0x01f9, Exception -> 0x01fb, TryCatch #8 {Exception -> 0x01fb, blocks: (B:74:0x0200, B:73:0x01fd, B:80:0x0219, B:82:0x021f, B:83:0x0222, B:84:0x0225, B:66:0x01ef, B:68:0x01f5), top: B:107:0x002f }] */
        /* JADX WARN: Removed duplicated region for block: B:82:0x021f A[Catch: all -> 0x01f9, Exception -> 0x01fb, TryCatch #8 {Exception -> 0x01fb, blocks: (B:74:0x0200, B:73:0x01fd, B:80:0x0219, B:82:0x021f, B:83:0x0222, B:84:0x0225, B:66:0x01ef, B:68:0x01f5), top: B:107:0x002f }] */
        /* JADX WARN: Removed duplicated region for block: B:88:0x0257 A[PHI: r0 r6
          0x0257: PHI (r0v9 x45) = (r0v8 x45), (r0v34 x45) binds: [B:87:0x0255, B:76:0x0214] A[DONT_GENERATE, DONT_INLINE]
          0x0257: PHI (r6v5 ??) = (r6v20 ??), (r6v21 ??) binds: [B:87:0x0255, B:76:0x0214] A[DONT_GENERATE, DONT_INLINE]] */
        /* JADX WARN: Type inference failed for: r13v12 */
        /* JADX WARN: Type inference failed for: r13v13 */
        /* JADX WARN: Type inference failed for: r13v14 */
        /* JADX WARN: Type inference failed for: r13v2 */
        /* JADX WARN: Type inference failed for: r13v3, types: [android.graphics.Bitmap] */
        /* JADX WARN: Type inference failed for: r13v4, types: [android.graphics.Bitmap] */
        /* JADX WARN: Type inference failed for: r13v5 */
        /* JADX WARN: Type inference failed for: r6v1 */
        /* JADX WARN: Type inference failed for: r6v14 */
        /* JADX WARN: Type inference failed for: r6v15 */
        /* JADX WARN: Type inference failed for: r6v2 */
        /* JADX WARN: Type inference failed for: r6v20 */
        /* JADX WARN: Type inference failed for: r6v21 */
        /* JADX WARN: Type inference failed for: r6v24 */
        /* JADX WARN: Type inference failed for: r6v25 */
        /* JADX WARN: Type inference failed for: r6v3, types: [boolean] */
        /* JADX WARN: Type inference failed for: r6v4 */
        /* JADX WARN: Type inference failed for: r6v5, types: [boolean] */
        @Override // defpackage.kn0
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Object invokeSuspend(java.lang.Object r30) throws java.lang.Throwable {
            /*
                Method dump skipped, instruction units count: 628
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.e.C0025e.invokeSuspend(java.lang.Object):java.lang.Object");
        }
    }

    public e(Context context, kb2 kb2Var) {
        context.getClass();
        kb2Var.getClass();
        this.dispatcher = kb2Var;
        this.appContext = context.getApplicationContext();
        this.logger = new sprig.j.e();
        this.coroutineScope = o7f.c(flb.p0(kb2Var, qq7.h()));
    }

    public static /* synthetic */ File createDirectory$default(e eVar, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = null;
        }
        return eVar.a(str);
    }

    public static /* synthetic */ Object removeOldFiles$default(e eVar, long j, long j2, n92 n92Var, int i, Object obj) {
        if ((i & 2) != 0) {
            j2 = SignalCredentialStateController.MAX_RETRY_TIME;
        }
        return eVar.removeOldFiles(j, j2, n92Var);
    }

    public static /* synthetic */ void saveImage$default(e eVar, String str, Bitmap bitmap, int i, i iVar, x45 x45Var, int i2, Object obj) {
        if ((i2 & 16) != 0) {
            x45Var = null;
        }
        eVar.saveImage(str, bitmap, i, iVar, x45Var);
    }

    public final File a(String subDirectory) {
        String strX = "sprig";
        if (subDirectory != null) {
            if ((subDirectory.length() > 0 ? subDirectory : null) != null) {
                strX = ev6.x("sprig", File.separator, subDirectory);
            }
        }
        File file = new File(this.appContext.getFilesDir(), strX);
        if (file.exists() || file.mkdir()) {
            return file;
        }
        return null;
    }

    public final void copyFiles(long startTime, long endTime, x45 callback) {
        callback.getClass();
        vx0.c0(this.coroutineScope, null, null, new b(startTime, endTime, callback, null), 3);
    }

    public final File getCurrentDirectory() {
        File file = this.currentDirectory;
        if (file != null) {
            return file;
        }
        File fileCreateDirectory$default = createDirectory$default(this, null, 1, null);
        this.currentDirectory = fileCreateDirectory$default;
        return fileCreateDirectory$default;
    }

    public final long getDirectorySize() {
        File currentDirectory = getCurrentDirectory();
        long jLongValue = 0;
        if (currentDirectory != null) {
            lh4 lh4Var = lh4.TOP_DOWN;
            lh4Var.getClass();
            hi3 hi3Var = new hi3(currentDirectory, lh4Var);
            c cVar = c.INSTANCE;
            cVar.getClass();
            Iterator it2 = hi3Var.iterator();
            while (it2.hasNext()) {
                jLongValue += ((Number) cVar.invoke(it2.next())).longValue();
            }
        }
        return jLongValue;
    }

    public final int getFileCount() {
        File[] fileArrListFiles;
        File currentDirectory = getCurrentDirectory();
        if (currentDirectory == null || (fileArrListFiles = currentDirectory.listFiles()) == null) {
            return 0;
        }
        return fileArrListFiles.length;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x009d A[Catch: Exception -> 0x0137, TRY_LEAVE, TryCatch #1 {Exception -> 0x0137, blocks: (B:25:0x009d, B:38:0x0100, B:19:0x0059, B:21:0x005f, B:23:0x0070), top: B:49:0x0059 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x00f8 -> B:37:0x00fc). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x012e -> B:40:0x0132). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object removeOldFiles(long r23, long r25, defpackage.n92<? super defpackage.c1e> r27) throws org.json.JSONException {
        /*
            Method dump skipped, instruction units count: 339
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.graphics.e.removeOldFiles(long, long, n92):java.lang.Object");
    }

    public final void saveImage(String name, Bitmap bitmap, int jpegQuality, i metrics, x45 onComplete) {
        name.getClass();
        bitmap.getClass();
        metrics.getClass();
        vx0.c0(this.coroutineScope, null, null, new C0025e(metrics, this, name, onComplete, bitmap, jpegQuality, null), 3);
    }

    public final void setCurrentDirectory(File file) {
        this.currentDirectory = file;
    }

    public final void saveImage(String name, Bitmap bitmap, int jpegQuality, i metrics) {
        name.getClass();
        bitmap.getClass();
        metrics.getClass();
        saveImage(name, bitmap, jpegQuality, metrics, null);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public e(Context context, kb2 kb2Var, int i, gy2 gy2Var) {
        if ((i & 2) != 0) {
            r13 r13Var = xg3.a;
            kb2Var = vz2.c;
        }
        this(context, kb2Var);
    }

    public final String[] a(final long startTime, final long endTime) {
        File currentDirectory = getCurrentDirectory();
        String[] list = currentDirectory != null ? currentDirectory.list(new FilenameFilter() { // from class: xhf
            @Override // java.io.FilenameFilter
            public final boolean accept(File file, String str) {
                return e.a(startTime, endTime, file, str);
            }
        }) : null;
        return list == null ? new String[0] : list;
    }

    public static final boolean a(long j, long j2, File file, String str) {
        str.getClass();
        if (!TextUtils.isDigitsOnly(str)) {
            return false;
        }
        long j3 = Long.parseLong(str);
        return j <= j3 && j3 <= j2;
    }
}
