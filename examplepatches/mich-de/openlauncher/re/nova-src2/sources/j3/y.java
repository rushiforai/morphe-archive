package j3;

import h6.c1;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public abstract class y {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ KProperty[] f68878a;

    static {
        MutablePropertyReference1Impl mutablePropertyReference1Impl = new MutablePropertyReference1Impl(y.class, "stateDescription", "getStateDescription(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Ljava/lang/String;", 1);
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        f68878a = new KProperty[]{reflectionFactory.mutableProperty1(mutablePropertyReference1Impl), c1.v(y.class, "progressBarRangeInfo", "getProgressBarRangeInfo(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/semantics/ProgressBarRangeInfo;", 1, reflectionFactory), c1.v(y.class, "paneTitle", "getPaneTitle(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Ljava/lang/String;", 1, reflectionFactory), c1.v(y.class, "liveRegion", "getLiveRegion(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)I", 1, reflectionFactory), c1.v(y.class, "focused", "getFocused(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "isContainer", "isContainer(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "isTraversalGroup", "isTraversalGroup(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "isSensitiveData", "isSensitiveData(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "contentType", "getContentType(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/autofill/ContentType;", 1, reflectionFactory), c1.v(y.class, "contentDataType", "getContentDataType(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/autofill/ContentDataType;", 1, reflectionFactory), c1.v(y.class, "traversalIndex", "getTraversalIndex(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)F", 1, reflectionFactory), c1.v(y.class, "horizontalScrollAxisRange", "getHorizontalScrollAxisRange(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/semantics/ScrollAxisRange;", 1, reflectionFactory), c1.v(y.class, "verticalScrollAxisRange", "getVerticalScrollAxisRange(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/semantics/ScrollAxisRange;", 1, reflectionFactory), c1.v(y.class, "role", "getRole(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)I", 1, reflectionFactory), c1.v(y.class, "testTag", "getTestTag(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Ljava/lang/String;", 1, reflectionFactory), c1.v(y.class, "textSubstitution", "getTextSubstitution(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/text/AnnotatedString;", 1, reflectionFactory), c1.v(y.class, "isShowingTextSubstitution", "isShowingTextSubstitution(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "inputText", "getInputText(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/text/AnnotatedString;", 1, reflectionFactory), c1.v(y.class, "editableText", "getEditableText(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/text/AnnotatedString;", 1, reflectionFactory), c1.v(y.class, "textSelectionRange", "getTextSelectionRange(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)J", 1, reflectionFactory), c1.v(y.class, "imeAction", "getImeAction(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)I", 1, reflectionFactory), c1.v(y.class, "selected", "getSelected(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "collectionInfo", "getCollectionInfo(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/semantics/CollectionInfo;", 1, reflectionFactory), c1.v(y.class, "collectionItemInfo", "getCollectionItemInfo(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/semantics/CollectionItemInfo;", 1, reflectionFactory), c1.v(y.class, "toggleableState", "getToggleableState(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/state/ToggleableState;", 1, reflectionFactory), c1.v(y.class, "isEditable", "isEditable(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Z", 1, reflectionFactory), c1.v(y.class, "maxTextLength", "getMaxTextLength(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)I", 1, reflectionFactory), c1.v(y.class, "shape", "getShape(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Landroidx/compose/ui/graphics/Shape;", 1, reflectionFactory), c1.v(y.class, "customActions", "getCustomActions(Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;)Ljava/util/List;", 1, reflectionFactory)};
        a0 a0Var = w.f68852a;
        a0 a0Var2 = j.f68788a;
    }

    public static final void a(b0 b0Var) {
        a0 a0Var = w.f68852a;
        ((k) b0Var).f(w.f68860i, Unit.f71706a);
    }

    public static void b(b0 b0Var, Function1 function1) {
        ((k) b0Var).f(j.f68788a, new a(null, function1));
    }

    public static void c(b0 b0Var, Function1 function1) {
        ((k) b0Var).f(j.f68794g, new a(null, function1));
    }

    public static void d(b0 b0Var, Function0 function0) {
        ((k) b0Var).f(j.f68789b, new a(null, function0));
    }

    public static final void e(String str, b0 b0Var) {
        a0 a0Var = w.f68852a;
        ((k) b0Var).f(w.f68852a, ul.b.P(str));
    }

    public static final void f(b0 b0Var, c2.m mVar) {
        a0 a0Var = w.f68866q;
        KProperty kProperty = f68878a[8];
        a0Var.a(b0Var, mVar);
    }

    public static final void g(String str, b0 b0Var) {
        a0 a0Var = w.f68855d;
        KProperty kProperty = f68878a[2];
        a0Var.a(b0Var, str);
    }

    public static void h(b0 b0Var, Function1 function1) {
        ((k) b0Var).f(j.f68795h, new a(null, function1));
    }

    public static final void i(b0 b0Var, g gVar) {
        a0 a0Var = w.f68854c;
        KProperty kProperty = f68878a[1];
        a0Var.a(b0Var, gVar);
    }

    public static final void j(b0 b0Var, int i5) {
        a0 a0Var = w.f68873x;
        KProperty kProperty = f68878a[13];
        a0Var.a(b0Var, new h(i5));
    }

    public static final void k(String str, b0 b0Var) {
        a0 a0Var = w.f68874y;
        KProperty kProperty = f68878a[14];
        a0Var.a(b0Var, str);
    }

    public static final void l(b0 b0Var) {
        a0 a0Var = w.f68864m;
        KProperty kProperty = f68878a[6];
        a0Var.a(b0Var, Boolean.TRUE);
    }
}
