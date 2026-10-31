package v70;

import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final s f92172a = new s(-1, null, null, 0);

    /* renamed from: b, reason: collision with root package name */
    public static final int f92173b = y70.g.h(32, 12, "kotlinx.coroutines.bufferedChannel.segmentSize");

    /* renamed from: c, reason: collision with root package name */
    public static final int f92174c = y70.g.h(10000, 12, "kotlinx.coroutines.bufferedChannel.expandBufferCompletionWaitIterations");

    /* renamed from: d, reason: collision with root package name */
    public static final w50.g f92175d = new w50.g("BUFFERED", 1);

    /* renamed from: e, reason: collision with root package name */
    public static final w50.g f92176e = new w50.g("SHOULD_BUFFER", 1);

    /* renamed from: f, reason: collision with root package name */
    public static final w50.g f92177f = new w50.g("S_RESUMING_BY_RCV", 1);

    /* renamed from: g, reason: collision with root package name */
    public static final w50.g f92178g = new w50.g("RESUMING_BY_EB", 1);

    /* renamed from: h, reason: collision with root package name */
    public static final w50.g f92179h = new w50.g("POISONED", 1);

    /* renamed from: i, reason: collision with root package name */
    public static final w50.g f92180i = new w50.g("DONE_RCV", 1);

    /* renamed from: j, reason: collision with root package name */
    public static final w50.g f92181j = new w50.g("INTERRUPTED_SEND", 1);

    /* renamed from: k, reason: collision with root package name */
    public static final w50.g f92182k = new w50.g("INTERRUPTED_RCV", 1);

    /* renamed from: l, reason: collision with root package name */
    public static final w50.g f92183l = new w50.g("CHANNEL_CLOSED", 1);

    /* renamed from: m, reason: collision with root package name */
    public static final w50.g f92184m = new w50.g("SUSPEND", 1);
    public static final w50.g n = new w50.g("SUSPEND_NO_WAITER", 1);
    public static final w50.g o = new w50.g("FAILED", 1);

    /* renamed from: p, reason: collision with root package name */
    public static final w50.g f92185p = new w50.g("NO_RECEIVE_RESULT", 1);

    /* renamed from: q, reason: collision with root package name */
    public static final w50.g f92186q = new w50.g("CLOSE_HANDLER_CLOSED", 1);

    /* renamed from: r, reason: collision with root package name */
    public static final w50.g f92187r = new w50.g("CLOSE_HANDLER_INVOKED", 1);

    /* renamed from: s, reason: collision with root package name */
    public static final w50.g f92188s = new w50.g("NO_CLOSE_CAUSE", 1);

    public static final boolean a(t70.l lVar, Object obj, Function3 function3) {
        w50.g gVarG = lVar.g(obj, function3);
        if (gVarG == null) {
            return false;
        }
        lVar.x(gVarG);
        return true;
    }
}
