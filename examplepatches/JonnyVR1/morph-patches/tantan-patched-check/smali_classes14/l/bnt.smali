.class public Ll/bnt;
.super Ll/klt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/klt<",
        "Ll/ent;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/imt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/klt;-><init>(Ll/ner;Ll/imt;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H2(Ll/bnt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bnt;->P2(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V

    return-void
.end method

.method public static synthetic I2(Ll/bnt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bnt;->M2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic K2(Ll/bnt;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bnt;->Q2(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic L2(Ll/bnt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bnt;->N2(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic M2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ent;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ent;->j(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic N2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ent;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ent;->k(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic P2(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    move v2, v1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move v2, v0

    .line 8
    :goto_0
    if-nez v2, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    move p1, v1

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    move p1, v0

    .line 19
    :goto_1
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v3, Ll/ent;

    .line 22
    .line 23
    iget-object v3, v3, Ll/ent;->j:Lv/VSearchBar;

    .line 24
    .line 25
    invoke-virtual {v3}, Lv/VSearchBar;->getInput()Landroid/text/Editable;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz v3, :cond_3

    .line 30
    .line 31
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v3, Ll/ent;

    .line 34
    .line 35
    iget-object v3, v3, Ll/ent;->j:Lv/VSearchBar;

    .line 36
    .line 37
    invoke-virtual {v3}, Lv/VSearchBar;->getInput()Landroid/text/Editable;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_2

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_2
    move v3, v0

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    :goto_2
    move v3, v1

    .line 55
    :goto_3
    iget-object v4, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast v4, Ll/ent;

    .line 58
    .line 59
    iget-object v4, v4, Ll/ent;->k:Lv/VRecyclerView;

    .line 60
    .line 61
    if-nez v3, :cond_4

    .line 62
    .line 63
    if-nez v2, :cond_4

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    move v5, v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v5, v0

    .line 70
    :goto_4
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v4, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast v4, Ll/ent;

    .line 76
    .line 77
    iget-object v4, v4, Ll/ent;->c:Landroid/widget/RelativeLayout;

    .line 78
    .line 79
    if-nez v3, :cond_5

    .line 80
    .line 81
    if-nez v2, :cond_5

    .line 82
    .line 83
    if-eqz p1, :cond_5

    .line 84
    .line 85
    move p1, v1

    .line 86
    goto :goto_5

    .line 87
    :cond_5
    move p1, v0

    .line 88
    :goto_5
    invoke-static {v4, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 92
    .line 93
    check-cast p1, Ll/ent;

    .line 94
    .line 95
    iget-object p1, p1, Ll/ent;->f:Landroid/widget/RelativeLayout;

    .line 96
    .line 97
    if-nez v3, :cond_6

    .line 98
    .line 99
    if-eqz v2, :cond_6

    .line 100
    .line 101
    move v0, v1

    .line 102
    :cond_6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 106
    .line 107
    check-cast p0, Ll/ent;

    .line 108
    .line 109
    iget-object p0, p0, Ll/ent;->l:Landroid/widget/ScrollView;

    .line 110
    .line 111
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic Q2(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Ll/ent;

    .line 18
    .line 19
    iget-object p1, p1, Ll/ent;->k:Lv/VRecyclerView;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p1, Ll/ent;

    .line 28
    .line 29
    iget-object p1, p1, Ll/ent;->c:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Ll/ent;

    .line 37
    .line 38
    iget-object p1, p1, Ll/ent;->f:Landroid/widget/RelativeLayout;

    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p0, Ll/ent;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ent;->l:Landroid/widget/ScrollView;

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchRootEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;->showEmpty()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/xmt;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xmt;-><init>(Ll/bnt;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchRootEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;->showError()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/ymt;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/ymt;-><init>(Ll/bnt;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onSearchResult()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/zmt;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/zmt;-><init>(Ll/bnt;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onTextChanged()Ll/v3f$d;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lrx/c;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/ant;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/ant;-><init>(Ll/bnt;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p0, Ll/ent;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ent;->destroy()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
