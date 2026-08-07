.class public Ll/s9l;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/w9l;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/opf;

.field public b:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s9l;->b:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s9l;->c:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/s9l;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s9l;->r0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f0(Ll/s9l;Lcom/p1/mobile/putong/core/data/Explore;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s9l;->p0(Lcom/p1/mobile/putong/core/data/Explore;)V

    return-void
.end method

.method public static synthetic g0(Ll/s9l;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s9l;->q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/s9l;Lcom/p1/mobile/putong/core/data/Explore;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s9l;->o0(Lcom/p1/mobile/putong/core/data/Explore;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic r0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s9l;->l0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/ner;->lifecycle()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/l9l;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/l9l;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/m9l;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/m9l;-><init>(Ll/s9l;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/n9l;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/n9l;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/s9l;->m0()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/s9l;->n0()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final l0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    iget-object v1, p0, Ll/s9l;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->L3()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/d19;->B3(Ljava/lang/String;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/o9l;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/o9l;-><init>(Ll/s9l;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/p9l;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/p9l;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final m0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    iget-object v1, p0, Ll/s9l;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->L3()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/d19;->R3(Ljava/lang/String;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/q9l;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/q9l;-><init>(Ll/s9l;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/r9l;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/r9l;-><init>(Ll/s9l;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final n0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/qyf;->f()Ll/qyf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object p0, p0, Ll/s9l;->b:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 22
    .line 23
    const/16 v3, 0x1024

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, p0, v3}, Ll/qyf;->e(Lrx/c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/Explore;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/w9l;

    .line 10
    .line 11
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Explore;->can_swiped:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/w9l;->t:Z

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Ll/s9l;->b:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->S4()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/core/data/Explore;)V
    .locals 13

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_3

    .line 19
    .line 20
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/w9l;

    .line 23
    .line 24
    iget-boolean v2, p1, Lcom/p1/mobile/putong/core/data/Explore;->can_swiped:Z

    .line 25
    .line 26
    iput-boolean v2, v1, Ll/w9l;->t:Z

    .line 27
    .line 28
    new-instance v3, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    .line 29
    .line 30
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v7, p1, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v8, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v9, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v10, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v11, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v12, p0, Ll/s9l;->c:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct/range {v3 .. v12}, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    move v11, v2

    .line 55
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-ge v11, v4, :cond_3

    .line 60
    .line 61
    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Lcom/p1/mobile/putong/core/data/CardInfo;

    .line 66
    .line 67
    move-object v9, v3

    .line 68
    new-instance v3, Ll/epf;

    .line 69
    .line 70
    move-object v5, v4

    .line 71
    iget-object v4, v5, Lcom/p1/mobile/putong/core/data/CardInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CardInfo;->tags:Ljava/util/List;

    .line 74
    .line 75
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v7, p1, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v8, p1, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 80
    .line 81
    const/4 v10, 0x0

    .line 82
    invoke-direct/range {v3 .. v10}, Ll/epf;-><init>(Lcom/p1/mobile/putong/data/User;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;)V

    .line 83
    .line 84
    .line 85
    move-object v4, v3

    .line 86
    move-object v3, v9

    .line 87
    iget v5, p1, Lcom/p1/mobile/putong/core/data/Explore;->Remaining_swipes:I

    .line 88
    .line 89
    if-gez v5, :cond_0

    .line 90
    .line 91
    move v5, v2

    .line 92
    :cond_0
    const/4 v6, 0x1

    .line 93
    if-ne v11, v5, :cond_1

    .line 94
    .line 95
    iput-boolean v6, v4, Ll/epf;->h:Z

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    sub-int/2addr v5, v6

    .line 103
    if-ne v11, v5, :cond_2

    .line 104
    .line 105
    iput-boolean v6, v4, Ll/epf;->i:Z

    .line 106
    .line 107
    :cond_2
    :goto_1
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    add-int/lit8 v11, v11, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 118
    .line 119
    if-nez p1, :cond_4

    .line 120
    .line 121
    check-cast p0, Ll/w9l;

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ll/w9l;->v(Ljava/util/List;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_4
    check-cast p0, Ll/w9l;

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/w9l;->y()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/w9l;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/w9l;->y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/w9l;

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/w9l;->t:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method
