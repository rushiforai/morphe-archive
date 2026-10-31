package com.moloco.sdk.internal.services.proto;

import com.moloco.sdk.UserIntent;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public interface a {

    /* renamed from: com.moloco.sdk.internal.services.proto.a$a, reason: collision with other inner class name */
    /* loaded from: classes4.dex */
    public static final class C0177a {
        public static /* synthetic */ String a(a aVar, UserIntent.UserAdInteractionExt userAdInteractionExt, int i5, int i11, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: encodeUserAdInteractionExt");
            }
            if ((i11 & 2) != 0) {
                i5 = 10;
            }
            return aVar.a(userAdInteractionExt, i5);
        }
    }

    @NotNull
    String a(@NotNull UserIntent.UserAdInteractionExt userAdInteractionExt, int i5);
}
