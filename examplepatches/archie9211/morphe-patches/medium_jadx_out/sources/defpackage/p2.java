package defpackage;

import android.content.SharedPreferences;
import com.drew.metadata.mov.QuickTimeAtomTypes;
import com.google.gson.JsonIOException;
import java.io.IOException;
import java.io.StringReader;
import java.lang.reflect.Type;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\"\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010$\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b'\u0018\u0000  2\u00020\u0001:\u0001[B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\r\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ#\u0010\u0010\u001a\u00020\n2\u0012\u0010\u000f\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u000e0\r\"\u00020\u000eH\u0007¢\u0006\u0004\b\u0010\u0010\u0011J\u001f\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u0001H\u0007¢\u0006\u0004\b\u0014\u0010\u0015J3\u0010\u0019\u001a\u00020\n\"\u0004\b\u0000\u0010\u00162\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u00012\f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00028\u00000\u0017H\u0007¢\u0006\u0004\b\u0019\u0010\u001aJ9\u0010\u001e\u001a\u0004\u0018\u00018\u0000\"\u0004\b\u0000\u0010\u00162\u0006\u0010\u0012\u001a\u00020\u000e2\f\u0010\u001c\u001a\b\u0012\u0004\u0012\u00028\u00000\u001b2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00018\u0000H\u0007¢\u0006\u0004\b\u001e\u0010\u001fJ9\u0010 \u001a\u0004\u0018\u00018\u0000\"\u0004\b\u0000\u0010\u00162\u0006\u0010\u0012\u001a\u00020\u000e2\f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00028\u00000\u00172\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00018\u0000H\u0007¢\u0006\u0004\b \u0010!J\u001f\u0010$\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\"H\u0007¢\u0006\u0004\b$\u0010%J/\u0010*\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\f\u0010'\u001a\b\u0012\u0004\u0012\u00020\"0&2\b\b\u0002\u0010)\u001a\u00020(H\u0007¢\u0006\u0004\b*\u0010+J\u001d\u0010,\u001a\b\u0012\u0004\u0012\u00020\"0&2\u0006\u0010\u0012\u001a\u00020\u000eH\u0007¢\u0006\u0004\b,\u0010-J\u001f\u0010.\u001a\n\u0012\u0004\u0012\u00020\"\u0018\u00010&2\u0006\u0010\u0012\u001a\u00020\u000eH\u0007¢\u0006\u0004\b.\u0010-J+\u00100\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\u0012\u0010'\u001a\u000e\u0012\u0004\u0012\u00020\"\u0012\u0004\u0012\u00020\"0/H\u0007¢\u0006\u0004\b0\u00101J%\u00102\u001a\u0010\u0012\u0004\u0012\u00020\"\u0012\u0004\u0012\u00020\"\u0018\u00010/2\u0006\u0010\u0012\u001a\u00020\u000eH\u0007¢\u0006\u0004\b2\u00103J%\u00104\u001a\u0004\u0018\u00010\"2\u0006\u0010\u0012\u001a\u00020\u000e2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\"H\u0007¢\u0006\u0004\b4\u00105J\u001f\u00107\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010#\u001a\u000206H\u0007¢\u0006\u0004\b7\u00108J\u001f\u00109\u001a\u0002062\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u001d\u001a\u000206H\u0007¢\u0006\u0004\b9\u0010:J\u001f\u0010<\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020;H\u0007¢\u0006\u0004\b<\u0010=J\u001f\u0010>\u001a\u00020;2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u001d\u001a\u00020;H\u0007¢\u0006\u0004\b>\u0010?J\u001f\u0010@\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020(H\u0007¢\u0006\u0004\b@\u0010AJ\u001f\u0010B\u001a\u00020(2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u001d\u001a\u00020(H\u0007¢\u0006\u0004\bB\u0010CJ\u0019\u0010D\u001a\u0004\u0018\u00010\"2\u0006\u0010\u0012\u001a\u00020\u000eH\u0017¢\u0006\u0004\bD\u0010EJ!\u0010G\u001a\u0004\u0018\u00010\"2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010F\u001a\u00020\"H\u0017¢\u0006\u0004\bG\u00105J\u0019\u0010H\u001a\u0004\u0018\u00010\"2\u0006\u0010\u0012\u001a\u00020\u000eH\u0017¢\u0006\u0004\bH\u0010EJ!\u0010I\u001a\u0004\u0018\u00010\"2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010F\u001a\u00020\"H\u0017¢\u0006\u0004\bI\u00105J%\u0010L\u001a\b\u0012\u0004\u0012\u00020;0K2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010J\u001a\u00020;H\u0004¢\u0006\u0004\bL\u0010MJ%\u0010N\u001a\b\u0012\u0004\u0012\u0002060K2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010J\u001a\u000206H\u0004¢\u0006\u0004\bN\u0010OJ%\u0010P\u001a\b\u0012\u0004\u0012\u00020(0K2\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010J\u001a\u00020(H\u0004¢\u0006\u0004\bP\u0010QJ)\u0010R\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\"0K2\u0006\u0010\u0012\u001a\u00020\u000e2\b\u0010J\u001a\u0004\u0018\u00010\"H\u0004¢\u0006\u0004\bR\u0010SJ7\u0010T\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\"\u0018\u00010&0K2\u0006\u0010\u0012\u001a\u00020\u000e2\u0010\b\u0002\u0010J\u001a\n\u0012\u0004\u0012\u00020\"\u0018\u00010&H\u0004¢\u0006\u0004\bT\u0010UJ?\u0010V\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000K\"\u0004\b\u0000\u0010\u00162\u0006\u0010\u0012\u001a\u00020\u000e2\f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00028\u00000\u00172\n\b\u0002\u0010J\u001a\u0004\u0018\u00018\u0000H\u0004¢\u0006\u0004\bV\u0010WJ\u0017\u0010X\u001a\u00020\"2\u0006\u0010\u0012\u001a\u00020\u000eH\u0002¢\u0006\u0004\bX\u0010ER\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bY\u0010ZR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b[\u0010\\R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b]\u0010^R\u0014\u0010a\u001a\u00020_8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010`R\u001c\u0010d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\"0b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010c¨\u0006e"}, d2 = {"Lp2;", "", "Landroid/content/SharedPreferences;", "sharedPreferences", "Lub6;", "jsonCodec", "Lsb2;", "coroutineScope", "<init>", "(Landroid/content/SharedPreferences;Lub6;Lsb2;)V", "Lc1e;", "d", "()V", "", "Lek6;", QuickTimeAtomTypes.ATOM_KEYS, "e", "([Lek6;)V", "key", "any", "x", "(Lek6;Ljava/lang/Object;)V", "T", "Lkxd;", "typeToken", "y", "(Lek6;Ljava/lang/Object;Lkxd;)V", "Ljava/lang/Class;", "clazz", "default", "g", "(Lek6;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;", "f", "(Lek6;Lkxd;Ljava/lang/Object;)Ljava/lang/Object;", "", "value", "C", "(Lek6;Ljava/lang/String;)V", "", "values", "", "commit", "E", "(Lek6;Ljava/util/Set;Z)V", "q", "(Lek6;)Ljava/util/Set;", "m", "", "D", "(Lek6;Ljava/util/Map;)V", "p", "(Lek6;)Ljava/util/Map;", "n", "(Lek6;Ljava/lang/String;)Ljava/lang/String;", "", "B", "(Lek6;J)V", "l", "(Lek6;J)J", "", "A", "(Lek6;I)V", "k", "(Lek6;I)I", "z", "(Lek6;Z)V", "j", "(Lek6;Z)Z", "u", "(Lek6;)Ljava/lang/String;", "suffix", "v", "s", "t", "defaultValue", "Lbo4;", "J", "(Lek6;I)Lbo4;", "K", "(Lek6;J)Lbo4;", "I", "(Lek6;Z)Lbo4;", "L", "(Lek6;Ljava/lang/String;)Lbo4;", "M", "(Lek6;Ljava/util/Set;)Lbo4;", "G", "(Lek6;Lkxd;Ljava/lang/Object;)Lbo4;", "r", "a", "Landroid/content/SharedPreferences;", "b", "Lub6;", "c", "Lsb2;", "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;", "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;", "listener", "Lj78;", "Lj78;", "_eventStream", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public abstract class p2 {
    public static final int g = 8;
    private static final a h = new a();

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    private final SharedPreferences sharedPreferences;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    private final ub6 jsonCodec;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    private final sb2 coroutineScope;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    private final SharedPreferences.OnSharedPreferenceChangeListener listener;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    private final j78 _eventStream;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\b\n\u0018\u00002\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u00020\u0001¨\u0006\u0004"}, d2 = {"p2$a", "Lkxd;", "", "", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class a extends kxd<Map<String, ? extends String>> {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {2, 2, 0})
    @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$clearAllKeys$2", f = "AbstractSharedPreferences.kt", l = {40}, m = "invokeSuspend", v = 1)
    public static final class c extends p4d implements b55 {
        int b;

        public c(n92<? super c> n92Var) {
            super(2, n92Var);
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return p2.this.new c(n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((c) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.b;
            if (i == 0) {
                br7.v(obj);
                j78 j78Var = p2.this._eventStream;
                this.b = 1;
                if (j78Var.a(null, this) == tb2Var) {
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

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lsb2;", "Lc1e;", "<anonymous>", "(Lsb2;)V"}, k = 3, mv = {2, 2, 0})
    @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$listener$1$1", f = "AbstractSharedPreferences.kt", l = {25}, m = "invokeSuspend", v = 1)
    public static final class d extends p4d implements b55 {
        int b;
        final /* synthetic */ String d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(String str, n92<? super d> n92Var) {
            super(2, n92Var);
            this.d = str;
        }

        @Override // defpackage.kn0
        public final n92<c1e> create(Object obj, n92<?> n92Var) {
            return p2.this.new d(this.d, n92Var);
        }

        @Override // defpackage.b55
        public final Object invoke(sb2 sb2Var, n92<? super c1e> n92Var) {
            return ((d) create(sb2Var, n92Var)).invokeSuspend(c1e.a);
        }

        @Override // defpackage.kn0
        public final Object invokeSuspend(Object obj) {
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            int i = this.b;
            if (i == 0) {
                br7.v(obj);
                j78 j78Var = p2.this._eventStream;
                String str = this.d;
                this.b = 1;
                if (j78Var.a(str, this) == tb2Var) {
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

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class e implements bo4 {
        final /* synthetic */ bo4 a;
        final /* synthetic */ Object b;
        final /* synthetic */ p2 c;
        final /* synthetic */ ek6 d;
        final /* synthetic */ kxd e;
        final /* synthetic */ Object f;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class a<T> implements do4 {
            final /* synthetic */ do4 a;
            final /* synthetic */ Object b;
            final /* synthetic */ p2 c;
            final /* synthetic */ ek6 d;
            final /* synthetic */ kxd e;
            final /* synthetic */ Object f;

            /* JADX INFO: renamed from: p2$e$a$a, reason: collision with other inner class name */
            @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
            @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watchAny$$inlined$watch$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
            public static final class C0001a extends p92 {
                Object b;
                /* synthetic */ Object c;
                int d;
                Object e;
                Object f;
                Object g;
                int h;

                public C0001a(n92 n92Var) {
                    super(n92Var);
                }

                @Override // defpackage.kn0
                public final Object invokeSuspend(Object obj) {
                    this.c = obj;
                    this.d |= Integer.MIN_VALUE;
                    return a.this.a(null, this);
                }
            }

            public a(do4 do4Var, Object obj, p2 p2Var, ek6 ek6Var, kxd kxdVar, Object obj2) {
                this.a = do4Var;
                this.b = obj;
                this.c = p2Var;
                this.d = ek6Var;
                this.e = kxdVar;
                this.f = obj2;
            }

            /* JADX WARN: Multi-variable type inference failed */
            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // defpackage.do4
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object a(java.lang.Object r7, defpackage.n92 r8) {
                /*
                    r6 = this;
                    boolean r0 = r8 instanceof p2.e.a.C0001a
                    if (r0 == 0) goto L13
                    r0 = r8
                    p2$e$a$a r0 = (p2.e.a.C0001a) r0
                    int r1 = r0.d
                    r2 = -2147483648(0xffffffff80000000, float:-0.0)
                    r3 = r1 & r2
                    if (r3 == 0) goto L13
                    int r1 = r1 - r2
                    r0.d = r1
                    goto L18
                L13:
                    p2$e$a$a r0 = new p2$e$a$a
                    r0.<init>(r8)
                L18:
                    java.lang.Object r8 = r0.c
                    tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                    int r2 = r0.d
                    r3 = 1
                    r4 = 0
                    if (r2 == 0) goto L36
                    if (r2 != r3) goto L30
                    java.lang.Object r6 = r0.g
                    do4 r6 = (defpackage.do4) r6
                    java.lang.Object r6 = r0.e
                    p2$e$a$a r6 = (p2.e.a.C0001a) r6
                    defpackage.br7.v(r8)
                    goto L62
                L30:
                    java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
                    defpackage.ygf.f(r6)
                    return r4
                L36:
                    defpackage.br7.v(r8)
                    do4 r8 = r6.a
                    java.lang.String r7 = (java.lang.String) r7
                    if (r7 == 0) goto L4c
                    p2 r7 = r6.c
                    ek6 r2 = r6.d
                    kxd r5 = r6.e
                    java.lang.Object r6 = r6.f
                    java.lang.Object r6 = r7.f(r2, r5, r6)
                    goto L4e
                L4c:
                    java.lang.Object r6 = r6.b
                L4e:
                    r0.b = r4
                    r0.e = r4
                    r0.f = r4
                    r0.g = r4
                    r7 = 0
                    r0.h = r7
                    r0.d = r3
                    java.lang.Object r6 = r8.a(r6, r0)
                    if (r6 != r1) goto L62
                    return r1
                L62:
                    c1e r6 = defpackage.c1e.a
                    return r6
                */
                throw new UnsupportedOperationException("Method not decompiled: p2.e.a.a(java.lang.Object, n92):java.lang.Object");
            }
        }

        public e(bo4 bo4Var, Object obj, p2 p2Var, ek6 ek6Var, kxd kxdVar, Object obj2) {
            this.a = bo4Var;
            this.b = obj;
            this.c = p2Var;
            this.d = ek6Var;
            this.e = kxdVar;
            this.f = obj2;
        }

        @Override // defpackage.bo4
        public Object b(do4 do4Var, n92 n92Var) {
            Object objB = this.a.b(new a(do4Var, this.b, this.c, this.d, this.e, this.f), n92Var);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class f implements bo4 {
        final /* synthetic */ bo4 a;
        final /* synthetic */ Object b;
        final /* synthetic */ p2 c;
        final /* synthetic */ ek6 d;
        final /* synthetic */ boolean e;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class a<T> implements do4 {
            final /* synthetic */ do4 a;
            final /* synthetic */ Object b;
            final /* synthetic */ p2 c;
            final /* synthetic */ ek6 d;
            final /* synthetic */ boolean e;

            /* JADX INFO: renamed from: p2$f$a$a, reason: collision with other inner class name */
            @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
            @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watchBoolean$$inlined$watch$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
            public static final class C0002a extends p92 {
                Object b;
                /* synthetic */ Object c;
                int d;
                Object e;
                Object f;
                Object g;
                int h;

                public C0002a(n92 n92Var) {
                    super(n92Var);
                }

                @Override // defpackage.kn0
                public final Object invokeSuspend(Object obj) {
                    this.c = obj;
                    this.d |= Integer.MIN_VALUE;
                    return a.this.a(null, this);
                }
            }

            public a(do4 do4Var, Object obj, p2 p2Var, ek6 ek6Var, boolean z) {
                this.a = do4Var;
                this.b = obj;
                this.c = p2Var;
                this.d = ek6Var;
                this.e = z;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // defpackage.do4
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object a(java.lang.Object r6, defpackage.n92 r7) {
                /*
                    r5 = this;
                    boolean r0 = r7 instanceof p2.f.a.C0002a
                    if (r0 == 0) goto L13
                    r0 = r7
                    p2$f$a$a r0 = (p2.f.a.C0002a) r0
                    int r1 = r0.d
                    r2 = -2147483648(0xffffffff80000000, float:-0.0)
                    r3 = r1 & r2
                    if (r3 == 0) goto L13
                    int r1 = r1 - r2
                    r0.d = r1
                    goto L18
                L13:
                    p2$f$a$a r0 = new p2$f$a$a
                    r0.<init>(r7)
                L18:
                    java.lang.Object r7 = r0.c
                    tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                    int r2 = r0.d
                    r3 = 1
                    r4 = 0
                    if (r2 == 0) goto L36
                    if (r2 != r3) goto L30
                    java.lang.Object r5 = r0.g
                    do4 r5 = (defpackage.do4) r5
                    java.lang.Object r5 = r0.e
                    p2$f$a$a r5 = (p2.f.a.C0002a) r5
                    defpackage.br7.v(r7)
                    goto L64
                L30:
                    java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
                    defpackage.ygf.f(r5)
                    return r4
                L36:
                    defpackage.br7.v(r7)
                    do4 r7 = r5.a
                    java.lang.String r6 = (java.lang.String) r6
                    if (r6 == 0) goto L4e
                    p2 r6 = r5.c
                    ek6 r2 = r5.d
                    boolean r5 = r5.e
                    boolean r5 = r6.j(r2, r5)
                    java.lang.Boolean r5 = java.lang.Boolean.valueOf(r5)
                    goto L50
                L4e:
                    java.lang.Object r5 = r5.b
                L50:
                    r0.b = r4
                    r0.e = r4
                    r0.f = r4
                    r0.g = r4
                    r6 = 0
                    r0.h = r6
                    r0.d = r3
                    java.lang.Object r5 = r7.a(r5, r0)
                    if (r5 != r1) goto L64
                    return r1
                L64:
                    c1e r5 = defpackage.c1e.a
                    return r5
                */
                throw new UnsupportedOperationException("Method not decompiled: p2.f.a.a(java.lang.Object, n92):java.lang.Object");
            }
        }

        public f(bo4 bo4Var, Object obj, p2 p2Var, ek6 ek6Var, boolean z) {
            this.a = bo4Var;
            this.b = obj;
            this.c = p2Var;
            this.d = ek6Var;
            this.e = z;
        }

        @Override // defpackage.bo4
        public Object b(do4 do4Var, n92 n92Var) {
            Object objB = this.a.b(new a(do4Var, this.b, this.c, this.d, this.e), n92Var);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class g implements bo4 {
        final /* synthetic */ bo4 a;
        final /* synthetic */ Object b;
        final /* synthetic */ p2 c;
        final /* synthetic */ ek6 d;
        final /* synthetic */ int e;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class a<T> implements do4 {
            final /* synthetic */ do4 a;
            final /* synthetic */ Object b;
            final /* synthetic */ p2 c;
            final /* synthetic */ ek6 d;
            final /* synthetic */ int e;

            /* JADX INFO: renamed from: p2$g$a$a, reason: collision with other inner class name */
            @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
            @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watchInt$$inlined$watch$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
            public static final class C0003a extends p92 {
                Object b;
                /* synthetic */ Object c;
                int d;
                Object e;
                Object f;
                Object g;
                int h;

                public C0003a(n92 n92Var) {
                    super(n92Var);
                }

                @Override // defpackage.kn0
                public final Object invokeSuspend(Object obj) {
                    this.c = obj;
                    this.d |= Integer.MIN_VALUE;
                    return a.this.a(null, this);
                }
            }

            public a(do4 do4Var, Object obj, p2 p2Var, ek6 ek6Var, int i) {
                this.a = do4Var;
                this.b = obj;
                this.c = p2Var;
                this.d = ek6Var;
                this.e = i;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // defpackage.do4
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object a(java.lang.Object r6, defpackage.n92 r7) {
                /*
                    r5 = this;
                    boolean r0 = r7 instanceof p2.g.a.C0003a
                    if (r0 == 0) goto L13
                    r0 = r7
                    p2$g$a$a r0 = (p2.g.a.C0003a) r0
                    int r1 = r0.d
                    r2 = -2147483648(0xffffffff80000000, float:-0.0)
                    r3 = r1 & r2
                    if (r3 == 0) goto L13
                    int r1 = r1 - r2
                    r0.d = r1
                    goto L18
                L13:
                    p2$g$a$a r0 = new p2$g$a$a
                    r0.<init>(r7)
                L18:
                    java.lang.Object r7 = r0.c
                    tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                    int r2 = r0.d
                    r3 = 1
                    r4 = 0
                    if (r2 == 0) goto L36
                    if (r2 != r3) goto L30
                    java.lang.Object r5 = r0.g
                    do4 r5 = (defpackage.do4) r5
                    java.lang.Object r5 = r0.e
                    p2$g$a$a r5 = (p2.g.a.C0003a) r5
                    defpackage.br7.v(r7)
                    goto L65
                L30:
                    java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
                    defpackage.ygf.f(r5)
                    return r4
                L36:
                    defpackage.br7.v(r7)
                    do4 r7 = r5.a
                    java.lang.String r6 = (java.lang.String) r6
                    if (r6 == 0) goto L4f
                    p2 r6 = r5.c
                    ek6 r2 = r5.d
                    int r5 = r5.e
                    int r5 = r6.k(r2, r5)
                    java.lang.Integer r6 = new java.lang.Integer
                    r6.<init>(r5)
                    goto L51
                L4f:
                    java.lang.Object r6 = r5.b
                L51:
                    r0.b = r4
                    r0.e = r4
                    r0.f = r4
                    r0.g = r4
                    r5 = 0
                    r0.h = r5
                    r0.d = r3
                    java.lang.Object r5 = r7.a(r6, r0)
                    if (r5 != r1) goto L65
                    return r1
                L65:
                    c1e r5 = defpackage.c1e.a
                    return r5
                */
                throw new UnsupportedOperationException("Method not decompiled: p2.g.a.a(java.lang.Object, n92):java.lang.Object");
            }
        }

        public g(bo4 bo4Var, Object obj, p2 p2Var, ek6 ek6Var, int i) {
            this.a = bo4Var;
            this.b = obj;
            this.c = p2Var;
            this.d = ek6Var;
            this.e = i;
        }

        @Override // defpackage.bo4
        public Object b(do4 do4Var, n92 n92Var) {
            Object objB = this.a.b(new a(do4Var, this.b, this.c, this.d, this.e), n92Var);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class h implements bo4 {
        final /* synthetic */ bo4 a;
        final /* synthetic */ Object b;
        final /* synthetic */ p2 c;
        final /* synthetic */ ek6 d;
        final /* synthetic */ long e;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class a<T> implements do4 {
            final /* synthetic */ do4 a;
            final /* synthetic */ Object b;
            final /* synthetic */ p2 c;
            final /* synthetic */ ek6 d;
            final /* synthetic */ long e;

            /* JADX INFO: renamed from: p2$h$a$a, reason: collision with other inner class name */
            @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
            @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watchLong$$inlined$watch$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
            public static final class C0004a extends p92 {
                Object b;
                /* synthetic */ Object c;
                int d;
                Object e;
                Object f;
                Object g;
                int h;

                public C0004a(n92 n92Var) {
                    super(n92Var);
                }

                @Override // defpackage.kn0
                public final Object invokeSuspend(Object obj) {
                    this.c = obj;
                    this.d |= Integer.MIN_VALUE;
                    return a.this.a(null, this);
                }
            }

            public a(do4 do4Var, Object obj, p2 p2Var, ek6 ek6Var, long j) {
                this.a = do4Var;
                this.b = obj;
                this.c = p2Var;
                this.d = ek6Var;
                this.e = j;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // defpackage.do4
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object a(java.lang.Object r8, defpackage.n92 r9) {
                /*
                    r7 = this;
                    boolean r0 = r9 instanceof p2.h.a.C0004a
                    if (r0 == 0) goto L13
                    r0 = r9
                    p2$h$a$a r0 = (p2.h.a.C0004a) r0
                    int r1 = r0.d
                    r2 = -2147483648(0xffffffff80000000, float:-0.0)
                    r3 = r1 & r2
                    if (r3 == 0) goto L13
                    int r1 = r1 - r2
                    r0.d = r1
                    goto L18
                L13:
                    p2$h$a$a r0 = new p2$h$a$a
                    r0.<init>(r9)
                L18:
                    java.lang.Object r9 = r0.c
                    tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                    int r2 = r0.d
                    r3 = 1
                    r4 = 0
                    if (r2 == 0) goto L36
                    if (r2 != r3) goto L30
                    java.lang.Object r7 = r0.g
                    do4 r7 = (defpackage.do4) r7
                    java.lang.Object r7 = r0.e
                    p2$h$a$a r7 = (p2.h.a.C0004a) r7
                    defpackage.br7.v(r9)
                    goto L65
                L30:
                    java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
                    defpackage.ygf.f(r7)
                    return r4
                L36:
                    defpackage.br7.v(r9)
                    do4 r9 = r7.a
                    java.lang.String r8 = (java.lang.String) r8
                    if (r8 == 0) goto L4f
                    p2 r8 = r7.c
                    ek6 r2 = r7.d
                    long r5 = r7.e
                    long r7 = r8.l(r2, r5)
                    java.lang.Long r2 = new java.lang.Long
                    r2.<init>(r7)
                    goto L51
                L4f:
                    java.lang.Object r2 = r7.b
                L51:
                    r0.b = r4
                    r0.e = r4
                    r0.f = r4
                    r0.g = r4
                    r7 = 0
                    r0.h = r7
                    r0.d = r3
                    java.lang.Object r7 = r9.a(r2, r0)
                    if (r7 != r1) goto L65
                    return r1
                L65:
                    c1e r7 = defpackage.c1e.a
                    return r7
                */
                throw new UnsupportedOperationException("Method not decompiled: p2.h.a.a(java.lang.Object, n92):java.lang.Object");
            }
        }

        public h(bo4 bo4Var, Object obj, p2 p2Var, ek6 ek6Var, long j) {
            this.a = bo4Var;
            this.b = obj;
            this.c = p2Var;
            this.d = ek6Var;
            this.e = j;
        }

        @Override // defpackage.bo4
        public Object b(do4 do4Var, n92 n92Var) {
            Object objB = this.a.b(new a(do4Var, this.b, this.c, this.d, this.e), n92Var);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class i implements bo4 {
        final /* synthetic */ bo4 a;
        final /* synthetic */ Object b;
        final /* synthetic */ p2 c;
        final /* synthetic */ ek6 d;
        final /* synthetic */ String e;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class a<T> implements do4 {
            final /* synthetic */ do4 a;
            final /* synthetic */ Object b;
            final /* synthetic */ p2 c;
            final /* synthetic */ ek6 d;
            final /* synthetic */ String e;

            /* JADX INFO: renamed from: p2$i$a$a, reason: collision with other inner class name */
            @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
            @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watchString$$inlined$watch$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
            public static final class C0005a extends p92 {
                Object b;
                /* synthetic */ Object c;
                int d;
                Object e;
                Object f;
                Object g;
                int h;

                public C0005a(n92 n92Var) {
                    super(n92Var);
                }

                @Override // defpackage.kn0
                public final Object invokeSuspend(Object obj) {
                    this.c = obj;
                    this.d |= Integer.MIN_VALUE;
                    return a.this.a(null, this);
                }
            }

            public a(do4 do4Var, Object obj, p2 p2Var, ek6 ek6Var, String str) {
                this.a = do4Var;
                this.b = obj;
                this.c = p2Var;
                this.d = ek6Var;
                this.e = str;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // defpackage.do4
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object a(java.lang.Object r6, defpackage.n92 r7) {
                /*
                    r5 = this;
                    boolean r0 = r7 instanceof p2.i.a.C0005a
                    if (r0 == 0) goto L13
                    r0 = r7
                    p2$i$a$a r0 = (p2.i.a.C0005a) r0
                    int r1 = r0.d
                    r2 = -2147483648(0xffffffff80000000, float:-0.0)
                    r3 = r1 & r2
                    if (r3 == 0) goto L13
                    int r1 = r1 - r2
                    r0.d = r1
                    goto L18
                L13:
                    p2$i$a$a r0 = new p2$i$a$a
                    r0.<init>(r7)
                L18:
                    java.lang.Object r7 = r0.c
                    tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                    int r2 = r0.d
                    r3 = 1
                    r4 = 0
                    if (r2 == 0) goto L36
                    if (r2 != r3) goto L30
                    java.lang.Object r5 = r0.g
                    do4 r5 = (defpackage.do4) r5
                    java.lang.Object r5 = r0.e
                    p2$i$a$a r5 = (p2.i.a.C0005a) r5
                    defpackage.br7.v(r7)
                    goto L60
                L30:
                    java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
                    defpackage.ygf.f(r5)
                    return r4
                L36:
                    defpackage.br7.v(r7)
                    do4 r7 = r5.a
                    java.lang.String r6 = (java.lang.String) r6
                    if (r6 == 0) goto L4a
                    p2 r6 = r5.c
                    ek6 r2 = r5.d
                    java.lang.String r5 = r5.e
                    java.lang.String r5 = r6.n(r2, r5)
                    goto L4c
                L4a:
                    java.lang.Object r5 = r5.b
                L4c:
                    r0.b = r4
                    r0.e = r4
                    r0.f = r4
                    r0.g = r4
                    r6 = 0
                    r0.h = r6
                    r0.d = r3
                    java.lang.Object r5 = r7.a(r5, r0)
                    if (r5 != r1) goto L60
                    return r1
                L60:
                    c1e r5 = defpackage.c1e.a
                    return r5
                */
                throw new UnsupportedOperationException("Method not decompiled: p2.i.a.a(java.lang.Object, n92):java.lang.Object");
            }
        }

        public i(bo4 bo4Var, Object obj, p2 p2Var, ek6 ek6Var, String str) {
            this.a = bo4Var;
            this.b = obj;
            this.c = p2Var;
            this.d = ek6Var;
            this.e = str;
        }

        @Override // defpackage.bo4
        public Object b(do4 do4Var, n92 n92Var) {
            Object objB = this.a.b(new a(do4Var, this.b, this.c, this.d, this.e), n92Var);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001J\u001e\u0010\u0005\u001a\u00020\u00042\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0096@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"kotlinx/coroutines/flow/internal/SafeCollector_commonKt$unsafeFlow$1", "Lbo4;", "Ldo4;", "collector", "Lc1e;", "b", "(Ldo4;Ln92;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class j implements bo4 {
        final /* synthetic */ bo4 a;
        final /* synthetic */ Object b;
        final /* synthetic */ p2 c;
        final /* synthetic */ ek6 d;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
        public static final class a<T> implements do4 {
            final /* synthetic */ do4 a;
            final /* synthetic */ Object b;
            final /* synthetic */ p2 c;
            final /* synthetic */ ek6 d;

            /* JADX INFO: renamed from: p2$j$a$a, reason: collision with other inner class name */
            @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
            @uv2(c = "com.medium.android.core.preferences.AbstractSharedPreferences$watchStringSet$$inlined$watch$1$2", f = "AbstractSharedPreferences.kt", l = {217}, m = "emit", v = 1)
            public static final class C0006a extends p92 {
                Object b;
                /* synthetic */ Object c;
                int d;
                Object e;
                Object f;
                Object g;
                int h;

                public C0006a(n92 n92Var) {
                    super(n92Var);
                }

                @Override // defpackage.kn0
                public final Object invokeSuspend(Object obj) {
                    this.c = obj;
                    this.d |= Integer.MIN_VALUE;
                    return a.this.a(null, this);
                }
            }

            public a(do4 do4Var, Object obj, p2 p2Var, ek6 ek6Var) {
                this.a = do4Var;
                this.b = obj;
                this.c = p2Var;
                this.d = ek6Var;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // defpackage.do4
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final java.lang.Object a(java.lang.Object r6, defpackage.n92 r7) {
                /*
                    r5 = this;
                    boolean r0 = r7 instanceof p2.j.a.C0006a
                    if (r0 == 0) goto L13
                    r0 = r7
                    p2$j$a$a r0 = (p2.j.a.C0006a) r0
                    int r1 = r0.d
                    r2 = -2147483648(0xffffffff80000000, float:-0.0)
                    r3 = r1 & r2
                    if (r3 == 0) goto L13
                    int r1 = r1 - r2
                    r0.d = r1
                    goto L18
                L13:
                    p2$j$a$a r0 = new p2$j$a$a
                    r0.<init>(r7)
                L18:
                    java.lang.Object r7 = r0.c
                    tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
                    int r2 = r0.d
                    r3 = 1
                    r4 = 0
                    if (r2 == 0) goto L36
                    if (r2 != r3) goto L30
                    java.lang.Object r5 = r0.g
                    do4 r5 = (defpackage.do4) r5
                    java.lang.Object r5 = r0.e
                    p2$j$a$a r5 = (p2.j.a.C0006a) r5
                    defpackage.br7.v(r7)
                    goto L5e
                L30:
                    java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
                    defpackage.ygf.f(r5)
                    return r4
                L36:
                    defpackage.br7.v(r7)
                    do4 r7 = r5.a
                    java.lang.String r6 = (java.lang.String) r6
                    if (r6 == 0) goto L48
                    p2 r6 = r5.c
                    ek6 r5 = r5.d
                    java.util.Set r5 = r6.q(r5)
                    goto L4a
                L48:
                    java.lang.Object r5 = r5.b
                L4a:
                    r0.b = r4
                    r0.e = r4
                    r0.f = r4
                    r0.g = r4
                    r6 = 0
                    r0.h = r6
                    r0.d = r3
                    java.lang.Object r5 = r7.a(r5, r0)
                    if (r5 != r1) goto L5e
                    return r1
                L5e:
                    c1e r5 = defpackage.c1e.a
                    return r5
                */
                throw new UnsupportedOperationException("Method not decompiled: p2.j.a.a(java.lang.Object, n92):java.lang.Object");
            }
        }

        public j(bo4 bo4Var, Object obj, p2 p2Var, ek6 ek6Var) {
            this.a = bo4Var;
            this.b = obj;
            this.c = p2Var;
            this.d = ek6Var;
        }

        @Override // defpackage.bo4
        public Object b(do4 do4Var, n92 n92Var) {
            Object objB = this.a.b(new a(do4Var, this.b, this.c, this.d), n92Var);
            return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
        }
    }

    public p2(SharedPreferences sharedPreferences, ub6 ub6Var, sb2 sb2Var) {
        sharedPreferences.getClass();
        ub6Var.getClass();
        sb2Var.getClass();
        this.sharedPreferences = sharedPreferences;
        this.jsonCodec = ub6Var;
        this.coroutineScope = sb2Var;
        SharedPreferences.OnSharedPreferenceChangeListener onSharedPreferenceChangeListener = new SharedPreferences.OnSharedPreferenceChangeListener() { // from class: o2
            @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
            public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences2, String str) {
                p2.w(this.a, sharedPreferences2, str);
            }
        };
        this.listener = onSharedPreferenceChangeListener;
        this._eventStream = k40.x(0, 7, null);
        sharedPreferences.registerOnSharedPreferenceChangeListener(onSharedPreferenceChangeListener);
    }

    public static /* synthetic */ void F(p2 p2Var, ek6 ek6Var, Set set, boolean z, int i2, Object obj) {
        if (obj != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: putStringSet");
            return;
        }
        if ((i2 & 4) != 0) {
            z = false;
        }
        p2Var.E(ek6Var, set, z);
    }

    public static /* synthetic */ bo4 H(p2 p2Var, ek6 ek6Var, kxd kxdVar, Object obj, int i2, Object obj2) {
        if (obj2 != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: watchAny");
            return null;
        }
        if ((i2 & 4) != 0) {
            obj = null;
        }
        return p2Var.G(ek6Var, kxdVar, obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ bo4 N(p2 p2Var, ek6 ek6Var, Set set, int i2, Object obj) {
        if (obj != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: watchStringSet");
            return null;
        }
        if ((i2 & 2) != 0) {
            set = ny3.a;
        }
        return p2Var.M(ek6Var, set);
    }

    public static /* synthetic */ Object h(p2 p2Var, ek6 ek6Var, kxd kxdVar, Object obj, int i2, Object obj2) {
        if (obj2 != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: getAny");
            return null;
        }
        if ((i2 & 4) != 0) {
            obj = null;
        }
        return p2Var.f(ek6Var, kxdVar, obj);
    }

    public static /* synthetic */ Object i(p2 p2Var, ek6 ek6Var, Class cls, Object obj, int i2, Object obj2) {
        if (obj2 != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: getAny");
            return null;
        }
        if ((i2 & 4) != 0) {
            obj = null;
        }
        return p2Var.g(ek6Var, cls, obj);
    }

    public static /* synthetic */ String o(p2 p2Var, ek6 ek6Var, String str, int i2, Object obj) {
        if (obj != null) {
            ik4.k("Super calls with default arguments not supported in this target, function: getString");
            return null;
        }
        if ((i2 & 2) != 0) {
            str = null;
        }
        return p2Var.n(ek6Var, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String r(ek6 key) {
        String strS = s(key);
        return strS == null ? key.asString() : strS;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void w(p2 p2Var, SharedPreferences sharedPreferences, String str) {
        vx0.c0(p2Var.coroutineScope, null, null, p2Var.new d(str, null), 3);
    }

    public final void A(ek6 key, int value) {
        key.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putInt(u(key), value);
        editorEdit.apply();
    }

    public final void B(ek6 key, long value) {
        key.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putLong(u(key), value);
        editorEdit.apply();
    }

    public final void C(ek6 key, String value) {
        key.getClass();
        value.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putString(u(key), value);
        editorEdit.apply();
    }

    public final void D(ek6 key, Map<String, String> values) {
        key.getClass();
        values.getClass();
        y(key, values, h);
    }

    public final void E(ek6 key, Set<String> values, boolean commit) {
        key.getClass();
        values.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putStringSet(u(key), values);
        if (commit) {
            editorEdit.commit();
        } else {
            editorEdit.apply();
        }
    }

    public final <T> bo4 G(ek6 key, kxd<T> typeToken, T defaultValue) {
        key.getClass();
        typeToken.getClass();
        return m40.J(new e(new q2(new to4(new r2(this, key, null), this._eventStream), this, key), defaultValue, this, key, typeToken, defaultValue));
    }

    public final bo4 I(ek6 key, boolean defaultValue) {
        key.getClass();
        return m40.J(new f(new q2(new to4(new r2(this, key, null), this._eventStream), this, key), Boolean.valueOf(defaultValue), this, key, defaultValue));
    }

    public final bo4 J(ek6 key, int defaultValue) {
        key.getClass();
        return m40.J(new g(new q2(new to4(new r2(this, key, null), this._eventStream), this, key), Integer.valueOf(defaultValue), this, key, defaultValue));
    }

    public final bo4 K(ek6 key, long defaultValue) {
        key.getClass();
        return m40.J(new h(new q2(new to4(new r2(this, key, null), this._eventStream), this, key), Long.valueOf(defaultValue), this, key, defaultValue));
    }

    public final bo4 L(ek6 key, String defaultValue) {
        key.getClass();
        return m40.J(new i(new q2(new to4(new r2(this, key, null), this._eventStream), this, key), defaultValue, this, key, defaultValue));
    }

    public final bo4 M(ek6 key, Set<String> defaultValue) {
        key.getClass();
        return m40.J(new j(new q2(new to4(new r2(this, key, null), this._eventStream), this, key), defaultValue, this, key));
    }

    public final void d() {
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.clear();
        editorEdit.commit();
        vx0.c0(this.coroutineScope, null, null, new c(null), 3);
    }

    public final void e(ek6... keys) {
        keys.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        for (ek6 ek6Var : keys) {
            editorEdit.remove(s(ek6Var));
            if (ek6Var.getOldKey() != null) {
                editorEdit.remove(ek6Var.getOldKey());
            }
        }
        editorEdit.apply();
    }

    public final <T> T f(ek6 key, kxd<T> typeToken, T t) {
        key.getClass();
        typeToken.getClass();
        try {
            String strO = o(this, key, null, 2, null);
            if (strO == null) {
                return t;
            }
            fh5 fh5Var = (fh5) this.jsonCodec;
            fh5Var.getClass();
            return (T) fh5Var.a.b(new StringReader(strO), kxd.b(typeToken.d()));
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a " + typeToken.c().getSimpleName(), new Object[0]);
            return t;
        }
    }

    public final <T> T g(ek6 key, Class<T> clazz, T t) {
        key.getClass();
        clazz.getClass();
        try {
            String strO = o(this, key, null, 2, null);
            if (strO == null) {
                return t;
            }
            fh5 fh5Var = (fh5) this.jsonCodec;
            fh5Var.getClass();
            return (T) fh5Var.a.c(clazz, strO);
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a " + clazz.getSimpleName(), new Object[0]);
            return t;
        }
    }

    public final boolean j(ek6 key, boolean z) {
        key.getClass();
        try {
            return this.sharedPreferences.getBoolean(s(key), z);
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a Boolean", new Object[0]);
            return z;
        }
    }

    public final int k(ek6 key, int i2) {
        key.getClass();
        try {
            return this.sharedPreferences.getInt(s(key), i2);
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not an Int", new Object[0]);
            return i2;
        }
    }

    public final long l(ek6 key, long j2) {
        key.getClass();
        try {
            return this.sharedPreferences.getLong(s(key), j2);
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a Long", new Object[0]);
            return j2;
        }
    }

    public final Set<String> m(ek6 key) {
        key.getClass();
        try {
            return this.sharedPreferences.getStringSet(s(key), null);
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a String set", new Object[0]);
            return null;
        }
    }

    public final String n(ek6 key, String str) {
        key.getClass();
        try {
            String string = this.sharedPreferences.getString(s(key), str);
            return string == null ? str : string;
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a String", new Object[0]);
            return str;
        }
    }

    public final Map<String, String> p(ek6 key) {
        key.getClass();
        return (Map) h(this, key, h, null, 4, null);
    }

    public final Set<String> q(ek6 key) {
        ny3 ny3Var = ny3.a;
        key.getClass();
        try {
            Set<String> stringSet = this.sharedPreferences.getStringSet(s(key), ny3Var);
            return stringSet == null ? ny3Var : stringSet;
        } catch (Exception e2) {
            wld.a.e(e2, key + " was not a String set", new Object[0]);
            return ny3Var;
        }
    }

    public String s(ek6 key) {
        key.getClass();
        if (this.sharedPreferences.contains(key.asString())) {
            return key.asString();
        }
        if (key.getOldKey() == null || !this.sharedPreferences.contains(key.getOldKey())) {
            return null;
        }
        return key.getOldKey();
    }

    public String t(ek6 key, String suffix) {
        key.getClass();
        suffix.getClass();
        if (this.sharedPreferences.contains(key.asPrefixFor(suffix))) {
            return key.asPrefixFor(suffix);
        }
        if (key.getOldKey() == null || !this.sharedPreferences.contains(key.asOldPrefixFor(suffix))) {
            return null;
        }
        return key.asOldPrefixFor(suffix);
    }

    public String u(ek6 key) {
        key.getClass();
        return key.asString();
    }

    public String v(ek6 key, String suffix) {
        key.getClass();
        suffix.getClass();
        return key.asPrefixFor(suffix);
    }

    public final void x(ek6 key, Object any) {
        key.getClass();
        any.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putString(u(key), ((fh5) this.jsonCodec).a.h(any));
        editorEdit.apply();
    }

    public final <T> void y(ek6 key, Object any, kxd<T> typeToken) {
        key.getClass();
        any.getClass();
        typeToken.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        fh5 fh5Var = (fh5) this.jsonCodec;
        fh5Var.getClass();
        ch5 ch5Var = fh5Var.a;
        Type typeD = typeToken.d();
        StringBuilder sb = new StringBuilder();
        try {
            ch5Var.j(any, typeD, ch5Var.g(new auc(sb)));
            editorEdit.putString(u(key), sb.toString());
            editorEdit.apply();
        } catch (IOException e2) {
            throw new JsonIOException(e2);
        }
    }

    public final void z(ek6 key, boolean value) {
        key.getClass();
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putBoolean(u(key), value);
        editorEdit.apply();
    }
}
