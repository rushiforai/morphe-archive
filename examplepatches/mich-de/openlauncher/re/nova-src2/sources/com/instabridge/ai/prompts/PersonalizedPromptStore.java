package com.instabridge.ai.prompts;

import android.content.Context;
import android.content.SharedPreferences;
import aq.e0;
import aq.f;
import aq.h0;
import aq.r;
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

@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u0000 &2\u00020\u0001:\u0001&B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u000b\u0010\fJ\r\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\r\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\r\u0010\u0013\u001a\u00020\b¢\u0006\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0016\u001a\u00020\u00158\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010\u0017R\u001c\u0010\u001a\u001a\n \u0019*\u0004\u0018\u00010\u00180\u00188\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010\u001bR8\u0010\u001d\u001a&\u0012\f\u0012\n \u0019*\u0004\u0018\u00010\u00060\u0006 \u0019*\u0012\u0012\f\u0012\n \u0019*\u0004\u0018\u00010\u00060\u0006\u0018\u00010\u001c0\u001c8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\u001c\u0010 \u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u001f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b \u0010!R\u0019\u0010%\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\"8F¢\u0006\u0006\u001a\u0004\b#\u0010$¨\u0006'"}, d2 = {"Lcom/instabridge/ai/prompts/PersonalizedPromptStore;", b.f42142b, "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Lcom/instabridge/ai/prompts/PersonalizedPromptData;", "data", b.f42142b, ActionCategory.SAVE, "(Lcom/instabridge/ai/prompts/PersonalizedPromptData;)V", "load", "()Lcom/instabridge/ai/prompts/PersonalizedPromptData;", b.f42142b, "isStale", "()Z", b.f42142b, "lastFetchTime", "()J", "clear", "()V", "Landroid/content/SharedPreferences;", "prefs", "Landroid/content/SharedPreferences;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Laq/r;", "adapter", "Laq/r;", "Lh6/m0;", "_latestPrompts", "Lh6/m0;", "Lh6/j0;", "getLatestPrompts", "()Lh6/j0;", "latestPrompts", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class PersonalizedPromptStore {

    @NotNull
    private static final String KEY_FETCH_TIME = "last_fetch_time";

    @NotNull
    private static final String KEY_PROMPTS_JSON = "personalized_prompts";

    @NotNull
    private static final String PREFS_NAME = "instabridge_ai_prompt_prefs";
    private static final long STALE_THRESHOLD_MS = 604800000;

    @NotNull
    private final m0 _latestPrompts;
    private final r adapter;
    private final h0 moshi;

    @NotNull
    private final SharedPreferences prefs;
    public static final int $stable = 8;

    public PersonalizedPromptStore(@NotNull Context context) {
        Intrinsics.g(context, "context");
        SharedPreferences sharedPreferences = context.getSharedPreferences(PREFS_NAME, 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.prefs = sharedPreferences;
        e0 e0Var = new e0(0);
        e0Var.d(new f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        this.adapter = h0Var.b(PersonalizedPromptData.class, e.f18422a, null);
        m0 m0Var = new m0();
        this._latestPrompts = m0Var;
        PersonalizedPromptData personalizedPromptDataLoad = load();
        if (personalizedPromptDataLoad != null) {
            m0Var.k(personalizedPromptDataLoad);
        }
    }

    public final void clear() {
        this.prefs.edit().clear().apply();
        this._latestPrompts.k(null);
    }

    @NotNull
    public final j0 getLatestPrompts() {
        return this._latestPrompts;
    }

    public final boolean isStale() {
        return System.currentTimeMillis() - this.prefs.getLong(KEY_FETCH_TIME, 0L) > 604800000;
    }

    public final long lastFetchTime() {
        return this.prefs.getLong(KEY_FETCH_TIME, 0L);
    }

    @Nullable
    public final PersonalizedPromptData load() {
        String string;
        if (isStale() || (string = this.prefs.getString(KEY_PROMPTS_JSON, null)) == null) {
            return null;
        }
        try {
            return (PersonalizedPromptData) this.adapter.b(string);
        } catch (Exception unused) {
            return null;
        }
    }

    public final void save(@NotNull PersonalizedPromptData data) {
        Intrinsics.g(data, "data");
        this.prefs.edit().putString(KEY_PROMPTS_JSON, this.adapter.d(data)).putLong(KEY_FETCH_TIME, data.getFetchedAt()).apply();
        this._latestPrompts.k(data);
    }
}
