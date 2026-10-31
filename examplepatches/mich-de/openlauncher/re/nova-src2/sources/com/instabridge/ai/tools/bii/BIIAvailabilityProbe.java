package com.instabridge.ai.tools.bii;

import android.content.Context;
import b70.h;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J$\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000bJ\"\u0010\r\u001a\b\u0012\u0004\u0012\u00020\t0\u000e2\u0006\u0010\u0006\u001a\u00020\u00072\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b¨\u0006\u000f"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIAvailabilityProbe;", b.f42142b, "<init>", "()V", "isAvailable", b.f42142b, "context", "Landroid/content/Context;", "entry", "Lcom/instabridge/ai/tools/bii/BIIEntry;", "discovered", b.f42142b, b.f42142b, "availableEntries", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BIIAvailabilityProbe {
    public static final int $stable = 0;

    @NotNull
    public static final BIIAvailabilityProbe INSTANCE = new BIIAvailabilityProbe();

    private BIIAvailabilityProbe() {
    }

    @NotNull
    public final List<BIIEntry> availableEntries(@NotNull Context context, @NotNull Set<String> discovered) {
        Intrinsics.g(context, "context");
        Intrinsics.g(discovered, "discovered");
        List<BIIEntry> all = BIIRegistry.INSTANCE.getAll();
        ArrayList arrayList = new ArrayList();
        for (Object obj : all) {
            if (INSTANCE.isAvailable(context, (BIIEntry) obj, discovered)) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public final boolean isAvailable(@NotNull Context context, @NotNull BIIEntry entry, @NotNull Set<String> discovered) {
        Intrinsics.g(context, "context");
        Intrinsics.g(entry, "entry");
        Intrinsics.g(discovered, "discovered");
        if (discovered.contains(entry.getBiiName())) {
            return true;
        }
        IntentTemplate standardIntentFallback = entry.getStandardIntentFallback();
        if (standardIntentFallback == null) {
            return false;
        }
        try {
            Intrinsics.f(context.getPackageManager().queryIntentActivities(standardIntentFallback.render(h.f17594a), 0), "queryIntentActivities(...)");
            return !r3.isEmpty();
        } catch (Exception unused) {
            return false;
        }
    }
}
