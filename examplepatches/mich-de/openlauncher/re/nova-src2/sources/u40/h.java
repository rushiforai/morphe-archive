package u40;

import io.branch.engage.sesame_lite.internal.DataImporters;
import io.branch.engage.sesame_lite.internal.IdHash;
import io.branch.engage.sesame_lite.internal.SearchMoreType;
import java.util.Collection;
import java.util.EnumSet;
import java.util.List;
import kotlin.coroutines.Continuation;
import t70.j0;

/* loaded from: classes4.dex */
public interface h {
    DataImporters getIngester();

    c getPerfStats();

    void importBranchShortcuts(Collection collection);

    Object recordAppOpen(String str, long j11, f fVar, Continuation continuation);

    Object recordShortcutOpen(IdHash idHash, String str, f fVar, Continuation continuation);

    Object refreshUsageStats(long j11, Continuation continuation);

    void registerAndroidListeners(j0 j0Var);

    r[] search(long j11, String str, String str2, EnumSet enumSet, boolean z11, int i5, long[] jArr, int i11);

    r searchMore(String str, SearchMoreType[] searchMoreTypeArr, boolean z11);

    r[] zeroState(String str, EnumSet enumSet, long[] jArr, int i5, int i11, int i12, String[] strArr, List list, j0 j0Var);
}
