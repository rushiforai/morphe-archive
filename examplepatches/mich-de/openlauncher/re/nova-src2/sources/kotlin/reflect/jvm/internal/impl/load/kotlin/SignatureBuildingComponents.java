package kotlin.reflect.jvm.internal.impl.load.kotlin;

import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class SignatureBuildingComponents {

    @NotNull
    public static final SignatureBuildingComponents INSTANCE = new SignatureBuildingComponents();

    private SignatureBuildingComponents() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String escapeClassName(String str) {
        return str.length() > 1 ? c1.m(';', "L", str) : str;
    }

    @NotNull
    public final String[] constructors(@NotNull String... signatures) {
        Intrinsics.g(signatures, "signatures");
        ArrayList arrayList = new ArrayList(signatures.length);
        for (String str : signatures) {
            arrayList.add("<init>(" + str + ")V");
        }
        return (String[]) arrayList.toArray(new String[0]);
    }

    @NotNull
    public final Set<String> inClass(@NotNull String internalName, @NotNull String... signatures) {
        Intrinsics.g(internalName, "internalName");
        Intrinsics.g(signatures, "signatures");
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (String str : signatures) {
            linkedHashSet.add(internalName + '.' + str);
        }
        return linkedHashSet;
    }

    @NotNull
    public final Set<String> inJavaLang(@NotNull String name, @NotNull String... signatures) {
        Intrinsics.g(name, "name");
        Intrinsics.g(signatures, "signatures");
        return inClass(javaLang(name), (String[]) Arrays.copyOf(signatures, signatures.length));
    }

    @NotNull
    public final Set<String> inJavaUtil(@NotNull String name, @NotNull String... signatures) {
        Intrinsics.g(name, "name");
        Intrinsics.g(signatures, "signatures");
        return inClass(javaUtil(name), (String[]) Arrays.copyOf(signatures, signatures.length));
    }

    @NotNull
    public final String javaFunction(@NotNull String name) {
        Intrinsics.g(name, "name");
        return "java/util/function/".concat(name);
    }

    @NotNull
    public final String javaLang(@NotNull String name) {
        Intrinsics.g(name, "name");
        return "java/lang/".concat(name);
    }

    @NotNull
    public final String javaUtil(@NotNull String name) {
        Intrinsics.g(name, "name");
        return "java/util/".concat(name);
    }

    @NotNull
    public final String jvmDescriptor(@NotNull String name, @NotNull List<String> parameters, @NotNull String ret) {
        Intrinsics.g(name, "name");
        Intrinsics.g(parameters, "parameters");
        Intrinsics.g(ret, "ret");
        return name + '(' + g.f1(parameters, b.f42142b, null, null, 0, new Function1<String, CharSequence>() { // from class: kotlin.reflect.jvm.internal.impl.load.kotlin.SignatureBuildingComponents.jvmDescriptor.1
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final CharSequence invoke(@NotNull String it) {
                Intrinsics.g(it, "it");
                return SignatureBuildingComponents.INSTANCE.escapeClassName(it);
            }
        }, 30) + ')' + escapeClassName(ret);
    }

    @NotNull
    public final String signature(@NotNull String internalName, @NotNull String jvmDescriptor) {
        Intrinsics.g(internalName, "internalName");
        Intrinsics.g(jvmDescriptor, "jvmDescriptor");
        return internalName + '.' + jvmDescriptor;
    }
}
