package com.instabridge.ai.billing;

import a1.m;
import ab.e0;
import android.content.Context;
import android.content.SharedPreferences;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.collections.c;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.i;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0006\b\u0007\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000e\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fJ\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u000e\u001a\u00020\u000fJ\u0016\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u000fJ\u000e\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000e\u001a\u00020\u000fJ\u0010\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u000fH\u0002J\u0010\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0016\u001a\u00020\u000fH\u0002R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\n \u000b*\u0004\u0018\u00010\n0\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/billing/RejectedTokenStore;", b.f42142b, "context", "Landroid/content/Context;", "nowMs", "Lkotlin/Function0;", b.f42142b, "<init>", "(Landroid/content/Context;Lkotlin/jvm/functions/Function0;)V", "prefs", "Landroid/content/SharedPreferences;", "kotlin.jvm.PlatformType", "isRejected", b.f42142b, "purchaseToken", b.f42142b, "denialReason", "record", b.f42142b, "clear", "ttlFor", "hash", "token", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class RejectedTokenStore {
    private static final int MAX_ENTRIES = 50;

    @NotNull
    private static final String PREFS_NAME = "ai_sdk_rejected_tokens";

    @NotNull
    private static final Map<String, Long> TTL_MS_BY_REASON;
    private static final long TTL_MS_DEFAULT = 60000;

    @NotNull
    private final Function0<Long> nowMs;
    private final SharedPreferences prefs;
    public static final int $stable = 8;

    static {
        Pair pair = new Pair("invalid_token", 900000L);
        Long lValueOf = Long.valueOf(TTL_MS_DEFAULT);
        TTL_MS_BY_REASON = MapsKt.j0(pair, new Pair("canceled", lValueOf), new Pair("expired", lValueOf), new Pair("paused", lValueOf), new Pair("not_active_yet", lValueOf));
    }

    public RejectedTokenStore(@NotNull Context context, @NotNull Function0<Long> nowMs) {
        Intrinsics.g(context, "context");
        Intrinsics.g(nowMs, "nowMs");
        this.nowMs = nowMs;
        this.prefs = context.getApplicationContext().getSharedPreferences(PREFS_NAME, 0);
    }

    private final String hash(String token) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        byte[] bytes = token.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        byte[] bArrDigest = messageDigest.digest(bytes);
        Intrinsics.d(bArrDigest);
        return c.M0(bArrDigest, b.f42142b, new a00.a(16), 30);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence hash$lambda$6(byte b11) {
        return String.format("%02x", Arrays.copyOf(new Object[]{Byte.valueOf(b11)}, 1));
    }

    private final long ttlFor(String denialReason) {
        Long l9 = TTL_MS_BY_REASON.get(denialReason);
        return l9 != null ? l9.longValue() : TTL_MS_DEFAULT;
    }

    public final void clear(@NotNull String purchaseToken) {
        Intrinsics.g(purchaseToken, "purchaseToken");
        this.prefs.edit().remove(hash(purchaseToken)).apply();
    }

    @Nullable
    public final String denialReason(@NotNull String purchaseToken) {
        Intrinsics.g(purchaseToken, "purchaseToken");
        String strHash = hash(purchaseToken);
        String string = this.prefs.getString(strHash, null);
        if (string == null) {
            return null;
        }
        List listI1 = r70.k.i1(string, new String[]{"|"}, 2);
        if (listI1.size() != 2) {
            this.prefs.edit().remove(strHash).apply();
            return null;
        }
        Long lV0 = i.v0((String) listI1.get(0));
        if (lV0 == null) {
            this.prefs.edit().remove(strHash).apply();
            return null;
        }
        long jLongValue = lV0.longValue();
        String str = (String) listI1.get(1);
        if (str.length() == 0) {
            this.prefs.edit().remove(strHash).apply();
            return null;
        }
        if (((Number) this.nowMs.invoke()).longValue() - jLongValue <= ttlFor(str)) {
            return str;
        }
        this.prefs.edit().remove(strHash).apply();
        return null;
    }

    public final boolean isRejected(@NotNull String purchaseToken) {
        Intrinsics.g(purchaseToken, "purchaseToken");
        return denialReason(purchaseToken) != null;
    }

    public final void record(@NotNull String purchaseToken, @NotNull String denialReason) {
        Intrinsics.g(purchaseToken, "purchaseToken");
        Intrinsics.g(denialReason, "denialReason");
        String strHash = hash(purchaseToken);
        String str = ((Number) this.nowMs.invoke()).longValue() + '|' + denialReason;
        SharedPreferences.Editor editorPutString = this.prefs.edit().putString(strHash, str);
        Map<String, ?> all = this.prefs.getAll();
        Intrinsics.f(all, "getAll(...)");
        LinkedHashMap linkedHashMapU0 = MapsKt.u0(all);
        linkedHashMapU0.put(strHash, str);
        if (linkedHashMapU0.size() > 50) {
            Set<Map.Entry> setEntrySet = linkedHashMapU0.entrySet();
            ArrayList arrayList = new ArrayList();
            for (Map.Entry entry : setEntrySet) {
                Object value = entry.getValue();
                String str2 = value instanceof String ? (String) value : null;
                Long lV0 = str2 != null ? i.v0(r70.k.p1(str2, "|", str2)) : null;
                Pair pair = lV0 != null ? new Pair(entry.getKey(), lV0) : null;
                if (pair != null) {
                    arrayList.add(pair);
                }
            }
            List listE1 = g.E1(g.D1(new Comparator() { // from class: com.instabridge.ai.billing.RejectedTokenStore$record$$inlined$sortedBy$1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.util.Comparator
                public final int compare(T t6, T t9) {
                    return e0.t((Long) ((Pair) t6).f71684b, (Long) ((Pair) t9).f71684b);
                }
            }, arrayList), linkedHashMapU0.size() - 50);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(listE1, 10));
            Iterator it = listE1.iterator();
            while (it.hasNext()) {
                arrayList2.add((String) ((Pair) it.next()).f71683a);
            }
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                editorPutString.remove((String) it2.next());
            }
        }
        editorPutString.apply();
    }

    public /* synthetic */ RejectedTokenStore(Context context, Function0 function0, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i5 & 2) != 0 ? new m(28) : function0);
    }
}
