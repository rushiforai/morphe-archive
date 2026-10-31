package kotlin.text;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.ExperimentalStdlibApi;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.SinceKotlin;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/text/HexFormat;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "BytesHexFormat", "NumberHexFormat", "Builder", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalStdlibApi
/* loaded from: classes5.dex */
public final class HexFormat {

    /* renamed from: d, reason: collision with root package name */
    public static final Companion f72012d = new Companion(0);

    /* renamed from: e, reason: collision with root package name */
    public static final HexFormat f72013e;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f72014a;

    /* renamed from: b, reason: collision with root package name */
    public final BytesHexFormat f72015b;

    /* renamed from: c, reason: collision with root package name */
    public final NumberHexFormat f72016c;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\t\b\u0001¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$Builder;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Builder {
        @PublishedApi
        public Builder() {
            HexFormat.f72012d.getClass();
            HexFormat.f72013e.getClass();
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$BytesHexFormat;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Builder", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class BytesHexFormat {

        /* renamed from: a, reason: collision with root package name */
        public static final Companion f72017a = new Companion(0);

        /* renamed from: b, reason: collision with root package name */
        public static final BytesHexFormat f72018b = new BytesHexFormat();

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\t\b\u0000¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$BytesHexFormat$Builder;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Builder {
            public Builder() {
                Companion companion = BytesHexFormat.f72017a;
                companion.getClass();
                BytesHexFormat bytesHexFormat = BytesHexFormat.f72018b;
                bytesHexFormat.getClass();
                companion.getClass();
                bytesHexFormat.getClass();
                companion.getClass();
                bytesHexFormat.getClass();
                companion.getClass();
                bytesHexFormat.getClass();
                companion.getClass();
                bytesHexFormat.getClass();
                companion.getClass();
                bytesHexFormat.getClass();
            }
        }

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$BytesHexFormat$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Companion {
            public /* synthetic */ Companion(int i5) {
                this();
            }

            private Companion() {
            }
        }

        public final void a(String str, StringBuilder sb2) {
            sb2.append(str);
            sb2.append("bytesPerLine = ");
            sb2.append(LayoutNode.NotPlacedPlaceOrder);
            sb2.append(",");
            sb2.append('\n');
            sb2.append(str);
            sb2.append("bytesPerGroup = ");
            sb2.append(LayoutNode.NotPlacedPlaceOrder);
            sb2.append(",");
            sb2.append('\n');
            sb2.append(str);
            sb2.append("groupSeparator = \"");
            sb2.append("  ");
            sb2.append("\",");
            sb2.append('\n');
            sb2.append(str);
            sb2.append("byteSeparator = \"");
            sb2.append(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            sb2.append("\",");
            sb2.append('\n');
            c0.D(sb2, str, "bytePrefix = \"", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "\",");
            sb2.append('\n');
            sb2.append(str);
            sb2.append("byteSuffix = \"");
            sb2.append(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            sb2.append("\"");
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("BytesHexFormat(\n");
            a("    ", sb2);
            sb2.append('\n');
            sb2.append(")");
            return sb2.toString();
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$NumberHexFormat;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Builder", k.O, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class NumberHexFormat {

        /* renamed from: b, reason: collision with root package name */
        public static final Companion f72019b = new Companion(0);

        /* renamed from: c, reason: collision with root package name */
        public static final NumberHexFormat f72020c = new NumberHexFormat();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f72021a = true;

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\t\b\u0000¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$NumberHexFormat$Builder;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
        @SourceDebugExtension
        public static final class Builder {
            public Builder() {
                Companion companion = NumberHexFormat.f72019b;
                companion.getClass();
                NumberHexFormat numberHexFormat = NumberHexFormat.f72020c;
                numberHexFormat.getClass();
                companion.getClass();
                numberHexFormat.getClass();
                companion.getClass();
                numberHexFormat.getClass();
                companion.getClass();
                numberHexFormat.getClass();
            }
        }

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/HexFormat$NumberHexFormat$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Companion {
            public /* synthetic */ Companion(int i5) {
                this();
            }

            private Companion() {
            }
        }

        public final void a(String str, StringBuilder sb2) {
            c0.D(sb2, str, "prefix = \"", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "\",");
            sb2.append('\n');
            sb2.append(str);
            sb2.append("suffix = \"");
            sb2.append(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            sb2.append("\",");
            sb2.append('\n');
            sb2.append(str);
            sb2.append("removeLeadingZeros = ");
            sb2.append(false);
            sb2.append(AbstractJsonLexerKt.COMMA);
            sb2.append('\n');
            sb2.append(str);
            sb2.append("minLength = ");
            sb2.append(1);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("NumberHexFormat(\n");
            a("    ", sb2);
            sb2.append('\n');
            sb2.append(")");
            return sb2.toString();
        }
    }

    static {
        BytesHexFormat.f72017a.getClass();
        BytesHexFormat bytesHexFormat = BytesHexFormat.f72018b;
        NumberHexFormat.f72019b.getClass();
        NumberHexFormat numberHexFormat = NumberHexFormat.f72020c;
        f72013e = new HexFormat(false, bytesHexFormat, numberHexFormat);
        new HexFormat(true, bytesHexFormat, numberHexFormat);
    }

    public HexFormat(boolean z11, BytesHexFormat bytes, NumberHexFormat number) {
        Intrinsics.g(bytes, "bytes");
        Intrinsics.g(number, "number");
        this.f72014a = z11;
        this.f72015b = bytes;
        this.f72016c = number;
    }

    public final String toString() {
        StringBuilder sbQ = c.q("HexFormat(\n    upperCase = ");
        sbQ.append(this.f72014a);
        sbQ.append(",\n    bytes = BytesHexFormat(\n");
        this.f72015b.a("        ", sbQ);
        sbQ.append('\n');
        sbQ.append("    ),");
        sbQ.append('\n');
        sbQ.append("    number = NumberHexFormat(");
        sbQ.append('\n');
        this.f72016c.a("        ", sbQ);
        sbQ.append('\n');
        sbQ.append("    )");
        sbQ.append('\n');
        sbQ.append(")");
        return sbQ.toString();
    }
}
