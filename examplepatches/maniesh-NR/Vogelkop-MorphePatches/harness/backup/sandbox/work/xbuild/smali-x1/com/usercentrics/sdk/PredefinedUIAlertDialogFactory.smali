.class public final Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0019\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001f\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\'\u0010\u0013\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u00042\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\'\u0010\u0015\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u00042\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\u0017\u0010\u0018\u001a\u00020\u00062\u0006\u0010\u0017\u001a\u00020\u0016H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0017\u0010\u001a\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u0008J\u000f\u0010\u001b\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJG\u0010%\u001a\u00020\t2\u0006\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u00042\u0006\u0010 \u001a\u00020\u000b2\u0008\u0008\u0002\u0010!\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\"\u001a\u00020\u000b2\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u00060#\u00a2\u0006\u0004\u0008%\u0010&J\u001f\u0010)\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000bH\u0000\u00a2\u0006\u0004\u0008\'\u0010(\u00a8\u0006*"
    }
    d2 = {
        "Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;",
        "",
        "<init>",
        "()V",
        "Landroid/view/View;",
        "view",
        "",
        "setLayoutParamsRecursively",
        "(Landroid/view/View;)V",
        "Lbz0;",
        "dialog",
        "",
        "isFullScreen",
        "Landroid/content/DialogInterface$OnShowListener;",
        "onShowListener",
        "(Lbz0;Z)Landroid/content/DialogInterface$OnShowListener;",
        "actualContent",
        "",
        "viewTagTranslatesToGravity",
        "safeAreScreenMode",
        "(Lbz0;Landroid/view/View;I)V",
        "fullScreenMode",
        "Landroid/view/Window;",
        "window",
        "applyEdgeToEdgeUI",
        "(Landroid/view/Window;)V",
        "applySafeInsets",
        "isAndroidPieOrHigher",
        "()Z",
        "Landroid/content/Context;",
        "context",
        "rootView",
        "cancelable",
        "statusBarIsCustomized",
        "fullscreen",
        "Lkotlin/Function0;",
        "onDismissCallback",
        "create",
        "(Landroid/content/Context;Landroid/view/View;ZZZLkotlin/jvm/functions/Function0;)Lbz0;",
        "reapplyContentSizing$usercentrics_ui_release",
        "(Lbz0;Z)V",
        "reapplyContentSizing",
        "usercentrics-ui_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    invoke-direct {v0}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;-><init>()V

    sput-object v0, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lbz0;ZLandroid/content/DialogInterface;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->onShowListener$lambda$5(Lbz0;ZLandroid/content/DialogInterface;)V

    return-void
.end method

.method private final applyEdgeToEdgeUI(Landroid/view/Window;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    new-instance v0, Loji;

    invoke-direct {v0, p0}, Loji;-><init>(Landroid/view/View;)V

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt p0, v1, :cond_15

    new-instance p0, Lj3o;

    invoke-direct {p0, p1, v0}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_24

    :cond_15
    const/16 v1, 0x1e

    if-lt p0, v1, :cond_1f

    new-instance p0, Li3o;

    invoke-direct {p0, p1, v0}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_24

    :cond_1f
    new-instance p0, Lh3o;

    invoke-direct {p0, p1, v0}, Lh3o;-><init>(Landroid/view/Window;Loji;)V

    :goto_24
    const/16 p1, 0x207

    invoke-virtual {p0, p1}, Lw1h;->p(I)V

    invoke-virtual {p0}, Lw1h;->x()V

    return-void
.end method

.method private final applySafeInsets(Landroid/view/View;)V
    .registers 3

    new-instance p0, Lodf;

    const/16 v0, 0x19

    invoke-direct {p0, v0}, Lodf;-><init>(B)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1, p0}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    invoke-virtual {p1}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method

.method private static final applySafeInsets$lambda$10(Landroid/view/View;Lg3o;)Lg3o;
    .registers 8

    const/16 v0, 0x80

    iget-object v1, p1, Lg3o;->a:Ld3o;

    invoke-virtual {v1, v0}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    const/16 v1, 0x207

    iget-object v2, p1, Lg3o;->a:Ld3o;

    invoke-virtual {v2, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    iget v2, v0, Lr9b;->a:I

    iget v3, v1, Lr9b;->a:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, v0, Lr9b;->b:I

    iget v4, v1, Lr9b;->b:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, v0, Lr9b;->c:I

    iget v5, v1, Lr9b;->c:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    iget v0, v0, Lr9b;->d:I

    iget v1, v1, Lr9b;->d:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v2, v3, v4, v0}, Landroid/view/View;->setPadding(IIII)V

    return-object p1
.end method

.method public static synthetic b(Lkotlin/jvm/functions/Function0;Landroid/content/DialogInterface;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->create$lambda$1$lambda$0(Lkotlin/jvm/functions/Function0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(IZLbz0;Landroid/view/View;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->reapplyContentSizing$lambda$6(IZLbz0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic create$default(Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;Landroid/content/Context;Landroid/view/View;ZZZLkotlin/jvm/functions/Function0;ILjava/lang/Object;)Lbz0;
    .registers 10

    and-int/lit8 p8, p7, 0x8

    const/4 v0, 0x0

    if-eqz p8, :cond_6

    move p4, v0

    :cond_6
    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_b

    move p5, v0

    :cond_b
    invoke-virtual/range {p0 .. p6}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->create(Landroid/content/Context;Landroid/view/View;ZZZLkotlin/jvm/functions/Function0;)Lbz0;

    move-result-object p0

    return-object p0
.end method

.method private static final create$lambda$1$lambda$0(Lkotlin/jvm/functions/Function0;Landroid/content/DialogInterface;)V
    .registers 2

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public static synthetic d(Landroid/view/View;Lg3o;)Lg3o;
    .registers 2

    invoke-static {p0, p1}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->applySafeInsets$lambda$10(Landroid/view/View;Lg3o;)Lg3o;

    move-result-object p0

    return-object p0
.end method

.method private final fullScreenMode(Lbz0;Landroid/view/View;I)V
    .registers 5

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_b

    sget-object v0, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    invoke-direct {v0, p1}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->applyEdgeToEdgeUI(Landroid/view/Window;)V

    :cond_b
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0, p2}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->applySafeInsets(Landroid/view/View;)V

    return-void
.end method

.method private final isAndroidPieOrHigher()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method private final onShowListener(Lbz0;Z)Landroid/content/DialogInterface$OnShowListener;
    .registers 3

    new-instance p0, Ljpg;

    invoke-direct {p0, p1, p2}, Ljpg;-><init>(Lbz0;Z)V

    return-object p0
.end method

.method private static final onShowListener$lambda$5(Lbz0;ZLandroid/content/DialogInterface;)V
    .registers 3

    sget-object p2, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    invoke-virtual {p2, p0, p1}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->reapplyContentSizing$usercentrics_ui_release(Lbz0;Z)V

    return-void
.end method

.method private static final reapplyContentSizing$lambda$6(IZLbz0;Landroid/view/View;)V
    .registers 5

    if-nez p0, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    if-eqz p1, :cond_f

    if-eqz v0, :cond_f

    sget-object p1, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    invoke-direct {p1, p2, p3, p0}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->fullScreenMode(Lbz0;Landroid/view/View;I)V

    return-void

    :cond_f
    sget-object p1, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    invoke-direct {p1, p2, p3, p0}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->safeAreScreenMode(Lbz0;Landroid/view/View;I)V

    return-void
.end method

.method private final safeAreScreenMode(Lbz0;Landroid/view/View;I)V
    .registers 6

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-double p0, p0

    const-wide/high16 v0, 0x3ff4000000000000L    # 1.25

    div-double/2addr p0, v0

    double-to-int p0, p0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p1

    if-le p1, p0, :cond_26

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_26
    return-void
.end method

.method private final setLayoutParamsRecursively(Landroid/view/View;)V
    .registers 6

    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/FrameLayout;

    const/4 v2, -0x1

    if-eqz v1, :cond_15

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_21

    :cond_15
    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_21

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_21
    :goto_21
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setFitsSystemWindows(Z)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    const/4 v3, 0x0

    if-eqz v2, :cond_31

    check-cast v1, Landroid/view/View;

    goto :goto_32

    :cond_31
    move-object v1, v3

    :goto_32
    if-eqz v1, :cond_37

    invoke-virtual {v1, v0}, Landroid/view/View;->setFitsSystemWindows(Z)V

    :cond_37
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of v0, p1, Landroid/view/View;

    if-eqz v0, :cond_42

    move-object v3, p1

    check-cast v3, Landroid/view/View;

    :cond_42
    invoke-direct {p0, v3}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->setLayoutParamsRecursively(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final create(Landroid/content/Context;Landroid/view/View;ZZZLkotlin/jvm/functions/Function0;)Lbz0;
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/view/View;",
            "ZZZ",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)",
            "Lbz0;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    if-eqz p5, :cond_6

    const p0, 0x7f1506af

    goto :goto_9

    :cond_6
    const p0, 0x7f1506ae

    :goto_9
    new-instance v0, Laz0;

    invoke-direct {v0, p1, p0}, Laz0;-><init>(Landroid/content/Context;I)V

    iget-object p0, v0, Laz0;->a:Lwy0;

    iput-boolean p3, p0, Lwy0;->k:Z

    new-instance p3, Lk93;

    const/4 v1, 0x1

    invoke-direct {p3, p6, v1}, Lk93;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Lwy0;->m:Lk93;

    invoke-virtual {v0, p2}, Laz0;->setView(Landroid/view/View;)Laz0;

    invoke-virtual {v0}, Laz0;->create()Lbz0;

    move-result-object p0

    sget-object p3, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->INSTANCE:Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;

    invoke-direct {p3, p0, p5}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->onShowListener(Lbz0;Z)Landroid/content/DialogInterface$OnShowListener;

    move-result-object p6

    invoke-virtual {p0, p6}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-static {p1}, Lcs5;->Q(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_33

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    :cond_33
    invoke-direct {p3, p2}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->setLayoutParamsRecursively(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_74

    const/4 p2, -0x1

    invoke-virtual {p1, p2, p2}, Landroid/view/Window;->setLayout(II)V

    new-instance p2, Landroid/graphics/drawable/ColorDrawable;

    const/4 p6, 0x0

    invoke-direct {p2, p6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, p2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/Window;->setDimAmount(F)V

    invoke-static {p1, p6}, Locp;->p(Landroid/view/Window;Z)V

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, p6}, Landroid/view/View;->setFitsSystemWindows(Z)V

    const/16 p2, 0x200

    invoke-virtual {p1, p2}, Landroid/view/Window;->addFlags(I)V

    invoke-direct {p3}, Lcom/usercentrics/sdk/PredefinedUIAlertDialogFactory;->isAndroidPieOrHigher()Z

    move-result p2

    if-eqz p2, :cond_6b

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p2

    iput v1, p2, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {p1, p2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_6b
    if-nez p5, :cond_74

    if-eqz p4, :cond_74

    const/high16 p2, -0x80000000

    invoke-virtual {p1, p2}, Landroid/view/Window;->addFlags(I)V

    :cond_74
    return-object p0
.end method

.method public final reapplyContentSizing$usercentrics_ui_release(Lbz0;Z)V
    .registers 6
    .param p1    # Lbz0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const p0, 0x7f0a0bfe

    invoke-virtual {p1, p0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    goto :goto_12

    :cond_11
    move-object v1, v0

    :goto_12
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_19

    check-cast v1, Ljava/lang/Integer;

    goto :goto_1a

    :cond_19
    move-object v1, v0

    :goto_1a
    if-eqz v1, :cond_21

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_22

    :cond_21
    const/4 v1, -0x1

    :goto_22
    if-ltz v1, :cond_35

    if-eqz p0, :cond_2b

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    :cond_2b
    if-eqz v0, :cond_35

    new-instance p0, Lipg;

    invoke-direct {p0, v1, p2, p1, v0}, Lipg;-><init>(IZLbz0;Landroid/view/View;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_35
    return-void
.end method
