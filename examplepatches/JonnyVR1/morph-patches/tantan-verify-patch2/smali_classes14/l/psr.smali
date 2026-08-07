.class public Ll/psr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grr;


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Landroid/animation/Animator;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/kcg0;

.field public f:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/psr;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/psr;->f:I

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 15
    .line 16
    iput-object p1, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic k(Ll/psr;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/psr;->o()V

    return-void
.end method

.method public static synthetic l(Ll/psr;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/psr;->n(Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    const p0, -0x16300

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public b(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/psr;->c:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object p1, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/psr;->m()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p0, p2, p1, v0}, Ll/psr;->q(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Ljava/util/List;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    const p0, -0x5a6c6

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    const/high16 p0, 0x43240000    # 164.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    const/high16 p0, 0x42780000    # 62.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/nbc0;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/psr;->e:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/psr;->d:Landroid/animation/Animator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Ll/psr;->f:I

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic n(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/psr;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/psr;->d:Landroid/animation/Animator;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final o()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/psr;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v0, p0, Ll/psr;->f:I

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iget-object v1, p0, Ll/psr;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    rem-int/2addr v0, v1

    .line 21
    iput v0, p0, Ll/psr;->f:I

    .line 22
    .line 23
    iget-object v1, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object p0, p0, Ll/psr;->a:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ljava/lang/String;

    .line 32
    .line 33
    const/high16 v0, 0x42140000    # 37.0f

    .line 34
    .line 35
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/high16 v2, 0x42380000    # 46.0f

    .line 40
    .line 41
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const-string v3, "context_square"

    .line 46
    .line 47
    invoke-static {v3, v1, p0, v0, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public p(Lcom/p1/mobile/android/app/Act;)V
    .locals 10

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 5
    .line 6
    iget-object v1, p0, Ll/psr;->a:Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    const/high16 v2, 0x42140000    # 37.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/high16 v3, 0x42380000    # 46.0f

    .line 22
    .line 23
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const-string v4, "context_square"

    .line 28
    .line 29
    invoke-static {v4, v0, v1, v2, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/psr;->d:Landroid/animation/Animator;

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 37
    .line 38
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 39
    .line 40
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x2

    .line 44
    new-array v8, v0, [F

    .line 45
    .line 46
    fill-array-data v8, :array_0

    .line 47
    .line 48
    .line 49
    const-string v2, "alpha"

    .line 50
    .line 51
    const-wide/16 v3, 0x0

    .line 52
    .line 53
    const-wide/16 v5, 0xc8

    .line 54
    .line 55
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 60
    .line 61
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 62
    .line 63
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 64
    .line 65
    .line 66
    new-array v9, v0, [F

    .line 67
    .line 68
    fill-array-data v9, :array_1

    .line 69
    .line 70
    .line 71
    const-string v3, "alpha"

    .line 72
    .line 73
    const-wide/16 v4, 0x0

    .line 74
    .line 75
    const-wide/16 v6, 0xc8

    .line 76
    .line 77
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v2, Ll/nsr;

    .line 82
    .line 83
    invoke-direct {v2, p0}, Ll/nsr;-><init>(Ll/psr;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/16 v2, 0x7d0

    .line 91
    .line 92
    invoke-static {v2}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    filled-new-array {v0, v1, v2}, [Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Ll/psr;->d:Landroid/animation/Animator;

    .line 105
    .line 106
    :cond_1
    const-wide/16 v0, 0x96a

    .line 107
    .line 108
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 109
    .line 110
    const-wide/16 v3, 0x0

    .line 111
    .line 112
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    new-instance v0, Ll/osr;

    .line 133
    .line 134
    invoke-direct {v0, p0}, Ll/osr;-><init>(Ll/psr;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Ll/psr;->e:Ll/kcg0;

    .line 146
    .line 147
    return-void

    .line 148
    nop

    .line 149
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final q(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/psr;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_2

    .line 11
    .line 12
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/psr;->a:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p1, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/psr;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 p2, 0x2

    .line 31
    if-lt p1, p2, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/psr;->c:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/psr;->p(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object p1, p0, Ll/psr;->a:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iget-object p1, p0, Ll/psr;->b:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object p0, p0, Ll/psr;->a:Ljava/util/List;

    .line 50
    .line 51
    const/4 p2, 0x0

    .line 52
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/String;

    .line 57
    .line 58
    const/high16 p2, 0x42140000    # 37.0f

    .line 59
    .line 60
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    const/high16 p3, 0x42380000    # 46.0f

    .line 65
    .line 66
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    const-string v0, "context_square"

    .line 71
    .line 72
    invoke-static {v0, p1, p0, p2, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    return-void
.end method
