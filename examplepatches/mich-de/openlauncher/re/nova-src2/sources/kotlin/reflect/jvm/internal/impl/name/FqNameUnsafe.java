package kotlin.reflect.jvm.internal.impl.name;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class FqNameUnsafe {
    private static final Name ROOT_NAME = Name.special("<root>");
    private static final Pattern SPLIT_BY_DOTS = Pattern.compile("\\.");
    private static final Function1<String, Name> STRING_TO_NAME = new Function1<String, Name>() { // from class: kotlin.reflect.jvm.internal.impl.name.FqNameUnsafe.1
        @Override // kotlin.jvm.functions.Function1
        public Name invoke(String str) {
            return Name.guessByFirstCharacter(str);
        }
    };

    @NotNull
    private final String fqName;
    private transient FqNameUnsafe parent;
    private transient FqName safe;
    private transient Name shortName;

    private static /* synthetic */ void $$$reportNull$$$0(int i5) {
        String str;
        int i11;
        switch (i5) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 18:
                str = "@NotNull method %s.%s must not return null";
                break;
            case 9:
            case 15:
            case 16:
            case 17:
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i5) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 18:
                i11 = 2;
                break;
            case 9:
            case 15:
            case 16:
            case 17:
            default:
                i11 = 3;
                break;
        }
        Object[] objArr = new Object[i11];
        if (i5 != 1) {
            switch (i5) {
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 10:
                case 11:
                case 12:
                case 13:
                case 14:
                case 18:
                    objArr[0] = "kotlin/reflect/jvm/internal/impl/name/FqNameUnsafe";
                    break;
                case 9:
                    objArr[0] = PendingUpgradeStore.KEY_NAME;
                    break;
                case 15:
                    objArr[0] = "segment";
                    break;
                case 16:
                    objArr[0] = InneractiveMediationNameConsts.OTHER;
                    break;
                case 17:
                    objArr[0] = "shortName";
                    break;
                default:
                    objArr[0] = "fqName";
                    break;
            }
        } else {
            objArr[0] = "safe";
        }
        switch (i5) {
            case 4:
                objArr[1] = "asString";
                break;
            case 5:
            case 6:
                objArr[1] = "toSafe";
                break;
            case 7:
            case 8:
                objArr[1] = "parent";
                break;
            case 9:
            case 15:
            case 16:
            case 17:
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/name/FqNameUnsafe";
                break;
            case 10:
            case 11:
                objArr[1] = "shortName";
                break;
            case 12:
            case 13:
                objArr[1] = "shortNameOrSpecial";
                break;
            case 14:
                objArr[1] = "pathSegments";
                break;
            case 18:
                objArr[1] = "toString";
                break;
        }
        switch (i5) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 18:
                break;
            case 9:
                objArr[2] = "child";
                break;
            case 15:
            case 16:
                objArr[2] = "startsWith";
                break;
            case 17:
                objArr[2] = "topLevel";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i5) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 18:
                throw new IllegalStateException(str2);
            case 9:
            case 15:
            case 16:
            case 17:
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    public FqNameUnsafe(@NotNull String str, @NotNull FqName fqName) {
        if (str == null) {
            $$$reportNull$$$0(0);
        }
        if (fqName == null) {
            $$$reportNull$$$0(1);
        }
        this.fqName = str;
        this.safe = fqName;
    }

    private void compute() {
        int iLastIndexOf = this.fqName.lastIndexOf(46);
        if (iLastIndexOf >= 0) {
            this.shortName = Name.guessByFirstCharacter(this.fqName.substring(iLastIndexOf + 1));
            this.parent = new FqNameUnsafe(this.fqName.substring(0, iLastIndexOf));
        } else {
            this.shortName = Name.guessByFirstCharacter(this.fqName);
            this.parent = FqName.ROOT.toUnsafe();
        }
    }

    @NotNull
    public static FqNameUnsafe topLevel(@NotNull Name name) {
        if (name == null) {
            $$$reportNull$$$0(17);
        }
        return new FqNameUnsafe(name.asString(), FqName.ROOT.toUnsafe(), name);
    }

    @NotNull
    public String asString() {
        String str = this.fqName;
        if (str == null) {
            $$$reportNull$$$0(4);
        }
        return str;
    }

    @NotNull
    public FqNameUnsafe child(@NotNull Name name) {
        String strAsString;
        if (name == null) {
            $$$reportNull$$$0(9);
        }
        if (isRoot()) {
            strAsString = name.asString();
        } else {
            strAsString = this.fqName + "." + name.asString();
        }
        return new FqNameUnsafe(strAsString, this, name);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof FqNameUnsafe) && this.fqName.equals(((FqNameUnsafe) obj).fqName);
    }

    public int hashCode() {
        return this.fqName.hashCode();
    }

    public boolean isRoot() {
        return this.fqName.isEmpty();
    }

    public boolean isSafe() {
        return this.safe != null || asString().indexOf(60) < 0;
    }

    @NotNull
    public FqNameUnsafe parent() {
        FqNameUnsafe fqNameUnsafe = this.parent;
        if (fqNameUnsafe != null) {
            if (fqNameUnsafe == null) {
                $$$reportNull$$$0(7);
            }
            return fqNameUnsafe;
        }
        if (isRoot()) {
            throw new IllegalStateException("root");
        }
        compute();
        FqNameUnsafe fqNameUnsafe2 = this.parent;
        if (fqNameUnsafe2 == null) {
            $$$reportNull$$$0(8);
        }
        return fqNameUnsafe2;
    }

    @NotNull
    public List<Name> pathSegments() {
        List<Name> list;
        if (isRoot()) {
            list = Collections.EMPTY_LIST;
        } else {
            String[] strArrSplit = SPLIT_BY_DOTS.split(this.fqName);
            Function1<String, Name> transform = STRING_TO_NAME;
            Intrinsics.g(strArrSplit, "<this>");
            Intrinsics.g(transform, "transform");
            ArrayList arrayList = new ArrayList(strArrSplit.length);
            for (String str : strArrSplit) {
                arrayList.add(transform.invoke(str));
            }
            list = arrayList;
        }
        if (list == null) {
            $$$reportNull$$$0(14);
        }
        return list;
    }

    @NotNull
    public Name shortName() {
        Name name = this.shortName;
        if (name != null) {
            if (name == null) {
                $$$reportNull$$$0(10);
            }
            return name;
        }
        if (isRoot()) {
            throw new IllegalStateException("root");
        }
        compute();
        Name name2 = this.shortName;
        if (name2 == null) {
            $$$reportNull$$$0(11);
        }
        return name2;
    }

    @NotNull
    public Name shortNameOrSpecial() {
        if (isRoot()) {
            Name name = ROOT_NAME;
            if (name == null) {
                $$$reportNull$$$0(12);
            }
            return name;
        }
        Name nameShortName = shortName();
        if (nameShortName == null) {
            $$$reportNull$$$0(13);
        }
        return nameShortName;
    }

    public boolean startsWith(@NotNull Name name) {
        if (name == null) {
            $$$reportNull$$$0(15);
        }
        if (isRoot()) {
            return false;
        }
        int iIndexOf = this.fqName.indexOf(46);
        String strAsString = name.asString();
        String str = this.fqName;
        if (iIndexOf == -1) {
            iIndexOf = Math.max(str.length(), strAsString.length());
        }
        return str.regionMatches(0, strAsString, 0, iIndexOf);
    }

    @NotNull
    public FqName toSafe() {
        FqName fqName = this.safe;
        if (fqName != null) {
            if (fqName == null) {
                $$$reportNull$$$0(5);
            }
            return fqName;
        }
        FqName fqName2 = new FqName(this);
        this.safe = fqName2;
        return fqName2;
    }

    @NotNull
    public String toString() {
        String strAsString = isRoot() ? ROOT_NAME.asString() : this.fqName;
        if (strAsString == null) {
            $$$reportNull$$$0(18);
        }
        return strAsString;
    }

    public FqNameUnsafe(@NotNull String str) {
        if (str == null) {
            $$$reportNull$$$0(2);
        }
        this.fqName = str;
    }

    private FqNameUnsafe(@NotNull String str, FqNameUnsafe fqNameUnsafe, Name name) {
        if (str == null) {
            $$$reportNull$$$0(3);
        }
        this.fqName = str;
        this.parent = fqNameUnsafe;
        this.shortName = name;
    }
}
