package kotlin.reflect.jvm.internal.impl.metadata.deserialization;

import b70.g;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import kotlin.Triple;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.metadata.ProtoBuf;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class NameResolverImpl implements NameResolver {

    @NotNull
    private final ProtoBuf.QualifiedNameTable qualifiedNames;

    @NotNull
    private final ProtoBuf.StringTable strings;

    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[ProtoBuf.QualifiedNameTable.QualifiedName.Kind.values().length];
            try {
                iArr[ProtoBuf.QualifiedNameTable.QualifiedName.Kind.CLASS.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[ProtoBuf.QualifiedNameTable.QualifiedName.Kind.PACKAGE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[ProtoBuf.QualifiedNameTable.QualifiedName.Kind.LOCAL.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public NameResolverImpl(@NotNull ProtoBuf.StringTable strings, @NotNull ProtoBuf.QualifiedNameTable qualifiedNames) {
        Intrinsics.g(strings, "strings");
        Intrinsics.g(qualifiedNames, "qualifiedNames");
        this.strings = strings;
        this.qualifiedNames = qualifiedNames;
    }

    private final Triple<List<String>, List<String>, Boolean> traverseIds(int i5) {
        LinkedList linkedList = new LinkedList();
        LinkedList linkedList2 = new LinkedList();
        boolean z11 = false;
        while (i5 != -1) {
            ProtoBuf.QualifiedNameTable.QualifiedName qualifiedName = this.qualifiedNames.getQualifiedName(i5);
            String string = this.strings.getString(qualifiedName.getShortName());
            ProtoBuf.QualifiedNameTable.QualifiedName.Kind kind = qualifiedName.getKind();
            Intrinsics.d(kind);
            int i11 = WhenMappings.$EnumSwitchMapping$0[kind.ordinal()];
            if (i11 == 1) {
                linkedList2.addFirst(string);
            } else if (i11 == 2) {
                linkedList.addFirst(string);
            } else if (i11 == 3) {
                linkedList2.addFirst(string);
                z11 = true;
            }
            i5 = qualifiedName.getParentQualifiedName();
        }
        return new Triple<>(linkedList, linkedList2, Boolean.valueOf(z11));
    }

    @Override // kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver
    @NotNull
    public String getQualifiedClassName(int i5) throws IOException {
        Triple<List<String>, List<String>, Boolean> tripleTraverseIds = traverseIds(i5);
        List list = (List) tripleTraverseIds.f71690a;
        String strF1 = g.f1((List) tripleTraverseIds.f71691b, ".", null, null, 0, null, 62);
        if (list.isEmpty()) {
            return strF1;
        }
        return g.f1(list, "/", null, null, 0, null, 62) + '/' + strF1;
    }

    @Override // kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver
    @NotNull
    public String getString(int i5) {
        String string = this.strings.getString(i5);
        Intrinsics.f(string, "getString(...)");
        return string;
    }

    @Override // kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver
    public boolean isLocalClassName(int i5) {
        return ((Boolean) traverseIds(i5).f71692c).booleanValue();
    }
}
