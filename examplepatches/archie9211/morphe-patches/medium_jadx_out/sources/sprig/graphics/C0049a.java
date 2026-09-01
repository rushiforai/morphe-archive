package sprig.graphics;

import android.content.Context;
import defpackage.b55;
import defpackage.br7;
import defpackage.c1e;
import defpackage.ch5;
import defpackage.ei5;
import defpackage.ff7;
import defpackage.g76;
import defpackage.gy2;
import defpackage.kb2;
import defpackage.km4;
import defpackage.n92;
import defpackage.o7f;
import defpackage.oh4;
import defpackage.p4d;
import defpackage.r13;
import defpackage.sb2;
import defpackage.tb2;
import defpackage.uv2;
import defpackage.vx0;
import defpackage.vz2;
import defpackage.wgd;
import defpackage.wk1;
import defpackage.x45;
import defpackage.xg3;
import defpackage.ygf;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.UUID;
import kotlin.Metadata;

/* JADX INFO: renamed from: sprig.h.a, reason: case insensitive filesystem */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001:\u0001\u0018B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\u0015\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J'\u0010\u0014\u001a\u00020\n2\u0018\u0010\u0013\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u0012\u0012\u0004\u0012\u00020\n0\u0011¢\u0006\u0004\b\u0014\u0010\u0015J\r\u0010\u0016\u001a\u00020\n¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\b0\u0012H\u0002¢\u0006\u0004\b\u0018\u0010\u0019R\"\u0010\u0003\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0018\u0010\u001a\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010 R$\u0010(\u001a\u0004\u0018\u00010!8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b\"\u0010#\u001a\u0004\b$\u0010%\"\u0004\b&\u0010'R$\u0010,\u001a\u0004\u0018\u00010!8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b)\u0010#\u001a\u0004\b*\u0010%\"\u0004\b+\u0010'R\u0014\u00100\u001a\u00020-8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b.\u0010/R\u0014\u00104\u001a\u0002018\u0002X\u0082D¢\u0006\u0006\n\u0004\b2\u00103R\u0014\u00106\u001a\u0002018\u0002X\u0082D¢\u0006\u0006\n\u0004\b5\u00103R\u0014\u0010:\u001a\u0002078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b8\u00109¨\u0006;"}, d2 = {"Lsprig/h/a;", "", "Landroid/content/Context;", "context", "Lkb2;", "dispatcher", "<init>", "(Landroid/content/Context;Lkb2;)V", "Lsprig/h/a$a;", "cacheRecord", "Lc1e;", "appendCacheRecord", "(Lsprig/h/a$a;)V", "Ljava/util/UUID;", "workId", "removeCacheRecord", "(Ljava/util/UUID;)V", "Lkotlin/Function1;", "", "callback", "getCacheRecordsAsync", "(Lx45;)V", "clearCache", "()V", "a", "()[Lsprig/h/a$a;", "Landroid/content/Context;", "getContext", "()Landroid/content/Context;", "setContext", "(Landroid/content/Context;)V", "b", "Lkb2;", "Ljava/io/File;", "c", "Ljava/io/File;", "getCacheDirectory$userleap_release", "()Ljava/io/File;", "setCacheDirectory$userleap_release", "(Ljava/io/File;)V", "cacheDirectory", "d", "getCacheFile$userleap_release", "setCacheFile$userleap_release", "cacheFile", "Lch5;", "e", "Lch5;", "gson", "", "f", "Ljava/lang/String;", "cacheDirectoryName", "g", "cacheFileName", "Lsb2;", "h", "Lsb2;", "coroutineScope", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class C0049a {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public Context context;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final kb2 dispatcher;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public File cacheDirectory;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public File cacheFile;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public final ch5 gson;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public final String cacheDirectoryName;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public final String cacheFileName;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public final sb2 coroutineScope;

    /* JADX INFO: renamed from: sprig.h.a$a, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0010\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\b\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\u0004\u0012\u0006\u0010\n\u001a\u00020\u0004\u0012\u0006\u0010\u000b\u001a\u00020\u0004¢\u0006\u0004\b\u001f\u0010 J\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0006\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0007\u001a\u00020\u0004HÆ\u0003J1\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u00042\b\b\u0002\u0010\u000b\u001a\u00020\u0004HÆ\u0001J\t\u0010\r\u001a\u00020\u0004HÖ\u0001J\t\u0010\u000f\u001a\u00020\u000eHÖ\u0001J\u0013\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016R\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0018\u001a\u0004\b\u0019\u0010\u001aR\u0017\u0010\n\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001b\u0010\u0018\u001a\u0004\b\u001c\u0010\u001aR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u0018\u001a\u0004\b\u001e\u0010\u001a¨\u0006!"}, d2 = {"Lsprig/h/a$a;", "", "Ljava/util/UUID;", "component1", "", "component2", "component3", "component4", "workId", "surveyId", "responseGroupUid", "eventDigestJSArray", "copy", "toString", "", "hashCode", "other", "", "equals", "a", "Ljava/util/UUID;", "getWorkId", "()Ljava/util/UUID;", "b", "Ljava/lang/String;", "getSurveyId", "()Ljava/lang/String;", "c", "getResponseGroupUid", "d", "getEventDigestJSArray", "<init>", "(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final /* data */ class C0023a {

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public final UUID workId;

        /* JADX INFO: renamed from: b, reason: from kotlin metadata */
        public final String surveyId;

        /* JADX INFO: renamed from: c, reason: from kotlin metadata */
        public final String responseGroupUid;

        /* JADX INFO: renamed from: d, reason: from kotlin metadata */
        public final String eventDigestJSArray;

        public C0023a(UUID uuid, String str, String str2, String str3) {
            uuid.getClass();
            str.getClass();
            str2.getClass();
            str3.getClass();
            this.workId = uuid;
            this.surveyId = str;
            this.responseGroupUid = str2;
            this.eventDigestJSArray = str3;
        }

        public static /* synthetic */ C0023a copy$default(C0023a c0023a, UUID uuid, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                uuid = c0023a.workId;
            }
            if ((i & 2) != 0) {
                str = c0023a.surveyId;
            }
            if ((i & 4) != 0) {
                str2 = c0023a.responseGroupUid;
            }
            if ((i & 8) != 0) {
                str3 = c0023a.eventDigestJSArray;
            }
            return c0023a.copy(uuid, str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UUID getWorkId() {
            return this.workId;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getSurveyId() {
            return this.surveyId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getResponseGroupUid() {
            return this.responseGroupUid;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getEventDigestJSArray() {
            return this.eventDigestJSArray;
        }

        public final C0023a copy(UUID workId, String surveyId, String responseGroupUid, String eventDigestJSArray) {
            workId.getClass();
            surveyId.getClass();
            responseGroupUid.getClass();
            eventDigestJSArray.getClass();
            return new C0023a(workId, surveyId, responseGroupUid, eventDigestJSArray);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof C0023a)) {
                return false;
            }
            C0023a c0023a = (C0023a) other;
            return g76.L(this.workId, c0023a.workId) && g76.L(this.surveyId, c0023a.surveyId) && g76.L(this.responseGroupUid, c0023a.responseGroupUid) && g76.L(this.eventDigestJSArray, c0023a.eventDigestJSArray);
        }

        public final String getEventDigestJSArray() {
            return this.eventDigestJSArray;
        }

        public final String getResponseGroupUid() {
            return this.responseGroupUid;
        }

        public final String getSurveyId() {
            return this.surveyId;
        }

        public final UUID getWorkId() {
            return this.workId;
        }

        public int hashCode() {
            return this.eventDigestJSArray.hashCode() + wgd.o(wgd.o(this.workId.hashCode() * 31, 31, this.surveyId), 31, this.responseGroupUid);
        }

        public String toString() {
            UUID uuid = this.workId;
            String str = this.surveyId;
            String str2 = this.responseGroupUid;
            String str3 = this.eventDigestJSArray;
            StringBuilder sb = new StringBuilder("CacheRecord(workId=");
            sb.append(uuid);
            sb.append(", surveyId=");
            sb.append(str);
            sb.append(", responseGroupUid=");
            return km4.C(sb, str2, ", eventDigestJSArray=", str3, ")");
        }
    }

    /* JADX INFO: renamed from: sprig.h.a$b */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.CacheManager$appendCacheRecord$1", f = "CacheManager.kt", l = {}, m = "invokeSuspend")
    public static final class b extends p4d implements b55 {
        final /* synthetic */ File $cacheFile;
        final /* synthetic */ C0023a $cacheRecord;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(C0023a c0023a, File file, n92<? super b> n92Var) {
            super(2, n92Var);
            this.$cacheRecord = c0023a;
            this.$cacheFile = file;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return C0049a.this.new b(this.$cacheRecord, this.$cacheFile, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((b) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws IOException {
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            C0023a[] c0023aArrA = C0049a.this.a();
            ch5 ch5Var = C0049a.this.gson;
            C0023a c0023a = this.$cacheRecord;
            c0023aArrA.getClass();
            int length = c0023aArrA.length;
            Object[] objArrCopyOf = Arrays.copyOf(c0023aArrA, length + 1);
            objArrCopyOf[length] = c0023a;
            oh4.L0(this.$cacheFile, ch5Var.h(objArrCopyOf));
            return c1e.a;
        }
    }

    /* JADX INFO: renamed from: sprig.h.a$c */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.CacheManager$clearCache$1", f = "CacheManager.kt", l = {}, m = "invokeSuspend")
    public static final class c extends p4d implements b55 {
        final /* synthetic */ File $cacheFile;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(File file, n92<? super c> n92Var) {
            super(2, n92Var);
            this.$cacheFile = file;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return new c(this.$cacheFile, n92Var);
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
            oh4.L0(this.$cacheFile, "");
            return c1e.a;
        }
    }

    /* JADX INFO: renamed from: sprig.h.a$d */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.CacheManager$getCacheRecordsAsync$1", f = "CacheManager.kt", l = {57}, m = "invokeSuspend")
    public static final class d extends p4d implements b55 {
        final /* synthetic */ x45 $callback;
        int label;

        /* JADX INFO: renamed from: sprig.h.a$d$a, reason: collision with other inner class name */
        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
        @uv2(c = "com.userleap.internal.sessions.util.CacheManager$getCacheRecordsAsync$1$1", f = "CacheManager.kt", l = {}, m = "invokeSuspend")
        public static final class C0024a extends p4d implements b55 {
            final /* synthetic */ C0023a[] $cacheRecords;
            final /* synthetic */ x45 $callback;
            int label;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0024a(x45 x45Var, C0023a[] c0023aArr, n92<? super C0024a> n92Var) {
                super(2, n92Var);
                this.$callback = x45Var;
                this.$cacheRecords = c0023aArr;
            }

            @Override // defpackage.kn0
            public final n92<c1e> create(Object obj, n92<?> n92Var) {
                return new C0024a(this.$callback, this.$cacheRecords, n92Var);
            }

            @Override // defpackage.b55
            public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
                return ((C0024a) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
            }

            @Override // defpackage.kn0
            public final Object invokeSuspend(Object obj) {
                if (this.label != 0) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.$callback.invoke(this.$cacheRecords);
                return c1e.a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(x45 x45Var, n92<? super d> n92Var) {
            super(2, n92Var);
            this.$callback = x45Var;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return C0049a.this.new d(this.$callback, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((d) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws IOException {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.label;
            if (i == 0) {
                br7.v(obj);
                C0023a[] c0023aArrA = C0049a.this.a();
                r13 r13Var = xg3.a;
                ei5 ei5Var = ff7.a;
                C0024a c0024a = new C0024a(this.$callback, c0023aArrA, null);
                this.label = 1;
                if (vx0.m0(ei5Var, c0024a, this) == tb2Var) {
                    return tb2Var;
                }
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
            }
            return c1e.a;
        }
    }

    /* JADX INFO: renamed from: sprig.h.a$e */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {1, 8, 0})
    @uv2(c = "com.userleap.internal.sessions.util.CacheManager$removeCacheRecord$1", f = "CacheManager.kt", l = {}, m = "invokeSuspend")
    public static final class e extends p4d implements b55 {
        final /* synthetic */ File $cacheFile;
        final /* synthetic */ UUID $workId;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(File file, UUID uuid, n92<? super e> n92Var) {
            super(2, n92Var);
            this.$cacheFile = file;
            this.$workId = uuid;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return C0049a.this.new e(this.$cacheFile, this.$workId, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((e) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) throws IOException {
            C0023a c0023a = null;
            if (this.label != 0) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            C0023a[] c0023aArrA = C0049a.this.a();
            UUID uuid = this.$workId;
            int length = c0023aArrA.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                C0023a c0023a2 = c0023aArrA[i];
                if (g76.L(c0023a2.getWorkId(), uuid)) {
                    c0023a = c0023a2;
                    break;
                }
                i++;
            }
            c1e c1eVar = c1e.a;
            if (c0023a == null) {
                return c1eVar;
            }
            ch5 ch5Var = C0049a.this.gson;
            UUID uuid2 = this.$workId;
            ArrayList arrayList = new ArrayList();
            for (C0023a c0023a3 : c0023aArrA) {
                if (!g76.L(c0023a3.getWorkId(), uuid2)) {
                    arrayList.add(c0023a3);
                }
            }
            oh4.L0(this.$cacheFile, ch5Var.h(arrayList));
            return c1eVar;
        }
    }

    public C0049a(Context context, kb2 kb2Var) {
        context.getClass();
        kb2Var.getClass();
        this.context = context;
        this.dispatcher = kb2Var;
        this.gson = new ch5();
        this.cacheDirectoryName = "sprig_cache";
        this.cacheFileName = "sprig_cache_records.json";
        this.coroutineScope = o7f.c(kb2Var);
        File file = new File(this.context.getApplicationContext().getFilesDir(), "sprig_cache");
        if (!file.exists() && !file.mkdir()) {
            file = null;
        }
        this.cacheDirectory = file;
        File file2 = new File(this.cacheDirectory, "sprig_cache_records.json");
        this.cacheFile = (file2.exists() || file2.createNewFile()) ? file2 : null;
    }

    public final C0023a[] a() throws IOException {
        File file = this.cacheFile;
        if (file == null) {
            return new C0023a[0];
        }
        ch5 ch5Var = new ch5();
        String strK0 = oh4.K0(file, wk1.a);
        if (strK0.length() == 0) {
            return new C0023a[0];
        }
        Object objC = ch5Var.c(C0023a[].class, strK0);
        objC.getClass();
        return (C0023a[]) objC;
    }

    public final void appendCacheRecord(C0023a cacheRecord) {
        cacheRecord.getClass();
        File file = this.cacheFile;
        if (file == null) {
            return;
        }
        vx0.c0(this.coroutineScope, null, null, new b(cacheRecord, file, null), 3);
    }

    public final void clearCache() {
        File file = this.cacheFile;
        if (file == null) {
            return;
        }
        vx0.c0(this.coroutineScope, null, null, new c(file, null), 3);
    }

    /* JADX INFO: renamed from: getCacheDirectory$userleap_release, reason: from getter */
    public final File getCacheDirectory() {
        return this.cacheDirectory;
    }

    /* JADX INFO: renamed from: getCacheFile$userleap_release, reason: from getter */
    public final File getCacheFile() {
        return this.cacheFile;
    }

    public final void getCacheRecordsAsync(x45 callback) {
        callback.getClass();
        vx0.c0(this.coroutineScope, null, null, new d(callback, null), 3);
    }

    public final Context getContext() {
        return this.context;
    }

    public final void removeCacheRecord(UUID workId) {
        workId.getClass();
        File file = this.cacheFile;
        if (file == null) {
            return;
        }
        vx0.c0(this.coroutineScope, null, null, new e(file, workId, null), 3);
    }

    public final void setCacheDirectory$userleap_release(File file) {
        this.cacheDirectory = file;
    }

    public final void setCacheFile$userleap_release(File file) {
        this.cacheFile = file;
    }

    public final void setContext(Context context) {
        context.getClass();
        this.context = context;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public C0049a(Context context, kb2 kb2Var, int i, gy2 gy2Var) {
        if ((i & 2) != 0) {
            r13 r13Var = xg3.a;
            kb2Var = vz2.c;
        }
        this(context, kb2Var);
    }
}
