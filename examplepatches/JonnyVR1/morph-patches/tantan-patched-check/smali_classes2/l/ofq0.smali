.class public Ll/ofq0;
.super Ll/c30;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/widget/ActionBarOverlayLayout$d;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ofq0$d;
    }
.end annotation


# static fields
.field public static final F:Landroid/view/animation/Interpolator;

.field public static final G:Landroid/view/animation/Interpolator;


# instance fields
.field public A:Z

.field public B:Z

.field public final C:Ll/jml0;

.field public final D:Ll/jml0;

.field public final E:Ll/lml0;

.field public a:Landroid/content/Context;

.field public b:Landroid/content/Context;

.field public c:Landroid/app/Activity;

.field public d:Landroid/app/Dialog;

.field public e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

.field public f:Landroidx/appcompat/widget/ActionBarContainer;

.field public g:Ll/qid;

.field public h:Landroidx/appcompat/widget/ActionBarContextView;

.field public i:Landroid/view/View;

.field public j:Landroidx/appcompat/widget/ScrollingTabContainerView;

.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public l:I

.field public m:Z

.field public n:Ll/ofq0$d;

.field public o:Ll/o30;

.field public p:Ll/o30$a;

.field public q:Z

.field public r:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/c30$b;",
            ">;"
        }
    .end annotation
.end field

.field public s:Z

