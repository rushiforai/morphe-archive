package q40;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class d extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final d f83656k;

    /* renamed from: l, reason: collision with root package name */
    public static final d f83657l;

    /* renamed from: m, reason: collision with root package name */
    public static final d f83658m;
    public static final d n;
    public static final d o;

    /* renamed from: p, reason: collision with root package name */
    public static final d f83659p;

    /* renamed from: q, reason: collision with root package name */
    public static final d f83660q;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83661j;

    static {
        int i5 = 0;
        f83656k = new d(i5, 0);
        f83657l = new d(i5, 1);
        f83658m = new d(i5, 2);
        n = new d(i5, 3);
        o = new d(i5, 4);
        f83659p = new d(i5, 5);
        f83660q = new d(i5, 6);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(int i5, int i11) {
        super(i5);
        this.f83661j = i11;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: BlockProcessor
        jadx.core.utils.exceptions.JadxRuntimeException: Try blocks wrapping queue limit reached! Please report as an issue!
        	at jadx.core.dex.visitors.blocks.BlockExceptionHandler.connectExcHandlers(BlockExceptionHandler.java:95)
        	at jadx.core.dex.visitors.blocks.BlockExceptionHandler.process(BlockExceptionHandler.java:61)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.independentBlockTreeMod(BlockProcessor.java:372)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.processBlocksTree(BlockProcessor.java:56)
        	at jadx.core.dex.visitors.blocks.BlockProcessor.visit(BlockProcessor.java:49)
        */
    @Override // kotlin.jvm.functions.Function0
    public final java.lang.Object invoke() {
        /*
            r4 = this;
            int r0 = r4.f83661j
            r1 = 1
            r2 = 0
            switch(r0) {
                case 0: goto L69;
                case 1: goto L5e;
                case 2: goto L4a;
                case 3: goto L3c;
                case 4: goto L27;
                case 5: goto L20;
                default: goto L7;
            }
        L7:
            java.lang.Object r0 = q40.g.f83671a
            java.lang.Object r0 = r0.getValue()
            java.lang.Class r0 = (java.lang.Class) r0
            if (r0 == 0) goto L1f
            java.lang.String r3 = "mWindow"
            java.lang.reflect.Field r3 = r0.getDeclaredField(r3)     // Catch: java.lang.NoSuchFieldException -> L1c
            r3.setAccessible(r1)     // Catch: java.lang.NoSuchFieldException -> L1c
            r2 = r3
            goto L1f
        L1c:
            r0.toString()
        L1f:
            return r2
        L20:
            java.lang.String r0 = "com.android.internal.policy.DecorView"
            java.lang.Class r2 = java.lang.Class.forName(r0)     // Catch: java.lang.Throwable -> L26
        L26:
            return r2
        L27:
            java.lang.Object r0 = q40.f.f83668a
            java.lang.Object r0 = r0.getValue()
            java.lang.Class r0 = (java.lang.Class) r0
            if (r0 == 0) goto L3b
            java.lang.String r1 = "getInstance"
            java.lang.reflect.Method r0 = r0.getMethod(r1, r2)
            java.lang.Object r2 = r0.invoke(r2, r2)
        L3b:
            return r2
        L3c:
            java.lang.String r0 = "android.view.WindowManagerGlobal"
            java.lang.Class r2 = java.lang.Class.forName(r0)     // Catch: java.lang.Throwable -> L43
            goto L49
        L43:
            r0 = move-exception
            java.lang.String r1 = "WindowManagerSpy"
            android.util.Log.w(r1, r0)
        L49:
            return r2
        L4a:
            java.lang.Object r0 = q40.f.f83668a
            java.lang.Object r0 = r0.getValue()
            java.lang.Class r0 = (java.lang.Class) r0
            if (r0 == 0) goto L5d
            java.lang.String r2 = "mViews"
            java.lang.reflect.Field r2 = r0.getDeclaredField(r2)
            r2.setAccessible(r1)
        L5d:
            return r2
        L5e:
            java.lang.Class<androidx.appcompat.view.WindowCallbackWrapper> r0 = androidx.appcompat.view.WindowCallbackWrapper.class
            goto L68
        L61:
            java.lang.String r0 = "android.support.v7.view.WindowCallbackWrapper"
            java.lang.Class r2 = java.lang.Class.forName(r0)     // Catch: java.lang.Throwable -> L67
        L67:
            r0 = r2
        L68:
            return r0
        L69:
            java.lang.Object r0 = q40.e.f83662d
            java.lang.Object r0 = r0.getValue()
            java.lang.Class r0 = (java.lang.Class) r0
            if (r0 == 0) goto L7d
            java.lang.String r3 = "mWrapped"
            java.lang.reflect.Field r0 = r0.getDeclaredField(r3)     // Catch: java.lang.Throwable -> L7d
            r0.setAccessible(r1)     // Catch: java.lang.Throwable -> L7d
            r2 = r0
        L7d:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: q40.d.invoke():java.lang.Object");
    }
}
