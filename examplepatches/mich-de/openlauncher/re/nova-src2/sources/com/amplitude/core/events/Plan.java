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

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B7\b\u0007\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0007J\u0006\u0010\r\u001a\u00020\u0000J\r\u0010\u000e\u001a\u00020\u000fH\u0000¢\u0006\u0002\b\u0010R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\tR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\t¨\u0006\u0012"}, d2 = {"Lcom/amplitude/core/events/Plan;", b.f42142b, Plan.AMP_PLAN_BRANCH, b.f42142b, Plan.AMP_PLAN_SOURCE, "version", Plan.AMP_PLAN_VERSION_ID, "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getBranch", "()Ljava/lang/String;", "getSource", "getVersion", "getVersionId", "clone", "toJSONObject", "Lorg/json/JSONObject;", "toJSONObject$core", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class Plan {

    @NotNull
    public static final String AMP_PLAN_BRANCH = "branch";

    @NotNull
    public static final String AMP_PLAN_SOURCE = "source";

    @NotNull
    public static final String AMP_PLAN_VERSION = "version";

    @NotNull
    public static final String AMP_PLAN_VERSION_ID = "versionId";

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String branch;

    @Nullable
    private final String source;

    @Nullable
    private final String version;

    @Nullable
    private final String versionId;

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bR\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/amplitude/core/events/Plan$Companion;", b.f42142b, "()V", "AMP_PLAN_BRANCH", b.f42142b, "AMP_PLAN_SOURCE", "AMP_PLAN_VERSION", "AMP_PLAN_VERSION_ID", "fromJSONObject", "Lcom/amplitude/core/events/Plan;", "jsonObject", "Lorg/json/JSONObject;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Plan fromJSONObject(@NotNull JSONObject jsonObject) {
            Intrinsics.g(jsonObject, "jsonObject");
            return new Plan(jsonObject.optString(Plan.AMP_PLAN_BRANCH, null), jsonObject.optString(Plan.AMP_PLAN_SOURCE, null), jsonObject.optString("version", null), jsonObject.optString(Plan.AMP_PLAN_VERSION_ID, null));
        }

        private Companion() {
        }
    }

    @JvmOverloads
    public Plan() {
        this(null, null, null, null, 15, null);
    }

    @NotNull
    public final Plan clone() {
        return new Plan(this.branch, this.source, this.version, this.versionId);
    }

    @Nullable
    public final String getBranch() {
        return this.branch;
    }

    @Nullable
    public final String getSource() {
        return this.source;
    }

    @Nullable
    public final String getVersion() {
        return this.version;
    }

    @Nullable
    public final String getVersionId() {
        return this.versionId;
    }

    @NotNull
    public final JSONObject toJSONObject$core() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            String str = this.branch;
            if (str != null && str.length() != 0) {
                jSONObject.put(AMP_PLAN_BRANCH, this.branch);
            }
            String str2 = this.source;
            if (str2 != null && str2.length() != 0) {
                jSONObject.put(AMP_PLAN_SOURCE, this.source);
            }
            String str3 = this.version;
            if (str3 != null && str3.length() != 0) {
                jSONObject.put("version", this.version);
            }
            String str4 = this.versionId;
            if (str4 != null && str4.length() != 0) {
                jSONObject.put(AMP_PLAN_VERSION_ID, this.versionId);
            }
            return jSONObject;
        } catch (JSONException unused) {
            ConsoleLogger.INSTANCE.getLogger().error("JSON Serialization of tacking plan object failed");
            return jSONObject;
        }
    }

    @JvmOverloads
    public Plan(@Nullable String str) {
        this(str, null, null, null, 14, null);
    }

    @JvmOverloads
    public Plan(@Nullable String str, @Nullable String str2) {
        this(str, str2, null, null, 12, null);
    }

    @JvmOverloads
    public Plan(@Nullable String str, @Nullable String str2, @Nullable String str3) {
        this(str, str2, str3, null, 8, null);
    }

    @JvmOverloads
    public Plan(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4) {
        this.branch = str;
        this.source = str2;
        this.version = str3;
        this.versionId = str4;
    }

    public /* synthetic */ Plan(String str, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4);
    }
}