.field public t:I

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Ll/iml0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ofq0;->F:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/ofq0;->G:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/c30;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ofq0;->k:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/ofq0;->l:I

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/ofq0;->r:Ljava/util/ArrayList;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Ll/ofq0;->t:I

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Ll/ofq0;->u:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Ll/ofq0;->y:Z

    .line 28
    .line 29
    new-instance v0, Ll/ofq0$a;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/ofq0$a;-><init>(Ll/ofq0;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/ofq0;->C:Ll/jml0;

    .line 35
    .line 36
    new-instance v0, Ll/ofq0$b;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/ofq0$b;-><init>(Ll/ofq0;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/ofq0;->D:Ll/jml0;

    .line 42
    .line 43
    new-instance v0, Ll/ofq0$c;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/ofq0$c;-><init>(Ll/ofq0;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/ofq0;->E:Ll/lml0;

    .line 49
    .line 50
    iput-object p1, p0, Ll/ofq0;->c:Landroid/app/Activity;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ll/ofq0;->R(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    if-nez p2, :cond_0

    .line 64
    .line 65
    const p2, 0x1020002

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Ll/ofq0;->i:Landroid/view/View;

    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public constructor <init>(Landroid/app/Dialog;)V
    .locals 1

    .line 75
    invoke-direct {p0}, Ll/c30;-><init>()V

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/ofq0;->k:Ljava/util/ArrayList;

    const/4 v0, -0x1

    .line 77
    iput v0, p0, Ll/ofq0;->l:I

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/ofq0;->r:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 79
    iput v0, p0, Ll/ofq0;->t:I

    const/4 v0, 0x1

    .line 80
    iput-boolean v0, p0, Ll/ofq0;->u:Z

    .line 81
    iput-boolean v0, p0, Ll/ofq0;->y:Z

    .line 82
    new-instance v0, Ll/ofq0$a;

    invoke-direct {v0, p0}, Ll/ofq0$a;-><init>(Ll/ofq0;)V

    iput-object v0, p0, Ll/ofq0;->C:Ll/jml0;

    .line 83
    new-instance v0, Ll/ofq0$b;

    invoke-direct {v0, p0}, Ll/ofq0$b;-><init>(Ll/ofq0;)V

    iput-object v0, p0, Ll/ofq0;->D:Ll/jml0;

    .line 84
    new-instance v0, Ll/ofq0$c;

    invoke-direct {v0, p0}, Ll/ofq0$c;-><init>(Ll/ofq0;)V

    iput-object v0, p0, Ll/ofq0;->E:Ll/lml0;

    .line 85
    iput-object p1, p0, Ll/ofq0;->d:Landroid/app/Dialog;

    .line 86
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Ll/ofq0;->R(Landroid/view/View;)V

    return-void
.end method

.method public static J(ZZZ)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    if-nez p0, :cond_2

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_1
    return v0

    .line 11
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/kkl0;->q0(Landroid/view/View;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->x(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->q(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ofq0;->A:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ofq0;->z:Ll/iml0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/iml0;->a()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public E(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->v:Z

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/ofq0;->Y(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public H(Ll/o30$a;)Ll/o30;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ofq0;->n:Ll/ofq0$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ofq0$d;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->k()V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/ofq0$d;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, p0, v1, p1}, Ll/ofq0$d;-><init>(Ll/ofq0;Landroid/content/Context;Ll/o30$a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ll/ofq0$d;->r()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iput-object v0, p0, Ll/ofq0;->n:Ll/ofq0$d;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/ofq0$d;->i()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContextView;->h(Ll/o30;)V

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    invoke-virtual {p0, p1}, Ll/ofq0;->I(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 51
    .line 52
    const/16 p1, 0x20

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_1
    const/4 p0, 0x0

    .line 59
    return-object p0
.end method

.method public I(Z)V
    .locals 9

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ofq0;->X()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/ofq0;->Q()V

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Ll/ofq0;->W()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    const/4 v2, 0x4

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 21
    .line 22
    const-wide/16 v4, 0xc8

    .line 23
    .line 24
    const-wide/16 v6, 0x64

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0, v2, v6, v7}, Ll/qid;->s(IJ)Ll/hml0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 33
    .line 34
    invoke-virtual {p0, v3, v4, v5}, Landroidx/appcompat/widget/ActionBarContextView;->f(IJ)Ll/hml0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-interface {v0, v3, v4, v5}, Ll/qid;->s(IJ)Ll/hml0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 44
    .line 45
    invoke-virtual {p0, v1, v6, v7}, Landroidx/appcompat/widget/ActionBarContextView;->f(IJ)Ll/hml0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    move-object v8, p1

    .line 50
    move-object p1, p0

    .line 51
    move-object p0, v8

    .line 52
    :goto_1
    new-instance v0, Ll/iml0;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/iml0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1, p0}, Ll/iml0;->d(Ll/hml0;Ll/hml0;)Ll/iml0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ll/iml0;->h()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    iget-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 65
    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-interface {v0, v2}, Ll/qid;->n(I)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 72
    .line 73
    invoke-virtual {p0, v3}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    invoke-interface {v0, v3}, Ll/qid;->n(I)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ofq0;->p:Ll/o30$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ofq0;->o:Ll/o30;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/o30$a;->d(Ll/o30;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Ll/ofq0;->o:Ll/o30;

    .line 12
    .line 13
    iput-object v0, p0, Ll/ofq0;->p:Ll/o30$a;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public L(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ofq0;->z:Ll/iml0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/iml0;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget v0, p0, Ll/ofq0;->t:I

    .line 9
    .line 10
    if-nez v0, :cond_4

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/ofq0;->A:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    if-eqz p1, :cond_4

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 19
    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarContainer;->setTransitioning(Z)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/iml0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/iml0;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    neg-int v2, v2

    .line 43
    int-to-float v2, v2

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    filled-new-array {p1, p1}, [I

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object v3, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 52
    .line 53
    invoke-virtual {v3, p1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 54
    .line 55
    .line 56
    aget p1, p1, v1

    .line 57
    .line 58
    int-to-float p1, p1

    .line 59
    sub-float/2addr v2, p1

    .line 60
    :cond_2
    iget-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 61
    .line 62
    invoke-static {p1}, Ll/kkl0;->c(Landroid/view/View;)Ll/hml0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1, v2}, Ll/hml0;->l(F)Ll/hml0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object v1, p0, Ll/ofq0;->E:Ll/lml0;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Ll/hml0;->j(Ll/lml0;)Ll/hml0;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ll/iml0;->c(Ll/hml0;)Ll/iml0;

    .line 76
    .line 77
    .line 78
    iget-boolean p1, p0, Ll/ofq0;->u:Z

    .line 79
    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    iget-object p1, p0, Ll/ofq0;->i:Landroid/view/View;

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    invoke-static {p1}, Ll/kkl0;->c(Landroid/view/View;)Ll/hml0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1, v2}, Ll/hml0;->l(F)Ll/hml0;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {v0, p1}, Ll/iml0;->c(Ll/hml0;)Ll/iml0;

    .line 95
    .line 96
    .line 97
    :cond_3
    sget-object p1, Ll/ofq0;->F:Landroid/view/animation/Interpolator;

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Ll/iml0;->f(Landroid/view/animation/Interpolator;)Ll/iml0;

    .line 100
    .line 101
    .line 102
    const-wide/16 v1, 0xfa

    .line 103
    .line 104
    invoke-virtual {v0, v1, v2}, Ll/iml0;->e(J)Ll/iml0;

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/ofq0;->C:Ll/jml0;

    .line 108
    .line 109
    invoke-virtual {v0, p1}, Ll/iml0;->g(Ll/jml0;)Ll/iml0;

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Ll/ofq0;->z:Ll/iml0;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/iml0;->h()V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    iget-object p0, p0, Ll/ofq0;->C:Ll/jml0;

    .line 119
    .line 120
    const/4 p1, 0x0

    .line 121
    invoke-interface {p0, p1}, Ll/jml0;->onAnimationEnd(Landroid/view/View;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public M(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ofq0;->z:Ll/iml0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/iml0;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarContainer;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/ofq0;->t:I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-nez v0, :cond_4

    .line 18
    .line 19
    iget-boolean v0, p0, Ll/ofq0;->A:Z

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    if-eqz p1, :cond_4

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    neg-int v0, v0

    .line 37
    int-to-float v0, v0

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    filled-new-array {v1, v1}, [I

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    aget p1, p1, v1

    .line 51
    .line 52
    int-to-float p1, p1

    .line 53
    sub-float/2addr v0, p1

    .line 54
    :cond_2
    iget-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Ll/iml0;

    .line 60
    .line 61
    invoke-direct {p1}, Ll/iml0;-><init>()V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 65
    .line 66
    invoke-static {v1}, Ll/kkl0;->c(Landroid/view/View;)Ll/hml0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1, v2}, Ll/hml0;->l(F)Ll/hml0;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v3, p0, Ll/ofq0;->E:Ll/lml0;

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Ll/hml0;->j(Ll/lml0;)Ll/hml0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1}, Ll/iml0;->c(Ll/hml0;)Ll/iml0;

    .line 80
    .line 81
    .line 82
    iget-boolean v1, p0, Ll/ofq0;->u:Z

    .line 83
    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    iget-object v1, p0, Ll/ofq0;->i:Landroid/view/View;

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/ofq0;->i:Landroid/view/View;

    .line 94
    .line 95
    invoke-static {v0}, Ll/kkl0;->c(Landroid/view/View;)Ll/hml0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, v2}, Ll/hml0;->l(F)Ll/hml0;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p1, v0}, Ll/iml0;->c(Ll/hml0;)Ll/iml0;

    .line 104
    .line 105
    .line 106
    :cond_3
    sget-object v0, Ll/ofq0;->G:Landroid/view/animation/Interpolator;

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ll/iml0;->f(Landroid/view/animation/Interpolator;)Ll/iml0;

    .line 109
    .line 110
    .line 111
    const-wide/16 v0, 0xfa

    .line 112
    .line 113
    invoke-virtual {p1, v0, v1}, Ll/iml0;->e(J)Ll/iml0;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/ofq0;->D:Ll/jml0;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/iml0;->g(Ll/jml0;)Ll/iml0;

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Ll/ofq0;->z:Ll/iml0;

    .line 122
    .line 123
    invoke-virtual {p1}, Ll/iml0;->h()V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    iget-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 128
    .line 129
    const/high16 v0, 0x3f800000    # 1.0f

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 135
    .line 136
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 137
    .line 138
    .line 139
    iget-boolean p1, p0, Ll/ofq0;->u:Z

    .line 140
    .line 141
    if-eqz p1, :cond_5

    .line 142
    .line 143
    iget-object p1, p0, Ll/ofq0;->i:Landroid/view/View;

    .line 144
    .line 145
    if-eqz p1, :cond_5

    .line 146
    .line 147
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 148
    .line 149
    .line 150
    :cond_5
    iget-object p1, p0, Ll/ofq0;->D:Ll/jml0;

    .line 151
    .line 152
    const/4 v0, 0x0

    .line 153
    invoke-interface {p1, v0}, Ll/jml0;->onAnimationEnd(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    :goto_0
    iget-object p0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 157
    .line 158
    if-eqz p0, :cond_6

    .line 159
    .line 160
    invoke-static {p0}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    :cond_6
    return-void
.end method

.method public final N(Landroid/view/View;)Ll/qid;
    .locals 1

    .line 1
    instance-of p0, p1, Ll/qid;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/qid;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    instance-of p0, p1, Landroidx/appcompat/widget/Toolbar;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getWrapper()Ll/qid;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const-string p1, "null"

    .line 33
    .line 34
    :goto_0
    const-string v0, "Can\'t make a decor toolbar out of "

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0
.end method

.method public O()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->getActionBarHideOffset()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public P()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->x:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->x:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0, v0}, Ll/ofq0;->Y(Z)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public final R(Landroid/view/View;)V
    .locals 5

    .line 1
    sget v0, Ll/xdc0;->q:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setActionBarVisibilityCallback(Landroidx/appcompat/widget/ActionBarOverlayLayout$d;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget v0, Ll/xdc0;->a:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ofq0;->N(Landroid/view/View;)Ll/qid;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 27
    .line 28
    sget v0, Ll/xdc0;->f:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroidx/appcompat/widget/ActionBarContextView;

    .line 35
    .line 36
    iput-object v0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 37
    .line 38
    sget v0, Ll/xdc0;->c:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroidx/appcompat/widget/ActionBarContainer;

    .line 45
    .line 46
    iput-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 47
    .line 48
    iget-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 49
    .line 50
    if-eqz v0, :cond_7

    .line 51
    .line 52
    iget-object v1, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 53
    .line 54
    if-eqz v1, :cond_7

    .line 55
    .line 56
    if-eqz p1, :cond_7

    .line 57
    .line 58
    invoke-interface {v0}, Ll/qid;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 63
    .line 64
    iget-object p1, p0, Ll/ofq0;->g:Ll/qid;

    .line 65
    .line 66
    invoke-interface {p1}, Ll/qid;->o()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    and-int/lit8 p1, p1, 0x4

    .line 71
    .line 72
    const/4 v0, 0x1

    .line 73
    const/4 v1, 0x0

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    move p1, v0

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    move p1, v1

    .line 79
    :goto_0
    if-eqz p1, :cond_2

    .line 80
    .line 81
    iput-boolean v0, p0, Ll/ofq0;->m:Z

    .line 82
    .line 83
    :cond_2
    iget-object v2, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 84
    .line 85
    invoke-static {v2}, Ll/f30;->b(Landroid/content/Context;)Ll/f30;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Ll/f30;->a()Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_4

    .line 94
    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    move p1, v1

    .line 99
    goto :goto_2

    .line 100
    :cond_4
    :goto_1
    move p1, v0

    .line 101
    :goto_2
    invoke-virtual {p0, p1}, Ll/ofq0;->V(Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ll/f30;->g()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-virtual {p0, p1}, Ll/ofq0;->T(Z)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 112
    .line 113
    sget-object v2, Ll/gic0;->a:[I

    .line 114
    .line 115
    sget v3, Ll/s8c0;->c:I

    .line 116
    .line 117
    const/4 v4, 0x0

    .line 118
    invoke-virtual {p1, v4, v2, v3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    sget v2, Ll/gic0;->k:I

    .line 123
    .line 124
    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_5

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Ll/ofq0;->U(Z)V

    .line 131
    .line 132
    .line 133
    :cond_5
    sget v0, Ll/gic0;->i:I

    .line 134
    .line 135
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    int-to-float v0, v0

    .line 142
    invoke-virtual {p0, v0}, Ll/ofq0;->A(F)V

    .line 143
    .line 144
    .line 145
    :cond_6
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p1, " can only be used with a compatible window decor layout"

    .line 158
    .line 159
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public S(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/qid;->o()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    and-int/lit8 v1, p2, 0x4

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Ll/ofq0;->m:Z

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 15
    .line 16
    and-int/2addr p1, p2

    .line 17
    not-int p2, p2

    .line 18
    and-int/2addr p2, v0

    .line 19
    or-int/2addr p1, p2

    .line 20
    invoke-interface {p0, p1}, Ll/qid;->i(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final T(Z)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Ll/ofq0;->s:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/ofq0;->g:Ll/qid;

    .line 7
    .line 8
    invoke-interface {p1, v0}, Ll/qid;->v(Landroidx/appcompat/widget/ScrollingTabContainerView;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 12
    .line 13
    iget-object v0, p0, Ll/ofq0;->j:Landroidx/appcompat/widget/ScrollingTabContainerView;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContainer;->setTabContainer(Landroidx/appcompat/widget/ScrollingTabContainerView;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContainer;->setTabContainer(Landroidx/appcompat/widget/ScrollingTabContainerView;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/ofq0;->g:Ll/qid;

    .line 25
    .line 26
    iget-object v0, p0, Ll/ofq0;->j:Landroidx/appcompat/widget/ScrollingTabContainerView;

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ll/qid;->v(Landroidx/appcompat/widget/ScrollingTabContainerView;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-virtual {p0}, Ll/ofq0;->P()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/4 v0, 0x2

    .line 36
    const/4 v1, 0x1

    .line 37
    const/4 v2, 0x0

    .line 38
    if-ne p1, v0, :cond_1

    .line 39
    .line 40
    move p1, v1

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    move p1, v2

    .line 43
    :goto_1
    iget-object v0, p0, Ll/ofq0;->j:Landroidx/appcompat/widget/ScrollingTabContainerView;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    invoke-static {v0}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_2
    const/16 v3, 0x8

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    :cond_3
    :goto_2
    iget-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 66
    .line 67
    iget-boolean v3, p0, Ll/ofq0;->s:Z

    .line 68
    .line 69
    if-nez v3, :cond_4

    .line 70
    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    move v3, v1

    .line 74
    goto :goto_3

    .line 75
    :cond_4
    move v3, v2

    .line 76
    :goto_3
    invoke-interface {v0, v3}, Ll/qid;->l(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 80
    .line 81
    iget-boolean p0, p0, Ll/ofq0;->s:Z

    .line 82
    .line 83
    if-nez p0, :cond_5

    .line 84
    .line 85
    if-eqz p1, :cond_5

    .line 86
    .line 87
    goto :goto_4

    .line 88
    :cond_5
    move v1, v2

    .line 89
    :goto_4
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHasNonEmbeddedTabs(Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public U(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->q()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll"

    .line 13
    .line 14
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iput-boolean p1, p0, Ll/ofq0;->B:Z

    .line 19
    .line 20
    iget-object p0, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public V(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->u(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final W()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 2
    .line 3
    invoke-static {p0}, Ll/kkl0;->P(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final X()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->x:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->x:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ll/ofq0;->Y(Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public final Y(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->v:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/ofq0;->w:Z

    .line 4
    .line 5
    iget-boolean v2, p0, Ll/ofq0;->x:Z

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/ofq0;->J(ZZZ)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-boolean v1, p0, Ll/ofq0;->y:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/ofq0;->y:Z

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/ofq0;->M(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    if-eqz v1, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ll/ofq0;->y:Z

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/ofq0;->L(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->w:Z

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/ofq0;->Y(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->w:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->w:Z

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/ofq0;->Y(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ofq0;->z:Ll/iml0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/iml0;->a()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/ofq0;->z:Ll/iml0;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ofq0;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/qid;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/qid;->collapseActionView()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public h(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->q:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput-boolean p1, p0, Ll/ofq0;->q:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/ofq0;->r:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Ll/ofq0;->r:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/c30$b;

    .line 24
    .line 25
    invoke-interface {v2, p1}, Ll/c30$b;->onMenuVisibilityChanged(Z)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->o()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 2
    .line 3
    invoke-static {p0}, Ll/kkl0;->t(Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()Landroid/content/Context;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ofq0;->b:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/util/TypedValue;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/s8c0;->h:I

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 20
    .line 21
    .line 22
    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    new-instance v1, Landroid/view/ContextThemeWrapper;

    .line 27
    .line 28
    iget-object v2, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 29
    .line 30
    invoke-direct {v1, v2, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/ofq0;->b:Landroid/content/Context;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object v0, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 37
    .line 38
    iput-object v0, p0, Ll/ofq0;->b:Landroid/content/Context;

    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ofq0;->b:Landroid/content/Context;

    .line 41
    .line 42
    return-object p0
.end method

.method public m()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->v:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->v:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Ll/ofq0;->Y(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public o()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ofq0;->k()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Ll/ofq0;->y:Z

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ofq0;->O()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-ge p0, v0, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public onWindowVisibilityChanged(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ofq0;->t:I

    .line 2
    .line 3
    return-void
.end method

.method public p(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ofq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p1}, Ll/f30;->b(Landroid/content/Context;)Ll/f30;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/f30;->g()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/ofq0;->T(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 1
    iget-object p0, p0, Ll/ofq0;->n:Ll/ofq0$d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/ofq0$d;->c()Landroid/view/Menu;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_3

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v1, -0x1

    .line 21
    :goto_0
    invoke-static {v1}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x1

    .line 30
    if-eq v1, v2, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    move v2, v0

    .line 34
    :goto_1
    invoke-interface {p0, v2}, Landroid/view/Menu;->setQwertyMode(Z)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p0, p1, p2, v0}, Landroid/view/Menu;->performShortcut(ILandroid/view/KeyEvent;I)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_3
    return v0
.end method

.method public u(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContainer;->setPrimaryBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ofq0;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ofq0;->w(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public w(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/ofq0;->S(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x(I)V
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x4

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ofq0;->m:Z

    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ofq0;->g:Ll/qid;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/qid;->i(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public y(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/ofq0;->S(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public z(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move p1, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/ofq0;->S(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
