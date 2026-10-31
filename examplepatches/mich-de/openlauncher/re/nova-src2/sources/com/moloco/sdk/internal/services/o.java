package com.moloco.sdk.internal.services;

import android.content.Context;
import android.media.AudioManager;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class o implements n {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38120b = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final AudioManager f38121a;

    public o(@NotNull Context context) {
        AudioManager audioManager;
        Intrinsics.g(context, "context");
        try {
            audioManager = (AudioManager) context.getApplicationContext().getSystemService(AudioManager.class);
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, p.f38122a, "couldn't get android.media.AudioManager service", e3, false, 8, null);
            audioManager = null;
        }
        this.f38121a = audioManager;
    }

    @Override // com.moloco.sdk.internal.services.n
    @NotNull
    public z a() {
        AudioManager audioManager = this.f38121a;
        Integer numValueOf = audioManager != null ? Integer.valueOf(audioManager.getRingerMode()) : null;
        return (numValueOf != null && numValueOf.intValue() == 0) ? z.f38176a : (numValueOf != null && numValueOf.intValue() == 1) ? z.f38177b : (numValueOf != null && numValueOf.intValue() == 2) ? z.f38178c : z.f38178c;
    }

    @Override // com.moloco.sdk.internal.services.n
    public int b() {
        AudioManager audioManager = this.f38121a;
        if (audioManager != null) {
            return audioManager.getStreamVolume(3);
        }
        return 0;
    }

    @Override // com.moloco.sdk.internal.services.n
    public boolean c() {
        AudioManager audioManager = this.f38121a;
        if (audioManager == null) {
            return false;
        }
        return audioManager.isStreamMute(3);
    }
}
