package com.amplitude.core.events;

import com.amplitude.common.jvm.ConsoleLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u0000 \r2\u00020\u0001:\u0001\rB\u001f\b\u0007\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0005J\u0006\u0010\t\u001a\u00020\u0000J\r\u0010\n\u001a\u00020\u000bH\u0000¢\u0006\u0002\b\fR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0007¨\u0006\u000e"}, d2 = {"Lcom/amplitude/core/events/IngestionMetadata;", b.f42142b, "sourceName", b.f42142b, "sourceVersion", "(Ljava/lang/String;Ljava/lang/String;)V", "getSourceName", "()Ljava/lang/String;", "getSourceVersion", "clone", "toJSONObject", "Lorg/json/JSONObject;", "toJSONObject$core", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class IngestionMetadata {

    @NotNull
    public static final String AMP_INGESTION_METADATA_SOURCE_NAME = "source_name";

    @NotNull
    public static final String AMP_INGESTION_METADATA_SOURCE_VERSION = "source_version";

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String sourceName;

    @Nullable
    private final String sourceVersion;

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0015\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0000¢\u0006\u0002\b\nR\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/events/IngestionMetadata$Companion;", b.f42142b, "()V", "AMP_INGESTION_METADATA_SOURCE_NAME", b.f42142b, "AMP_INGESTION_METADATA_SOURCE_VERSION", "fromJSONObject", "Lcom/amplitude/core/events/IngestionMetadata;", "jsonObject", "Lorg/json/JSONObject;", "fromJSONObject$core", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final IngestionMetadata fromJSONObject$core(@NotNull JSONObject jsonObject) {
            Intrinsics.g(jsonObject, "jsonObject");
            return new IngestionMetadata(jsonObject.optString(IngestionMetadata.AMP_INGESTION_METADATA_SOURCE_NAME, null), jsonObject.optString(IngestionMetadata.AMP_INGESTION_METADATA_SOURCE_VERSION, null));
        }

        private Companion() {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @JvmOverloads
    public IngestionMetadata() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    @NotNull
    public final IngestionMetadata clone() {
        return new IngestionMetadata(this.sourceName, this.sourceVersion);
    }

    @Nullable
    public final String getSourceName() {
        return this.sourceName;
    }

    @Nullable
    public final String getSourceVersion() {
        return this.sourceVersion;
    }

    @NotNull
    public final JSONObject toJSONObject$core() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            String str = this.sourceName;
            if (str != null && str.length() != 0) {
                jSONObject.put(AMP_INGESTION_METADATA_SOURCE_NAME, this.sourceName);
            }
            String str2 = this.sourceVersion;
            if (str2 != null && str2.length() != 0) {
                jSONObject.put(AMP_INGESTION_METADATA_SOURCE_VERSION, this.sourceVersion);
            }
            return jSONObject;
        } catch (JSONException unused) {
            ConsoleLogger.INSTANCE.getLogger().error("JSON Serialization of ingestion metadata object failed");
            return jSONObject;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @JvmOverloads
    public IngestionMetadata(@Nullable String str) {
        this(str, null, 2, 0 == true ? 1 : 0);
    }

    @JvmOverloads
    public IngestionMetadata(@Nullable String str, @Nullable String str2) {
        this.sourceName = str;
        this.sourceVersion = str2;
    }

    public /* synthetic */ IngestionMetadata(String str, String str2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2);
    }
}
