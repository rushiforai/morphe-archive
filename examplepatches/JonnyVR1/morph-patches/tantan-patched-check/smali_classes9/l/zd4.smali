.class public Ll/zd4;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public final e:Ll/ue4;

.field public final f:Ll/wd4;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/od4;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ue4;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wd4;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/wd4;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zd4;->f:Ll/wd4;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/zd4;->g:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/zd4;->e:Ll/ue4;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic q(Ll/zd4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/zd4;->s(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V

    return-void
.end method

.method private synthetic s(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zd4;->e:Ll/ue4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ue4;->F4(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zd4;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lb2;->m(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 12

    .line 1
    iget-object v0, p0, Ll/zd4;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/od4;

    .line 8
    .line 9
    instance-of v1, v0, Ll/ef4;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/zd4;->f:Ll/wd4;

    .line 14
    .line 15
    invoke-virtual {v1, p2, p1}, Ll/wd4;->b(ILandroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0}, Ll/od4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/zd4;->e:Ll/ue4;

    .line 24
    .line 25
    invoke-virtual {v1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->u(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/ue4;)V

    .line 26
    .line 27
    .line 28
    sget p0, Ll/mdc0;->v3:I

    .line 29
    .line 30
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {v1, p0, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_0
    instance-of v1, v0, Ll/nd4;

    .line 42
    .line 43
    iget-object v2, p0, Ll/zd4;->f:Ll/wd4;

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v2, p2, v1}, Ll/wd4;->d(ILandroid/content/Context;)Lv/VDraweeView;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v0}, Ll/od4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceImage:Ljava/lang/String;

    .line 60
    .line 61
    const/high16 v1, 0x42c00000    # 96.0f

    .line 62
    .line 63
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    const/high16 v1, 0x42fc0000    # 126.0f

    .line 68
    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    const/4 v10, 0x1

    .line 74
    const/4 v11, 0x0

    .line 75
    const-string v3, "context_single_room"

    .line 76
    .line 77
    const/4 v8, 0x0

    .line 78
    const/4 v9, 0x0

    .line 79
    invoke-static/range {v3 .. v11}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 80
    .line 81
    .line 82
    sget v1, Ll/mdc0;->v3:I

    .line 83
    .line 84
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {v4, v1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    new-instance p2, Ll/yd4;

    .line 92
    .line 93
    invoke-direct {p2, p0, v0}, Ll/yd4;-><init>(Ll/zd4;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v4, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    return-object v4

    .line 103
    :cond_1
    invoke-virtual {v2, p1}, Ll/wd4;->c(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignSnapShotItemView;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Ll/mdc0;->v3:I

    .line 108
    .line 109
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {v1, v2, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ll/od4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    iget-object p0, p0, Ll/zd4;->e:Ll/ue4;

    .line 121
    .line 122
    invoke-virtual {v1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignSnapShotItemView;->u(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/ue4;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 126
    .line 127
    .line 128
    return-object v1
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zd4;->f:Ll/wd4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wd4;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zd4;->f:Ll/wd4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wd4;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/od4;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/zd4;->g:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/zd4;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
