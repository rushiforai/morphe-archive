.class public final Locn;
.super Llim;
.source "SourceFile"


# static fields
.field public static final j:Lk2d;

.field public static final k:Lk2d;

.field public static final l:Lk2d;

.field public static final m:Lk2d;


# instance fields
.field public final a:Lncn;

.field public final b:Lesg;

.field public final c:Lydn;

.field public final d:Lnlk;

.field public final e:Li9c;

.field public final f:Lmcn;

.field public g:I

.field public h:Lk2d;

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lk2d;

    const/4 v1, 0x0

    const/16 v2, 0x6c

    invoke-direct {v0, v1, v2, v1}, Lk2d;-><init>(III)V

    sput-object v0, Locn;->j:Lk2d;

    new-instance v0, Lk2d;

    const/16 v3, 0x40

    const/4 v4, -0x1

    invoke-direct {v0, v3, v2, v4}, Lk2d;-><init>(III)V

    sput-object v0, Locn;->k:Lk2d;

    new-instance v0, Lk2d;

    const/16 v3, 0x85

    invoke-direct {v0, v2, v3, v1}, Lk2d;-><init>(III)V

    sput-object v0, Locn;->l:Lk2d;

    new-instance v0, Lk2d;

    invoke-direct {v0, v3, v3, v1}, Lk2d;-><init>(III)V

    sput-object v0, Locn;->m:Lk2d;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Ltcc;Lydn;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnlk;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lnlk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Locn;->d:Lnlk;

    new-instance v0, Lmcn;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lmcn;-><init>(Locn;B)V

    iput-object v0, p0, Locn;->f:Lmcn;

    iput v1, p0, Locn;->g:I

    new-instance v0, Lncn;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lmcn;

    invoke-direct {v3, p0, v1}, Lmcn;-><init>(Locn;B)V

    invoke-direct {v0, v2, v3}, Lncn;-><init>(Landroid/content/Context;Lmcn;)V

    iput-object v0, p0, Locn;->a:Lncn;

    new-instance v1, Lesg;

    invoke-direct {v1, v0}, Lesg;-><init>(Lncn;)V

    iput-object v1, p0, Locn;->b:Lesg;

    iput-object p3, p0, Locn;->c:Lydn;

    new-instance v1, Li9c;

    invoke-direct {v1, p1, v0}, Li9c;-><init>(Landroid/view/ViewGroup;Lncn;)V

    iput-object v1, p0, Locn;->e:Li9c;

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f13004f

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lu2d;->e(Landroid/content/Context;ILjava/lang/String;)Ln3d;

    move-result-object p1

    new-instance p2, Lhg2;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lhg2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Ln3d;->b(Lj3d;)V

    iget-object p0, p3, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    iget-boolean p1, v1, Li9c;->b:Z

    if-ne p0, p1, :cond_58

    return-void

    :cond_58
    iput-boolean p0, v1, Li9c;->b:Z

    invoke-virtual {v1}, Li9c;->a()V

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 5

    iget-object v0, p0, Locn;->a:Lncn;

    iget-object v0, v0, Lf3d;->a:Lp2d;

    if-eqz v0, :cond_1b

    iget v0, p0, Locn;->g:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_38

    const/4 v1, 0x1

    sget-object v2, Locn;->k:Lk2d;

    sget-object v3, Locn;->j:Lk2d;

    if-eq v0, v1, :cond_26

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1c

    const/4 v1, 0x3

    if-eq v0, v1, :cond_38

    :cond_1b
    return-void

    :cond_1c
    iget-object v0, p0, Locn;->h:Lk2d;

    if-eq v0, v3, :cond_25

    if-eq v0, v2, :cond_25

    invoke-virtual {p0, v3}, Locn;->S(Lk2d;)V

    :cond_25
    return-void

    :cond_26
    iget-object v0, p0, Locn;->h:Lk2d;

    if-ne v0, v2, :cond_30

    sget-object v0, Locn;->l:Lk2d;

    invoke-virtual {p0, v0}, Locn;->S(Lk2d;)V

    return-void

    :cond_30
    if-eq v0, v3, :cond_37

    if-eq v0, v2, :cond_37

    invoke-virtual {p0, v3}, Locn;->S(Lk2d;)V

    :cond_37
    return-void

    :cond_38
    const/4 v0, 0x0

    iput-object v0, p0, Locn;->h:Lk2d;

    return-void
.end method

.method public final S(Lk2d;)V
    .registers 5

    iput-object p1, p0, Locn;->h:Lk2d;

    iget-object v0, p0, Locn;->f:Lmcn;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v1, p0, Locn;->a:Lncn;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    iget-object v2, p0, Locn;->b:Lesg;

    if-nez v1, :cond_39

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p1, Lk2d;->c:I

    const/4 v1, -0x1

    if-eq p0, v1, :cond_2e

    iget-short v1, p1, Lk2d;->b:S

    iget-short p1, p1, Lk2d;->a:S

    sub-int/2addr v1, p1

    add-int/lit8 p0, p0, 0x1

    mul-int/2addr p0, v1

    mul-int/lit16 p0, p0, 0x3e8

    int-to-float p0, p0

    iget-object p1, v2, Lesg;->b:Ljava/lang/Object;

    check-cast p1, Lncn;

    iget-object p1, p1, Lf3d;->a:Lp2d;

    iget p1, p1, Lp2d;->l:F

    div-float/2addr p0, p1

    float-to-int v1, p0

    :cond_2e
    int-to-long p0, v1

    const-wide/16 v1, -0x1

    cmp-long v1, p0, v1

    if-eqz v1, :cond_38

    invoke-static {v0, p0, p1}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_38
    return-void

    :cond_39
    new-instance v0, Lmcn;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lmcn;-><init>(Locn;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p1, Lk2d;->c:I

    iget-short v1, p1, Lk2d;->a:S

    iget-short p1, p1, Lk2d;->b:S

    iput-object v0, v2, Lesg;->c:Ljava/lang/Object;

    iget-object v0, v2, Lesg;->b:Ljava/lang/Object;

    check-cast v0, Lncn;

    invoke-virtual {v0}, Lf3d;->j()V

    iget-object v2, v0, Lf3d;->b:Lp3d;

    invoke-virtual {v2, p0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    invoke-virtual {v0, v1, p1}, Lf3d;->q(II)V

    invoke-virtual {v0}, Lf3d;->k()V

    return-void
.end method

.method public final T()V
    .registers 3

    iget-boolean v0, p0, Locn;->i:Z

    iget-object v1, p0, Locn;->c:Lydn;

    if-eqz v0, :cond_d

    invoke-virtual {v1}, Lydn;->q()I

    move-result v0

    iput v0, p0, Locn;->g:I

    goto :goto_13

    :cond_d
    invoke-virtual {v1}, Lydn;->r()I

    move-result v0

    iput v0, p0, Locn;->g:I

    :goto_13
    invoke-virtual {p0}, Locn;->R()V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 2

    iget-object p1, p0, Locn;->c:Lydn;

    iget-object p0, p0, Locn;->d:Lnlk;

    invoke-virtual {p1, p0}, Lydn;->b(Ltdn;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Locn;->c:Lydn;

    iget-object p0, p0, Locn;->d:Lnlk;

    invoke-virtual {p1, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method
