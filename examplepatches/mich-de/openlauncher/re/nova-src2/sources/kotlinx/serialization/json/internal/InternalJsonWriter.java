package kotlinx.serialization.json.internal;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@JsonFriendModuleApi
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\bg\u0018\u0000 \u000e2\u00020\u0001:\u0001\u000eJ\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\bH&J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u000bH&J\u0010\u0010\f\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u000bH&J\b\u0010\r\u001a\u00020\u0003H&¨\u0006\u000fÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/json/internal/InternalJsonWriter;", b.f42142b, "writeLong", b.f42142b, "value", b.f42142b, "writeChar", "char", b.f42142b, "write", "text", b.f42142b, "writeQuoted", "release", k.O, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface InternalJsonWriter {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003Ja\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072K\u0010\b\u001aG\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\n\u0012\b\b\u000b\u0012\u0004\b\b(\u0006\u0012\u0013\u0012\u00110\f¢\u0006\f\b\n\u0012\b\b\u000b\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\f¢\u0006\f\b\n\u0012\b\b\u000b\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u00050\tH\u0086\bø\u0001\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u000f"}, d2 = {"Lkotlinx/serialization/json/internal/InternalJsonWriter$Companion;", b.f42142b, "<init>", "()V", "doWriteEscaping", b.f42142b, "text", b.f42142b, "writeImpl", "Lkotlin/Function3;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, b.f42142b, "startIndex", "endIndex", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        private Companion() {
        }

        public final void doWriteEscaping(@NotNull String text, @NotNull Function3<? super String, ? super Integer, ? super Integer, Unit> writeImpl) {
            Intrinsics.g(text, "text");
            Intrinsics.g(writeImpl, "writeImpl");
            int length = text.length();
            int i5 = 0;
            for (int i11 = 0; i11 < length; i11++) {
                char cCharAt = text.charAt(i11);
                if (cCharAt < StringOpsKt.getESCAPE_STRINGS().length && StringOpsKt.getESCAPE_STRINGS()[cCharAt] != null) {
                    writeImpl.invoke(text, Integer.valueOf(i5), Integer.valueOf(i11));
                    String str = StringOpsKt.getESCAPE_STRINGS()[cCharAt];
                    Intrinsics.d(str);
                    writeImpl.invoke(str, 0, Integer.valueOf(str.length()));
                    i5 = i11 + 1;
                }
            }
            writeImpl.invoke(text, Integer.valueOf(i5), Integer.valueOf(text.length()));
        }
    }

    void release();

    void write(@NotNull String text);

    void writeChar(char c11);

    void writeLong(long value);

    void writeQuoted(@NotNull String text);
}
