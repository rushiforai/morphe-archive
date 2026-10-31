package kotlinx.serialization;

import b.c0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.PublishedApi;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\b\u0001\u0018\u00002\u00020\u0001B\u0013\b\u0000\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005B\u0011\b\u0016\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\u0004\u0010\b¨\u0006\t"}, d2 = {"Lkotlinx/serialization/UnknownFieldException;", "Lkotlinx/serialization/SerializationException;", PglCryptUtils.KEY_MESSAGE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;)V", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(I)V", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes.dex */
public final class UnknownFieldException extends SerializationException {
    public UnknownFieldException(@Nullable String str) {
        super(str);
    }

    public UnknownFieldException(int i5) {
        this(c0.h(i5, "An unknown field for index "));
    }
}
