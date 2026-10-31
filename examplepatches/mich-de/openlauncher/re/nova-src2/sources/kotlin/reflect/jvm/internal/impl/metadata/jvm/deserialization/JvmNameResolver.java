package kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization;

import b70.g;
import java.util.List;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.JvmProtoBuf;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JvmNameResolver extends JvmNameResolverBase {

    @NotNull
    private final JvmProtoBuf.StringTableTypes types;

    /* JADX WARN: Illegal instructions before constructor call */
    public JvmNameResolver(@NotNull JvmProtoBuf.StringTableTypes types, @NotNull String[] strings) {
        Intrinsics.g(types, "types");
        Intrinsics.g(strings, "strings");
        List<Integer> localNameList = types.getLocalNameList();
        Set setN1 = localNameList.isEmpty() ? EmptySet.f71734a : g.N1(localNameList);
        List<JvmProtoBuf.StringTableTypes.Record> recordList = types.getRecordList();
        Intrinsics.f(recordList, "getRecordList(...)");
        super(strings, setN1, JvmNameResolverKt.toExpandedRecordsList(recordList));
        this.types = types;
    }
}
