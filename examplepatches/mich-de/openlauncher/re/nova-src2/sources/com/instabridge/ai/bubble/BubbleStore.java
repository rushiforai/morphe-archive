package com.instabridge.ai.bubble;

import android.content.Context;
import android.content.SharedPreferences;
import aq.e0;
import aq.f;
import aq.h0;
import aq.r;
import b.c9;
import bq.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.j0;
import h6.m0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u0000 )2\u00020\u0001:\u0001)B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u000b\u0010\fJ\r\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\r\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\r\u0010\u0013\u001a\u00020\b¢\u0006\u0004\b\u0013\u0010\u0014J\r\u0010\u0015\u001a\u00020\r¢\u0006\u0004\b\u0015\u0010\u000fJ\r\u0010\u0016\u001a\u00020\b¢\u0006\u0004\b\u0016\u0010\u0014J\r\u0010\u0017\u001a\u00020\b¢\u0006\u0004\b\u0017\u0010\u0014R\u0014\u0010\u0019\u001a\u00020\u00188\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010\u001aR\u001c\u0010\u001d\u001a\n \u001c*\u0004\u0018\u00010\u001b0\u001b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR8\u0010 \u001a&\u0012\f\u0012\n \u001c*\u0004\u0018\u00010\u00060\u0006 \u001c*\u0012\u0012\f\u0012\n \u001c*\u0004\u0018\u00010\u00060\u0006\u0018\u00010\u001f0\u001f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b \u0010!R\u001c\u0010#\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\"8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b#\u0010$R\u0019\u0010(\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060%8F¢\u0006\u0006\u001a\u0004\b&\u0010'¨\u0006*"}, d2 = {"Lcom/instabridge/ai/bubble/BubbleStore;", b.f42142b, "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Lcom/instabridge/ai/bubble/BubbleData;", "bubble", b.f42142b, ActionCategory.SAVE, "(Lcom/instabridge/ai/bubble/BubbleData;)V", "load", "()Lcom/instabridge/ai/bubble/BubbleData;", b.f42142b, "isStale", "()Z", b.f42142b, "lastFetchTime", "()J", "markInteracted", "()V", "wasInteracted", "clearInteracted", "clear", "Landroid/content/SharedPreferences;", "prefs", "Landroid/content/SharedPreferences;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Laq/r;", "adapter", "Laq/r;", "Lh6/m0;", "_latestBubble", "Lh6/m0;", "Lh6/j0;", "getLatestBubble", "()Lh6/j0;", "latestBubble", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class BubbleStore {

    @NotNull
    private static final String KEY_BUBBLE_JSON = "latest_bubble";

    @NotNull
    private static final String KEY_FETCH_TIME = "last_fetch_time";

    @NotNull
    private static final String KEY_INTERACTED = "bubble_interacted";

    @NotNull
    private static final String PREFS_NAME = "instabridge_ai_bubble_prefs";
    private static final long STALE_THRESHOLD_MS = 14400000;

    @NotNull
    private final m0 _latestBubble;
    private final r adapter;
    private final h0 moshi;

    @NotNull
    private final SharedPreferences prefs;
    public static final int $stable = 8;

    public BubbleStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getSharedPreferences(PREFS_NAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
        e0 e0Var = new e0(0);
        e0Var.d(new f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        this.adapter = h0Var.b(BubbleData.class, e.f18422a, null);
        m0 m0Var = new m0();
        this._latestBubble = m0Var;
        BubbleData bubbleDataLoad = load();
        if (bubbleDataLoad != null) {
            m0Var.k(bubbleDataLoad);
        }
    }

    public final void clear() {
        this.prefs.edit().clear().apply();
        this._latestBubble.k(null);
    }

    public final void clearInteracted() {
        c9.q(this.prefs, KEY_INTERACTED, false);
    }

    @NotNull
    public final j0 getLatestBubble() {
        return this._latestBubble;
    }

    public final boolean isStale() {
        return System.currentTimeMillis() - this.prefs.getLong(KEY_FETCH_TIME, 0L) > STALE_THRESHOLD_MS;
    }

    public final long lastFetchTime() {
        return this.prefs.getLong(KEY_FETCH_TIME, 0L);
    }

    @Nullable
    public final BubbleData load() {
        String string;
        if (isStale() || (string = this.prefs.getString(KEY_BUBBLE_JSON, null)) == null) {
            return null;
        }
        try {
            return (BubbleData) this.adapter.b(string);
        } catch (Exception unused) {
            return null;
        }
    }

    public final void markInteracted() {
        c9.q(this.prefs, KEY_INTERACTED, true);
    }

    public final void save(@NotNull BubbleData bubble) {
        Intrinsics.g(bubble, "bubble");
        this.prefs.edit().putString(KEY_BUBBLE_JSON, this.adapter.d(bubble)).putLong(KEY_FETCH_TIME, bubble.getFetchedAt()).apply();
        this._latestBubble.k(bubble);
    }

    public final boolean wasInteracted() {
        return this.prefs.getBoolean(KEY_INTERACTED, false);
    }
}
