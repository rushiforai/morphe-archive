package kotlin.reflect.jvm.internal.impl.resolve.scopes;

import b.u4;
import b70.g;
import fq.c;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class DescriptorKindFilter {

    @JvmField
    @NotNull
    public static final DescriptorKindFilter ALL;
    private static final int ALL_KINDS_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter CALLABLES;
    private static final int CALLABLES_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter CLASSIFIERS;
    private static final int CLASSIFIERS_MASK;

    @NotNull
    public static final Companion Companion;

    @NotNull
    private static final List<Companion.MaskToName> DEBUG_MASK_BIT_NAMES;

    @NotNull
    private static final List<Companion.MaskToName> DEBUG_PREDEFINED_FILTERS_MASK_NAMES;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter FUNCTIONS;
    private static final int FUNCTIONS_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter NON_SINGLETON_CLASSIFIERS;
    private static final int NON_SINGLETON_CLASSIFIERS_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter PACKAGES;
    private static final int PACKAGES_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter SINGLETON_CLASSIFIERS;
    private static final int SINGLETON_CLASSIFIERS_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter TYPE_ALIASES;
    private static final int TYPE_ALIASES_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter VALUES;
    private static final int VALUES_MASK;

    @JvmField
    @NotNull
    public static final DescriptorKindFilter VARIABLES;
    private static final int VARIABLES_MASK;
    private static int nextMaskValue;

    @NotNull
    private final List<DescriptorKindExclude> excludes;
    private final int kindMask;

    @SourceDebugExtension
    public static final class Companion {

        public static final class MaskToName {
            private final int mask;

            @NotNull
            private final String name;

            public MaskToName(int i5, @NotNull String name) {
                Intrinsics.g(name, "name");
                this.mask = i5;
                this.name = name;
            }

            public final int getMask() {
                return this.mask;
            }

            @NotNull
            public final String getName() {
                return this.name;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final int nextMask() {
            int i5 = DescriptorKindFilter.nextMaskValue;
            DescriptorKindFilter.nextMaskValue <<= 1;
            return i5;
        }

        public final int getALL_KINDS_MASK() {
            return DescriptorKindFilter.ALL_KINDS_MASK;
        }

        public final int getCLASSIFIERS_MASK() {
            return DescriptorKindFilter.CLASSIFIERS_MASK;
        }

        public final int getFUNCTIONS_MASK() {
            return DescriptorKindFilter.FUNCTIONS_MASK;
        }

        public final int getNON_SINGLETON_CLASSIFIERS_MASK() {
            return DescriptorKindFilter.NON_SINGLETON_CLASSIFIERS_MASK;
        }

        public final int getPACKAGES_MASK() {
            return DescriptorKindFilter.PACKAGES_MASK;
        }

        public final int getSINGLETON_CLASSIFIERS_MASK() {
            return DescriptorKindFilter.SINGLETON_CLASSIFIERS_MASK;
        }

        public final int getTYPE_ALIASES_MASK() {
            return DescriptorKindFilter.TYPE_ALIASES_MASK;
        }

        public final int getVARIABLES_MASK() {
            return DescriptorKindFilter.VARIABLES_MASK;
        }

        private Companion() {
        }
    }

    static {
        Companion.MaskToName maskToName;
        Companion.MaskToName maskToName2;
        Companion companion = new Companion(null);
        Companion = companion;
        nextMaskValue = 1;
        int iNextMask = companion.nextMask();
        NON_SINGLETON_CLASSIFIERS_MASK = iNextMask;
        int iNextMask2 = companion.nextMask();
        SINGLETON_CLASSIFIERS_MASK = iNextMask2;
        int iNextMask3 = companion.nextMask();
        TYPE_ALIASES_MASK = iNextMask3;
        int iNextMask4 = companion.nextMask();
        PACKAGES_MASK = iNextMask4;
        int iNextMask5 = companion.nextMask();
        FUNCTIONS_MASK = iNextMask5;
        int iNextMask6 = companion.nextMask();
        VARIABLES_MASK = iNextMask6;
        int iNextMask7 = companion.nextMask() - 1;
        ALL_KINDS_MASK = iNextMask7;
        int i5 = iNextMask | iNextMask2 | iNextMask3;
        CLASSIFIERS_MASK = i5;
        int i11 = iNextMask2 | iNextMask5 | iNextMask6;
        VALUES_MASK = i11;
        int i12 = iNextMask5 | iNextMask6;
        CALLABLES_MASK = i12;
        ALL = new DescriptorKindFilter(iNextMask7, null, 2, null);
        CALLABLES = new DescriptorKindFilter(i12, null, 2, null);
        NON_SINGLETON_CLASSIFIERS = new DescriptorKindFilter(iNextMask, null, 2, null);
        SINGLETON_CLASSIFIERS = new DescriptorKindFilter(iNextMask2, null, 2, null);
        TYPE_ALIASES = new DescriptorKindFilter(iNextMask3, null, 2, null);
        CLASSIFIERS = new DescriptorKindFilter(i5, null, 2, null);
        PACKAGES = new DescriptorKindFilter(iNextMask4, null, 2, null);
        FUNCTIONS = new DescriptorKindFilter(iNextMask5, null, 2, null);
        VARIABLES = new DescriptorKindFilter(iNextMask6, null, 2, null);
        VALUES = new DescriptorKindFilter(i11, null, 2, null);
        Field[] fields = DescriptorKindFilter.class.getFields();
        Intrinsics.f(fields, "getFields(...)");
        ArrayList<Field> arrayList = new ArrayList();
        for (Field field : fields) {
            if (Modifier.isStatic(field.getModifiers())) {
                arrayList.add(field);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        for (Field field2 : arrayList) {
            Object obj = field2.get(null);
            DescriptorKindFilter descriptorKindFilter = obj instanceof DescriptorKindFilter ? (DescriptorKindFilter) obj : null;
            if (descriptorKindFilter != null) {
                int i13 = descriptorKindFilter.kindMask;
                String name = field2.getName();
                Intrinsics.f(name, "getName(...)");
                maskToName2 = new Companion.MaskToName(i13, name);
            } else {
                maskToName2 = null;
            }
            if (maskToName2 != null) {
                arrayList2.add(maskToName2);
            }
        }
        DEBUG_PREDEFINED_FILTERS_MASK_NAMES = arrayList2;
        Field[] fields2 = DescriptorKindFilter.class.getFields();
        Intrinsics.f(fields2, "getFields(...)");
        ArrayList arrayList3 = new ArrayList();
        for (Field field3 : fields2) {
            if (Modifier.isStatic(field3.getModifiers())) {
                arrayList3.add(field3);
            }
        }
        ArrayList<Field> arrayList4 = new ArrayList();
        for (Object obj2 : arrayList3) {
            if (Intrinsics.b(((Field) obj2).getType(), Integer.TYPE)) {
                arrayList4.add(obj2);
            }
        }
        ArrayList arrayList5 = new ArrayList();
        for (Field field4 : arrayList4) {
            Object obj3 = field4.get(null);
            Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.Int");
            int iIntValue = ((Integer) obj3).intValue();
            if (iIntValue == ((-iIntValue) & iIntValue)) {
                String name2 = field4.getName();
                Intrinsics.f(name2, "getName(...)");
                maskToName = new Companion.MaskToName(iIntValue, name2);
            } else {
                maskToName = null;
            }
            if (maskToName != null) {
                arrayList5.add(maskToName);
            }
        }
        DEBUG_MASK_BIT_NAMES = arrayList5;
    }

    public DescriptorKindFilter(int i5, List list, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, (i11 & 2) != 0 ? EmptyList.f71733a : list);
    }

    public final boolean acceptsKinds(int i5) {
        return (i5 & this.kindMask) != 0;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!DescriptorKindFilter.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type org.jetbrains.kotlin.resolve.scopes.DescriptorKindFilter");
        DescriptorKindFilter descriptorKindFilter = (DescriptorKindFilter) obj;
        return Intrinsics.b(this.excludes, descriptorKindFilter.excludes) && this.kindMask == descriptorKindFilter.kindMask;
    }

    @NotNull
    public final List<DescriptorKindExclude> getExcludes() {
        return this.excludes;
    }

    public final int getKindMask() {
        return this.kindMask;
    }

    public int hashCode() {
        return (this.excludes.hashCode() * 31) + this.kindMask;
    }

    @Nullable
    public final DescriptorKindFilter restrictedToKindsOrNull(int i5) {
        int i11 = i5 & this.kindMask;
        if (i11 == 0) {
            return null;
        }
        return new DescriptorKindFilter(i11, this.excludes);
    }

    @NotNull
    public String toString() throws IOException {
        Object next;
        Iterator<T> it = DEBUG_PREDEFINED_FILTERS_MASK_NAMES.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (((Companion.MaskToName) next).getMask() == this.kindMask) {
                break;
            }
        }
        Companion.MaskToName maskToName = (Companion.MaskToName) next;
        String name = maskToName != null ? maskToName.getName() : null;
        if (name == null) {
            List<Companion.MaskToName> list = DEBUG_MASK_BIT_NAMES;
            ArrayList arrayList = new ArrayList();
            for (Companion.MaskToName maskToName2 : list) {
                String name2 = acceptsKinds(maskToName2.getMask()) ? maskToName2.getName() : null;
                if (name2 != null) {
                    arrayList.add(name2);
                }
            }
            name = g.f1(arrayList, " | ", null, null, 0, null, 62);
        }
        return c.e(u4.k("DescriptorKindFilter(", name, ", "), this.excludes, ')');
    }

    /* JADX WARN: Multi-variable type inference failed */
    public DescriptorKindFilter(int i5, @NotNull List<? extends DescriptorKindExclude> excludes) {
        Intrinsics.g(excludes, "excludes");
        this.excludes = excludes;
        Iterator it = excludes.iterator();
        while (it.hasNext()) {
            i5 &= ~((DescriptorKindExclude) it.next()).getFullyExcludedDescriptorKinds();
        }
        this.kindMask = i5;
    }
}
