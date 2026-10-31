package com.google.android.libraries.places.internal;

import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;

/* loaded from: classes3.dex */
final class zzaec implements zzaty {
    static final zzaty zza = new zzaec();

    private zzaec() {
    }

    @Override // com.google.android.libraries.places.internal.zzaty
    public final boolean zza(int i5) {
        if (i5 == 0) {
            return true;
        }
        switch (i5) {
            case 1000:
            case 1001:
            case 1002:
            case BackupConstant.SCENE_CLOSED_WITHOUT_SHOW /* 1003 */:
                return true;
            default:
                return false;
        }
    }
}
