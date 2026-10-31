package kotlin.reflect.jvm.internal.impl.serialization.deserialization;

import b70.c;
import b70.g;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.descriptors.InlineClassRepresentation;
import kotlin.reflect.jvm.internal.impl.descriptors.MultiFieldValueClassRepresentation;
import kotlin.reflect.jvm.internal.impl.descriptors.ValueClassRepresentation;
import kotlin.reflect.jvm.internal.impl.metadata.ProtoBuf;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.ProtoTypeTableUtilKt;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.TypeTable;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.types.model.SimpleTypeMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ValueClassUtilKt {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r6v2, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v7, types: [java.util.ArrayList] */
    @Nullable
    public static final <T extends SimpleTypeMarker> ValueClassRepresentation<T> loadValueClassRepresentation(@NotNull ProtoBuf.Class r52, @NotNull NameResolver nameResolver, @NotNull TypeTable typeTable, @NotNull Function1<? super ProtoBuf.Type, ? extends T> typeDeserializer, @NotNull Function1<? super Name, ? extends T> typeOfPublicProperty) {
        SimpleTypeMarker simpleTypeMarker;
        ?? multiFieldValueClassUnderlyingTypeList;
        Intrinsics.g(r52, "<this>");
        Intrinsics.g(nameResolver, "nameResolver");
        Intrinsics.g(typeTable, "typeTable");
        Intrinsics.g(typeDeserializer, "typeDeserializer");
        Intrinsics.g(typeOfPublicProperty, "typeOfPublicProperty");
        if (r52.getMultiFieldValueClassUnderlyingNameCount() <= 0) {
            if (!r52.hasInlineClassUnderlyingPropertyName()) {
                return null;
            }
            Name name = NameResolverUtilKt.getName(nameResolver, r52.getInlineClassUnderlyingPropertyName());
            ProtoBuf.Type typeInlineClassUnderlyingType = ProtoTypeTableUtilKt.inlineClassUnderlyingType(r52, typeTable);
            if ((typeInlineClassUnderlyingType != null && (simpleTypeMarker = (SimpleTypeMarker) typeDeserializer.invoke(typeInlineClassUnderlyingType)) != null) || (simpleTypeMarker = (SimpleTypeMarker) typeOfPublicProperty.invoke(name)) != null) {
                return new InlineClassRepresentation(name, simpleTypeMarker);
            }
            throw new IllegalStateException(("cannot determine underlying type for value class " + NameResolverUtilKt.getName(nameResolver, r52.getFqName()) + " with property " + name).toString());
        }
        List<Integer> multiFieldValueClassUnderlyingNameList = r52.getMultiFieldValueClassUnderlyingNameList();
        Intrinsics.f(multiFieldValueClassUnderlyingNameList, "getMultiFieldValueClassUnderlyingNameList(...)");
        List<Integer> list = multiFieldValueClassUnderlyingNameList;
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        for (Integer num : list) {
            Intrinsics.d(num);
            arrayList.add(NameResolverUtilKt.getName(nameResolver, num.intValue()));
        }
        Pair pair = new Pair(Integer.valueOf(r52.getMultiFieldValueClassUnderlyingTypeIdCount()), Integer.valueOf(r52.getMultiFieldValueClassUnderlyingTypeCount()));
        if (pair.equals(new Pair(Integer.valueOf(arrayList.size()), 0))) {
            List<Integer> multiFieldValueClassUnderlyingTypeIdList = r52.getMultiFieldValueClassUnderlyingTypeIdList();
            Intrinsics.f(multiFieldValueClassUnderlyingTypeIdList, "getMultiFieldValueClassUnderlyingTypeIdList(...)");
            List<Integer> list2 = multiFieldValueClassUnderlyingTypeIdList;
            multiFieldValueClassUnderlyingTypeList = new ArrayList(c.u0(list2, 10));
            for (Integer num2 : list2) {
                Intrinsics.d(num2);
                multiFieldValueClassUnderlyingTypeList.add(typeTable.get(num2.intValue()));
            }
        } else {
            if (!pair.equals(new Pair(0, Integer.valueOf(arrayList.size())))) {
                throw new IllegalStateException(("class " + NameResolverUtilKt.getName(nameResolver, r52.getFqName()) + " has illegal multi-field value class representation").toString());
            }
            multiFieldValueClassUnderlyingTypeList = r52.getMultiFieldValueClassUnderlyingTypeList();
        }
        Intrinsics.d(multiFieldValueClassUnderlyingTypeList);
        Iterable iterable = (Iterable) multiFieldValueClassUnderlyingTypeList;
        ArrayList arrayList2 = new ArrayList(c.u0(iterable, 10));
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            arrayList2.add(typeDeserializer.invoke(it.next()));
        }
        return new MultiFieldValueClassRepresentation(g.P1(arrayList, arrayList2));
    }
}
