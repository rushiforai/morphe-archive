package com.instabridge.ai.tools;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.CallLog;
import android.provider.ContactsContract;
import android.provider.Telephony;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import h6.c1;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ShortcutType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001:\u0002\u0013\u0014B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001a\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0002J\u0010\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u0010H\u0002J\u0010\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0010H\u0002R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/tools/CommunicationTools;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "all", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/AiTool;", "getAll", "()Ljava/util/List;", "resolveContactName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "number", "formatTimestamp", "millis", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "formatDuration", "seconds", "ReadSms", "ReadCallLog", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CommunicationTools {

    @NotNull
    public static final CommunicationTools INSTANCE = new CommunicationTools();

    @NotNull
    private static final List<AiTool> all = ul.b.Q(ReadSms.INSTANCE, ReadCallLog.INSTANCE);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001c\u001a\u00020\u001dH\u0096@¢\u0006\u0002\u0010\u001eR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/tools/CommunicationTools$ReadCallLog;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class ReadCallLog extends AiTool {

        @NotNull
        public static final ReadCallLog INSTANCE = new ReadCallLog();

        @NotNull
        private static final String name = "read_call_log";

        @NotNull
        private static final String displayName = "Read Call Log";

        @NotNull
        private static final String description = "Read recent call history from the user's phone. Can optionally filter by a contact name or phone number. Use this when the user asks about recent calls, missed calls, or call history.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair(ShortcutType.CONTACT, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional: filter by contact name or phone number"))), new Pair("count", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Number of call entries to return (default 10, max 20)"))))));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "communication";
        public static final int $stable = 8;

        private ReadCallLog() {
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0023  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) throws IOException {
            CommunicationTools$ReadCallLog$execute$1 communicationTools$ReadCallLog$execute$1;
            Map<String, ? extends Object> map2;
            Object objRequirePermission;
            String string;
            String str;
            String string2;
            Context context2 = context;
            if (continuation instanceof CommunicationTools$ReadCallLog$execute$1) {
                communicationTools$ReadCallLog$execute$1 = (CommunicationTools$ReadCallLog$execute$1) continuation;
                int i5 = communicationTools$ReadCallLog$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    communicationTools$ReadCallLog$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    communicationTools$ReadCallLog$execute$1 = new CommunicationTools$ReadCallLog$execute$1(this, continuation);
                }
            }
            Object obj = communicationTools$ReadCallLog$execute$1.result;
            Object obj2 = CoroutineSingletons.f71806a;
            int i11 = communicationTools$ReadCallLog$execute$1.label;
            int i12 = 1;
            if (i11 == 0) {
                ResultKt.b(obj);
                communicationTools$ReadCallLog$execute$1.L$0 = context2;
                map2 = map;
                communicationTools$ReadCallLog$execute$1.L$1 = map2;
                communicationTools$ReadCallLog$execute$1.label = 1;
                objRequirePermission = requirePermission(context2, "android.permission.READ_CALL_LOG", z11, communicationTools$ReadCallLog$execute$1);
                if (objRequirePermission == obj2) {
                    return obj2;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Map<String, ? extends Object> map3 = (Map) communicationTools$ReadCallLog$execute$1.L$1;
                Context context3 = (Context) communicationTools$ReadCallLog$execute$1.L$0;
                ResultKt.b(obj);
                map2 = map3;
                context2 = context3;
                objRequirePermission = obj;
            }
            if (!((Boolean) objRequirePermission).booleanValue()) {
                return new ToolResult.Error("Call log permission not available. This feature requires READ_CALL_LOG permission.", "permission_denied");
            }
            Object obj3 = map2.get(ShortcutType.CONTACT);
            String[] strArr = null;
            if (obj3 == null || (string2 = obj3.toString()) == null || (string = k.u1(string2).toString()) == null || string.length() <= 0) {
                string = null;
            }
            Integer intArg = parseIntArg(map2, "count");
            int iE0 = kotlin.ranges.a.e0(intArg != null ? intArg.intValue() : 10, 1, 20);
            try {
                ArrayList arrayList = new ArrayList();
                String str2 = string != null ? "name LIKE ? OR number LIKE ?" : null;
                if (string != null) {
                    strArr = new String[]{"%" + string + '%', "%" + string + '%'};
                }
                Cursor cursorQuery = context2.getContentResolver().query(CallLog.Calls.CONTENT_URI, new String[]{PendingUpgradeStore.KEY_NAME, "number", TTConst.TRACK_TYPE, "duration", "date"}, str2, strArr, "date DESC");
                if (cursorQuery != null) {
                    while (cursorQuery.moveToNext() && arrayList.size() < iE0) {
                        try {
                            String string3 = cursorQuery.getString(0);
                            String string4 = cursorQuery.getString(i12);
                            if (string4 != null) {
                                int i13 = cursorQuery.getInt(2);
                                long j11 = cursorQuery.getLong(3);
                                long j12 = cursorQuery.getLong(4);
                                String str3 = i13 != 1 ? i13 != 2 ? i13 != 3 ? i13 != 5 ? InneractiveMediationNameConsts.OTHER : "rejected" : "missed" : "outgoing" : "incoming";
                                MapBuilder mapBuilder = new MapBuilder();
                                int i14 = iE0;
                                mapBuilder.put(PendingUpgradeStore.KEY_NAME, string3 == null ? string4 : string3);
                                mapBuilder.put("number", string4);
                                mapBuilder.put(TTConst.TRACK_TYPE, str3);
                                CommunicationTools communicationTools = CommunicationTools.INSTANCE;
                                mapBuilder.put("duration", communicationTools.formatDuration(j11));
                                mapBuilder.put("timestamp", communicationTools.formatTimestamp(j12));
                                arrayList.add(mapBuilder.b());
                                iE0 = i14;
                                i12 = 1;
                            }
                        } catch (Throwable th2) {
                            try {
                                throw th2;
                            } catch (Throwable th3) {
                                CloseableKt.a(cursorQuery, th2);
                                throw th3;
                            }
                        }
                    }
                    Unit unit = Unit.f71706a;
                    cursorQuery.close();
                }
                Map mapJ0 = MapsKt.j0(new Pair("calls", arrayList), new Pair("count", new Integer(arrayList.size())));
                if (arrayList.isEmpty()) {
                    str = "No call history found";
                } else {
                    str = arrayList.size() + " call(s) found";
                }
                return new ToolResult.Success(mapJ0, str);
            } catch (SecurityException unused) {
                return new ToolResult.Error("Call log permission denied", "permission_denied");
            } catch (Exception e3) {
                return new ToolResult.Error(c1.s(e3, new StringBuilder("Failed to read call log: ")), "execution_failed");
            }
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getCategory() {
            return category;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getDescription() {
            return description;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getDisplayName() {
            return displayName;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getName() {
            return name;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public Map<String, Object> getParameters() {
            return parameters;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public ToolType getToolType() {
            return toolType;
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001c\u001a\u00020\u001dH\u0096@¢\u0006\u0002\u0010\u001eR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/tools/CommunicationTools$ReadSms;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class ReadSms extends AiTool {

        @NotNull
        public static final ReadSms INSTANCE = new ReadSms();

        @NotNull
        private static final String name = "read_sms";

        @NotNull
        private static final String displayName = "Read SMS";

        @NotNull
        private static final String description = "Read recent SMS messages from the user's phone. Can optionally filter by a contact name or phone number. Use this when the user asks about their text messages or wants to see recent conversations.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair(ShortcutType.CONTACT, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional: filter by contact name or phone number"))), new Pair("count", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Number of messages to return (default 10, max 20)"))))));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "communication";
        public static final int $stable = 8;

        private ReadSms() {
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) throws IOException {
            CommunicationTools$ReadSms$execute$1 communicationTools$ReadSms$execute$1;
            Map<String, ? extends Object> map2;
            Object objRequirePermission;
            String string;
            Context context2;
            String str;
            String string2;
            Context context3 = context;
            if (continuation instanceof CommunicationTools$ReadSms$execute$1) {
                communicationTools$ReadSms$execute$1 = (CommunicationTools$ReadSms$execute$1) continuation;
                int i5 = communicationTools$ReadSms$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    communicationTools$ReadSms$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    communicationTools$ReadSms$execute$1 = new CommunicationTools$ReadSms$execute$1(this, continuation);
                }
            }
            Object obj = communicationTools$ReadSms$execute$1.result;
            Object obj2 = CoroutineSingletons.f71806a;
            int i11 = communicationTools$ReadSms$execute$1.label;
            int i12 = 1;
            if (i11 == 0) {
                ResultKt.b(obj);
                communicationTools$ReadSms$execute$1.L$0 = context3;
                map2 = map;
                communicationTools$ReadSms$execute$1.L$1 = map2;
                communicationTools$ReadSms$execute$1.label = 1;
                objRequirePermission = requirePermission(context3, "android.permission.READ_SMS", z11, communicationTools$ReadSms$execute$1);
                if (objRequirePermission == obj2) {
                    return obj2;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Map<String, ? extends Object> map3 = (Map) communicationTools$ReadSms$execute$1.L$1;
                Context context4 = (Context) communicationTools$ReadSms$execute$1.L$0;
                ResultKt.b(obj);
                map2 = map3;
                context3 = context4;
                objRequirePermission = obj;
            }
            if (!((Boolean) objRequirePermission).booleanValue()) {
                return new ToolResult.Error("SMS permission not available. This feature requires READ_SMS permission.", "permission_denied");
            }
            Object obj3 = map2.get(ShortcutType.CONTACT);
            String[] strArr = null;
            if (obj3 == null || (string2 = obj3.toString()) == null || (string = k.u1(string2).toString()) == null || string.length() <= 0) {
                string = null;
            }
            Integer intArg = parseIntArg(map2, "count");
            int iE0 = kotlin.ranges.a.e0(intArg != null ? intArg.intValue() : 10, 1, 20);
            try {
                ArrayList arrayList = new ArrayList();
                String str2 = string != null ? "address LIKE ?" : null;
                if (string != null) {
                    strArr = new String[]{"%" + string + '%'};
                }
                Cursor cursorQuery = context3.getContentResolver().query(Telephony.Sms.CONTENT_URI, new String[]{PlaceTypes.ADDRESS, "body", "date", TTConst.TRACK_TYPE}, str2, strArr, "date DESC");
                if (cursorQuery != null) {
                    while (cursorQuery.moveToNext() && arrayList.size() < iE0) {
                        try {
                            String string3 = cursorQuery.getString(0);
                            if (string3 != null) {
                                String string4 = cursorQuery.getString(i12);
                                if (string4 == null) {
                                    string4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                }
                                long j11 = cursorQuery.getLong(2);
                                int i13 = cursorQuery.getInt(3);
                                CommunicationTools communicationTools = CommunicationTools.INSTANCE;
                                int i14 = iE0;
                                String strResolveContactName = communicationTools.resolveContactName(context3, string3);
                                if (string == null || strResolveContactName == null) {
                                    context2 = context3;
                                } else {
                                    context2 = context3;
                                    if (k.K0(strResolveContactName, string, true) || k.K0(string3, string, false)) {
                                    }
                                    iE0 = i14;
                                    context3 = context2;
                                    i12 = 1;
                                }
                                String str3 = i13 != 1 ? i13 != 2 ? i13 != 3 ? InneractiveMediationNameConsts.OTHER : "draft" : "sent" : "inbox";
                                MapBuilder mapBuilder = new MapBuilder();
                                String str4 = string;
                                mapBuilder.put("sender", strResolveContactName == null ? string3 : strResolveContactName);
                                mapBuilder.put(PlaceTypes.ADDRESS, string3);
                                mapBuilder.put("body", string4);
                                mapBuilder.put("timestamp", communicationTools.formatTimestamp(j11));
                                mapBuilder.put(TTConst.TRACK_TYPE, str3);
                                arrayList.add(mapBuilder.b());
                                string = str4;
                                iE0 = i14;
                                context3 = context2;
                                i12 = 1;
                            }
                        } finally {
                        }
                    }
                    Unit unit = Unit.f71706a;
                    cursorQuery.close();
                }
                Map mapJ0 = MapsKt.j0(new Pair("messages", arrayList), new Pair("count", new Integer(arrayList.size())));
                if (arrayList.isEmpty()) {
                    str = "No SMS messages found";
                } else {
                    str = arrayList.size() + " message(s) found";
                }
                return new ToolResult.Success(mapJ0, str);
            } catch (SecurityException unused) {
                return new ToolResult.Error("SMS permission denied", "permission_denied");
            } catch (Exception e3) {
                return new ToolResult.Error(c1.s(e3, new StringBuilder("Failed to read SMS: ")), "execution_failed");
            }
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getCategory() {
            return category;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getDescription() {
            return description;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getDisplayName() {
            return displayName;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getName() {
            return name;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public Map<String, Object> getParameters() {
            return parameters;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public ToolType getToolType() {
            return toolType;
        }
    }

    private CommunicationTools() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String formatDuration(long seconds) {
        if (seconds < 60) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(seconds);
            sb2.append('s');
            return sb2.toString();
        }
        if (seconds < com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40328b) {
            StringBuilder sb3 = new StringBuilder();
            long j11 = 60;
            sb3.append(seconds / j11);
            sb3.append("m ");
            return a2.c.n(sb3, seconds % j11, 's');
        }
        StringBuilder sb4 = new StringBuilder();
        long j12 = 3600;
        sb4.append(seconds / j12);
        sb4.append("h ");
        return a2.c.n(sb4, (seconds % j12) / 60, 'm');
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String formatTimestamp(long millis) {
        String str = new SimpleDateFormat("MMM d, h:mm a", Locale.getDefault()).format(new Date(millis));
        Intrinsics.f(str, "format(...)");
        return str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String resolveContactName(Context context, String number) throws IOException {
        if (o4.a.a(context, "android.permission.READ_CONTACTS") != 0) {
            return null;
        }
        try {
            Cursor cursorQuery = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(number)), new String[]{"display_name"}, null, null, null);
            if (cursorQuery != null) {
                try {
                    String string = cursorQuery.moveToFirst() ? cursorQuery.getString(0) : null;
                    cursorQuery.close();
                    return string;
                } finally {
                }
            }
        } catch (Exception unused) {
        }
        return null;
    }

    @NotNull
    public final List<AiTool> getAll() {
        return all;
    }
}
