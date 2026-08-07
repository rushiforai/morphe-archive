.class public Ll/xdg;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/tk2;Ll/aeg;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/aeg;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->scheme:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-virtual {p0, p1, p2}, Ll/tk2;->c4(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/live/base/data/BLiveTask;Ll/tk2;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->done:Z

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->scheme:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    invoke-virtual {p1, p0, p2}, Ll/tk2;->c4(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;Ll/tk2;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->status:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "doing"

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->scheme:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p2, 0x1

    .line 14
    invoke-virtual {p1, p0, p2}, Ll/tk2;->c4(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public h0()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    const/4 v2, 0x3

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/tcs;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/tcs;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance v1, Ll/ees;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {v1, v2}, Ll/ees;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/scs;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/scs;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public i0(Ll/aeg;Ll/tk2;)V
    .locals 5
    .param p1    # Ll/aeg;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/aeg;->e()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    iget-object v1, p1, Ll/aeg;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    new-instance v1, Ll/des;

    .line 20
    .line 21
    iget-object v2, p1, Ll/aeg;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ll/des;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v1, p1, Ll/aeg;->d:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 46
    .line 47
    new-instance v3, Ll/bes;

    .line 48
    .line 49
    invoke-direct {v3, v2}, Ll/bes;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V

    .line 50
    .line 51
    .line 52
    new-instance v4, Ll/udg;

    .line 53
    .line 54
    invoke-direct {v4, v2, p2}, Ll/udg;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTask;Ll/tk2;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget-object v1, p1, Ll/aeg;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    new-instance v1, Ll/ees;

    .line 69
    .line 70
    iget-object v2, p1, Ll/aeg;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ll/ees;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ll/vdg;

    .line 76
    .line 77
    invoke-direct {v2, p2, p1}, Ll/vdg;-><init>(Ll/tk2;Ll/aeg;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_3
    iget-object p1, p1, Ll/aeg;->e:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;

    .line 103
    .line 104
    new-instance v2, Ll/kcs;

    .line 105
    .line 106
    invoke-direct {v2, v1}, Ll/kcs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;)V

    .line 107
    .line 108
    .line 109
    new-instance v3, Ll/wdg;

    .line 110
    .line 111
    invoke-direct {v3, v1, p2}, Ll/wdg;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;Ll/tk2;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_5
    :goto_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method
