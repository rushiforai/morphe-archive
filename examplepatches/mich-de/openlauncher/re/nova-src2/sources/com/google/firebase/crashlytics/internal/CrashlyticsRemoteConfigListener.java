package com.google.firebase.crashlytics.internal;

import an.e;
import an.f;
import b70.c;
import com.google.firebase.crashlytics.internal.metadata.RolloutAssignment;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\u0018\u0000B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001¢\u0006\u0004\b\u0003\u0010\u0004J\u0017\u0010\b\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\b\u0010\tR\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0002\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/google/firebase/crashlytics/internal/CrashlyticsRemoteConfigListener;", "Lcom/google/firebase/crashlytics/internal/metadata/UserMetadata;", "userMetadata", "<init>", "(Lcom/google/firebase/crashlytics/internal/metadata/UserMetadata;)V", "Lan/f;", "rolloutsState", b.f42142b, "onRolloutsStateChanged", "(Lan/f;)V", "Lcom/google/firebase/crashlytics/internal/metadata/UserMetadata;", "com.google.firebase-firebase-crashlytics"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class CrashlyticsRemoteConfigListener {

    @NotNull
    private final UserMetadata userMetadata;

    public CrashlyticsRemoteConfigListener(@NotNull UserMetadata userMetadata) {
        Intrinsics.g(userMetadata, "userMetadata");
        this.userMetadata = userMetadata;
    }

    public void onRolloutsStateChanged(@NotNull f rolloutsState) {
        Intrinsics.g(rolloutsState, "rolloutsState");
        UserMetadata userMetadata = this.userMetadata;
        Set<e> setB = rolloutsState.b();
        ArrayList arrayList = new ArrayList(c.u0(setB, 10));
        for (e eVar : setB) {
            arrayList.add(RolloutAssignment.create(eVar.d(), eVar.b(), eVar.c(), eVar.f(), eVar.e()));
        }
        userMetadata.updateRolloutsState(arrayList);
        Logger.getLogger().d("Updated Crashlytics Rollout State");
    }
}
