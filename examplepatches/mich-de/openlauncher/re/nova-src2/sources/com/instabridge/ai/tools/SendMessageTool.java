package com.instabridge.ai.tools;

import ab.e0;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.util.Log;
import android.util.Patterns;
import b.c0;
import b.c9;
import b.u4;
import b10.o1;
import b70.g;
import b70.h;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.ai.tools.SendMessageTool;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import h6.c1;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;
import kotlin.text.RegexOption;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import ninja.sesame.lib.bridge.v1.ShortcutType;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\t\n\u0002\b\u0007\bÇ\u0002\u0018\u00002\u00020\u0001:\u0003OPQB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010(\u001a\u00020)H\u0016J\u0016\u0010*\u001a\b\u0012\u0004\u0012\u00020\u00050\u001b2\u0006\u0010+\u001a\u00020,H\u0002J&\u0010-\u001a\u00020.2\u0006\u0010+\u001a\u00020,2\u0014\u0010/\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\rH\u0016J4\u00100\u001a\u0002012\u0006\u0010+\u001a\u00020,2\u0014\u0010/\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u000e0\r2\u0006\u00102\u001a\u00020.H\u0096@¢\u0006\u0002\u00103J\u0018\u00104\u001a\u00020\u00052\u0006\u00105\u001a\u00020\u00052\u0006\u0010+\u001a\u00020,H\u0007J\u0010\u00104\u001a\u00020\u00052\u0006\u00105\u001a\u00020\u0005H\u0007J\u0010\u00106\u001a\u00020\u00052\u0006\u00107\u001a\u00020\u0005H\u0007J\u0010\u00108\u001a\u00020.2\u0006\u00109\u001a\u00020\u0005H\u0007J\u0012\u0010:\u001a\u0004\u0018\u00010\u00052\u0006\u0010;\u001a\u00020\u0005H\u0007J\u001f\u0010<\u001a\u0004\u0018\u00010=2\u0006\u0010+\u001a\u00020,2\u0006\u0010>\u001a\u00020\u0005H\u0000¢\u0006\u0002\b?J,\u0010@\u001a\u0004\u0018\u00010A2\u0006\u0010+\u001a\u00020,2\u0006\u0010>\u001a\u00020\u00052\b\b\u0002\u00102\u001a\u00020.H\u0080@¢\u0006\u0004\bB\u0010CJ#\u0010D\u001a\b\u0012\u0004\u0012\u00020=0\u001b2\u0006\u0010+\u001a\u00020,2\u0006\u0010\u0004\u001a\u00020\u0005H\u0000¢\u0006\u0002\bEJ\u001e\u0010F\u001a\b\u0012\u0004\u0012\u00020=0\u001b2\u0006\u0010+\u001a\u00020,2\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u001e\u0010G\u001a\b\u0012\u0004\u0012\u00020=0\u001b2\u0006\u0010+\u001a\u00020,2\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u001e\u0010H\u001a\b\u0012\u0004\u0012\u00020=0\u001b2\u0006\u0010+\u001a\u00020,2\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u001e\u0010I\u001a\b\u0012\u0004\u0012\u00020\u00050\u001b2\u0006\u0010+\u001a\u00020,2\u0006\u0010J\u001a\u00020KH\u0002J\u001e\u0010L\u001a\b\u0012\u0004\u0012\u00020\u00050\u001b2\u0006\u0010+\u001a\u00020,2\u0006\u0010J\u001a\u00020KH\u0002J\u001a\u0010M\u001a\u0004\u0018\u00010%2\u0006\u0010+\u001a\u00020,2\u0006\u0010N\u001a\u00020=H\u0002R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0014\u0010\b\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0007R\u0014\u0010\n\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0007R \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u000e0\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u0005X\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0007R\u0014\u0010\u0017\u001a\u00020\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0007RI\u0010\u0019\u001a1\u0012%\u0012#\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050\u001c0\u001b¢\u0006\f\b\u001d\u0012\b\b\u0004\u0012\u0004\b\b(\u001e\u0012\u0004\u0012\u00020\u001f\u0018\u00010\u001aX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b \u0010!\"\u0004\b\"\u0010#R\u0017\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u001b¢\u0006\b\n\u0000\u001a\u0004\b&\u0010'¨\u0006R"}, d2 = {"Lcom/instabridge/ai/tools/SendMessageTool;", "Lcom/instabridge/ai/tools/AiTool;", "<init>", "()V", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getName", "()Ljava/lang/String;", "displayName", "getDisplayName", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "getDescription", "parameters", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getParameters", "()Ljava/util/Map;", "toolType", "Lcom/instabridge/ai/tools/ToolType;", "getToolType", "()Lcom/instabridge/ai/tools/ToolType;", "category", "getCategory", "TAG", "getTAG", "onDisambiguateContact", "Lkotlin/Function1;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/Pair;", "Lkotlin/ParameterName;", "candidates", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getOnDisambiguateContact", "()Lkotlin/jvm/functions/Function1;", "setOnDisambiguateContact", "(Lkotlin/jvm/functions/Function1;)V", "APPS", "Lcom/instabridge/ai/tools/SendMessageTool$MessagingApp;", "getAPPS", "()Ljava/util/List;", "toDefinition", "Lcom/instabridge/ai/tools/ToolDefinition;", "getInstalledMessagingApps", "context", "Landroid/content/Context;", "canExecute", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "args", "execute", "Lcom/instabridge/ai/tools/ToolResult;", "userInitiated", "(Landroid/content/Context;Ljava/util/Map;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "normalizePhone", "phone", "withoutPlus", "e164", "looksLikeEmail", "input", "normalizeEmail", ActionCategory.EMAIL, "resolveContact", "Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", "query", "resolveContact$instabridge_ai_sdk_release", "resolveContactWithDisambiguation", "Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult;", "resolveContactWithDisambiguation$instabridge_ai_sdk_release", "(Landroid/content/Context;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "searchContactsByName", "searchContactsByName$instabridge_ai_sdk_release", "searchContactsLike", "searchContactsFilter", "searchContactsByNickname", "lookupPhonesForResolve", "contactId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lookupEmailsForResolve", "findBestApp", ShortcutType.CONTACT, "MessagingApp", "ResolvedContact", "ResolveResult", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class SendMessageTool extends AiTool {

    @NotNull
    private static final List<MessagingApp> APPS;

    @Nullable
    private static Function1<? super List<Pair<String, String>>, Integer> onDisambiguateContact;

    @NotNull
    public static final SendMessageTool INSTANCE = new SendMessageTool();

    @NotNull
    private static final String name = "send_message";

    @NotNull
    private static final String displayName = "Send Message";

    @NotNull
    private static final String description = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    @NotNull
    private static final Map<String, Object> parameters = h.f17594a;

    @NotNull
    private static final ToolType toolType = ToolType.ACTION;

    @NotNull
    private static final String category = "communication";
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0002\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Found", "Ambiguous", "Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult$Ambiguous;", "Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult$Found;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class ResolveResult {
        public static final int $stable = 0;

        @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult$Ambiguous;", "Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult;", "query", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "candidates", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "getQuery", "()Ljava/lang/String;", "getCandidates", "()Ljava/util/List;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Ambiguous extends ResolveResult {
            public static final int $stable = 8;

            @NotNull
            private final List<ResolvedContact> candidates;

            @NotNull
            private final String query;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Ambiguous(@NotNull String query, @NotNull List<ResolvedContact> candidates) {
                super(null);
                Intrinsics.g(query, "query");
                Intrinsics.g(candidates, "candidates");
                this.query = query;
                this.candidates = candidates;
            }

            /* JADX WARN: Multi-variable type inference failed */
            public static /* synthetic */ Ambiguous copy$default(Ambiguous ambiguous, String str, List list, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = ambiguous.query;
                }
                if ((i5 & 2) != 0) {
                    list = ambiguous.candidates;
                }
                return ambiguous.copy(str, list);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getQuery() {
                return this.query;
            }

            @NotNull
            public final List<ResolvedContact> component2() {
                return this.candidates;
            }

            @NotNull
            public final Ambiguous copy(@NotNull String query, @NotNull List<ResolvedContact> candidates) {
                Intrinsics.g(query, "query");
                Intrinsics.g(candidates, "candidates");
                return new Ambiguous(query, candidates);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof Ambiguous)) {
                    return false;
                }
                Ambiguous ambiguous = (Ambiguous) other;
                return Intrinsics.b(this.query, ambiguous.query) && Intrinsics.b(this.candidates, ambiguous.candidates);
            }

            @NotNull
            public final List<ResolvedContact> getCandidates() {
                return this.candidates;
            }

            @NotNull
            public final String getQuery() {
                return this.query;
            }

            public int hashCode() {
                return this.candidates.hashCode() + (this.query.hashCode() * 31);
            }

            @NotNull
            public String toString() {
                StringBuilder sb2 = new StringBuilder("Ambiguous(query=");
                sb2.append(this.query);
                sb2.append(", candidates=");
                return fq.c.e(sb2, this.candidates, ')');
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult$Found;", "Lcom/instabridge/ai/tools/SendMessageTool$ResolveResult;", ShortcutType.CONTACT, "Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", "<init>", "(Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;)V", "getContact", "()Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", "component1", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Found extends ResolveResult {
            public static final int $stable = 8;

            @NotNull
            private final ResolvedContact contact;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Found(@NotNull ResolvedContact contact) {
                super(null);
                Intrinsics.g(contact, "contact");
                this.contact = contact;
            }

            public static /* synthetic */ Found copy$default(Found found, ResolvedContact resolvedContact, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    resolvedContact = found.contact;
                }
                return found.copy(resolvedContact);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final ResolvedContact getContact() {
                return this.contact;
            }

            @NotNull
            public final Found copy(@NotNull ResolvedContact contact) {
                Intrinsics.g(contact, "contact");
                return new Found(contact);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Found) && Intrinsics.b(this.contact, ((Found) other).contact);
            }

            @NotNull
            public final ResolvedContact getContact() {
                return this.contact;
            }

            public int hashCode() {
                return this.contact.hashCode();
            }

            @NotNull
            public String toString() {
                return "Found(contact=" + this.contact + ')';
            }
        }

        public /* synthetic */ ResolveResult(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private ResolveResult() {
        }
    }

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0003J\u000f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0003J3\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00052\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/tools/SendMessageTool$ResolvedContact;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "phones", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "emails", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V", "getName", "()Ljava/lang/String;", "getPhones", "()Ljava/util/List;", "getEmails", "component1", "component2", "component3", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ResolvedContact {
        public static final int $stable = 8;

        @NotNull
        private final List<String> emails;

        @NotNull
        private final String name;

        @NotNull
        private final List<String> phones;

        public ResolvedContact(@NotNull String name, @NotNull List<String> phones, @NotNull List<String> emails) {
            Intrinsics.g(name, "name");
            Intrinsics.g(phones, "phones");
            Intrinsics.g(emails, "emails");
            this.name = name;
            this.phones = phones;
            this.emails = emails;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ResolvedContact copy$default(ResolvedContact resolvedContact, String str, List list, List list2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = resolvedContact.name;
            }
            if ((i5 & 2) != 0) {
                list = resolvedContact.phones;
            }
            if ((i5 & 4) != 0) {
                list2 = resolvedContact.emails;
            }
            return resolvedContact.copy(str, list, list2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getName() {
            return this.name;
        }

        @NotNull
        public final List<String> component2() {
            return this.phones;
        }

        @NotNull
        public final List<String> component3() {
            return this.emails;
        }

        @NotNull
        public final ResolvedContact copy(@NotNull String name, @NotNull List<String> phones, @NotNull List<String> emails) {
            Intrinsics.g(name, "name");
            Intrinsics.g(phones, "phones");
            Intrinsics.g(emails, "emails");
            return new ResolvedContact(name, phones, emails);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ResolvedContact)) {
                return false;
            }
            ResolvedContact resolvedContact = (ResolvedContact) other;
            return Intrinsics.b(this.name, resolvedContact.name) && Intrinsics.b(this.phones, resolvedContact.phones) && Intrinsics.b(this.emails, resolvedContact.emails);
        }

        @NotNull
        public final List<String> getEmails() {
            return this.emails;
        }

        @NotNull
        public final String getName() {
            return this.name;
        }

        @NotNull
        public final List<String> getPhones() {
            return this.phones;
        }

        public int hashCode() {
            return this.emails.hashCode() + u4.c(this.name.hashCode() * 31, 31, this.phones);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ResolvedContact(name=");
            sb2.append(this.name);
            sb2.append(", phones=");
            sb2.append(this.phones);
            sb2.append(", emails=");
            return fq.c.e(sb2, this.emails, ')');
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.SendMessageTool", f = "SendMessageTool.kt", l = {Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE}, m = "execute")
    /* renamed from: com.instabridge.ai.tools.SendMessageTool$execute$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
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
            return SendMessageTool.this.execute(null, null, false, this);
        }
    }

    static {
        boolean z11 = false;
        boolean z12 = false;
        boolean z13 = false;
        boolean z14 = false;
        APPS = ul.b.Q(new MessagingApp("SMS", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, true, false, z11, new o1(1), 24, null), new MessagingApp("WhatsApp", Pkgs.WHATSAPP, true, z11, z12, new o1(2), 24, null), new MessagingApp("WhatsApp Business", Pkgs.WHATSAPP_4B, true, z12, z13, new o1(3), 24, null), new MessagingApp("Signal", Pkgs.SIGNAL, true, z13, z14, new o1(4), 8, null), new MessagingApp("Telegram", Pkgs.TELEGRAM, true, z14, false, new o1(5), 24, null), new MessagingApp("Email", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, z14, true, false, new o1(6), 16, null));
    }

    private SendMessageTool() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Intent APPS$lambda$1(String phone, String msg) {
        Intrinsics.g(phone, "phone");
        Intrinsics.g(msg, "msg");
        Intent intent = new Intent("android.intent.action.SENDTO", Uri.parse("smsto:".concat(phone)));
        intent.putExtra("sms_body", msg);
        return intent;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Intent APPS$lambda$2(String phone, String msg) {
        Intrinsics.g(phone, "phone");
        Intrinsics.g(msg, "msg");
        return new Intent("android.intent.action.VIEW", Uri.parse("https://wa.me/" + withoutPlus(phone) + "?text=" + Uri.encode(msg)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Intent APPS$lambda$3(String phone, String msg) {
        Intrinsics.g(phone, "phone");
        Intrinsics.g(msg, "msg");
        return new Intent("android.intent.action.VIEW", Uri.parse("https://wa.me/" + withoutPlus(phone) + "?text=" + Uri.encode(msg)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Intent APPS$lambda$4(String phone, String msg) {
        Intrinsics.g(phone, "phone");
        Intrinsics.g(msg, "msg");
        return new Intent("android.intent.action.VIEW", Uri.parse("sgnl://signal.me/#p/".concat(phone)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Intent APPS$lambda$5(String phone, String msg) {
        Intrinsics.g(phone, "phone");
        Intrinsics.g(msg, "msg");
        return new Intent("android.intent.action.VIEW", Uri.parse("tg://msg?to=" + withoutPlus(phone) + "&text=" + Uri.encode(msg)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Intent APPS$lambda$7(String email, String msg) {
        Intrinsics.g(email, "email");
        Intrinsics.g(msg, "msg");
        Intent intent = new Intent("android.intent.action.SENDTO", Uri.parse("mailto:".concat(email)));
        RegexOption[] regexOptionArr = RegexOption.f72028c;
        kotlin.text.b bVarB = new Regex("^Subject:\\s*(.+?)\\n", 0).b(msg);
        if (bVarB == null) {
            intent.putExtra("android.intent.extra.TEXT", msg);
            return intent;
        }
        intent.putExtra("android.intent.extra.SUBJECT", (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1));
        intent.putExtra("android.intent.extra.TEXT", k.u1(k.m1(msg, "\n", msg)).toString());
        return intent;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence execute$lambda$15(ResolvedContact c11) {
        Intrinsics.g(c11, "c");
        String str = (String) g.Y0(c11.getPhones());
        String strM = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null && (str = (String) g.Y0(c11.getEmails())) == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        StringBuilder sb2 = new StringBuilder("- ");
        sb2.append(c11.getName());
        if (str.length() > 0) {
            strM = c1.m(')', " (", str);
        }
        sb2.append(strM);
        return sb2.toString();
    }

    private final MessagingApp findBestApp(Context context, ResolvedContact contact) throws PackageManager.NameNotFoundException {
        Object next;
        PackageManager packageManager = context.getPackageManager();
        Object obj = null;
        if (!contact.getPhones().isEmpty()) {
            Iterator<T> it = APPS.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (Intrinsics.b(((MessagingApp) next).getId(), "SMS")) {
                    break;
                }
            }
            MessagingApp messagingApp = (MessagingApp) next;
            if (messagingApp != null) {
                return messagingApp;
            }
            List<MessagingApp> list = APPS;
            ArrayList<MessagingApp> arrayList = new ArrayList();
            for (Object obj2 : list) {
                MessagingApp messagingApp2 = (MessagingApp) obj2;
                if (messagingApp2.getNeedsPhone() && messagingApp2.getCanPrefillMessage() && messagingApp2.getPackageName().length() > 0) {
                    arrayList.add(obj2);
                }
            }
            for (MessagingApp messagingApp3 : arrayList) {
                try {
                    packageManager.getApplicationInfo(messagingApp3.getPackageName(), 0);
                    return messagingApp3;
                } catch (Exception unused) {
                }
            }
        }
        if (contact.getEmails().isEmpty()) {
            return null;
        }
        Iterator<T> it2 = APPS.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next2 = it2.next();
            if (((MessagingApp) next2).getNeedsEmail()) {
                obj = next2;
                break;
            }
        }
        return (MessagingApp) obj;
    }

    private final List<String> getInstalledMessagingApps(Context context) throws PackageManager.NameNotFoundException {
        boolean z11;
        PackageManager packageManager = context.getPackageManager();
        List<MessagingApp> list = APPS;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = list.iterator();
        while (true) {
            z11 = false;
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            MessagingApp messagingApp = (MessagingApp) next;
            if (messagingApp.getPackageName().length() != 0) {
                try {
                    packageManager.getApplicationInfo(messagingApp.getPackageName(), 0);
                } catch (Exception unused) {
                }
            }
            arrayList.add(next);
        }
        if (!arrayList.isEmpty()) {
            Iterator it2 = arrayList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                MessagingApp messagingApp2 = (MessagingApp) it2.next();
                if (messagingApp2.getCanPrefillMessage() && messagingApp2.getNeedsPhone()) {
                    z11 = true;
                    break;
                }
            }
        }
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayList) {
            if (((MessagingApp) obj).getCanPrefillMessage() || !z11) {
                arrayList2.add(obj);
            }
        }
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            arrayList3.add(((MessagingApp) it3.next()).getId());
        }
        return arrayList3;
    }

    private final String getTAG() {
        int i5 = jo.a.f69615a;
        return jo.a.b();
    }

    @JvmStatic
    public static final boolean looksLikeEmail(@NotNull String input) {
        Intrinsics.g(input, "input");
        return Patterns.EMAIL_ADDRESS.matcher(k.a1(k.u1(input).toString(), "mailto:")).matches();
    }

    private final List<String> lookupEmailsForResolve(Context context, long contactId) throws IOException {
        String string;
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursorQuery = context.getContentResolver().query(ContactsContract.CommonDataKinds.Email.CONTENT_URI, new String[]{"data1"}, "contact_id = ?", new String[]{String.valueOf(contactId)}, null);
            if (cursorQuery == null) {
                return arrayList;
            }
            while (cursorQuery.moveToNext()) {
                try {
                    String string2 = cursorQuery.getString(0);
                    if (string2 != null && (string = k.u1(string2).toString()) != null) {
                        if (k.U0(string)) {
                            string = null;
                        }
                        if (string != null) {
                            arrayList.add(string);
                        }
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
            return arrayList;
        } catch (Exception e3) {
            Log.w(getTAG(), "lookupEmailsForResolve failed for contactId=" + contactId, e3);
            return arrayList;
        }
    }

    private final List<String> lookupPhonesForResolve(Context context, long contactId) throws IOException {
        String string;
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursorQuery = context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"data1"}, "contact_id = ?", new String[]{String.valueOf(contactId)}, null);
            if (cursorQuery == null) {
                return arrayList;
            }
            while (cursorQuery.moveToNext()) {
                try {
                    String string2 = cursorQuery.getString(0);
                    if (string2 != null && (string = k.u1(string2).toString()) != null) {
                        if (k.U0(string)) {
                            string = null;
                        }
                        if (string != null) {
                            String strNormalizePhone = normalizePhone(string, context);
                            if (strNormalizePhone.length() > 0) {
                                arrayList.add(strNormalizePhone);
                            }
                        }
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
            return arrayList;
        } catch (Exception e3) {
            Log.w(getTAG(), "lookupPhonesForResolve failed for contactId=" + contactId, e3);
            return arrayList;
        }
    }

    @JvmStatic
    @Nullable
    public static final String normalizeEmail(@NotNull String email) {
        Intrinsics.g(email, "email");
        String lowerCase = k.u1(email).toString().toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        String strA1 = k.a1(lowerCase, "mailto:");
        if (Patterns.EMAIL_ADDRESS.matcher(strA1).matches()) {
            return strA1;
        }
        return null;
    }

    @JvmStatic
    @NotNull
    public static final String normalizePhone(@NotNull String phone, @NotNull Context context) {
        Intrinsics.g(phone, "phone");
        Intrinsics.g(context, "context");
        return PhoneNumberNormalizer.INSTANCE.normalize(phone, context);
    }

    public static /* synthetic */ Object resolveContactWithDisambiguation$instabridge_ai_sdk_release$default(SendMessageTool sendMessageTool, Context context, String str, boolean z11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        return sendMessageTool.resolveContactWithDisambiguation$instabridge_ai_sdk_release(context, str, z11, continuation);
    }

    private final List<ResolvedContact> searchContactsByNickname(Context context, String name2) throws IOException {
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursorQuery = context.getContentResolver().query(ContactsContract.Data.CONTENT_URI, new String[]{"contact_id"}, "mimetype = ? AND data1 LIKE ?", new String[]{"vnd.android.cursor.item/nickname", "%" + j.F0(j.F0(name2, "%", "\\%", false), "_", "\\_", false) + '%'}, null);
            if (cursorQuery == null) {
                return arrayList;
            }
            while (cursorQuery.moveToNext() && arrayList.size() < 5) {
                try {
                    long j11 = cursorQuery.getLong(0);
                    cursorQuery = context.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"display_name"}, "_id = ?", new String[]{String.valueOf(j11)}, null);
                    if (cursorQuery != null) {
                        try {
                            String string = cursorQuery.moveToFirst() ? cursorQuery.getString(0) : null;
                            cursorQuery.close();
                            if (string != null) {
                                SendMessageTool sendMessageTool = INSTANCE;
                                arrayList.add(new ResolvedContact(string, g.P0(sendMessageTool.lookupPhonesForResolve(context, j11)), g.P0(sendMessageTool.lookupEmailsForResolve(context, j11))));
                            }
                        } finally {
                        }
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
            return arrayList;
        } catch (Exception e3) {
            Log.w(getTAG(), "searchContactsByNickname failed", e3);
            return arrayList;
        }
    }

    private final List<ResolvedContact> searchContactsFilter(Context context, String name2) throws IOException {
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursorQuery = context.getContentResolver().query(Uri.withAppendedPath(ContactsContract.Contacts.CONTENT_FILTER_URI, Uri.encode(name2)), new String[]{"_id", "display_name"}, null, null, null);
            if (cursorQuery == null) {
                return arrayList;
            }
            while (cursorQuery.moveToNext() && arrayList.size() < 5) {
                try {
                    long j11 = cursorQuery.getLong(0);
                    String string = cursorQuery.getString(1);
                    if (string != null) {
                        SendMessageTool sendMessageTool = INSTANCE;
                        arrayList.add(new ResolvedContact(string, g.P0(sendMessageTool.lookupPhonesForResolve(context, j11)), g.P0(sendMessageTool.lookupEmailsForResolve(context, j11))));
                    }
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorQuery.close();
            return arrayList;
        } catch (Exception e3) {
            Log.w(getTAG(), "searchContactsFilter failed", e3);
            return arrayList;
        }
    }

    private final List<ResolvedContact> searchContactsLike(Context context, final String name2) throws IOException {
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursorQuery = context.getContentResolver().query(ContactsContract.Contacts.CONTENT_URI, new String[]{"_id", "display_name", "starred"}, "display_name LIKE ?", new String[]{"%" + j.F0(j.F0(name2, "%", "\\%", false), "_", "\\_", false) + '%'}, "starred DESC");
            if (cursorQuery != null) {
                while (cursorQuery.moveToNext() && arrayList.size() < 5) {
                    try {
                        long j11 = cursorQuery.getLong(0);
                        String string = cursorQuery.getString(1);
                        if (string != null) {
                            SendMessageTool sendMessageTool = INSTANCE;
                            arrayList.add(new ResolvedContact(string, g.P0(sendMessageTool.lookupPhonesForResolve(context, j11)), g.P0(sendMessageTool.lookupEmailsForResolve(context, j11))));
                        }
                    } finally {
                    }
                }
                Unit unit = Unit.f71706a;
                cursorQuery.close();
            }
        } catch (Exception e3) {
            Log.w(getTAG(), "searchContactsLike failed for '" + name2 + '\'', e3);
        }
        final String lowerCase = name2.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return g.D1(new Comparator() { // from class: com.instabridge.ai.tools.SendMessageTool$searchContactsLike$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                int i5;
                SendMessageTool.ResolvedContact resolvedContact = (SendMessageTool.ResolvedContact) t9;
                int i11 = 50;
                if (j.B0(resolvedContact.getName(), name2, true)) {
                    i5 = 100;
                } else {
                    String lowerCase2 = resolvedContact.getName().toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase2, "toLowerCase(...)");
                    i5 = j.I0(lowerCase2, lowerCase, false) ? 50 : 0;
                }
                Integer numValueOf = Integer.valueOf(i5);
                SendMessageTool.ResolvedContact resolvedContact2 = (SendMessageTool.ResolvedContact) t6;
                if (j.B0(resolvedContact2.getName(), name2, true)) {
                    i11 = 100;
                } else {
                    String lowerCase3 = resolvedContact2.getName().toLowerCase(Locale.ROOT);
                    Intrinsics.f(lowerCase3, "toLowerCase(...)");
                    if (!j.I0(lowerCase3, lowerCase, false)) {
                        i11 = 0;
                    }
                }
                return e0.t(numValueOf, Integer.valueOf(i11));
            }
        }, arrayList);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence toDefinition$lambda$9(String it) {
        Intrinsics.g(it, "it");
        return "'" + it + '\'';
    }

    @JvmStatic
    @NotNull
    public static final String withoutPlus(@NotNull String e164) {
        Intrinsics.g(e164, "e164");
        return PhoneNumberNormalizer.INSTANCE.withoutPlus(e164);
    }

    @Override // com.instabridge.ai.tools.AiTool
    public boolean canExecute(@NotNull Context context, @NotNull Map<String, ? extends Object> args) throws PackageManager.NameNotFoundException, IOException {
        String string;
        Intrinsics.g(context, "context");
        Intrinsics.g(args, "args");
        Object obj = args.get(ShortcutType.CONTACT);
        if (obj != null && (string = obj.toString()) != null) {
            Object obj2 = args.get("app");
            Object obj3 = null;
            String string2 = obj2 != null ? obj2.toString() : null;
            ResolvedContact resolvedContactResolveContact$instabridge_ai_sdk_release = resolveContact$instabridge_ai_sdk_release(context, string);
            if (resolvedContactResolveContact$instabridge_ai_sdk_release == null) {
                getTAG();
                return false;
            }
            if (string2 != null) {
                Iterator<T> it = APPS.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Object next = it.next();
                    if (j.B0(((MessagingApp) next).getId(), string2, true)) {
                        obj3 = next;
                        break;
                    }
                }
                MessagingApp messagingApp = (MessagingApp) obj3;
                if (messagingApp == null) {
                    getTAG();
                    return false;
                }
                if (messagingApp.getNeedsPhone() && resolvedContactResolveContact$instabridge_ai_sdk_release.getPhones().isEmpty()) {
                    getTAG();
                    messagingApp.getId();
                    return false;
                }
                if (messagingApp.getNeedsEmail() && resolvedContactResolveContact$instabridge_ai_sdk_release.getEmails().isEmpty()) {
                    getTAG();
                    messagingApp.getId();
                    return false;
                }
                if (messagingApp.getPackageName().length() > 0) {
                    try {
                        context.getPackageManager().getApplicationInfo(messagingApp.getPackageName(), 0);
                        z = true;
                    } catch (Exception unused) {
                    }
                    if (!z) {
                        getTAG();
                        messagingApp.getId();
                    }
                    return z;
                }
            }
            z = (resolvedContactResolveContact$instabridge_ai_sdk_release.getPhones().isEmpty() && resolvedContactResolveContact$instabridge_ai_sdk_release.getEmails().isEmpty()) ? false : true;
            if (!z) {
                getTAG();
            }
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01a3  */
    @Override // com.instabridge.ai.tools.AiTool
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object execute(@NotNull Context context, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull Continuation<? super ToolResult> continuation) throws PackageManager.NameNotFoundException, IOException {
        AnonymousClass1 anonymousClass1;
        String string;
        String string2;
        Context context2;
        String str;
        String str2;
        MessagingApp messagingAppFindBestApp;
        String strNormalizePhone;
        MessagingApp messagingAppFindBestApp2;
        Object next;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            Object obj3 = map.get(ShortcutType.CONTACT);
            if (obj3 == null || (string = obj3.toString()) == null) {
                return new ToolResult.Error("Missing contact", "missing_parameter");
            }
            Object obj4 = map.get(PglCryptUtils.KEY_MESSAGE);
            if (obj4 == null || (string2 = obj4.toString()) == null) {
                return new ToolResult.Error("Missing message", "missing_parameter");
            }
            Object obj5 = map.get("app");
            String string3 = obj5 != null ? obj5.toString() : null;
            anonymousClass1.L$0 = context;
            anonymousClass1.L$1 = string;
            anonymousClass1.L$2 = string2;
            anonymousClass1.L$3 = string3;
            anonymousClass1.label = 1;
            Object objResolveContactWithDisambiguation$instabridge_ai_sdk_release = resolveContactWithDisambiguation$instabridge_ai_sdk_release(context, string, z11, anonymousClass1);
            if (objResolveContactWithDisambiguation$instabridge_ai_sdk_release == obj2) {
                return obj2;
            }
            String str3 = string3;
            context2 = context;
            str = str3;
            obj = objResolveContactWithDisambiguation$instabridge_ai_sdk_release;
            str2 = string;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) anonymousClass1.L$3;
            String str4 = (String) anonymousClass1.L$2;
            str2 = (String) anonymousClass1.L$1;
            Context context3 = (Context) anonymousClass1.L$0;
            ResultKt.b(obj);
            string2 = str4;
            context2 = context3;
        }
        ResolveResult resolveResult = (ResolveResult) obj;
        if (!(resolveResult instanceof ResolveResult.Found)) {
            if (resolveResult instanceof ResolveResult.Ambiguous) {
                return new ToolResult.Error(c0.m("Multiple contacts match '", str2, "'. Please specify which one:\n", g.f1(((ResolveResult.Ambiguous) resolveResult).getCandidates(), "\n", null, null, 0, new b(20), 30)), "ambiguous_contact");
            }
            if (resolveResult == null) {
                return new ToolResult.Error(c0.l("Contact '", str2, "' not found"), "contact_not_found");
            }
            throw new NoWhenBranchMatchedException();
        }
        ResolvedContact contact = ((ResolveResult.Found) resolveResult).getContact();
        getTAG();
        contact.getName();
        contact.getPhones().size();
        contact.getEmails().size();
        if (str != null) {
            Iterator<T> it = APPS.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (j.B0(((MessagingApp) next).getId(), str, true)) {
                    break;
                }
            }
            messagingAppFindBestApp = (MessagingApp) next;
            if (messagingAppFindBestApp == null) {
                return new ToolResult.Error("Unknown app: ".concat(str), "unsupported_app");
            }
        } else {
            messagingAppFindBestApp = findBestApp(context2, contact);
            if (messagingAppFindBestApp == null) {
                return new ToolResult.Error(c0.k("No messaging app for ", str2), "no_app");
            }
        }
        if (!messagingAppFindBestApp.getCanPrefillMessage() && !k.U0(string2) && (messagingAppFindBestApp2 = findBestApp(context2, contact)) != null && messagingAppFindBestApp2.getCanPrefillMessage()) {
            getTAG();
            messagingAppFindBestApp.getId();
            messagingAppFindBestApp2.getId();
            messagingAppFindBestApp.getId();
            messagingAppFindBestApp = messagingAppFindBestApp2;
        }
        try {
            if (messagingAppFindBestApp.getNeedsPhone()) {
                String str5 = (String) g.Y0(contact.getPhones());
                if (str5 == null || (strNormalizePhone = normalizePhone(str5, context2)) == null) {
                    return new ToolResult.Error(c0.k("No phone for ", str2), "no_phone");
                }
            } else {
                if (!messagingAppFindBestApp.getNeedsEmail()) {
                    String str6 = (String) g.Y0(contact.getPhones());
                    if (str6 == null || (strNormalizePhone = normalizePhone(str6, context2)) == null) {
                        String str7 = (String) g.Y0(contact.getEmails());
                        String strNormalizeEmail = str7 != null ? normalizeEmail(str7) : null;
                        if (strNormalizeEmail != null) {
                            str2 = strNormalizeEmail;
                        }
                    }
                    Intent intent = (Intent) messagingAppFindBestApp.getBuildIntent().invoke(str2, string2);
                    if (messagingAppFindBestApp.getPackageName().length() > 0) {
                        intent.setPackage(messagingAppFindBestApp.getPackageName());
                    }
                    intent.addFlags(268435456);
                    context2.startActivity(intent);
                    Log.i(getTAG(), "send_message: ✅ " + messagingAppFindBestApp.getId() + " → " + contact.getName());
                    return new ToolResult.Success(MapsKt.j0(new Pair("app", messagingAppFindBestApp.getId()), new Pair(ShortcutType.CONTACT, contact.getName())), "Opened " + messagingAppFindBestApp.getId() + " with draft to " + contact.getName());
                }
                String str8 = (String) g.Y0(contact.getEmails());
                if (str8 == null || (strNormalizePhone = normalizeEmail(str8)) == null) {
                    return new ToolResult.Error(c0.k("No email for ", str2), "no_email");
                }
            }
            context2.startActivity(intent);
            Log.i(getTAG(), "send_message: ✅ " + messagingAppFindBestApp.getId() + " → " + contact.getName());
            return new ToolResult.Success(MapsKt.j0(new Pair("app", messagingAppFindBestApp.getId()), new Pair(ShortcutType.CONTACT, contact.getName())), "Opened " + messagingAppFindBestApp.getId() + " with draft to " + contact.getName());
        } catch (Exception e3) {
            Log.w(getTAG(), "send_message: " + messagingAppFindBestApp.getId() + " failed (" + e3.getMessage() + "), trying unscoped fallback");
            try {
                Intent intent2 = new Intent("android.intent.action.SEND");
                intent2.setType("text/plain");
                intent2.putExtra("android.intent.extra.TEXT", string2);
                if (!contact.getPhones().isEmpty()) {
                    intent2.putExtra(PlaceTypes.ADDRESS, (String) g.W0(contact.getPhones()));
                }
                intent2.addFlags(268435456);
                Intent intentCreateChooser = Intent.createChooser(intent2, "Send to " + contact.getName());
                intentCreateChooser.addFlags(268435456);
                context2.startActivity(intentCreateChooser);
                Log.i(getTAG(), "send_message: ✅ fallback chooser → " + contact.getName());
                return new ToolResult.Success(MapsKt.j0(new Pair("app", "chooser"), new Pair(ShortcutType.CONTACT, contact.getName())), "Opened share sheet to message " + contact.getName());
            } catch (Exception e11) {
                Log.e(getTAG(), "send_message: all attempts failed for " + contact.getName(), e11);
                return new ToolResult.Error("Failed to send message", "launch_failed");
            }
        }
        str2 = strNormalizePhone;
        Intent intent3 = (Intent) messagingAppFindBestApp.getBuildIntent().invoke(str2, string2);
        if (messagingAppFindBestApp.getPackageName().length() > 0) {
        }
        intent3.addFlags(268435456);
    }

    @NotNull
    public final List<MessagingApp> getAPPS() {
        return APPS;
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

    @Nullable
    public final Function1<List<Pair<String, String>>, Integer> getOnDisambiguateContact() {
        return onDisambiguateContact;
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

    @Nullable
    public final ResolvedContact resolveContact$instabridge_ai_sdk_release(@NotNull Context context, @NotNull String query) throws IOException {
        Object next;
        Intrinsics.g(context, "context");
        Intrinsics.g(query, "query");
        if (k.U0(query)) {
            return null;
        }
        if (PhoneNumberNormalizer.INSTANCE.looksLikePhoneNumber(query)) {
            String strNormalizePhone = normalizePhone(query, context);
            if (strNormalizePhone.length() == 0) {
                strNormalizePhone = query;
            }
            getTAG();
            return new ResolvedContact(query, ul.b.P(strNormalizePhone), EmptyList.f71733a);
        }
        if (looksLikeEmail(query)) {
            String strNormalizeEmail = normalizeEmail(query);
            if (strNormalizeEmail == null) {
                return null;
            }
            getTAG();
            return new ResolvedContact(query, EmptyList.f71733a, ul.b.P(strNormalizeEmail));
        }
        List<ResolvedContact> listSearchContactsByName$instabridge_ai_sdk_release = searchContactsByName$instabridge_ai_sdk_release(context, query);
        if (listSearchContactsByName$instabridge_ai_sdk_release.isEmpty()) {
            getTAG();
            return null;
        }
        List<ResolvedContact> list = listSearchContactsByName$instabridge_ai_sdk_release;
        Iterator<T> it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (j.B0(((ResolvedContact) next).getName(), query, true)) {
                break;
            }
        }
        ResolvedContact resolvedContact = (ResolvedContact) next;
        if (resolvedContact != null) {
            getTAG();
            resolvedContact.getName();
            return resolvedContact;
        }
        if (listSearchContactsByName$instabridge_ai_sdk_release.size() == 1) {
            getTAG();
            ((ResolvedContact) g.W0(listSearchContactsByName$instabridge_ai_sdk_release)).getName();
            return (ResolvedContact) g.W0(listSearchContactsByName$instabridge_ai_sdk_release);
        }
        String tag = getTAG();
        StringBuilder sbK = u4.k("send_message/resolve: '", query, "' → ");
        sbK.append(listSearchContactsByName$instabridge_ai_sdk_release.size());
        sbK.append(" matches: ");
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator<T> it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(((ResolvedContact) it2.next()).getName());
        }
        sbK.append(arrayList);
        Log.w(tag, sbK.toString());
        Function1<? super List<Pair<String, String>>, Integer> function1 = onDisambiguateContact;
        if (function1 == null) {
            Log.w(getTAG(), "send_message/resolve: no disambiguator, using best: " + ((ResolvedContact) g.W0(listSearchContactsByName$instabridge_ai_sdk_release)).getName());
            return (ResolvedContact) g.W0(listSearchContactsByName$instabridge_ai_sdk_release);
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(list, 10));
        for (ResolvedContact resolvedContact2 : list) {
            String str = (String) g.Y0(resolvedContact2.getPhones());
            if (str == null && (str = (String) g.Y0(resolvedContact2.getEmails())) == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            arrayList2.add(new Pair(resolvedContact2.getName(), str));
        }
        int iIntValue = ((Number) function1.invoke(arrayList2)).intValue();
        if (iIntValue < 0 || iIntValue >= listSearchContactsByName$instabridge_ai_sdk_release.size()) {
            getTAG();
            return null;
        }
        getTAG();
        listSearchContactsByName$instabridge_ai_sdk_release.get(iIntValue).getName();
        return listSearchContactsByName$instabridge_ai_sdk_release.get(iIntValue);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolveContactWithDisambiguation$instabridge_ai_sdk_release(@NotNull Context context, @NotNull String str, boolean z11, @NotNull Continuation<? super ResolveResult> continuation) throws IOException {
        SendMessageTool$resolveContactWithDisambiguation$1 sendMessageTool$resolveContactWithDisambiguation$1;
        Object next;
        List<ResolvedContact> list;
        if (continuation instanceof SendMessageTool$resolveContactWithDisambiguation$1) {
            sendMessageTool$resolveContactWithDisambiguation$1 = (SendMessageTool$resolveContactWithDisambiguation$1) continuation;
            int i5 = sendMessageTool$resolveContactWithDisambiguation$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sendMessageTool$resolveContactWithDisambiguation$1.label = i5 - Integer.MIN_VALUE;
            } else {
                sendMessageTool$resolveContactWithDisambiguation$1 = new SendMessageTool$resolveContactWithDisambiguation$1(this, continuation);
            }
        }
        Object obj = sendMessageTool$resolveContactWithDisambiguation$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sendMessageTool$resolveContactWithDisambiguation$1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (k.U0(str)) {
                return null;
            }
            if (PhoneNumberNormalizer.INSTANCE.looksLikePhoneNumber(str)) {
                String strNormalizePhone = normalizePhone(str, context);
                if (strNormalizePhone.length() == 0) {
                    strNormalizePhone = str;
                }
                return new ResolveResult.Found(new ResolvedContact(str, ul.b.P(strNormalizePhone), EmptyList.f71733a));
            }
            if (looksLikeEmail(str)) {
                String strNormalizeEmail = normalizeEmail(str);
                if (strNormalizeEmail == null) {
                    return null;
                }
                return new ResolveResult.Found(new ResolvedContact(str, EmptyList.f71733a, ul.b.P(strNormalizeEmail)));
            }
            List<ResolvedContact> listSearchContactsByName$instabridge_ai_sdk_release = searchContactsByName$instabridge_ai_sdk_release(context, str);
            if (listSearchContactsByName$instabridge_ai_sdk_release.isEmpty()) {
                return null;
            }
            if (listSearchContactsByName$instabridge_ai_sdk_release.size() == 1) {
                return new ResolveResult.Found((ResolvedContact) g.W0(listSearchContactsByName$instabridge_ai_sdk_release));
            }
            List<ResolvedContact> list2 = listSearchContactsByName$instabridge_ai_sdk_release;
            Iterator<T> it = list2.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (j.B0(((ResolvedContact) next).getName(), str, true)) {
                    break;
                }
            }
            ResolvedContact resolvedContact = (ResolvedContact) next;
            if (resolvedContact != null) {
                return new ResolveResult.Found(resolvedContact);
            }
            if (z11) {
                Activity activityFindActivity = ContextUtilsKt.findActivity(context);
                if (activityFindActivity == null || activityFindActivity.isFinishing() || activityFindActivity.isDestroyed()) {
                    getTAG();
                } else {
                    ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
                    for (ResolvedContact resolvedContact2 : list2) {
                        String str2 = (String) g.Y0(resolvedContact2.getPhones());
                        if (str2 == null && (str2 = (String) g.Y0(resolvedContact2.getEmails())) == null) {
                            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        arrayList.add(new Pair(resolvedContact2.getName(), str2));
                    }
                    ContactDisambiguationDialog contactDisambiguationDialog = ContactDisambiguationDialog.INSTANCE;
                    sendMessageTool$resolveContactWithDisambiguation$1.L$0 = listSearchContactsByName$instabridge_ai_sdk_release;
                    sendMessageTool$resolveContactWithDisambiguation$1.label = 1;
                    Object objShow = contactDisambiguationDialog.show(activityFindActivity, str, arrayList, sendMessageTool$resolveContactWithDisambiguation$1);
                    if (objShow == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    obj = objShow;
                    list = listSearchContactsByName$instabridge_ai_sdk_release;
                }
            }
            getTAG();
            listSearchContactsByName$instabridge_ai_sdk_release.size();
            return new ResolveResult.Ambiguous(str, listSearchContactsByName$instabridge_ai_sdk_release);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        list = (List) sendMessageTool$resolveContactWithDisambiguation$1.L$0;
        ResultKt.b(obj);
        int iIntValue = ((Number) obj).intValue();
        if (iIntValue < 0 || iIntValue >= list.size()) {
            getTAG();
            return null;
        }
        getTAG();
        list.get(iIntValue).getName();
        return new ResolveResult.Found(list.get(iIntValue));
    }

    @NotNull
    public final List<ResolvedContact> searchContactsByName$instabridge_ai_sdk_release(@NotNull Context context, @NotNull String name2) throws IOException {
        Intrinsics.g(context, "context");
        Intrinsics.g(name2, "name");
        if (o4.a.a(context, "android.permission.READ_CONTACTS") != 0) {
            return EmptyList.f71733a;
        }
        List<ResolvedContact> listSearchContactsLike = searchContactsLike(context, name2);
        if (!listSearchContactsLike.isEmpty()) {
            return listSearchContactsLike;
        }
        List<ResolvedContact> listSearchContactsFilter = searchContactsFilter(context, name2);
        return !listSearchContactsFilter.isEmpty() ? listSearchContactsFilter : searchContactsByNickname(context, name2);
    }

    public final void setOnDisambiguateContact(@Nullable Function1<? super List<Pair<String, String>>, Integer> function1) {
        onDisambiguateContact = function1;
    }

    @Override // com.instabridge.ai.tools.AiTool
    @NotNull
    public ToolDefinition toDefinition() throws PackageManager.NameNotFoundException {
        Context context;
        List<String> installedMessagingApps;
        try {
            context = fo.d.f55465c;
        } catch (Exception unused) {
            context = null;
        }
        if (context != null) {
            installedMessagingApps = getInstalledMessagingApps(context);
        } else {
            List<MessagingApp> list = APPS;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(((MessagingApp) it.next()).getId());
            }
            installedMessagingApps = arrayList;
        }
        if (installedMessagingApps.isEmpty()) {
            return new ToolDefinition(getName(), "unavailable", h.f17594a, getToolType(), getCategory(), null, 32, null);
        }
        return new ToolDefinition(getName(), c0.l("Draft a message to a contact with the message prefilled. Resolves names automatically. Opens the app with a prefilled DRAFT the user reviews before sending.\nAvailable apps: ", g.f1(installedMessagingApps, ", ", null, null, 0, new b(21), 30), ".\n\nIMPORTANT: Always use the FULL name as it appears in the contacts context (e.g. 'Mona Dadoun' not just 'Mona'). This ensures correct contact resolution.\n\nExamples:\n• contact='Mona Dadoun' app='Signal' message='Found an amazing brunch spot!' → Signal chat with Mona\n• contact='Mom' message='Happy Easter! 🐣' → best available app\n• contact='Daniel Wikell' app='SMS' message='Running 10 min late' → default SMS app"), MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "object"), new Pair("properties", MapsKt.j0(new Pair(ShortcutType.CONTACT, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "FULL contact name exactly as shown in the contacts context (e.g. 'Mona Dadoun', not just 'Mona'). Or a phone number or email address."))), new Pair("app", MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Messaging app. If omitted, uses best available for this contact."), new Pair("enum", installedMessagingApps))), new Pair(PglCryptUtils.KEY_MESSAGE, MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "string"), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, "Message text to prefill as a draft. Be natural and personal."))))), new Pair("required", ul.b.Q(ShortcutType.CONTACT, PglCryptUtils.KEY_MESSAGE))), getToolType(), getCategory(), null, 32, null);
    }

    @JvmStatic
    @NotNull
    public static final String normalizePhone(@NotNull String phone) {
        Intrinsics.g(phone, "phone");
        return PhoneNumberNormalizer.INSTANCE.normalizeInternational(phone);
    }

    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001Bk\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\b\u001a\u00020\u0006\u00126\u0010\t\u001a2\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\n¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0006HÆ\u0003J9\u0010 \u001a2\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\nHÆ\u0003Ju\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\u000628\b\u0002\u0010\t\u001a2\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\nHÆ\u0001J\u0013\u0010\"\u001a\u00020\u00062\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020%HÖ\u0001J\t\u0010&\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0013R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0016R\u0011\u0010\b\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0016RA\u0010\t\u001a2\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\n¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001a¨\u0006'"}, d2 = {"Lcom/instabridge/ai/tools/SendMessageTool$MessagingApp;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", "needsPhone", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "needsEmail", "canPrefillMessage", "buildIntent", "Lkotlin/Function2;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "recipientId", PglCryptUtils.KEY_MESSAGE, "Landroid/content/Intent;", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZZZLkotlin/jvm/functions/Function2;)V", "getId", "()Ljava/lang/String;", "getPackageName", "getNeedsPhone", "()Z", "getNeedsEmail", "getCanPrefillMessage", "getBuildIntent", "()Lkotlin/jvm/functions/Function2;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class MessagingApp {
        public static final int $stable = 0;

        @NotNull
        private final Function2<String, String, Intent> buildIntent;
        private final boolean canPrefillMessage;

        @NotNull
        private final String id;
        private final boolean needsEmail;
        private final boolean needsPhone;

        @NotNull
        private final String packageName;

        /* JADX WARN: Multi-variable type inference failed */
        public MessagingApp(@NotNull String id2, @NotNull String packageName, boolean z11, boolean z12, boolean z13, @NotNull Function2<? super String, ? super String, ? extends Intent> buildIntent) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(buildIntent, "buildIntent");
            this.id = id2;
            this.packageName = packageName;
            this.needsPhone = z11;
            this.needsEmail = z12;
            this.canPrefillMessage = z13;
            this.buildIntent = buildIntent;
        }

        public static /* synthetic */ MessagingApp copy$default(MessagingApp messagingApp, String str, String str2, boolean z11, boolean z12, boolean z13, Function2 function2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = messagingApp.id;
            }
            if ((i5 & 2) != 0) {
                str2 = messagingApp.packageName;
            }
            if ((i5 & 4) != 0) {
                z11 = messagingApp.needsPhone;
            }
            if ((i5 & 8) != 0) {
                z12 = messagingApp.needsEmail;
            }
            if ((i5 & 16) != 0) {
                z13 = messagingApp.canPrefillMessage;
            }
            if ((i5 & 32) != 0) {
                function2 = messagingApp.buildIntent;
            }
            boolean z14 = z13;
            Function2 function22 = function2;
            return messagingApp.copy(str, str2, z11, z12, z14, function22);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getPackageName() {
            return this.packageName;
        }

        /* renamed from: component3, reason: from getter */
        public final boolean getNeedsPhone() {
            return this.needsPhone;
        }

        /* renamed from: component4, reason: from getter */
        public final boolean getNeedsEmail() {
            return this.needsEmail;
        }

        /* renamed from: component5, reason: from getter */
        public final boolean getCanPrefillMessage() {
            return this.canPrefillMessage;
        }

        @NotNull
        public final Function2<String, String, Intent> component6() {
            return this.buildIntent;
        }

        @NotNull
        public final MessagingApp copy(@NotNull String id2, @NotNull String packageName, boolean needsPhone, boolean needsEmail, boolean canPrefillMessage, @NotNull Function2<? super String, ? super String, ? extends Intent> buildIntent) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(buildIntent, "buildIntent");
            return new MessagingApp(id2, packageName, needsPhone, needsEmail, canPrefillMessage, buildIntent);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MessagingApp)) {
                return false;
            }
            MessagingApp messagingApp = (MessagingApp) other;
            return Intrinsics.b(this.id, messagingApp.id) && Intrinsics.b(this.packageName, messagingApp.packageName) && this.needsPhone == messagingApp.needsPhone && this.needsEmail == messagingApp.needsEmail && this.canPrefillMessage == messagingApp.canPrefillMessage && Intrinsics.b(this.buildIntent, messagingApp.buildIntent);
        }

        @NotNull
        public final Function2<String, String, Intent> getBuildIntent() {
            return this.buildIntent;
        }

        public final boolean getCanPrefillMessage() {
            return this.canPrefillMessage;
        }

        @NotNull
        public final String getId() {
            return this.id;
        }

        public final boolean getNeedsEmail() {
            return this.needsEmail;
        }

        public final boolean getNeedsPhone() {
            return this.needsPhone;
        }

        @NotNull
        public final String getPackageName() {
            return this.packageName;
        }

        public int hashCode() {
            return this.buildIntent.hashCode() + c9.f(c9.f(c9.f(c0.e(this.id.hashCode() * 31, 31, this.packageName), 31, this.needsPhone), 31, this.needsEmail), 31, this.canPrefillMessage);
        }

        @NotNull
        public String toString() {
            return "MessagingApp(id=" + this.id + ", packageName=" + this.packageName + ", needsPhone=" + this.needsPhone + ", needsEmail=" + this.needsEmail + ", canPrefillMessage=" + this.canPrefillMessage + ", buildIntent=" + this.buildIntent + ')';
        }

        public /* synthetic */ MessagingApp(String str, String str2, boolean z11, boolean z12, boolean z13, Function2 function2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, z11, (i5 & 8) != 0 ? false : z12, (i5 & 16) != 0 ? true : z13, function2);
        }
    }
}
