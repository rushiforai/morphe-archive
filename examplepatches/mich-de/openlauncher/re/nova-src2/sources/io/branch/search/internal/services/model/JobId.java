package io.branch.search.internal.services.model;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.random.RandomKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\b\n\u0002\b\t\b\u0086\u0001\u0018\u0000 \u000b2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000bB\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\f"}, d2 = {"Lio/branch/search/internal/services/model/JobId;", b.f42142b, "id", b.f42142b, "(Ljava/lang/String;II)V", "getId", "()I", "BUNDLE_UPDATE", "SCHEDULED_QUERIES", "ERROR_PING", "CACHE_UPDATE", k.O, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public enum JobId {
    BUNDLE_UPDATE(36310786),
    SCHEDULED_QUERIES(2266222),
    ERROR_PING(PglCryptUtils.ENCRYPT_FAILED),
    CACHE_UPDATE(48639210);


    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final List<Integer> reserved;
    private final int id;

    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\b\u0010\u0006\u001a\u00020\u0005H\u0007J\u0010\u0010\u0007\u001a\u0004\u0018\u00010\b2\u0006\u0010\t\u001a\u00020\u0005R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lio/branch/search/internal/services/model/JobId$Companion;", b.f42142b, "()V", "reserved", b.f42142b, b.f42142b, "randomId", "tryParse", "Lio/branch/search/internal/services/model/JobId;", "id", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @JvmStatic
        public final int randomId() {
            int iE;
            int i5 = 5;
            do {
                iE = RandomKt.a(System.currentTimeMillis()).e();
                i5--;
                if (!JobId.reserved.contains(Integer.valueOf(iE))) {
                    break;
                }
            } while (i5 > 0);
            return iE;
        }

        @Nullable
        public final JobId tryParse(int id2) {
            for (JobId jobId : JobId.values()) {
                if (jobId.getId() == id2) {
                    return jobId;
                }
            }
            return null;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    static {
        JobId[] jobIdArrValues = values();
        ArrayList arrayList = new ArrayList(jobIdArrValues.length);
        for (JobId jobId : jobIdArrValues) {
            arrayList.add(Integer.valueOf(jobId.id));
        }
        reserved = arrayList;
    }

    JobId(int i5) {
        this.id = i5;
    }

    @JvmStatic
    public static final int randomId() {
        return INSTANCE.randomId();
    }

    public final int getId() {
        return this.id;
    }
}
