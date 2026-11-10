.class public final Le/K;
.super LD/g;
.source "SourceFile"

# interfaces
.implements Li/e;


# static fields
.field public static final M:Landroid/view/animation/AccelerateInterpolator;

.field public static final N:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final A:Ljava/util/ArrayList;

.field public B:I

.field public C:Z

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Lg/j;

.field public H:Z

.field public I:Z

.field public final J:Le/I;

.field public final K:Le/I;

.field public final L:LC/j;

.field public o:Landroid/content/Context;

.field public p:Landroid/content/Context;

.field public q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

.field public r:Landroidx/appcompat/widget/ActionBarContainer;

.field public s:Li/m0;

.field public t:Landroidx/appcompat/widget/ActionBarContextView;

.field public final u:Landroid/view/View;

.field public v:Z

.field public w:Le/J;

.field public x:Le/J;

.field public y:LG/a;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    sput-object v0, Le/K;->M:Landroid/view/animation/AccelerateInterpolator;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    sput-object v0, Le/K;->N:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/K;->A:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Le/K;->B:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/K;->C:Z

    iput-boolean v0, p0, Le/K;->F:Z

    new-instance v0, Le/I;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Le/I;-><init>(Le/K;I)V

    iput-object v0, p0, Le/K;->J:Le/I;

    new-instance v0, Le/I;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Le/I;-><init>(Le/K;I)V

    iput-object v0, p0, Le/K;->K:Le/I;

    new-instance v0, LC/j;

    const/16 v1, 0xd

    invoke-direct {v0, v1, p0}, LC/j;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Le/K;->L:LC/j;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/K;->X(Landroid/view/View;)V

    if-nez p2, :cond_0

    const p2, 0x1020002

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Le/K;->u:Landroid/view/View;

    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/app/Dialog;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/K;->A:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Le/K;->B:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/K;->C:Z

    iput-boolean v0, p0, Le/K;->F:Z

    new-instance v0, Le/I;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Le/I;-><init>(Le/K;I)V

    iput-object v0, p0, Le/K;->J:Le/I;

    new-instance v0, Le/I;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Le/I;-><init>(Le/K;I)V

    iput-object v0, p0, Le/K;->K:Le/I;

    new-instance v0, LC/j;

    const/16 v1, 0xd

    invoke-direct {v0, v1, p0}, LC/j;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Le/K;->L:LC/j;

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/K;->X(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final V(Z)V
    .locals 9

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-boolean v1, p0, Le/K;->E:Z

    if-nez v1, :cond_3

    const/4 v1, 0x1

    iput-boolean v1, p0, Le/K;->E:Z

    iget-object v2, p0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v2, :cond_0

    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    :cond_0
    invoke-virtual {p0, v0}, Le/K;->a0(Z)V

    goto :goto_0

    :cond_1
    iget-boolean v1, p0, Le/K;->E:Z

    if-eqz v1, :cond_3

    iput-boolean v0, p0, Le/K;->E:Z

    iget-object v1, p0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v1, :cond_2

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    :cond_2
    invoke-virtual {p0, v0}, Le/K;->a0(Z)V

    :cond_3
    :goto_0
    iget-object v1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v1}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x4

    if-eqz v1, :cond_7

    const-wide/16 v4, 0xc8

    const-wide/16 v6, 0x64

    if-eqz p1, :cond_4

    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    iget-object v1, p1, Li/e1;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-static {v1}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ly/Q;->a(F)V

    invoke-virtual {v1, v6, v7}, Ly/Q;->c(J)V

    new-instance v2, Lg/i;

    invoke-direct {v2, p1, v3}, Lg/i;-><init>(Li/e1;I)V

    invoke-virtual {v1, v2}, Ly/Q;->d(Ly/S;)V

    iget-object p1, p0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v0, v4, v5}, Landroidx/appcompat/widget/ActionBarContextView;->i(IJ)Ly/Q;

    move-result-object p1

    goto :goto_1

    :cond_4
    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    iget-object v1, p1, Li/e1;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-static {v1}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object v1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v1, v3}, Ly/Q;->a(F)V

    invoke-virtual {v1, v4, v5}, Ly/Q;->c(J)V

    new-instance v3, Lg/i;

    invoke-direct {v3, p1, v0}, Lg/i;-><init>(Li/e1;I)V

    invoke-virtual {v1, v3}, Ly/Q;->d(Ly/S;)V

    iget-object p1, p0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v2, v6, v7}, Landroidx/appcompat/widget/ActionBarContextView;->i(IJ)Ly/Q;

    move-result-object p1

    move-object v8, v1

    move-object v1, p1

    move-object p1, v8

    :goto_1
    new-instance v0, Lg/j;

    invoke-direct {v0}, Lg/j;-><init>()V

    iget-object v2, v0, Lg/j;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, v1, Ly/Q;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->getDuration()J

    move-result-wide v3

    goto :goto_2

    :cond_5
    const-wide/16 v3, 0x0

    :goto_2
    iget-object v1, p1, Ly/Q;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    :cond_6
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lg/j;->b()V

    return-void

    :cond_7
    if-eqz p1, :cond_8

    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    iget-object p1, p1, Li/e1;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    return-void

    :cond_8
    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    iget-object p1, p1, Li/e1;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    return-void
