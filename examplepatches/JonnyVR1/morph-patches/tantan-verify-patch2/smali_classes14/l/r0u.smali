.class public Ll/r0u;
.super Ll/v6u;
.source "SourceFile"


# instance fields
.field public o:Ljava/lang/String;

.field public final p:Ll/ft5;

.field public final q:Ll/kj1;
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
.method public constructor <init>(Ll/kj1;)V
    .locals 1
    .param p1    # Ll/kj1;
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
    iput-object v0, p0, Ll/r0u;->o:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ll/ft5;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/r0u;->p:Ll/ft5;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/r0u;->r:Z

    .line 23
    .line 24
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/r0u;->s:Lrx/subjects/b;

    .line 29
    .line 30
    new-instance v0, Ll/r0u$a;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/r0u$a;-><init>(Ll/r0u;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/r0u;->t:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 36
    .line 37
    iput-object p1, p0, Ll/r0u;->q:Ll/kj1;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ll/kj1;->e(Ll/r0u;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic A0(Ll/r0u;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B0(Ll/r0u;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C0(Ll/r0u;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6u;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static J0()Ll/r0u;
    .locals 2

    .line 1
    new-instance v0, Ll/r0u;

    .line 2
    .line 3
    new-instance v1, Ll/gv80;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/gv80;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/r0u;-><init>(Ll/kj1;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic r0(Ll/r0u;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0u;->H0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s0(Ll/r0u;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0u;->G0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;Lcom/p1/mobile/putong/live/base/util/IntSet;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic u0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v0(Ll/r0u;Lcom/p1/mobile/putong/live/base/util/IntSet;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0u;->F0(Lcom/p1/mobile/putong/live/base/util/IntSet;)V

    return-void
.end method

.method public static synthetic x0(Ll/r0u;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r0u;->I0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic z0(Ll/r0u;)Lrx/subjects/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r0u;->s:Lrx/subjects/b;

    return-object p0
.end method


# virtual methods
.method public D0()Lrx/c;
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
    iget-object p0, p0, Ll/r0u;->s:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public E0(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;Z)V
    .locals 5
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/r0u;->o:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, "-"

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iput-object p2, p0, Ll/r0u;->o:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p2, p0, Ll/r0u;->p:Ll/ft5;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/ft5;->c()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/r0u;->D0()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const-wide/16 v0, 0x12c

    .line 51
    .line 52
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 53
    .line 54
    invoke-virtual {p2, v0, v1, v2}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    new-instance v0, Ll/k0u;

    .line 67
    .line 68
    invoke-direct {v0, p1}, Ll/k0u;-><init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    new-instance v0, Ll/l0u;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/l0u;-><init>(Ll/r0u;)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Ll/m0u;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/m0u;-><init>(Ll/r0u;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->P4()Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-wide/16 v3, 0x1f4

    .line 98
    .line 99
    invoke-virtual {v0, v3, v4, v2}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/n0u;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/n0u;-><init>(Ll/r0u;)V

    .line 114
    .line 115
    .line 116
    new-instance v2, Ll/o0u;

    .line 117
    .line 118
    invoke-direct {v2}, Ll/o0u;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance v1, Ll/p0u;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/p0u;-><init>(Ll/r0u;)V

    .line 136
    .line 137
    .line 138
    new-instance v2, Ll/q0u;

    .line 139
    .line 140
    invoke-direct {v2}, Ll/q0u;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object v1, p0, Ll/r0u;->p:Ll/ft5;

    .line 152
    .line 153
    const/4 v2, 0x3

    .line 154
    new-array v2, v2, [Ll/kcg0;

    .line 155
    .line 156
    const/4 v3, 0x0

    .line 157
    aput-object p2, v2, v3

    .line 158
    .line 159
    const/4 p2, 0x1

    .line 160
    aput-object p1, v2, p2

    .line 161
    .line 162
    const/4 p1, 0x2

    .line 163
    aput-object v0, v2, p1

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Ll/ft5;->b([Ll/kcg0;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/r0u;->K0()V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/live/base/util/IntSet;)V
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
    iget-object p0, p0, Ll/r0u;->q:Ll/kj1;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/kj1;->d(Lcom/p1/mobile/putong/live/base/util/IntSet;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic G0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic H0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/r0u;->K0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/r0u;->L0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->l:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/android/app/c;->n:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/r0u;->i0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public K0()V
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
    iget-object v0, p0, Ll/r0u;->s:Lrx/subjects/b;

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
    new-instance v0, Ll/r0u$b;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/r0u$b;-><init>(Ll/r0u;)V

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

.method public L0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r0u;->q:Ll/kj1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kj1;->h()V

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
    invoke-virtual {p0}, Ll/r0u;->L0()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/r0u;->p:Ll/ft5;

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
    iget-object p0, p0, Ll/r0u;->t:Landroidx/recyclerview/widget/RecyclerView$t;

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
    iget-object p0, p0, Ll/r0u;->t:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
