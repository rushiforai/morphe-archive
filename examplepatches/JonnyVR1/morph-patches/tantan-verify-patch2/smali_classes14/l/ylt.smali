.class public Ll/ylt;
.super Ll/klt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/klt<",
        "Ll/hmt;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Ll/xyd0;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/olt;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;Ll/imt;Landroid/widget/LinearLayout;Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Ll/klt;-><init>(Ll/ner;Ll/imt;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xyd0;

    .line 5
    .line 6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "live_search_history_record_"

    .line 9
    .line 10
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    new-instance v0, Ljava/util/HashSet;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p1, p2, v0}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/ylt;->f:Ll/xyd0;

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 40
    .line 41
    new-instance p1, Ll/hmt;

    .line 42
    .line 43
    invoke-direct {p1, p3, p4, p5, p6}, Ll/hmt;-><init>(Landroid/widget/LinearLayout;Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic H2(Ljava/lang/String;Ll/olt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/olt;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic I2(Ll/olt;Ll/olt;)I
    .locals 0

    .line 1
    iget p1, p1, Ll/olt;->b:I

    .line 2
    .line 3
    iget p0, p0, Ll/olt;->b:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public static synthetic K2(Ll/ylt;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ylt;->R2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic L2(Ll/olt;Ll/olt;)I
    .locals 0

    .line 1
    iget p1, p1, Ll/olt;->b:I

    .line 2
    .line 3
    iget p0, p0, Ll/olt;->b:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public static synthetic M2(Ll/ylt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ylt;->S2(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V

    return-void
.end method

.method public static synthetic N2(Ll/ylt;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ylt;->P2(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic R2(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/olt;

    .line 2
    .line 3
    invoke-static {p1}, Ll/olt;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p1}, Ll/olt;->b(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {v0, v1, p1}, Ll/olt;-><init>(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic S2(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/hmt;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/hmt;->l(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final P2(Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ll/olt;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    move v1, v2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/olt;

    .line 21
    .line 22
    iget v1, v1, Ll/olt;->b:I

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    :goto_0
    invoke-direct {v0, p1, v1}, Ll/olt;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 30
    .line 31
    new-instance v3, Ll/vlt;

    .line 32
    .line 33
    invoke-direct {v3, p1}, Ll/vlt;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/olt;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    iget p1, v0, Ll/olt;->b:I

    .line 49
    .line 50
    invoke-virtual {v1, p1}, Ll/olt;->e(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    iget-object v1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget-object v3, p0, Ll/ylt;->g:Ljava/util/List;

    .line 61
    .line 62
    const/16 v4, 0xa

    .line 63
    .line 64
    if-ne v1, v4, :cond_2

    .line 65
    .line 66
    const/16 v0, 0x9

    .line 67
    .line 68
    invoke-interface {v3, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ll/olt;

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ll/olt;->d(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Ll/olt;

    .line 84
    .line 85
    iget p1, p1, Ll/olt;->b:I

    .line 86
    .line 87
    add-int/lit8 p1, p1, 0x1

    .line 88
    .line 89
    invoke-virtual {v0, p1}, Ll/olt;->e(I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :goto_1
    iget-object p1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 102
    .line 103
    new-instance v0, Ll/wlt;

    .line 104
    .line 105
    invoke-direct {v0}, Ll/wlt;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/x7s;->v0(Ljava/util/List;Ljava/util/Comparator;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/ylt;->V2()V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 115
    .line 116
    check-cast p1, Ll/hmt;

    .line 117
    .line 118
    iget-object p0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 119
    .line 120
    invoke-virtual {p1, p0}, Ll/hmt;->v(Ljava/util/List;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public Q2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ylt;->V2()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/hmt;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/hmt;->j(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ylt;->f:Ll/xyd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Ll/rlt;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/rlt;-><init>(Ll/ylt;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 27
    .line 28
    new-instance v1, Ll/slt;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/slt;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/x7s;->v0(Ljava/util/List;Ljava/util/Comparator;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v0, Ll/hmt;

    .line 39
    .line 40
    iget-object v1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/hmt;->v(Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v0, Ll/hmt;

    .line 49
    .line 50
    iget-object v0, v0, Ll/hmt;->b:Lv/VText;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast v0, Ll/hmt;

    .line 59
    .line 60
    iget-object v0, v0, Ll/hmt;->c:Landroid/view/View;

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchHistoryEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;->addRecord()Ll/v3f$d;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lrx/c;

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/tlt;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/tlt;-><init>(Ll/ylt;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onSearchResult()Ll/v3f$d;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lrx/c;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/ult;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/ult;-><init>(Ll/ylt;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public T2(Ll/olt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->changeText()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Ll/olt;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public U2(Ll/olt;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    if-ltz p1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ylt;->V2()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v0, Ll/hmt;

    .line 28
    .line 29
    iget-object p0, p0, Ll/ylt;->g:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {v0, p0, p1}, Ll/hmt;->w(Ljava/util/List;I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final V2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ylt;->f:Ll/xyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/ylt;->g:Ljava/util/List;

    .line 13
    .line 14
    new-instance v2, Ll/xlt;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/xlt;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ylt;->f:Ll/xyd0;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method
