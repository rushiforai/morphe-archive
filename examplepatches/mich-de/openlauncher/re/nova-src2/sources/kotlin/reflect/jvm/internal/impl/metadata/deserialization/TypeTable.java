package kotlin.reflect.jvm.internal.impl.metadata.deserialization;

import b70.c;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.metadata.ProtoBuf;
import org.jetbrains.annotations.NotNull;
import ul.b;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class TypeTable {

    @NotNull
    private final List<ProtoBuf.Type> types;

    public TypeTable(@NotNull ProtoBuf.TypeTable typeTable) {
        Intrinsics.g(typeTable, "typeTable");
        List<ProtoBuf.Type> typeList = typeTable.getTypeList();
        if (typeTable.hasFirstNullable()) {
            int firstNullable = typeTable.getFirstNullable();
            List<ProtoBuf.Type> typeList2 = typeTable.getTypeList();
            Intrinsics.f(typeList2, "getTypeList(...)");
            List<ProtoBuf.Type> list = typeList2;
            ArrayList arrayList = new ArrayList(c.u0(list, 10));
            int i5 = 0;
            for (Object obj : list) {
                int i11 = i5 + 1;
                if (i5 < 0) {
                    b.e0();
                    throw null;
                }
                ProtoBuf.Type typeBuild = (ProtoBuf.Type) obj;
                if (i5 >= firstNullable) {
                    typeBuild = typeBuild.toBuilder().setNullable(true).build();
                }
                arrayList.add(typeBuild);
                i5 = i11;
            }
            typeList = arrayList;
        }
        Intrinsics.f(typeList, "run(...)");
        this.types = typeList;
    }

    @NotNull
    public final ProtoBuf.Type get(int i5) {
        return this.types.get(i5);
    }
}
