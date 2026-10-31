package kotlin.reflect.jvm.internal.impl.resolve;

import b70.g;
import java.util.Collection;
import java.util.LinkedList;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.descriptors.CallableDescriptor;
import kotlin.reflect.jvm.internal.impl.utils.SmartSet;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class OverridingUtilsKt {
    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    public static final <H> Collection<H> selectMostSpecificInEachOverridableGroup(@NotNull Collection<? extends H> collection, @NotNull Function1<? super H, ? extends CallableDescriptor> descriptorByHandle) {
        Intrinsics.g(collection, "<this>");
        Intrinsics.g(descriptorByHandle, "descriptorByHandle");
        if (collection.size() <= 1) {
            return collection;
        }
        LinkedList linkedList = new LinkedList(collection);
        SmartSet smartSetCreate = SmartSet.Companion.create();
        while (!linkedList.isEmpty()) {
            Object objW0 = g.W0(linkedList);
            final SmartSet smartSetCreate2 = SmartSet.Companion.create();
            Collection collectionExtractMembersOverridableInBothWays = OverridingUtil.extractMembersOverridableInBothWays(objW0, linkedList, descriptorByHandle, new Function1<H, Unit>() { // from class: kotlin.reflect.jvm.internal.impl.resolve.OverridingUtilsKt$selectMostSpecificInEachOverridableGroup$overridableGroup$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                /* JADX WARN: Multi-variable type inference failed */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                    m356invoke((OverridingUtilsKt$selectMostSpecificInEachOverridableGroup$overridableGroup$1<H>) obj);
                    return Unit.f71706a;
                }

                /* renamed from: invoke, reason: collision with other method in class */
                public final void m356invoke(H h5) {
                    SmartSet<H> smartSet = smartSetCreate2;
                    Intrinsics.d(h5);
                    smartSet.add(h5);
                }
            });
            Intrinsics.f(collectionExtractMembersOverridableInBothWays, "extractMembersOverridableInBothWays(...)");
            if (collectionExtractMembersOverridableInBothWays.size() == 1 && smartSetCreate2.isEmpty()) {
                Object objX1 = g.x1(collectionExtractMembersOverridableInBothWays);
                Intrinsics.f(objX1, "single(...)");
                smartSetCreate.add(objX1);
            } else {
                Object objSelectMostSpecificMember = OverridingUtil.selectMostSpecificMember(collectionExtractMembersOverridableInBothWays, descriptorByHandle);
                Intrinsics.f(objSelectMostSpecificMember, "selectMostSpecificMember(...)");
                CallableDescriptor callableDescriptor = (CallableDescriptor) descriptorByHandle.invoke(objSelectMostSpecificMember);
                for (Object obj : collectionExtractMembersOverridableInBothWays) {
                    Intrinsics.d(obj);
                    if (!OverridingUtil.isMoreSpecific(callableDescriptor, (CallableDescriptor) descriptorByHandle.invoke(obj))) {
                        smartSetCreate2.add(obj);
                    }
                }
                if (!smartSetCreate2.isEmpty()) {
                    smartSetCreate.addAll(smartSetCreate2);
                }
                smartSetCreate.add(objSelectMostSpecificMember);
            }
        }
        return smartSetCreate;
    }
}
