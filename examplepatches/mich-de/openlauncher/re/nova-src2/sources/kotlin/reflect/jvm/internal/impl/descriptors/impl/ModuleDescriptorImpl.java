package kotlin.reflect.jvm.internal.impl.descriptors.impl;

import b.c0;
import b70.c;
import b70.g;
import b70.h;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.builtins.KotlinBuiltIns;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptorVisitor;
import kotlin.reflect.jvm.internal.impl.descriptors.InvalidModuleExceptionKt;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleCapability;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.PackageFragmentProvider;
import kotlin.reflect.jvm.internal.impl.descriptors.PackageViewDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.Annotations;
import kotlin.reflect.jvm.internal.impl.descriptors.impl.PackageViewDescriptorFactory;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.platform.TargetPlatform;
import kotlin.reflect.jvm.internal.impl.storage.MemoizedFunctionToNotNull;
import kotlin.reflect.jvm.internal.impl.storage.StorageManager;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ModuleDescriptorImpl extends DeclarationDescriptorImpl implements ModuleDescriptor {

    @NotNull
    private final KotlinBuiltIns builtIns;

    @NotNull
    private final Map<ModuleCapability<?>, Object> capabilities;

    @Nullable
    private ModuleDependencies dependencies;
    private boolean isValid;

    @Nullable
    private PackageFragmentProvider packageFragmentProviderForModuleContent;

    @NotNull
    private final Lazy packageFragmentProviderForWholeModuleWithDependencies$delegate;

    @NotNull
    private final PackageViewDescriptorFactory packageViewDescriptorFactory;

    @NotNull
    private final MemoizedFunctionToNotNull<FqName, PackageViewDescriptor> packages;

    @Nullable
    private final TargetPlatform platform;

    @Nullable
    private final Name stableName;

    @NotNull
    private final StorageManager storageManager;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ModuleDescriptorImpl(@NotNull Name moduleName, @NotNull StorageManager storageManager, @NotNull KotlinBuiltIns builtIns, @Nullable TargetPlatform targetPlatform) {
        this(moduleName, storageManager, builtIns, targetPlatform, null, null, 48, null);
        Intrinsics.g(moduleName, "moduleName");
        Intrinsics.g(storageManager, "storageManager");
        Intrinsics.g(builtIns, "builtIns");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String getId() {
        String string = getName().toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    private final CompositePackageFragmentProvider getPackageFragmentProviderForWholeModuleWithDependencies() {
        return (CompositePackageFragmentProvider) this.packageFragmentProviderForWholeModuleWithDependencies$delegate.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isInitialized() {
        return this.packageFragmentProviderForModuleContent != null;
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor
    @Nullable
    public <R, D> R accept(@NotNull DeclarationDescriptorVisitor<R, D> declarationDescriptorVisitor, D d5) {
        return (R) ModuleDescriptor.DefaultImpls.accept(this, declarationDescriptorVisitor, d5);
    }

    public void assertValid() {
        if (isValid()) {
            return;
        }
        InvalidModuleExceptionKt.moduleInvalidated(this);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor
    @NotNull
    public KotlinBuiltIns getBuiltIns() {
        return this.builtIns;
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor
    @Nullable
    public <T> T getCapability(@NotNull ModuleCapability<T> capability) {
        Intrinsics.g(capability, "capability");
        T t6 = (T) this.capabilities.get(capability);
        if (t6 == null) {
            return null;
        }
        return t6;
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor
    @Nullable
    public DeclarationDescriptor getContainingDeclaration() {
        return ModuleDescriptor.DefaultImpls.getContainingDeclaration(this);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor
    @NotNull
    public List<ModuleDescriptor> getExpectedByModules() {
        ModuleDependencies moduleDependencies = this.dependencies;
        if (moduleDependencies != null) {
            return moduleDependencies.getDirectExpectedByDependencies();
        }
        throw new AssertionError(c0.q(new StringBuilder("Dependencies of module "), getId(), " were not set"));
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor
    @NotNull
    public PackageViewDescriptor getPackage(@NotNull FqName fqName) {
        Intrinsics.g(fqName, "fqName");
        assertValid();
        return (PackageViewDescriptor) this.packages.invoke(fqName);
    }

    @NotNull
    public final PackageFragmentProvider getPackageFragmentProvider() {
        assertValid();
        return getPackageFragmentProviderForWholeModuleWithDependencies();
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor
    @NotNull
    public Collection<FqName> getSubPackagesOf(@NotNull FqName fqName, @NotNull Function1<? super Name, Boolean> nameFilter) {
        Intrinsics.g(fqName, "fqName");
        Intrinsics.g(nameFilter, "nameFilter");
        assertValid();
        return getPackageFragmentProvider().getSubPackagesOf(fqName, nameFilter);
    }

    public final void initialize(@NotNull PackageFragmentProvider providerForModuleContent) {
        Intrinsics.g(providerForModuleContent, "providerForModuleContent");
        isInitialized();
        this.packageFragmentProviderForModuleContent = providerForModuleContent;
    }

    public boolean isValid() {
        return this.isValid;
    }

    public final void setDependencies(@NotNull List<ModuleDescriptorImpl> descriptors) {
        Intrinsics.g(descriptors, "descriptors");
        setDependencies(descriptors, EmptySet.f71734a);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor
    public boolean shouldSeeInternalsOf(@NotNull ModuleDescriptor targetModule) {
        Intrinsics.g(targetModule, "targetModule");
        if (equals(targetModule)) {
            return true;
        }
        ModuleDependencies moduleDependencies = this.dependencies;
        Intrinsics.d(moduleDependencies);
        return g.O0(moduleDependencies.getModulesWhoseInternalsAreVisible(), targetModule) || getExpectedByModules().contains(targetModule) || targetModule.getExpectedByModules().contains(this);
    }

    @Override // kotlin.reflect.jvm.internal.impl.descriptors.impl.DeclarationDescriptorImpl
    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        if (!isValid()) {
            sb2.append(" !isValid");
        }
        sb2.append(" packageFragmentProvider: ");
        PackageFragmentProvider packageFragmentProvider = this.packageFragmentProviderForModuleContent;
        sb2.append(packageFragmentProvider != null ? packageFragmentProvider.getClass().getSimpleName() : null);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public /* synthetic */ ModuleDescriptorImpl(Name name, StorageManager storageManager, KotlinBuiltIns kotlinBuiltIns, TargetPlatform targetPlatform, Map map, Name name2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(name, storageManager, kotlinBuiltIns, (i5 & 8) != 0 ? null : targetPlatform, (i5 & 16) != 0 ? h.f17594a : map, (i5 & 32) != 0 ? null : name2);
    }

    public final void setDependencies(@NotNull ModuleDependencies dependencies) {
        Intrinsics.g(dependencies, "dependencies");
        this.dependencies = dependencies;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ModuleDescriptorImpl(@NotNull Name moduleName, @NotNull StorageManager storageManager, @NotNull KotlinBuiltIns builtIns, @Nullable TargetPlatform targetPlatform, @NotNull Map<ModuleCapability<?>, ? extends Object> capabilities, @Nullable Name name) {
        super(Annotations.Companion.getEMPTY(), moduleName);
        Intrinsics.g(moduleName, "moduleName");
        Intrinsics.g(storageManager, "storageManager");
        Intrinsics.g(builtIns, "builtIns");
        Intrinsics.g(capabilities, "capabilities");
        this.storageManager = storageManager;
        this.builtIns = builtIns;
        this.platform = targetPlatform;
        this.stableName = name;
        if (moduleName.isSpecial()) {
            this.capabilities = capabilities;
            PackageViewDescriptorFactory packageViewDescriptorFactory = (PackageViewDescriptorFactory) getCapability(PackageViewDescriptorFactory.Companion.getCAPABILITY());
            this.packageViewDescriptorFactory = packageViewDescriptorFactory == null ? PackageViewDescriptorFactory.Default.INSTANCE : packageViewDescriptorFactory;
            this.isValid = true;
            this.packages = storageManager.createMemoizedFunction(new Function1<FqName, PackageViewDescriptor>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.impl.ModuleDescriptorImpl$packages$1
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final PackageViewDescriptor invoke(@NotNull FqName fqName) {
                    Intrinsics.g(fqName, "fqName");
                    PackageViewDescriptorFactory packageViewDescriptorFactory2 = this.this$0.packageViewDescriptorFactory;
                    ModuleDescriptorImpl moduleDescriptorImpl = this.this$0;
                    return packageViewDescriptorFactory2.compute(moduleDescriptorImpl, fqName, moduleDescriptorImpl.storageManager);
                }
            });
            this.packageFragmentProviderForWholeModuleWithDependencies$delegate = LazyKt.a(new Function0<CompositePackageFragmentProvider>() { // from class: kotlin.reflect.jvm.internal.impl.descriptors.impl.ModuleDescriptorImpl$packageFragmentProviderForWholeModuleWithDependencies$2
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                @NotNull
                public final CompositePackageFragmentProvider invoke() {
                    ModuleDependencies moduleDependencies = this.this$0.dependencies;
                    ModuleDescriptorImpl moduleDescriptorImpl = this.this$0;
                    if (moduleDependencies == null) {
                        throw new AssertionError("Dependencies of module " + moduleDescriptorImpl.getId() + " were not set before querying module content");
                    }
                    List<ModuleDescriptorImpl> allDependencies = moduleDependencies.getAllDependencies();
                    this.this$0.assertValid();
                    allDependencies.contains(this.this$0);
                    List<ModuleDescriptorImpl> list = allDependencies;
                    Iterator<T> it = list.iterator();
                    while (it.hasNext()) {
                        ((ModuleDescriptorImpl) it.next()).isInitialized();
                    }
                    ArrayList arrayList = new ArrayList(c.u0(list, 10));
                    Iterator<T> it2 = list.iterator();
                    while (it2.hasNext()) {
                        PackageFragmentProvider packageFragmentProvider = ((ModuleDescriptorImpl) it2.next()).packageFragmentProviderForModuleContent;
                        Intrinsics.d(packageFragmentProvider);
                        arrayList.add(packageFragmentProvider);
                    }
                    return new CompositePackageFragmentProvider(arrayList, "CompositeProvider@ModuleDescriptor for " + this.this$0.getName());
                }
            });
            return;
        }
        throw new IllegalArgumentException("Module name must be special: " + moduleName);
    }

    public final void setDependencies(@NotNull ModuleDescriptorImpl... descriptors) {
        Intrinsics.g(descriptors, "descriptors");
        setDependencies(kotlin.collections.c.b1(descriptors));
    }

    public final void setDependencies(@NotNull List<ModuleDescriptorImpl> descriptors, @NotNull Set<ModuleDescriptorImpl> friends) {
        Intrinsics.g(descriptors, "descriptors");
        Intrinsics.g(friends, "friends");
        setDependencies(new ModuleDependenciesImpl(descriptors, friends, EmptyList.f71733a, EmptySet.f71734a));
    }
}
