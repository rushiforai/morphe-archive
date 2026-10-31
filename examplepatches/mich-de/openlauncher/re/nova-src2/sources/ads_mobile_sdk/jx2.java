package ads_mobile_sdk;

import android.net.Uri;
import android.os.SystemClock;
import b.c0;
import b.e6;
import b.k9;
import b.o2;
import b0.b0;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
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
import kotlinx.coroutines.TimeoutCancellationException;
import m8.i;
import t70.m0;

/* loaded from: classes.dex */
public final class jx2 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f5439a;

    /* renamed from: b, reason: collision with root package name */
    public final n42 f5440b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f5441c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f5442d;

    /* renamed from: e, reason: collision with root package name */
    public final e6 f5443e;

    /* renamed from: f, reason: collision with root package name */
    public final dn3 f5444f;

    /* renamed from: g, reason: collision with root package name */
    public final hs f5445g;

    /* renamed from: h, reason: collision with root package name */
    public final kz2 f5446h;

    /* renamed from: i, reason: collision with root package name */
    public final ci3 f5447i;

    public jx2(jr0 flags, n42 offlineDatabase, o2 clock, t70.j0 backgroundScope, e6 httpClient, dn3 urlPinger, hs chromeVariationsProvider, kz2 rootTraceCreator, ci3 traceLogger) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(offlineDatabase, "offlineDatabase");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(urlPinger, "urlPinger");
        Intrinsics.g(chromeVariationsProvider, "chromeVariationsProvider");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f5439a = flags;
        this.f5440b = offlineDatabase;
        this.f5441c = clock;
        this.f5442d = backgroundScope;
        this.f5443e = httpClient;
        this.f5444f = urlPinger;
        this.f5445g = chromeVariationsProvider;
        this.f5446h = rootTraceCreator;
        this.f5447i = traceLogger;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(y2 y2Var, String str, ContinuationImpl continuationImpl) {
        dx2 dx2Var;
        jx2 jx2Var;
        if (continuationImpl instanceof dx2) {
            dx2Var = (dx2) continuationImpl;
            int i5 = dx2Var.f2678e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dx2Var.f2678e = i5 - Integer.MIN_VALUE;
            } else {
                dx2Var = new dx2(this, continuationImpl);
            }
        }
        Object obj = dx2Var.f2676c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dx2Var.f2678e;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = dx2Var.f2675b;
            jx2Var = dx2Var.f2674a;
            try {
                ResultKt.b(obj);
                return Unit.f71706a;
            } catch (JsonSyntaxException e3) {
                e = e3;
                zi3.a(new tu0(c0.k("Failed to parse ad event value from JSON: ", str)), false);
                jx2Var.f5447i.a("Failed to parse ad event value from JSON: " + str, (Throwable) e);
                return Unit.f71706a;
            } catch (Exception e11) {
                e = e11;
                zi3.a(new tu0(c0.k("Failed while emitting ad paid event for ", str)), false);
                jx2Var.f5447i.a("Failed while emitting ad paid event for " + str, (Throwable) e);
                return Unit.f71706a;
            }
        }
        ResultKt.b(obj);
        if (str == null || str.length() == 0) {
            zi3.a(new tu0("AdEventValueString is null or empty"), false);
            return Unit.f71706a;
        }
        try {
            o9 o9VarK = k9.K(p7.u.T(str).j());
            ni.m mVar = new ni.m(o9VarK.f7805c, o9VarK.f7804b, o9VarK.f7806d);
            dx2Var.f2674a = this;
            dx2Var.f2675b = str;
            dx2Var.f2678e = 1;
            if (y2Var.a(mVar, dx2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            return Unit.f71706a;
        } catch (JsonSyntaxException e12) {
            e = e12;
            jx2Var = this;
            zi3.a(new tu0(c0.k("Failed to parse ad event value from JSON: ", str)), false);
            jx2Var.f5447i.a("Failed to parse ad event value from JSON: " + str, (Throwable) e);
            return Unit.f71706a;
        } catch (Exception e13) {
            e = e13;
            jx2Var = this;
            zi3.a(new tu0(c0.k("Failed while emitting ad paid event for ", str)), false);
            jx2Var.f5447i.a("Failed while emitting ad paid event for " + str, (Throwable) e);
            return Unit.f71706a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x015a A[Catch: Exception -> 0x0140, IOException -> 0x018e, TRY_ENTER, TryCatch #10 {IOException -> 0x018e, blocks: (B:48:0x00f1, B:68:0x015a, B:70:0x015e), top: B:132:0x00f1 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /* JADX WARN: Type inference failed for: r1v20, types: [boolean] */
    /* JADX WARN: Type inference failed for: r1v21, types: [boolean] */
    /* JADX WARN: Type inference failed for: r7v0, types: [java.lang.Object, kotlin.coroutines.intrinsics.CoroutineSingletons] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Uri uri, v22 v22Var, int i5, long j11, String str, Map map, y2 y2Var, z1 z1Var, Boolean bool, ContinuationImpl continuationImpl) {
        ex2 ex2Var;
        String str2;
        Uri uri2;
        v22 v22Var2;
        long j12;
        String str3;
        y2 y2Var2;
        z1 z1Var2;
        String str4;
        jx2 jx2Var;
        Boolean bool2;
        int i11;
        z1 z1Var3;
        String str5;
        y2 y2Var3;
        long j13;
        Boolean bool3;
        e6 e6Var;
        URL url;
        jx2 jx2Var2;
        String str6;
        String str7;
        Object obj;
        String str8;
        y2 y2Var4;
        z1 z1Var4;
        Map map2;
        Boolean bool4;
        Object obj2;
        Map map3 = map;
        if (continuationImpl instanceof ex2) {
            ex2Var = (ex2) continuationImpl;
            int i12 = ex2Var.n;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                ex2Var.n = i12 - Integer.MIN_VALUE;
            } else {
                ex2Var = new ex2(this, continuationImpl);
            }
        }
        Object objB = ex2Var.f3099l;
        ?? r72 = CoroutineSingletons.f71806a;
        int i13 = ex2Var.n;
        if (i13 == 0) {
            ResultKt.b(objB);
            try {
                try {
                    String strA = a(i5, uri);
                    try {
                        e6Var = this.f5443e;
                        url = new URL(strA);
                        ex2Var.f3089a = this;
                        ex2Var.f3090b = uri;
                        v22Var2 = v22Var;
                    } catch (IOException e3) {
                        e = e3;
                        v22Var2 = v22Var;
                    }
                } catch (IOException e11) {
                    e = e11;
                    v22Var2 = v22Var;
                    j12 = j11;
                    str3 = str;
                    y2Var2 = y2Var;
                    z1Var2 = z1Var;
                    str4 = ": ";
                    jx2Var = this;
                    bool2 = bool;
                }
            } catch (Exception e12) {
                e = e12;
                str2 = ": ";
                uri2 = uri;
                cz.b bVar = mu0.f7335a;
                mu0.b("Error while pinging URL: " + uri2 + str2 + e.getMessage(), null);
                return Unit.f71706a;
            }
            try {
                ex2Var.f3091c = v22Var2;
                str3 = str;
            } catch (IOException e13) {
                e = e13;
                j12 = j11;
                str3 = str;
                y2Var2 = y2Var;
                z1Var2 = z1Var;
                bool3 = bool;
                jx2Var = this;
                bool2 = bool3;
                str4 = ": ";
                uri2 = uri;
                String str9 = str3;
                i11 = i5;
                z1Var3 = z1Var2;
                long j14 = j12;
                str5 = str9;
                y2Var3 = y2Var2;
                j13 = j14;
                cz.b bVar2 = mu0.f7335a;
                mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                return Unit.f71706a;
            }
            try {
                ex2Var.f3092d = str3;
                ex2Var.f3093e = map3;
                y2Var2 = y2Var;
                try {
                    ex2Var.f3094f = y2Var2;
                    z1Var2 = z1Var;
                } catch (IOException e14) {
                    e = e14;
                    j12 = j11;
                    z1Var2 = z1Var;
                    bool3 = bool;
                    jx2Var = this;
                    bool2 = bool3;
                    str4 = ": ";
                    uri2 = uri;
                    String str92 = str3;
                    i11 = i5;
                    z1Var3 = z1Var2;
                    long j142 = j12;
                    str5 = str92;
                    y2Var3 = y2Var2;
                    j13 = j142;
                    cz.b bVar22 = mu0.f7335a;
                    mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                    jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                    return Unit.f71706a;
                }
                try {
                    ex2Var.f3095g = z1Var2;
                    bool3 = bool;
                    try {
                        ex2Var.f3096h = bool3;
                        ex2Var.f3097j = i5;
                        j12 = j11;
                        try {
                            ex2Var.f3098k = j12;
                            ex2Var.n = 1;
                            objB = e6.b(e6Var, url, map3, ex2Var, 26);
                            if (objB == r72) {
                                return r72;
                            }
                            jx2Var2 = this;
                            bool2 = bool3;
                            uri2 = uri;
                            i11 = i5;
                            z1Var3 = z1Var2;
                            str6 = str3;
                            y2Var3 = y2Var2;
                            j13 = j12;
                            obj = (b.a1) objB;
                            str2 = ": ";
                            if (obj instanceof xu0) {
                            }
                        } catch (IOException e15) {
                            e = e15;
                            jx2Var = this;
                            bool2 = bool3;
                            str4 = ": ";
                            uri2 = uri;
                            String str922 = str3;
                            i11 = i5;
                            z1Var3 = z1Var2;
                            long j1422 = j12;
                            str5 = str922;
                            y2Var3 = y2Var2;
                            j13 = j1422;
                            cz.b bVar222 = mu0.f7335a;
                            mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                            jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                            return Unit.f71706a;
                        }
                    } catch (IOException e16) {
                        e = e16;
                        j12 = j11;
                    }
                } catch (IOException e17) {
                    e = e17;
                    j12 = j11;
                    bool3 = bool;
                    jx2Var = this;
                    bool2 = bool3;
                    str4 = ": ";
                    uri2 = uri;
                    String str9222 = str3;
                    i11 = i5;
                    z1Var3 = z1Var2;
                    long j14222 = j12;
                    str5 = str9222;
                    y2Var3 = y2Var2;
                    j13 = j14222;
                    cz.b bVar2222 = mu0.f7335a;
                    mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                    jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                    return Unit.f71706a;
                }
            } catch (IOException e18) {
                e = e18;
                j12 = j11;
                y2Var2 = y2Var;
                z1Var2 = z1Var;
                bool3 = bool;
                jx2Var = this;
                bool2 = bool3;
                str4 = ": ";
                uri2 = uri;
                String str92222 = str3;
                i11 = i5;
                z1Var3 = z1Var2;
                long j142222 = j12;
                str5 = str92222;
                y2Var3 = y2Var2;
                j13 = j142222;
                cz.b bVar22222 = mu0.f7335a;
                mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                return Unit.f71706a;
            }
        } else if (i13 == 1) {
            long j15 = ex2Var.f3098k;
            int i14 = ex2Var.f3097j;
            bool2 = ex2Var.f3096h;
            z1 z1Var5 = ex2Var.f3095g;
            y2 y2Var5 = ex2Var.f3094f;
            Map map4 = ex2Var.f3093e;
            String str10 = ex2Var.f3092d;
            v22 v22Var3 = ex2Var.f3091c;
            Uri uri3 = ex2Var.f3090b;
            jx2 jx2Var3 = ex2Var.f3089a;
            try {
                ResultKt.b(objB);
                i11 = i14;
                map3 = map4;
                z1Var3 = z1Var5;
                str6 = str10;
                uri2 = uri3;
                jx2Var2 = jx2Var3;
                y2Var3 = y2Var5;
                v22Var2 = v22Var3;
                j13 = j15;
                try {
                    obj = (b.a1) objB;
                    str2 = ": ";
                    try {
                        try {
                            if (obj instanceof xu0) {
                                try {
                                    if (obj instanceof ru0) {
                                        if (((ru0) obj).f9315c == 502) {
                                            str8 = str6;
                                            y2Var4 = y2Var3;
                                            z1Var4 = z1Var3;
                                            map2 = map3;
                                            bool4 = bool2;
                                            jx2Var2.a(uri2, v22Var2, i11, j13, str8, map2, y2Var4, z1Var4, bool4);
                                            str6 = str6;
                                        } else {
                                            str8 = str6;
                                            y2Var4 = y2Var3;
                                            z1Var4 = z1Var3;
                                            map2 = map3;
                                            bool4 = bool2;
                                            ?? r12 = obj instanceof wu0;
                                            str6 = r12;
                                            if (r12 == 0) {
                                                ?? r13 = obj instanceof vu0;
                                                if (r13 != 0) {
                                                    cz.b bVar3 = mu0.f7335a;
                                                    mu0.b("Suppressed retry for non-retryable error on URL: " + uri2, null);
                                                    str6 = r13;
                                                } else {
                                                    str6 = r13;
                                                    if (!(obj instanceof ru0)) {
                                                        jx2Var2.a(uri2, v22Var2, i11, j13, str8, map2, y2Var4, z1Var4, bool4);
                                                        str6 = r13;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                } catch (IOException e19) {
                                    e = e19;
                                    jx2Var = jx2Var2;
                                    str7 = str8;
                                    map3 = map2;
                                    y2Var3 = y2Var4;
                                    z1Var3 = z1Var4;
                                    bool2 = bool4;
                                    str4 = str2;
                                    str5 = str7;
                                    cz.b bVar222222 = mu0.f7335a;
                                    mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                                    jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                                    return Unit.f71706a;
                                }
                            } else if (y2Var3 != null) {
                                try {
                                    Boolean bool5 = Boolean.TRUE;
                                    if (Intrinsics.b(bool2, bool5)) {
                                        jr0 jr0Var = jx2Var2.f5439a;
                                        jr0Var.getClass();
                                        obj2 = obj;
                                        if (((Boolean) jr0Var.a("gads:ad_events_for_scar:enabled", bool5, jn.a$10)).booleanValue() && z1Var3.A0) {
                                            ex2Var.f3089a = jx2Var2;
                                            ex2Var.f3090b = uri2;
                                            ex2Var.f3091c = v22Var2;
                                            ex2Var.f3092d = str6;
                                            ex2Var.f3093e = map3;
                                            ex2Var.f3094f = y2Var3;
                                            ex2Var.f3095g = z1Var3;
                                            ex2Var.f3096h = bool2;
                                            ex2Var.f3097j = i11;
                                            ex2Var.f3098k = j13;
                                            ex2Var.n = 2;
                                            str6 = r72;
                                            if (jx2Var2.a(uri2, (xu0) obj2, y2Var3, ex2Var) == str6) {
                                                return str6;
                                            }
                                        }
                                    } else {
                                        obj2 = obj;
                                    }
                                    ((a21) ((xu0) obj2).a()).getClass();
                                } catch (IOException e21) {
                                    e = e21;
                                    jx2Var = jx2Var2;
                                    str7 = str6;
                                    str4 = str2;
                                    str5 = str7;
                                    cz.b bVar2222222 = mu0.f7335a;
                                    mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                                    jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                                    return Unit.f71706a;
                                }
                            }
                        } catch (IOException e22) {
                            e = e22;
                        }
                    } catch (Exception e23) {
                        e = e23;
                        cz.b bVar4 = mu0.f7335a;
                        mu0.b("Error while pinging URL: " + uri2 + str2 + e.getMessage(), null);
                        return Unit.f71706a;
                    }
                } catch (IOException e24) {
                    e = e24;
                    str2 = ": ";
                } catch (Exception e25) {
                    e = e25;
                    str2 = ": ";
                }
            } catch (IOException e26) {
                e = e26;
                i11 = i14;
                map3 = map4;
                jx2Var = jx2Var3;
                str4 = ": ";
                z1Var3 = z1Var5;
                y2Var3 = y2Var5;
                str5 = str10;
                v22Var2 = v22Var3;
                j13 = j15;
                uri2 = uri3;
                cz.b bVar22222222 = mu0.f7335a;
                mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                return Unit.f71706a;
            } catch (Exception e27) {
                e = e27;
                str2 = ": ";
                uri2 = uri3;
                cz.b bVar42 = mu0.f7335a;
                mu0.b("Error while pinging URL: " + uri2 + str2 + e.getMessage(), null);
                return Unit.f71706a;
            }
        } else {
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j16 = ex2Var.f3098k;
            int i15 = ex2Var.f3097j;
            Boolean bool6 = ex2Var.f3096h;
            z1 z1Var6 = ex2Var.f3095g;
            y2 y2Var6 = ex2Var.f3094f;
            Map map5 = ex2Var.f3093e;
            String str11 = ex2Var.f3092d;
            v22Var2 = ex2Var.f3091c;
            Uri uri4 = ex2Var.f3090b;
            jx2Var = ex2Var.f3089a;
            try {
                ResultKt.b(objB);
            } catch (IOException e28) {
                e = e28;
                j13 = j16;
                z1Var3 = z1Var6;
                y2Var3 = y2Var6;
                str5 = str11;
                uri2 = uri4;
                i11 = i15;
                bool2 = bool6;
                str4 = ": ";
                map3 = map5;
                cz.b bVar222222222 = mu0.f7335a;
                mu0.b("IOException while pinging URL: " + uri2 + str4 + e.getMessage(), null);
                jx2Var.a(uri2, v22Var2, i11, j13, str5, map3, y2Var3, z1Var3, bool2);
                return Unit.f71706a;
            } catch (Exception e29) {
                e = e29;
                str2 = ": ";
                uri2 = uri4;
                cz.b bVar422 = mu0.f7335a;
                mu0.b("Error while pinging URL: " + uri2 + str2 + e.getMessage(), null);
                return Unit.f71706a;
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:107:0x01a2 A[Catch: all -> 0x01ae, TryCatch #11 {all -> 0x01ae, blocks: (B:105:0x019b, B:107:0x01a2, B:109:0x01a6, B:111:0x01aa, B:114:0x01b0, B:116:0x01b4, B:118:0x01b8, B:120:0x01bc, B:121:0x01bd, B:122:0x01c2, B:123:0x01c3, B:124:0x01ca, B:125:0x01cb, B:126:0x01d2, B:127:0x01d3), top: B:151:0x019b }] */
    /* JADX WARN: Removed duplicated region for block: B:127:0x01d3 A[Catch: all -> 0x01ae, TRY_LEAVE, TryCatch #11 {all -> 0x01ae, blocks: (B:105:0x019b, B:107:0x01a2, B:109:0x01a6, B:111:0x01aa, B:114:0x01b0, B:116:0x01b4, B:118:0x01b8, B:120:0x01bc, B:121:0x01bd, B:122:0x01c2, B:123:0x01c3, B:124:0x01ca, B:125:0x01cb, B:126:0x01d2, B:127:0x01d3), top: B:151:0x019b }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00e9 A[Catch: all -> 0x00f5, TryCatch #4 {all -> 0x00f5, blocks: (B:51:0x00e2, B:53:0x00e9, B:55:0x00ed, B:57:0x00f1, B:60:0x00f7, B:62:0x00fb, B:64:0x00ff, B:66:0x0103, B:67:0x0104, B:68:0x0109, B:69:0x010a, B:70:0x0111, B:71:0x0112, B:72:0x0119, B:73:0x011a), top: B:139:0x00e2 }] */
    /* JADX WARN: Removed duplicated region for block: B:73:0x011a A[Catch: all -> 0x00f5, TRY_LEAVE, TryCatch #4 {all -> 0x00f5, blocks: (B:51:0x00e2, B:53:0x00e9, B:55:0x00ed, B:57:0x00f1, B:60:0x00f7, B:62:0x00fb, B:64:0x00ff, B:66:0x0103, B:67:0x0104, B:68:0x0109, B:69:0x010a, B:70:0x0111, B:71:0x0112, B:72:0x0119, B:73:0x011a), top: B:139:0x00e2 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.jx2] */
    /* JADX WARN: Type inference failed for: r13v14 */
    /* JADX WARN: Type inference failed for: r13v17 */
    /* JADX WARN: Type inference failed for: r13v39, types: [ads_mobile_sdk.th3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Uri uri, xu0 xu0Var, y2 y2Var, ContinuationImpl continuationImpl) {
        fx2 fx2Var;
        th3 th3VarA;
        TimeoutCancellationException th2;
        th3 th3Var;
        em2 em2VarA;
        TimeoutCancellationException th3;
        th3 th3Var2;
        if (continuationImpl instanceof fx2) {
            fx2Var = (fx2) continuationImpl;
            int i5 = fx2Var.f3545f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fx2Var.f3545f = i5 - Integer.MIN_VALUE;
            } else {
                fx2Var = new fx2(this, continuationImpl);
            }
        }
        Object obj = fx2Var.f3543d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fx2Var.f3545f;
        if (i11 == 0) {
            ResultKt.b(obj);
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3VarI = k9.i();
            th3 th3VarC = ji3.c();
            wv0 wv0Var = wv0.CUI_NAME_PING_AND_EMIT_PAID_EVENT;
            if (th3VarC == null) {
                em2VarA = kz2.a(this.f5446h, wv0Var, emptyList, mi3VarI);
                try {
                    if (!a(uri)) {
                        zi3.a(new tu0("Untrusted domain for ad event value: " + uri), false);
                        ((a21) xu0Var.a()).getClass();
                        th3Var2 = em2VarA;
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(th3Var2, null);
                        return Unit.f71706a;
                    }
                    String str = (String) ((a21) xu0Var.a()).c().get("X-Afma-Ad-Event-Value");
                    if (str == null) {
                        str = (String) ((a21) xu0Var.a()).c().get("X-Ad-Event-Value");
                    }
                    try {
                        fx2Var.f3540a = xu0Var;
                        fx2Var.f3541b = em2VarA;
                        fx2Var.f3542c = em2VarA;
                        fx2Var.f3545f = 1;
                        if (a(y2Var, str, fx2Var) != coroutineSingletons) {
                            th3Var2 = em2VarA;
                            ((a21) xu0Var.a()).getClass();
                            Unit unit2 = Unit.f71706a;
                            CloseableKt.a(th3Var2, null);
                            return Unit.f71706a;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        th3 = th;
                        th3Var2 = em2VarA;
                        em2VarA.b(th3);
                        if (!(th3 instanceof b.a4)) {
                        }
                    }
                } catch (Throwable th5) {
                    th = th5;
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    if (!a(uri)) {
                        zi3.a(new tu0("Untrusted domain for ad event value: " + uri), false);
                        ((a21) xu0Var.a()).getClass();
                        th3Var = th3VarA;
                        Unit unit3 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                        return Unit.f71706a;
                    }
                    String str2 = (String) ((a21) xu0Var.a()).c().get("X-Afma-Ad-Event-Value");
                    if (str2 == null) {
                        str2 = (String) ((a21) xu0Var.a()).c().get("X-Ad-Event-Value");
                    }
                    try {
                        fx2Var.f3540a = xu0Var;
                        fx2Var.f3541b = th3VarA;
                        fx2Var.f3542c = th3VarA;
                        fx2Var.f3545f = 2;
                        if (a(y2Var, str2, fx2Var) != coroutineSingletons) {
                            th3Var = th3VarA;
                            ((a21) xu0Var.a()).getClass();
                            Unit unit32 = Unit.f71706a;
                            CloseableKt.a(th3Var, null);
                            return Unit.f71706a;
                        }
                    } catch (Throwable th6) {
                        th = th6;
                        th2 = th;
                        th3Var = th3VarA;
                        th3VarA.b(th2);
                        if (!(th2 instanceof b.a4)) {
                        }
                    }
                } catch (Throwable th7) {
                    th = th7;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            th3Var2 = fx2Var.f3542c;
            ?? r13 = fx2Var.f3541b;
            xu0 xu0Var2 = fx2Var.f3540a;
            try {
                ResultKt.b(obj);
                em2VarA = r13;
                xu0Var = xu0Var2;
                try {
                    ((a21) xu0Var.a()).getClass();
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(th3Var2, null);
                    return Unit.f71706a;
                } catch (Throwable th8) {
                    th3 = th8;
                    r13 = em2VarA;
                    em2VarA = r13;
                    try {
                        em2VarA.b(th3);
                        if (!(th3 instanceof b.a4)) {
                            if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                                em2VarA.a(th3);
                            }
                            if (!(th3 instanceof TimeoutCancellationException)) {
                                if (!(th3 instanceof CancellationException)) {
                                    if (th3 instanceof dv0) {
                                        throw th3;
                                    }
                                    throw new iu0(th3);
                                }
                                throw new du0(th3);
                            }
                            throw new lw0(th3);
                        }
                        throw th3;
                    } finally {
                    }
                }
            } catch (Throwable th9) {
                th3 = th9;
                em2VarA = r13;
                em2VarA.b(th3);
                if (!(th3 instanceof b.a4)) {
                }
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = fx2Var.f3542c;
            th3 th3Var3 = fx2Var.f3541b;
            xu0 xu0Var3 = fx2Var.f3540a;
            try {
                ResultKt.b(obj);
                th3VarA = th3Var3;
                xu0Var = xu0Var3;
                try {
                    ((a21) xu0Var.a()).getClass();
                    Unit unit322 = Unit.f71706a;
                    CloseableKt.a(th3Var, null);
                    return Unit.f71706a;
                } catch (Throwable th10) {
                    th2 = th10;
                    th3Var3 = th3VarA;
                    th3VarA = th3Var3;
                    try {
                        th3VarA.b(th2);
                        if (!(th2 instanceof b.a4)) {
                            if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                th3VarA.a(th2);
                            }
                            if (!(th2 instanceof TimeoutCancellationException)) {
                                if (!(th2 instanceof CancellationException)) {
                                    if (th2 instanceof dv0) {
                                        throw th2;
                                    }
                                    throw new iu0(th2);
                                }
                                throw new du0(th2);
                            }
                            throw new lw0(th2);
                        }
                        throw th2;
                    } finally {
                        try {
                            throw th;
                        } finally {
                        }
                    }
                }
            } catch (Throwable th11) {
                th2 = th11;
                th3VarA = th3Var3;
                th3VarA.b(th2);
                if (!(th2 instanceof b.a4)) {
                }
            }
        }
    }

    public final String a(int i5, Uri uri) {
        if (((Boolean) this.f5439a.a("gads:include_ping_attempts:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
            String encodedQuery = uri.getEncodedQuery();
            return uri.buildUpon().clearQuery().appendQueryParameter("pa", String.valueOf(i5)).build() + "&" + encodedQuery;
        }
        String string = uri.toString();
        Intrinsics.d(string);
        return string;
    }

    public final boolean a(Uri uri) {
        Boolean bool = Boolean.FALSE;
        jn jnVar = jn.a$10;
        jr0 jr0Var = this.f5439a;
        if (!((Boolean) jr0Var.a("gads:ad_event_value:validate_domain:enabled", bool, jnVar)).booleanValue()) {
            return true;
        }
        String host = uri.getHost();
        if (host != null) {
            List defaultValue = ul.b.Q("doubleclick.net", "google.com", "googleadservices.com");
            Intrinsics.g(defaultValue, "defaultValue");
            List list = (List) jr0Var.a("gads:ad_event_value:trusted_domains", defaultValue, jn.a$20);
            if (!(list instanceof Collection) || !list.isEmpty()) {
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    String strA1 = r70.k.a1((String) it.next(), ".");
                    if (host.equals(strA1) || r70.j.A0(host, ".".concat(strA1), false)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final void a(Uri uri, z1 adConfiguration, hv commonConfiguration, y2 y2Var, Boolean bool) {
        Intrinsics.g(uri, "uri");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        jr0 jr0Var = this.f5439a;
        jr0Var.getClass();
        Boolean bool2 = Boolean.TRUE;
        jn jnVar = jn.a$10;
        boolean zBooleanValue = ((Boolean) jr0Var.a("gads:use_retry_strategy:enabled", bool2, jnVar)).booleanValue();
        t70.j0 j0Var = this.f5442d;
        Continuation continuation = null;
        if (zBooleanValue && adConfiguration.f12410w0 != null) {
            m0.t(j0Var, null, null, new t5.e(this, uri, adConfiguration, commonConfiguration, y2Var, bool, null, 2), 3);
            return;
        }
        if (y2Var != null && Intrinsics.b(bool, bool2) && ((Boolean) jr0Var.a("gads:ad_events_for_scar:enabled", bool2, jnVar)).booleanValue() && adConfiguration.A0) {
            m0.t(j0Var, null, null, new b0(this, uri, y2Var, continuation, 3), 3);
            return;
        }
        Map mapA = this.f5445g.a(uri);
        dn3 dn3Var = this.f5444f;
        dn3Var.getClass();
        dn3Var.f2573e.j(new Pair(uri, mapA));
    }

    public static void a(jx2 jx2Var, List uris, z1 adConfiguration, hv commonConfiguration, y2 y2Var, Boolean bool, int i5) {
        if ((i5 & 8) != 0) {
            y2Var = null;
        }
        y2 y2Var2 = y2Var;
        if ((i5 & 16) != 0) {
            bool = Boolean.FALSE;
        }
        Boolean bool2 = bool;
        jx2Var.getClass();
        Intrinsics.g(uris, "uris");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Iterator it = uris.iterator();
        while (it.hasNext()) {
            jx2Var.a((Uri) it.next(), adConfiguration, commonConfiguration, y2Var2, bool2);
        }
    }

    public final void a(List uris) {
        Intrinsics.g(uris, "uris");
        ArrayList arrayList = new ArrayList(b70.c.u0(uris, 10));
        Iterator it = uris.iterator();
        while (it.hasNext()) {
            Uri uri = (Uri) it.next();
            arrayList.add(new Pair(uri, this.f5445g.a(uri)));
        }
        dn3 dn3Var = this.f5444f;
        dn3Var.getClass();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Pair pair = (Pair) it2.next();
            dn3Var.f2573e.j(new Pair((Uri) pair.f71683a, (Map) pair.f71684b));
        }
    }

    public final void a(Uri uri, v22 v22Var, int i5, long j11, String str, Map map, y2 y2Var, z1 z1Var, Boolean bool) {
        Continuation continuation = null;
        if (i5 >= v22Var.f10555a) {
            if (v22Var.f10557c) {
                this.f5441c.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                String strA = a(i5 + 1, uri);
                f42 f42Var = f42.f3155a;
                g42 g42Var = new g42(jElapsedRealtime, str, strA);
                n42 n42Var = this.f5440b;
                n42Var.getClass();
                m0.t(n42Var.f7424a, null, null, new i(n42Var, new androidx.room.q(n42Var, g42Var, continuation, 8), (Continuation) null), 3);
                return;
            }
            return;
        }
        m0.t(this.f5442d, null, null, new ix2(i5, j11, uri, z1Var, y2Var, v22Var, this, bool, str, map, null), 3);
    }
}
