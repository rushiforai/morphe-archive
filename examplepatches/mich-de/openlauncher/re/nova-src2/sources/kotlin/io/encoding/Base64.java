package kotlin.io.encoding;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.enums.EnumEntriesKt;

@ExperimentalEncodingApi
@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0017\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/io/encoding/Base64;", b.f42142b, "PaddingOption", "Default", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public class Base64 {

    /* renamed from: c, reason: collision with root package name */
    public static final Default f71835c = new Default(0);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f71836a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f71837b;

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u0005\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0005\u0010\u0006R\u0014\u0010\u0007\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0007\u0010\u0006R\u0014\u0010\b\u001a\u00020\u00048\u0000X\u0080T¢\u0006\u0006\n\u0004\b\b\u0010\u0006R\u0014\u0010\t\u001a\u00020\u00048\u0000X\u0080T¢\u0006\u0006\n\u0004\b\t\u0010\u0006R\u0014\u0010\u000b\u001a\u00020\n8\u0000X\u0080T¢\u0006\u0006\n\u0004\b\u000b\u0010\fR\u0014\u0010\r\u001a\u00020\u00048\u0000X\u0080T¢\u0006\u0006\n\u0004\b\r\u0010\u0006R\u0014\u0010\u000e\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u000e\u0010\u0006¨\u0006\u000f"}, d2 = {"Lkotlin/io/encoding/Base64$Default;", "Lkotlin/io/encoding/Base64;", "<init>", "()V", b.f42142b, "bitsPerByte", "I", "bitsPerSymbol", "bytesPerGroup", "symbolsPerGroup", b.f42142b, "padSymbol", "B", "mimeLineLength", "mimeGroupsPerLine", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Default extends Base64 {
        public /* synthetic */ Default(int i5) {
            this();
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private Default() {
            super(false, false);
            PaddingOption[] paddingOptionArr = PaddingOption.f71838a;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @SinceKotlin
    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/io/encoding/Base64$PaddingOption;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class PaddingOption {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ PaddingOption[] f71838a;

        static {
            PaddingOption[] paddingOptionArr = {new PaddingOption("PRESENT", 0), new PaddingOption("ABSENT", 1), new PaddingOption("PRESENT_OPTIONAL", 2), new PaddingOption("ABSENT_OPTIONAL", 3)};
            f71838a = paddingOptionArr;
            EnumEntriesKt.a(paddingOptionArr);
        }

        public static PaddingOption valueOf(String str) {
            return (PaddingOption) Enum.valueOf(PaddingOption.class, str);
        }

        public static PaddingOption[] values() {
            return (PaddingOption[]) f71838a.clone();
        }
    }

    static {
        PaddingOption[] paddingOptionArr = PaddingOption.f71838a;
        new Base64(true, false);
        new Base64(false, true);
    }

    public Base64(boolean z11, boolean z12) {
        PaddingOption[] paddingOptionArr = PaddingOption.f71838a;
        this.f71836a = z11;
        this.f71837b = z12;
        if (z11 && z12) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }
}
