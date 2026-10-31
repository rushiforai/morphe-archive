package ads_mobile_sdk;

import b.ed;
import b.f9;
import b.q8;
import b.r0;
import b.x0;
import com.google.gson.Gson;
import java.io.Closeable;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.t0;

/* loaded from: classes.dex */
public final class p32 implements q8, r0 {

    /* renamed from: a, reason: collision with root package name */
    public final zj1 f8068a;

    /* renamed from: b, reason: collision with root package name */
    public final y22 f8069b;

    /* renamed from: c, reason: collision with root package name */
    public final ti.r f8070c;

    /* renamed from: d, reason: collision with root package name */
    public final ni.q f8071d;

    /* renamed from: e, reason: collision with root package name */
    public final qw2 f8072e;

    /* renamed from: f, reason: collision with root package name */
    public final f9 f8073f;

    /* renamed from: g, reason: collision with root package name */
    public final l f8074g;

    /* renamed from: h, reason: collision with root package name */
    public final qv2 f8075h;

    /* renamed from: i, reason: collision with root package name */
    public final bw2 f8076i;

    /* renamed from: j, reason: collision with root package name */
    public final iw2 f8077j;

    /* renamed from: k, reason: collision with root package name */
    public final jr0 f8078k;

    /* renamed from: l, reason: collision with root package name */
    public final b.m6 f8079l;

    /* renamed from: m, reason: collision with root package name */
    public final ci3 f8080m;
    public final Gson n;
    public final m5 o;

    /* renamed from: p, reason: collision with root package name */
    public final t70.j0 f8081p;

    /* renamed from: q, reason: collision with root package name */
    public volatile boolean f8082q;

    /* renamed from: r, reason: collision with root package name */
    public volatile boolean f8083r;

    public p32(zj1 javascriptEngine, y22 networkResponseRequester, ti.r signalsProvider, ni.q baseRequest, qw2 requestType, f9 internalAdRequestEventEmitter, l actionFunction, qv2 clientSideRequestBuilder, bw2 requestThrottler, iw2 requestThrottlerV2, jr0 flags, b.m6 randomGenerator, ci3 traceLogger, Gson gson, m5 adRequestDomainPreloader, t70.j0 backgroundScope) {
        Intrinsics.g(javascriptEngine, "javascriptEngine");
        Intrinsics.g(networkResponseRequester, "networkResponseRequester");
        Intrinsics.g(signalsProvider, "signalsProvider");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        Intrinsics.g(actionFunction, "actionFunction");
        Intrinsics.g(clientSideRequestBuilder, "clientSideRequestBuilder");
        Intrinsics.g(requestThrottler, "requestThrottler");
        Intrinsics.g(requestThrottlerV2, "requestThrottlerV2");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(randomGenerator, "randomGenerator");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(adRequestDomainPreloader, "adRequestDomainPreloader");
        Intrinsics.g(backgroundScope, "backgroundScope");
        this.f8068a = javascriptEngine;
        this.f8069b = networkResponseRequester;
        this.f8070c = signalsProvider;
        this.f8071d = baseRequest;
        this.f8072e = requestType;
        this.f8073f = internalAdRequestEventEmitter;
        this.f8074g = actionFunction;
        this.f8075h = clientSideRequestBuilder;
        this.f8076i = requestThrottler;
        this.f8077j = requestThrottlerV2;
        this.f8078k = flags;
        this.f8079l = randomGenerator;
        this.f8080m = traceLogger;
        this.n = gson;
        this.o = adRequestDomainPreloader;
        this.f8081p = backgroundScope;
    }

