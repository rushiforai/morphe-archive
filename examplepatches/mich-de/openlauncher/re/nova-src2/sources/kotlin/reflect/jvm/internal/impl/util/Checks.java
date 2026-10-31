package kotlin.reflect.jvm.internal.impl.util;

import java.util.Arrays;
import java.util.Collection;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.FunctionDescriptor;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.util.CheckResult;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class Checks {

    @NotNull
    private final Function1<FunctionDescriptor, String> additionalCheck;

    @NotNull
    private final Check[] checks;

    @Nullable
    private final Name name;

    @Nullable
    private final Collection<Name> nameList;

    @Nullable
    private final Regex regex;

    /* JADX WARN: Multi-variable type inference failed */
    private Checks(Name name, Regex regex, Collection<Name> collection, Function1<? super FunctionDescriptor, String> function1, Check... checkArr) {
        this.name = name;
        this.regex = regex;
        this.nameList = collection;
        this.additionalCheck = function1;
        this.checks = checkArr;
    }

    @NotNull
    public final CheckResult checkAll(@NotNull FunctionDescriptor functionDescriptor) {
        Intrinsics.g(functionDescriptor, "functionDescriptor");
        for (Check check : this.checks) {
            String strInvoke = check.invoke(functionDescriptor);
            if (strInvoke != null) {
                return new CheckResult.IllegalSignature(strInvoke);
            }
        }
        String str = (String) this.additionalCheck.invoke(functionDescriptor);
        return str != null ? new CheckResult.IllegalSignature(str) : CheckResult.SuccessCheck.INSTANCE;
    }

    public final boolean isApplicable(@NotNull FunctionDescriptor functionDescriptor) {
        Intrinsics.g(functionDescriptor, "functionDescriptor");
        if (this.name != null && !Intrinsics.b(functionDescriptor.getName(), this.name)) {
            return false;
        }
        if (this.regex != null) {
            String strAsString = functionDescriptor.getName().asString();
            Intrinsics.f(strAsString, "asString(...)");
            if (!this.regex.f(strAsString)) {
                return false;
            }
        }
        Collection<Name> collection = this.nameList;
        return collection == null || collection.contains(functionDescriptor.getName());
    }

    public /* synthetic */ Checks(Name name, Check[] checkArr, Function1 function1, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(name, checkArr, (Function1<? super FunctionDescriptor, String>) ((i5 & 4) != 0 ? new Function1() { // from class: kotlin.reflect.jvm.internal.impl.util.Checks.2
            @Override // kotlin.jvm.functions.Function1
            @Nullable
            public final Void invoke(@NotNull FunctionDescriptor functionDescriptor) {
                Intrinsics.g(functionDescriptor, "$this$null");
                return null;
            }
        } : function1));
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public Checks(@NotNull Name name, @NotNull Check[] checks, @NotNull Function1<? super FunctionDescriptor, String> additionalChecks) {
        this(name, (Regex) null, (Collection<Name>) null, additionalChecks, (Check[]) Arrays.copyOf(checks, checks.length));
        Intrinsics.g(name, "name");
        Intrinsics.g(checks, "checks");
        Intrinsics.g(additionalChecks, "additionalChecks");
    }

    public /* synthetic */ Checks(Regex regex, Check[] checkArr, Function1 function1, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(regex, checkArr, (Function1<? super FunctionDescriptor, String>) ((i5 & 4) != 0 ? new Function1() { // from class: kotlin.reflect.jvm.internal.impl.util.Checks.3
            @Override // kotlin.jvm.functions.Function1
            @Nullable
            public final Void invoke(@NotNull FunctionDescriptor functionDescriptor) {
                Intrinsics.g(functionDescriptor, "$this$null");
                return null;
            }
        } : function1));
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public Checks(@NotNull Regex regex, @NotNull Check[] checks, @NotNull Function1<? super FunctionDescriptor, String> additionalChecks) {
        this((Name) null, regex, (Collection<Name>) null, additionalChecks, (Check[]) Arrays.copyOf(checks, checks.length));
        Intrinsics.g(regex, "regex");
        Intrinsics.g(checks, "checks");
        Intrinsics.g(additionalChecks, "additionalChecks");
    }

    public /* synthetic */ Checks(Collection collection, Check[] checkArr, Function1 function1, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((Collection<Name>) collection, checkArr, (Function1<? super FunctionDescriptor, String>) ((i5 & 4) != 0 ? new Function1() { // from class: kotlin.reflect.jvm.internal.impl.util.Checks.4
            @Override // kotlin.jvm.functions.Function1
            @Nullable
            public final Void invoke(@NotNull FunctionDescriptor functionDescriptor) {
                Intrinsics.g(functionDescriptor, "$this$null");
                return null;
            }
        } : function1));
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public Checks(@NotNull Collection<Name> nameList, @NotNull Check[] checks, @NotNull Function1<? super FunctionDescriptor, String> additionalChecks) {
        this((Name) null, (Regex) null, nameList, additionalChecks, (Check[]) Arrays.copyOf(checks, checks.length));
        Intrinsics.g(nameList, "nameList");
        Intrinsics.g(checks, "checks");
        Intrinsics.g(additionalChecks, "additionalChecks");
    }
}
