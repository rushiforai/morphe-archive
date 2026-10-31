package kotlin.reflect.jvm.internal.impl.descriptors.impl;

import b70.c;
import b70.g;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.PropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KProperty;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptorVisitor;
import kotlin.reflect.jvm.internal.impl.descriptors.PackageFragmentDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.PackageFragmentProviderKt;
import kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.Annotations;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.ChainedMemberScope;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.LazyScopeAdapter;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.MemberScope;
import kotlin.reflect.jvm.internal.impl.storage.NotNullLazyValue;
import kotlin.reflect.jvm.internal.impl.storage.StorageKt;
import kotlin.reflect.jvm.internal.impl.storage.StorageManager;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public class LazyPackageViewDescriptorImpl extends DeclarationDescriptorImpl implements PackageViewDescriptor {
    static final /* synthetic */ KProperty<Object>[] $$delegatedProperties;

    @NotNull
    private final NotNullLazyValue empty$delegate;

    @NotNull
    private final FqName fqName;

    @NotNull
    private final NotNullLazyValue fragments$delegate;

    @NotNull
    private final MemberScope memberScope;

    @NotNull
    private final ModuleDescriptorImpl module;

    static {
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        $$delegatedProperties = new KProperty[]{reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(LazyPackageViewDescriptorImpl.class), "fragments", "getFragments()Ljava/util/List;")), reflectionFactory.property1(new PropertyReference1Impl(reflectionFactory.getOrCreateKotlinClass(LazyPackageViewDescriptorImpl.class), "empty", "getEmpty()Z"))};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LazyPackageViewDescriptorImpl(@NotNull ModuleDescriptorImpl module, @NotNull FqName fqName, @NotNull StorageManager storageManager) {
        super(Annotations.Companion.getEMPTY(), fqName.shortNameOrSpecial());
        Intrinsics.g(module, "module");
        Intrinsics.g(fqName, "fqName");
        Intrinsics.g(storageManager, "storageManager");
        this.module = module;
        this.fqName = fqName;
        this.fragments$delegate = storageManager.createLazyValue(new Function0<List<? extends PackageFragmentDescriptor>>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.impl.LazyPackageViewDescriptorImpl$fragments$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final List<PackageFragmentDescriptor> invoke() {
                return PackageFragmentProviderKt.packageFragments(this.this$0.getModule().getPackageFragmentProvider(), this.this$0.getFqName());
            }
        });
        this.empty$delegate = storageManager.createLazyValue(new Function0<Boolean>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.impl.LazyPackageViewDescriptorImpl$empty$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Boolean invoke() {
                return Boolean.valueOf(PackageFragmentProviderKt.isEmpty(this.this$0.getModule().getPackageFragmentProvider(), this.this$0.getFqName()));
            }
        });
        this.memberScope = new LazyScopeAdapter(storageManager, new Function0<MemberScope>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.impl.LazyPackageViewDescriptorImpl$memberScope$1
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final MemberScope invoke() {
                if (this.this$0.isEmpty()) {
                    return MemberScope.Empty.INSTANCE;
                }
                List<PackageFragmentDescriptor> fragments = this.this$0.getFragments();
                ArrayList arrayList = new ArrayList(c.u0(fragments, 10));
                Iterator<T> it = fragments.iterator();
                while (it.hasNext()) {
                    arrayList.add(((PackageFragmentDescriptor) it.next()).getMemberScope());
                }
                ArrayList arrayListU1 = g.u1(arrayList, new SubpackagesScope(this.this$0.getModule(), this.this$0.getFqName()));
                return ChainedMemberScope.Companion.create("package view scope for " + this.this$0.getFqName() + " in " + this.this$0.getModule().getName(), arrayListU1);
            }
        });
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor
    public <R, D> R accept(@NotNull DeclarationDescriptorVisitor<R, D> visitor, D d5) {
        Intrinsics.g(visitor, "visitor");
        return visitor.visitPackageViewDescriptor(this, d5);
    }

    public boolean equals(@Nullable Object obj) {
        PackageViewDescriptor packageViewDescriptor = obj instanceof PackageViewDescriptor ? (PackageViewDescriptor) obj : null;
        return packageViewDescriptor != null && Intrinsics.b(getFqName(), packageViewDescriptor.getFqName()) && Intrinsics.b(getModule(), packageViewDescriptor.getModule());
    }

    public final boolean getEmpty() {
        return ((Boolean) StorageKt.getValue(this.empty$delegate, this, (KProperty<?>) $$delegatedProperties[1])).booleanValue();
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor
    @NotNull
    public FqName getFqName() {
        return this.fqName;
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor
    @NotNull
    public List<PackageFragmentDescriptor> getFragments() {
        return (List) StorageKt.getValue(this.fragments$delegate, this, (KProperty<?>) $$delegatedProperties[0]);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor
    @NotNull
    public MemberScope getMemberScope() {
        return this.memberScope;
    }

    public int hashCode() {
        return getFqName().hashCode() + (getModule().hashCode() * 31);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor
    public boolean isEmpty() {
        return getEmpty();
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor
    @Nullable
    public PackageViewDescriptor getContainingDeclaration() {
        if (getFqName().isRoot()) {
            return null;
        }
        ModuleDescriptorImpl module = getModule();
        FqName fqNameParent = getFqName().parent();
        Intrinsics.f(fqNameParent, "parent(...)");
        return module.getPackage(fqNameParent);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor
    @NotNull
    public ModuleDescriptorImpl getModule() {
        return this.module;
    }
}
