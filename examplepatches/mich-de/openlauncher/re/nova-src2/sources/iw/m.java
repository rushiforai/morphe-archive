package iw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import hv.g3;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public class m {

    @NotNull
    public static final j Companion;

    /* renamed from: c, reason: collision with root package name */
    public static final Object f68136c;

    /* renamed from: d, reason: collision with root package name */
    public static final m f68137d;

    /* renamed from: e, reason: collision with root package name */
    public static final m f68138e;

    /* renamed from: f, reason: collision with root package name */
    public static final m f68139f;

    /* renamed from: g, reason: collision with root package name */
    public static final m f68140g;

    /* renamed from: h, reason: collision with root package name */
    public static final k f68141h;

    /* renamed from: i, reason: collision with root package name */
    public static final l f68142i;

    /* renamed from: j, reason: collision with root package name */
    public static final m f68143j;

    /* renamed from: k, reason: collision with root package name */
    public static final m f68144k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ m[] f68145l;

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ i70.a f68146m;

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f68147a;

    /* renamed from: b, reason: collision with root package name */
    public final int f68148b;

    static {
        IdentifierSpec.Companion.getClass();
        m mVar = new m("AddressLine1", 0, IdentifierSpec.o, 2132019634);
        f68137d = mVar;
        m mVar2 = new m("AddressLine2", 1, IdentifierSpec.f45373p, 2132019636);
        f68138e = mVar2;
        m mVar3 = new m("Locality", 2, IdentifierSpec.f45374q, 2132019644);
        f68139f = mVar3;
        m mVar4 = new m("DependentLocality", 3, IdentifierSpec.f45375r, 2132019644);
        f68140g = mVar4;
        k kVar = new k("PostalCode", 4, IdentifierSpec.f45376s, 2132019666);
        f68141h = kVar;
        l lVar = new l("SortingCode", 5, IdentifierSpec.f45377t, 2132019666);
        f68142i = lVar;
        IdentifierSpec identifierSpec = IdentifierSpec.f45378u;
        n nVar = o.Companion;
        m mVar5 = new m("AdministrativeArea", 6, identifierSpec, 2132019674);
        f68143j = mVar5;
        m mVar6 = new m("Name", 7, IdentifierSpec.f45364e, 2132019652);
        f68144k = mVar6;
        m[] mVarArr = {mVar, mVar2, mVar3, mVar4, kVar, lVar, mVar5, mVar6};
        f68145l = mVarArr;
        f68146m = EnumEntriesKt.a(mVarArr);
        Companion = new j();
        f68136c = LazyKt.b(LazyThreadSafetyMode.f71680b, new g3(11));
    }

    public m(String str, int i5, IdentifierSpec identifierSpec, int i11) {
        this.f68147a = identifierSpec;
        this.f68148b = i11;
    }

    public static m valueOf(String str) {
        return (m) Enum.valueOf(m.class, str);
    }

    public static m[] values() {
        return (m[]) f68145l.clone();
    }

    public int a() {
        return 2;
    }
}
