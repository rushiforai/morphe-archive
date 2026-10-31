package vx;

import android.content.Context;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.Build;
import b.c0;
import b.u4;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.internal.measurement.ge;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.protocol.PendingToolCall;
import com.instabridge.ai.tools.AiTool;
import com.instabridge.ai.tools.AiToolsManager;
import com.instabridge.ai.tools.IntentToolDiscovery;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import com.instabridge.ai.tools.ShortcutTool;
import com.instabridge.ai.tools.ToolDefinition;
import com.instabridge.ai.tools.ToolRegistrationResult;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import n4.n0;
import ou.i1;
import t70.g2;
import t70.i2;
import t70.k0;
import t70.m0;
import t70.y0;
import tx.g4;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: e, reason: collision with root package name */
    public static volatile ArrayList f93374e;

    /* renamed from: f, reason: collision with root package name */
    public static volatile ArrayList f93375f;

    /* renamed from: g, reason: collision with root package name */
    public static volatile boolean f93376g;

    /* renamed from: j, reason: collision with root package name */
    public static volatile ge f93379j;

    /* renamed from: k, reason: collision with root package name */
    public static volatile g2 f93380k;

    /* renamed from: l, reason: collision with root package name */
    public static volatile g2 f93381l;
    public static final y70.d n;
    public static final y70.d o;

    /* renamed from: p, reason: collision with root package name */
    public static final Set f93383p;

    /* renamed from: q, reason: collision with root package name */
    public static final Set f93384q;

    /* renamed from: r, reason: collision with root package name */
    public static volatile boolean f93385r;

    /* renamed from: s, reason: collision with root package name */
    public static final AtomicInteger f93386s;

    /* renamed from: a, reason: collision with root package name */
    public static final t f93370a = new t();

    /* renamed from: b, reason: collision with root package name */
    public static final Set f93371b = kotlin.collections.c.f1(new String[]{"wifi", "wi_fi", "wlan", "hotspot", "hotspots", "bluetooth", "nfc"});

    /* renamed from: c, reason: collision with root package name */
    public static final Set f93372c = kotlin.collections.c.f1(new String[]{"location", "display", "sound", "volume", CarrierConfigurator.APN_APN, PlaceTypes.STORAGE, "battery", "notifications", "accessibility", "privacy", "settings", "network"});

    /* renamed from: d, reason: collision with root package name */
    public static final Set f93373d = kotlin.collections.c.f1(new String[]{"music", "song", "playlist", "reel", "reels"});

    /* renamed from: h, reason: collision with root package name */
    public static final c80.d f93377h = new c80.d();

    /* renamed from: i, reason: collision with root package name */
    public static final Object f93378i = MapsKt.j0(new Pair("read_call_log", "android.permission.READ_CALL_LOG"), new Pair("read_sms", "android.permission.READ_SMS"), new Pair("read_calendar_events", "android.permission.READ_CALENDAR"), new Pair("create_calendar_event", "android.permission.READ_CALENDAR"), new Pair("view_calendar_event", "android.permission.READ_CALENDAR"), new Pair("search_contacts", "android.permission.READ_CONTACTS"), new Pair("read_notifications", "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE"));

    /* renamed from: m, reason: collision with root package name */
    public static final Object f93382m = new Object();

    static {
        i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        n = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
        o = k0.a(CoroutineContext.Element.DefaultImpls.d(m0.d(), y70.o.f96819a));
        f93383p = kotlin.collections.c.f1(new String[]{"search_device", "media_now_playing", "search_shortcut", "get_weather", "read_calendar_events", "search_contacts", "read_notifications", "read_sms", "read_call_log", "spotify_search", "spotify_recently_played", "github_search", "cloud_file_search", "discord_channels", "deezer_search", "twitch_search"});
        f93384q = kotlin.collections.c.f1(new String[]{"send_message", "send_sms", "compose_email", "make_call", "create_message", "create_call"});
        f93386s = new AtomicInteger(0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:76:0x03d5  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x03d8  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v4, types: [com.instabridge.ai.protocol.PendingToolCall, kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r14v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(Context context, PendingToolCall pendingToolCall, ContinuationImpl continuationImpl) throws Throwable {
        q qVar;
        Object obj;
        Object obj2;
        Object obj3;
        String str;
        int i5;
        int i11;
        PendingToolCall pendingToolCall2;
        ?? r14;
        Context context2;
        PendingToolCall pendingToolCall3;
        String str2;
        String str3;
        Object obj4;
        int i12;
        Object obj5;
        PendingToolCall pendingToolCall4;
        long jCurrentTimeMillis;
        int i13;
        Object objY;
        Context context3 = context;
        PendingToolCall pendingToolCall5 = pendingToolCall;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i14 = qVar.f93358x;
            if ((i14 & Integer.MIN_VALUE) != 0) {
                qVar.f93358x = i14 - Integer.MIN_VALUE;
            } else {
                qVar = new q(continuationImpl);
            }
        }
        Object objY2 = qVar.f93357w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = qVar.f93358x;
        try {
            try {
                try {
                    if (i15 == 0) {
                        ResultKt.b(objY2);
                        mc0.b bVar = mc0.d.f76206a;
                        bVar.r("NOVA_AI");
                        String toolName = pendingToolCall5.getToolName();
                        String strG1 = r70.l.G1(8, pendingToolCall5.getCallId());
                        boolean userInitiated = pendingToolCall5.getUserInitiated();
                        StringBuilder sbW = c0.w("Tool call: ", toolName, " callId=", strG1, " userInitiated=");
                        sbW.append(userInitiated);
                        bVar.h(sbW.toString(), new Object[0]);
                        bVar.r("NOVA_AI");
                        bVar.b("Tool args [" + pendingToolCall5.getToolName() + "]: " + pendingToolCall5.getArguments(), new Object[0]);
                        int i16 = 5;
                        if (!f93385r && !pendingToolCall5.getUserInitiated() && !f93383p.contains(pendingToolCall5.getToolName())) {
                            bVar.r("NOVA_AI");
                            String toolName2 = pendingToolCall5.getToolName();
                            String strG12 = r70.l.G1(8, pendingToolCall5.getCallId());
                            String strF1 = b70.g.f1(kotlin.collections.c.X0(8, Thread.currentThread().getStackTrace()), " <- ", null, null, 0, new g4(i16), 30);
                            StringBuilder sbW2 = c0.w("BLOCKED action tool '", toolName2, "' in background! callId=", strG12, " stack=");
                            sbW2.append(strF1);
                            bVar.d(sbW2.toString(), new Object[0]);
                            int i17 = jo.a.f69615a;
                            jo.a.c(8, r70.l.G1(8, pendingToolCall5.getCallId()), "tool_exec", c0.l("BLOCKED: ", pendingToolCall5.getToolName(), " not safe for background"), null, pendingToolCall5.getToolName());
                            fo.d.h().callback(pendingToolCall5.getCallId(), MapsKt.j0(new Pair("error", Boolean.TRUE), new Pair(PglCryptUtils.KEY_MESSAGE, c0.l("Tool '", pendingToolCall5.getToolName(), "' requires user interaction"))));
                            return Unit.f71706a;
                        }
                        if (f93384q.contains(pendingToolCall5.getToolName()) && !pendingToolCall5.getUserInitiated()) {
                            bVar.r("NOVA_AI");
                            bVar.d(c0.m("BLOCKED communication tool '", pendingToolCall5.getToolName(), "' — userInitiated=false! callId=", r70.l.G1(8, pendingToolCall5.getCallId())), new Object[0]);
                            int i18 = jo.a.f69615a;
                            jo.a.c(8, r70.l.G1(8, pendingToolCall5.getCallId()), "tool_exec", c0.l("BLOCKED: ", pendingToolCall5.getToolName(), " requires userInitiated=true"), null, pendingToolCall5.getToolName());
                            fo.d.h().callback(pendingToolCall5.getCallId(), MapsKt.j0(new Pair("error", Boolean.TRUE), new Pair(PglCryptUtils.KEY_MESSAGE, "This action requires explicit user request")));
                            return Unit.f71706a;
                        }
                        try {
                            a80.e eVar = y0.f88884a;
                            a80.d dVar = a80.d.f488c;
                            r14 = 0;
                            u00.p pVar = new u00.p(context3, pendingToolCall5, 0 == true ? 1 : 0, i16);
                            qVar.f93354t = context3;
                            qVar.f93355u = pendingToolCall5;
                            qVar.f93358x = 1;
                            objY2 = m0.y(dVar, pVar, qVar);
                            if (objY2 != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Exception e3) {
                            e = e3;
                            obj = "Action could not be completed";
                            obj2 = PglCryptUtils.KEY_MESSAGE;
                            obj3 = "error";
                            str = "NOVA_AI";
                            i5 = 8;
                            i11 = 0;
                            pendingToolCall2 = pendingToolCall;
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r(str);
                            bVar2.f(e, c0.k("Tool resolution crashed for ", pendingToolCall2.getToolName()), new Object[i11]);
                            int i19 = jo.a.f69615a;
                            jo.a.c(8, r70.l.G1(i5, pendingToolCall2.getCallId()), "tool_exec", c0.k("Resolution crash: ", e.getMessage()), null, pendingToolCall2.getToolName());
                            fo.d.h().callback(pendingToolCall2.getCallId(), MapsKt.j0(new Pair(obj3, Boolean.TRUE), new Pair(obj2, obj)));
                            return Unit.f71706a;
                        }
                    }
                    if (i15 != 1) {
                        if (i15 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        long j11 = qVar.f93356v;
                        pendingToolCall4 = (PendingToolCall) qVar.f93354t;
                        try {
                            ResultKt.b(objY2);
                            jCurrentTimeMillis = j11;
                            objY = objY2;
                            str3 = "Action could not be completed";
                            obj4 = PglCryptUtils.KEY_MESSAGE;
                            obj5 = "error";
                            str2 = "NOVA_AI";
                            i12 = 8;
                        } catch (Exception e11) {
                            e = e11;
                            str3 = "Action could not be completed";
                            obj4 = PglCryptUtils.KEY_MESSAGE;
                            obj5 = "error";
                            str2 = "NOVA_AI";
                            i12 = 8;
                            mc0.b bVar3 = mc0.d.f76206a;
                            bVar3.r(str2);
                            bVar3.p(e, c0.k("Tool execution failed: ", pendingToolCall4.getToolName()), new Object[0]);
                            int i21 = jo.a.f69615a;
                            r70.l.G1(i12, pendingToolCall4.getCallId());
                            e.getMessage();
                            pendingToolCall4.getToolName();
                            jo.a.a();
                            AiToolsManager aiToolsManagerH = fo.d.h();
                            String callId = pendingToolCall4.getCallId();
                            Pair pair = new Pair(obj5, Boolean.TRUE);
                            String message = e.getMessage();
                            aiToolsManagerH.callback(callId, MapsKt.j0(pair, new Pair(obj4, message != null ? str3 : message)));
                            return Unit.f71706a;
                        }
                        try {
                            ToolResult toolResult = (ToolResult) objY;
                            long jCurrentTimeMillis2 = System.currentTimeMillis() - jCurrentTimeMillis;
                            boolean z11 = toolResult instanceof ToolResult.Success;
                            String strG13 = r70.l.G1(200, toolResult.toMap().toString());
                            mc0.b bVar4 = mc0.d.f76206a;
                            bVar4.r(str2);
                            bVar4.b("Tool result [" + pendingToolCall4.getToolName() + "]: success=" + z11 + " latency=" + jCurrentTimeMillis2 + "ms summary=" + strG13, new Object[0]);
                            int i22 = jo.a.f69615a;
                            jo.a.g(r70.l.G1(i12, pendingToolCall4.getCallId()), pendingToolCall4.getToolName(), pendingToolCall4.getArguments(), z11, strG13, jCurrentTimeMillis2);
                            fo.d.h().callback(pendingToolCall4.getCallId(), toolResult.toMap());
                        } catch (Exception e12) {
                            e = e12;
                            mc0.b bVar32 = mc0.d.f76206a;
                            bVar32.r(str2);
                            bVar32.p(e, c0.k("Tool execution failed: ", pendingToolCall4.getToolName()), new Object[0]);
                            int i212 = jo.a.f69615a;
                            r70.l.G1(i12, pendingToolCall4.getCallId());
                            e.getMessage();
                            pendingToolCall4.getToolName();
                            jo.a.a();
                            AiToolsManager aiToolsManagerH2 = fo.d.h();
                            String callId2 = pendingToolCall4.getCallId();
                            Pair pair2 = new Pair(obj5, Boolean.TRUE);
                            String message2 = e.getMessage();
                            aiToolsManagerH2.callback(callId2, MapsKt.j0(pair2, new Pair(obj4, message2 != null ? str3 : message2)));
                            return Unit.f71706a;
                        }
                        return Unit.f71706a;
                    }
                    pendingToolCall5 = qVar.f93355u;
                    context3 = (Context) qVar.f93354t;
                    try {
                        ResultKt.b(objY2);
                        r14 = 0;
                    } catch (Exception e13) {
                        e = e13;
                        pendingToolCall2 = pendingToolCall5;
                        str = "NOVA_AI";
                        obj = "Action could not be completed";
                        obj2 = PglCryptUtils.KEY_MESSAGE;
                        obj3 = "error";
                        i5 = 8;
                        i11 = 0;
                        mc0.b bVar22 = mc0.d.f76206a;
                        bVar22.r(str);
                        bVar22.f(e, c0.k("Tool resolution crashed for ", pendingToolCall2.getToolName()), new Object[i11]);
                        int i192 = jo.a.f69615a;
                        jo.a.c(8, r70.l.G1(i5, pendingToolCall2.getCallId()), "tool_exec", c0.k("Resolution crash: ", e.getMessage()), null, pendingToolCall2.getToolName());
                        fo.d.h().callback(pendingToolCall2.getCallId(), MapsKt.j0(new Pair(obj3, Boolean.TRUE), new Pair(obj2, obj)));
                        return Unit.f71706a;
                    }
                    AiTool aiTool = (AiTool) objY2;
                    if (aiTool == null) {
                        mc0.b bVar5 = mc0.d.f76206a;
                        bVar5.r("NOVA_AI");
                        bVar5.n(c0.k("Unknown tool: ", pendingToolCall5.getToolName()), new Object[0]);
                        int i23 = jo.a.f69615a;
                        jo.a.c(8, r70.l.G1(8, pendingToolCall5.getCallId()), "tool_exec", c0.k("Unknown tool: ", pendingToolCall5.getToolName()), null, pendingToolCall5.getToolName());
                        fo.d.h().callbackError(pendingToolCall5.getCallId(), "Unknown tool: " + pendingToolCall5.getToolName());
                        return Unit.f71706a;
                    }
                    if (!aiTool.canExecute(context2, pendingToolCall5.getArguments())) {
                        mc0.b bVar6 = mc0.d.f76206a;
                        bVar6.r("NOVA_AI");
                        bVar6.n(c0.l("Tool ", pendingToolCall5.getToolName(), " failed canExecute check — rejecting"), new Object[0]);
                        int i24 = jo.a.f69615a;
                        jo.a.c(8, r70.l.G1(8, pendingToolCall5.getCallId()), "tool_exec", c0.k("canExecute failed: ", pendingToolCall5.getToolName()), null, pendingToolCall5.getToolName());
                        fo.d.h().callback(pendingToolCall5.getCallId(), MapsKt.j0(new Pair("error", Boolean.TRUE), new Pair(PglCryptUtils.KEY_MESSAGE, "This action is not available right now")));
                        return Unit.f71706a;
                    }
                    try {
                        jCurrentTimeMillis = System.currentTimeMillis();
                        try {
                            a80.e eVar2 = y0.f88884a;
                            a80.d dVar2 = a80.d.f488c;
                            try {
                                i13 = 22;
                                pendingToolCall3 = pendingToolCall5;
                                str2 = "NOVA_AI";
                                obj4 = PglCryptUtils.KEY_MESSAGE;
                                str3 = "Action could not be completed";
                                i12 = 8;
                                obj5 = "error";
                            } catch (Exception e14) {
                                e = e14;
                                pendingToolCall3 = pendingToolCall5;
                                str2 = "NOVA_AI";
                                str3 = "Action could not be completed";
                                obj4 = PglCryptUtils.KEY_MESSAGE;
                                i12 = 8;
                                obj5 = "error";
                                pendingToolCall4 = pendingToolCall3;
                                mc0.b bVar322 = mc0.d.f76206a;
                                bVar322.r(str2);
                                bVar322.p(e, c0.k("Tool execution failed: ", pendingToolCall4.getToolName()), new Object[0]);
                                int i2122 = jo.a.f69615a;
                                r70.l.G1(i12, pendingToolCall4.getCallId());
                                e.getMessage();
                                pendingToolCall4.getToolName();
                                jo.a.a();
                                AiToolsManager aiToolsManagerH22 = fo.d.h();
                                String callId22 = pendingToolCall4.getCallId();
                                Pair pair22 = new Pair(obj5, Boolean.TRUE);
                                String message22 = e.getMessage();
                                aiToolsManagerH22.callback(callId22, MapsKt.j0(pair22, new Pair(obj4, message22 != null ? str3 : message22)));
                                return Unit.f71706a;
                            }
                            try {
                                pu.h hVar = new pu.h(aiTool, context2, pendingToolCall3, r14, i13);
                                qVar.f93354t = pendingToolCall3;
                                qVar.f93355u = r14;
                                qVar.f93356v = jCurrentTimeMillis;
                                qVar.f93358x = 2;
                                objY = m0.y(dVar2, hVar, qVar);
                            } catch (Exception e15) {
                                e = e15;
                                pendingToolCall4 = pendingToolCall3;
                                mc0.b bVar3222 = mc0.d.f76206a;
                                bVar3222.r(str2);
                                bVar3222.p(e, c0.k("Tool execution failed: ", pendingToolCall4.getToolName()), new Object[0]);
                                int i21222 = jo.a.f69615a;
                                r70.l.G1(i12, pendingToolCall4.getCallId());
                                e.getMessage();
                                pendingToolCall4.getToolName();
                                jo.a.a();
                                AiToolsManager aiToolsManagerH222 = fo.d.h();
                                String callId222 = pendingToolCall4.getCallId();
                                Pair pair222 = new Pair(obj5, Boolean.TRUE);
                                String message222 = e.getMessage();
                                aiToolsManagerH222.callback(callId222, MapsKt.j0(pair222, new Pair(obj4, message222 != null ? str3 : message222)));
                                return Unit.f71706a;
                            }
                        } catch (Exception e16) {
                            e = e16;
                            pendingToolCall3 = pendingToolCall5;
                            str2 = "NOVA_AI";
                            str3 = "Action could not be completed";
                            obj4 = PglCryptUtils.KEY_MESSAGE;
                        }
                    } catch (Exception e17) {
                        e = e17;
                        pendingToolCall3 = pendingToolCall5;
                        str2 = "NOVA_AI";
                        str3 = "Action could not be completed";
                        obj4 = PglCryptUtils.KEY_MESSAGE;
                    }
                    if (objY != coroutineSingletons) {
                        pendingToolCall4 = pendingToolCall3;
                        ToolResult toolResult2 = (ToolResult) objY;
                        long jCurrentTimeMillis22 = System.currentTimeMillis() - jCurrentTimeMillis;
                        boolean z112 = toolResult2 instanceof ToolResult.Success;
                        String strG132 = r70.l.G1(200, toolResult2.toMap().toString());
                        mc0.b bVar42 = mc0.d.f76206a;
                        bVar42.r(str2);
                        bVar42.b("Tool result [" + pendingToolCall4.getToolName() + "]: success=" + z112 + " latency=" + jCurrentTimeMillis22 + "ms summary=" + strG132, new Object[0]);
                        int i222 = jo.a.f69615a;
                        jo.a.g(r70.l.G1(i12, pendingToolCall4.getCallId()), pendingToolCall4.getToolName(), pendingToolCall4.getArguments(), z112, strG132, jCurrentTimeMillis22);
                        fo.d.h().callback(pendingToolCall4.getCallId(), toolResult2.toMap());
                        return Unit.f71706a;
                    }
                    return coroutineSingletons;
                } catch (Exception e18) {
                    e = e18;
                    pendingToolCall2 = pendingToolCall5;
                    str = "NOVA_AI";
                    obj = "Action could not be completed";
                    obj2 = PglCryptUtils.KEY_MESSAGE;
                    obj3 = "error";
                    i5 = 8;
                    i11 = 0;
                    mc0.b bVar222 = mc0.d.f76206a;
                    bVar222.r(str);
                    bVar222.f(e, c0.k("Tool resolution crashed for ", pendingToolCall2.getToolName()), new Object[i11]);
                    int i1922 = jo.a.f69615a;
                    jo.a.c(8, r70.l.G1(i5, pendingToolCall2.getCallId()), "tool_exec", c0.k("Resolution crash: ", e.getMessage()), null, pendingToolCall2.getToolName());
                    fo.d.h().callback(pendingToolCall2.getCallId(), MapsKt.j0(new Pair(obj3, Boolean.TRUE), new Pair(obj2, obj)));
                    return Unit.f71706a;
                }
                context2 = context3;
            } catch (CancellationException e19) {
                throw e19;
            }
        } catch (CancellationException e21) {
            throw e21;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:124:0x0442  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(Context context, String str, ContinuationImpl continuationImpl) {
        r rVar;
        boolean z11;
        boolean z12;
        ArrayList arrayList;
        List list;
        List<AiTool> list2;
        CoroutineSingletons coroutineSingletons;
        String string;
        SharedPreferences sharedPreferences;
        String str2;
        String string2;
        ArrayList arrayList2;
        long j11;
        boolean z13;
        List list3;
        Set set;
        Object objA;
        boolean z14;
        String str3 = str;
        t tVar = f93370a;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.E;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.E = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(continuationImpl);
            }
        }
        Object objRegister = rVar.D;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i11 = rVar.E;
        try {
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            z11 = false;
            bVar.p(e11, "Tool registration failed", new Object[0]);
        }
        if (i11 == 0) {
            ResultKt.b(objRegister);
            if (!fo.d.j()) {
                return Boolean.FALSE;
            }
            ArrayList arrayList3 = f93374e;
            if (arrayList3 != null) {
                z12 = false;
            } else {
                AiTool.Companion companion = AiTool.INSTANCE;
                List<AiTool> common = companion.getCommon();
                ArrayList arrayList4 = u.f93387a;
                ArrayList arrayListT1 = b70.g.t1(arrayList4, common);
                f93374e = arrayListT1;
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("NOVA_AI");
                int size = companion.getCommon().size();
                int size2 = arrayList4.size();
                int size3 = arrayListT1.size();
                StringBuilder sbT = c0.t(size, "Registered tool set: ", " common + ", size2, " Nova = ");
                sbT.append(size3);
                z12 = false;
                bVar2.b(sbT.toString(), new Object[0]);
                arrayList3 = arrayListT1;
            }
            List listDiscover$default = IntentToolDiscovery.discover$default(IntentToolDiscovery.INSTANCE, context, z12, 2, null);
            List<AiTool> listCurate = ShortcutTool.INSTANCE.curate(context);
            zy.c cVar = zy.c.f98823a;
            boolean zD = zy.c.d("ai_app_actions_tool_calling_v1", z12);
            Iterable iterableF = zD ? f("biiToolsForDevice", new n00.d(context, 12)) : EmptyList.f71733a;
            HashSet hashSet = new HashSet();
            Iterator it = iterableF.iterator();
            while (it.hasNext()) {
                hashSet.add(((AiTool) it.next()).getName());
            }
            ArrayList arrayList5 = arrayList3;
            Map mapJ0 = MapsKt.j0(new Pair("make_call", "create_call"), new Pair("send_sms", "create_message"));
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Map.Entry entry : mapJ0.entrySet()) {
                if (hashSet.contains((String) entry.getValue())) {
                    linkedHashMap.put(entry.getKey(), entry.getValue());
                }
            }
            Set setKeySet = linkedHashMap.keySet();
            if (setKeySet.isEmpty()) {
                arrayList = arrayList5;
            } else {
                ArrayList arrayList6 = new ArrayList();
                for (Object obj : arrayList5) {
                    if (!setKeySet.contains(((AiTool) obj).getName())) {
                        arrayList6.add(obj);
                    }
                }
                mc0.b bVar3 = mc0.d.f76206a;
                bVar3.r("NOVA_AI");
                bVar3.b("BII replacements active — removed legacy tools from registration: " + setKeySet, new Object[0]);
                arrayList = arrayList6;
            }
            HashSet hashSet2 = new HashSet();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                hashSet2.add(((AiTool) it2.next()).getName());
            }
            ArrayList arrayList7 = new ArrayList();
            Iterator it3 = iterableF.iterator();
            while (it3.hasNext()) {
                Object next = it3.next();
                Iterator it4 = it3;
                if (!hashSet2.contains(((AiTool) next).getName())) {
                    arrayList7.add(next);
                }
                it3 = it4;
            }
            if (zD) {
                List listF = f("perAppFeatureToolsForDevice", new n00.d(context, 13));
                ArrayList arrayList8 = new ArrayList();
                Iterator it5 = listF.iterator();
                while (it5.hasNext()) {
                    Object next2 = it5.next();
                    Iterator it6 = it5;
                    if (!hashSet2.contains(((AiTool) next2).getName())) {
                        arrayList8.add(next2);
                    }
                    it5 = it6;
                }
                list = arrayList8;
            } else {
                list = EmptyList.f71733a;
            }
            ArrayList arrayListT12 = b70.g.t1(ul.b.P(ShortcutTool.SearchShortcut.INSTANCE), b70.g.t1(listCurate, b70.g.t1(listDiscover$default, b70.g.t1(list, b70.g.t1(arrayList7, arrayList)))));
            ArrayList arrayListH = h(context, arrayListT12);
            list2 = listCurate;
            if (arrayListH.size() < arrayListT12.size()) {
                ArrayList arrayList9 = new ArrayList();
                Iterator it7 = arrayListT12.iterator();
                while (it7.hasNext()) {
                    Object next3 = it7.next();
                    Iterator it8 = it7;
                    if (!arrayListH.contains((AiTool) next3)) {
                        arrayList9.add(next3);
                    }
                    it7 = it8;
                }
                coroutineSingletons = coroutineSingletons2;
                ArrayList arrayList10 = new ArrayList(b70.c.u0(arrayList9, 10));
                Iterator it9 = arrayList9.iterator();
                while (it9.hasNext()) {
                    arrayList10.add(((AiTool) it9.next()).getName());
                }
                mc0.b bVar4 = mc0.d.f76206a;
                bVar4.r("NOVA_AI");
                bVar4.b("Filtered " + (arrayListT12.size() - arrayListH.size()) + " tools not available on this device: " + arrayList10, new Object[0]);
            } else {
                coroutineSingletons = coroutineSingletons2;
            }
            ArrayList arrayListI = i(tVar, arrayListH, context);
            if (arrayListI.size() < arrayListH.size()) {
                mc0.b bVar5 = mc0.d.f76206a;
                bVar5.r("NOVA_AI");
                bVar5.b(c0.i(arrayListH.size() - arrayListI.size(), "Filtered ", " tools by missing permissions"), new Object[0]);
            }
            int size4 = arrayListI.size();
            Iterator it10 = arrayListI.iterator();
            while (it10.hasNext()) {
                size4 = (size4 * 31) + ((AiTool) it10.next()).getName().hashCode();
            }
            kotlin.text.a.a(36);
            string = Integer.toString(size4, 36);
            Intrinsics.f(string, "toString(...)");
            sharedPreferences = context.getApplicationContext().getSharedPreferences("nova_ai_tools", 0);
            long j12 = sharedPreferences.getLong("last_registration_ms", 0L);
            String string3 = sharedPreferences.getString("last_registration_hash", null);
            long jCurrentTimeMillis = System.currentTimeMillis();
            Context context2 = g0.f77088a;
            str2 = "last_registration_hash";
            long j13 = g0.e().getApplicationContext().getSharedPreferences("nova_ai_brand_session", 0).getLong("instabridge_user_id", -1L);
            Long lValueOf = j13 < 0 ? null : Long.valueOf(j13);
            if (lValueOf == null || lValueOf.longValue() <= 0) {
                SharedPreferences sharedPreferences2 = context.getApplicationContext().getSharedPreferences("nova_ai_tools", 0);
                string2 = sharedPreferences2.getString(SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, null);
                if (string2 == null) {
                    string2 = "nova-" + UUID.randomUUID();
                    a2.c.v(sharedPreferences2, SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID, string2);
                }
            } else {
                string2 = "nova-user-" + lValueOf;
            }
            ArrayList arrayList11 = new ArrayList(b70.c.u0(arrayListI, 10));
            Iterator it11 = arrayListI.iterator();
            while (it11.hasNext()) {
                arrayList11.add(((AiTool) it11.next()).toDefinition());
            }
            ArrayList arrayList12 = new ArrayList(b70.c.u0(arrayList11, 10));
            Iterator it12 = arrayList11.iterator();
            while (it12.hasNext()) {
                ToolDefinition toolDefinitionCopy$default = (ToolDefinition) it12.next();
                if (Intrinsics.b(toolDefinitionCopy$default.getName(), "open_settings")) {
                    toolDefinitionCopy$default = ToolDefinition.copy$default(toolDefinitionCopy$default, null, "Open a specific Android settings panel. Use the exact `panel` value from this list:\nwifi = Wi-Fi/WLAN network settings, bluetooth = Bluetooth pairing, location = GPS/location services,\ndisplay = screen brightness/theme, sound/volume = ringtone/media volume, internet = mobile data + Wi-Fi combined,\nnfc = NFC/tap-to-pay, storage = device storage, battery = battery saver, date_time = date and time,\nlanguage = language/locale, accessibility = accessibility services, notifications = notification access,\napp_notifications = per-app notification settings (pass `package`), app_info = app details (pass `package`),\ndefault_apps = default app chooser, home = home app selector, privacy = privacy dashboard,\ndev_options = developer options, power_usage = battery usage breakdown, data_usage = data usage stats,\ngeneral = main settings screen.\nIMPORTANT: 'wifi' is for Wi-Fi/WLAN settings, 'location' is ONLY for GPS/location services — do not confuse them.", null, null, null, null, 61, null);
                }
                arrayList12.add(toolDefinitionCopy$default);
            }
            boolean zEquals = string.equals(string3);
            boolean z15 = jCurrentTimeMillis - j12 < 86400000;
            try {
                if (Intrinsics.b(fo.d.h().getCurrentSessionId(), string2)) {
                    boolean z16 = fo.d.h().isRegistered();
                    if (zEquals && z15 && !f93376g) {
                        try {
                            int i12 = Result.f71687b;
                            objA = Boolean.valueOf(fo.d.h().restoreCachedRegistration(string2, arrayList12));
                        } catch (Throwable th2) {
                            int i13 = Result.f71687b;
                            objA = ResultKt.a(th2);
                        }
                        Object obj2 = Boolean.FALSE;
                        if (objA instanceof Result.Failure) {
                            objA = obj2;
                        }
                        if (((Boolean) objA).booleanValue() || z16) {
                            mc0.b bVar6 = mc0.d.f76206a;
                            bVar6.r("NOVA_AI");
                            bVar6.b("Skipped tool registration: reason=" + str3 + " hashUnchanged=true withinTtl=true", new Object[0]);
                            return Boolean.TRUE;
                        }
                    }
                    AiToolsManager aiToolsManagerH = fo.d.h();
                    rVar.f93359t = str3;
                    rVar.f93360u = listDiscover$default;
                    rVar.f93361v = list2;
                    rVar.f93362w = setKeySet;
                    rVar.f93363x = arrayList;
                    arrayList2 = arrayList7;
                    rVar.f93364y = arrayList2;
                    rVar.f93365z = list;
                    rVar.A = string;
                    rVar.B = sharedPreferences;
                    j11 = jCurrentTimeMillis;
                    rVar.C = j11;
                    z13 = true;
                    rVar.E = 1;
                    objRegister = aiToolsManagerH.register(string2, "nova", arrayList12, rVar);
                    CoroutineSingletons coroutineSingletons3 = coroutineSingletons;
                    if (objRegister == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                    list3 = listDiscover$default;
                    set = setKeySet;
                }
                return Boolean.valueOf(z11);
            } catch (IllegalStateException unused) {
                return Boolean.FALSE;
            }
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        long j14 = rVar.C;
        sharedPreferences = rVar.B;
        string = rVar.A;
        list = (List) rVar.f93365z;
        ArrayList arrayList13 = rVar.f93364y;
        arrayList = rVar.f93363x;
        Set set2 = rVar.f93362w;
        List<AiTool> list4 = rVar.f93361v;
        list3 = rVar.f93360u;
        String str4 = rVar.f93359t;
        ResultKt.b(objRegister);
        arrayList2 = arrayList13;
        j11 = j14;
        set = set2;
        str3 = str4;
        str2 = "last_registration_hash";
        list2 = list4;
        z13 = true;
        ToolRegistrationResult toolRegistrationResult = (ToolRegistrationResult) objRegister;
        if (toolRegistrationResult != null) {
            f93376g = false;
            sharedPreferences.edit().putLong("last_registration_ms", j11).putString(str2, string).apply();
            mc0.b bVar7 = mc0.d.f76206a;
            bVar7.r("NOVA_AI");
            bVar7.h("✅ Registered " + toolRegistrationResult.getRegisteredCount() + " tools (reason=" + str3 + "): " + arrayList.size() + " core + " + arrayList2.size() + " bii + " + list.size() + " per-app-feature + " + list3.size() + " discovered + " + list2.size() + " shortcuts + 1 search_shortcut" + (set.isEmpty() ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : " (superseded: " + set + ")"), new Object[0]);
            if (!list2.isEmpty()) {
                bVar7.r("NOVA_AI");
                bVar7.b("Curated shortcuts: " + b70.g.f1(list2, null, null, null, 0, new g4(6), 31), new Object[0]);
            }
            z14 = z13;
        } else {
            mc0.b bVar8 = mc0.d.f76206a;
            bVar8.r("NOVA_AI");
            bVar8.n("Tool registration returned null", new Object[0]);
            z14 = false;
        }
        z11 = z14;
        return Boolean.valueOf(z11);
    }

    public static void c(Context context) {
        if (f93379j != null) {
            return;
        }
        ge geVar = new ge(3);
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter.addAction("android.intent.action.PACKAGE_REPLACED");
        intentFilter.addAction("android.intent.action.PACKAGE_CHANGED");
        intentFilter.addDataScheme("package");
        if (Build.VERSION.SDK_INT >= 33) {
            context.getApplicationContext().registerReceiver(geVar, intentFilter, 4);
        } else {
            context.getApplicationContext().registerReceiver(geVar, intentFilter);
        }
        f93379j = geVar;
    }

    public static boolean d(String str) {
        List listI1 = r70.k.i1(str, new String[]{"_"}, 6);
        if ((listI1 instanceof Collection) && listI1.isEmpty()) {
            return false;
        }
        Iterator it = listI1.iterator();
        while (it.hasNext()) {
            if (f93373d.contains((String) it.next())) {
                return true;
            }
        }
        return false;
    }

    public static boolean e(String str) {
        if (f93372c.contains(str)) {
            return true;
        }
        List listI1 = r70.k.i1(str, new String[]{"_"}, 6);
        if ((listI1 instanceof Collection) && listI1.isEmpty()) {
            return false;
        }
        Iterator it = listI1.iterator();
        while (it.hasNext()) {
            if (f93371b.contains((String) it.next())) {
                return true;
            }
        }
        return false;
    }

    public static List f(String str, Function0 function0) {
        try {
            return (List) function0.invoke();
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            int i5 = jo.a.f69615a;
            jo.a.c(16, null, "tool_discovery", u4.m(str, ": ", e11.getMessage()), "discovery_failed", null);
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.f(e11, str.concat(" failed — tools from this source unavailable"), new Object[0]);
            return EmptyList.f71733a;
        }
    }

    public static ArrayList h(Context context, ArrayList arrayList) {
        boolean zIsAvailableOnDevice;
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayList) {
            AiTool aiTool = (AiTool) obj;
            try {
                zIsAvailableOnDevice = aiTool.isAvailableOnDevice(context);
            } catch (Exception e3) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("NOVA_AI");
                bVar.p(e3, c0.l("isAvailableOnDevice threw for ", aiTool.getName(), " — excluding from registration"), new Object[0]);
                zIsAvailableOnDevice = false;
            }
            if (zIsAvailableOnDevice) {
                arrayList2.add(obj);
            }
        }
        return arrayList2;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, java.util.Map] */
    public static ArrayList i(t tVar, ArrayList arrayList, Context context) {
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayList) {
            String str = (String) f93378i.get(((AiTool) obj).getName());
            boolean zContains = true;
            if (str != null) {
                if (str.equals("android.permission.BIND_NOTIFICATION_LISTENER_SERVICE")) {
                    zContains = ((HashSet) n0.d(context)).contains(context.getPackageName());
                } else if (o4.a.a(context, str) != 0) {
                    zContains = false;
                }
            }
            if (zContains) {
                arrayList2.add(obj);
            }
        }
        return arrayList2;
    }

    public final void g(Context context, List list, Function0 function0) {
        m0.t(o, null, null, new i1(12, (Object) list, (Object) context, (Object) function0, (Continuation) null, false), 3);
    }

    public final List j(Context context) {
        ArrayList arrayList = f93375f;
        if (arrayList != null) {
            return arrayList;
        }
        List listDiscover$default = IntentToolDiscovery.discover$default(IntentToolDiscovery.INSTANCE, context, false, 2, null);
        List<ShortcutTool.DynamicShortcutTool> listDiscoverAll = ShortcutTool.INSTANCE.discoverAll(context);
        zy.c cVar = zy.c.f98823a;
        boolean zD = zy.c.d("ai_app_actions_tool_calling_v1", false);
        List listF = zD ? f("biiToolsForDevice", new n00.d(context, 14)) : EmptyList.f71733a;
        List listF2 = zD ? f("perAppFeatureToolsForDevice", new n00.d(context, 15)) : EmptyList.f71733a;
        AiTool.Companion companion = AiTool.INSTANCE;
        ArrayList arrayListT1 = b70.g.t1(ul.b.P(ShortcutTool.SearchShortcut.INSTANCE), b70.g.t1(listDiscoverAll, b70.g.t1(listDiscover$default, b70.g.t1(listF2, b70.g.t1(listF, companion.getExpanded())))));
        ArrayList arrayList2 = u.f93387a;
        ArrayList arrayListT12 = b70.g.t1(arrayList2, arrayListT1);
        ArrayList arrayListH = h(context, arrayListT12);
        ArrayList arrayListI = i(this, arrayListH, context);
        f93375f = arrayListI;
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("NOVA_AI");
        int size = companion.getExpanded().size();
        int size2 = listF.size();
        int size3 = listF2.size();
        int size4 = listDiscover$default.size();
        int size5 = listDiscoverAll.size();
        int size6 = arrayList2.size();
        int size7 = arrayListT12.size();
        int size8 = arrayListT12.size() - arrayListH.size();
        int size9 = arrayListH.size() - arrayListI.size();
        StringBuilder sbT = c0.t(size, "Execution tool set: ", " expanded + ", size2, " bii + ");
        c0.A(sbT, size3, " per-app-feature + ", size4, " discovered + ");
        c0.A(sbT, size5, " shortcuts + ", size6, " Nova = ");
        c0.A(sbT, size7, " (", size8, " unavailable, ");
        bVar.b(c0.o(sbT, size9, " filtered by permissions)"), new Object[0]);
        return arrayListI;
    }
}
