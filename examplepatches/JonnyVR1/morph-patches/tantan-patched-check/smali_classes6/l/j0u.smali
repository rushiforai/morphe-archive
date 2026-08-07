.class public Ll/j0u;
.super Ll/v6u;
.source "SourceFile"


# instance fields
.field public o:Ljava/lang/String;

.field public final p:Ll/ft5;

.field public final q:Ll/ij1;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public r:Z

.field public final s:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/live/base/util/IntSet;",
            ">;"
        }
    .end annotation
.end field

.field public final t:Landroidx/recyclerview/widget/RecyclerView$t;


# direct methods
.method public constructor <init>(Ll/ij1;)V
    .locals 1
    .param p1    # Ll/ij1;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/v6u;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/j0u;->o:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ll/ft5;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/j0u;->p:Ll/ft5;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/j0u;->r:Z

    .line 23
    .line 24
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/j0u;->s:Lrx/subjects/b;

    .line 29
    .line 30
    new-instance v0, Ll/j0u$a;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/j0u$a;-><init>(Ll/j0u;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/j0u;->t:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 36
    .line 37
    iput-object p1, p0, Ll/j0u;->q:Ll/ij1;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ll/ij1;->e(Ll/j0u;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static H0()Ll/j0u;
    .locals 2

    .line 1
    new-instance v0, Ll/j0u;

    .line 2
    .line 3
    new-instance v1, Ll/dv80;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/dv80;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/j0u;-><init>(Ll/ij1;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic r0(Ll/j0u;ZLcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/j0u;->G0(ZLcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic s0(ZLcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u0(Ll/j0u;Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/j0u;->D0(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic v0(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic x0(Ll/j0u;Lcom/p1/mobile/putong/live/base/util/IntSet;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j0u;->E0(Lcom/p1/mobile/putong/live/base/util/IntSet;)V

    return-void
.end method

.method public static synthetic y0(Ll/j0u;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j0u;->F0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic z0(Ll/j0u;)Lrx/subjects/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j0u;->s:Lrx/subjects/b;

    return-object p0
.end method


# virtual methods
.method public A0(Lrx/c;Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/android/app/Frag;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x1f4

    .line 2
    .line 3
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1, v2}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/i0u;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2, p3}, Ll/i0u;-><init>(Ll/j0u;Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/j0u;->p:Ll/ft5;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public B0()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/util/IntSet;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j0u;->s:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public C0(Lcom/p1/mobile/android/app/Frag;Z)V
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/j0u;->o:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "-"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/j0u;->o:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Ll/j0u;->p:Ll/ft5;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/j0u;->B0()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-wide/16 v1, 0x12c

    .line 51
    .line 52
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/c0u;

    .line 67
    .line 68
    invoke-direct {v1, p1}, Ll/c0u;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/d0u;

    .line 76
    .line 77
    invoke-direct {v1, p2, p1}, Ll/d0u;-><init>(ZLcom/p1/mobile/android/app/Frag;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/e0u;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/e0u;-><init>(Ll/j0u;)V

    .line 87
    .line 88
    .line 89
    new-instance v2, Ll/f0u;

    .line 90
    .line 91
    invoke-direct {v2, p0}, Ll/f0u;-><init>(Ll/j0u;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const/4 v2, 0x1

    .line 107
    invoke-virtual {v1, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    new-instance v3, Ll/g0u;

    .line 112
    .line 113
    invoke-direct {v3, p0, p2, p1}, Ll/g0u;-><init>(Ll/j0u;ZLcom/p1/mobile/android/app/Frag;)V

    .line 114
    .line 115
    .line 116
    new-instance p1, Ll/h0u;

    .line 117
    .line 118
    invoke-direct {p1}, Ll/h0u;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {v3, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {v1, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iget-object p2, p0, Ll/j0u;->p:Ll/ft5;

    .line 130
    .line 131
    const/4 v1, 0x2

    .line 132
    new-array v1, v1, [Ll/kcg0;

    .line 133
    .line 134
    const/4 v3, 0x0

    .line 135
    aput-object v0, v1, v3

    .line 136
    .line 137
    aput-object p1, v1, v2

    .line 138
    .line 139
    invoke-virtual {p2, v1}, Ll/ft5;->b([Ll/kcg0;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    xor-int/lit8 p2, p2, 0x1

    .line 6
    .line 7
    iput-boolean p2, p0, Ll/j0u;->r:Z

    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/j0u;->K0()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/live/base/util/IntSet;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/j0u;->r:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object p0, p0, Ll/j0u;->q:Ll/ij1;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ij1;->d(Lcom/p1/mobile/putong/live/base/util/IntSet;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic F0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic G0(ZLcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 18
    .line 19
    .line 20
    :cond_1
    sget-object p1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/j0u;->K0()V

    .line 29
    .line 30
    .line 31
    :cond_2
    sget-object p1, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_4

    .line 38
    .line 39
    sget-object p1, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 40
    .line 41
    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/android/app/c;->n:Lcom/p1/mobile/android/app/c;

    .line 48
    .line 49
    invoke-virtual {p1, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    return-void

    .line 57
    :cond_4
    :goto_0
    invoke-virtual {p0}, Ll/j0u;->i0()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public I0()V
    .locals 2
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/j0u;->s:Lrx/subjects/b;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/util/IntSet;->emptySet()Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/j0u$b;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/j0u$b;-><init>(Ll/j0u;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public J0(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/d3q<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j0u;->q:Ll/ij1;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ij1;->d:Ll/y20;

    .line 4
    .line 5
    return-void
.end method

.method public K0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j0u;->q:Ll/ij1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ij1;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v6u;->i0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/j0u;->K0()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/j0u;->p:Ll/ft5;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/v6u;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/j0u;->t:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/v6u;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/j0u;->t:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
