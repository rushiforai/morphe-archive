package kotlin.reflect.jvm.internal;

import b70.c;
import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.PropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.reflect.KCallable;
import kotlin.reflect.KClass;
import kotlin.reflect.KFunction;
import kotlin.reflect.KProperty;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeParameter;
import kotlin.reflect.KVisibility;
import kotlin.reflect.jvm.internal.KClassImpl;
import kotlin.reflect.jvm.internal.KClassImpl.Data;
import kotlin.reflect.jvm.internal.KDeclarationContainerImpl;
import kotlin.reflect.jvm.internal.ReflectProperties;
import kotlin.reflect.jvm.internal.impl.builtins.CompanionObjectMapping;
import kotlin.reflect.jvm.internal.impl.builtins.CompanionObjectMappingUtilsKt;
import kotlin.reflect.jvm.internal.impl.builtins.KotlinBuiltIns;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassConstructorDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassKind;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassifierDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ConstructorDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.DescriptorVisibility;
import kotlin.reflect.jvm.internal.impl.descriptors.FindClassInModuleKt;
import kotlin.reflect.jvm.internal.impl.descriptors.FunctionDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.Modality;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.PropertyDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.SourceElement;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.impl.ClassDescriptorImpl;
import kotlin.reflect.jvm.internal.impl.descriptors.impl.EmptyPackageFragmentDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.runtime.components.ReflectKotlinClass;
import kotlin.reflect.jvm.internal.impl.descriptors.runtime.components.RuntimeModuleData;
import kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure.ReflectClassUtilKt;
import kotlin.reflect.jvm.internal.impl.incremental.components.NoLookupLocation;
import kotlin.reflect.jvm.internal.impl.load.kotlin.header.KotlinClassHeader;
import kotlin.reflect.jvm.internal.impl.metadata.ProtoBuf;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.ProtoBufUtilKt;
import kotlin.reflect.jvm.internal.impl.metadata.jvm.JvmProtoBuf;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.protobuf.GeneratedMessageLite;
import kotlin.reflect.jvm.internal.impl.resolve.DescriptorUtils;
import kotlin.reflect.jvm.internal.impl.resolve.descriptorUtil.DescriptorUtilsKt;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.GivenFunctionsMemberScope;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.MemberScope;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.ResolutionScope;
import kotlin.reflect.jvm.internal.impl.serialization.deserialization.descriptors.DeserializedClassDescriptor;
import kotlin.reflect.jvm.internal.impl.storage.StorageManager;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import kotlin.reflect.jvm.internal.impl.utils.CollectionsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000º\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\b\u0000\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u00022\u00020\u00032\b\u0012\u0004\u0012\u0002H\u00010\u00042\u00020\u00052\u00020\u0006:\u0001fB\u0013\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\b¢\u0006\u0002\u0010\tJ\u0018\u0010S\u001a\u00020!2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010T\u001a\u00020UH\u0002J\u0018\u0010V\u001a\u00020!2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010T\u001a\u00020UH\u0002J\u0013\u0010W\u001a\u00020%2\b\u0010X\u001a\u0004\u0018\u00010\u0002H\u0096\u0002J\u0016\u0010Y\u001a\b\u0012\u0004\u0012\u00020Z0\u00142\u0006\u0010[\u001a\u00020\\H\u0016J\u0012\u0010]\u001a\u0004\u0018\u00010^2\u0006\u0010_\u001a\u00020`H\u0016J\u0016\u0010a\u001a\b\u0012\u0004\u0012\u00020^0\u00142\u0006\u0010[\u001a\u00020\\H\u0016J\b\u0010b\u001a\u00020`H\u0016J\u0012\u0010c\u001a\u00020%2\b\u0010d\u001a\u0004\u0018\u00010\u0002H\u0016J\b\u0010e\u001a\u00020@H\u0016R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u00108BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R \u0010\u0018\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00190\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u0017R!\u0010\u001b\u001a\u0012\u0012\u000e\u0012\f0\u001dR\b\u0012\u0004\u0012\u00028\u00000\u00000\u001c¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0014\u0010 \u001a\u00020!8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\"\u0010#R\u0014\u0010$\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b$\u0010&R\u0014\u0010'\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b'\u0010&R\u0014\u0010(\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b(\u0010&R\u0014\u0010)\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b)\u0010&R\u0014\u0010*\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b*\u0010&R\u0014\u0010+\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b+\u0010&R\u0014\u0010,\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b,\u0010&R\u0014\u0010-\u001a\u00020%8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b-\u0010&R\u001a\u0010.\u001a\u00020%8VX\u0096\u0004¢\u0006\f\u0012\u0004\b/\u00100\u001a\u0004\b.\u0010&R\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b1\u00102R\u0014\u00103\u001a\u0002048@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b5\u00106R\u001e\u00107\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u0003080\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b9\u0010\u0017R\u001e\u0010:\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00040\u00148VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b;\u0010\u0017R\u0016\u0010<\u001a\u0004\u0018\u00018\u00008VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b=\u0010>R\u0016\u0010?\u001a\u0004\u0018\u00010@8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bA\u0010BR\"\u0010C\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u00040\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bD\u0010\u000eR\u0016\u0010E\u001a\u0004\u0018\u00010@8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bF\u0010BR\u0014\u0010G\u001a\u0002048@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bH\u00106R\u001a\u0010I\u001a\b\u0012\u0004\u0012\u00020J0\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bK\u0010\u000eR\u001a\u0010L\u001a\b\u0012\u0004\u0012\u00020M0\u000b8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bN\u0010\u000eR\u0016\u0010O\u001a\u0004\u0018\u00010P8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bQ\u0010R¨\u0006g"}, d2 = {"Lkotlin/reflect/jvm/internal/KClassImpl;", "T", b.f42142b, "Lkotlin/reflect/jvm/internal/KDeclarationContainerImpl;", "Lkotlin/reflect/KClass;", "Lkotlin/reflect/jvm/internal/KClassifierImpl;", "Lkotlin/reflect/jvm/internal/KTypeParameterOwnerImpl;", "jClass", "Ljava/lang/Class;", "(Ljava/lang/Class;)V", "annotations", b.f42142b, b.f42142b, "getAnnotations", "()Ljava/util/List;", "classId", "Lkotlin/reflect/jvm/internal/impl/name/ClassId;", "getClassId", "()Lorg/jetbrains/kotlin/name/ClassId;", "constructorDescriptors", b.f42142b, "Lkotlin/reflect/jvm/internal/impl/descriptors/ConstructorDescriptor;", "getConstructorDescriptors", "()Ljava/util/Collection;", "constructors", "Lkotlin/reflect/KFunction;", "getConstructors", "data", "Lkotlin/Lazy;", "Lkotlin/reflect/jvm/internal/KClassImpl$Data;", "getData", "()Lkotlin/Lazy;", "descriptor", "Lkotlin/reflect/jvm/internal/impl/descriptors/ClassDescriptor;", "getDescriptor", "()Lorg/jetbrains/kotlin/descriptors/ClassDescriptor;", "isAbstract", b.f42142b, "()Z", "isCompanion", "isData", "isFinal", "isFun", "isInner", "isOpen", "isSealed", "isValue", "isValue$annotations", "()V", "getJClass", "()Ljava/lang/Class;", "memberScope", "Lkotlin/reflect/jvm/internal/impl/resolve/scopes/MemberScope;", "getMemberScope$kotlin_reflection", "()Lorg/jetbrains/kotlin/resolve/scopes/MemberScope;", "members", "Lkotlin/reflect/KCallable;", "getMembers", "nestedClasses", "getNestedClasses", "objectInstance", "getObjectInstance", "()Ljava/lang/Object;", "qualifiedName", b.f42142b, "getQualifiedName", "()Ljava/lang/String;", "sealedSubclasses", "getSealedSubclasses", "simpleName", "getSimpleName", "staticScope", "getStaticScope$kotlin_reflection", "supertypes", "Lkotlin/reflect/KType;", "getSupertypes", "typeParameters", "Lkotlin/reflect/KTypeParameter;", "getTypeParameters", "visibility", "Lkotlin/reflect/KVisibility;", "getVisibility", "()Lkotlin/reflect/KVisibility;", "createSyntheticClass", "moduleData", "Lkotlin/reflect/jvm/internal/impl/descriptors/runtime/components/RuntimeModuleData;", "createSyntheticClassOrFail", "equals", InneractiveMediationNameConsts.OTHER, "getFunctions", "Lkotlin/reflect/jvm/internal/impl/descriptors/FunctionDescriptor;", PendingUpgradeStore.KEY_NAME, "Lkotlin/reflect/jvm/internal/impl/name/Name;", "getLocalProperty", "Lkotlin/reflect/jvm/internal/impl/descriptors/PropertyDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "getProperties", "hashCode", "isInstance", "value", "toString", "Data", "kotlin-reflection"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class KClassImpl<T> extends KDeclarationContainerImpl implements KClass<T>, KClassifierImpl, KTypeParameterOwnerImpl {

    @NotNull
    private final Lazy<KClassImpl<T>.Data> data;

    @NotNull
    private final Class<T> jClass;

    @Metadata(d1 = {"\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010 \n\u0002\u0010\u001b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\b\u0086\u0004\u0018\u00002\u00060\u0001R\u00020\u0002B\u0005¢\u0006\u0002\u0010\u0003J\u0014\u0010N\u001a\u00020<2\n\u0010O\u001a\u0006\u0012\u0002\b\u00030PH\u0002R%\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u0007\u0010\bR%\u0010\u000b\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\r\u0010\n\u001a\u0004\b\f\u0010\bR%\u0010\u000e\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u0010\u0010\n\u001a\u0004\b\u000f\u0010\bR!\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00130\u00128FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u0016\u0010\n\u001a\u0004\b\u0014\u0010\u0015R-\u0010\u0017\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00180\u00058FX\u0086\u0084\u0002¢\u0006\u0012\n\u0004\b\u001c\u0010\n\u0012\u0004\b\u0019\u0010\u001a\u001a\u0004\b\u001b\u0010\bR%\u0010\u001d\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u001f\u0010\n\u001a\u0004\b\u001e\u0010\bR%\u0010 \u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\"\u0010\n\u001a\u0004\b!\u0010\bR%\u0010#\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b%\u0010\n\u001a\u0004\b$\u0010\bR\u001b\u0010&\u001a\u00020'8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b*\u0010\n\u001a\u0004\b(\u0010)R%\u0010+\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b-\u0010\n\u001a\u0004\b,\u0010\bR%\u0010.\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u00058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b0\u0010\n\u001a\u0004\b/\u0010\bR%\u00101\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u0003020\u00058FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b4\u0010\n\u001a\u0004\b3\u0010\bR#\u00105\u001a\u0004\u0018\u00018\u00008FX\u0086\u0084\u0002¢\u0006\u0012\n\u0004\b9\u0010:\u0012\u0004\b6\u0010\u001a\u001a\u0004\b7\u00108R\u001d\u0010;\u001a\u0004\u0018\u00010<8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b?\u0010\n\u001a\u0004\b=\u0010>R)\u0010@\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00028\u0000020\u00128FX\u0086\u0084\u0002¢\u0006\f\n\u0004\bB\u0010\n\u001a\u0004\bA\u0010\u0015R\u001d\u0010C\u001a\u0004\u0018\u00010<8FX\u0086\u0084\u0002¢\u0006\f\n\u0004\bE\u0010\n\u001a\u0004\bD\u0010>R!\u0010F\u001a\b\u0012\u0004\u0012\u00020G0\u00128FX\u0086\u0084\u0002¢\u0006\f\n\u0004\bI\u0010\n\u001a\u0004\bH\u0010\u0015R!\u0010J\u001a\b\u0012\u0004\u0012\u00020K0\u00128FX\u0086\u0084\u0002¢\u0006\f\n\u0004\bM\u0010\n\u001a\u0004\bL\u0010\u0015¨\u0006Q"}, d2 = {"Lkotlin/reflect/jvm/internal/KClassImpl$Data;", "Lkotlin/reflect/jvm/internal/KDeclarationContainerImpl$Data;", "Lkotlin/reflect/jvm/internal/KDeclarationContainerImpl;", "(Lkotlin/reflect/jvm/internal/KClassImpl;)V", "allMembers", b.f42142b, "Lkotlin/reflect/jvm/internal/KCallableImpl;", "getAllMembers", "()Ljava/util/Collection;", "allMembers$delegate", "Lkotlin/reflect/jvm/internal/ReflectProperties$LazySoftVal;", "allNonStaticMembers", "getAllNonStaticMembers", "allNonStaticMembers$delegate", "allStaticMembers", "getAllStaticMembers", "allStaticMembers$delegate", "annotations", b.f42142b, b.f42142b, "getAnnotations", "()Ljava/util/List;", "annotations$delegate", "constructors", "Lkotlin/reflect/KFunction;", "getConstructors$annotations", "()V", "getConstructors", "constructors$delegate", "declaredMembers", "getDeclaredMembers", "declaredMembers$delegate", "declaredNonStaticMembers", "getDeclaredNonStaticMembers", "declaredNonStaticMembers$delegate", "declaredStaticMembers", "getDeclaredStaticMembers", "declaredStaticMembers$delegate", "descriptor", "Lkotlin/reflect/jvm/internal/impl/descriptors/ClassDescriptor;", "getDescriptor", "()Lorg/jetbrains/kotlin/descriptors/ClassDescriptor;", "descriptor$delegate", "inheritedNonStaticMembers", "getInheritedNonStaticMembers", "inheritedNonStaticMembers$delegate", "inheritedStaticMembers", "getInheritedStaticMembers", "inheritedStaticMembers$delegate", "nestedClasses", "Lkotlin/reflect/KClass;", "getNestedClasses", "nestedClasses$delegate", "objectInstance", "getObjectInstance$annotations", "getObjectInstance", "()Ljava/lang/Object;", "objectInstance$delegate", "Lkotlin/Lazy;", "qualifiedName", b.f42142b, "getQualifiedName", "()Ljava/lang/String;", "qualifiedName$delegate", "sealedSubclasses", "getSealedSubclasses", "sealedSubclasses$delegate", "simpleName", "getSimpleName", "simpleName$delegate", "supertypes", "Lkotlin/reflect/KType;", "getSupertypes", "supertypes$delegate", "typeParameters", "Lkotlin/reflect/KTypeParameter;", "getTypeParameters", "typeParameters$delegate", "calculateLocalClassName", "jClass", "Ljava/lang/Class;", "kotlin-reflection"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public final class Data extends KDeclarationContainerImpl.Data {
        static final /* synthetic */ KProperty<Object>[] $$delegatedProperties;

        /* renamed from: allMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal allMembers;

        /* renamed from: allNonStaticMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal allNonStaticMembers;

        /* renamed from: allStaticMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal allStaticMembers;

        /* renamed from: annotations$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal annotations;

        /* renamed from: constructors$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal constructors;

        /* renamed from: declaredMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal declaredMembers;

        /* renamed from: declaredNonStaticMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal declaredNonStaticMembers;

        /* renamed from: declaredStaticMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal declaredStaticMembers;

        /* renamed from: descriptor$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal descriptor;

        /* renamed from: inheritedNonStaticMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal inheritedNonStaticMembers;

        /* renamed from: inheritedStaticMembers$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal inheritedStaticMembers;

        /* renamed from: nestedClasses$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal nestedClasses;

        /* renamed from: objectInstance$delegate, reason: from kotlin metadata */
        @NotNull
        private final Lazy objectInstance;

        /* renamed from: qualifiedName$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal qualifiedName;

        /* renamed from: sealedSubclasses$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal sealedSubclasses;

        /* renamed from: simpleName$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal simpleName;

        /* renamed from: supertypes$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal supertypes;

        /* renamed from: typeParameters$delegate, reason: from kotlin metadata */
        @NotNull
        private final ReflectProperties.LazySoftVal typeParameters;

        static {
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            $$delegatedProperties = new KProperty[]{reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "descriptor", "getDescriptor()Lorg/jetbrains/kotlin/descriptors/ClassDescriptor;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "annotations", "getAnnotations()Ljava/util/List;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "simpleName", "getSimpleName()Ljava/lang/String;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "qualifiedName", "getQualifiedName()Ljava/lang/String;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "constructors", "getConstructors()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "nestedClasses", "getNestedClasses()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "typeParameters", "getTypeParameters()Ljava/util/List;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "supertypes", "getSupertypes()Ljava/util/List;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "sealedSubclasses", "getSealedSubclasses()Ljava/util/List;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "declaredNonStaticMembers", "getDeclaredNonStaticMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "declaredStaticMembers", "getDeclaredStaticMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "inheritedNonStaticMembers", "getInheritedNonStaticMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "inheritedStaticMembers", "getInheritedStaticMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "allNonStaticMembers", "getAllNonStaticMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "allStaticMembers", "getAllStaticMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "declaredMembers", "getDeclaredMembers()Ljava/util/Collection;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(Data.class), "allMembers", "getAllMembers()Ljava/util/Collection;"))};
        }

        public Data() {
            super();
            this.descriptor = ReflectProperties.lazySoft(new Function0<ClassDescriptor>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$descriptor$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final ClassDescriptor invoke() {
                    ClassId classId = kClassImpl.getClassId();
                    RuntimeModuleData moduleData = ((KClassImpl.Data) kClassImpl.getData().getValue()).getModuleData();
                    ClassDescriptor classDescriptorDeserializeClass = (classId.isLocal() && kClassImpl.getF71858a().isAnnotationPresent(Metadata.class)) ? moduleData.getDeserialization().deserializeClass(classId) : FindClassInModuleKt.findClassAcrossModuleDependencies(moduleData.getModule(), classId);
                    return classDescriptorDeserializeClass == null ? kClassImpl.createSyntheticClassOrFail(classId, moduleData) : classDescriptorDeserializeClass;
                }
            });
            this.annotations = ReflectProperties.lazySoft(new Function0<List<? extends Annotation>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$annotations$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<Annotation> invoke() {
                    return UtilKt.computeAnnotations(this.this$0.getDescriptor());
                }
            });
            this.simpleName = ReflectProperties.lazySoft(new Function0<String>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$simpleName$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                @Nullable
                public final String invoke() {
                    if (kClassImpl.getF71858a().isAnonymousClass()) {
                        return null;
                    }
                    ClassId classId = kClassImpl.getClassId();
                    if (classId.isLocal()) {
                        return this.calculateLocalClassName(kClassImpl.getF71858a());
                    }
                    String strAsString = classId.getShortClassName().asString();
                    Intrinsics.f(strAsString, "asString(...)");
                    return strAsString;
                }
            });
            this.qualifiedName = ReflectProperties.lazySoft(new Function0<String>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$qualifiedName$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                @Nullable
                public final String invoke() {
                    if (kClassImpl.getF71858a().isAnonymousClass()) {
                        return null;
                    }
                    ClassId classId = kClassImpl.getClassId();
                    if (classId.isLocal()) {
                        return null;
                    }
                    return classId.asSingleFqName().asString();
                }
            });
            this.constructors = ReflectProperties.lazySoft(new Function0<List<? extends KFunction<? extends T>>>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$constructors$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KFunction<T>> invoke() {
                    Collection<ConstructorDescriptor> constructorDescriptors = kClassImpl.getConstructorDescriptors();
                    KClassImpl<T> kClassImpl = kClassImpl;
                    ArrayList arrayList = new ArrayList(c.u0(constructorDescriptors, 10));
                    Iterator<T> it = constructorDescriptors.iterator();
                    while (it.hasNext()) {
                        arrayList.add(new KFunctionImpl(kClassImpl, (ConstructorDescriptor) it.next()));
                    }
                    return arrayList;
                }
            });
            this.nestedClasses = ReflectProperties.lazySoft(new Function0<List<? extends KClassImpl<? extends Object>>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$nestedClasses$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KClassImpl<? extends Object>> invoke() {
                    MemberScope unsubstitutedInnerClassesScope = this.this$0.getDescriptor().getUnsubstitutedInnerClassesScope();
                    Intrinsics.f(unsubstitutedInnerClassesScope, "getUnsubstitutedInnerClassesScope(...)");
                    Collection contributedDescriptors$default = ResolutionScope.DefaultImpls.getContributedDescriptors$default(unsubstitutedInnerClassesScope, null, null, 3, null);
                    ArrayList<DeclarationDescriptor> arrayList = new ArrayList();
                    for (Object obj : contributedDescriptors$default) {
                        if (!DescriptorUtils.isEnumEntry((DeclarationDescriptor) obj)) {
                            arrayList.add(obj);
                        }
                    }
                    ArrayList arrayList2 = new ArrayList();
                    for (DeclarationDescriptor declarationDescriptor : arrayList) {
                        ClassDescriptor classDescriptor = declarationDescriptor instanceof ClassDescriptor ? (ClassDescriptor) declarationDescriptor : null;
                        Class<?> javaClass = classDescriptor != null ? UtilKt.toJavaClass(classDescriptor) : null;
                        KClassImpl kClassImpl = javaClass != null ? new KClassImpl(javaClass) : null;
                        if (kClassImpl != null) {
                            arrayList2.add(kClassImpl);
                        }
                    }
                    return arrayList2;
                }
            });
            this.objectInstance = LazyKt.b(LazyThreadSafetyMode.f71680b, new Function0<T>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$objectInstance$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                @Nullable
                public final T invoke() {
                    ClassDescriptor descriptor = this.this$0.getDescriptor();
                    if (descriptor.getKind() != ClassKind.OBJECT) {
                        return null;
                    }
                    T t6 = (T) ((!descriptor.isCompanionObject() || CompanionObjectMappingUtilsKt.isMappedIntrinsicCompanionObject(CompanionObjectMapping.INSTANCE, descriptor)) ? kClassImpl.getF71858a().getDeclaredField("INSTANCE") : kClassImpl.getF71858a().getEnclosingClass().getDeclaredField(descriptor.getName().asString())).get(null);
                    Intrinsics.e(t6, "null cannot be cast to non-null type T of kotlin.reflect.jvm.internal.KClassImpl");
                    return t6;
                }
            });
            this.typeParameters = ReflectProperties.lazySoft(new Function0<List<? extends KTypeParameterImpl>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$typeParameters$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KTypeParameterImpl> invoke() {
                    List<TypeParameterDescriptor> declaredTypeParameters = this.this$0.getDescriptor().getDeclaredTypeParameters();
                    Intrinsics.f(declaredTypeParameters, "getDeclaredTypeParameters(...)");
                    List<TypeParameterDescriptor> list = declaredTypeParameters;
                    KTypeParameterOwnerImpl kTypeParameterOwnerImpl = kClassImpl;
                    ArrayList arrayList = new ArrayList(c.u0(list, 10));
                    for (TypeParameterDescriptor typeParameterDescriptor : list) {
                        Intrinsics.d(typeParameterDescriptor);
                        arrayList.add(new KTypeParameterImpl(kTypeParameterOwnerImpl, typeParameterDescriptor));
                    }
                    return arrayList;
                }
            });
            this.supertypes = ReflectProperties.lazySoft(new Function0<List<? extends KTypeImpl>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$supertypes$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KTypeImpl> invoke() {
                    Collection<KotlinType> collectionMo358getSupertypes = this.this$0.getDescriptor().getTypeConstructor().mo358getSupertypes();
                    Intrinsics.f(collectionMo358getSupertypes, "getSupertypes(...)");
                    ArrayList arrayList = new ArrayList(collectionMo358getSupertypes.size());
                    final KClassImpl<T>.Data data = this.this$0;
                    final KClassImpl<T> kClassImpl = kClassImpl;
                    for (final KotlinType kotlinType : collectionMo358getSupertypes) {
                        Intrinsics.d(kotlinType);
                        arrayList.add(new KTypeImpl(kotlinType, new Function0<Type>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$supertypes$2$1$1
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(0);
                            }

                            @Override // kotlin.jvm.functions.Function0
                            @NotNull
                            public final Type invoke() {
                                ClassifierDescriptor classifierDescriptorMo357getDeclarationDescriptor = kotlinType.getConstructor().mo357getDeclarationDescriptor();
                                if (!(classifierDescriptorMo357getDeclarationDescriptor instanceof ClassDescriptor)) {
                                    throw new KotlinReflectionInternalError("Supertype not a class: " + classifierDescriptorMo357getDeclarationDescriptor);
                                }
                                Class<?> javaClass = UtilKt.toJavaClass((ClassDescriptor) classifierDescriptorMo357getDeclarationDescriptor);
                                if (javaClass == null) {
                                    throw new KotlinReflectionInternalError("Unsupported superclass of " + data + ": " + classifierDescriptorMo357getDeclarationDescriptor);
                                }
                                if (Intrinsics.b(kClassImpl.getF71858a().getSuperclass(), javaClass)) {
                                    Type genericSuperclass = kClassImpl.getF71858a().getGenericSuperclass();
                                    Intrinsics.d(genericSuperclass);
                                    return genericSuperclass;
                                }
                                Class<?>[] interfaces = kClassImpl.getF71858a().getInterfaces();
                                Intrinsics.f(interfaces, "getInterfaces(...)");
                                int iF0 = kotlin.collections.c.F0(javaClass, interfaces);
                                if (iF0 >= 0) {
                                    Type type = kClassImpl.getF71858a().getGenericInterfaces()[iF0];
                                    Intrinsics.d(type);
                                    return type;
                                }
                                throw new KotlinReflectionInternalError("No superclass of " + data + " in Java reflection for " + classifierDescriptorMo357getDeclarationDescriptor);
                            }
                        }));
                    }
                    if (!KotlinBuiltIns.isSpecialClassWithNoSupertypes(this.this$0.getDescriptor())) {
                        if (arrayList.isEmpty()) {
                            SimpleType anyType = DescriptorUtilsKt.getBuiltIns(this.this$0.getDescriptor()).getAnyType();
                            Intrinsics.f(anyType, "getAnyType(...)");
                            arrayList.add(new KTypeImpl(anyType, new Function0<Type>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$supertypes$2.3
                                @Override // kotlin.jvm.functions.Function0
                                @NotNull
                                public final Type invoke() {
                                    return Object.class;
                                }
                            }));
                        } else {
                            Iterator it = arrayList.iterator();
                            while (it.hasNext()) {
                                ClassKind kind = DescriptorUtils.getClassDescriptorForType(((KTypeImpl) it.next()).getType()).getKind();
                                Intrinsics.f(kind, "getKind(...)");
                                if (kind != ClassKind.INTERFACE && kind != ClassKind.ANNOTATION_CLASS) {
                                    break;
                                }
                            }
                            SimpleType anyType2 = DescriptorUtilsKt.getBuiltIns(this.this$0.getDescriptor()).getAnyType();
                            Intrinsics.f(anyType2, "getAnyType(...)");
                            arrayList.add(new KTypeImpl(anyType2, new Function0<Type>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$supertypes$2.3
                                @Override // kotlin.jvm.functions.Function0
                                @NotNull
                                public final Type invoke() {
                                    return Object.class;
                                }
                            }));
                        }
                    }
                    return CollectionsKt.compact(arrayList);
                }
            });
            this.sealedSubclasses = ReflectProperties.lazySoft(new Function0<List<? extends KClassImpl<? extends T>>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$sealedSubclasses$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KClassImpl<? extends T>> invoke() {
                    Collection<ClassDescriptor> sealedSubclasses = this.this$0.getDescriptor().getSealedSubclasses();
                    Intrinsics.f(sealedSubclasses, "getSealedSubclasses(...)");
                    ArrayList arrayList = new ArrayList();
                    for (ClassDescriptor classDescriptor : sealedSubclasses) {
                        Intrinsics.e(classDescriptor, "null cannot be cast to non-null type org.jetbrains.kotlin.descriptors.ClassDescriptor");
                        Class<?> javaClass = UtilKt.toJavaClass(classDescriptor);
                        KClassImpl kClassImpl = javaClass != null ? new KClassImpl(javaClass) : null;
                        if (kClassImpl != null) {
                            arrayList.add(kClassImpl);
                        }
                    }
                    return arrayList;
                }
            });
            this.declaredNonStaticMembers = ReflectProperties.lazySoft(new Function0<Collection<? extends KCallableImpl<?>>>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$declaredNonStaticMembers$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final Collection<KCallableImpl<?>> invoke() {
                    KClassImpl<T> kClassImpl = kClassImpl;
                    return kClassImpl.getMembers(kClassImpl.getMemberScope$kotlin_reflection(), KDeclarationContainerImpl.MemberBelonginess.DECLARED);
                }
            });
            this.declaredStaticMembers = ReflectProperties.lazySoft(new Function0<Collection<? extends KCallableImpl<?>>>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$declaredStaticMembers$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final Collection<KCallableImpl<?>> invoke() {
                    KClassImpl<T> kClassImpl = kClassImpl;
                    return kClassImpl.getMembers(kClassImpl.getStaticScope$kotlin_reflection(), KDeclarationContainerImpl.MemberBelonginess.DECLARED);
                }
            });
            this.inheritedNonStaticMembers = ReflectProperties.lazySoft(new Function0<Collection<? extends KCallableImpl<?>>>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$inheritedNonStaticMembers$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final Collection<KCallableImpl<?>> invoke() {
                    KClassImpl<T> kClassImpl = kClassImpl;
                    return kClassImpl.getMembers(kClassImpl.getMemberScope$kotlin_reflection(), KDeclarationContainerImpl.MemberBelonginess.INHERITED);
                }
            });
            this.inheritedStaticMembers = ReflectProperties.lazySoft(new Function0<Collection<? extends KCallableImpl<?>>>() { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$inheritedStaticMembers$2
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final Collection<KCallableImpl<?>> invoke() {
                    KClassImpl<T> kClassImpl = kClassImpl;
                    return kClassImpl.getMembers(kClassImpl.getStaticScope$kotlin_reflection(), KDeclarationContainerImpl.MemberBelonginess.INHERITED);
                }
            });
            this.allNonStaticMembers = ReflectProperties.lazySoft(new Function0<List<? extends KCallableImpl<?>>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$allNonStaticMembers$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KCallableImpl<?>> invoke() {
                    return g.t1(this.this$0.getInheritedNonStaticMembers(), this.this$0.getDeclaredNonStaticMembers());
                }
            });
            this.allStaticMembers = ReflectProperties.lazySoft(new Function0<List<? extends KCallableImpl<?>>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$allStaticMembers$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KCallableImpl<?>> invoke() {
                    return g.t1(this.this$0.getInheritedStaticMembers(), this.this$0.getDeclaredStaticMembers());
                }
            });
            this.declaredMembers = ReflectProperties.lazySoft(new Function0<List<? extends KCallableImpl<?>>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$declaredMembers$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KCallableImpl<?>> invoke() {
                    return g.t1(this.this$0.getDeclaredStaticMembers(), this.this$0.getDeclaredNonStaticMembers());
                }
            });
            this.allMembers = ReflectProperties.lazySoft(new Function0<List<? extends KCallableImpl<?>>>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$Data$allMembers$2
                final /* synthetic */ KClassImpl<T>.Data this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                    this.this$0 = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final List<KCallableImpl<?>> invoke() {
                    return g.t1(this.this$0.getAllStaticMembers(), this.this$0.getAllNonStaticMembers());
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String calculateLocalClassName(Class<?> jClass) {
            String simpleName = jClass.getSimpleName();
            Method enclosingMethod = jClass.getEnclosingMethod();
            if (enclosingMethod != null) {
                return k.m1(simpleName, enclosingMethod.getName() + '$', simpleName);
            }
            Constructor<?> enclosingConstructor = jClass.getEnclosingConstructor();
            if (enclosingConstructor == null) {
                return k.l1('$', simpleName, simpleName);
            }
            return k.m1(simpleName, enclosingConstructor.getName() + '$', simpleName);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final Collection<KCallableImpl<?>> getDeclaredStaticMembers() {
            T value = this.declaredStaticMembers.getValue(this, $$delegatedProperties[10]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final Collection<KCallableImpl<?>> getInheritedNonStaticMembers() {
            T value = this.inheritedNonStaticMembers.getValue(this, $$delegatedProperties[11]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final Collection<KCallableImpl<?>> getInheritedStaticMembers() {
            T value = this.inheritedStaticMembers.getValue(this, $$delegatedProperties[12]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final Collection<KCallableImpl<?>> getAllMembers() {
            T value = this.allMembers.getValue(this, $$delegatedProperties[16]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final Collection<KCallableImpl<?>> getAllNonStaticMembers() {
            T value = this.allNonStaticMembers.getValue(this, $$delegatedProperties[13]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final Collection<KCallableImpl<?>> getAllStaticMembers() {
            T value = this.allStaticMembers.getValue(this, $$delegatedProperties[14]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final List<Annotation> getAnnotations() {
            T value = this.annotations.getValue(this, $$delegatedProperties[1]);
            Intrinsics.f(value, "getValue(...)");
            return (List) value;
        }

        @NotNull
        public final Collection<KFunction<T>> getConstructors() {
            T value = this.constructors.getValue(this, $$delegatedProperties[4]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final Collection<KCallableImpl<?>> getDeclaredMembers() {
            T value = this.declaredMembers.getValue(this, $$delegatedProperties[15]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final Collection<KCallableImpl<?>> getDeclaredNonStaticMembers() {
            T value = this.declaredNonStaticMembers.getValue(this, $$delegatedProperties[9]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @NotNull
        public final ClassDescriptor getDescriptor() {
            T value = this.descriptor.getValue(this, $$delegatedProperties[0]);
            Intrinsics.f(value, "getValue(...)");
            return (ClassDescriptor) value;
        }

        @NotNull
        public final Collection<KClass<?>> getNestedClasses() {
            T value = this.nestedClasses.getValue(this, $$delegatedProperties[5]);
            Intrinsics.f(value, "getValue(...)");
            return (Collection) value;
        }

        @Nullable
        public final T getObjectInstance() {
            return (T) this.objectInstance.getValue();
        }

        @Nullable
        public final String getQualifiedName() {
            return (String) this.qualifiedName.getValue(this, $$delegatedProperties[3]);
        }

        @NotNull
        public final List<KClass<? extends T>> getSealedSubclasses() {
            T value = this.sealedSubclasses.getValue(this, $$delegatedProperties[8]);
            Intrinsics.f(value, "getValue(...)");
            return (List) value;
        }

        @Nullable
        public final String getSimpleName() {
            return (String) this.simpleName.getValue(this, $$delegatedProperties[2]);
        }

        @NotNull
        public final List<KType> getSupertypes() {
            T value = this.supertypes.getValue(this, $$delegatedProperties[7]);
            Intrinsics.f(value, "getValue(...)");
            return (List) value;
        }

        @NotNull
        public final List<KTypeParameter> getTypeParameters() {
            T value = this.typeParameters.getValue(this, $$delegatedProperties[6]);
            Intrinsics.f(value, "getValue(...)");
            return (List) value;
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[KotlinClassHeader.Kind.values().length];
            try {
                iArr[KotlinClassHeader.Kind.FILE_FACADE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[KotlinClassHeader.Kind.MULTIFILE_CLASS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[KotlinClassHeader.Kind.MULTIFILE_CLASS_PART.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[KotlinClassHeader.Kind.SYNTHETIC_CLASS.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[KotlinClassHeader.Kind.UNKNOWN.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr[KotlinClassHeader.Kind.CLASS.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public KClassImpl(@NotNull Class<T> jClass) {
        Intrinsics.g(jClass, "jClass");
        this.jClass = jClass;
        this.data = LazyKt.b(LazyThreadSafetyMode.f71680b, new Function0<KClassImpl<T>.Data>(this) { // from class: kotlin.reflect.jvm.internal.KClassImpl$data$1
            final /* synthetic */ KClassImpl<T> this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
                this.this$0 = this;
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final KClassImpl<T>.Data invoke() {
                return this.this$0.new Data();
            }
        });
    }

    private final ClassDescriptor createSyntheticClass(ClassId classId, RuntimeModuleData moduleData) {
        ModuleDescriptor module = moduleData.getModule();
        FqName packageFqName = classId.getPackageFqName();
        Intrinsics.f(packageFqName, "getPackageFqName(...)");
        final ClassDescriptorImpl classDescriptorImpl = new ClassDescriptorImpl(new EmptyPackageFragmentDescriptor(module, packageFqName), classId.getShortClassName(), Modality.FINAL, ClassKind.CLASS, ul.b.P(moduleData.getModule().getBuiltIns().getAny().getDefaultType()), SourceElement.NO_SOURCE, false, moduleData.getDeserialization().getStorageManager());
        final StorageManager storageManager = moduleData.getDeserialization().getStorageManager();
        classDescriptorImpl.initialize(new GivenFunctionsMemberScope(classDescriptorImpl, storageManager) { // from class: kotlin.reflect.jvm.internal.KClassImpl$createSyntheticClass$1$1
            @Override // kotlin.reflect.jvm.internal.impl.resolve.scopes.GivenFunctionsMemberScope
            @NotNull
            public List<FunctionDescriptor> computeDeclaredFunctions() {
                return EmptyList.f71733a;
            }
        }, EmptySet.f71734a, null);
        return classDescriptorImpl;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ClassDescriptor createSyntheticClassOrFail(ClassId classId, RuntimeModuleData moduleData) {
        KotlinClassHeader classHeader;
        if (getF71858a().isSynthetic()) {
            return createSyntheticClass(classId, moduleData);
        }
        ReflectKotlinClass reflectKotlinClassCreate = ReflectKotlinClass.Factory.create(getF71858a());
        KotlinClassHeader.Kind kind = (reflectKotlinClassCreate == null || (classHeader = reflectKotlinClassCreate.getClassHeader()) == null) ? null : classHeader.getKind();
        switch (kind == null ? -1 : WhenMappings.$EnumSwitchMapping$0[kind.ordinal()]) {
            case -1:
            case 6:
                throw new KotlinReflectionInternalError("Unresolved class: " + getF71858a() + " (kind = " + kind + ')');
            case 0:
            default:
                throw new NoWhenBranchMatchedException();
            case 1:
            case 2:
            case 3:
            case 4:
                return createSyntheticClass(classId, moduleData);
            case 5:
                throw new KotlinReflectionInternalError("Unknown class: " + getF71858a() + " (kind = " + kind + ')');
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ClassId getClassId() {
        return RuntimeTypeMapper.INSTANCE.mapJvmClassToKotlinClassId(getF71858a());
    }

    @Override // kotlin.reflect.KClass
    public boolean equals(@Nullable Object other) {
        return (other instanceof KClassImpl) && JvmClassMappingKt.c(this).equals(JvmClassMappingKt.c((KClass) other));
    }

    @Override // kotlin.reflect.KAnnotatedElement
    @NotNull
    public List<Annotation> getAnnotations() {
        return ((Data) this.data.getValue()).getAnnotations();
    }

    @Override // kotlin.reflect.jvm.internal.KDeclarationContainerImpl
    @NotNull
    public Collection<ConstructorDescriptor> getConstructorDescriptors() {
        ClassDescriptor descriptor = getDescriptor();
        if (descriptor.getKind() == ClassKind.INTERFACE || descriptor.getKind() == ClassKind.OBJECT) {
            return EmptyList.f71733a;
        }
        Collection<ClassConstructorDescriptor> constructors = descriptor.getConstructors();
        Intrinsics.f(constructors, "getConstructors(...)");
        return constructors;
    }

    @Override // kotlin.reflect.KClass
    @NotNull
    public Collection<KFunction<T>> getConstructors() {
        return ((Data) this.data.getValue()).getConstructors();
    }

    @NotNull
    public final Lazy<KClassImpl<T>.Data> getData() {
        return this.data;
    }

    @Override // kotlin.reflect.jvm.internal.KDeclarationContainerImpl
    @NotNull
    public Collection<FunctionDescriptor> getFunctions(@NotNull Name name) {
        Intrinsics.g(name, "name");
        MemberScope memberScope$kotlin_reflection = getMemberScope$kotlin_reflection();
        NoLookupLocation noLookupLocation = NoLookupLocation.FROM_REFLECTION;
        return g.t1(getStaticScope$kotlin_reflection().getContributedFunctions(name, noLookupLocation), memberScope$kotlin_reflection.getContributedFunctions(name, noLookupLocation));
    }

    @Override // kotlin.reflect.jvm.internal.KDeclarationContainerImpl, kotlin.jvm.internal.ClassBasedDeclarationContainer
    @NotNull
    /* renamed from: getJClass */
    public Class<T> getF71858a() {
        return this.jClass;
    }

    @Override // kotlin.reflect.jvm.internal.KDeclarationContainerImpl
    @Nullable
    public PropertyDescriptor getLocalProperty(int index) {
        Class<?> declaringClass;
        if (getF71858a().getSimpleName().equals("DefaultImpls") && (declaringClass = getF71858a().getDeclaringClass()) != null && declaringClass.isInterface()) {
            KClass kClassE = JvmClassMappingKt.e(declaringClass);
            Intrinsics.e(kClassE, "null cannot be cast to non-null type kotlin.reflect.jvm.internal.KClassImpl<*>");
            return ((KClassImpl) kClassE).getLocalProperty(index);
        }
        ClassDescriptor descriptor = getDescriptor();
        DeserializedClassDescriptor deserializedClassDescriptor = descriptor instanceof DeserializedClassDescriptor ? (DeserializedClassDescriptor) descriptor : null;
        if (deserializedClassDescriptor != null) {
            ProtoBuf.Class classProto = deserializedClassDescriptor.getClassProto();
            GeneratedMessageLite.GeneratedExtension<ProtoBuf.Class, List<ProtoBuf.Property>> classLocalVariable = JvmProtoBuf.classLocalVariable;
            Intrinsics.f(classLocalVariable, "classLocalVariable");
            ProtoBuf.Property property = (ProtoBuf.Property) ProtoBufUtilKt.getExtensionOrNull(classProto, classLocalVariable, index);
            if (property != null) {
                return (PropertyDescriptor) UtilKt.deserializeToDescriptor(getF71858a(), property, deserializedClassDescriptor.getC().getNameResolver(), deserializedClassDescriptor.getC().getTypeTable(), deserializedClassDescriptor.getMetadataVersion(), KClassImpl$getLocalProperty$2$1$1.INSTANCE);
            }
        }
        return null;
    }

    @NotNull
    public final MemberScope getMemberScope$kotlin_reflection() {
        return getDescriptor().getDefaultType().getMemberScope();
    }

    @Override // kotlin.reflect.KDeclarationContainer
    @NotNull
    public Collection<KCallable<?>> getMembers() {
        return ((Data) this.data.getValue()).getAllMembers();
    }

    @Override // kotlin.reflect.KClass
    @NotNull
    public Collection<KClass<?>> getNestedClasses() {
        return ((Data) this.data.getValue()).getNestedClasses();
    }

    @Override // kotlin.reflect.KClass
    @Nullable
    public T getObjectInstance() {
        return (T) ((Data) this.data.getValue()).getObjectInstance();
    }

    @Override // kotlin.reflect.jvm.internal.KDeclarationContainerImpl
    @NotNull
    public Collection<PropertyDescriptor> getProperties(@NotNull Name name) {
        Intrinsics.g(name, "name");
        MemberScope memberScope$kotlin_reflection = getMemberScope$kotlin_reflection();
        NoLookupLocation noLookupLocation = NoLookupLocation.FROM_REFLECTION;
        return g.t1(getStaticScope$kotlin_reflection().getContributedVariables(name, noLookupLocation), memberScope$kotlin_reflection.getContributedVariables(name, noLookupLocation));
    }

    @Override // kotlin.reflect.KClass
    @Nullable
    public String getQualifiedName() {
        return ((Data) this.data.getValue()).getQualifiedName();
    }

    @Override // kotlin.reflect.KClass
    @NotNull
    public List<KClass<? extends T>> getSealedSubclasses() {
        return ((Data) this.data.getValue()).getSealedSubclasses();
    }

    @Override // kotlin.reflect.KClass
    @Nullable
    public String getSimpleName() {
        return ((Data) this.data.getValue()).getSimpleName();
    }

    @NotNull
    public final MemberScope getStaticScope$kotlin_reflection() {
        MemberScope staticScope = getDescriptor().getStaticScope();
        Intrinsics.f(staticScope, "getStaticScope(...)");
        return staticScope;
    }

    @Override // kotlin.reflect.KClass
    @NotNull
    public List<KType> getSupertypes() {
        return ((Data) this.data.getValue()).getSupertypes();
    }

    @Override // kotlin.reflect.KClass
    @NotNull
    public List<KTypeParameter> getTypeParameters() {
        return ((Data) this.data.getValue()).getTypeParameters();
    }

    @Override // kotlin.reflect.KClass
    @Nullable
    public KVisibility getVisibility() {
        DescriptorVisibility visibility = getDescriptor().getVisibility();
        Intrinsics.f(visibility, "getVisibility(...)");
        return UtilKt.toKVisibility(visibility);
    }

    @Override // kotlin.reflect.KClass
    public int hashCode() {
        return JvmClassMappingKt.c(this).hashCode();
    }

    @Override // kotlin.reflect.KClass
    public boolean isAbstract() {
        return getDescriptor().getModality() == Modality.ABSTRACT;
    }

    @Override // kotlin.reflect.KClass
    public boolean isCompanion() {
        return getDescriptor().isCompanionObject();
    }

    @Override // kotlin.reflect.KClass
    public boolean isData() {
        return getDescriptor().isData();
    }

    @Override // kotlin.reflect.KClass
    public boolean isFinal() {
        return getDescriptor().getModality() == Modality.FINAL;
    }

    @Override // kotlin.reflect.KClass
    public boolean isFun() {
        return getDescriptor().isFun();
    }

    @Override // kotlin.reflect.KClass
    public boolean isInner() {
        return getDescriptor().isInner();
    }

    @Override // kotlin.reflect.KClass
    public boolean isInstance(@Nullable Object value) {
        Integer functionClassArity = ReflectClassUtilKt.getFunctionClassArity(getF71858a());
        if (functionClassArity != null) {
            return TypeIntrinsics.f(functionClassArity.intValue(), value);
        }
        Class wrapperByPrimitive = ReflectClassUtilKt.getWrapperByPrimitive(getF71858a());
        if (wrapperByPrimitive == null) {
            wrapperByPrimitive = getF71858a();
        }
        return wrapperByPrimitive.isInstance(value);
    }

    @Override // kotlin.reflect.KClass
    public boolean isOpen() {
        return getDescriptor().getModality() == Modality.OPEN;
    }

    @Override // kotlin.reflect.KClass
    public boolean isSealed() {
        return getDescriptor().getModality() == Modality.SEALED;
    }

    @Override // kotlin.reflect.KClass
    public boolean isValue() {
        return getDescriptor().isValue();
    }

    @NotNull
    public String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder("class ");
        ClassId classId = getClassId();
        FqName packageFqName = classId.getPackageFqName();
        Intrinsics.f(packageFqName, "getPackageFqName(...)");
        if (packageFqName.isRoot()) {
            str = b.f42142b;
        } else {
            str = packageFqName.asString() + '.';
        }
        String strAsString = classId.getRelativeClassName().asString();
        Intrinsics.f(strAsString, "asString(...)");
        sb2.append(str + j.E0(strAsString, '.', '$'));
        return sb2.toString();
    }

    @Override // kotlin.reflect.jvm.internal.KClassifierImpl
    @NotNull
    public ClassDescriptor getDescriptor() {
        return ((Data) this.data.getValue()).getDescriptor();
    }
}
