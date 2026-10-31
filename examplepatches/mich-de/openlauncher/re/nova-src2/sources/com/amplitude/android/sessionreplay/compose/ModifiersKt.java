package com.amplitude.android.sessionreplay.compose;

import b2.t;
import com.amplitude.W0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a\u0013\u0010\u0001\u001a\u00020\u0000*\u00020\u0000H\u0007¢\u0006\u0004\b\u0001\u0010\u0002\u001a\u0013\u0010\u0003\u001a\u00020\u0000*\u00020\u0000H\u0007¢\u0006\u0004\b\u0003\u0010\u0002\u001a\u0013\u0010\u0004\u001a\u00020\u0000*\u00020\u0000H\u0007¢\u0006\u0004\b\u0004\u0010\u0002\u001a\u0013\u0010\u0005\u001a\u00020\u0000*\u00020\u0000H\u0007¢\u0006\u0004\b\u0005\u0010\u0002¨\u0006\u0006"}, d2 = {"Lb2/t;", "ampMask", "(Lb2/t;)Lb2/t;", "ampUnmask", "ampBlock", "ampBitmap", "session-replay_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ModifiersKt {
    public static final t ampBitmap(t tVar) {
        Intrinsics.g(tVar, "<this>");
        return tVar.then(new W0("amp-bitmap"));
    }

    public static final t ampBlock(t tVar) {
        Intrinsics.g(tVar, "<this>");
        return tVar.then(new W0("amp-block"));
    }

    public static final t ampMask(t tVar) {
        Intrinsics.g(tVar, "<this>");
        return tVar.then(new W0("amp-mask"));
    }

    public static final t ampUnmask(t tVar) {
        Intrinsics.g(tVar, "<this>");
        return tVar.then(new W0("amp-unmask"));
    }
}