    /* JADX WARN: Code restructure failed: missing block: B:73:0x01ac, code lost:
    
        if (r1 == r6) goto L164;
     */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Not initialized variable reg: 9, insn: 0x00bd: MOVE (r3 I:??[OBJECT, ARRAY]) = (r9 I:??[OBJECT, ARRAY]), block:B:35:0x00bc */
    /* JADX WARN: Removed duplicated region for block: B:100:0x021d A[Catch: all -> 0x00d2, TRY_ENTER, TryCatch #4 {all -> 0x00d2, blocks: (B:133:0x02de, B:135:0x02e2, B:138:0x02eb, B:140:0x02f7, B:142:0x0301, B:144:0x0305, B:146:0x030d, B:149:0x033a, B:150:0x033b, B:21:0x0082, B:115:0x0272, B:24:0x0092, B:95:0x020d, B:97:0x0213, B:100:0x021d, B:102:0x022f, B:106:0x024f, B:112:0x025d, B:79:0x01c3, B:89:0x01fd, B:92:0x0202, B:37:0x00cd, B:59:0x0160, B:61:0x0168, B:69:0x01a3, B:72:0x01a8, B:42:0x00e2, B:54:0x013d, B:56:0x0145), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0270  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x027b  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0287 A[Catch: all -> 0x03d0, TRY_LEAVE, TryCatch #1 {all -> 0x03d0, blocks: (B:131:0x02da, B:197:0x0411, B:198:0x0414, B:117:0x0275, B:120:0x027d, B:122:0x0287, B:195:0x040f, B:172:0x03d5, B:174:0x03dc, B:176:0x03e0, B:178:0x03e4, B:181:0x03eb, B:183:0x03ef, B:185:0x03f3, B:187:0x03f7, B:188:0x03f8, B:189:0x03fd, B:190:0x03fe, B:191:0x0405, B:192:0x0406, B:193:0x040d, B:194:0x040e), top: B:230:0x002d, inners: #0, #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:129:0x02d3 A[Catch: all -> 0x0071, TRY_LEAVE, TryCatch #2 {all -> 0x0071, blocks: (B:16:0x006c, B:127:0x02c6, B:129:0x02d3), top: B:231:0x006c }] */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02e2 A[Catch: all -> 0x00d2, TRY_LEAVE, TryCatch #4 {all -> 0x00d2, blocks: (B:133:0x02de, B:135:0x02e2, B:138:0x02eb, B:140:0x02f7, B:142:0x0301, B:144:0x0305, B:146:0x030d, B:149:0x033a, B:150:0x033b, B:21:0x0082, B:115:0x0272, B:24:0x0092, B:95:0x020d, B:97:0x0213, B:100:0x021d, B:102:0x022f, B:106:0x024f, B:112:0x025d, B:79:0x01c3, B:89:0x01fd, B:92:0x0202, B:37:0x00cd, B:59:0x0160, B:61:0x0168, B:69:0x01a3, B:72:0x01a8, B:42:0x00e2, B:54:0x013d, B:56:0x0145), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02eb A[Catch: all -> 0x00d2, TRY_ENTER, TryCatch #4 {all -> 0x00d2, blocks: (B:133:0x02de, B:135:0x02e2, B:138:0x02eb, B:140:0x02f7, B:142:0x0301, B:144:0x0305, B:146:0x030d, B:149:0x033a, B:150:0x033b, B:21:0x0082, B:115:0x0272, B:24:0x0092, B:95:0x020d, B:97:0x0213, B:100:0x021d, B:102:0x022f, B:106:0x024f, B:112:0x025d, B:79:0x01c3, B:89:0x01fd, B:92:0x0202, B:37:0x00cd, B:59:0x0160, B:61:0x0168, B:69:0x01a3, B:72:0x01a8, B:42:0x00e2, B:54:0x013d, B:56:0x0145), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0364  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x0367  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x03c9  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x03dc A[Catch: all -> 0x03e8, TryCatch #8 {all -> 0x03e8, blocks: (B:172:0x03d5, B:174:0x03dc, B:176:0x03e0, B:178:0x03e4, B:181:0x03eb, B:183:0x03ef, B:185:0x03f3, B:187:0x03f7, B:188:0x03f8, B:189:0x03fd, B:190:0x03fe, B:191:0x0405, B:192:0x0406, B:193:0x040d, B:194:0x040e), top: B:241:0x03d5, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:194:0x040e A[Catch: all -> 0x03e8, TRY_LEAVE, TryCatch #8 {all -> 0x03e8, blocks: (B:172:0x03d5, B:174:0x03dc, B:176:0x03e0, B:178:0x03e4, B:181:0x03eb, B:183:0x03ef, B:185:0x03f3, B:187:0x03f7, B:188:0x03f8, B:189:0x03fd, B:190:0x03fe, B:191:0x0405, B:192:0x0406, B:193:0x040d, B:194:0x040e), top: B:241:0x03d5, outer: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0420 A[Catch: all -> 0x042c, TryCatch #10 {all -> 0x042c, blocks: (B:201:0x0419, B:203:0x0420, B:205:0x0424, B:207:0x0428, B:210:0x042f, B:212:0x0433, B:214:0x0437, B:216:0x043b, B:217:0x043c, B:218:0x0441, B:219:0x0442, B:220:0x0449, B:221:0x044a, B:222:0x0451, B:223:0x0452), top: B:242:0x0419 }] */
    /* JADX WARN: Removed duplicated region for block: B:223:0x0452 A[Catch: all -> 0x042c, TRY_LEAVE, TryCatch #10 {all -> 0x042c, blocks: (B:201:0x0419, B:203:0x0420, B:205:0x0424, B:207:0x0428, B:210:0x042f, B:212:0x0433, B:214:0x0437, B:216:0x043b, B:217:0x043c, B:218:0x0441, B:219:0x0442, B:220:0x0449, B:221:0x044a, B:222:0x0451, B:223:0x0452), top: B:242:0x0419 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0145 A[Catch: all -> 0x00d2, TryCatch #4 {all -> 0x00d2, blocks: (B:133:0x02de, B:135:0x02e2, B:138:0x02eb, B:140:0x02f7, B:142:0x0301, B:144:0x0305, B:146:0x030d, B:149:0x033a, B:150:0x033b, B:21:0x0082, B:115:0x0272, B:24:0x0092, B:95:0x020d, B:97:0x0213, B:100:0x021d, B:102:0x022f, B:106:0x024f, B:112:0x025d, B:79:0x01c3, B:89:0x01fd, B:92:0x0202, B:37:0x00cd, B:59:0x0160, B:61:0x0168, B:69:0x01a3, B:72:0x01a8, B:42:0x00e2, B:54:0x013d, B:56:0x0145), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0168 A[Catch: all -> 0x00d2, TRY_LEAVE, TryCatch #4 {all -> 0x00d2, blocks: (B:133:0x02de, B:135:0x02e2, B:138:0x02eb, B:140:0x02f7, B:142:0x0301, B:144:0x0305, B:146:0x030d, B:149:0x033a, B:150:0x033b, B:21:0x0082, B:115:0x0272, B:24:0x0092, B:95:0x020d, B:97:0x0213, B:100:0x021d, B:102:0x022f, B:106:0x024f, B:112:0x025d, B:79:0x01c3, B:89:0x01fd, B:92:0x0202, B:37:0x00cd, B:59:0x0160, B:61:0x0168, B:69:0x01a3, B:72:0x01a8, B:42:0x00e2, B:54:0x013d, B:56:0x0145), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x018a A[Catch: all -> 0x00bb, PHI: r0 r7 r9 r14
      0x018a: PHI (r0v15 ads_mobile_sdk.p32) = (r0v0 ads_mobile_sdk.p32), (r0v11 ads_mobile_sdk.p32), (r0v16 ads_mobile_sdk.p32), (r0v16 ads_mobile_sdk.p32) binds: [B:65:0x0188, B:55:0x0143, B:60:0x0166, B:61:0x0168] A[DONT_GENERATE, DONT_INLINE]
      0x018a: PHI (r7v9 java.io.Closeable) = (r7v44 java.io.Closeable), (r7v45 java.io.Closeable), (r7v46 java.io.Closeable), (r7v47 java.io.Closeable) binds: [B:65:0x0188, B:55:0x0143, B:60:0x0166, B:61:0x0168] A[DONT_GENERATE, DONT_INLINE]
      0x018a: PHI (r9v14 ads_mobile_sdk.th3) = (r9v7 ads_mobile_sdk.th3), (r9v11 ads_mobile_sdk.th3), (r9v15 ads_mobile_sdk.th3), (r9v15 ads_mobile_sdk.th3) binds: [B:65:0x0188, B:55:0x0143, B:60:0x0166, B:61:0x0168] A[DONT_GENERATE, DONT_INLINE]
      0x018a: PHI (r14v6 long) = (r14v1 long), (r14v4 long), (r14v8 long), (r14v11 long) binds: [B:65:0x0188, B:55:0x0143, B:60:0x0166, B:61:0x0168] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TryCatch #9 {all -> 0x00bb, blocks: (B:32:0x00b6, B:75:0x01b0, B:76:0x01b4, B:78:0x01bf, B:81:0x01c6, B:88:0x01f7, B:91:0x0200, B:66:0x018a, B:68:0x0195, B:71:0x01a6), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0195 A[Catch: all -> 0x00bb, TRY_LEAVE, TryCatch #9 {all -> 0x00bb, blocks: (B:32:0x00b6, B:75:0x01b0, B:76:0x01b4, B:78:0x01bf, B:81:0x01c6, B:88:0x01f7, B:91:0x0200, B:66:0x018a, B:68:0x0195, B:71:0x01a6), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01b4 A[Catch: all -> 0x00bb, PHI: r0 r7 r9 r14
      0x01b4: PHI (r0v20 ads_mobile_sdk.p32) = (r0v15 ads_mobile_sdk.p32), (r0v21 ads_mobile_sdk.p32) binds: [B:67:0x0193, B:75:0x01b0] A[DONT_GENERATE, DONT_INLINE]
      0x01b4: PHI (r7v12 java.io.Closeable) = (r7v40 java.io.Closeable), (r7v41 java.io.Closeable) binds: [B:67:0x0193, B:75:0x01b0] A[DONT_GENERATE, DONT_INLINE]
      0x01b4: PHI (r9v18 ads_mobile_sdk.th3) = (r9v14 ads_mobile_sdk.th3), (r9v19 ads_mobile_sdk.th3) binds: [B:67:0x0193, B:75:0x01b0] A[DONT_GENERATE, DONT_INLINE]
      0x01b4: PHI (r14v13 long) = (r14v6 long), (r14v14 long) binds: [B:67:0x0193, B:75:0x01b0] A[DONT_GENERATE, DONT_INLINE], TryCatch #9 {all -> 0x00bb, blocks: (B:32:0x00b6, B:75:0x01b0, B:76:0x01b4, B:78:0x01bf, B:81:0x01c6, B:88:0x01f7, B:91:0x0200, B:66:0x018a, B:68:0x0195, B:71:0x01a6), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x01bf A[Catch: all -> 0x00bb, TRY_LEAVE, TryCatch #9 {all -> 0x00bb, blocks: (B:32:0x00b6, B:75:0x01b0, B:76:0x01b4, B:78:0x01bf, B:81:0x01c6, B:88:0x01f7, B:91:0x0200, B:66:0x018a, B:68:0x0195, B:71:0x01a6), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01f7 A[Catch: all -> 0x00bb, TRY_ENTER, TRY_LEAVE, TryCatch #9 {all -> 0x00bb, blocks: (B:32:0x00b6, B:75:0x01b0, B:76:0x01b4, B:78:0x01bf, B:81:0x01c6, B:88:0x01f7, B:91:0x0200, B:66:0x018a, B:68:0x0195, B:71:0x01a6), top: B:230:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0213 A[Catch: all -> 0x00d2, TRY_LEAVE, TryCatch #4 {all -> 0x00d2, blocks: (B:133:0x02de, B:135:0x02e2, B:138:0x02eb, B:140:0x02f7, B:142:0x0301, B:144:0x0305, B:146:0x030d, B:149:0x033a, B:150:0x033b, B:21:0x0082, B:115:0x0272, B:24:0x0092, B:95:0x020d, B:97:0x0213, B:100:0x021d, B:102:0x022f, B:106:0x024f, B:112:0x025d, B:79:0x01c3, B:89:0x01fd, B:92:0x0202, B:37:0x00cd, B:59:0x0160, B:61:0x0168, B:69:0x01a3, B:72:0x01a8, B:42:0x00e2, B:54:0x013d, B:56:0x0145), top: B:230:0x002d }] */
    /* JADX WARN: Type inference failed for: r7v0, types: [int] */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v2, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v6, types: [ads_mobile_sdk.th3, java.io.Closeable, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(p32 p32Var, ContinuationImpl continuationImpl) {
        l32 l32Var;
        Closeable closeable;
        th3 th3Var;
        th3 th3Var2;
        th3 th3Var3;
        long j11;
        Closeable closeable2;
        Closeable closeable3;
        Closeable closeable4;
        Closeable closeable5;
        Closeable closeable6;
        Closeable closeable7;
        p32 p32Var2;
        b.a1 a1Var;
        ti.p pVar;
        boolean z11;
        b.a1 tu0Var;
        Closeable closeable8;
        ti.p pVar2;
        Closeable closeable9;
        p32 p32Var3;
        th3 th3Var4;
        th3 th3Var5;
        b.h2 h2Var;
        Closeable closeable10;
        Throwable th2;
        Closeable closeable11;
        p32 p32Var4;
        List list;
        b.a1 a1Var2;
        z23 z23Var;
        d33 d33Var;
        f9 f9Var;
        d33 d33Var2;
        p32 p32Var5 = p32Var;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof l32) {
            l32Var = (l32) continuationImpl;
            int i5 = l32Var.f6059l;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l32Var.f6059l = i5 - Integer.MIN_VALUE;
            } else {
                l32Var = new l32(p32Var5, continuationImpl);
            }
        }
        Object objA = l32Var.f6057j;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? A = l32Var.f6059l;
        try {
            try {
                try {
                    switch (A) {
                        case 0:
                            ResultKt.b(objA);
                            if (((Boolean) p32Var5.f8078k.a("gads:ad_request_preconnect_during_signals_enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                                p32Var5.o.b$1();
                            }
                            A = ji3.a(wv0.CUI_NAME_ADREQUEST_CLIENT_REQUEST, EmptyList.f71733a, true);
                            try {
                                Duration.f72038b.getClass();
                                if (!((Boolean) p32Var5.f8078k.a("gads:request_throttler:enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                                    th3Var3 = A;
                                    j11 = 0;
                                    closeable3 = A;
                                    Duration.f72038b.getClass();
                                    closeable5 = closeable3;
                                    if (!Duration.d(j11, 0L)) {
                                    }
                                    return coroutineSingletons;
                                }
                                iw2 iw2Var = p32Var5.f8077j;
                                String strL = p32Var5.f8071d.l();
                                qw2 qw2Var = p32Var5.f8072e;
                                l32Var.f6048a = p32Var5;
                                l32Var.f6049b = A;
                                l32Var.f6050c = A;
                                l32Var.f6055h = 0L;
                                l32Var.f6059l = 1;
                                objA = iw2Var.a(qw2Var, strL, l32Var);
                                if (objA != coroutineSingletons) {
                                    th3Var3 = A;
                                    j11 = 0;
                                    closeable2 = A;
                                    closeable3 = closeable2;
                                    if (((Boolean) objA).booleanValue()) {
                                        bw2 bw2Var = p32Var5.f8076i;
                                        String strL2 = p32Var5.f8071d.l();
                                        l32Var.f6048a = p32Var5;
                                        l32Var.f6049b = th3Var3;
                                        l32Var.f6050c = closeable2;
                                        l32Var.f6055h = j11;
                                        l32Var.f6059l = 2;
                                        objA = bw2Var.a(strL2, l32Var);
                                        closeable4 = closeable2;
                                        if (objA == coroutineSingletons) {
                                        }
                                        closeable3 = closeable4;
                                        if (((Boolean) objA).booleanValue()) {
                                            jr0 jr0Var = p32Var5.f8078k;
                                            jr0Var.getClass();
                                            Duration.Companion companion = Duration.f72038b;
                                            j11 = ((Duration) jr0Var.a("gads:request_throttler_retry_delay_ms", ed.k(500, DurationUnit.f72045d, "gads:request_throttler_retry_delay_ms"), u.a$1)).f72041a;
                                            closeable3 = closeable4;
                                        }
                                        Duration.f72038b.getClass();
                                        closeable5 = closeable3;
                                        if (!Duration.d(j11, 0L)) {
                                            iw2 iw2Var2 = p32Var5.f8077j;
                                            String strL3 = p32Var5.f8071d.l();
                                            qw2 qw2Var2 = p32Var5.f8072e;
                                            l32Var.f6048a = p32Var5;
                                            l32Var.f6049b = th3Var3;
                                            l32Var.f6050c = closeable3;
                                            l32Var.f6059l = 3;
                                            objA = iw2Var2.b(qw2Var2, strL3, l32Var);
                                            closeable6 = closeable3;
                                            break;
                                        } else {
                                            Duration.f72038b.getClass();
                                            if (Duration.c(j11, 0L) <= 0) {
                                                l32Var.f6048a = p32Var5;
                                                l32Var.f6049b = th3Var3;
                                                l32Var.f6050c = closeable5;
                                                l32Var.f6059l = 4;
                                                if (t0.c(j11, l32Var) != coroutineSingletons) {
                                                    closeable = closeable5;
                                                    th3Var2 = th3Var3;
                                                    uu0 uu0Var = new uu0("Too many recently failed requests for ad unit ID: " + p32Var5.f8071d.l() + ". You must wait a few seconds before making another ad request.", true);
                                                    zi3.a(uu0Var, false);
                                                    CloseableKt.a(closeable, null);
                                                    return uu0Var;
                                                }
                                            } else {
                                                ti.r rVar = p32Var5.f8070c;
                                                l32Var.f6048a = p32Var5;
                                                l32Var.f6049b = th3Var3;
                                                l32Var.f6050c = closeable5;
                                                l32Var.f6059l = 5;
                                                rVar.getClass();
                                                objA = ti.r.c(rVar, l32Var);
                                                closeable7 = closeable5;
                                                if (objA != coroutineSingletons) {
                                                    p32Var2 = p32Var5;
                                                    a1Var = (b.a1) objA;
                                                    if (!(a1Var instanceof pu0)) {
                                                        pu0 pu0Var = (pu0) a1Var;
                                                        zi3.a(pu0Var, false);
                                                        CloseableKt.a(closeable7, null);
                                                        return pu0Var;
                                                    }
                                                    Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                                                    pVar = (ti.p) ((xu0) a1Var).a();
                                                    if (!p32Var2.f8078k.f5361w) {
                                                        p32Var2.f8079l.getClass();
                                                        Random.f71890a.getClass();
                                                        z11 = ((double) Random.f71891b.f(1000)) < p32Var2.f8078k.f5362x * ((double) 1000);
                                                        if (!p32Var2.f8078k.f5361w && !z11) {
                                                            tu0Var = null;
                                                            closeable8 = closeable7;
                                                            pVar2 = pVar;
                                                            closeable9 = closeable8;
                                                            p32Var3 = p32Var2;
                                                            if (p32Var3.f8078k.f5361w) {
                                                                if (tu0Var == null) {
                                                                    tu0Var = new tu0("Client side request building returned null while building URL.");
                                                                }
                                                                closeable10 = closeable9;
                                                                th2 = null;
                                                                if (tu0Var instanceof pu0) {
                                                                    pu0 pu0Var2 = (pu0) tu0Var;
                                                                    zi3.a(pu0Var2, false);
                                                                    CloseableKt.a(closeable10, th2);
                                                                    return pu0Var2;
                                                                }
                                                                fq fqVar = (fq) ((xu0) tu0Var).a();
                                                                int i11 = 8;
                                                                if (z11) {
                                                                    mu0.a(new a3.e(fqVar, i11));
                                                                }
                                                                if (z11 && (list = fqVar.f3463g) != null && (!list.isEmpty())) {
                                                                    IllegalStateException illegalStateException = new IllegalStateException("CSRB A/B divergence: " + fqVar.f3463g);
                                                                    p32Var3.f8080m.a("CSRB A/B divergence", (Throwable) illegalStateException);
                                                                    if (((Boolean) p32Var3.f8078k.a("gads:csrb_abtest_exception:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                                                                        throw illegalStateException;
                                                                    }
                                                                }
                                                                new Pair(pVar2, fqVar);
                                                                CloseableKt.a(closeable10, null);
                                                                y22 y22Var = p32Var3.f8069b;
                                                                l32Var.f6048a = p32Var3;
                                                                l32Var.f6049b = null;
                                                                l32Var.f6050c = null;
                                                                l32Var.f6051d = null;
                                                                l32Var.f6052e = null;
                                                                l32Var.f6053f = null;
                                                                l32Var.f6054g = null;
                                                                l32Var.f6059l = 8;
                                                                objA = y22Var.a(pVar2, fqVar, l32Var);
                                                                if (objA != coroutineSingletons) {
                                                                    p32Var4 = p32Var3;
                                                                    a1Var2 = (b.a1) objA;
                                                                    if (!(a1Var2 instanceof pu0)) {
                                                                        return (pu0) a1Var2;
                                                                    }
                                                                    Intrinsics.e(a1Var2, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                                                                    z23Var = (z23) ((xu0) a1Var2).a();
                                                                    l lVar = p32Var4.f8074g;
                                                                    l32Var.f6048a = p32Var4;
                                                                    l32Var.f6049b = z23Var;
                                                                    l32Var.f6059l = 9;
                                                                    if (lVar.a(z23Var, l32Var) != coroutineSingletons) {
                                                                        ji3.a().g().f7225b.f3352b = z23Var.f12428b.f4554h;
                                                                        boolean z12 = !z23Var.f12427a.isEmpty();
                                                                        p32Var4.f8083r = z12;
                                                                        m0.t(p32Var4.f8081p, null, null, new o32(z23Var, p32Var4, z12, null), 3);
                                                                        p32Var4.f8082q = true;
                                                                        d33Var = new d33(new v23(p32Var4.f8071d), z23Var, false, null);
                                                                        f9Var = p32Var4.f8073f;
                                                                        l32Var.f6048a = d33Var;
                                                                        l32Var.f6049b = null;
                                                                        l32Var.f6059l = 10;
                                                                        if (f9Var.a(d33Var, l32Var) != coroutineSingletons) {
                                                                            d33Var2 = d33Var;
                                                                            return new xu0(d33Var2);
                                                                        }
                                                                    }
                                                                }
                                                            } else {
                                                                th3 th3VarA = ji3.a(wv0.CUI_NAME_ADREQUEST_BUILDURL, EmptyList.f71733a, true);
                                                                try {
                                                                    String json = p32Var3.n.toJson(pVar2);
                                                                    mu0.a(new as1(json, 1));
                                                                    b.h2 h2Var2 = fq.f3456h;
                                                                    zj1 zj1Var = p32Var3.f8068a;
                                                                    Intrinsics.d(json);
                                                                    l32Var.f6048a = p32Var3;
                                                                    l32Var.f6049b = th3Var3;
                                                                    l32Var.f6050c = closeable9;
                                                                    l32Var.f6051d = pVar2;
                                                                    l32Var.f6052e = th3VarA;
                                                                    l32Var.f6053f = th3VarA;
                                                                    l32Var.f6054g = h2Var2;
                                                                    l32Var.f6056i = z11;
                                                                    l32Var.f6059l = 7;
                                                                    Object objA2 = zj1Var.a("AFMA_getAdDictionary", json, l32Var);
                                                                    if (objA2 != coroutineSingletons) {
                                                                        th3Var5 = th3VarA;
                                                                        objA = objA2;
                                                                        h2Var = h2Var2;
                                                                        th3Var4 = th3Var5;
                                                                        h2Var.getClass();
                                                                        tu0Var = b.h2.a((b.a1) objA);
                                                                        if (tu0Var instanceof pu0) {
                                                                            zi3.a((pu0) tu0Var, false);
                                                                        }
                                                                        th2 = null;
                                                                        CloseableKt.a(th3Var4, null);
                                                                        closeable10 = closeable9;
                                                                        if (tu0Var instanceof pu0) {
                                                                        }
                                                                    }
                                                                } catch (Throwable th3) {
                                                                    th = th3;
                                                                    th3Var4 = th3VarA;
                                                                    th3Var5 = th3Var4;
                                                                    try {
                                                                        th3Var5.b(th);
                                                                        if (!(th instanceof b.a4)) {
                                                                        }
                                                                    } finally {
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        l32Var.f6048a = p32Var2;
                                                        l32Var.f6049b = th3Var3;
                                                        l32Var.f6050c = closeable7;
                                                        l32Var.f6051d = pVar;
                                                        l32Var.f6056i = z11;
                                                        l32Var.f6059l = 6;
                                                        objA = p32Var2.a(pVar, l32Var);
                                                        closeable11 = closeable7;
                                                        if (objA == coroutineSingletons) {
                                                        }
                                                        tu0Var = (b.a1) objA;
                                                        closeable8 = closeable11;
                                                        pVar2 = pVar;
                                                        closeable9 = closeable8;
                                                        p32Var3 = p32Var2;
                                                        if (p32Var3.f8078k.f5361w) {
                                                        }
                                                    }
                                                    if (!p32Var2.f8078k.f5361w) {
                                                        tu0Var = null;
                                                        closeable8 = closeable7;
                                                        pVar2 = pVar;
                                                        closeable9 = closeable8;
                                                        p32Var3 = p32Var2;
                                                        if (p32Var3.f8078k.f5361w) {
                                                        }
                                                    }
                                                    l32Var.f6048a = p32Var2;
                                                    l32Var.f6049b = th3Var3;
                                                    l32Var.f6050c = closeable7;
                                                    l32Var.f6051d = pVar;
                                                    l32Var.f6056i = z11;
                                                    l32Var.f6059l = 6;
                                                    objA = p32Var2.a(pVar, l32Var);
                                                    closeable11 = closeable7;
                                                    if (objA == coroutineSingletons) {
                                                    }
                                                    tu0Var = (b.a1) objA;
                                                    closeable8 = closeable11;
                                                    pVar2 = pVar;
                                                    closeable9 = closeable8;
                                                    p32Var3 = p32Var2;
                                                    if (p32Var3.f8078k.f5361w) {
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        Duration.f72038b.getClass();
                                        closeable5 = closeable3;
                                        if (!Duration.d(j11, 0L)) {
                                        }
                                    }
                                }
                                return coroutineSingletons;
                            } catch (Throwable th4) {
                                th = th4;
                                th3Var3 = A;
                                try {
                                    th3Var3.b(th);
                                    if (th instanceof b.a4) {
                                    }
                                } catch (Throwable th5) {
                                    try {
                                        throw th5;
                                    } catch (Throwable th6) {
                                        CloseableKt.a(A, th5);
                                        throw th6;
                                    }
                                }
                            }
                            break;
                        case 1:
                            j11 = l32Var.f6055h;
                            Closeable closeable12 = l32Var.f6050c;
                            th3Var3 = (th3) l32Var.f6049b;
                            p32Var5 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            closeable2 = closeable12;
                            closeable3 = closeable2;
                            if (((Boolean) objA).booleanValue()) {
                            }
                            return coroutineSingletons;
                        case 2:
                            j11 = l32Var.f6055h;
                            Closeable closeable13 = l32Var.f6050c;
                            th3Var3 = (th3) l32Var.f6049b;
                            p32Var5 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            closeable4 = closeable13;
                            closeable3 = closeable4;
                            if (((Boolean) objA).booleanValue()) {
                            }
                            Duration.f72038b.getClass();
                            closeable5 = closeable3;
                            if (!Duration.d(j11, 0L)) {
                            }
                            return coroutineSingletons;
                        case 3:
                            Closeable closeable14 = l32Var.f6050c;
                            th3Var3 = (th3) l32Var.f6049b;
                            p32Var5 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            closeable6 = closeable14;
                            j11 = ((Duration) objA).f72041a;
                            closeable5 = closeable6;
                            Duration.f72038b.getClass();
                            if (Duration.c(j11, 0L) <= 0) {
                            }
                            return coroutineSingletons;
                        case 4:
                            closeable = l32Var.f6050c;
                            th3Var2 = (th3) l32Var.f6049b;
                            p32Var5 = (p32) l32Var.f6048a;
                            try {
                                ResultKt.b(objA);
                                uu0 uu0Var2 = new uu0("Too many recently failed requests for ad unit ID: " + p32Var5.f8071d.l() + ". You must wait a few seconds before making another ad request.", true);
                                zi3.a(uu0Var2, false);
                                CloseableKt.a(closeable, null);
                                return uu0Var2;
                            } catch (Throwable th7) {
                                th = th7;
                                A = closeable;
                                th3Var3 = th3Var2;
                                th3Var3.b(th);
                                if (th instanceof b.a4) {
                                }
                            }
                            break;
                        case 5:
                            Closeable closeable15 = l32Var.f6050c;
                            th3Var3 = (th3) l32Var.f6049b;
                            p32Var5 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            closeable7 = closeable15;
                            p32Var2 = p32Var5;
                            a1Var = (b.a1) objA;
                            if (!(a1Var instanceof pu0)) {
                            }
                            break;
                        case 6:
                            z11 = l32Var.f6056i;
                            pVar = l32Var.f6051d;
                            Closeable closeable16 = l32Var.f6050c;
                            th3Var3 = (th3) l32Var.f6049b;
                            p32Var2 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            closeable11 = closeable16;
                            tu0Var = (b.a1) objA;
                            closeable8 = closeable11;
                            pVar2 = pVar;
                            closeable9 = closeable8;
                            p32Var3 = p32Var2;
                            if (p32Var3.f8078k.f5361w) {
                            }
                            break;
                        case 7:
                            z11 = l32Var.f6056i;
                            h2Var = l32Var.f6054g;
                            th3Var4 = l32Var.f6053f;
                            th3Var5 = l32Var.f6052e;
                            pVar2 = l32Var.f6051d;
                            closeable9 = l32Var.f6050c;
                            th3Var3 = (th3) l32Var.f6049b;
                            p32Var3 = (p32) l32Var.f6048a;
                            try {
                                ResultKt.b(objA);
                                h2Var.getClass();
                                tu0Var = b.h2.a((b.a1) objA);
                                if (tu0Var instanceof pu0) {
                                }
                                th2 = null;
                                CloseableKt.a(th3Var4, null);
                                closeable10 = closeable9;
                                if (tu0Var instanceof pu0) {
                                }
                            } catch (Throwable th8) {
                                th = th8;
                                th3Var5.b(th);
                                if (!(th instanceof b.a4)) {
                                    throw th;
                                }
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    th3Var5.a(th);
                                }
                                if (th instanceof TimeoutCancellationException) {
                                    throw new lw0(th);
                                }
                                if (th instanceof CancellationException) {
                                    throw new du0(th);
                                }
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            break;
                        case 8:
                            p32 p32Var6 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            p32Var4 = p32Var6;
                            a1Var2 = (b.a1) objA;
                            if (!(a1Var2 instanceof pu0)) {
                            }
                            break;
                        case 9:
                            z23Var = (z23) l32Var.f6049b;
                            p32Var4 = (p32) l32Var.f6048a;
                            ResultKt.b(objA);
                            ji3.a().g().f7225b.f3352b = z23Var.f12428b.f4554h;
                            boolean z122 = !z23Var.f12427a.isEmpty();
                            p32Var4.f8083r = z122;
                            m0.t(p32Var4.f8081p, null, null, new o32(z23Var, p32Var4, z122, null), 3);
                            p32Var4.f8082q = true;
                            d33Var = new d33(new v23(p32Var4.f8071d), z23Var, false, null);
                            f9Var = p32Var4.f8073f;
                            l32Var.f6048a = d33Var;
                            l32Var.f6049b = null;
                            l32Var.f6059l = 10;
                            if (f9Var.a(d33Var, l32Var) != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        case 10:
                            d33Var2 = (d33) l32Var.f6048a;
                            ResultKt.b(objA);
                            return new xu0(d33Var2);
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                } catch (Throwable th9) {
                    th = th9;
                    A = closeable9;
                    th3Var3.b(th);
                    if (th instanceof b.a4) {
                        throw th;
                    }
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var3.a(th);
                    }
                    if (th instanceof TimeoutCancellationException) {
                        throw new lw0(th);
                    }
                    if (th instanceof CancellationException) {
                        throw new du0(th);
                    }
                    if (th instanceof dv0) {
                        throw th;
                    }
                    throw new iu0(th);
                }
            } catch (Throwable th10) {
                th = th10;
            }
        } catch (Throwable th11) {
            th = th11;
            closeable = A;
            th3Var2 = th3Var;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x008a A[Catch: all -> 0x00ac, TryCatch #4 {all -> 0x00ac, blocks: (B:50:0x018a, B:52:0x018e, B:30:0x0084, B:32:0x008a, B:35:0x00af), top: B:93:0x0084 }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00af A[Catch: all -> 0x00ac, TRY_LEAVE, TryCatch #4 {all -> 0x00ac, blocks: (B:50:0x018a, B:52:0x018e, B:30:0x0084, B:32:0x008a, B:35:0x00af), top: B:93:0x0084 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0106 A[Catch: all -> 0x003e, TryCatch #5 {all -> 0x003e, blocks: (B:14:0x0039, B:39:0x00f7, B:41:0x0106, B:43:0x011e, B:45:0x0133, B:46:0x0168, B:48:0x016c), top: B:95:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0168 A[Catch: all -> 0x003e, TryCatch #5 {all -> 0x003e, blocks: (B:14:0x0039, B:39:0x00f7, B:41:0x0106, B:43:0x011e, B:45:0x0133, B:46:0x0168, B:48:0x016c), top: B:95:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ti.p pVar, ContinuationImpl continuationImpl) {
        h32 h32Var;
        th3 th3VarA;
        th3 th3Var;
        ti.p pVar2;
        p32 p32Var;
        th3 th3Var2;
        b.a1 a1Var;
        ti.p pVar3;
        th3 th3Var3;
        Object obj;
        if (continuationImpl instanceof h32) {
            h32Var = (h32) continuationImpl;
            int i5 = h32Var.f4206g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h32Var.f4206g = i5 - Integer.MIN_VALUE;
            } else {
                h32Var = new h32(this, continuationImpl);
            }
        }
        h32 h32Var2 = h32Var;
        Object objE = h32Var2.f4204e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h32Var2.f4206g;
        if (i11 != 0) {
            if (i11 == 1) {
                th3 th3Var4 = h32Var2.f4203d;
                th3 th3Var5 = h32Var2.f4202c;
                pVar2 = (ti.p) h32Var2.f4201b;
                p32Var = (p32) h32Var2.f4200a;
                try {
                    ResultKt.b(objE);
                    th3Var = th3Var4;
                    th3Var2 = th3Var5;
                    try {
                        a1Var = (b.a1) objE;
                        if (a1Var instanceof pu0) {
                            Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                            qv2 qv2Var = p32Var.f8075h;
                            jr0 jr0Var = p32Var.f8078k;
                            x0 x0Var = (x0) jr0Var.f18817a;
                            x0 x0Var2 = (x0) jr0Var.f18817a;
                            uh2 uh2Var = (uh2) ((pn) x0Var).f8337m.get();
                            pb2 pb2Var = (pb2) ((pn) x0Var2).f8336l.get();
                            Map map = (Map) ((pn) x0Var2).n.get();
                            h32Var2.f4200a = pVar2;
                            h32Var2.f4201b = th3Var2;
                            h32Var2.f4202c = th3Var;
                            h32Var2.f4203d = null;
                            h32Var2.f4206g = 2;
                            pVar3 = pVar2;
                            objE = qv2Var.a(pVar3, uh2Var, pb2Var, map, h32Var2);
                            if (objE != coroutineSingletons) {
                                th3Var3 = th3Var;
                                th3VarA = th3Var2;
                                obj = (b.a1) objE;
                                mu0.a(new a3.e(obj, 4));
                                if (!(obj instanceof xu0)) {
                                }
                                th3Var = th3Var3;
                                th3Var2 = th3VarA;
                            }
                            return coroutineSingletons;
                        }
                        obj = (pu0) a1Var;
                        pVar2.clientRequestBuildingData = new ti.g(247, null, null, null, "CSRB error: " + obj, null, null);
                    } catch (Throwable th2) {
                        th = th2;
                        th3VarA = th3Var2;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var3 = th3Var4;
                    th3VarA = th3Var5;
                }
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                th3Var3 = h32Var2.f4202c;
                th3VarA = (th3) h32Var2.f4201b;
                pVar3 = (ti.p) h32Var2.f4200a;
                try {
                    ResultKt.b(objE);
                    obj = (b.a1) objE;
                    mu0.a(new a3.e(obj, 4));
                    if (!(obj instanceof xu0)) {
                        String str = ((fq) ((xu0) obj).a()).f3461e;
                        List list = ((fq) ((xu0) obj).a()).f3457a;
                        pVar3.clientRequestBuildingData = new ti.g(65, Boolean.valueOf(((fq) ((xu0) obj).a()).f3460d), str, ((fq) ((xu0) obj).a()).f3459c, list != null ? b70.g.f1(list, ",", null, null, 0, null, 62) : null, pVar3.requestId, ((fq) ((xu0) obj).a()).f3462f);
                    } else if (obj instanceof pu0) {
                        pVar3.clientRequestBuildingData = new ti.g(247, null, null, null, "CSRB error: " + obj, null, null);
                    }
                    th3Var = th3Var3;
                    th3Var2 = th3VarA;
                } catch (Throwable th4) {
                    th = th4;
                }
            }
            th3Var = th3Var3;
            try {
                th3VarA.b(th);
                if (th instanceof b.a4) {
                    throw th;
                }
                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                    th3VarA.a(th);
                }
                if (th instanceof TimeoutCancellationException) {
                    throw new lw0(th);
                }
                if (th instanceof CancellationException) {
                    throw new du0(th);
                }
                if (th instanceof dv0) {
                    throw th;
                }
                throw new iu0(th);
            } finally {
            }
        } else {
            ResultKt.b(objE);
            th3VarA = ji3.a(wv0.CUI_NAME_ADREQUEST_BUILDURL, EmptyList.f71733a, true);
            try {
                zj1 zj1Var = this.f8068a;
                h32Var2.f4200a = this;
                pVar2 = pVar;
                h32Var2.f4201b = pVar2;
                h32Var2.f4202c = th3VarA;
                h32Var2.f4203d = th3VarA;
                h32Var2.f4206g = 1;
                objE = zj1Var.e(h32Var2);
                if (objE != coroutineSingletons) {
                    p32Var = this;
                    th3Var = th3VarA;
                    th3Var2 = th3Var;
                    a1Var = (b.a1) objE;
                    if (a1Var instanceof pu0) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th5) {
                th = th5;
                th3Var = th3VarA;
            }
        }
        if (obj instanceof pu0) {
            zi3.a((pu0) obj, false);
        }
        CloseableKt.a(th3Var, null);
        return obj;
    }

    @Override // b.r0
    public final Object a(pu0 pu0Var, ni.g0 g0Var, Continuation continuation) {
        return a(this, pu0Var, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a5, code lost:
    
        if (ads_mobile_sdk.iw2.d(r12, r2, r10, r0) == r1) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00cc, code lost:
    
        if (ads_mobile_sdk.iw2.d(r12, r2, r10, r0) == r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(p32 p32Var, pu0 pu0Var, ContinuationImpl continuationImpl) {
        j32 j32Var;
        boolean z11;
        boolean z12;
        Object objA;
        if (continuationImpl instanceof j32) {
            j32Var = (j32) continuationImpl;
            int i5 = j32Var.f5114g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j32Var.f5114g = i5 - Integer.MIN_VALUE;
            } else {
                j32Var = new j32(p32Var, continuationImpl);
            }
        }
        Object obj = j32Var.f5112e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j32Var.f5114g;
        if (i11 == 0) {
            ResultKt.b(obj);
            z11 = p32Var.f8083r;
            z12 = p32Var.f8082q;
            iw2 iw2Var = p32Var.f8077j;
            String strL = p32Var.f8071d.l();
            qw2 qw2Var = p32Var.f8072e;
            j32Var.f5108a = p32Var;
            j32Var.f5109b = pu0Var;
            j32Var.f5110c = z11;
            j32Var.f5111d = z12;
            j32Var.f5114g = 1;
            iw2Var.getClass();
            objA = iw2.a(iw2Var, strL, qw2Var, j32Var);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        boolean z13 = j32Var.f5111d;
        boolean z14 = j32Var.f5110c;
        pu0 pu0Var2 = j32Var.f5109b;
        p32 p32Var2 = j32Var.f5108a;
        ResultKt.b(obj);
        z12 = z13;
        p32Var = p32Var2;
        objA = obj;
        z11 = z14;
        pu0Var = pu0Var2;
        im0 im0Var = (im0) objA;
        if (im0Var == im0.f4866c) {
            return Unit.f71706a;
        }
        p32Var.getClass();
        if ((pu0Var instanceof uu0) && ((uu0) pu0Var).f10487d) {
            return Unit.f71706a;
        }
        if (!z12) {
            iw2 iw2Var2 = p32Var.f8077j;
            String strL2 = p32Var.f8071d.l();
            qw2 qw2Var2 = p32Var.f8072e;
            j32Var.f5108a = null;
            j32Var.f5109b = null;
            j32Var.f5114g = 2;
            iw2Var2.getClass();
        } else {
            if (!z11 || (im0Var != im0.f4868e && im0Var != im0.f4869f)) {
                return Unit.f71706a;
            }
            iw2 iw2Var3 = p32Var.f8077j;
            String strL3 = p32Var.f8071d.l();
            qw2 qw2Var3 = p32Var.f8072e;
            j32Var.f5108a = null;
            j32Var.f5109b = null;
            j32Var.f5114g = 3;
            iw2Var3.getClass();
        }
        return coroutineSingletons;
    }

    @Override // b.r0
    public final Object a(d33 d33Var, z1 z1Var, ni.g0 g0Var, Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x006f, code lost:
    
        if (ads_mobile_sdk.iw2.c(r7, r2, r6, r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(p32 p32Var, ContinuationImpl continuationImpl) {
        k32 k32Var;
        if (continuationImpl instanceof k32) {
            k32Var = (k32) continuationImpl;
            int i5 = k32Var.f5477d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k32Var.f5477d = i5 - Integer.MIN_VALUE;
            } else {
                k32Var = new k32(p32Var, continuationImpl);
            }
        }
        Object objA = k32Var.f5475b;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = k32Var.f5477d;
        if (i11 == 0) {
            ResultKt.b(objA);
            iw2 iw2Var = p32Var.f8077j;
            String strL = p32Var.f8071d.l();
            qw2 qw2Var = p32Var.f8072e;
            k32Var.f5474a = p32Var;
            k32Var.f5477d = 1;
            iw2Var.getClass();
            objA = iw2.a(iw2Var, strL, qw2Var, k32Var);
            if (objA != obj) {
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        p32Var = k32Var.f5474a;
        ResultKt.b(objA);
        if (((im0) objA) != im0.f4868e) {
            return Unit.f71706a;
        }
        iw2 iw2Var2 = p32Var.f8077j;
        String strL2 = p32Var.f8071d.l();
        qw2 qw2Var2 = p32Var.f8072e;
        k32Var.f5474a = null;
        k32Var.f5477d = 2;
        iw2Var2.getClass();
    }

    @Override // b.q8
    public final Object a(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }
}
