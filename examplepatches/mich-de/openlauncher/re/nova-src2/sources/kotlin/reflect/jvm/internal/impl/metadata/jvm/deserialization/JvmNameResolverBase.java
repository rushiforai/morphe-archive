package kotlin.reflect.jvm.internal.impl.metadata.jvm.deserialization;

import b.c0;
import b70.c;
import b70.g;
import b70.k;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.collections.IndexedValue;
import kotlin.collections.IndexingIterable;
import kotlin.collections.IndexingIterator;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.JvmProtoBuf;
import org.jetbrains.annotations.NotNull;
import r70.j;
import ul.b;

@SourceDebugExtension
/* loaded from: classes5.dex */
public class JvmNameResolverBase implements NameResolver {

    @NotNull
    public static final Companion Companion = new Companion(null);

    @NotNull
    private static final List<String> PREDEFINED_STRINGS;

    @NotNull
    private static final Map<String, Integer> PREDEFINED_STRINGS_MAP;

    /* renamed from: kotlin, reason: collision with root package name */
    @NotNull
    private static final String f71938kotlin;

    @NotNull
    private final Set<Integer> localNameIndices;

    @NotNull
    private final List<JvmProtoBuf.StringTableTypes.Record> records;

    @NotNull
    private final String[] strings;

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[JvmProtoBuf.StringTableTypes.Record.Operation.values().length];
            try {
                iArr[JvmProtoBuf.StringTableTypes.Record.Operation.NONE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[JvmProtoBuf.StringTableTypes.Record.Operation.INTERNAL_TO_CLASS_ID.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[JvmProtoBuf.StringTableTypes.Record.Operation.DESC_TO_CLASS_ID.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    static {
        String strF1 = g.f1(b.Q('k', 'o', 't', 'l', 'i', 'n'), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null, null, 0, null, 62);
        f71938kotlin = strF1;
        List<String> listQ = b.Q(c0.E(strF1, "/Any"), c0.E(strF1, "/Nothing"), c0.E(strF1, "/Unit"), c0.E(strF1, "/Throwable"), c0.E(strF1, "/Number"), c0.E(strF1, "/Byte"), c0.E(strF1, "/Double"), c0.E(strF1, "/Float"), c0.E(strF1, "/Int"), c0.E(strF1, "/Long"), c0.E(strF1, "/Short"), c0.E(strF1, "/Boolean"), c0.E(strF1, "/Char"), c0.E(strF1, "/CharSequence"), c0.E(strF1, "/String"), c0.E(strF1, "/Comparable"), c0.E(strF1, "/Enum"), c0.E(strF1, "/Array"), c0.E(strF1, "/ByteArray"), c0.E(strF1, "/DoubleArray"), c0.E(strF1, "/FloatArray"), c0.E(strF1, "/IntArray"), c0.E(strF1, "/LongArray"), c0.E(strF1, "/ShortArray"), c0.E(strF1, "/BooleanArray"), c0.E(strF1, "/CharArray"), c0.E(strF1, "/Cloneable"), c0.E(strF1, "/Annotation"), c0.E(strF1, "/collections/Iterable"), c0.E(strF1, "/collections/MutableIterable"), c0.E(strF1, "/collections/Collection"), c0.E(strF1, "/collections/MutableCollection"), c0.E(strF1, "/collections/List"), c0.E(strF1, "/collections/MutableList"), c0.E(strF1, "/collections/Set"), c0.E(strF1, "/collections/MutableSet"), c0.E(strF1, "/collections/Map"), c0.E(strF1, "/collections/MutableMap"), c0.E(strF1, "/collections/Map.Entry"), c0.E(strF1, "/collections/MutableMap.MutableEntry"), c0.E(strF1, "/collections/Iterator"), c0.E(strF1, "/collections/MutableIterator"), c0.E(strF1, "/collections/ListIterator"), c0.E(strF1, "/collections/MutableListIterator"));
        PREDEFINED_STRINGS = listQ;
        IndexingIterable indexingIterableO1 = g.O1(listQ);
        int iD0 = k.d0(c.u0(indexingIterableO1, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it = indexingIterableO1.iterator();
        while (true) {
            IndexingIterator indexingIterator = (IndexingIterator) it;
            if (!indexingIterator.f71738a.hasNext()) {
                PREDEFINED_STRINGS_MAP = linkedHashMap;
                return;
            } else {
                IndexedValue indexedValue = (IndexedValue) indexingIterator.next();
                linkedHashMap.put((String) indexedValue.f71736b, Integer.valueOf(indexedValue.f71735a));
            }
        }
    }

    public JvmNameResolverBase(@NotNull String[] strings, @NotNull Set<Integer> localNameIndices, @NotNull List<JvmProtoBuf.StringTableTypes.Record> records) {
        Intrinsics.g(strings, "strings");
        Intrinsics.g(localNameIndices, "localNameIndices");
        Intrinsics.g(records, "records");
        this.strings = strings;
        this.localNameIndices = localNameIndices;
        this.records = records;
    }

    @Override // kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver
    @NotNull
    public String getQualifiedClassName(int i5) {
        return getString(i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0032  */
    @Override // kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String getString(int i5) {
        String strE0;
        JvmProtoBuf.StringTableTypes.Record record = this.records.get(i5);
        if (record.hasString()) {
            strE0 = record.getString();
        } else if (record.hasPredefinedIndex()) {
            List<String> list = PREDEFINED_STRINGS;
            int size = list.size();
            int predefinedIndex = record.getPredefinedIndex();
            strE0 = (predefinedIndex < 0 || predefinedIndex >= size) ? this.strings[i5] : list.get(record.getPredefinedIndex());
        }
        if (record.getSubstringIndexCount() >= 2) {
            List<Integer> substringIndexList = record.getSubstringIndexList();
            Intrinsics.d(substringIndexList);
            Integer num = substringIndexList.get(0);
            Integer num2 = substringIndexList.get(1);
            Intrinsics.d(num);
            if (num.intValue() >= 0) {
                int iIntValue = num.intValue();
                Intrinsics.d(num2);
                if (iIntValue <= num2.intValue() && num2.intValue() <= strE0.length()) {
                    strE0 = strE0.substring(num.intValue(), num2.intValue());
                    Intrinsics.f(strE0, "substring(...)");
                }
            }
        }
        if (record.getReplaceCharCount() >= 2) {
            List<Integer> replaceCharList = record.getReplaceCharList();
            Intrinsics.d(replaceCharList);
            Integer num3 = replaceCharList.get(0);
            Integer num4 = replaceCharList.get(1);
            Intrinsics.d(strE0);
            strE0 = j.E0(strE0, (char) num3.intValue(), (char) num4.intValue());
        }
        JvmProtoBuf.StringTableTypes.Record.Operation operation = record.getOperation();
        if (operation == null) {
            operation = JvmProtoBuf.StringTableTypes.Record.Operation.NONE;
        }
        int i11 = WhenMappings.$EnumSwitchMapping$0[operation.ordinal()];
        if (i11 == 2) {
            Intrinsics.d(strE0);
            strE0 = j.E0(strE0, '$', '.');
        } else if (i11 == 3) {
            if (strE0.length() >= 2) {
                strE0 = strE0.substring(1, strE0.length() - 1);
                Intrinsics.f(strE0, "substring(...)");
            }
            strE0 = j.E0(strE0, '$', '.');
        }
        Intrinsics.d(strE0);
        return strE0;
    }

    @Override // kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver
    public boolean isLocalClassName(int i5) {
        return this.localNameIndices.contains(Integer.valueOf(i5));
    }
}
