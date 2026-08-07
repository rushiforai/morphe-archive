.class public Ll/ahe0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Lv/TickerView;

.field public h:Z

.field public i:Landroid/animation/Animator;

.field public j:Landroid/animation/Animator;

.field public k:Ll/jxd0;

.field public l:I


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lv/TickerView;)V
    .locals 3
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Lv/TickerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "see_entry_anim_first_show_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/ahe0;->k:Ll/jxd0;

    .line 34
    .line 35
    const/16 v0, 0x63

    .line 36
    .line 37
    iput v0, p0, Ll/ahe0;->l:I

    .line 38
    .line 39
    iput-object p1, p0, Ll/ahe0;->a:Landroid/view/View;

    .line 40
    .line 41
    iput-object p2, p0, Ll/ahe0;->b:Landroid/view/View;

    .line 42
    .line 43
    iput-object p3, p0, Ll/ahe0;->c:Landroid/view/View;

    .line 44
    .line 45
    iput-object p4, p0, Ll/ahe0;->d:Landroid/view/View;

    .line 46
    .line 47
    iput-object p5, p0, Ll/ahe0;->e:Landroid/view/View;

    .line 48
    .line 49
    iput-object p6, p0, Ll/ahe0;->f:Landroid/view/View;

    .line 50
    .line 51
    iput-object p7, p0, Ll/ahe0;->g:Lv/TickerView;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic b(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->u()V

    return-void
.end method

.method public static synthetic c(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->v()V

    return-void
.end method

.method public static synthetic d(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->y()V

    return-void
.end method

.method public static synthetic e(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->A()V

    return-void
.end method

.method public static synthetic f(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->B()V

    return-void
.end method

.method public static synthetic g(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->w()V

    return-void
.end method

.method public static synthetic h(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->x()V

    return-void
.end method

.method public static synthetic i(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->C()V

    return-void
.end method

.method public static synthetic j(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic k(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->s()V

    return-void
.end method

.method public static synthetic l(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->z()V

    return-void
.end method

.method public static synthetic m(Ll/ahe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->t()V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->d:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->d:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ahe0;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public final D(Landroid/view/View;)V
    .locals 0

    .line 1
    const/high16 p0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    const/16 p0, 0x8

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public E(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahe0;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ahe0;->I()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/ahe0;->h:Z

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/ahe0;->H(II)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/ahe0;->k:Ll/jxd0;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/ahe0;->k:Ll/jxd0;

    .line 31
    .line 32
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final F()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ahe0;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ahe0;->d:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {v0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ahe0;->e:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {v0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ahe0;->f:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {v0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ahe0;->c:Landroid/view/View;

    .line 22
    .line 23
    const-wide/16 v1, 0x190

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1, v2}, Ll/ahe0;->n(Landroid/view/View;J)Landroid/animation/Animator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/rge0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/rge0;-><init>(Ll/ahe0;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/sge0;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/sge0;-><init>(Ll/ahe0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/ahe0;->d:Landroid/view/View;

    .line 44
    .line 45
    const-wide/16 v2, 0x320

    .line 46
    .line 47
    invoke-virtual {p0, v1, v2, v3}, Ll/ahe0;->o(Landroid/view/View;J)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    new-instance v2, Ll/tge0;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/tge0;-><init>(Ll/ahe0;)V

    .line 54
    .line 55
    .line 56
    new-instance v3, Ll/uge0;

    .line 57
    .line 58
    invoke-direct {v3, p0}, Ll/uge0;-><init>(Ll/ahe0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2, v3}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Ll/ahe0;->e:Landroid/view/View;

    .line 66
    .line 67
    const-wide/16 v3, 0x4b0

    .line 68
    .line 69
    invoke-virtual {p0, v2, v3, v4}, Ll/ahe0;->n(Landroid/view/View;J)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    new-instance v3, Ll/vge0;

    .line 74
    .line 75
    invoke-direct {v3, p0}, Ll/vge0;-><init>(Ll/ahe0;)V

    .line 76
    .line 77
    .line 78
    new-instance v4, Ll/wge0;

    .line 79
    .line 80
    invoke-direct {v4, p0}, Ll/wge0;-><init>(Ll/ahe0;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2, v3, v4}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iget-object v3, p0, Ll/ahe0;->f:Landroid/view/View;

    .line 88
    .line 89
    const-wide/16 v4, 0x640

    .line 90
    .line 91
    invoke-virtual {p0, v3, v4, v5}, Ll/ahe0;->o(Landroid/view/View;J)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    new-instance v4, Ll/xge0;

    .line 96
    .line 97
    invoke-direct {v4, p0}, Ll/xge0;-><init>(Ll/ahe0;)V

    .line 98
    .line 99
    .line 100
    new-instance v5, Ll/yge0;

    .line 101
    .line 102
    invoke-direct {v5, p0}, Ll/yge0;-><init>(Ll/ahe0;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v3, v4, v5}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    filled-new-array {v0, v1, v2, v3}, [Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/zge0;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/zge0;-><init>(Ll/ahe0;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Ll/ahe0;->i:Landroid/animation/Animator;

    .line 127
    .line 128
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final G(II)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ahe0;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ahe0;->b:Landroid/view/View;

    .line 8
    .line 9
    sget v2, Ll/dbc0;->Nu:I

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ahe0;->a:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 21
    .line 22
    .line 23
    sub-int p1, p2, p1

    .line 24
    .line 25
    const/16 v0, 0x320

    .line 26
    .line 27
    div-int/2addr v0, p1

    .line 28
    const/16 v1, 0x10

    .line 29
    .line 30
    if-le v0, v1, :cond_0

    .line 31
    .line 32
    const/16 v2, 0x2d0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 v2, 0x438

    .line 36
    .line 37
    :goto_0
    if-le v0, v1, :cond_1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_1
    mul-int/2addr v0, p1

    .line 42
    add-int/lit16 v0, v0, 0x7d0

    .line 43
    .line 44
    int-to-long v4, v0

    .line 45
    int-to-long v6, v2

    .line 46
    move-object v3, p0

    .line 47
    move v8, p2

    .line 48
    invoke-virtual/range {v3 .. v8}, Ll/ahe0;->q(JJI)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v3, v4, v5}, Ll/ahe0;->p(J)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/nge0;

    .line 65
    .line 66
    invoke-direct {p1, v3}, Ll/nge0;-><init>(Ll/ahe0;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-object p0, v3, Ll/ahe0;->j:Landroid/animation/Animator;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final H(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ahe0;->k:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    :goto_0
    iget p1, p0, Ll/ahe0;->l:I

    .line 22
    .line 23
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/16 v0, 0x63

    .line 28
    .line 29
    if-lt v1, v0, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/ahe0;->g:Lv/TickerView;

    .line 32
    .line 33
    const-string p2, "99+"

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Lv/TickerView;->n(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ahe0;->F()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0, v1, p1}, Ll/ahe0;->G(II)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ahe0;->g:Lv/TickerView;

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    invoke-virtual {p0, v1, p2, p1, p1}, Lv/TickerView;->m(IILl/x20;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ahe0;->h:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ahe0;->i:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/ahe0;->i:Landroid/animation/Animator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/ahe0;->i:Landroid/animation/Animator;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/ahe0;->j:Landroid/animation/Animator;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/ahe0;->j:Landroid/animation/Animator;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/ahe0;->j:Landroid/animation/Animator;

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final n(Landroid/view/View;J)Landroid/animation/Animator;
    .locals 23

    .line 1
    const/high16 v0, 0x40e00000    # 7.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    neg-int v1, v1

    .line 8
    int-to-float v1, v1

    .line 9
    const/high16 v2, 0x41280000    # 10.5f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    neg-int v2, v2

    .line 16
    int-to-float v2, v2

    .line 17
    const v3, 0x4111999a    # 9.1f

    .line 18
    .line 19
    .line 20
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    neg-int v3, v3

    .line 25
    int-to-float v3, v3

    .line 26
    const v4, 0x40b33333    # 5.6f

    .line 27
    .line 28
    .line 29
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    neg-int v4, v4

    .line 34
    int-to-float v4, v4

    .line 35
    const/4 v5, 0x5

    .line 36
    new-array v13, v5, [F

    .line 37
    .line 38
    const/4 v14, 0x0

    .line 39
    const/4 v15, 0x0

    .line 40
    aput v15, v13, v14

    .line 41
    .line 42
    const/16 v16, 0x1

    .line 43
    .line 44
    aput v1, v13, v16

    .line 45
    .line 46
    const/4 v1, 0x2

    .line 47
    aput v2, v13, v1

    .line 48
    .line 49
    const/4 v2, 0x3

    .line 50
    aput v3, v13, v2

    .line 51
    .line 52
    const/4 v3, 0x4

    .line 53
    aput v4, v13, v3

    .line 54
    .line 55
    const-string v7, "translationX"

    .line 56
    .line 57
    const-wide/16 v10, 0x640

    .line 58
    .line 59
    const/4 v12, 0x0

    .line 60
    move-object/from16 v6, p1

    .line 61
    .line 62
    move-wide/from16 v8, p2

    .line 63
    .line 64
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v17

    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    neg-int v0, v0

    .line 73
    int-to-float v0, v0

    .line 74
    const/high16 v4, 0x41600000    # 14.0f

    .line 75
    .line 76
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    neg-int v4, v4

    .line 81
    int-to-float v4, v4

    .line 82
    const/high16 v6, 0x41a80000    # 21.0f

    .line 83
    .line 84
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    neg-int v6, v6

    .line 89
    int-to-float v6, v6

    .line 90
    const/high16 v7, 0x41e00000    # 28.0f

    .line 91
    .line 92
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    neg-int v7, v7

    .line 97
    int-to-float v7, v7

    .line 98
    new-array v13, v5, [F

    .line 99
    .line 100
    aput v15, v13, v14

    .line 101
    .line 102
    aput v0, v13, v16

    .line 103
    .line 104
    aput v4, v13, v1

    .line 105
    .line 106
    aput v6, v13, v2

    .line 107
    .line 108
    aput v7, v13, v3

    .line 109
    .line 110
    const-string v7, "translationY"

    .line 111
    .line 112
    move-object/from16 v6, p1

    .line 113
    .line 114
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    move-result-object v18

    .line 118
    const-wide/16 v0, 0x190

    .line 119
    .line 120
    add-long v8, p2, v0

    .line 121
    .line 122
    new-array v13, v2, [F

    .line 123
    .line 124
    fill-array-data v13, :array_0

    .line 125
    .line 126
    .line 127
    const-string v7, "scaleX"

    .line 128
    .line 129
    const-wide/16 v10, 0x4b0

    .line 130
    .line 131
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 132
    .line 133
    .line 134
    move-result-object v19

    .line 135
    new-array v13, v2, [F

    .line 136
    .line 137
    fill-array-data v13, :array_1

    .line 138
    .line 139
    .line 140
    const-string v7, "scaleY"

    .line 141
    .line 142
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 143
    .line 144
    .line 145
    move-result-object v20

    .line 146
    new-array v13, v5, [F

    .line 147
    .line 148
    fill-array-data v13, :array_2

    .line 149
    .line 150
    .line 151
    const-string v7, "alpha"

    .line 152
    .line 153
    const-wide/16 v10, 0x640

    .line 154
    .line 155
    move-wide/from16 v8, p2

    .line 156
    .line 157
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 158
    .line 159
    .line 160
    move-result-object v21

    .line 161
    new-array v13, v5, [F

    .line 162
    .line 163
    fill-array-data v13, :array_3

    .line 164
    .line 165
    .line 166
    const-string v7, "rotation"

    .line 167
    .line 168
    invoke-static/range {v6 .. v13}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 169
    .line 170
    .line 171
    move-result-object v22

    .line 172
    filled-new-array/range {v17 .. v22}, [Landroid/animation/Animator;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    new-instance v1, Ll/oge0;

    .line 181
    .line 182
    invoke-direct {v1, v6}, Ll/oge0;-><init>(Landroid/view/View;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    return-object v0

    .line 190
    nop

    .line 191
    :array_0
    .array-data 4
        0x3f000000    # 0.5f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x3f4ccccd    # 0.8f
        0x3f800000    # 1.0f
    .end array-data

    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
        0x0
    .end array-data

    .line 212
    .line 213
    :array_3
    .array-data 4
        0x0
        -0x3e100000    # -30.0f
        -0x3e900000    # -15.0f
        -0x3f600000    # -5.0f
        0x0
    .end array-data
.end method

.method public final o(Landroid/view/View;J)Landroid/animation/Animator;
    .locals 22

    .line 1
    const/high16 v0, 0x40e00000    # 7.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x41280000    # 10.5f

    .line 9
    .line 10
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    int-to-float v2, v2

    .line 15
    const v3, 0x4111999a    # 9.1f

    .line 16
    .line 17
    .line 18
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    int-to-float v3, v3

    .line 23
    const/4 v4, 0x4

    .line 24
    new-array v12, v4, [F

    .line 25
    .line 26
    const/4 v13, 0x0

    .line 27
    const/4 v14, 0x0

    .line 28
    aput v14, v12, v13

    .line 29
    .line 30
    const/4 v15, 0x1

    .line 31
    aput v1, v12, v15

    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    aput v2, v12, v1

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    aput v3, v12, v2

    .line 38
    .line 39
    const-string v6, "translationX"

    .line 40
    .line 41
    const-wide/16 v9, 0x4b0

    .line 42
    .line 43
    const/4 v11, 0x0

    .line 44
    move-object/from16 v5, p1

    .line 45
    .line 46
    move-wide/from16 v7, p2

    .line 47
    .line 48
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object v16

    .line 52
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    neg-int v0, v0

    .line 57
    int-to-float v0, v0

    .line 58
    const/high16 v3, 0x41600000    # 14.0f

    .line 59
    .line 60
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    neg-int v3, v3

    .line 65
    int-to-float v3, v3

    .line 66
    const/high16 v5, 0x41a80000    # 21.0f

    .line 67
    .line 68
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    neg-int v5, v5

    .line 73
    int-to-float v5, v5

    .line 74
    new-array v12, v4, [F

    .line 75
    .line 76
    aput v14, v12, v13

    .line 77
    .line 78
    aput v0, v12, v15

    .line 79
    .line 80
    aput v3, v12, v1

    .line 81
    .line 82
    aput v5, v12, v2

    .line 83
    .line 84
    const-string v6, "translationY"

    .line 85
    .line 86
    move-object/from16 v5, p1

    .line 87
    .line 88
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v17

    .line 92
    const-wide/16 v2, 0x320

    .line 93
    .line 94
    add-long v7, p2, v2

    .line 95
    .line 96
    new-array v12, v1, [F

    .line 97
    .line 98
    fill-array-data v12, :array_0

    .line 99
    .line 100
    .line 101
    const-string v6, "scaleX"

    .line 102
    .line 103
    const-wide/16 v9, 0x190

    .line 104
    .line 105
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    move-result-object v18

    .line 109
    new-array v12, v1, [F

    .line 110
    .line 111
    fill-array-data v12, :array_1

    .line 112
    .line 113
    .line 114
    const-string v6, "scaleY"

    .line 115
    .line 116
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object v19

    .line 120
    new-array v12, v4, [F

    .line 121
    .line 122
    fill-array-data v12, :array_2

    .line 123
    .line 124
    .line 125
    const-string v6, "alpha"

    .line 126
    .line 127
    const-wide/16 v9, 0x4b0

    .line 128
    .line 129
    move-wide/from16 v7, p2

    .line 130
    .line 131
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 132
    .line 133
    .line 134
    move-result-object v20

    .line 135
    new-array v12, v1, [F

    .line 136
    .line 137
    fill-array-data v12, :array_3

    .line 138
    .line 139
    .line 140
    const-string v6, "rotation"

    .line 141
    .line 142
    invoke-static/range {v5 .. v12}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 143
    .line 144
    .line 145
    move-result-object v21

    .line 146
    filled-new-array/range {v16 .. v21}, [Landroid/animation/Animator;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    new-instance v1, Ll/pge0;

    .line 155
    .line 156
    invoke-direct {v1, v5}, Ll/pge0;-><init>(Landroid/view/View;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    return-object v0

    .line 164
    nop

    .line 165
    :array_0
    .array-data 4
        0x3f000000    # 0.5f
        0x3f4ccccd    # 0.8f
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_1
    .array-data 4
        0x3f000000    # 0.5f
        0x3f4ccccd    # 0.8f
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f000000    # 0.5f
        0x0
    .end array-data

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :array_3
    .array-data 4
        0x0
        0x41f00000    # 30.0f
    .end array-data
.end method

.method public final p(J)Landroid/animation/Animator;
    .locals 8

    .line 1
    iget-object p0, p0, Ll/ahe0;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    const/16 v1, 0xff

    .line 9
    .line 10
    filled-new-array {v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "alpha"

    .line 15
    .line 16
    invoke-static {p0, v1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-wide/16 v0, 0x1f4

    .line 21
    .line 22
    sub-long v4, p1, v0

    .line 23
    .line 24
    const-wide/16 v6, 0x1f4

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-static/range {v2 .. v7}, Ll/gt0;->k(Landroid/animation/Animator;Landroid/view/animation/Interpolator;JJ)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final q(JJI)Landroid/animation/Animator;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ahe0;->b:Landroid/view/View;

    .line 2
    .line 3
    long-to-float p3, p3

    .line 4
    const/4 p4, 0x2

    .line 5
    new-array v7, p4, [F

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    const/4 p5, 0x0

    .line 9
    aput p4, v7, p5

    .line 10
    .line 11
    const/4 p4, 0x1

    .line 12
    aput p3, v7, p4

    .line 13
    .line 14
    const-string v1, "rotation"

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    move-wide v4, p1

    .line 20
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/qge0;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/qge0;-><init>(Ll/ahe0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ahe0;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ahe0;->b:Landroid/view/View;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->e:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->e:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ahe0;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ahe0;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ahe0;->D(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
