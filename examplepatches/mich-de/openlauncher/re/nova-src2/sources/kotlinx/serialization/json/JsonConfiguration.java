package kotlinx.serialization.json;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\"\u0018\u00002\u00020\u0001Bµ\u0001\b\u0000\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\f\u001a\u00020\u0003\u0012\b\b\u0002\u0010\r\u001a\u00020\n\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u0012\b\b\u0002\u0010\u0012\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0014\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0015\u001a\u00020\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\b\u00107\u001a\u00020\nH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001aR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u001aR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001aR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001aR\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001aR\u001c\u0010\t\u001a\u00020\n8\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u001f\u0010 \u001a\u0004\b!\u0010\"R\u0011\u0010\u000b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u001aR\u0011\u0010\f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u001aR\u0011\u0010\r\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b%\u0010\"R\u0011\u0010\u000e\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b&\u0010\u001aR\u0011\u0010\u000f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b'\u0010\u001aR\u001e\u0010\u0010\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b(\u0010 \u001a\u0004\b)\u0010*R\u001c\u0010\u0012\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b+\u0010 \u001a\u0004\b,\u0010\u001aR\u001c\u0010\u0013\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b-\u0010 \u001a\u0004\b.\u0010\u001aR\u001c\u0010\u0014\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b/\u0010 \u001a\u0004\b0\u0010\u001aR,\u0010\u0015\u001a\u00020\u00162\u0006\u00101\u001a\u00020\u00168\u0006@GX\u0087\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b2\u0010 \u001a\u0004\b3\u00104\"\u0004\b5\u00106¨\u00068"}, d2 = {"Lkotlinx/serialization/json/JsonConfiguration;", b.f42142b, "encodeDefaults", b.f42142b, "ignoreUnknownKeys", "isLenient", "allowStructuredMapKeys", "prettyPrint", "explicitNulls", "prettyPrintIndent", b.f42142b, "coerceInputValues", "useArrayPolymorphism", "classDiscriminator", "allowSpecialFloatingPointValues", "useAlternativeNames", "namingStrategy", "Lkotlinx/serialization/json/JsonNamingStrategy;", "decodeEnumsCaseInsensitive", "allowTrailingComma", "allowComments", "classDiscriminatorMode", "Lkotlinx/serialization/json/ClassDiscriminatorMode;", "<init>", "(ZZZZZZLjava/lang/String;ZZLjava/lang/String;ZZLkotlinx/serialization/json/JsonNamingStrategy;ZZZLkotlinx/serialization/json/ClassDiscriminatorMode;)V", "getEncodeDefaults", "()Z", "getIgnoreUnknownKeys", "getAllowStructuredMapKeys", "getPrettyPrint", "getExplicitNulls", "getPrettyPrintIndent$annotations", "()V", "getPrettyPrintIndent", "()Ljava/lang/String;", "getCoerceInputValues", "getUseArrayPolymorphism", "getClassDiscriminator", "getAllowSpecialFloatingPointValues", "getUseAlternativeNames", "getNamingStrategy$annotations", "getNamingStrategy", "()Lkotlinx/serialization/json/JsonNamingStrategy;", "getDecodeEnumsCaseInsensitive$annotations", "getDecodeEnumsCaseInsensitive", "getAllowTrailingComma$annotations", "getAllowTrailingComma", "getAllowComments$annotations", "getAllowComments", "value", "getClassDiscriminatorMode$annotations", "getClassDiscriminatorMode", "()Lkotlinx/serialization/json/ClassDiscriminatorMode;", "setClassDiscriminatorMode", "(Lkotlinx/serialization/json/ClassDiscriminatorMode;)V", "toString", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JsonConfiguration {
    private final boolean allowComments;
    private final boolean allowSpecialFloatingPointValues;
    private final boolean allowStructuredMapKeys;
    private final boolean allowTrailingComma;

    @NotNull
    private final String classDiscriminator;

    @NotNull
    private ClassDiscriminatorMode classDiscriminatorMode;
    private final boolean coerceInputValues;
    private final boolean decodeEnumsCaseInsensitive;
    private final boolean encodeDefaults;
    private final boolean explicitNulls;
    private final boolean ignoreUnknownKeys;
    private final boolean isLenient;

    @Nullable
    private final JsonNamingStrategy namingStrategy;
    private final boolean prettyPrint;

    @NotNull
    private final String prettyPrintIndent;
    private final boolean useAlternativeNames;
    private final boolean useArrayPolymorphism;

    public JsonConfiguration() {
        this(false, false, false, false, false, false, null, false, false, null, false, false, null, false, false, false, null, 131071, null);
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getAllowComments$annotations() {
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getAllowTrailingComma$annotations() {
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getClassDiscriminatorMode$annotations() {
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getDecodeEnumsCaseInsensitive$annotations() {
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getNamingStrategy$annotations() {
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getPrettyPrintIndent$annotations() {
    }

    public final boolean getAllowComments() {
        return this.allowComments;
    }

    public final boolean getAllowSpecialFloatingPointValues() {
        return this.allowSpecialFloatingPointValues;
    }

    public final boolean getAllowStructuredMapKeys() {
        return this.allowStructuredMapKeys;
    }

    public final boolean getAllowTrailingComma() {
        return this.allowTrailingComma;
    }

    @NotNull
    public final String getClassDiscriminator() {
        return this.classDiscriminator;
    }

    @NotNull
    public final ClassDiscriminatorMode getClassDiscriminatorMode() {
        return this.classDiscriminatorMode;
    }

    public final boolean getCoerceInputValues() {
        return this.coerceInputValues;
    }

    public final boolean getDecodeEnumsCaseInsensitive() {
        return this.decodeEnumsCaseInsensitive;
    }

    public final boolean getEncodeDefaults() {
        return this.encodeDefaults;
    }

    public final boolean getExplicitNulls() {
        return this.explicitNulls;
    }

    public final boolean getIgnoreUnknownKeys() {
        return this.ignoreUnknownKeys;
    }

    @Nullable
    public final JsonNamingStrategy getNamingStrategy() {
        return this.namingStrategy;
    }

    public final boolean getPrettyPrint() {
        return this.prettyPrint;
    }

    @NotNull
    public final String getPrettyPrintIndent() {
        return this.prettyPrintIndent;
    }

    public final boolean getUseAlternativeNames() {
        return this.useAlternativeNames;
    }

    public final boolean getUseArrayPolymorphism() {
        return this.useArrayPolymorphism;
    }

    /* renamed from: isLenient, reason: from getter */
    public final boolean getIsLenient() {
        return this.isLenient;
    }

    @Deprecated
    public final void setClassDiscriminatorMode(@NotNull ClassDiscriminatorMode classDiscriminatorMode) {
        Intrinsics.g(classDiscriminatorMode, "<set-?>");
        this.classDiscriminatorMode = classDiscriminatorMode;
    }

    @NotNull
    public String toString() {
        return "JsonConfiguration(encodeDefaults=" + this.encodeDefaults + ", ignoreUnknownKeys=" + this.ignoreUnknownKeys + ", isLenient=" + this.isLenient + ", allowStructuredMapKeys=" + this.allowStructuredMapKeys + ", prettyPrint=" + this.prettyPrint + ", explicitNulls=" + this.explicitNulls + ", prettyPrintIndent='" + this.prettyPrintIndent + "', coerceInputValues=" + this.coerceInputValues + ", useArrayPolymorphism=" + this.useArrayPolymorphism + ", classDiscriminator='" + this.classDiscriminator + "', allowSpecialFloatingPointValues=" + this.allowSpecialFloatingPointValues + ", useAlternativeNames=" + this.useAlternativeNames + ", namingStrategy=" + this.namingStrategy + ", decodeEnumsCaseInsensitive=" + this.decodeEnumsCaseInsensitive + ", allowTrailingComma=" + this.allowTrailingComma + ", allowComments=" + this.allowComments + ", classDiscriminatorMode=" + this.classDiscriminatorMode + ')';
    }

    public JsonConfiguration(boolean z11, boolean z12, boolean z13, boolean z14, boolean z15, boolean z16, @NotNull String prettyPrintIndent, boolean z17, boolean z18, @NotNull String classDiscriminator, boolean z19, boolean z21, @Nullable JsonNamingStrategy jsonNamingStrategy, boolean z22, boolean z23, boolean z24, @NotNull ClassDiscriminatorMode classDiscriminatorMode) {
        Intrinsics.g(prettyPrintIndent, "prettyPrintIndent");
        Intrinsics.g(classDiscriminator, "classDiscriminator");
        Intrinsics.g(classDiscriminatorMode, "classDiscriminatorMode");
        this.encodeDefaults = z11;
        this.ignoreUnknownKeys = z12;
        this.isLenient = z13;
        this.allowStructuredMapKeys = z14;
        this.prettyPrint = z15;
        this.explicitNulls = z16;
        this.prettyPrintIndent = prettyPrintIndent;
        this.coerceInputValues = z17;
        this.useArrayPolymorphism = z18;
        this.classDiscriminator = classDiscriminator;
        this.allowSpecialFloatingPointValues = z19;
        this.useAlternativeNames = z21;
        this.namingStrategy = jsonNamingStrategy;
        this.decodeEnumsCaseInsensitive = z22;
        this.allowTrailingComma = z23;
        this.allowComments = z24;
        this.classDiscriminatorMode = classDiscriminatorMode;
    }

    public /* synthetic */ JsonConfiguration(boolean z11, boolean z12, boolean z13, boolean z14, boolean z15, boolean z16, String str, boolean z17, boolean z18, String str2, boolean z19, boolean z21, JsonNamingStrategy jsonNamingStrategy, boolean z22, boolean z23, boolean z24, ClassDiscriminatorMode classDiscriminatorMode, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? false : z11, (i5 & 2) != 0 ? false : z12, (i5 & 4) != 0 ? false : z13, (i5 & 8) != 0 ? false : z14, (i5 & 16) != 0 ? false : z15, (i5 & 32) != 0 ? true : z16, (i5 & 64) != 0 ? "    " : str, (i5 & 128) != 0 ? false : z17, (i5 & 256) != 0 ? false : z18, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? TTConst.TRACK_TYPE : str2, (i5 & 1024) != 0 ? false : z19, (i5 & 2048) == 0 ? z21 : true, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : jsonNamingStrategy, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? false : z22, (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? false : z23, (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? false : z24, (i5 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? ClassDiscriminatorMode.POLYMORPHIC : classDiscriminatorMode);
    }
}
