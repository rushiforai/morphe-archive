package com.instabridge.ai.tools;

import a80.m;
import ab.e0;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.CalendarContract;
import android.provider.ContactsContract;
import android.service.notification.StatusBarNotification;
import android.util.Log;
import b.c0;
import b70.g;
import b70.h;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.proactive.AiInsightAction;
import com.instabridge.ai.tools.ContactResolver;
import com.instabridge.ai.tools.ContactsProvider;
import com.instabridge.ai.tools.SendMessageTool;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.ai.tools.bii.BIIAvailabilityProbe;
import com.instabridge.ai.tools.bii.BIICapabilityDiscovery;
import com.instabridge.ai.tools.bii.BIIEntry;
import com.instabridge.ai.tools.bii.BIITool;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.instabridge.ai.tools.perapp.PerAppFeatureTool;
import com.instabridge.ai.tools.standard.StandardIntentsCatalog;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import h6.c1;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.io.CloseableKt;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import no.e;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.i;
import r70.j;
import r70.l;
import x7.f;

@Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\t\n\u0002\b\u001f\b'\u0018\u0000 E2\u00020\u0001:\u001dEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`aB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J&\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u001c2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\rH\u0016J\u0010\u0010\u001e\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\b\u0010\u001f\u001a\u00020 H\u0016J4\u0010!\u001a\u00020\"2\u0006\u0010\u001b\u001a\u00020\u001c2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r2\u0006\u0010#\u001a\u00020\u0015H¦@¢\u0006\u0002\u0010$J&\u0010%\u001a\u00020\u00152\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010&\u001a\u00020\u00052\u0006\u0010#\u001a\u00020\u0015H\u0085@¢\u0006\u0002\u0010'J8\u0010(\u001a\u00020\"2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020\u00052\u0016\b\u0002\u0010,\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\rH\u0004J>\u0010-\u001a\u00020\"2\u0006\u0010\u001b\u001a\u00020\u001c2\f\u0010.\u001a\b\u0012\u0004\u0012\u00020*0/2\u0006\u0010+\u001a\u00020\u00052\u0016\b\u0002\u0010,\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\rH\u0004J\u0018\u00100\u001a\u0002012\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010)\u001a\u00020*H\u0002J-\u00102\u001a\u0004\u0018\u0001032\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r2\u0006\u00104\u001a\u00020\u0005H\u0004¢\u0006\u0002\u00105J-\u00106\u001a\u0004\u0018\u0001072\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\r2\u0006\u00104\u001a\u00020\u0005H\u0004¢\u0006\u0002\u00108J \u00109\u001a\u0010\u0012\u0004\u0012\u000203\u0012\u0004\u0012\u000203\u0018\u00010:2\b\u0010;\u001a\u0004\u0018\u00010\u0005H\u0004J\u0018\u0010<\u001a\u0002072\u0006\u0010=\u001a\u00020\u00052\u0006\u0010>\u001a\u00020\u0005H\u0004J\u0018\u0010?\u001a\u0002032\u0006\u0010=\u001a\u00020\u00052\u0006\u0010>\u001a\u00020\u0005H\u0002J\u0019\u0010B\u001a\u0004\u0018\u00010C2\b\u0010;\u001a\u0004\u0018\u00010\u0001H\u0004¢\u0006\u0002\u0010DR\u0012\u0010\u0004\u001a\u00020\u0005X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u00058VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\u0007R\u0012\u0010\n\u001a\u00020\u0005X¦\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\u0007R\u001e\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00010\rX¦\u0004¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000fR\u0012\u0010\u0010\u001a\u00020\u0011X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0014\u001a\u00020\u0015X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0012\u0010\u0018\u001a\u00020\u0005X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u0007R\u0014\u0010@\u001a\u00020\u00058DX\u0084\u0004¢\u0006\u0006\u001a\u0004\bA\u0010\u0007¨\u0006b"}, d2 = {"Lcom/instabridge/ai/tools/AiTool;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "requiresConfirmation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getRequiresConfirmation", "()Z", "category", "getCategory", "canExecute", "context", "Landroid/content/Context;", "args", "isAvailableOnDevice", "toDefinition", "Lcom/instabridge/ai/tools/ToolDefinition;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "requirePermission", "permission", "(Landroid/content/Context;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "launchIntent", "intent", "Landroid/content/Intent;", "actionName", "extraInfo", "launchIntentWithFallbacks", "intents", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "preferOwnApp", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "parseIntArg", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, DatabaseConstants.KEY_FIELD, "(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Integer;", "parseDoubleArg", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Double;", "parseClockTime", "Lkotlin/Pair;", "value", "similarText", "a", "b", "levenshtein", "appClockCategory", "getAppClockCategory", "parseDateTime", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/Object;)Ljava/lang/Long;", k.O, "MakeCall", "SendSms", "OpenContact", "SearchContacts", "ComposeEmail", "ShareText", "OpenSettings", "OpenLocationSettings", "OpenSoundSettings", "OpenDisplaySettings", "SetAlarm", "SetTimer", "OpenCalendar", "ViewCalendarEvent", "CreateCalendarEvent", "ReadCalendarEvents", "OpenCalculator", "OpenMessages", "OpenApp", "ViewContacts", "AddContact", "OpenMaps", "NavigateTo", "SearchNearby", "SearchPlayStore", "ReadNotifications", "SearchDevice", "SearchWeb", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public abstract class AiTool {
    public static final int $stable = 0;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final Set<String> LOCATION_PERMISSIONS = kotlin.collections.c.f1(new String[]{"android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_BACKGROUND_LOCATION"});

    @NotNull
    private static final List<String> OWN_PACKAGE_PREFIXES = ul.b.Q("com.instabridge.", "com.eyecon.", "com.teslacoilsw.");

    @NotNull
    private static final Lazy<List<AiTool>> common$delegate = LazyKt.a(new a(0));

    @NotNull
    private static final Lazy<List<AiTool>> expanded$delegate = LazyKt.a(new a(1));
    private final boolean requiresConfirmation;

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$AddContact;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class AddContact extends AiTool {

        @NotNull
        public static final AddContact INSTANCE = new AddContact();

        @NotNull
        private static final String name = "add_contact";

        @NotNull
        private static final String description = "Create a new contact.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Contact's name"))), new Pair("phone_number", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Contact's phone number"))), new Pair(ActionCategory.EMAIL, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Contact's email address"))))));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "contacts";
        public static final int $stable = 8;

        private AddContact() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            String string;
            String string2;
            String string3;
            Intent intent = new Intent("android.intent.action.INSERT");
            intent.setType("vnd.android.cursor.dir/contact");
            Object obj = map.get(PendingUpgradeStore.KEY_NAME);
            if (obj != null && (string3 = obj.toString()) != null) {
                intent.putExtra(PendingUpgradeStore.KEY_NAME, string3);
            }
            Object obj2 = map.get("phone_number");
            if (obj2 != null && (string2 = obj2.toString()) != null) {
                intent.putExtra("phone", string2);
            }
            Object obj3 = map.get(ActionCategory.EMAIL);
            if (obj3 != null && (string = obj3.toString()) != null) {
                intent.putExtra(ActionCategory.EMAIL, string);
            }
            return AiTool.launchIntent$default(this, context, intent, "add_contact", null, 8, null);
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

    @Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0006H\u0000¢\u0006\u0002\b\u000eJ\u0015\u0010\u000f\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0000¢\u0006\u0002\b\u0012J\u0015\u0010\u0013\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0000¢\u0006\u0002\b\u0014J\u001d\u0010\u0015\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0016\u001a\u00020\u0017H\u0000¢\u0006\u0002\b\u0018J4\u0010%\u001a\b\u0012\u0004\u0012\u00020\u001a0\n2\u000e\b\u0002\u0010&\u001a\b\u0012\u0004\u0012\u00020\u001a0\u00052\u0014\b\u0002\u0010'\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u001a0(H\u0007J4\u0010)\u001a\b\u0012\u0004\u0012\u00020*0\n2\u000e\b\u0002\u0010&\u001a\b\u0012\u0004\u0012\u00020\u001a0\u00052\u0014\b\u0002\u0010'\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u001a0(H\u0007J\u0010\u0010+\u001a\u0004\u0018\u00010\u001a2\u0006\u0010,\u001a\u00020\u0006J\u0014\u0010-\u001a\b\u0012\u0004\u0012\u00020\u001a0\n2\u0006\u0010\u0010\u001a\u00020\u0011J\u0014\u0010.\u001a\b\u0012\u0004\u0012\u00020\u001a0\n2\u0006\u0010\u0010\u001a\u00020\u0011J0\u0010/\u001a\b\u0012\u0004\u0012\u0002000\n2\f\u00101\u001a\b\u0012\u0004\u0012\u0002000\n2\f\u00102\u001a\b\u0012\u0004\u0012\u00020\u001a0\n2\u0006\u0010\u0010\u001a\u00020\u0011J&\u0010+\u001a\u0004\u0018\u00010\u001a2\u0006\u0010,\u001a\u00020\u00062\u0012\u0010'\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u001a0(H\u0007R\u001a\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u0004¢\u0006\u0002\n\u0000R!\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001a0\n8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u001d\u0010\u001e\u001a\u0004\b\u001b\u0010\u001cR!\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u001a0\n8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b!\u0010\u001e\u001a\u0004\b \u0010\u001cR \u0010\"\u001a\b\u0012\u0004\u0012\u00020\u001a0\n8FX\u0087\u0004¢\u0006\f\u0012\u0004\b#\u0010\u0003\u001a\u0004\b$\u0010\u001c¨\u00063"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "LOCATION_PERMISSIONS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getLOCATION_PERMISSIONS$instabridge_ai_sdk_release", "()Ljava/util/Set;", "OWN_PACKAGE_PREFIXES", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isOwnPackage", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", "isOwnPackage$instabridge_ai_sdk_release", "hasGeoHandler", "context", "Landroid/content/Context;", "hasGeoHandler$instabridge_ai_sdk_release", "hasMarketHandler", "hasMarketHandler$instabridge_ai_sdk_release", "hasIntentHandler", "intent", "Landroid/content/Intent;", "hasIntentHandler$instabridge_ai_sdk_release", "common", "Lcom/instabridge/ai/tools/AiTool;", "getCommon", "()Ljava/util/List;", "common$delegate", "Lkotlin/Lazy;", "expanded", "getExpanded", "expanded$delegate", "all", "getAll$annotations", "getAll", "filtered", "disabled", "overrides", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "definitions", "Lcom/instabridge/ai/tools/ToolDefinition;", "byName", PendingUpgradeStore.KEY_NAME, "biiToolsForDevice", "perAppFeatureToolsForDevice", "filterExecutableActions", "Lcom/instabridge/ai/proactive/AiInsightAction;", "actions", "allTools", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static List definitions$default(Companion companion, Set set, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                set = EmptySet.f71734a;
            }
            if ((i5 & 2) != 0) {
                map = h.f17594a;
            }
            return companion.definitions(set, map);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static List filtered$default(Companion companion, Set set, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                set = EmptySet.f71734a;
            }
            if ((i5 & 2) != 0) {
                map = h.f17594a;
            }
            return companion.filtered(set, map);
        }

        @Deprecated
        public static /* synthetic */ void getAll$annotations() {
        }

        @NotNull
        public final List<AiTool> biiToolsForDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Set<String> setDiscover$default = BIICapabilityDiscovery.discover$default(BIICapabilityDiscovery.INSTANCE, context, false, 2, null);
            Set setF1 = kotlin.collections.c.f1(new String[]{"actions.intent.OPEN_APP_FEATURE", "actions.intent.GET_THING", "actions.intent.CREATE_ITEM_LIST", "actions.intent.UPDATE_ITEM_LIST", "actions.intent.GET_ITEM_LIST"});
            List<BIIEntry> listAvailableEntries = BIIAvailabilityProbe.INSTANCE.availableEntries(context, setDiscover$default);
            ArrayList arrayList = new ArrayList();
            for (Object obj : listAvailableEntries) {
                if (!setF1.contains(((BIIEntry) obj).getBiiName())) {
                    arrayList.add(obj);
                }
            }
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                arrayList2.add(BIITool.INSTANCE.forEntry((BIIEntry) it.next()));
            }
            return arrayList2;
        }

        @Nullable
        public final AiTool byName(@NotNull String name) {
            Object next;
            Intrinsics.g(name, "name");
            Iterator<T> it = getCommon().iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((AiTool) next).getName(), name)) {
                    break;
                }
            }
            return (AiTool) next;
        }

        @JvmStatic
        @JvmOverloads
        @NotNull
        public final List<ToolDefinition> definitions() {
            return definitions$default(this, null, null, 3, null);
        }

        @NotNull
        public final List<AiInsightAction> filterExecutableActions(@NotNull List<AiInsightAction> actions, @NotNull List<? extends AiTool> allTools, @NotNull Context context) {
            boolean zCanExecute;
            Intrinsics.g(actions, "actions");
            Intrinsics.g(allTools, "allTools");
            Intrinsics.g(context, "context");
            if (actions.isEmpty()) {
                return actions;
            }
            List<? extends AiTool> list = allTools;
            int iD0 = b70.k.d0(b70.c.u0(list, 10));
            if (iD0 < 16) {
                iD0 = 16;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
            for (Object obj : list) {
                linkedHashMap.put(((AiTool) obj).getName(), obj);
            }
            int i5 = jo.a.f69615a;
            String strB = jo.a.b();
            ArrayList arrayList = new ArrayList();
            for (AiInsightAction aiInsightAction : actions) {
                String toolName = aiInsightAction.getToolName();
                if (toolName == null) {
                    zCanExecute = true;
                } else if (linkedHashMap.containsKey(toolName)) {
                    try {
                        zCanExecute = ((AiTool) f.G(toolName, linkedHashMap)).canExecute(context, aiInsightAction.getToolArgs());
                    } catch (Exception e3) {
                        Log.w(strB, "filterExecutableActions: canExecute threw for '" + toolName + "' — dropping", e3);
                    }
                } else {
                    zCanExecute = false;
                }
                if (zCanExecute) {
                    arrayList.add(aiInsightAction);
                }
                l.G1(40, aiInsightAction.getLabel());
            }
            if (arrayList.size() != actions.size()) {
                Log.i(strB, "filterExecutableActions: kept " + arrayList.size() + '/' + actions.size() + " actions");
            }
            return arrayList;
        }

        @JvmStatic
        @JvmOverloads
        @NotNull
        public final List<AiTool> filtered() {
            return filtered$default(this, null, null, 3, null);
        }

        @NotNull
        public final List<AiTool> getAll() {
            return getCommon();
        }

        @NotNull
        public final List<AiTool> getCommon() {
            return (List) AiTool.common$delegate.getValue();
        }

        @NotNull
        public final List<AiTool> getExpanded() {
            return (List) AiTool.expanded$delegate.getValue();
        }

        @NotNull
        public final Set<String> getLOCATION_PERMISSIONS$instabridge_ai_sdk_release() {
            return AiTool.LOCATION_PERMISSIONS;
        }

        public final boolean hasGeoHandler$instabridge_ai_sdk_release(@NotNull Context context) {
            Intrinsics.g(context, "context");
            try {
                Intrinsics.f(context.getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("geo:0,0?q=test")), 0), "queryIntentActivities(...)");
                return !r5.isEmpty();
            } catch (Exception unused) {
                return false;
            }
        }

        public final boolean hasIntentHandler$instabridge_ai_sdk_release(@NotNull Context context, @NotNull Intent intent) {
            Intrinsics.g(context, "context");
            Intrinsics.g(intent, "intent");
            try {
                Intrinsics.f(context.getPackageManager().queryIntentActivities(intent, 0), "queryIntentActivities(...)");
                return !r2.isEmpty();
            } catch (Exception unused) {
                return false;
            }
        }

        public final boolean hasMarketHandler$instabridge_ai_sdk_release(@NotNull Context context) {
            Intrinsics.g(context, "context");
            try {
                Intrinsics.f(context.getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("market://search?q=test")), 0), "queryIntentActivities(...)");
                return !r5.isEmpty();
            } catch (Exception unused) {
                return false;
            }
        }

        public final boolean isOwnPackage$instabridge_ai_sdk_release(@NotNull String packageName) {
            Intrinsics.g(packageName, "packageName");
            List list = AiTool.OWN_PACKAGE_PREFIXES;
            if (!(list instanceof Collection) || !list.isEmpty()) {
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    if (j.I0(packageName, (String) it.next(), false)) {
                        return true;
                    }
                }
            }
            return false;
        }

        @NotNull
        public final List<AiTool> perAppFeatureToolsForDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            List listDiscover$default = PerAppFeatureCatalog.discover$default(PerAppFeatureCatalog.INSTANCE, context, false, 2, null);
            ArrayList arrayList = new ArrayList(b70.c.u0(listDiscover$default, 10));
            Iterator it = listDiscover$default.iterator();
            while (it.hasNext()) {
                arrayList.add(PerAppFeatureTool.INSTANCE.forFeature((PerAppFeatureCatalog.Feature) it.next()));
            }
            return arrayList;
        }

        private Companion() {
        }

        @JvmStatic
        @Nullable
        public final AiTool byName(@NotNull String name, @NotNull Map<AiTool, ? extends AiTool> overrides) {
            Object obj;
            Object next;
            Intrinsics.g(name, "name");
            Intrinsics.g(overrides, "overrides");
            Iterator<T> it = overrides.entrySet().iterator();
            while (true) {
                obj = null;
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((AiTool) ((Map.Entry) next).getKey()).getName(), name)) {
                    break;
                }
            }
            Map.Entry entry = (Map.Entry) next;
            AiTool aiTool = entry != null ? (AiTool) entry.getValue() : null;
            if (aiTool != null) {
                return aiTool;
            }
            Iterator<T> it2 = getCommon().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                Object next2 = it2.next();
                if (Intrinsics.b(((AiTool) next2).getName(), name)) {
                    obj = next2;
                    break;
                }
            }
            return (AiTool) obj;
        }

        @JvmStatic
        @JvmOverloads
        @NotNull
        public final List<ToolDefinition> definitions(@NotNull Set<? extends AiTool> disabled) {
            Intrinsics.g(disabled, "disabled");
            return definitions$default(this, disabled, null, 2, null);
        }

        @JvmStatic
        @JvmOverloads
        @NotNull
        public final List<AiTool> filtered(@NotNull Set<? extends AiTool> disabled) {
            Intrinsics.g(disabled, "disabled");
            return filtered$default(this, disabled, null, 2, null);
        }

        @JvmStatic
        @JvmOverloads
        @NotNull
        public final List<ToolDefinition> definitions(@NotNull Set<? extends AiTool> disabled, @NotNull Map<AiTool, ? extends AiTool> overrides) {
            Intrinsics.g(disabled, "disabled");
            Intrinsics.g(overrides, "overrides");
            List<AiTool> listFiltered = filtered(disabled, overrides);
            ArrayList arrayList = new ArrayList(b70.c.u0(listFiltered, 10));
            Iterator<T> it = listFiltered.iterator();
            while (it.hasNext()) {
                arrayList.add(((AiTool) it.next()).toDefinition());
            }
            return arrayList;
        }

        @JvmStatic
        @JvmOverloads
        @NotNull
        public final List<AiTool> filtered(@NotNull Set<? extends AiTool> disabled, @NotNull Map<AiTool, ? extends AiTool> overrides) {
            Intrinsics.g(disabled, "disabled");
            Intrinsics.g(overrides, "overrides");
            Set<? extends AiTool> set = disabled;
            ArrayList arrayList = new ArrayList(b70.c.u0(set, 10));
            Iterator<T> it = set.iterator();
            while (it.hasNext()) {
                arrayList.add(((AiTool) it.next()).getName());
            }
            Set setN1 = g.N1(arrayList);
            Set<AiTool> setKeySet = overrides.keySet();
            ArrayList arrayList2 = new ArrayList(b70.c.u0(setKeySet, 10));
            Iterator<T> it2 = setKeySet.iterator();
            while (it2.hasNext()) {
                arrayList2.add(((AiTool) it2.next()).getName());
            }
            Set setN12 = g.N1(arrayList2);
            List<AiTool> common = getCommon();
            ArrayList arrayList3 = new ArrayList();
            for (Object obj : common) {
                AiTool aiTool = (AiTool) obj;
                if (!setN1.contains(aiTool.getName()) && !setN12.contains(aiTool.getName())) {
                    arrayList3.add(obj);
                }
            }
            return g.t1(overrides.values(), arrayList3);
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$ComposeEmail;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class ComposeEmail extends AiTool {

        @NotNull
        public static final ComposeEmail INSTANCE = new ComposeEmail();

        @NotNull
        private static final String name = "compose_email";

        @NotNull
        private static final String description = "Open the email compose screen. Accepts a contact NAME or email address for the recipient — resolves automatically. No need to call search_contacts first. Can also be called with just subject and body if no recipient is known.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("to", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Contact name OR email address (e.g., 'Mom', 'Mattias', 'anna@example.com'). Names are resolved to email addresses automatically. Optional — user can fill this in the email app."))), new Pair("subject", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Email subject"))), new Pair("body", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Email body text"))))));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "communication";
        public static final int $stable = 8;

        private ComposeEmail() {
        }

        /* JADX WARN: Code restructure failed: missing block: B:39:0x00b6, code lost:
        
            if (r13 == r2) goto L40;
         */
        /* JADX WARN: Removed duplicated region for block: B:55:0x00fd  */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            AiTool$ComposeEmail$execute$1 aiTool$ComposeEmail$execute$1;
            String string;
            Context context2;
            String str;
            Intent intent;
            Object obj;
            Object obj2;
            String string2;
            String string3;
            if (continuation instanceof AiTool$ComposeEmail$execute$1) {
                aiTool$ComposeEmail$execute$1 = (AiTool$ComposeEmail$execute$1) continuation;
                int i5 = aiTool$ComposeEmail$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$ComposeEmail$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$ComposeEmail$execute$1 = new AiTool$ComposeEmail$execute$1(this, continuation);
                }
            }
            Object objResolveEmail = aiTool$ComposeEmail$execute$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aiTool$ComposeEmail$execute$1.label;
            try {
                if (i11 == 0) {
                    ResultKt.b(objResolveEmail);
                    Object obj3 = map.get("to");
                    if (obj3 == null || (string = obj3.toString()) == null) {
                        string = null;
                    } else {
                        if (!SendMessageTool.looksLikeEmail(string)) {
                            ComposeEmail composeEmail = INSTANCE;
                            aiTool$ComposeEmail$execute$1.L$0 = context;
                            aiTool$ComposeEmail$execute$1.L$1 = map;
                            aiTool$ComposeEmail$execute$1.L$2 = string;
                            aiTool$ComposeEmail$execute$1.label = 1;
                            Object objRequirePermission = composeEmail.requirePermission(context, "android.permission.READ_CONTACTS", z11, aiTool$ComposeEmail$execute$1);
                            if (objRequirePermission != coroutineSingletons) {
                                context2 = context;
                                str = string;
                                objResolveEmail = objRequirePermission;
                            }
                            return coroutineSingletons;
                        }
                        String strNormalizeEmail = SendMessageTool.normalizeEmail(string);
                        if (strNormalizeEmail != null) {
                            string = strNormalizeEmail;
                        }
                    }
                    Context context3 = context;
                    intent = new Intent("android.intent.action.SENDTO");
                    intent.setData(Uri.parse("mailto:"));
                    if (string != null) {
                    }
                    obj = map.get("subject");
                    if (obj != null) {
                        intent.putExtra("android.intent.extra.SUBJECT", string3);
                    }
                    obj2 = map.get("body");
                    if (obj2 != null) {
                        intent.putExtra("android.intent.extra.TEXT", string2);
                    }
                    return AiTool.launchIntent$default(this, context3, intent, "compose_email", null, 8, null);
                }
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    str = (String) aiTool$ComposeEmail$execute$1.L$2;
                    map = (Map) aiTool$ComposeEmail$execute$1.L$1;
                    context2 = (Context) aiTool$ComposeEmail$execute$1.L$0;
                    ResultKt.b(objResolveEmail);
                    Map<String, ? extends Object> map2 = map;
                    String str2 = str;
                    context = context2;
                    string = (String) objResolveEmail;
                    if (string == null) {
                        return new ToolResult.Error("No email found for '" + str2 + '\'', "contact_not_found");
                    }
                    map = map2;
                    Context context32 = context;
                    intent = new Intent("android.intent.action.SENDTO");
                    intent.setData(Uri.parse("mailto:"));
                    if (string != null) {
                        intent.putExtra("android.intent.extra.EMAIL", new String[]{string});
                    }
                    obj = map.get("subject");
                    if (obj != null && (string3 = obj.toString()) != null) {
                        intent.putExtra("android.intent.extra.SUBJECT", string3);
                    }
                    obj2 = map.get("body");
                    if (obj2 != null && (string2 = obj2.toString()) != null) {
                        intent.putExtra("android.intent.extra.TEXT", string2);
                    }
                    return AiTool.launchIntent$default(this, context32, intent, "compose_email", null, 8, null);
                }
                str = (String) aiTool$ComposeEmail$execute$1.L$2;
                map = (Map) aiTool$ComposeEmail$execute$1.L$1;
                context2 = (Context) aiTool$ComposeEmail$execute$1.L$0;
                ResultKt.b(objResolveEmail);
                if (!((Boolean) objResolveEmail).booleanValue()) {
                    return new ToolResult.Error(c0.l("Cannot look up '", str, "' — contacts permission not granted. Provide an email directly."), "contacts_permission_required");
                }
                ContactResolver contactResolver = ContactResolver.INSTANCE;
                aiTool$ComposeEmail$execute$1.L$0 = context2;
                aiTool$ComposeEmail$execute$1.L$1 = map;
                aiTool$ComposeEmail$execute$1.L$2 = str;
                aiTool$ComposeEmail$execute$1.label = 2;
                objResolveEmail = contactResolver.resolveEmail(context2, str, aiTool$ComposeEmail$execute$1);
            } catch (ContactResolver.AmbiguousContactException e3) {
                String message = e3.getMessage();
                if (message == null) {
                    message = "Ambiguous contact";
                }
                return new ToolResult.Error(message, "ambiguous_contact");
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Intent intent = new Intent("android.intent.action.SENDTO");
            intent.setData(Uri.parse("mailto:"));
            return context.getPackageManager().resolveActivity(intent, 0) != null;
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$CreateCalendarEvent;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class CreateCalendarEvent extends AiTool {

        @NotNull
        public static final CreateCalendarEvent INSTANCE = new CreateCalendarEvent();

        @NotNull
        private static final String name = "create_calendar_event";

        @NotNull
        private static final String description = "Create a new calendar event. Supports inviting attendees by NAME — resolves contacts automatically to find their email. No need to call search_contacts first.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("title", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Title of the event"))), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Description of the event"))), new Pair("location", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Location of the event"))), new Pair("begin_time", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Start time as ISO 8601 string (e.g., '2026-04-08T15:00:00'). Use the current date/time from context."))), new Pair("end_time", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "End time as ISO 8601 string (e.g., '2026-04-08T16:00:00')"))), new Pair("attendees", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Comma-separated contact NAMES or email addresses to invite (e.g., 'Mattias, Anna' or 'anna@example.com'). Names are resolved to emails automatically."))))), new Pair("required", ul.b.P("title")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "calendar";
        public static final int $stable = 8;

        private CreateCalendarEvent() {
        }

        /* JADX WARN: Removed duplicated region for block: B:100:0x023a  */
        /* JADX WARN: Removed duplicated region for block: B:103:0x024f  */
        /* JADX WARN: Removed duplicated region for block: B:106:0x0261  */
        /* JADX WARN: Removed duplicated region for block: B:109:0x028a  */
        /* JADX WARN: Removed duplicated region for block: B:65:0x015a  */
        /* JADX WARN: Removed duplicated region for block: B:78:0x0195 A[Catch: AmbiguousContactException -> 0x004f, TryCatch #0 {AmbiguousContactException -> 0x004f, blocks: (B:13:0x004a, B:76:0x0191, B:78:0x0195, B:72:0x0172, B:79:0x01b9), top: B:114:0x004a }] */
        /* JADX WARN: Removed duplicated region for block: B:79:0x01b9 A[Catch: AmbiguousContactException -> 0x004f, TRY_LEAVE, TryCatch #0 {AmbiguousContactException -> 0x004f, blocks: (B:13:0x004a, B:76:0x0191, B:78:0x0195, B:72:0x0172, B:79:0x01b9), top: B:114:0x004a }] */
        /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
        /* JADX WARN: Removed duplicated region for block: B:90:0x0210  */
        /* JADX WARN: Removed duplicated region for block: B:95:0x0221  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x0189 -> B:76:0x0191). Please report as a decompilation issue!!! */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            AiTool$CreateCalendarEvent$execute$1 aiTool$CreateCalendarEvent$execute$1;
            String string;
            List arrayList;
            Context context2;
            String string2;
            List list;
            Object objRequirePermission;
            Iterator it;
            String str;
            List list2;
            Intent intent;
            Object obj;
            Object obj2;
            Long dateTime;
            Long dateTime2;
            List list3;
            String string3;
            String string4;
            int iW;
            Map<String, ? extends Object> map2 = map;
            if (continuation instanceof AiTool$CreateCalendarEvent$execute$1) {
                aiTool$CreateCalendarEvent$execute$1 = (AiTool$CreateCalendarEvent$execute$1) continuation;
                int i5 = aiTool$CreateCalendarEvent$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$CreateCalendarEvent$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$CreateCalendarEvent$execute$1 = new AiTool$CreateCalendarEvent$execute$1(this, continuation);
                }
            }
            Object obj3 = aiTool$CreateCalendarEvent$execute$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aiTool$CreateCalendarEvent$execute$1.label;
            if (i11 == 0) {
                ResultKt.b(obj3);
                Object obj4 = map2.get("title");
                if (obj4 == null || (string = obj4.toString()) == null) {
                    return new ToolResult.Error("Missing required parameter: title", "missing_parameter");
                }
                arrayList = new ArrayList();
                Object obj5 = map2.get("attendees");
                if (obj5 != null && (string2 = obj5.toString()) != null) {
                    if (r70.k.U0(string2)) {
                        string2 = null;
                    }
                    if (string2 != null) {
                        List listI1 = r70.k.i1(string2, new String[]{","}, 6);
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(listI1, 10));
                        Iterator it2 = listI1.iterator();
                        while (it2.hasNext()) {
                            arrayList2.add(r70.k.u1((String) it2.next()).toString());
                        }
                        ArrayList arrayList3 = new ArrayList();
                        Iterator it3 = arrayList2.iterator();
                        while (it3.hasNext()) {
                            Object next = it3.next();
                            if (((String) next).length() > 0) {
                                arrayList3.add(next);
                            }
                        }
                        if (!arrayList3.isEmpty()) {
                            Iterator it4 = arrayList3.iterator();
                            while (it4.hasNext()) {
                                if (!SendMessageTool.looksLikeEmail((String) it4.next())) {
                                    CreateCalendarEvent createCalendarEvent = INSTANCE;
                                    aiTool$CreateCalendarEvent$execute$1.L$0 = context;
                                    aiTool$CreateCalendarEvent$execute$1.L$1 = map2;
                                    aiTool$CreateCalendarEvent$execute$1.L$2 = string;
                                    aiTool$CreateCalendarEvent$execute$1.L$3 = arrayList;
                                    aiTool$CreateCalendarEvent$execute$1.L$4 = arrayList3;
                                    aiTool$CreateCalendarEvent$execute$1.label = 1;
                                    objRequirePermission = createCalendarEvent.requirePermission(context, "android.permission.READ_CONTACTS", z11, aiTool$CreateCalendarEvent$execute$1);
                                    if (objRequirePermission != coroutineSingletons) {
                                        context2 = context;
                                        list = arrayList3;
                                    }
                                    return coroutineSingletons;
                                }
                            }
                        }
                        context2 = context;
                        list = arrayList3;
                        it = list.iterator();
                        str = string;
                        list2 = arrayList;
                        while (it.hasNext()) {
                        }
                        arrayList = list2;
                        string = str;
                        intent = new Intent("android.intent.action.INSERT");
                        intent.setData(Uri.parse("content://com.android.calendar/events"));
                        intent.putExtra("title", string);
                        obj = map2.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
                        if (obj != null) {
                            intent.putExtra(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string4);
                        }
                        obj2 = map2.get("location");
                        if (obj2 != null) {
                            intent.putExtra("eventLocation", string3);
                        }
                        CreateCalendarEvent createCalendarEvent2 = INSTANCE;
                        dateTime = createCalendarEvent2.parseDateTime(map2.get("begin_time"));
                        if (dateTime != null) {
                        }
                        dateTime2 = createCalendarEvent2.parseDateTime(map2.get("end_time"));
                        if (dateTime2 != null) {
                        }
                        list3 = arrayList;
                        if (!list3.isEmpty()) {
                        }
                        LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("title", string));
                        if (!list3.isEmpty()) {
                        }
                        return launchIntent(context2, intent, "create_calendar_event", linkedHashMapK0);
                    }
                }
                context2 = context;
                intent = new Intent("android.intent.action.INSERT");
                intent.setData(Uri.parse("content://com.android.calendar/events"));
                intent.putExtra("title", string);
                obj = map2.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
                if (obj != null) {
                }
                obj2 = map2.get("location");
                if (obj2 != null) {
                }
                CreateCalendarEvent createCalendarEvent22 = INSTANCE;
                dateTime = createCalendarEvent22.parseDateTime(map2.get("begin_time"));
                if (dateTime != null) {
                }
                dateTime2 = createCalendarEvent22.parseDateTime(map2.get("end_time"));
                if (dateTime2 != null) {
                }
                list3 = arrayList;
                if (!list3.isEmpty()) {
                }
                LinkedHashMap linkedHashMapK02 = MapsKt.k0(new Pair("title", string));
                if (!list3.isEmpty()) {
                }
                return launchIntent(context2, intent, "create_calendar_event", linkedHashMapK02);
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                String str2 = (String) aiTool$CreateCalendarEvent$execute$1.L$5;
                Iterator it5 = (Iterator) aiTool$CreateCalendarEvent$execute$1.L$4;
                list2 = (List) aiTool$CreateCalendarEvent$execute$1.L$3;
                str = (String) aiTool$CreateCalendarEvent$execute$1.L$2;
                Map<String, ? extends Object> map3 = (Map) aiTool$CreateCalendarEvent$execute$1.L$1;
                Context context3 = (Context) aiTool$CreateCalendarEvent$execute$1.L$0;
                try {
                    ResultKt.b(obj3);
                    String str3 = (String) obj3;
                    if (str3 == null) {
                        list2.add(str3);
                        int i12 = jo.a.f69615a;
                        iW = Log.d(jo.a.b(), "create_calendar_event: resolved '" + str2 + "' → [email]");
                    } else {
                        int i13 = jo.a.f69615a;
                        iW = Log.w(jo.a.b(), "create_calendar_event: no email found for '" + str2 + '\'');
                    }
                    Boxing.a(iW);
                    it = it5;
                    map2 = map3;
                    context2 = context3;
                    while (it.hasNext()) {
                        String str4 = (String) it.next();
                        if (!SendMessageTool.looksLikeEmail(str4)) {
                            ContactResolver contactResolver = ContactResolver.INSTANCE;
                            aiTool$CreateCalendarEvent$execute$1.L$0 = context2;
                            aiTool$CreateCalendarEvent$execute$1.L$1 = map2;
                            aiTool$CreateCalendarEvent$execute$1.L$2 = str;
                            aiTool$CreateCalendarEvent$execute$1.L$3 = list2;
                            aiTool$CreateCalendarEvent$execute$1.L$4 = it;
                            aiTool$CreateCalendarEvent$execute$1.L$5 = str4;
                            aiTool$CreateCalendarEvent$execute$1.label = 2;
                            Object objResolveEmail = contactResolver.resolveEmail(context2, str4, aiTool$CreateCalendarEvent$execute$1);
                            if (objResolveEmail != coroutineSingletons) {
                                Map<String, ? extends Object> map4 = map2;
                                it5 = it;
                                str2 = str4;
                                obj3 = objResolveEmail;
                                context3 = context2;
                                map3 = map4;
                                String str32 = (String) obj3;
                                if (str32 == null) {
                                }
                                Boxing.a(iW);
                                it = it5;
                                map2 = map3;
                                context2 = context3;
                                while (it.hasNext()) {
                                }
                            }
                            return coroutineSingletons;
                        }
                        String strNormalizeEmail = SendMessageTool.normalizeEmail(str4);
                        if (strNormalizeEmail != null) {
                            str4 = strNormalizeEmail;
                        }
                        list2.add(str4);
                    }
                    arrayList = list2;
                    string = str;
                    intent = new Intent("android.intent.action.INSERT");
                    intent.setData(Uri.parse("content://com.android.calendar/events"));
                    intent.putExtra("title", string);
                    obj = map2.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
                    if (obj != null && (string4 = obj.toString()) != null) {
                        intent.putExtra(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string4);
                    }
                    obj2 = map2.get("location");
                    if (obj2 != null && (string3 = obj2.toString()) != null) {
                        intent.putExtra("eventLocation", string3);
                    }
                    CreateCalendarEvent createCalendarEvent222 = INSTANCE;
                    dateTime = createCalendarEvent222.parseDateTime(map2.get("begin_time"));
                    if (dateTime != null) {
                        intent.putExtra("beginTime", dateTime.longValue());
                    }
                    dateTime2 = createCalendarEvent222.parseDateTime(map2.get("end_time"));
                    if (dateTime2 != null) {
                        intent.putExtra("endTime", dateTime2.longValue());
                    }
                    list3 = arrayList;
                    if (!list3.isEmpty()) {
                        intent.putExtra("android.intent.extra.EMAIL", g.f1(arrayList, ",", null, null, 0, null, 62));
                    }
                    LinkedHashMap linkedHashMapK022 = MapsKt.k0(new Pair("title", string));
                    if (!list3.isEmpty()) {
                        linkedHashMapK022.put("attendees", g.f1(arrayList, ", ", null, null, 0, null, 62));
                    }
                    return launchIntent(context2, intent, "create_calendar_event", linkedHashMapK022);
                } catch (ContactResolver.AmbiguousContactException e3) {
                    String message = e3.getMessage();
                    if (message == null) {
                        message = "Ambiguous contact";
                    }
                    return new ToolResult.Error(message, "ambiguous_contact");
                }
            }
            list = (List) aiTool$CreateCalendarEvent$execute$1.L$4;
            List list4 = (List) aiTool$CreateCalendarEvent$execute$1.L$3;
            string = (String) aiTool$CreateCalendarEvent$execute$1.L$2;
            Map<String, ? extends Object> map5 = (Map) aiTool$CreateCalendarEvent$execute$1.L$1;
            context2 = (Context) aiTool$CreateCalendarEvent$execute$1.L$0;
            ResultKt.b(obj3);
            arrayList = list4;
            map2 = map5;
            objRequirePermission = obj3;
            if (!((Boolean) objRequirePermission).booleanValue()) {
                return new ToolResult.Error("Some attendee names need contacts permission to resolve to emails. Provide email addresses directly or grant Contacts access.", "contacts_permission_required");
            }
            it = list.iterator();
            str = string;
            list2 = arrayList;
            while (it.hasNext()) {
            }
            arrayList = list2;
            string = str;
            intent = new Intent("android.intent.action.INSERT");
            intent.setData(Uri.parse("content://com.android.calendar/events"));
            intent.putExtra("title", string);
            obj = map2.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
            if (obj != null) {
            }
            obj2 = map2.get("location");
            if (obj2 != null) {
            }
            CreateCalendarEvent createCalendarEvent2222 = INSTANCE;
            dateTime = createCalendarEvent2222.parseDateTime(map2.get("begin_time"));
            if (dateTime != null) {
            }
            dateTime2 = createCalendarEvent2222.parseDateTime(map2.get("end_time"));
            if (dateTime2 != null) {
            }
            list3 = arrayList;
            if (!list3.isEmpty()) {
            }
            LinkedHashMap linkedHashMapK0222 = MapsKt.k0(new Pair("title", string));
            if (!list3.isEmpty()) {
            }
            return launchIntent(context2, intent, "create_calendar_event", linkedHashMapK0222);
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0017\u0018\u0000 !2\u00020\u0001:\u0001!B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0019\u001a\u00020\u00142\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J4\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001a\u001a\u00020\u001b2\u0014\u0010\u001e\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001f\u001a\u00020\u0014H\u0096@¢\u0006\u0002\u0010 R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0014X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0014\u0010\u0017\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0007¨\u0006\""}, d2 = {"Lcom/instabridge/ai/tools/AiTool$MakeCall;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "requiresConfirmation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getRequiresConfirmation", "()Z", "category", "getCategory", "isAvailableOnDevice", "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static class MakeCall extends AiTool {
        private final boolean requiresConfirmation;

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion(null);
        public static final int $stable = 8;

        @NotNull
        private final String name = "make_call";

        @NotNull
        private final String description = "Open the phone dialer, optionally pre-filled with a number to call. Accepts a contact NAME or phone number — resolves automatically. Omit phone_number to just open the dialer with no prefill.";

        @NotNull
        private final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("phone_number", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional contact name OR phone number (e.g., 'Mom', 'Mattias', '+46701234567'). Names are resolved to phone numbers automatically. Omit to open the dialer with nothing prefilled."))), new Pair("contact_name", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional metadata: display name after resolution"))))));

        @NotNull
        private final ToolType toolType = ToolType.ACTION;

        @NotNull
        private final String category = "communication";

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$MakeCall$Companion;", "Lcom/instabridge/ai/tools/AiTool$MakeCall;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Companion extends MakeCall {
            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            private Companion() {
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:46:0x00e4, code lost:
        
            if (r3 == r4) goto L47;
         */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public static Object execute$suspendImpl(MakeCall makeCall, Context context, Map<String, ? extends Object> map, boolean z11, Continuation<? super ToolResult> continuation) {
            AiTool$MakeCall$execute$1 aiTool$MakeCall$execute$1;
            String str;
            Object objRequirePermission;
            MakeCall makeCall2;
            Context context2;
            MakeCall makeCall3;
            Context context3;
            String string;
            String string2;
            Object objResolvePhone;
            if (continuation instanceof AiTool$MakeCall$execute$1) {
                aiTool$MakeCall$execute$1 = (AiTool$MakeCall$execute$1) continuation;
                int i5 = aiTool$MakeCall$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$MakeCall$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$MakeCall$execute$1 = new AiTool$MakeCall$execute$1(makeCall, continuation);
                }
            }
            Object obj = aiTool$MakeCall$execute$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aiTool$MakeCall$execute$1.label;
            try {
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Object obj2 = map.get("phone_number");
                    str = null;
                    if (obj2 != null && (string = obj2.toString()) != null && (string2 = r70.k.u1(string).toString()) != null && !r70.k.U0(string2)) {
                        str = string2;
                    }
                    if (str == null) {
                        return AiTool.launchIntent$default(makeCall, context, new Intent("android.intent.action.DIAL"), "dialer_opened", null, 8, null);
                    }
                    if (PhoneNumberNormalizer.INSTANCE.looksLikePhoneNumber(str)) {
                        String strNormalizePhone = SendMessageTool.normalizePhone(str, context);
                        if (strNormalizePhone.length() != 0) {
                            str = strNormalizePhone;
                        }
                        makeCall3 = makeCall;
                        context3 = context;
                        Intent intent = new Intent("android.intent.action.DIAL");
                        intent.setData(Uri.parse("tel:".concat(str)));
                        return AiTool.launchIntent$default(makeCall3, context3, intent, "dialer_opened", null, 8, null);
                    }
                    aiTool$MakeCall$execute$1.L$0 = makeCall;
                    aiTool$MakeCall$execute$1.L$1 = context;
                    aiTool$MakeCall$execute$1.L$2 = str;
                    aiTool$MakeCall$execute$1.label = 1;
                    objRequirePermission = makeCall.requirePermission(context, "android.permission.READ_CONTACTS", z11, aiTool$MakeCall$execute$1);
                    if (objRequirePermission != coroutineSingletons) {
                        makeCall2 = makeCall;
                        context2 = context;
                    }
                    return coroutineSingletons;
                }
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    String str2 = (String) aiTool$MakeCall$execute$1.L$2;
                    Context context4 = (Context) aiTool$MakeCall$execute$1.L$1;
                    MakeCall makeCall4 = (MakeCall) aiTool$MakeCall$execute$1.L$0;
                    ResultKt.b(obj);
                    str = str2;
                    makeCall2 = makeCall4;
                    objResolvePhone = obj;
                    context2 = context4;
                    String str3 = (String) objResolvePhone;
                    if (str3 == null) {
                        return new ToolResult.Error("No phone number found for '" + str + '\'', "contact_not_found");
                    }
                    context3 = context2;
                    str = str3;
                    makeCall3 = makeCall2;
                    Intent intent2 = new Intent("android.intent.action.DIAL");
                    intent2.setData(Uri.parse("tel:".concat(str)));
                    return AiTool.launchIntent$default(makeCall3, context3, intent2, "dialer_opened", null, 8, null);
                }
                String str4 = (String) aiTool$MakeCall$execute$1.L$2;
                Context context5 = (Context) aiTool$MakeCall$execute$1.L$1;
                MakeCall makeCall5 = (MakeCall) aiTool$MakeCall$execute$1.L$0;
                ResultKt.b(obj);
                str = str4;
                makeCall2 = makeCall5;
                objRequirePermission = obj;
                context2 = context5;
                if (!((Boolean) objRequirePermission).booleanValue()) {
                    return new ToolResult.Error(c0.l("Cannot look up '", str, "' — contacts permission not granted. Please provide a phone number directly."), "contacts_permission_required");
                }
                ContactResolver contactResolver = ContactResolver.INSTANCE;
                aiTool$MakeCall$execute$1.L$0 = makeCall2;
                aiTool$MakeCall$execute$1.L$1 = context2;
                aiTool$MakeCall$execute$1.L$2 = str;
                aiTool$MakeCall$execute$1.label = 2;
                objResolvePhone = contactResolver.resolvePhone(context2, str, aiTool$MakeCall$execute$1);
            } catch (ContactResolver.AmbiguousContactException e3) {
                String message = e3.getMessage();
                if (message == null) {
                    message = "Ambiguous contact";
                }
                return new ToolResult.Error(message, "ambiguous_contact");
            }
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            return execute$suspendImpl(this, context, map, z11, continuation);
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getCategory() {
            return this.category;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getDescription() {
            return this.description;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public String getName() {
            return this.name;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public Map<String, Object> getParameters() {
            return this.parameters;
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean getRequiresConfirmation() {
            return this.requiresConfirmation;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public ToolType getToolType() {
            return this.toolType;
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return context.getPackageManager().hasSystemFeature("android.hardware.telephony");
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J&\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000bH\u0016J\u0010\u0010\u001a\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001d\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001eR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$NavigateTo;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "canExecute", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "args", "isAvailableOnDevice", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class NavigateTo extends AiTool {

        @NotNull
        public static final NavigateTo INSTANCE = new NavigateTo();

        @NotNull
        private static final String name = "navigate_to";

        @NotNull
        private static final String description = "Start navigation to a destination.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair(PlaceTypes.ADDRESS, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Destination address"))), new Pair("latitude", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "number"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Destination latitude"))), new Pair("longitude", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "number"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Destination longitude"))))));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "navigation";
        public static final int $stable = 8;

        private NavigateTo() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
            Intrinsics.g(context, "context");
            Intrinsics.g(args, "args");
            Object obj = args.get(PlaceTypes.ADDRESS);
            String str = obj instanceof String ? (String) obj : null;
            return ((str == null || r70.k.U0(str)) && parseDoubleArg(args, "latitude") == null) ? false : true;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            Uri uri;
            Object obj = map.get(PlaceTypes.ADDRESS);
            String string = obj != null ? obj.toString() : null;
            Double doubleArg = parseDoubleArg(map, "latitude");
            Double doubleArg2 = parseDoubleArg(map, "longitude");
            if (string != null) {
                uri = Uri.parse("google.navigation:q=" + Uri.encode(string));
            } else {
                if (doubleArg == null || doubleArg2 == null) {
                    return new ToolResult.Error("Must provide either 'address' or 'latitude' and 'longitude'", "missing_parameter");
                }
                uri = Uri.parse("google.navigation:q=" + doubleArg + AbstractJsonLexerKt.COMMA + doubleArg2);
            }
            Intent intent = new Intent("android.intent.action.VIEW", uri);
            if (string == null) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(doubleArg);
                sb2.append(AbstractJsonLexerKt.COMMA);
                sb2.append(doubleArg2);
                string = sb2.toString();
            }
            return launchIntent(context, intent, "navigate_to", m.n("destination", string));
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return AiTool.INSTANCE.hasGeoHandler$instabridge_ai_sdk_release(context);
        }
    }

    @Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0015\u001a\u00020\u0016H\u0016J&\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000bH\u0016J4\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001e\u001a\u00020\u0018H\u0096@¢\u0006\u0002\u0010\u001fJ4\u0010 \u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00052\u0006\u0010\"\u001a\u00020\u00052\b\u0010#\u001a\u0004\u0018\u00010\u00052\b\u0010$\u001a\u0004\u0018\u00010\u0005H\u0002J$\u0010%\u001a\u0004\u0018\u00010\u00052\u0006\u0010&\u001a\u00020'2\b\u0010(\u001a\u0004\u0018\u00010\u00052\b\u0010)\u001a\u0004\u0018\u00010\u0005J0\u0010*\u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010&\u001a\u00020'2\u0006\u0010!\u001a\u00020\u00052\u0006\u0010\"\u001a\u00020\u00052\u0006\u0010+\u001a\u00020\u0005H\u0002R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006,"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenApp;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "toDefinition", "Lcom/instabridge/ai/tools/ToolDefinition;", "canExecute", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "args", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "launchWithSend", "pkg", "label", PglCryptUtils.KEY_MESSAGE, "recipient", "resolvePackage", "pm", "Landroid/content/pm/PackageManager;", "packageName", "appName", "launchWithSearch", "query", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class OpenApp extends AiTool {

        @NotNull
        public static final OpenApp INSTANCE = new OpenApp();

        @NotNull
        private static final String name = "open_app";

        @NotNull
        private static final String description = "Open any installed app. Supports three powerful modes:\n1. IN-APP SEARCH: search_query opens the app's search directly (Spotify, Netflix, YouTube, Maps, Amazon, etc.)\n2. DRAFT MESSAGE: message+recipient pre-fills a ready-to-send message in WhatsApp, Telegram, Signal, SMS, Teams, or email. The user just taps send. Write the full message — be helpful, personal, and natural. This is extremely powerful for the user.\n3. JUST OPEN: no extra params, just launches the app.\n\nExamples:\n• app='Spotify' search_query='Coldplay' — opens Spotify search\n• app='Netflix' search_query='Bytet' — searches Netflix for a show\n• app='WhatsApp' recipient='+46701234567' message='Hey! Running about 10 minutes late, see you soon!' — drafts WhatsApp message ready to send\n• app='Telegram' recipient='johndoe' message='Are we still on for dinner tonight? I was thinking that Italian place on Kungsgatan.' — drafts Telegram message\n• app='Gmail' recipient='boss@company.com' message='Hi, please find the quarterly report attached. Let me know if you need anything else.' — drafts email\n• app='YouTube' search_query='Lex Fridman latest' — searches YouTube\n• app='Uber' search_query='Arlanda Airport' — opens Uber with destination\n• app='Camera' — just opens the camera\n\nIMPORTANT: For web searches, use search_web instead. open_app searches WITHIN the specific app.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("app", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "App name (e.g. 'Spotify', 'Instagram', 'Chrome', 'Camera', 'Settings', 'WhatsApp', 'Netflix')"))), new Pair("package", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Android package name if known (e.g. 'com.spotify.music'). Usually not needed — use app name instead."))), new Pair("search_query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Content to search for inside the app (e.g. 'Coldplay', 'cat videos', 'Italian restaurants')"))), new Pair(PglCryptUtils.KEY_MESSAGE, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Message text to prefill. The app opens with this text ready to send. Write the full message — be natural and personal."))), new Pair("recipient", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Recipient: phone number for WhatsApp/Signal/SMS ('+46701234567'), username for Telegram ('johndoe'), email for Gmail/Outlook ('name@example.com')"))))), new Pair("required", ul.b.P("app")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "apps";
        public static final int $stable = 8;

        private OpenApp() {
        }

        private final ToolResult launchWithSearch(Context context, PackageManager pm2, String pkg, String label, String query) {
            Map<String, ? extends Object> mapJ0 = MapsKt.j0(new Pair("app", label), new Pair("package", pkg), new Pair("query", query));
            ArrayList arrayList = new ArrayList();
            Intent intent = new Intent("android.intent.action.MEDIA_SEARCH");
            intent.setPackage(pkg);
            intent.putExtra("query", query);
            intent.putExtra("android.intent.extra.focus", "vnd.android.cursor.item/*");
            arrayList.add(intent);
            Intent intent2 = new Intent("android.intent.action.SEARCH");
            intent2.setPackage(pkg);
            intent2.putExtra("query", query);
            arrayList.add(intent2);
            try {
                for (DynamicIntentTool dynamicIntentTool : IntentToolDiscovery.INSTANCE.discover(context, false)) {
                    if (Intrinsics.b(dynamicIntentTool.getPackageName(), pkg) && dynamicIntentTool.getIsSearchAction()) {
                        arrayList.add(dynamicIntentTool.buildIntent(query));
                    }
                }
            } catch (Exception unused) {
            }
            return launchIntentWithFallbacks(context, arrayList, "app_searched", mapJ0);
        }

        private final ToolResult launchWithSend(Context context, String pkg, String label, String message, String recipient) {
            ArrayList arrayList = new ArrayList();
            Pair pair = new Pair("app", label);
            Pair pair2 = new Pair("package", pkg);
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            Pair pair3 = new Pair("recipient", recipient == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : recipient);
            if (message != null) {
                str = message;
            }
            Map<String, ? extends Object> mapJ0 = MapsKt.j0(pair, pair2, pair3, new Pair(PglCryptUtils.KEY_MESSAGE, str));
            if (recipient != null && j.I0(recipient, "+", false)) {
                Intent intent = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(recipient)));
                if (message != null) {
                    intent.putExtra("sms_body", message);
                }
                arrayList.add(intent);
                Intent intent2 = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(recipient)));
                intent2.setPackage(pkg);
                if (message != null) {
                    intent2.putExtra("sms_body", message);
                }
                arrayList.add(intent2);
            }
            if (recipient != null && SendMessageTool.looksLikeEmail(recipient)) {
                Intent intent3 = new Intent("android.intent.action.SENDTO", Uri.parse("mailto:".concat(recipient)));
                intent3.setPackage(pkg);
                if (message != null) {
                    intent3.putExtra("android.intent.extra.TEXT", message);
                }
                arrayList.add(intent3);
            }
            if (message != null) {
                Intent intent4 = new Intent("android.intent.action.SEND");
                intent4.setType("text/plain");
                intent4.setPackage(pkg);
                intent4.putExtra("android.intent.extra.TEXT", message);
                if (recipient != null) {
                    intent4.putExtra(PlaceTypes.ADDRESS, recipient);
                }
                arrayList.add(intent4);
            }
            return launchIntentWithFallbacks(context, arrayList, "message_sent", mapJ0);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final CharSequence toDefinition$lambda$5(Pair pair) {
            Intrinsics.g(pair, "<destruct>");
            String str = (String) pair.f71683a;
            List list = (List) pair.f71684b;
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append('(');
            return c1.t(sb2, g.f1(g.E1(list, 4), ", ", null, null, 0, new a00.a(25), 30), ')');
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final CharSequence toDefinition$lambda$5$lambda$4(PerAppFeatureCatalog.Feature it) {
            Intrinsics.g(it, "it");
            return it.getFeatureLabel();
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
            String string;
            String string2;
            String string3;
            Intrinsics.g(context, "context");
            Intrinsics.g(args, "args");
            Object obj = args.get("app");
            String str = obj instanceof String ? (String) obj : null;
            Object obj2 = args.get("package");
            String str2 = obj2 instanceof String ? (String) obj2 : null;
            if (str == null && str2 == null) {
                return true;
            }
            PackageManager packageManager = context.getPackageManager();
            Intrinsics.d(packageManager);
            String strResolvePackage = resolvePackage(packageManager, str2, str);
            if (strResolvePackage == null) {
                return false;
            }
            Object obj3 = args.get("search_query");
            String str3 = (obj3 == null || (string3 = obj3.toString()) == null || r70.k.U0(string3)) ? null : string3;
            Object obj4 = args.get(PglCryptUtils.KEY_MESSAGE);
            String str4 = (obj4 == null || (string2 = obj4.toString()) == null || r70.k.U0(string2)) ? null : string2;
            Object obj5 = args.get("recipient");
            String str5 = (obj5 == null || (string = obj5.toString()) == null || r70.k.U0(string)) ? null : string;
            if (str3 != null) {
                if (!DeepLinkRegistry.resolve$default(DeepLinkRegistry.INSTANCE, strResolvePackage, str3, null, null, null, 28, null).isEmpty()) {
                    return true;
                }
                Intent intent = new Intent("android.intent.action.SEARCH").setPackage(strResolvePackage);
                Intrinsics.f(intent, "setPackage(...)");
                List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, 0);
                Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
                listQueryIntentActivities.isEmpty();
                return true;
            }
            if ((str4 == null && str5 == null) || !DeepLinkRegistry.resolve$default(DeepLinkRegistry.INSTANCE, strResolvePackage, null, str4, str5, null, 18, null).isEmpty()) {
                return true;
            }
            if (str5 != null) {
                Intent intent2 = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(str5))).setPackage(strResolvePackage);
                Intrinsics.f(intent2, "setPackage(...)");
                List<ResolveInfo> listQueryIntentActivities2 = packageManager.queryIntentActivities(intent2, 0);
                Intrinsics.f(listQueryIntentActivities2, "queryIntentActivities(...)");
                if (!listQueryIntentActivities2.isEmpty()) {
                    return true;
                }
            }
            Intent intent3 = new Intent("android.intent.action.SEND");
            intent3.setType("text/plain");
            intent3.setPackage(strResolvePackage);
            List<ResolveInfo> listQueryIntentActivities3 = packageManager.queryIntentActivities(intent3, 0);
            Intrinsics.f(listQueryIntentActivities3, "queryIntentActivities(...)");
            return !listQueryIntentActivities3.isEmpty();
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            PackageManager packageManager;
            Context context2;
            String str;
            String string;
            String string2;
            String string3;
            Object obj = map.get("package");
            String string4 = obj != null ? obj.toString() : null;
            Object obj2 = map.get("app");
            String string5 = obj2 != null ? obj2.toString() : null;
            Object obj3 = map.get("search_query");
            String str2 = (obj3 == null || (string3 = obj3.toString()) == null || r70.k.U0(string3)) ? null : string3;
            Object obj4 = map.get(PglCryptUtils.KEY_MESSAGE);
            String str3 = (obj4 == null || (string2 = obj4.toString()) == null || r70.k.U0(string2)) ? null : string2;
            Object obj5 = map.get("recipient");
            String str4 = (obj5 == null || (string = obj5.toString()) == null || r70.k.U0(string)) ? null : string;
            if (string4 == null && string5 == null) {
                return new ToolResult.Error("Must provide 'app' or 'package'", "missing_parameter");
            }
            PackageManager packageManager2 = context.getPackageManager();
            Intrinsics.d(packageManager2);
            String strResolvePackage = resolvePackage(packageManager2, string4, string5);
            if (strResolvePackage == null) {
                StringBuilder sb2 = new StringBuilder("App not found: ");
                if (string5 != null) {
                    string4 = string5;
                }
                sb2.append(string4);
                return new ToolResult.Error(sb2.toString(), "app_not_found");
            }
            try {
                string5 = packageManager2.getApplicationLabel(packageManager2.getApplicationInfo(strResolvePackage, 0)).toString();
            } catch (Exception unused) {
                if (string5 == null) {
                    string5 = strResolvePackage;
                }
            }
            if (str2 == null && str3 == null && str4 == null) {
                Intent launchIntentForPackage = packageManager2.getLaunchIntentForPackage(strResolvePackage);
                if (launchIntentForPackage == null) {
                    return new ToolResult.Error(c0.k("App cannot be launched: ", string5), "no_launcher");
                }
                launchIntentForPackage.setFlags(268435456);
                return launchIntent(context, launchIntentForPackage, "app_opened", MapsKt.j0(new Pair("app", string5), new Pair("package", strResolvePackage)));
            }
            Map<String, ? extends Object> mapJ0 = MapsKt.j0(new Pair("app", string5), new Pair("package", strResolvePackage), new Pair("query", str2 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2), new Pair(PglCryptUtils.KEY_MESSAGE, str3 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3));
            DeepLinkRegistry deepLinkRegistry = DeepLinkRegistry.INSTANCE;
            boolean zHasSupport = deepLinkRegistry.hasSupport(strResolvePackage);
            int i5 = jo.a.f69615a;
            String strB = jo.a.b();
            StringBuilder sbW = c0.w("open_app: ", string5, " (", strResolvePackage, ") search=");
            sbW.append(str2 != null ? l.G1(30, str2) : null);
            sbW.append(" msg=");
            String str5 = str3;
            c0.D(sbW, str3 != null ? l.G1(30, str3) : null, " recipient=", str4, " inRegistry=");
            sbW.append(zHasSupport);
            Log.i(strB, sbW.toString());
            if (str2 != null && deepLinkRegistry.isMusicApp(strResolvePackage)) {
                Intent intent = new Intent("android.media.action.MEDIA_PLAY_FROM_SEARCH");
                intent.setPackage(strResolvePackage);
                intent.putExtra("query", str2);
                intent.putExtra("android.intent.extra.focus", "audio/*");
                boolean z12 = packageManager2.resolveActivity(intent, 0) != null;
                jo.a.b();
                if (z12) {
                    ToolResult toolResultLaunchIntent = launchIntent(context, intent, "media_play", mapJ0);
                    if (toolResultLaunchIntent instanceof ToolResult.Success) {
                        Log.i(jo.a.b(), "open_app: ✅ SUCCESS via media_play (auto-plays in " + string5 + ')');
                        return toolResultLaunchIntent;
                    }
                }
            }
            List listResolve$default = DeepLinkRegistry.resolve$default(deepLinkRegistry, strResolvePackage, str2, str5, str4, null, 16, null);
            jo.a.b();
            listResolve$default.size();
            Iterator it = listResolve$default.iterator();
            int i11 = 0;
            while (it.hasNext()) {
                int i12 = i11 + 1;
                String str6 = (String) it.next();
                String str7 = string5;
                Iterator it2 = it;
                Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse(str6));
                intent2.setPackage(strResolvePackage);
                boolean z13 = packageManager2.resolveActivity(intent2, 0) != null;
                int i13 = jo.a.f69615a;
                jo.a.b();
                PackageManager packageManager3 = packageManager2;
                l.G1(80, str6);
                if (z13) {
                    ToolResult toolResultLaunchIntent2 = launchIntent(context, intent2, "deep_link", mapJ0);
                    if (toolResultLaunchIntent2 instanceof ToolResult.Success) {
                        Log.i(jo.a.b(), "open_app: ✅ SUCCESS via deep_link (registry URI " + i11 + ')');
                        return toolResultLaunchIntent2;
                    }
                }
                if (j.I0(str6, "http", false)) {
                    ToolResult toolResultLaunchIntent3 = launchIntent(context, new Intent("android.intent.action.VIEW", Uri.parse(str6)), "deep_link_unscoped", mapJ0);
                    if (toolResultLaunchIntent3 instanceof ToolResult.Success) {
                        Log.i(jo.a.b(), "open_app: ✅ SUCCESS via deep_link_unscoped (URI " + i11 + ')');
                        return toolResultLaunchIntent3;
                    }
                }
                i11 = i12;
                string5 = str7;
                it = it2;
                packageManager2 = packageManager3;
            }
            PackageManager packageManager4 = packageManager2;
            String str8 = string5;
            if (str2 != null) {
                int i14 = jo.a.f69615a;
                jo.a.b();
                ToolResult toolResultLaunchWithSearch = launchWithSearch(context, packageManager4, strResolvePackage, str8, str2);
                packageManager = packageManager4;
                if (toolResultLaunchWithSearch instanceof ToolResult.Success) {
                    Log.i(jo.a.b(), "open_app: ✅ SUCCESS via ACTION_SEARCH");
                    return toolResultLaunchWithSearch;
                }
            } else {
                packageManager = packageManager4;
            }
            if (str5 == null && str4 == null) {
                context2 = context;
                str = str8;
            } else {
                int i15 = jo.a.f69615a;
                jo.a.b();
                context2 = context;
                str = str8;
                ToolResult toolResultLaunchWithSend = launchWithSend(context2, strResolvePackage, str, str5, str4);
                if (toolResultLaunchWithSend instanceof ToolResult.Success) {
                    Log.i(jo.a.b(), "open_app: ✅ SUCCESS via send intent");
                    return toolResultLaunchWithSend;
                }
            }
            int i16 = jo.a.f69615a;
            Log.w(jo.a.b(), "open_app: ⚠️ all deep links failed for " + str + " — falling back to plain launch");
            Intent launchIntentForPackage2 = packageManager.getLaunchIntentForPackage(strResolvePackage);
            if (launchIntentForPackage2 == null) {
                return new ToolResult.Error(c0.k("App cannot be launched: ", str), "no_launcher");
            }
            launchIntentForPackage2.setFlags(268435456);
            context2.startActivity(launchIntentForPackage2);
            return new ToolResult.Success(MapsKt.j0(new Pair("app", str), new Pair("package", strResolvePackage)), c0.n("Opened ", str, " — ", str2 != null ? c1.m(AbstractJsonLexerKt.STRING, "search for \"", str2) : str5 != null ? "send message" : "continue", " manually"));
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

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v2 */
        /* JADX WARN: Type inference failed for: r3v3 */
        /* JADX WARN: Type inference failed for: r3v4, types: [java.lang.Object] */
        @Nullable
        public final String resolvePackage(@NotNull PackageManager pm2, @Nullable String packageName, @Nullable String appName) {
            Object next;
            ActivityInfo activityInfo;
            Object next2;
            ResolveInfo next3;
            Intrinsics.g(pm2, "pm");
            if (packageName != null) {
                if (pm2.getLaunchIntentForPackage(packageName) != null) {
                    return packageName;
                }
            } else if (appName != null) {
                Intent intentAddCategory = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER");
                Intrinsics.f(intentAddCategory, "addCategory(...)");
                List<ResolveInfo> listQueryIntentActivities = pm2.queryIntentActivities(intentAddCategory, 0);
                Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
                String lowerCase = appName.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                StringBuilder sb2 = new StringBuilder("\\b");
                Regex.f72026b.getClass();
                String strQuote = Pattern.quote(lowerCase);
                Intrinsics.f(strQuote, "quote(...)");
                sb2.append(strQuote);
                sb2.append("\\b");
                Regex regex = new Regex(sb2.toString());
                List<ResolveInfo> list = listQueryIntentActivities;
                Iterator it = list.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it.next();
                    String lowerCase2 = ((ResolveInfo) next).loadLabel(pm2).toString().toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase2, "toLowerCase(...)");
                    if (lowerCase2.equals(lowerCase)) {
                        break;
                    }
                }
                ResolveInfo resolveInfo = (ResolveInfo) next;
                if (resolveInfo == null) {
                    Iterator it2 = list.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            next2 = null;
                            break;
                        }
                        next2 = it2.next();
                        String lowerCase3 = ((ResolveInfo) next2).loadLabel(pm2).toString().toLowerCase(Locale.ROOT);
                        Intrinsics.f(lowerCase3, "toLowerCase(...)");
                        if (regex.a(lowerCase3)) {
                            break;
                        }
                    }
                    resolveInfo = (ResolveInfo) next2;
                    if (resolveInfo == null) {
                        Iterator it3 = list.iterator();
                        while (true) {
                            if (!it3.hasNext()) {
                                next3 = 0;
                                break;
                            }
                            next3 = it3.next();
                            String lowerCase4 = ((ResolveInfo) next3).loadLabel(pm2).toString().toLowerCase(Locale.ROOT);
                            Intrinsics.f(lowerCase4, "toLowerCase(...)");
                            if (r70.k.K0(lowerCase4, lowerCase, false)) {
                                break;
                            }
                        }
                        resolveInfo = next3;
                    }
                }
                if (resolveInfo != null && (activityInfo = resolveInfo.activityInfo) != null) {
                    return activityInfo.packageName;
                }
            }
            return null;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public ToolDefinition toDefinition() {
            Object objA;
            try {
                int i5 = Result.f71687b;
                objA = fo.d.f55465c;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            Context context = (Context) objA;
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (context != null) {
                List listDiscover$default = PerAppFeatureCatalog.discover$default(PerAppFeatureCatalog.INSTANCE, context, false, 2, null);
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                for (Object obj : listDiscover$default) {
                    String appLabel = ((PerAppFeatureCatalog.Feature) obj).getAppLabel();
                    Object arrayList = linkedHashMap.get(appLabel);
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                        linkedHashMap.put(appLabel, arrayList);
                    }
                    ((List) arrayList).add(obj);
                }
                List listE1 = g.E1(g.D1(new Comparator() { // from class: com.instabridge.ai.tools.AiTool$OpenApp$toDefinition$$inlined$sortedByDescending$1
                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // java.util.Comparator
                    public final int compare(T t6, T t9) {
                        Iterator<T> it = ((List) ((Pair) t9).f71684b).iterator();
                        double score = 0.0d;
                        double score2 = 0.0d;
                        while (it.hasNext()) {
                            score2 += ((PerAppFeatureCatalog.Feature) it.next()).getScore();
                        }
                        Double dValueOf = Double.valueOf(score2);
                        Iterator<T> it2 = ((List) ((Pair) t6).f71684b).iterator();
                        while (it2.hasNext()) {
                            score += ((PerAppFeatureCatalog.Feature) it2.next()).getScore();
                        }
                        return e0.t(dValueOf, Double.valueOf(score));
                    }
                }, MapsKt.q0(linkedHashMap)), 15);
                if (!listE1.isEmpty()) {
                    str = "\n\nKnown app features: " + g.f1(listE1, "; ", null, null, 0, new a00.a(26), 30);
                }
            }
            return ToolDefinition.copy$default(super.toDefinition(), null, getDescription() + str, null, null, null, null, 61, null);
        }
    }

    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J4\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001e\u001a\u00020\u0018H\u0096@¢\u0006\u0002\u0010\u001fR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007R\u0014\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00050\u0016X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006 "}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenCalculator;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "knownCalculatorPackages", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class OpenCalculator extends AiTool {

        @NotNull
        public static final OpenCalculator INSTANCE = new OpenCalculator();

        @NotNull
        private static final String name = "open_calculator";

        @NotNull
        private static final String description = "Open the calculator app.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "apps";

        @NotNull
        private static final List<String> knownCalculatorPackages = ul.b.Q("com.google.android.calculator", "com.android.calculator2", "com.sec.android.app.popupcalculator", "com.miui.calculator", "com.coloros.calculator", "com.huawei.calculator", "com.vivo.calculator");
        public static final int $stable = 8;

        private OpenCalculator() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            List<String> list = knownCalculatorPackages;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            for (String str : list) {
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.addCategory("android.intent.category.LAUNCHER");
                intent.setPackage(str);
                arrayList.add(intent);
            }
            return AiTool.launchIntentWithFallbacks$default(this, context, g.t1(arrayList, ul.b.P(new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_CALCULATOR"))), "open_calculator", null, 8, null);
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) throws PackageManager.NameNotFoundException {
            Intrinsics.g(context, "context");
            PackageManager packageManager = context.getPackageManager();
            Companion companion = AiTool.INSTANCE;
            Intent intentAddCategory = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_CALCULATOR");
            Intrinsics.f(intentAddCategory, "addCategory(...)");
            if (companion.hasIntentHandler$instabridge_ai_sdk_release(context, intentAddCategory)) {
                return true;
            }
            List<String> list = knownCalculatorPackages;
            if ((list instanceof Collection) && list.isEmpty()) {
                return false;
            }
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                try {
                    packageManager.getPackageInfo((String) it.next(), 0);
                    return true;
                } catch (Exception unused) {
                }
            }
            return false;
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenCalendar;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class OpenCalendar extends AiTool {

        @NotNull
        public static final OpenCalendar INSTANCE = new OpenCalendar();

        @NotNull
        private static final String name = "open_calendar";

        @NotNull
        private static final String description = "Open the calendar app, optionally jumping to a specific date. Use when the user wants to browse the calendar (not view/create a specific event — for that use view_calendar_event / create_calendar_event).";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("date", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional ISO 8601 date or datetime to jump to (e.g. '2026-05-12' or '2026-05-12T09:00:00'). Omit to open at the current time.")))));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "calendar";
        public static final int $stable = 8;

        private OpenCalendar() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            Uri uri;
            Long dateTime = parseDateTime(map.get("date"));
            if (dateTime != null) {
                uri = Uri.parse("content://com.android.calendar/time/" + dateTime);
            } else {
                uri = Uri.parse("content://com.android.calendar/time");
            }
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(uri);
            return launchIntent(context, intent, "open_calendar", dateTime != null ? b70.k.e0(new Pair("date_ms", dateTime)) : h.f17594a);
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse("content://com.android.calendar/time"));
            return AiTool.INSTANCE.hasIntentHandler$instabridge_ai_sdk_release(context, intent);
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenContact;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OpenContact extends AiTool {

        @NotNull
        public static final OpenContact INSTANCE = new OpenContact();

        @NotNull
        private static final String name = "open_contact";

        @NotNull
        private static final String description = "Open a contact's details page.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("contact_id", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "The contact's unique identifier"))), new Pair("phone_number", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Alternative: Phone number to look up contact"))))));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "contacts";
        public static final int $stable = 8;

        private OpenContact() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            Uri uriWithAppendedPath;
            Object obj = map.get("contact_id");
            String string = obj != null ? obj.toString() : null;
            Object obj2 = map.get("phone_number");
            String string2 = obj2 != null ? obj2.toString() : null;
            if (string != null) {
                uriWithAppendedPath = Uri.withAppendedPath(ContactsContract.Contacts.CONTENT_URI, string);
            } else {
                if (string2 == null) {
                    return new ToolResult.Error("Missing contact_id or phone_number", "missing_parameter");
                }
                uriWithAppendedPath = Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(string2));
            }
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(uriWithAppendedPath);
            return AiTool.launchIntent$default(this, context, intent, "contact_opened", null, 8, null);
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenDisplaySettings;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OpenDisplaySettings extends AiTool {

        @NotNull
        public static final OpenDisplaySettings INSTANCE = new OpenDisplaySettings();

        @NotNull
        private static final String name = "open_display_settings";

        @NotNull
        private static final String description = "DEPRECATED: use open_settings(panel='display'). Opens display settings.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "system";
        public static final int $stable = 8;

        private OpenDisplaySettings() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            return AiTool.launchIntent$default(this, context, new Intent("android.settings.DISPLAY_SETTINGS"), "open_display_settings", null, 8, null);
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenLocationSettings;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OpenLocationSettings extends AiTool {

        @NotNull
        public static final OpenLocationSettings INSTANCE = new OpenLocationSettings();

        @NotNull
        private static final String name = "open_location_settings";

        @NotNull
        private static final String description = "DEPRECATED: use open_settings(panel='location'). Opens location/GPS settings.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "system";
        public static final int $stable = 8;

        private OpenLocationSettings() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            return AiTool.launchIntent$default(this, context, new Intent("android.settings.LOCATION_SOURCE_SETTINGS"), "open_location_settings", null, 8, null);
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

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenMaps;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class OpenMaps extends AiTool {

        @NotNull
        public static final OpenMaps INSTANCE = new OpenMaps();

        @NotNull
        private static final String name = "open_maps";

        @NotNull
        private static final String description = "Open the maps app, optionally centered on a place or coordinates. Use for non-navigating lookups (\"show me Stockholm on the map\"). For turn-by-turn directions use navigate_to; for nearby search use search_nearby.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional place name or address to look up (e.g. 'Stockholm', 'Eiffel Tower', '1600 Amphitheatre Pkwy')"))), new Pair("latitude", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "number"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional center latitude (used with longitude)"))), new Pair("longitude", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "number"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional center longitude (used with latitude)"))))));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "navigation";
        public static final int $stable = 8;

        private OpenMaps() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            Uri uri;
            String string;
            String string2;
            Object obj = map.get("query");
            String str = null;
            if (obj != null && (string = obj.toString()) != null && (string2 = r70.k.u1(string).toString()) != null && string2.length() > 0) {
                str = string2;
            }
            Double doubleArg = parseDoubleArg(map, "latitude");
            Double doubleArg2 = parseDoubleArg(map, "longitude");
            if (doubleArg != null && doubleArg2 != null && str != null) {
                uri = Uri.parse("geo:" + doubleArg + AbstractJsonLexerKt.COMMA + doubleArg2 + "?q=" + Uri.encode(str));
            } else if (doubleArg != null && doubleArg2 != null) {
                uri = Uri.parse("geo:" + doubleArg + AbstractJsonLexerKt.COMMA + doubleArg2);
            } else if (str != null) {
                uri = Uri.parse("geo:0,0?q=" + Uri.encode(str));
            } else {
                uri = Uri.parse("geo:0,0");
            }
            Intent intent = new Intent("android.intent.action.VIEW", uri);
            MapBuilder mapBuilder = new MapBuilder();
            if (str != null) {
                mapBuilder.put("query", str);
            }
            if (doubleArg != null && doubleArg2 != null) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(doubleArg);
                sb2.append(AbstractJsonLexerKt.COMMA);
                sb2.append(doubleArg2);
                mapBuilder.put("coords", sb2.toString());
            }
            return launchIntent(context, intent, "open_maps", mapBuilder.b());
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return AiTool.INSTANCE.hasGeoHandler$instabridge_ai_sdk_release(context);
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenMessages;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OpenMessages extends AiTool {

        @NotNull
        public static final OpenMessages INSTANCE = new OpenMessages();

        @NotNull
        private static final String name = "open_messages";

        @NotNull
        private static final String description = "Open the messaging/SMS app.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "apps";
        public static final int $stable = 8;

        private OpenMessages() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.MAIN");
            intent.addCategory("android.intent.category.APP_MESSAGING");
            return AiTool.launchIntent$default(this, context, intent, "open_messages", null, 8, null);
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Intent intentAddCategory = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.APP_MESSAGING");
            Intrinsics.f(intentAddCategory, "addCategory(...)");
            return context.getPackageManager().resolveActivity(intentAddCategory, 0) != null;
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenSettings;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OpenSettings extends AiTool {

        @NotNull
        public static final OpenSettings INSTANCE = new OpenSettings();

        @NotNull
        private static final String name = "open_general_settings";

        @NotNull
        private static final String description = "DEPRECATED: use open_settings(panel='general'). Kept as alias for backwards compatibility.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "system";
        public static final int $stable = 8;

        private OpenSettings() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            return AiTool.launchIntent$default(this, context, new Intent("android.settings.SETTINGS"), "open_settings", null, 8, null);
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$OpenSoundSettings;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OpenSoundSettings extends AiTool {

        @NotNull
        public static final OpenSoundSettings INSTANCE = new OpenSoundSettings();

        @NotNull
        private static final String name = "open_sound_settings";

        @NotNull
        private static final String description = "DEPRECATED: use open_settings(panel='sound'). Opens sound and volume settings.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "system";
        public static final int $stable = 8;

        private OpenSoundSettings() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            return AiTool.launchIntent$default(this, context, new Intent("android.settings.SOUND_SETTINGS"), "open_sound_settings", null, 8, null);
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

    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001e\u001a\u00020\u001fH\u0096@¢\u0006\u0002\u0010 R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082T¢\u0006\u0002\n\u0000¨\u0006!"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$ReadCalendarEvents;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "MAX_EVENTS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class ReadCalendarEvents extends AiTool {
        private static final int MAX_EVENTS = 20;

        @NotNull
        public static final ReadCalendarEvents INSTANCE = new ReadCalendarEvents();

        @NotNull
        private static final String name = "read_calendar_events";

        @NotNull
        private static final String displayName = "Read Calendar";

        @NotNull
        private static final String description = "Read the user's upcoming calendar events for a date range. Returns event titles, times, locations, and durations. Use this when the user asks about their schedule, availability, or upcoming events. IMPORTANT: Today's events are already in the inline context provided with every request — only call this tool if you need events BEYOND today, or to confirm details you can't see in the inline context. Always pass the largest days_ahead you'll need (up to 14) on the FIRST call so a single read covers your whole plan; calling this tool more than once per turn is wasteful — pick a window once and keep the result.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("days_ahead", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Number of days ahead to look (1-14, default 7). Prefer 7-14 in a single call instead of multiple narrower calls — this tool returns all events in the range at once.")))));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "calendar";
        public static final int $stable = 8;

        private ReadCalendarEvents() {
        }

        /* JADX WARN: Finally extract failed */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:44:0x012e  */
        /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
        /* JADX WARN: Type inference failed for: r27v0, types: [com.instabridge.ai.tools.AiTool, com.instabridge.ai.tools.AiTool$ReadCalendarEvents] */
        /* JADX WARN: Type inference failed for: r30v0, types: [boolean] */
        /* JADX WARN: Type inference failed for: r30v1 */
        /* JADX WARN: Type inference failed for: r30v2 */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) throws IOException {
            AiTool$ReadCalendarEvents$execute$1 aiTool$ReadCalendarEvents$execute$1;
            Object objRequirePermission;
            SimpleDateFormat simpleDateFormat;
            SimpleDateFormat simpleDateFormat2;
            Map<String, ? extends Object> map2;
            String str;
            Cursor cursorQuery;
            ArrayList arrayList;
            LinkedHashSet linkedHashSet;
            LinkedHashMap linkedHashMap;
            Cursor cursor;
            Throwable th2;
            String str2;
            int i5;
            String string;
            String str3;
            LinkedHashSet linkedHashSet2;
            String str4;
            Context context2 = context;
            String str5 = "toLowerCase(...)";
            if (continuation instanceof AiTool$ReadCalendarEvents$execute$1) {
                aiTool$ReadCalendarEvents$execute$1 = (AiTool$ReadCalendarEvents$execute$1) continuation;
                int i11 = aiTool$ReadCalendarEvents$execute$1.label;
                if ((i11 & Integer.MIN_VALUE) != 0) {
                    aiTool$ReadCalendarEvents$execute$1.label = i11 - Integer.MIN_VALUE;
                } else {
                    aiTool$ReadCalendarEvents$execute$1 = new AiTool$ReadCalendarEvents$execute$1(this, continuation);
                }
            }
            Object obj = aiTool$ReadCalendarEvents$execute$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i12 = aiTool$ReadCalendarEvents$execute$1.label;
            int i13 = 1;
            if (i12 == 0) {
                ResultKt.b(obj);
                SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat("EEE MMM d", Locale.getDefault());
                SimpleDateFormat simpleDateFormat4 = new SimpleDateFormat("h:mm a", Locale.getDefault());
                aiTool$ReadCalendarEvents$execute$1.L$0 = context2;
                aiTool$ReadCalendarEvents$execute$1.L$1 = map;
                aiTool$ReadCalendarEvents$execute$1.L$2 = simpleDateFormat3;
                aiTool$ReadCalendarEvents$execute$1.L$3 = simpleDateFormat4;
                aiTool$ReadCalendarEvents$execute$1.label = 1;
                objRequirePermission = requirePermission(context2, "android.permission.READ_CALENDAR", z11, aiTool$ReadCalendarEvents$execute$1);
                if (objRequirePermission == coroutineSingletons) {
                    return coroutineSingletons;
                }
                simpleDateFormat = simpleDateFormat3;
                simpleDateFormat2 = simpleDateFormat4;
                map2 = map;
            } else {
                if (i12 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                SimpleDateFormat simpleDateFormat5 = (SimpleDateFormat) aiTool$ReadCalendarEvents$execute$1.L$3;
                simpleDateFormat = (SimpleDateFormat) aiTool$ReadCalendarEvents$execute$1.L$2;
                map2 = (Map) aiTool$ReadCalendarEvents$execute$1.L$1;
                Context context3 = (Context) aiTool$ReadCalendarEvents$execute$1.L$0;
                ResultKt.b(obj);
                simpleDateFormat2 = simpleDateFormat5;
                context2 = context3;
                objRequirePermission = obj;
            }
            String str6 = "permission_denied";
            String str7 = "Calendar permission not granted";
            if (!((Boolean) objRequirePermission).booleanValue()) {
                return new ToolResult.Error("Calendar permission not granted", "permission_denied");
            }
            String str8 = "days_ahead";
            Integer intArg = parseIntArg(map2, "days_ahead");
            int iE0 = kotlin.ranges.a.e0(intArg != null ? intArg.intValue() : 7, 1, 14);
            try {
                try {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    str = null;
                    cursorQuery = context2.getContentResolver().query(CalendarContract.Instances.CONTENT_URI.buildUpon().appendPath(String.valueOf(jCurrentTimeMillis)).appendPath(String.valueOf((86400 * iE0 * 1000) + jCurrentTimeMillis)).build(), new String[]{"title", "begin", "end", "eventLocation", "allDay"}, null, null, "begin ASC");
                    arrayList = new ArrayList();
                    linkedHashSet = new LinkedHashSet();
                    linkedHashMap = new LinkedHashMap();
                } catch (SecurityException unused) {
                    z11 = "permission_denied";
                    str = "Calendar permission not granted";
                }
                try {
                    if (cursorQuery != null) {
                        while (cursorQuery.moveToNext() && arrayList.size() < 20) {
                            try {
                                string = cursorQuery.getString(0);
                            } catch (Throwable th3) {
                                th = th3;
                            }
                            if (string != null) {
                                long j11 = cursorQuery.getLong(i13);
                                String str9 = str6;
                                try {
                                    long j12 = cursorQuery.getLong(2);
                                    String string2 = cursorQuery.getString(3);
                                    if (string2 != null) {
                                        try {
                                            if (r70.k.U0(string2)) {
                                                string2 = null;
                                            }
                                            str3 = str7;
                                        } catch (Throwable th4) {
                                            th2 = th4;
                                            cursor = cursorQuery;
                                        }
                                        try {
                                            String str10 = str8;
                                            boolean z12 = cursorQuery.getInt(4) == 1;
                                            StringBuilder sb2 = new StringBuilder();
                                            boolean z13 = z12;
                                            Locale locale = Locale.ROOT;
                                            int i14 = iE0;
                                            cursor = cursorQuery;
                                            try {
                                                String lowerCase = string.toLowerCase(locale);
                                                Intrinsics.f(lowerCase, str5);
                                                sb2.append(lowerCase);
                                                sb2.append('|');
                                                sb2.append(j11);
                                                sb2.append('|');
                                                sb2.append(j12);
                                                if (linkedHashSet.add(sb2.toString())) {
                                                    String lowerCase2 = string.toLowerCase(locale);
                                                    Intrinsics.f(lowerCase2, str5);
                                                    long j13 = j11 / 3600000;
                                                    String str11 = str5;
                                                    List list = (List) linkedHashMap.get(new Long(j13));
                                                    if (list != null) {
                                                        List list2 = list;
                                                        linkedHashSet2 = linkedHashSet;
                                                        if (!(list2 instanceof Collection) || !list2.isEmpty()) {
                                                            Iterator it = list2.iterator();
                                                            while (it.hasNext()) {
                                                                Iterator it2 = it;
                                                                if (INSTANCE.similarText((String) it.next(), lowerCase2) >= 0.95d) {
                                                                    break;
                                                                }
                                                                it = it2;
                                                            }
                                                        }
                                                    } else {
                                                        linkedHashSet2 = linkedHashSet;
                                                    }
                                                    Long l9 = new Long(j13);
                                                    Object arrayList2 = linkedHashMap.get(l9);
                                                    if (arrayList2 == null) {
                                                        arrayList2 = new ArrayList();
                                                        linkedHashMap.put(l9, arrayList2);
                                                    }
                                                    ((Collection) arrayList2).add(lowerCase2);
                                                    LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("title", string), new Pair("date", simpleDateFormat.format(new Date(j11))), new Pair("all_day", Boolean.valueOf(z13)));
                                                    if (!z13) {
                                                        linkedHashMapK0.put("start_time", simpleDateFormat2.format(new Date(j11)));
                                                        linkedHashMapK0.put("end_time", simpleDateFormat2.format(new Date(j12)));
                                                        int i15 = (int) ((j12 - j11) / 60000);
                                                        if (i15 > 0) {
                                                            linkedHashMapK0.put("duration_minutes", new Integer(i15));
                                                        }
                                                    }
                                                    if (string2 != null) {
                                                        linkedHashMapK0.put("location", string2);
                                                    }
                                                    arrayList.add(linkedHashMapK0);
                                                    cursorQuery = cursor;
                                                    str6 = str9;
                                                    str7 = str3;
                                                    str8 = str10;
                                                    iE0 = i14;
                                                    str5 = str11;
                                                    linkedHashSet = linkedHashSet2;
                                                } else {
                                                    cursorQuery = cursor;
                                                    str6 = str9;
                                                    str7 = str3;
                                                    str8 = str10;
                                                    iE0 = i14;
                                                }
                                                i13 = 1;
                                            } catch (Throwable th5) {
                                                th = th5;
                                                th2 = th;
                                                throw th2;
                                            }
                                        } catch (Throwable th6) {
                                            th = th6;
                                            cursor = cursorQuery;
                                            th2 = th;
                                            throw th2;
                                        }
                                    }
                                } catch (Throwable th7) {
                                    th = th7;
                                    cursor = cursorQuery;
                                    th2 = th;
                                    throw th2;
                                }
                                try {
                                    throw th2;
                                } catch (Throwable th8) {
                                    CloseableKt.a(cursor, th2);
                                    throw th8;
                                }
                            }
                        }
                        str2 = str8;
                        i5 = iE0;
                        cursor = cursorQuery;
                        Unit unit = Unit.f71706a;
                        cursor.close();
                    } else {
                        str2 = "days_ahead";
                        i5 = iE0;
                    }
                    int i16 = i5;
                    Map mapJ0 = MapsKt.j0(new Pair(DatabaseConstants.EVENT_TABLE_NAME, arrayList), new Pair("count", new Integer(arrayList.size())), new Pair(str2, new Integer(i16)));
                    if (arrayList.isEmpty()) {
                        str4 = "No events found in the next " + i16 + " day(s)";
                    } else {
                        str4 = arrayList.size() + " event(s) in the next " + i16 + " day(s)";
                    }
                    return new ToolResult.Success(mapJ0, str4);
                } catch (SecurityException unused2) {
                    return new ToolResult.Error(str, z11);
                }
            } catch (Exception e3) {
                return new ToolResult.Error(c1.s(e3, new StringBuilder("Failed to read calendar: ")), "execution_failed");
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001c\u001a\u00020\u001dH\u0096@¢\u0006\u0002\u0010\u001eR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$ReadNotifications;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class ReadNotifications extends AiTool {

        @NotNull
        public static final ReadNotifications INSTANCE = new ReadNotifications();

        @NotNull
        private static final String name = "read_notifications";

        @NotNull
        private static final String displayName = "Read Notifications";

        @NotNull
        private static final String description = "Read the user's current unread notifications. Returns the title, text content, app name, and time for each notification. Use this when the user asks about messages, alerts, or wants to know what they missed.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("app_filter", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional: filter by app name to only show notifications from a specific app")))));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "notifications";
        public static final int $stable = 8;

        private ReadNotifications() {
        }

        /* JADX WARN: Removed duplicated region for block: B:26:0x006e  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            String str;
            PackageManager packageManager;
            Map mapJ0;
            Bundle bundle;
            CharSequence charSequence;
            String string;
            Object obj = map.get("app_filter");
            String string2 = obj != null ? obj.toString() : null;
            PackageManager packageManager2 = context.getPackageManager();
            StatusBarNotification[] activeNotificationsSafe = AiNotificationListenerService.INSTANCE.getActiveNotificationsSafe();
            if (activeNotificationsSafe == null) {
                return new ToolResult.Error("Notification access not available. The user needs to grant notification access in settings.", "permission_denied");
            }
            ArrayList arrayList = new ArrayList();
            int length = activeNotificationsSafe.length;
            int i5 = 0;
            while (i5 < length) {
                StatusBarNotification statusBarNotification = activeNotificationsSafe[i5];
                try {
                    bundle = statusBarNotification.getNotification().extras;
                    charSequence = bundle.getCharSequence("android.title");
                } catch (Exception unused) {
                }
                if (charSequence == null || (string = charSequence.toString()) == null) {
                    packageManager = packageManager2;
                    mapJ0 = null;
                } else {
                    CharSequence charSequence2 = bundle.getCharSequence("android.text");
                    String string3 = charSequence2 != null ? charSequence2.toString() : null;
                    String string4 = packageManager2.getApplicationLabel(packageManager2.getApplicationInfo(statusBarNotification.getPackageName(), 0)).toString();
                    if (string2 == null || r70.k.K0(string4, string2, true)) {
                        Pair pair = new Pair("app", string4);
                        Pair pair2 = new Pair("title", string);
                        if (string3 == null) {
                            string3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        packageManager = packageManager2;
                        try {
                            mapJ0 = MapsKt.j0(pair, pair2, new Pair("text", string3), new Pair("time", new SimpleDateFormat("h:mm a", Locale.getDefault()).format(new Date(statusBarNotification.getPostTime()))), new Pair("package", statusBarNotification.getPackageName()));
                        } catch (Exception unused2) {
                        }
                    }
                    mapJ0 = null;
                }
                if (mapJ0 != null) {
                    arrayList.add(mapJ0);
                }
                i5++;
                packageManager2 = packageManager;
            }
            List listE1 = g.E1(arrayList, 20);
            Map mapJ02 = MapsKt.j0(new Pair("notifications", listE1), new Pair("count", new Integer(listE1.size())));
            if (listE1.isEmpty()) {
                str = "No notifications";
            } else {
                str = listE1.size() + " notification(s)";
            }
            return new ToolResult.Success(mapJ02, str);
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

    @Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\t\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u001dH\u0096@¢\u0006\u0002\u0010\u001eJV\u0010\u001f\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u000b0 2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u00052\u001a\u0010\"\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u000b0 2\u0006\u0010\u001c\u001a\u00020\u001dH\u0082@¢\u0006\u0002\u0010#J2\u0010$\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u000b0 2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u0005H\u0082@¢\u0006\u0002\u0010%J,\u0010&\u001a\u00020\u00182\u0006\u0010!\u001a\u00020\u00052\u001a\u0010\"\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u000b0 H\u0002J,\u0010'\u001a\u0018\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u000b\u0018\u00010 2\u0006\u0010!\u001a\u00020\u0005H\u0082@¢\u0006\u0002\u0010(R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082T¢\u0006\u0002\n\u0000¨\u0006)"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SearchContacts;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "MAX_RESULTS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "maybeDisambiguate", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "query", "contacts", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "fetchMergedContacts", "(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "successFor", "searchViaProvider", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class SearchContacts extends AiTool {
        private static final int MAX_RESULTS = 10;

        @NotNull
        public static final SearchContacts INSTANCE = new SearchContacts();

        @NotNull
        private static final String name = "search_contacts";

        @NotNull
        private static final String description = "Search the user's contacts by name or phone number and return matching contact names, phone numbers, and emails. Useful for retrieving full contact details or checking if a contact exists. Other tools (make_call, send_sms, compose_email, send_message, create_calendar_event) resolve contacts automatically — you do NOT need to call search_contacts first. Pass a SPECIFIC name or number you are looking for (e.g. \"Per\", \"Johanna\", \"+46…\"); generic queries like \"developer tech music\" or \"recent communication\" return zero results — contacts have names and numbers, not interest tags. If you don't have a specific name in mind, do not call this tool.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "A specific contact name (\"Per\", \"Sandy\") or phone number. Generic interest/topic queries return nothing.")))), new Pair("required", ul.b.P("query")));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "contacts";
        public static final int $stable = 8;

        private SearchContacts() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object fetchMergedContacts(Context context, String str, Continuation<? super List<? extends Map<String, String>>> continuation) throws IOException {
            AiTool$SearchContacts$fetchMergedContacts$1 aiTool$SearchContacts$fetchMergedContacts$1;
            Context context2;
            List<SendMessageTool.ResolvedContact> list;
            if (continuation instanceof AiTool$SearchContacts$fetchMergedContacts$1) {
                aiTool$SearchContacts$fetchMergedContacts$1 = (AiTool$SearchContacts$fetchMergedContacts$1) continuation;
                int i5 = aiTool$SearchContacts$fetchMergedContacts$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$SearchContacts$fetchMergedContacts$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$SearchContacts$fetchMergedContacts$1 = new AiTool$SearchContacts$fetchMergedContacts$1(this, continuation);
                }
            }
            Object obj = aiTool$SearchContacts$fetchMergedContacts$1.result;
            Object obj2 = CoroutineSingletons.f71806a;
            int i11 = aiTool$SearchContacts$fetchMergedContacts$1.label;
            if (i11 == 0) {
                ResultKt.b(obj);
                List<SendMessageTool.ResolvedContact> listSearchContactsByName$instabridge_ai_sdk_release = SendMessageTool.INSTANCE.searchContactsByName$instabridge_ai_sdk_release(context, str);
                aiTool$SearchContacts$fetchMergedContacts$1.L$0 = context;
                aiTool$SearchContacts$fetchMergedContacts$1.L$1 = listSearchContactsByName$instabridge_ai_sdk_release;
                aiTool$SearchContacts$fetchMergedContacts$1.label = 1;
                Object objSearchViaProvider = searchViaProvider(str, aiTool$SearchContacts$fetchMergedContacts$1);
                if (objSearchViaProvider == obj2) {
                    return obj2;
                }
                context2 = context;
                list = listSearchContactsByName$instabridge_ai_sdk_release;
                obj = objSearchViaProvider;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                list = (List) aiTool$SearchContacts$fetchMergedContacts$1.L$1;
                context2 = (Context) aiTool$SearchContacts$fetchMergedContacts$1.L$0;
                ResultKt.b(obj);
            }
            List list2 = (List) obj;
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            ArrayList arrayList = new ArrayList();
            if (list2 == null) {
                list2 = EmptyList.f71733a;
            }
            List<SendMessageTool.ResolvedContact> list3 = list;
            ArrayList arrayList2 = new ArrayList(b70.c.u0(list3, 10));
            for (SendMessageTool.ResolvedContact resolvedContact : list3) {
                String str2 = (String) g.Y0(resolvedContact.getPhones());
                String countryForNumber = null;
                String strNormalizePhone = str2 != null ? SendMessageTool.normalizePhone(str2, context2) : null;
                if (strNormalizePhone != null) {
                    countryForNumber = PhoneNumberNormalizer.INSTANCE.getCountryForNumber(strNormalizePhone);
                }
                arrayList2.add(MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, resolvedContact.getName()), new Pair("phone_number", strNormalizePhone), new Pair("country", countryForNumber), new Pair(TTConst.TRACK_TYPE, "mobile")));
            }
            Iterator it = ul.b.Q(list2, arrayList2).iterator();
            while (it.hasNext()) {
                for (Map map : (List) it.next()) {
                    if (linkedHashSet.add(((String) map.get(PendingUpgradeStore.KEY_NAME)) + '|' + ((String) map.get("phone_number")))) {
                        arrayList.add(map);
                    }
                }
            }
            return arrayList;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object maybeDisambiguate(Context context, String str, List<? extends Map<String, String>> list, boolean z11, Continuation<? super List<? extends Map<String, String>>> continuation) {
            AiTool$SearchContacts$maybeDisambiguate$1 aiTool$SearchContacts$maybeDisambiguate$1;
            Activity activityFindActivity;
            List list2;
            if (continuation instanceof AiTool$SearchContacts$maybeDisambiguate$1) {
                aiTool$SearchContacts$maybeDisambiguate$1 = (AiTool$SearchContacts$maybeDisambiguate$1) continuation;
                int i5 = aiTool$SearchContacts$maybeDisambiguate$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$SearchContacts$maybeDisambiguate$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$SearchContacts$maybeDisambiguate$1 = new AiTool$SearchContacts$maybeDisambiguate$1(this, continuation);
                }
            }
            Object objShow = aiTool$SearchContacts$maybeDisambiguate$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aiTool$SearchContacts$maybeDisambiguate$1.label;
            if (i11 == 0) {
                ResultKt.b(objShow);
                if (z11) {
                    HashSet hashSet = new HashSet();
                    ArrayList<Map> arrayList = new ArrayList();
                    for (Object obj : list) {
                        if (hashSet.add((String) ((Map) obj).get(PendingUpgradeStore.KEY_NAME))) {
                            arrayList.add(obj);
                        }
                    }
                    if (arrayList.size() > 1 && (activityFindActivity = ContextUtilsKt.findActivity(context)) != null && !activityFindActivity.isFinishing() && !activityFindActivity.isDestroyed()) {
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                        for (Map map : arrayList) {
                            String str2 = (String) map.get("phone_number");
                            if (str2 == null && (str2 = (String) map.get("country")) == null) {
                                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            String str3 = (String) map.get(PendingUpgradeStore.KEY_NAME);
                            if (str3 == null) {
                                str3 = "Unknown";
                            }
                            arrayList2.add(new Pair(str3, str2));
                        }
                        ContactDisambiguationDialog contactDisambiguationDialog = ContactDisambiguationDialog.INSTANCE;
                        aiTool$SearchContacts$maybeDisambiguate$1.L$0 = list;
                        aiTool$SearchContacts$maybeDisambiguate$1.L$1 = arrayList2;
                        aiTool$SearchContacts$maybeDisambiguate$1.label = 1;
                        objShow = contactDisambiguationDialog.show(activityFindActivity, str, arrayList2, aiTool$SearchContacts$maybeDisambiguate$1);
                        if (objShow == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        list2 = arrayList2;
                    }
                }
                return list;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list2 = (List) aiTool$SearchContacts$maybeDisambiguate$1.L$1;
            list = (List) aiTool$SearchContacts$maybeDisambiguate$1.L$0;
            ResultKt.b(objShow);
            int iIntValue = ((Number) objShow).intValue();
            if (iIntValue >= 0 && iIntValue < list2.size()) {
                String str4 = (String) ((Pair) list2.get(iIntValue)).f71683a;
                ArrayList arrayList3 = new ArrayList();
                for (Object obj2 : list) {
                    if (Intrinsics.b(((Map) obj2).get(PendingUpgradeStore.KEY_NAME), str4)) {
                        arrayList3.add(obj2);
                    }
                }
                return arrayList3;
            }
            return list;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object searchViaProvider(String str, Continuation<? super List<? extends Map<String, String>>> continuation) {
            AiTool$SearchContacts$searchViaProvider$1 aiTool$SearchContacts$searchViaProvider$1;
            String phoneNumber;
            if (continuation instanceof AiTool$SearchContacts$searchViaProvider$1) {
                aiTool$SearchContacts$searchViaProvider$1 = (AiTool$SearchContacts$searchViaProvider$1) continuation;
                int i5 = aiTool$SearchContacts$searchViaProvider$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$SearchContacts$searchViaProvider$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$SearchContacts$searchViaProvider$1 = new AiTool$SearchContacts$searchViaProvider$1(this, continuation);
                }
            }
            Object obj = aiTool$SearchContacts$searchViaProvider$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aiTool$SearchContacts$searchViaProvider$1.label;
            if (i11 == 0) {
                ResultKt.b(obj);
                y70.d dVar = fo.d.f55463a;
                return null;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Set set = (Set) aiTool$SearchContacts$searchViaProvider$1.L$1;
            Context context = (Context) aiTool$SearchContacts$searchViaProvider$1.L$0;
            ResultKt.b(obj);
            ArrayList arrayList = new ArrayList();
            for (ContactsProvider.ContactResult contactResult : (Iterable) obj) {
                if (context == null || contactResult.getPhoneNumber() == null) {
                    phoneNumber = contactResult.getPhoneNumber();
                } else {
                    phoneNumber = SendMessageTool.normalizePhone(contactResult.getPhoneNumber(), context);
                    if (phoneNumber.length() == 0) {
                        phoneNumber = contactResult.getPhoneNumber();
                    }
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append(contactResult.getName());
                sb2.append('|');
                sb2.append(phoneNumber);
                Map mapJ0 = !set.add(sb2.toString()) ? null : MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, contactResult.getName()), new Pair("phone_number", phoneNumber), new Pair(TTConst.TRACK_TYPE, contactResult.getPhoneType()));
                if (mapJ0 != null) {
                    arrayList.add(mapJ0);
                }
            }
            return arrayList;
        }

        /* JADX WARN: Multi-variable type inference failed */
        private final ToolResult successFor(String query, List<? extends Map<String, String>> contacts) {
            Pair pair = new Pair("query", query);
            int size = contacts.size();
            if (size > 10) {
                size = 10;
            }
            return new ToolResult.Success(MapsKt.j0(pair, new Pair("count", Integer.valueOf(size)), new Pair("contacts", g.E1(contacts, 10))), null, 2, 0 == true ? 1 : 0);
        }

        /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            AiTool$SearchContacts$execute$1 aiTool$SearchContacts$execute$1;
            Exception exc;
            String str;
            String str2;
            boolean z12;
            List<? extends Map<String, String>> list;
            String string;
            String string2;
            if (continuation instanceof AiTool$SearchContacts$execute$1) {
                aiTool$SearchContacts$execute$1 = (AiTool$SearchContacts$execute$1) continuation;
                int i5 = aiTool$SearchContacts$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$SearchContacts$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$SearchContacts$execute$1 = new AiTool$SearchContacts$execute$1(this, continuation);
                }
            }
            AiTool$SearchContacts$execute$1 aiTool$SearchContacts$execute$12 = aiTool$SearchContacts$execute$1;
            Object objMaybeDisambiguate = aiTool$SearchContacts$execute$12.result;
            Object obj = CoroutineSingletons.f71806a;
            int i11 = aiTool$SearchContacts$execute$12.label;
            try {
                if (i11 != 0) {
                    try {
                        if (i11 != 1) {
                            if (i11 != 2) {
                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            str2 = (String) aiTool$SearchContacts$execute$12.L$0;
                            ResultKt.b(objMaybeDisambiguate);
                            return successFor(str2, (List) objMaybeDisambiguate);
                        }
                        z11 = aiTool$SearchContacts$execute$12.Z$0;
                        String str3 = (String) aiTool$SearchContacts$execute$12.L$1;
                        Context context2 = (Context) aiTool$SearchContacts$execute$12.L$0;
                        ResultKt.b(objMaybeDisambiguate);
                        str = str3;
                        context = context2;
                    } catch (Exception e3) {
                        exc = e3;
                        return new ToolResult.Error(c1.s(exc, new StringBuilder("Failed to search contacts: ")), "execution_failed");
                    }
                } else {
                    ResultKt.b(objMaybeDisambiguate);
                    Object obj2 = map.get("query");
                    if (obj2 == null || (string = obj2.toString()) == null || (string2 = r70.k.u1(string).toString()) == null) {
                        return new ToolResult.Error("Missing query parameter", "missing_parameter");
                    }
                    if (string2.length() == 0) {
                        return new ToolResult.Error("Search query cannot be empty", "invalid_parameter");
                    }
                    try {
                        aiTool$SearchContacts$execute$12.L$0 = context;
                        aiTool$SearchContacts$execute$12.L$1 = string2;
                        aiTool$SearchContacts$execute$12.Z$0 = z11;
                        aiTool$SearchContacts$execute$12.label = 1;
                        objMaybeDisambiguate = fetchMergedContacts(context, string2, aiTool$SearchContacts$execute$12);
                        if (objMaybeDisambiguate == obj) {
                            return obj;
                        }
                        str = string2;
                    } catch (Exception e11) {
                        e = e11;
                        exc = e;
                        return new ToolResult.Error(c1.s(exc, new StringBuilder("Failed to search contacts: ")), "execution_failed");
                    }
                }
                objMaybeDisambiguate = maybeDisambiguate(context, str, list, z12, aiTool$SearchContacts$execute$12);
                if (objMaybeDisambiguate != obj) {
                    str2 = str;
                    return successFor(str2, (List) objMaybeDisambiguate);
                }
                return obj;
            } catch (SecurityException unused) {
                return new ToolResult.Error("Contacts permission not granted", "permission_denied");
            } catch (Exception e12) {
                e = e12;
                exc = e;
                return new ToolResult.Error(c1.s(exc, new StringBuilder("Failed to search contacts: ")), "execution_failed");
            }
            z12 = z11;
            list = (List) objMaybeDisambiguate;
            aiTool$SearchContacts$execute$12.L$0 = str;
            aiTool$SearchContacts$execute$12.L$1 = null;
            aiTool$SearchContacts$execute$12.label = 2;
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

    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001e\u001a\u00020\u001fH\u0096@¢\u0006\u0002\u0010 R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082T¢\u0006\u0002\n\u0000¨\u0006!"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SearchDevice;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "MAX_RESULTS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class SearchDevice extends AiTool {
        private static final int MAX_RESULTS = 10;

        @NotNull
        public static final SearchDevice INSTANCE = new SearchDevice();

        @NotNull
        private static final String name = "search_device";

        @NotNull
        private static final String displayName = "Search Phone";

        @NotNull
        private static final String description = "Fuzzy keyword search across the user's installed apps. Returns matching app names and package names (max 10). DO NOT use this to check whether a specific app is installed — the model already has the full installed_apps list in its context, so checking that list directly is faster and cheaper than calling this tool. DO use this for vague, keyword-driven discovery when the user has not named a specific app, e.g., 'something for journaling', 'a stretching app', 'photo editor'. DO use this when you need to disambiguate between similarly named apps (e.g., multiple 'Camera' apps from different OEMs). If you already know the package name from the installed_apps context, skip this tool and call open_app directly. Pass ONE concept per call (e.g. 'foodora', 'running', 'photo editor'). Multi-keyword queries like 'food delivery lunch apps' or 'Runkeeper Spotify Play Console GitHub' match nothing because the matcher looks for a single substring per app name. If you need multiple categories, call this tool once per category — but check installed_apps in context FIRST.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Search query (app name or keyword)")))), new Pair("required", ul.b.P("query")));

        @NotNull
        private static final ToolType toolType = ToolType.INFO_RETRIEVAL;

        @NotNull
        private static final String category = "search";
        public static final int $stable = 8;

        private SearchDevice() {
        }

        /* JADX WARN: Removed duplicated region for block: B:51:0x015f  */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            AiTool$SearchDevice$execute$1 aiTool$SearchDevice$execute$1;
            String string;
            Map mapJ0;
            if (continuation instanceof AiTool$SearchDevice$execute$1) {
                aiTool$SearchDevice$execute$1 = (AiTool$SearchDevice$execute$1) continuation;
                int i5 = aiTool$SearchDevice$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$SearchDevice$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$SearchDevice$execute$1 = new AiTool$SearchDevice$execute$1(this, continuation);
                }
            }
            Object obj = aiTool$SearchDevice$execute$1.result;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = aiTool$SearchDevice$execute$1.label;
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                String str = (String) aiTool$SearchDevice$execute$1.L$0;
                ResultKt.b(obj);
                Iterable<DeviceSearchResult> iterable = (Iterable) obj;
                ArrayList arrayList = new ArrayList(b70.c.u0(iterable, 10));
                for (DeviceSearchResult deviceSearchResult : iterable) {
                    MapBuilder mapBuilder = new MapBuilder();
                    mapBuilder.put(PendingUpgradeStore.KEY_NAME, deviceSearchResult.getTitle());
                    String subtitle = deviceSearchResult.getSubtitle();
                    if (subtitle != null) {
                    }
                    mapBuilder.put(TTConst.TRACK_TYPE, deviceSearchResult.getType());
                    String packageName = deviceSearchResult.getPackageName();
                    if (packageName != null) {
                        mapBuilder.put("package", packageName);
                    }
                    arrayList.add(mapBuilder.b());
                }
                return new ToolResult.Success(MapsKt.j0(new Pair("results", arrayList), new Pair("count", new Integer(arrayList.size()))), arrayList.isEmpty() ? c1.m('\'', "No results found for '", str) : "Found " + arrayList.size() + " result(s) for '" + str + '\'');
            }
            ResultKt.b(obj);
            Object obj2 = map.get("query");
            if (obj2 == null || (string = obj2.toString()) == null) {
                return new ToolResult.Error("Missing query", "missing_parameter");
            }
            y70.d dVar = fo.d.f55463a;
            PackageManager packageManager = context.getPackageManager();
            List<ApplicationInfo> installedApplications = packageManager.getInstalledApplications(0);
            Intrinsics.f(installedApplications, "getInstalledApplications(...)");
            ArrayList arrayList2 = new ArrayList();
            for (Object obj3 : installedApplications) {
                ApplicationInfo applicationInfo = (ApplicationInfo) obj3;
                if ((applicationInfo.flags & 1) == 0 || packageManager.getLaunchIntentForPackage(applicationInfo.packageName) != null) {
                    arrayList2.add(obj3);
                }
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it = arrayList2.iterator();
            while (it.hasNext()) {
                ApplicationInfo applicationInfo2 = (ApplicationInfo) it.next();
                String string2 = packageManager.getApplicationLabel(applicationInfo2).toString();
                if (!r70.k.K0(string2, string, true)) {
                    String packageName2 = applicationInfo2.packageName;
                    Intrinsics.f(packageName2, "packageName");
                    mapJ0 = r70.k.K0(packageName2, string, true) ? MapsKt.j0(new Pair(PendingUpgradeStore.KEY_NAME, string2), new Pair("package", applicationInfo2.packageName)) : null;
                }
                if (mapJ0 != null) {
                    arrayList3.add(mapJ0);
                }
            }
            List listE1 = g.E1(arrayList3, 10);
            return new ToolResult.Success(MapsKt.j0(new Pair("results", listE1), new Pair("count", new Integer(listE1.size()))), listE1.isEmpty() ? c1.m('\'', "No apps found matching '", string) : "Found " + listE1.size() + " app(s) matching '" + string + '\'');
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

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SearchNearby;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SearchNearby extends AiTool {

        @NotNull
        public static final SearchNearby INSTANCE = new SearchNearby();

        @NotNull
        private static final String name = "search_nearby";

        @NotNull
        private static final String description = "Search for nearby places using the device's current GPS location. Opens a maps app with results near the user. The device location is used automatically — no coordinates or address needed from the user.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "What to search for (e.g., 'restaurants', 'gas stations')"))), new Pair("latitude", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "number"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional: Center latitude (device GPS used if omitted)"))), new Pair("longitude", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "number"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional: Center longitude (device GPS used if omitted)"))))), new Pair("required", ul.b.P("query")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "navigation";
        public static final int $stable = 8;

        private SearchNearby() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            String string;
            Uri uri;
            Object obj = map.get("query");
            if (obj == null || (string = obj.toString()) == null) {
                return new ToolResult.Error("Missing required parameter: query", "missing_parameter");
            }
            Double doubleArg = parseDoubleArg(map, "latitude");
            Double doubleArg2 = parseDoubleArg(map, "longitude");
            if (doubleArg == null || doubleArg2 == null) {
                uri = Uri.parse("geo:0,0?q=" + Uri.encode(string));
            } else {
                uri = Uri.parse("geo:" + doubleArg + AbstractJsonLexerKt.COMMA + doubleArg2 + "?q=" + Uri.encode(string));
            }
            return launchIntent(context, new Intent("android.intent.action.VIEW", uri), "search_nearby", m.n("query", string));
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return AiTool.INSTANCE.hasGeoHandler$instabridge_ai_sdk_release(context);
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J4\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001e\u001a\u00020\u0018H\u0096@¢\u0006\u0002\u0010\u001fR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007¨\u0006 "}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SearchPlayStore;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SearchPlayStore extends AiTool {

        @NotNull
        public static final SearchPlayStore INSTANCE = new SearchPlayStore();

        @NotNull
        private static final String name = "search_play_store";

        @NotNull
        private static final String displayName = "Search Play Store";

        @NotNull
        private static final String description = "Search the Google Play Store for apps. Opens the Play Store with the search query.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "The app search query")))), new Pair("required", ul.b.P("query")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "apps";
        public static final int $stable = 8;

        private SearchPlayStore() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            String string;
            Object obj = map.get("query");
            if (obj == null || (string = obj.toString()) == null) {
                return new ToolResult.Error("Missing query", "missing_parameter");
            }
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("market://search?q=" + Uri.encode(string)));
            intent.addFlags(268435456);
            return launchIntent(context, intent, "play_store_opened", b70.k.e0(new Pair("query", string)));
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return AiTool.INSTANCE.hasMarketHandler$instabridge_ai_sdk_release(context);
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J&\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\rH\u0016J4\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001e\u001a\u00020\u0018H\u0096@¢\u0006\u0002\u0010\u001fR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007¨\u0006 "}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SearchWeb;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "canExecute", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "args", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SearchWeb extends AiTool {

        @NotNull
        public static final SearchWeb INSTANCE = new SearchWeb();

        @NotNull
        private static final String name = "search_web";

        @NotNull
        private static final String displayName = "Search the Web";

        @NotNull
        private static final String description = "Open a web search in the device's default browser. ALWAYS use this tool when the user asks to search the web, look something up, or find information online — do NOT answer the query inline or use built-in web grounding as a substitute. The user expects the browser to open with search results they can browse. Opens a Google search in Chrome or the default browser.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("query", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "The search query")))), new Pair("required", ul.b.P("query")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "navigation";
        public static final int $stable = 8;

        private SearchWeb() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
            Intrinsics.g(context, "context");
            Intrinsics.g(args, "args");
            Object obj = args.get("query");
            String string = obj != null ? obj.toString() : null;
            return !(string == null || r70.k.U0(string));
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            String string;
            Object obj = map.get("query");
            if (obj == null || (string = obj.toString()) == null) {
                return new ToolResult.Error("Missing query", "missing_parameter");
            }
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("https://www.google.com/search?q=" + Uri.encode(string)));
            intent.addFlags(268435456);
            return launchIntent(context, intent, "web_searched", b70.k.e0(new Pair("query", string)));
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u001b\u001a\u00020\u00162\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J4\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u001c\u001a\u00020\u001d2\u0014\u0010 \u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010!\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\"R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0016X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0014\u0010\u0019\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0007¨\u0006#"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SendSms;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "requiresConfirmation", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getRequiresConfirmation", "()Z", "category", "getCategory", "isAvailableOnDevice", "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class SendSms extends AiTool {
        private static final boolean requiresConfirmation = false;

        @NotNull
        public static final SendSms INSTANCE = new SendSms();

        @NotNull
        private static final String name = "send_sms";

        @NotNull
        private static final String displayName = "Send SMS";

        @NotNull
        private static final String description = "Open the messaging app with a pre-filled SMS. Accepts a contact NAME or phone number — resolves automatically. No need to call search_contacts first.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("phone_number", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Contact name OR phone number (e.g., 'Mom', 'Mattias', '+46701234567'). Names are resolved to phone numbers automatically."))), new Pair(PglCryptUtils.KEY_MESSAGE, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "The message content to send"))))), new Pair("required", ul.b.Q("phone_number", PglCryptUtils.KEY_MESSAGE)));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "communication";
        public static final int $stable = 8;

        private SendSms() {
        }

        /* JADX WARN: Code restructure failed: missing block: B:49:0x00e5, code lost:
        
            if (r11 == r2) goto L50;
         */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            AiTool$SendSms$execute$1 aiTool$SendSms$execute$1;
            String string;
            String string2;
            String string3;
            Object objRequirePermission;
            String strNormalizePhone;
            Object objResolvePhone;
            if (continuation instanceof AiTool$SendSms$execute$1) {
                aiTool$SendSms$execute$1 = (AiTool$SendSms$execute$1) continuation;
                int i5 = aiTool$SendSms$execute$1.label;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    aiTool$SendSms$execute$1.label = i5 - Integer.MIN_VALUE;
                } else {
                    aiTool$SendSms$execute$1 = new AiTool$SendSms$execute$1(this, continuation);
                }
            }
            Object obj = aiTool$SendSms$execute$1.result;
            Object obj2 = CoroutineSingletons.f71806a;
            int i11 = aiTool$SendSms$execute$1.label;
            try {
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Object obj3 = map.get("phone_number");
                    if (obj3 == null || (string = obj3.toString()) == null || (string2 = r70.k.u1(string).toString()) == null) {
                        return new ToolResult.Error("Missing phone_number", "missing_parameter");
                    }
                    if (r70.k.U0(string2)) {
                        return new ToolResult.Error("Empty phone_number", "missing_parameter");
                    }
                    Object obj4 = map.get(PglCryptUtils.KEY_MESSAGE);
                    if (obj4 == null || (string3 = obj4.toString()) == null) {
                        string3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    if (PhoneNumberNormalizer.INSTANCE.looksLikePhoneNumber(string2)) {
                        strNormalizePhone = SendMessageTool.normalizePhone(string2, context);
                        if (strNormalizePhone.length() != 0) {
                            string2 = strNormalizePhone;
                        }
                        Intent intent = new Intent("android.intent.action.SENDTO");
                        intent.setData(Uri.parse("smsto:".concat(string2)));
                        intent.putExtra("sms_body", string3);
                        return launchIntent(context, intent, "sms_composer_opened", m.n("message_preview", l.G1(50, string3)));
                    }
                    aiTool$SendSms$execute$1.L$0 = context;
                    aiTool$SendSms$execute$1.L$1 = string2;
                    aiTool$SendSms$execute$1.L$2 = string3;
                    aiTool$SendSms$execute$1.label = 1;
                    objRequirePermission = requirePermission(context, "android.permission.READ_CONTACTS", z11, aiTool$SendSms$execute$1);
                    if (objRequirePermission != obj2) {
                    }
                    return obj2;
                }
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    String str = (String) aiTool$SendSms$execute$1.L$2;
                    String str2 = (String) aiTool$SendSms$execute$1.L$1;
                    Context context2 = (Context) aiTool$SendSms$execute$1.L$0;
                    ResultKt.b(obj);
                    string3 = str;
                    context = context2;
                    objResolvePhone = obj;
                    string2 = str2;
                    strNormalizePhone = (String) objResolvePhone;
                    if (strNormalizePhone == null) {
                        return new ToolResult.Error("No phone number found for '" + string2 + '\'', "contact_not_found");
                    }
                    string2 = strNormalizePhone;
                    Intent intent2 = new Intent("android.intent.action.SENDTO");
                    intent2.setData(Uri.parse("smsto:".concat(string2)));
                    intent2.putExtra("sms_body", string3);
                    return launchIntent(context, intent2, "sms_composer_opened", m.n("message_preview", l.G1(50, string3)));
                }
                String str3 = (String) aiTool$SendSms$execute$1.L$2;
                String str4 = (String) aiTool$SendSms$execute$1.L$1;
                Context context3 = (Context) aiTool$SendSms$execute$1.L$0;
                ResultKt.b(obj);
                string3 = str3;
                context = context3;
                objRequirePermission = obj;
                string2 = str4;
                if (!((Boolean) objRequirePermission).booleanValue()) {
                    return new ToolResult.Error(c0.l("Cannot look up '", string2, "' — contacts permission not granted. Provide a phone number directly."), "contacts_permission_required");
                }
                ContactResolver contactResolver = ContactResolver.INSTANCE;
                aiTool$SendSms$execute$1.L$0 = context;
                aiTool$SendSms$execute$1.L$1 = string2;
                aiTool$SendSms$execute$1.L$2 = string3;
                aiTool$SendSms$execute$1.label = 2;
                objResolvePhone = contactResolver.resolvePhone(context, string2, aiTool$SendSms$execute$1);
            } catch (ContactResolver.AmbiguousContactException e3) {
                String message = e3.getMessage();
                if (message == null) {
                    message = "Ambiguous contact";
                }
                return new ToolResult.Error(message, "ambiguous_contact");
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
        public boolean getRequiresConfirmation() {
            return requiresConfirmation;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @NotNull
        public ToolType getToolType() {
            return toolType;
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return context.getPackageManager().hasSystemFeature("android.hardware.telephony");
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SetAlarm;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class SetAlarm extends AiTool {

        @NotNull
        public static final SetAlarm INSTANCE = new SetAlarm();

        @NotNull
        private static final String name = "set_alarm";

        @NotNull
        private static final String description = "Set a new alarm. When the user says 'X hours from now', compute the target hour and minute from the current time in context. Always provide both hour and minute.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("hour", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Hour for the alarm (0-23)"))), new Pair("minute", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Minute for the alarm (0-59)"))), new Pair("label", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional label/message for the alarm"))))), new Pair("required", ul.b.Q("hour", "minute")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "clock";
        public static final int $stable = 8;

        private SetAlarm() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            int iIntValue;
            String string;
            Object obj = map.get("time");
            Pair<Integer, Integer> clockTime = parseClockTime(obj != null ? obj.toString() : null);
            Integer intArg = parseIntArg(map, "hour");
            if (intArg == null) {
                intArg = clockTime != null ? (Integer) clockTime.f71683a : null;
                if (intArg == null) {
                    return new ToolResult.Error("Missing required parameter: hour", "missing_parameter");
                }
            }
            int iIntValue2 = intArg.intValue();
            Integer intArg2 = parseIntArg(map, "minute");
            if (intArg2 != null) {
                iIntValue = intArg2.intValue();
            } else {
                Integer num = clockTime != null ? (Integer) clockTime.f71684b : null;
                if (num == null) {
                    return new ToolResult.Error("Missing required parameter: minute", "missing_parameter");
                }
                iIntValue = num.intValue();
            }
            if (iIntValue2 < 0 || iIntValue2 >= 24 || iIntValue < 0 || iIntValue >= 60) {
                return new ToolResult.Error("Invalid time, expected hour 0-23 and minute 0-59", "invalid_parameter");
            }
            Intent intent = new Intent("android.intent.action.SET_ALARM");
            intent.putExtra("android.intent.extra.alarm.HOUR", iIntValue2);
            intent.putExtra("android.intent.extra.alarm.MINUTES", iIntValue);
            Object obj2 = map.get("label");
            if (obj2 != null && (string = obj2.toString()) != null) {
                intent.putExtra("android.intent.extra.alarm.MESSAGE", string);
            }
            intent.putExtra("android.intent.extra.alarm.SKIP_UI", true);
            return launchIntentWithFallbacks(context, ul.b.Q(intent, new Intent("android.intent.action.SHOW_ALARMS"), new Intent("android.intent.action.MAIN").addCategory(getAppClockCategory())), "set_alarm", MapsKt.j0(new Pair("hour", new Integer(iIntValue2)), new Pair("minute", new Integer(iIntValue))));
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return AiTool.INSTANCE.hasIntentHandler$instabridge_ai_sdk_release(context, new Intent("android.intent.action.SET_ALARM"));
        }
    }

    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J4\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001c\u001a\u00020\u0016H\u0096@¢\u0006\u0002\u0010\u001dR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$SetTimer;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "isAvailableOnDevice", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "args", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class SetTimer extends AiTool {

        @NotNull
        public static final SetTimer INSTANCE = new SetTimer();

        @NotNull
        private static final String name = "set_timer";

        @NotNull
        private static final String description = "Set a countdown timer. IMPORTANT: duration_seconds must be the TOTAL number of seconds. Example: 5 minutes = 300, 1 hour = 3600, 90 seconds = 90.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair("duration_seconds", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "integer"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Total duration in seconds (convert minutes to seconds first: e.g. 5 minutes = 300)"))), new Pair("label", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Optional label/message for the timer"))))), new Pair("required", ul.b.P("duration_seconds")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "clock";
        public static final int $stable = 8;

        private SetTimer() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            int iIntValue;
            String string;
            Integer intArg = parseIntArg(map, "minutes");
            Integer intArg2 = parseIntArg(map, "seconds");
            Integer intArg3 = parseIntArg(map, "duration_seconds");
            if (intArg3 != null) {
                iIntValue = intArg3.intValue();
            } else if (intArg != null) {
                iIntValue = (intArg.intValue() * 60) + (intArg2 != null ? intArg2.intValue() : 0);
            } else {
                if (intArg2 == null) {
                    return new ToolResult.Error("Missing required parameter: duration_seconds", "missing_parameter");
                }
                iIntValue = intArg2.intValue();
            }
            if (iIntValue <= 0) {
                return new ToolResult.Error("duration_seconds must be positive", "invalid_parameter");
            }
            Intent intent = new Intent("android.intent.action.SET_TIMER");
            intent.putExtra("android.intent.extra.alarm.LENGTH", iIntValue);
            Object obj = map.get("label");
            if (obj != null && (string = obj.toString()) != null) {
                intent.putExtra("android.intent.extra.alarm.MESSAGE", string);
            }
            intent.putExtra("android.intent.extra.alarm.SKIP_UI", !z11);
            return launchIntentWithFallbacks(context, ul.b.Q(intent, new Intent("android.intent.action.SHOW_ALARMS"), new Intent("android.intent.action.MAIN").addCategory(getAppClockCategory())), "set_timer", b70.k.e0(new Pair("duration_seconds", new Integer(iIntValue))));
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

        @Override // com.instabridge.ai.tools.AiTool
        public boolean isAvailableOnDevice(@NotNull Context context) {
            Intrinsics.g(context, "context");
            return AiTool.INSTANCE.hasIntentHandler$instabridge_ai_sdk_release(context, new Intent("android.intent.action.SET_TIMER"));
        }
    }

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$ShareText;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ShareText extends AiTool {

        @NotNull
        public static final ShareText INSTANCE = new ShareText();

        @NotNull
        private static final String name = "share_text";

        @NotNull
        private static final String description = "Open the Android share sheet with the given text. The user picks the recipient app (WhatsApp, email, SMS, etc.). Use this when the user wants to share or forward something — the share sheet lets them choose how and to whom.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("text", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "The text to share")))), new Pair("required", ul.b.P("text")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "communication";
        public static final int $stable = 8;

        private ShareText() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            String string;
            Object obj = map.get("text");
            if (obj == null || (string = obj.toString()) == null) {
                return new ToolResult.Error("Missing text parameter", "missing_parameter");
            }
            Intent intent = new Intent("android.intent.action.SEND");
            intent.setType("text/plain");
            intent.putExtra("android.intent.extra.TEXT", string);
            Intent intentCreateChooser = Intent.createChooser(intent, "Share via");
            Intrinsics.f(intentCreateChooser, "createChooser(...)");
            return AiTool.launchIntent$default(this, context, intentCreateChooser, "share_text", null, 8, null);
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

    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J&\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\rH\u0016J4\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020\u001a2\u0014\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u0010\u001e\u001a\u00020\u0018H\u0096@¢\u0006\u0002\u0010\u001fJ\u001f\u0010 \u001a\u0004\u0018\u00010!2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\"\u001a\u00020\u0005H\u0002¢\u0006\u0002\u0010#R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007¨\u0006$"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$ViewCalendarEvent;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "canExecute", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "args", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "findEventId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "searchTitle", "(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Long;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class ViewCalendarEvent extends AiTool {

        @NotNull
        public static final ViewCalendarEvent INSTANCE = new ViewCalendarEvent();

        @NotNull
        private static final String name = "view_calendar_event";

        @NotNull
        private static final String displayName = "View Calendar Event";

        @NotNull
        private static final String description = "Open a specific calendar event by title. Searches for the event and opens it in the calendar app.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", k2.o("title", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Event title or partial match (e.g. 'Instabridge meeting')")))), new Pair("required", ul.b.P("title")));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "calendar";
        public static final int $stable = 8;

        private ViewCalendarEvent() {
        }

        /* JADX WARN: Code restructure failed: missing block: B:40:0x00de, code lost:
        
            r13 = kotlin.Unit.f71706a;
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x00e0, code lost:
        
            r12.close();
         */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x00e3, code lost:
        
            return r4;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        private final Long findEventId(Context context, String searchTitle) throws IOException {
            int i5;
            if (o4.a.a(context, "android.permission.READ_CALENDAR") == 0) {
                try {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    Cursor cursorQuery = context.getContentResolver().query(CalendarContract.Instances.CONTENT_URI.buildUpon().appendPath(String.valueOf(jCurrentTimeMillis)).appendPath(String.valueOf(jCurrentTimeMillis + 1209600000)).build(), new String[]{"event_id", "title"}, null, null, "begin ASC");
                    String lowerCase = searchTitle.toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                    List listI1 = r70.k.i1(lowerCase, new String[]{" "}, 6);
                    ArrayList arrayList = new ArrayList();
                    for (Object obj : listI1) {
                        if (((String) obj).length() > 2) {
                            arrayList.add(obj);
                        }
                    }
                    if (cursorQuery != null) {
                        int i11 = 0;
                        Long lValueOf = null;
                        while (true) {
                            try {
                                if (!cursorQuery.moveToNext()) {
                                    break;
                                }
                                String string = cursorQuery.getString(1);
                                if (string != null) {
                                    String lowerCase2 = string.toLowerCase(Locale.ROOT);
                                    Intrinsics.f(lowerCase2, "toLowerCase(...)");
                                    if (r70.k.K0(lowerCase2, lowerCase, false)) {
                                        lValueOf = Long.valueOf(cursorQuery.getLong(0));
                                        break;
                                    }
                                    if (arrayList.isEmpty()) {
                                        i5 = 0;
                                    } else {
                                        Iterator it = arrayList.iterator();
                                        i5 = 0;
                                        while (it.hasNext()) {
                                            if (r70.k.K0(lowerCase2, (String) it.next(), false) && (i5 = i5 + 1) < 0) {
                                                ul.b.d0();
                                                throw null;
                                            }
                                        }
                                    }
                                    if (i5 > i11 && i5 >= 2) {
                                        lValueOf = Long.valueOf(cursorQuery.getLong(0));
                                        i11 = i5;
                                    }
                                }
                            } finally {
                            }
                        }
                    }
                } catch (Exception unused) {
                }
            }
            return null;
        }

        @Override // com.instabridge.ai.tools.AiTool
        public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
            Intrinsics.g(context, "context");
            Intrinsics.g(args, "args");
            return o4.a.a(context, "android.permission.READ_CALENDAR") == 0;
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) throws IOException {
            String string;
            Object obj = map.get("title");
            if (obj == null || (string = obj.toString()) == null) {
                return new ToolResult.Error("Missing title", "missing_parameter");
            }
            Long lFindEventId = findEventId(context, string);
            if (lFindEventId != null) {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setData(ContentUris.withAppendedId(CalendarContract.Events.CONTENT_URI, lFindEventId.longValue()));
                return launchIntent(context, intent, "view_calendar_event", b70.k.e0(new Pair("title", string)));
            }
            Intent intent2 = new Intent("android.intent.action.VIEW");
            intent2.setData(new Uri.Builder().scheme("content").authority("com.android.calendar").appendPath("time").appendPath(String.valueOf(System.currentTimeMillis())).build());
            return launchIntent(context, intent2, "view_calendar_event", MapsKt.j0(new Pair("title", string), new Pair("fallback", Boolean.TRUE)));
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

    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J4\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\f0\u000b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0096@¢\u0006\u0002\u0010\u001cR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\f0\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0014\u0010\u0013\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0007¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/tools/AiTool$ViewContacts;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "context", "Landroid/content/Context;", "args", "userInitiated", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ViewContacts extends AiTool {

        @NotNull
        public static final ViewContacts INSTANCE = new ViewContacts();

        @NotNull
        private static final String name = "view_contacts";

        @NotNull
        private static final String description = "Open the contacts app to view all contacts.";

        @NotNull
        private static final Map<String, Object> parameters = MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", h.f17594a));

        @NotNull
        private static final ToolType toolType = ToolType.ACTION;

        @NotNull
        private static final String category = "contacts";
        public static final int $stable = 8;

        private ViewContacts() {
        }

        @Override // com.instabridge.ai.tools.AiTool
        @Nullable
        public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(ContactsContract.Contacts.CONTENT_URI);
            return AiTool.launchIntent$default(this, context, intent, "view_contacts", null, 8, null);
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

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.AiTool", f = "AiTool.kt", l = {177}, m = "requirePermission")
    /* renamed from: com.instabridge.ai.tools.AiTool$requirePermission$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiTool.this.requirePermission(null, null, false, this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence _get_displayName_$lambda$1(String it) {
        Intrinsics.g(it, "it");
        if (it.length() <= 0) {
            return it;
        }
        StringBuilder sb2 = new StringBuilder();
        String strValueOf = String.valueOf(it.charAt(0));
        Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
        String upperCase = strValueOf.toUpperCase(Locale.ROOT);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        sb2.append((Object) upperCase);
        String strSubstring = it.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        sb2.append(strSubstring);
        return sb2.toString();
    }

    @JvmStatic
    @Nullable
    public static final AiTool byName(@NotNull String str, @NotNull Map<AiTool, ? extends AiTool> map) {
        return INSTANCE.byName(str, map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List common_delegate$lambda$8() {
        return g.t1(StandardIntentsCatalog.INSTANCE.getAll(), g.t1(CommunicationTools.INSTANCE.getAll(), g.t1(SystemTools.INSTANCE.getAll(), g.t1(MediaTools.INSTANCE.getAll(), ul.b.Q(MakeCall.INSTANCE, SendSms.INSTANCE, SendMessageTool.INSTANCE, SearchContacts.INSTANCE, ComposeEmail.INSTANCE, ShareText.INSTANCE, SetAlarm.INSTANCE, SetTimer.INSTANCE, CreateCalendarEvent.INSTANCE, ReadCalendarEvents.INSTANCE, ViewCalendarEvent.INSTANCE, OpenApp.INSTANCE, OpenCalculator.INSTANCE, OpenMessages.INSTANCE, OpenMaps.INSTANCE, OpenCalendar.INSTANCE, SearchPlayStore.INSTANCE, NavigateTo.INSTANCE, SearchNearby.INSTANCE, SearchDevice.INSTANCE, ReadNotifications.INSTANCE, OpenUrl.INSTANCE, SearchWeb.INSTANCE)))));
    }

    @JvmStatic
    @JvmOverloads
    @NotNull
    public static final List<ToolDefinition> definitions() {
        return INSTANCE.definitions();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List expanded_delegate$lambda$9() {
        return g.t1(ul.b.Q(OpenSettings.INSTANCE, OpenLocationSettings.INSTANCE, OpenSoundSettings.INSTANCE, OpenDisplaySettings.INSTANCE, OpenContact.INSTANCE, ViewContacts.INSTANCE, AddContact.INSTANCE), g.t1(SystemTools.INSTANCE.getExpanded(), INSTANCE.getCommon()));
    }

    @JvmStatic
    @JvmOverloads
    @NotNull
    public static final List<AiTool> filtered() {
        return INSTANCE.filtered();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ToolResult launchIntent$default(AiTool aiTool, Context context, Intent intent, String str, Map map, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: launchIntent");
        }
        if ((i5 & 8) != 0) {
            map = h.f17594a;
        }
        return aiTool.launchIntent(context, intent, str, map);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ToolResult launchIntentWithFallbacks$default(AiTool aiTool, Context context, List list, String str, Map map, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: launchIntentWithFallbacks");
        }
        if ((i5 & 8) != 0) {
            map = h.f17594a;
        }
        return aiTool.launchIntentWithFallbacks(context, list, str, map);
    }

    private final int levenshtein(String a11, String b11) {
        int length = a11.length();
        int length2 = b11.length();
        int i5 = length2 + 1;
        int[] iArr = new int[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            iArr[i11] = i11;
        }
        int[] iArr2 = new int[i5];
        if (1 <= length) {
            iArr = iArr2;
            int[] iArr3 = iArr;
            int i12 = 1;
            while (true) {
                iArr[0] = i12;
                if (1 <= length2) {
                    int i13 = 1;
                    while (true) {
                        int i14 = i13 - 1;
                        iArr[i13] = Math.min(iArr[i14] + 1, Math.min(iArr3[i13] + 1, iArr3[i14] + (a11.charAt(i12 + (-1)) == b11.charAt(i14) ? 0 : 1)));
                        if (i13 == length2) {
                            break;
                        }
                        i13++;
                    }
                }
                if (i12 == length) {
                    break;
                }
                i12++;
                int[] iArr4 = iArr;
                iArr = iArr3;
                iArr3 = iArr4;
            }
        }
        return iArr[length2];
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final void preferOwnApp(Context context, Intent intent) {
        String str;
        Object next;
        try {
            List<ResolveInfo> listQueryIntentActivities = context.getPackageManager().queryIntentActivities(intent, 0);
            Intrinsics.d(listQueryIntentActivities);
            if (listQueryIntentActivities.isEmpty()) {
                return;
            }
            ArrayList arrayList = new ArrayList();
            Iterator<T> it = listQueryIntentActivities.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ActivityInfo activityInfo = ((ResolveInfo) it.next()).activityInfo;
                str = activityInfo != null ? activityInfo.packageName : null;
                if (str != null) {
                    arrayList.add(str);
                }
            }
            String packageName = context.getPackageName();
            Iterator it2 = arrayList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                } else {
                    next = it2.next();
                    if (Intrinsics.b((String) next, packageName)) {
                        break;
                    }
                }
            }
            String str2 = (String) next;
            if (str2 == null) {
                Iterator it3 = arrayList.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    Object next2 = it3.next();
                    if (INSTANCE.isOwnPackage$instabridge_ai_sdk_release((String) next2)) {
                        str = next2;
                        break;
                    }
                }
                str2 = str;
                if (str2 == null) {
                    return;
                }
            }
            intent.setPackage(str2);
        } catch (Exception unused) {
        }
    }

    public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) {
        Intrinsics.g(context, "context");
        Intrinsics.g(args, "args");
        return true;
    }

    @Nullable
    public abstract Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation);

    @NotNull
    public final String getAppClockCategory() {
        return "android.intent.category.APP_CLOCK";
    }

    @NotNull
    public abstract String getCategory();

    @NotNull
    public abstract String getDescription();

    @NotNull
    public String getDisplayName() {
        return g.f1(r70.k.i1(getName(), new String[]{"_"}, 6), " ", null, null, 0, new a00.a(24), 30);
    }

    @NotNull
    public abstract String getName();

    @NotNull
    public abstract Map<String, Object> getParameters();

    public boolean getRequiresConfirmation() {
        return this.requiresConfirmation;
    }

    @NotNull
    public abstract ToolType getToolType();

    public boolean isAvailableOnDevice(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    public final ToolResult launchIntent(@NotNull Context context, @NotNull Intent intent, @NotNull String actionName, @NotNull Map<String, ? extends Object> extraInfo) {
        Intrinsics.g(context, "context");
        Intrinsics.g(intent, "intent");
        Intrinsics.g(actionName, "actionName");
        Intrinsics.g(extraInfo, "extraInfo");
        try {
            intent.addFlags(268435456);
            if (intent.getPackage() == null) {
                preferOwnApp(context, intent);
            }
            context.startActivity(intent);
            MapBuilder mapBuilder = new MapBuilder();
            mapBuilder.put("action", actionName);
            mapBuilder.putAll(extraInfo);
            return new ToolResult.Success(mapBuilder.b(), null, 2, 0 == true ? 1 : 0);
        } catch (ActivityNotFoundException unused) {
            return new ToolResult.Error("No app available to handle this action", "no_handler");
        } catch (SecurityException e3) {
            return new ToolResult.Error("Permission denied: " + e3.getMessage(), "permission_denied");
        } catch (Exception e11) {
            return new ToolResult.Error(c1.s(e11, new StringBuilder("Failed to execute: ")), "execution_failed");
        }
    }

    @NotNull
    public final ToolResult launchIntentWithFallbacks(@NotNull Context context, @NotNull List<? extends Intent> intents, @NotNull String actionName, @NotNull Map<String, ? extends Object> extraInfo) {
        Intrinsics.g(context, "context");
        Intrinsics.g(intents, "intents");
        Intrinsics.g(actionName, "actionName");
        Intrinsics.g(extraInfo, "extraInfo");
        Set setF1 = kotlin.collections.c.f1(new String[]{"no_handler", "permission_denied"});
        Iterator<? extends Intent> it = intents.iterator();
        ToolResult.Error error = null;
        while (it.hasNext()) {
            ToolResult toolResultLaunchIntent = launchIntent(context, it.next(), actionName, extraInfo);
            if (toolResultLaunchIntent instanceof ToolResult.Success) {
                return toolResultLaunchIntent;
            }
            if (!(toolResultLaunchIntent instanceof ToolResult.Error)) {
                if (toolResultLaunchIntent instanceof ToolResult.NeedsUserInput) {
                    return toolResultLaunchIntent;
                }
                throw new NoWhenBranchMatchedException();
            }
            ToolResult.Error error2 = (ToolResult.Error) toolResultLaunchIntent;
            if (!g.O0(setF1, error2.getCode())) {
                return toolResultLaunchIntent;
            }
            error = error2;
        }
        return error != null ? error : new ToolResult.Error("No app available to handle this action", "no_handler");
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x0091, code lost:
    
        if (r1 < 24) goto L49;
     */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Pair<Integer, Integer> parseClockTime(@Nullable String value) {
        String string;
        kotlin.text.b bVarE;
        Integer numU0;
        Integer numU02;
        if (value != null && (string = r70.k.u1(value).toString()) != null) {
            String lowerCase = string.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            if (lowerCase.length() != 0 && (bVarE = new Regex("^(\\d{1,2})(?::(\\d{1,2}))?\\s*([ap]m)?$").e(lowerCase)) != null && (numU0 = i.u0((String) ((MatcherMatchResult$groupValues$1) bVarE.a()).get(1))) != null) {
                int iIntValue = numU0.intValue();
                Object obj = ((MatcherMatchResult$groupValues$1) bVarE.a()).get(2);
                if (((String) obj).length() <= 0) {
                    obj = null;
                }
                String str = (String) obj;
                int iIntValue2 = (str == null || (numU02 = i.u0(str)) == null) ? 0 : numU02.intValue();
                Object obj2 = ((MatcherMatchResult$groupValues$1) bVarE.a()).get(3);
                if (((String) obj2).length() <= 0) {
                    obj2 = null;
                }
                String str2 = (String) obj2;
                if (iIntValue2 >= 0 && iIntValue2 < 60) {
                    if (str2 == null) {
                        if (iIntValue >= 0) {
                        }
                    } else if (1 <= iIntValue && iIntValue < 13) {
                        if (str2.equals("am")) {
                            if (iIntValue == 12) {
                                iIntValue = 0;
                            }
                        } else if (str2.equals("pm")) {
                            iIntValue = iIntValue == 12 ? 12 : iIntValue + 12;
                        }
                        return new Pair<>(Integer.valueOf(iIntValue), Integer.valueOf(iIntValue2));
                    }
                }
            }
        }
        return null;
    }

    @Nullable
    public final Long parseDateTime(@Nullable Object value) {
        return e.b(value, true);
    }

    @Nullable
    public final Double parseDoubleArg(@NotNull Map<String, ? extends Object> args, @NotNull String key) {
        Intrinsics.g(args, "args");
        Intrinsics.g(key, "key");
        Object obj = args.get(key);
        if (obj instanceof Number) {
            return Double.valueOf(((Number) obj).doubleValue());
        }
        if (obj instanceof String) {
            return i.r0(r70.k.u1((String) obj).toString());
        }
        return null;
    }

    @Nullable
    public final Integer parseIntArg(@NotNull Map<String, ? extends Object> args, @NotNull String key) {
        Intrinsics.g(args, "args");
        Intrinsics.g(key, "key");
        Object obj = args.get(key);
        if (obj instanceof Number) {
            return Integer.valueOf(((Number) obj).intValue());
        }
        if (obj instanceof String) {
            return i.u0(r70.k.u1((String) obj).toString());
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v2, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @SuppressLint({"NewApi"})
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object requirePermission(@NotNull Context context, @NotNull String str, boolean z11, @NotNull Continuation<? super Boolean> continuation) {
        AnonymousClass1 anonymousClass1;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objInvoke = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        boolean z12 = false;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            if (LOCATION_PERMISSIONS.contains(str) && !fo.d.k()) {
                return Boolean.FALSE;
            }
            if (context.checkSelfPermission(str) == 0) {
                return Boolean.TRUE;
            }
            if (!z11) {
                jo.e.b(jo.c.f69624c, getName(), jo.b.f69620e, null, m.n("permission", str), 8);
                return Boolean.FALSE;
            }
            ?? r72 = fo.d.f55484x;
            if (r72 != 0) {
                anonymousClass1.label = 1;
                objInvoke = r72.invoke(str, anonymousClass1);
                if (objInvoke == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Boolean.valueOf(z12);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(objInvoke);
        if (((Boolean) objInvoke).booleanValue()) {
            z12 = true;
        }
        return Boolean.valueOf(z12);
    }

    public final double similarText(@NotNull String a11, @NotNull String b11) {
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        if (a11.equals(b11)) {
            return 1.0d;
        }
        if (a11.length() == 0 || b11.length() == 0) {
            return 0.0d;
        }
        return 1.0d - (levenshtein(a11, b11) / Math.max(a11.length(), b11.length()));
    }

    @NotNull
    public ToolDefinition toDefinition() {
        return new ToolDefinition(getName(), getDescription(), getParameters(), getToolType(), getCategory(), getRequiresConfirmation() ? Boolean.TRUE : null);
    }

    @JvmStatic
    @JvmOverloads
    @NotNull
    public static final List<ToolDefinition> definitions(@NotNull Set<? extends AiTool> set) {
        return INSTANCE.definitions(set);
    }

    @JvmStatic
    @JvmOverloads
    @NotNull
    public static final List<AiTool> filtered(@NotNull Set<? extends AiTool> set) {
        return INSTANCE.filtered(set);
    }

    @JvmStatic
    @JvmOverloads
    @NotNull
    public static final List<ToolDefinition> definitions(@NotNull Set<? extends AiTool> set, @NotNull Map<AiTool, ? extends AiTool> map) {
        return INSTANCE.definitions(set, map);
    }

    @JvmStatic
    @JvmOverloads
    @NotNull
    public static final List<AiTool> filtered(@NotNull Set<? extends AiTool> set, @NotNull Map<AiTool, ? extends AiTool> map) {
        return INSTANCE.filtered(set, map);
    }
}
