package y40;

import io.branch.search.ui.ImpressionInfo;
import java.util.List;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public interface p {

    @NotNull
    public static final o Companion = o.f96678a;

    c appStoreRequest(String str);

    void markPackageIgnored(String str, n nVar, long[] jArr);

    void onImpressed(ImpressionInfo impressionInfo);

    void optIntoTracking();

    void optOutOfTracking();

    b0 searchRequest(String str);

    void syncIgnoredPackages(List list, n nVar, long[] jArr, boolean z11);

    d0 zeroStateRequest();
}
