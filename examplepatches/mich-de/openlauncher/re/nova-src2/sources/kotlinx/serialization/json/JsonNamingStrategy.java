package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.json.JsonNamingStrategy;
import org.jetbrains.annotations.NotNull;
import r70.l;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\bç\u0080\u0001\u0018\u0000 \t2\u00020\u0001:\u0001\tJ \u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0003H&¨\u0006\nÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/json/JsonNamingStrategy;", b.f42142b, "serialNameForJson", b.f42142b, "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "elementIndex", b.f42142b, "serialName", "Builtins", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes5.dex */
public interface JsonNamingStrategy {

    /* renamed from: Builtins, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\f\n\u0000\b\u0087\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0010H\u0002R\u001c\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0006\u0010\u0003\u001a\u0004\b\u0007\u0010\bR\u001c\u0010\t\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\n\u0010\u0003\u001a\u0004\b\u000b\u0010\b¨\u0006\u0011"}, d2 = {"Lkotlinx/serialization/json/JsonNamingStrategy$Builtins;", b.f42142b, "<init>", "()V", "SnakeCase", "Lkotlinx/serialization/json/JsonNamingStrategy;", "getSnakeCase$annotations", "getSnakeCase", "()Lkotlinx/serialization/json/JsonNamingStrategy;", "KebabCase", "getKebabCase$annotations", "getKebabCase", "convertCamelCase", b.f42142b, "serialName", "delimiter", b.f42142b, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @ExperimentalSerializationApi
    @SourceDebugExtension
    /* renamed from: kotlinx.serialization.json.JsonNamingStrategy$Builtins, reason: from kotlin metadata */
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        @NotNull
        private static final JsonNamingStrategy SnakeCase = new JsonNamingStrategy() { // from class: kotlinx.serialization.json.JsonNamingStrategy$Builtins$SnakeCase$1
            @Override // kotlinx.serialization.json.JsonNamingStrategy
            public String serialNameForJson(SerialDescriptor descriptor, int elementIndex, String serialName) {
                Intrinsics.g(descriptor, "descriptor");
                Intrinsics.g(serialName, "serialName");
                return JsonNamingStrategy.Companion.$$INSTANCE.convertCamelCase(serialName, '_');
            }

            public String toString() {
                return "kotlinx.serialization.json.JsonNamingStrategy.SnakeCase";
            }
        };

        @NotNull
        private static final JsonNamingStrategy KebabCase = new JsonNamingStrategy() { // from class: kotlinx.serialization.json.JsonNamingStrategy$Builtins$KebabCase$1
            @Override // kotlinx.serialization.json.JsonNamingStrategy
            public String serialNameForJson(SerialDescriptor descriptor, int elementIndex, String serialName) {
                Intrinsics.g(descriptor, "descriptor");
                Intrinsics.g(serialName, "serialName");
                return JsonNamingStrategy.Companion.$$INSTANCE.convertCamelCase(serialName, '-');
            }

            public String toString() {
                return "kotlinx.serialization.json.JsonNamingStrategy.KebabCase";
            }
        };

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String convertCamelCase(String serialName, char delimiter) {
            StringBuilder sb2 = new StringBuilder(serialName.length() * 2);
            Character chValueOf = null;
            int i5 = 0;
            for (int i11 = 0; i11 < serialName.length(); i11++) {
                char cCharAt = serialName.charAt(i11);
                if (Character.isUpperCase(cCharAt)) {
                    if (i5 == 0 && sb2.length() > 0 && l.F1(sb2) != delimiter) {
                        sb2.append(delimiter);
                    }
                    if (chValueOf != null) {
                        sb2.append(chValueOf.charValue());
                    }
                    i5++;
                    chValueOf = Character.valueOf(Character.toLowerCase(cCharAt));
                } else {
                    if (chValueOf != null) {
                        if (i5 > 1 && Character.isLetter(cCharAt)) {
                            sb2.append(delimiter);
                        }
                        sb2.append(chValueOf.charValue());
                        chValueOf = null;
                        i5 = 0;
                    }
                    sb2.append(cCharAt);
                }
            }
            if (chValueOf != null) {
                sb2.append(chValueOf.charValue());
            }
            return sb2.toString();
        }

        @ExperimentalSerializationApi
        public static /* synthetic */ void getKebabCase$annotations() {
        }

        @ExperimentalSerializationApi
        public static /* synthetic */ void getSnakeCase$annotations() {
        }

        @NotNull
        public final JsonNamingStrategy getKebabCase() {
            return KebabCase;
        }

        @NotNull
        public final JsonNamingStrategy getSnakeCase() {
            return SnakeCase;
        }
    }

    @NotNull
    String serialNameForJson(@NotNull SerialDescriptor descriptor, int elementIndex, @NotNull String serialName);
}
