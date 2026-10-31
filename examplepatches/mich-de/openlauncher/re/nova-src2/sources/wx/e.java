package wx;

import a80.m;
import android.content.Context;
import android.content.pm.PackageManager;
import b.c0;
import b70.g;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.ai.tools.AiTool;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.ai.tools.ToolType;
import com.instabridge.ai.tools.bii.BIIDispatcher;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends AiTool {

    /* renamed from: a, reason: collision with root package name */
    public static final e f94882a = new e();

    /* renamed from: b, reason: collision with root package name */
    public static final String f94883b = "read_list";

    /* renamed from: c, reason: collision with root package name */
    public static final String f94884c = "Open the user's list app filtered by name. Use when the user asks 'what's on my shopping list', 'show my todos', 'what's pending'. This launches the list app so the user can see their items there — it does NOT return list contents to you. Tell the user you're opening their list app and they can check it there. Parameter `list` optionally names the target list; empty opens the default view.";

    /* renamed from: d, reason: collision with root package name */
    public static final Object f94885d = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("list", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional list name filter (e.g., 'shopping', 'work')")))));

    /* renamed from: e, reason: collision with root package name */
    public static final ToolType f94886e = ToolType.ACTION;

    /* renamed from: f, reason: collision with root package name */
    public static final String f94887f = "productivity";

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // com.instabridge.ai.tools.AiTool
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object execute(Context context, Map map, boolean z11, Continuation continuation) throws PackageManager.NameNotFoundException {
        d dVar;
        String str;
        Context context2;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f94881x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f94881x = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuation);
            }
        }
        d dVar2 = dVar;
        Object objDispatch$default = dVar2.f94879v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar2.f94881x;
        if (i11 == 0) {
            ResultKt.b(objDispatch$default);
            Object obj = map.get("list");
            str = obj instanceof String ? (String) obj : null;
            BIIDispatcher bIIDispatcher = BIIDispatcher.INSTANCE;
            Map mapN = m.n("itemList.name", str == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str);
            dVar2.f94877t = context;
            dVar2.f94878u = str;
            dVar2.f94881x = 1;
            objDispatch$default = BIIDispatcher.dispatch$default(bIIDispatcher, context, "actions.intent.GET_ITEM_LIST", mapN, false, null, dVar2, 24, null);
            if (objDispatch$default == coroutineSingletons) {
                return coroutineSingletons;
            }
            context2 = context;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            String str2 = dVar2.f94878u;
            Context context3 = dVar2.f94877t;
            ResultKt.b(objDispatch$default);
            str = str2;
            context2 = context3;
        }
        ToolResult toolResult = (ToolResult) objDispatch$default;
        if (!(toolResult instanceof ToolResult.Error) || !Intrinsics.b(((ToolResult.Error) toolResult).getCode(), "no_handler")) {
            return toolResult;
        }
        ArrayList arrayListA = vx.b.a(context2);
        if (arrayListA.isEmpty()) {
            return new ToolResult.Error("No list app installed", "no_list_app");
        }
        String strD = vx.b.d(arrayListA);
        if (strD == null) {
            strD = ((vx.a) g.W0(arrayListA)).f93266a;
        }
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("ListDispatcher");
        bVar.h(c0.m("openListAppFallback: launching ", strD, " for list=", str == null ? CarrierConfigurator.APN_TYPE : str), new Object[0]);
        return vx.b.c(context2, strD, null, str);
    }

    @Override // com.instabridge.ai.tools.AiTool
    public final String getCategory() {
        return f94887f;
    }

    @Override // com.instabridge.ai.tools.AiTool
    public final String getDescription() {
        return f94884c;
    }

    @Override // com.instabridge.ai.tools.AiTool
    public final String getName() {
        return f94883b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    @Override // com.instabridge.ai.tools.AiTool
    public final Map getParameters() {
        return f94885d;
    }

    @Override // com.instabridge.ai.tools.AiTool
    public final ToolType getToolType() {
        return f94886e;
    }

    @Override // com.instabridge.ai.tools.AiTool
    public final boolean isAvailableOnDevice(Context context) {
        return !vx.b.a(context).isEmpty();
    }
}
