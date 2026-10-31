package kotlin.reflect.jvm.internal.impl.descriptors;

/* loaded from: classes5.dex */
public interface DeclarationDescriptorVisitor<R, D> {
    R visitClassDescriptor(ClassDescriptor classDescriptor, D d5);

    R visitConstructorDescriptor(ConstructorDescriptor constructorDescriptor, D d5);

    R visitFunctionDescriptor(FunctionDescriptor functionDescriptor, D d5);

    R visitModuleDeclaration(ModuleDescriptor moduleDescriptor, D d5);

    R visitPackageFragmentDescriptor(PackageFragmentDescriptor packageFragmentDescriptor, D d5);

    R visitPackageViewDescriptor(PackageViewDescriptor packageViewDescriptor, D d5);

    R visitPropertyDescriptor(PropertyDescriptor propertyDescriptor, D d5);

    R visitPropertyGetterDescriptor(PropertyGetterDescriptor propertyGetterDescriptor, D d5);

    R visitPropertySetterDescriptor(PropertySetterDescriptor propertySetterDescriptor, D d5);

    R visitReceiverParameterDescriptor(ReceiverParameterDescriptor receiverParameterDescriptor, D d5);

    R visitTypeAliasDescriptor(TypeAliasDescriptor typeAliasDescriptor, D d5);

    R visitTypeParameterDescriptor(TypeParameterDescriptor typeParameterDescriptor, D d5);

    R visitValueParameterDescriptor(ValueParameterDescriptor valueParameterDescriptor, D d5);
}