.end method

.method public final W()Landroid/content/Context;
    .locals 4

    iget-object v0, p0, Le/K;->p:Landroid/content/Context;

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    iget-object v1, p0, Le/K;->o:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x7f03000a

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v0, :cond_0

    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget-object v2, p0, Le/K;->o:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Le/K;->p:Landroid/content/Context;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le/K;->o:Landroid/content/Context;

    iput-object v0, p0, Le/K;->p:Landroid/content/Context;

    :cond_1
    :goto_0
    iget-object v0, p0, Le/K;->p:Landroid/content/Context;

    return-object v0
.end method

.method public final X(Landroid/view/View;)V
    .locals 6

    const v0, 0x7f080059

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iput-object v0, p0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setActionBarVisibilityCallback(Li/e;)V

    :cond_0
    const v0, 0x7f080027

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Li/m0;

    if-eqz v1, :cond_1

    check-cast v0, Li/m0;

    goto :goto_0

    :cond_1
    instance-of v1, v0, Landroidx/appcompat/widget/Toolbar;

    if-eqz v1, :cond_8

    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getWrapper()Li/m0;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Le/K;->s:Li/m0;

    const v0, 0x7f08002f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ActionBarContextView;

    iput-object v0, p0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    const v0, 0x7f080029

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/ActionBarContainer;

    iput-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    iget-object v0, p0, Le/K;->s:Li/m0;

    if-eqz v0, :cond_7

    iget-object v1, p0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v1, :cond_7

    if-eqz p1, :cond_7

    check-cast v0, Li/e1;

    iget-object p1, v0, Li/e1;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Le/K;->o:Landroid/content/Context;

    iget-object v0, p0, Le/K;->s:Li/m0;

    check-cast v0, Li/e1;

    iget v0, v0, Li/e1;->b:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    if-eqz v0, :cond_3

    iput-boolean v1, p0, Le/K;->v:Z

    :cond_3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    const/16 v4, 0xe

    iget-object v0, p0, Le/K;->s:Li/m0;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v0, 0x7f040000

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    invoke-virtual {p0, p1}, Le/K;->Z(Z)V

    iget-object p1, p0, Le/K;->o:Landroid/content/Context;

    sget-object v0, Ld/a;->a:[I

    const v3, 0x7f030005

    const/4 v5, 0x0

    invoke-virtual {p1, v5, v0, v3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v4, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iget-boolean v3, v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;->g:Z

    if-eqz v3, :cond_4

    iput-boolean v1, p0, Le/K;->I:Z

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    goto :goto_2

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :goto_2
    const/16 v0, 0xc

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    if-eqz v0, :cond_6

    int-to-float v0, v0

    iget-object v1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    sget-object v2, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {v1, v0}, Ly/A;->s(Landroid/view/View;F)V

    :cond_6
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-class v0, Le/K;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, " can only be used with a compatible window decor layout"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_9
    const-string v0, "null"

    :goto_3
    const-string v1, "Can\'t make a decor toolbar out of "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final Y(Z)V
    .locals 4

    iget-boolean v0, p0, Le/K;->v:Z

    if-nez v0, :cond_1

    const/4 v0, 0x4

    if-eqz p1, :cond_0

    move p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iget-object v1, p0, Le/K;->s:Li/m0;

    check-cast v1, Li/e1;

    iget v2, v1, Li/e1;->b:I

    const/4 v3, 0x1

    iput-boolean v3, p0, Le/K;->v:Z

    and-int/2addr p1, v0

    and-int/lit8 v0, v2, -0x5

    or-int/2addr p1, v0

    invoke-virtual {v1, p1}, Li/e1;->a(I)V

    :cond_1
    return-void
.end method

.method public final Z(Z)V
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContainer;->setTabContainer(Li/Q0;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContainer;->setTabContainer(Li/Q0;)V

    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    iget-object p1, p0, Le/K;->s:Li/m0;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Le/K;->s:Li/m0;

    check-cast p1, Li/e1;

    iget-object p1, p1, Li/e1;->a:Landroidx/appcompat/widget/Toolbar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setCollapsible(Z)V

    iget-object p1, p0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHasNonEmbeddedTabs(Z)V

    return-void
.end method

.method public final a0(Z)V
    .locals 11

    iget-boolean v0, p0, Le/K;->D:Z

    iget-boolean v1, p0, Le/K;->E:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    move v0, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v2

    :goto_1
    iget-object v1, p0, Le/K;->u:Landroid/view/View;

    const-wide/16 v4, 0xfa

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    iget-object v8, p0, Le/K;->L:LC/j;

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Le/K;->F:Z

    if-nez v0, :cond_1a

    iput-boolean v2, p0, Le/K;->F:Z

    iget-object v0, p0, Le/K;->G:Lg/j;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lg/j;->a()V

    :cond_2
    iget-object v0, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/ActionBarContainer;->setVisibility(I)V

    iget v0, p0, Le/K;->B:I

    iget-object v9, p0, Le/K;->K:Le/I;

    const/4 v10, 0x0

    if-nez v0, :cond_c

    iget-boolean v0, p0, Le/K;->H:Z

    if-nez v0, :cond_3

    if-eqz p1, :cond_c

    :cond_3
    iget-object v0, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0, v10}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    if-eqz p1, :cond_4

    filled-new-array {v3, v3}, [I

    move-result-object p1

    iget-object v3, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v3, p1}, Landroid/view/View;->getLocationInWindow([I)V

    aget p1, p1, v2

    int-to-float p1, p1

    sub-float/2addr v0, p1

    :cond_4
    iget-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    new-instance p1, Lg/j;

    invoke-direct {p1}, Lg/j;-><init>()V

    iget-object v2, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-static {v2}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object v2

    invoke-virtual {v2, v10}, Ly/Q;->e(F)V

    iget-object v3, v2, Ly/Q;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    if-eqz v3, :cond_6

    if-eqz v8, :cond_5

    new-instance v6, Ly/P;

    invoke-direct {v6, v8, v3}, Ly/P;-><init>(LC/j;Landroid/view/View;)V

    :cond_5
    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    :cond_6
    iget-boolean v3, p1, Lg/j;->e:Z

    iget-object v6, p1, Lg/j;->a:Ljava/util/ArrayList;

    if-nez v3, :cond_7

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    iget-boolean v2, p0, Le/K;->C:Z

    if-eqz v2, :cond_8

    if-eqz v1, :cond_8

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    invoke-static {v1}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object v0

    invoke-virtual {v0, v10}, Ly/Q;->e(F)V

    iget-boolean v1, p1, Lg/j;->e:Z

    if-nez v1, :cond_8

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    sget-object v0, Le/K;->N:Landroid/view/animation/DecelerateInterpolator;

    iget-boolean v1, p1, Lg/j;->e:Z

    if-nez v1, :cond_9

    iput-object v0, p1, Lg/j;->c:Landroid/view/animation/BaseInterpolator;

    :cond_9
    if-nez v1, :cond_a

    iput-wide v4, p1, Lg/j;->b:J

    :cond_a
    if-nez v1, :cond_b

    iput-object v9, p1, Lg/j;->d:Lz/i;

    :cond_b
    iput-object p1, p0, Le/K;->G:Lg/j;

    invoke-virtual {p1}, Lg/j;->b()V

    goto :goto_2

    :cond_c
    iget-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v7}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v10}, Landroid/view/View;->setTranslationY(F)V

    iget-boolean p1, p0, Le/K;->C:Z

    if-eqz p1, :cond_d

    if-eqz v1, :cond_d

    invoke-virtual {v1, v10}, Landroid/view/View;->setTranslationY(F)V

    :cond_d
    invoke-virtual {v9}, Le/I;->a()V

    :goto_2
    iget-object p1, p0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz p1, :cond_1a

    sget-object v0, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {p1}, Ly/y;->c(Landroid/view/View;)V

    return-void

    :cond_e
    iget-boolean v0, p0, Le/K;->F:Z

    if-eqz v0, :cond_1a

    iput-boolean v3, p0, Le/K;->F:Z

    iget-object v0, p0, Le/K;->G:Lg/j;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lg/j;->a()V

    :cond_f
    iget v0, p0, Le/K;->B:I

    iget-object v9, p0, Le/K;->J:Le/I;

    if-nez v0, :cond_19

    iget-boolean v0, p0, Le/K;->H:Z

    if-nez v0, :cond_10

    if-eqz p1, :cond_19

    :cond_10
    iget-object v0, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0, v7}, Landroid/view/View;->setAlpha(F)V

    iget-object v0, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/ActionBarContainer;->setTransitioning(Z)V

    new-instance v0, Lg/j;

    invoke-direct {v0}, Lg/j;-><init>()V

    iget-object v7, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v7

    neg-int v7, v7

    int-to-float v7, v7

    if-eqz p1, :cond_11

    filled-new-array {v3, v3}, [I

    move-result-object p1

    iget-object v3, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v3, p1}, Landroid/view/View;->getLocationInWindow([I)V

    aget p1, p1, v2

    int-to-float p1, p1

    sub-float/2addr v7, p1

    :cond_11
    iget-object p1, p0, Le/K;->r:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-static {p1}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object p1

    invoke-virtual {p1, v7}, Ly/Q;->e(F)V

    iget-object v2, p1, Ly/Q;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_13

    if-eqz v8, :cond_12

    new-instance v6, Ly/P;

    invoke-direct {v6, v8, v2}, Ly/P;-><init>(LC/j;Landroid/view/View;)V

    :cond_12
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    :cond_13
    iget-boolean v2, v0, Lg/j;->e:Z

    iget-object v3, v0, Lg/j;->a:Ljava/util/ArrayList;

    if-nez v2, :cond_14

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_14
    iget-boolean p1, p0, Le/K;->C:Z

    if-eqz p1, :cond_15

    if-eqz v1, :cond_15

    invoke-static {v1}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object p1

    invoke-virtual {p1, v7}, Ly/Q;->e(F)V

    iget-boolean v1, v0, Lg/j;->e:Z

    if-nez v1, :cond_15

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_15
    sget-object p1, Le/K;->M:Landroid/view/animation/AccelerateInterpolator;

    iget-boolean v1, v0, Lg/j;->e:Z

    if-nez v1, :cond_16

    iput-object p1, v0, Lg/j;->c:Landroid/view/animation/BaseInterpolator;

    :cond_16
    if-nez v1, :cond_17

    iput-wide v4, v0, Lg/j;->b:J

    :cond_17
    if-nez v1, :cond_18

    iput-object v9, v0, Lg/j;->d:Lz/i;

    :cond_18
    iput-object v0, p0, Le/K;->G:Lg/j;

    invoke-virtual {v0}, Lg/j;->b()V

    return-void

    :cond_19
    invoke-virtual {v9}, Le/I;->a()V

    :cond_1a
    return-void
.end method
