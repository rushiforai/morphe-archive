package defpackage;

import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a93 implements z83 {
    public static final /* synthetic */ fj6[] Y;
    public final g52 A;
    public final g52 B;
    public final g52 C;
    public final g52 D;
    public final g52 E;
    public final g52 F;
    public final g52 G;
    public final g52 H;
    public final g52 I;
    public final g52 J;
    public final g52 K;
    public final g52 L;
    public final g52 M;
    public final g52 N;
    public final g52 O;
    public final g52 P;
    public final g52 Q;
    public final g52 R;
    public final g52 S;
    public final g52 T;
    public final g52 U;
    public final g52 V;
    public final g52 W;
    public final g52 X;
    public boolean a;
    public final g52 b = new g52(eo1.d, this);
    public final g52 c;
    public final g52 d;
    public final g52 e;
    public final g52 f;
    public final g52 g;
    public final g52 h;
    public final g52 i;
    public final g52 j;
    public final g52 k;
    public final g52 l;
    public final g52 m;
    public final g52 n;
    public final g52 o;
    public final g52 p;
    public final g52 q;
    public final g52 r;
    public final g52 s;
    public final g52 t;
    public final g52 u;
    public final g52 v;
    public final g52 w;
    public final g52 x;
    public final g52 y;
    public final g52 z;

    static {
        c78 c78Var = new c78(a93.class, "classifierNamePolicy", "getClassifierNamePolicy()Lorg/jetbrains/kotlin/renderer/ClassifierNamePolicy;", 0);
        s1b s1bVar = n1b.a;
        Y = new fj6[]{s1bVar.e(c78Var), ka1.h(a93.class, "withDefinedIn", "getWithDefinedIn()Z", 0, s1bVar), ka1.h(a93.class, "withSourceFileForTopLevel", "getWithSourceFileForTopLevel()Z", 0, s1bVar), ka1.h(a93.class, "modifiers", "getModifiers()Ljava/util/Set;", 0, s1bVar), ka1.h(a93.class, "startFromName", "getStartFromName()Z", 0, s1bVar), ka1.h(a93.class, "startFromDeclarationKeyword", "getStartFromDeclarationKeyword()Z", 0, s1bVar), ka1.h(a93.class, "debugMode", "getDebugMode()Z", 0, s1bVar), ka1.h(a93.class, "classWithPrimaryConstructor", "getClassWithPrimaryConstructor()Z", 0, s1bVar), ka1.h(a93.class, "verbose", "getVerbose()Z", 0, s1bVar), ka1.h(a93.class, "unitReturnType", "getUnitReturnType()Z", 0, s1bVar), ka1.h(a93.class, "withoutReturnType", "getWithoutReturnType()Z", 0, s1bVar), ka1.h(a93.class, "enhancedTypes", "getEnhancedTypes()Z", 0, s1bVar), ka1.h(a93.class, "normalizedVisibilities", "getNormalizedVisibilities()Z", 0, s1bVar), ka1.h(a93.class, "renderDefaultVisibility", "getRenderDefaultVisibility()Z", 0, s1bVar), ka1.h(a93.class, "renderDefaultModality", "getRenderDefaultModality()Z", 0, s1bVar), ka1.h(a93.class, "renderConstructorDelegation", "getRenderConstructorDelegation()Z", 0, s1bVar), ka1.h(a93.class, "renderPrimaryConstructorParametersAsProperties", "getRenderPrimaryConstructorParametersAsProperties()Z", 0, s1bVar), ka1.h(a93.class, "actualPropertiesInPrimaryConstructor", "getActualPropertiesInPrimaryConstructor()Z", 0, s1bVar), ka1.h(a93.class, "uninferredTypeParameterAsName", "getUninferredTypeParameterAsName()Z", 0, s1bVar), ka1.h(a93.class, "includePropertyConstant", "getIncludePropertyConstant()Z", 0, s1bVar), ka1.h(a93.class, "propertyConstantRenderer", "getPropertyConstantRenderer()Lkotlin/jvm/functions/Function1;", 0, s1bVar), ka1.h(a93.class, "withoutTypeParameters", "getWithoutTypeParameters()Z", 0, s1bVar), ka1.h(a93.class, "withoutSuperTypes", "getWithoutSuperTypes()Z", 0, s1bVar), ka1.h(a93.class, "typeNormalizer", "getTypeNormalizer()Lkotlin/jvm/functions/Function1;", 0, s1bVar), ka1.h(a93.class, "defaultParameterValueRenderer", "getDefaultParameterValueRenderer()Lkotlin/jvm/functions/Function1;", 0, s1bVar), ka1.h(a93.class, "secondaryConstructorsAsPrimary", "getSecondaryConstructorsAsPrimary()Z", 0, s1bVar), ka1.h(a93.class, "overrideRenderingPolicy", "getOverrideRenderingPolicy()Lorg/jetbrains/kotlin/renderer/OverrideRenderingPolicy;", 0, s1bVar), ka1.h(a93.class, "valueParametersHandler", "getValueParametersHandler()Lorg/jetbrains/kotlin/renderer/DescriptorRenderer$ValueParametersHandler;", 0, s1bVar), ka1.h(a93.class, "textFormat", "getTextFormat()Lorg/jetbrains/kotlin/renderer/RenderingFormat;", 0, s1bVar), ka1.h(a93.class, "parameterNameRenderingPolicy", "getParameterNameRenderingPolicy()Lorg/jetbrains/kotlin/renderer/ParameterNameRenderingPolicy;", 0, s1bVar), ka1.h(a93.class, "receiverAfterName", "getReceiverAfterName()Z", 0, s1bVar), ka1.h(a93.class, "renderCompanionObjectName", "getRenderCompanionObjectName()Z", 0, s1bVar), ka1.h(a93.class, "propertyAccessorRenderingPolicy", "getPropertyAccessorRenderingPolicy()Lorg/jetbrains/kotlin/renderer/PropertyAccessorRenderingPolicy;", 0, s1bVar), ka1.h(a93.class, "renderDefaultAnnotationArguments", "getRenderDefaultAnnotationArguments()Z", 0, s1bVar), ka1.h(a93.class, "eachAnnotationOnNewLine", "getEachAnnotationOnNewLine()Z", 0, s1bVar), ka1.h(a93.class, "excludedAnnotationClasses", "getExcludedAnnotationClasses()Ljava/util/Set;", 0, s1bVar), ka1.h(a93.class, "excludedTypeAnnotationClasses", "getExcludedTypeAnnotationClasses()Ljava/util/Set;", 0, s1bVar), ka1.h(a93.class, "annotationFilter", "getAnnotationFilter()Lkotlin/jvm/functions/Function1;", 0, s1bVar), ka1.h(a93.class, "annotationArgumentsRenderingPolicy", "getAnnotationArgumentsRenderingPolicy()Lorg/jetbrains/kotlin/renderer/AnnotationArgumentsRenderingPolicy;", 0, s1bVar), ka1.h(a93.class, "alwaysRenderModifiers", "getAlwaysRenderModifiers()Z", 0, s1bVar), ka1.h(a93.class, "renderConstructorKeyword", "getRenderConstructorKeyword()Z", 0, s1bVar), ka1.h(a93.class, "renderUnabbreviatedType", "getRenderUnabbreviatedType()Z", 0, s1bVar), ka1.h(a93.class, "renderTypeExpansions", "getRenderTypeExpansions()Z", 0, s1bVar), ka1.h(a93.class, "renderAbbreviatedTypeComments", "getRenderAbbreviatedTypeComments()Z", 0, s1bVar), ka1.h(a93.class, "includeAdditionalModifiers", "getIncludeAdditionalModifiers()Z", 0, s1bVar), ka1.h(a93.class, "parameterNamesInFunctionalTypes", "getParameterNamesInFunctionalTypes()Z", 0, s1bVar), ka1.h(a93.class, "renderFunctionContracts", "getRenderFunctionContracts()Z", 0, s1bVar), ka1.h(a93.class, "presentableUnresolvedTypes", "getPresentableUnresolvedTypes()Z", 0, s1bVar), ka1.h(a93.class, "boldOnlyForNamesInHtml", "getBoldOnlyForNamesInHtml()Z", 0, s1bVar), ka1.h(a93.class, "informativeErrorType", "getInformativeErrorType()Z", 0, s1bVar)};
    }

    public a93() {
        Boolean bool = Boolean.TRUE;
        this.c = new g52(bool, this);
        this.d = new g52(bool, this);
        this.e = new g52(y83.ALL_EXCEPT_ANNOTATIONS, this);
        Boolean bool2 = Boolean.FALSE;
        this.f = new g52(bool2, this);
        this.g = new g52(bool2, this);
        this.h = new g52(bool2, this);
        this.i = new g52(bool2, this);
        this.j = new g52(bool2, this);
        this.k = new g52(bool, this);
        this.l = new g52(bool2, this);
        this.m = new g52(bool2, this);
        this.n = new g52(bool2, this);
        this.o = new g52(bool, this);
        this.p = new g52(bool, this);
        this.q = new g52(bool2, this);
        this.r = new g52(bool2, this);
        this.s = new g52(bool2, this);
        this.t = new g52(bool2, this);
        this.u = new g52(bool2, this);
        this.v = new g52((Object) null, this);
        this.w = new g52(bool2, this);
        this.x = new g52(bool2, this);
        this.y = new g52(xx.x, this);
        this.z = new g52(xx.y, this);
        this.A = new g52(bool, this);
        this.B = new g52(yw8.RENDER_OPEN, this);
        this.C = new g52(r83.a, this);
        this.D = new g52(t4b.PLAIN, this);
        this.E = new g52(c49.ALL, this);
        this.F = new g52(bool2, this);
        this.G = new g52(bool2, this);
        this.H = new g52(p4a.DEBUG, this);
        this.I = new g52(bool2, this);
        this.J = new g52(bool2, this);
        this.K = new g52(ny3.a, this);
        this.L = new g52(g44.a, this);
        this.M = new g52((Object) null, this);
        this.N = new g52(sx.NO_ARGUMENTS, this);
        this.O = new g52(bool2, this);
        this.P = new g52(bool, this);
        this.Q = new g52(bool, this);
        this.R = new g52(bool2, this);
        this.S = new g52(bool2, this);
        this.T = new g52(bool, this);
        this.U = new g52(bool, this);
        this.V = new g52(bool2, this);
        this.W = new g52(bool2, this);
        this.X = new g52(bool, this);
    }

    @Override // defpackage.z83
    public final void a() {
        this.F.a(Y[30], Boolean.TRUE);
    }

    @Override // defpackage.z83
    public final void b() {
        this.h.a(Y[6], Boolean.TRUE);
    }

    @Override // defpackage.z83
    public final void c() {
        this.G.a(Y[31], Boolean.TRUE);
    }

    @Override // defpackage.z83
    public final void d(Set set) {
        set.getClass();
        this.e.a(Y[3], set);
    }

    @Override // defpackage.z83
    public final void e(t4b t4bVar) {
        t4bVar.getClass();
        this.D.a(Y[28], t4bVar);
    }

    @Override // defpackage.z83
    public final void f(LinkedHashSet linkedHashSet) {
        this.L.a(Y[36], linkedHashSet);
    }

    @Override // defpackage.z83
    public final void g() {
        this.w.a(Y[21], Boolean.TRUE);
    }

    @Override // defpackage.z83
    public final void h(c49 c49Var) {
        c49Var.getClass();
        this.E.a(Y[29], c49Var);
    }

    @Override // defpackage.z83
    public final void i(eo1 eo1Var) {
        this.b.a(Y[0], eo1Var);
    }

    @Override // defpackage.z83
    public final void j() {
        this.f.a(Y[4], Boolean.TRUE);
    }

    @Override // defpackage.z83
    public final void k() {
        this.c.a(Y[1], Boolean.FALSE);
    }

    @Override // defpackage.z83
    public final Set l() {
        fj6 fj6Var = Y[36];
        g52 g52Var = this.L;
        g52Var.getClass();
        fj6Var.getClass();
        return (Set) g52Var.a;
    }

    @Override // defpackage.z83
    public final void m() {
        this.x.a(Y[22], Boolean.TRUE);
    }

    public final sx n() {
        fj6 fj6Var = Y[38];
        g52 g52Var = this.N;
        g52Var.getClass();
        fj6Var.getClass();
        return (sx) g52Var.a;
    }

    public final boolean o() {
        fj6 fj6Var = Y[6];
        g52 g52Var = this.h;
        g52Var.getClass();
        fj6Var.getClass();
        return ((Boolean) g52Var.a).booleanValue();
    }
}
