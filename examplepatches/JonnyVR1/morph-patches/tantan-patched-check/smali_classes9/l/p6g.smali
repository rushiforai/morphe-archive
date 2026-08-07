.class public Ll/p6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/q6g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/q6g;

.field public final b:Lv/VDraweeView;

.field public final c:Lv/VDraweeView;

.field public final d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public final e:Lv/VImage;

.field public final f:Z


# direct methods
.method public constructor <init>(Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VImage;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p6g;->b:Lv/VDraweeView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/p6g;->c:Lv/VDraweeView;

    .line 7
    .line 8
    iput-object p3, p0, Ll/p6g;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    iput-object p4, p0, Ll/p6g;->e:Lv/VImage;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/p6g;->f:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Ll/q6g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p6g;->a:Ll/q6g;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p6g;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c(Ll/aeg;)V
    .locals 7

    .line 1
    iget-object p1, p1, Ll/aeg;->f:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->users:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->users:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;

    .line 22
    .line 23
    iget-object v3, p0, Ll/p6g;->b:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;->avatar:Ljava/lang/String;

    .line 26
    .line 27
    const/high16 v4, 0x42780000    # 62.0f

    .line 28
    .line 29
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const-string v6, "context_single_room"

    .line 34
    .line 35
    invoke-static {v6, v3, v0, v5}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->users:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-le v0, v1, :cond_1

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->users:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;->id:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->users:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v3, p0, Ll/p6g;->c:Lv/VDraweeView;

    .line 71
    .line 72
    if-eqz v0, :cond_0

    .line 73
    .line 74
    sget v0, Ll/obc0;->U4:I

    .line 75
    .line 76
    invoke-virtual {v3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->users:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummaryUser;->avatar:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    invoke-static {v6, v3, v0, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    :cond_1
    :goto_0
    const-string v0, "done"

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->status:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_3

    .line 106
    .line 107
    iget-boolean p1, p0, Ll/p6g;->f:Z

    .line 108
    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    iget-object p1, p0, Ll/p6g;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 113
    .line 114
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ll/p6g;->e:Lv/VImage;

    .line 118
    .line 119
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/p6g;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 124
    .line 125
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/p6g;->e:Lv/VImage;

    .line 129
    .line 130
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/p6g;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 134
    .line 135
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAnimationView;->clearDynamicData()V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/p6g;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 139
    .line 140
    const-string p1, "https://auto.tancdn.com/v1/raw/60051f2a-ba7d-4b43-ac8e-3017bd96a03310.so"

    .line 141
    .line 142
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    :cond_4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q6g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6g;->a(Ll/q6g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
