.class public Ll/yhu;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public final e:Ll/liu;

.field public final f:Ll/whu;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pd4;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/liu;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/whu;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/whu;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yhu;->f:Ll/whu;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/yhu;->g:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/yhu;->e:Ll/liu;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yhu;->g:Ljava/util/List;

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
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yhu;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/pd4;

    .line 8
    .line 9
    instance-of v1, v0, Ll/ff4;

    .line 10
    .line 11
    iget-object v2, p0, Ll/yhu;->f:Ll/whu;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v2, p2, p1}, Ll/whu;->b(ILandroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0}, Ll/pd4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/yhu;->e:Ll/liu;

    .line 24
    .line 25
    invoke-virtual {v1, v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->u(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/liu;)V

    .line 26
    .line 27
    .line 28
    sget p0, Ll/ldc0;->L0:I

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
    invoke-virtual {v2, p1}, Ll/whu;->c(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignSnapShotItemView;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget v1, Ll/ldc0;->L0:I

    .line 46
    .line 47
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p0, v1, p2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ll/pd4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignSnapShotItemView;->u(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    return-object p0
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yhu;->f:Ll/whu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/whu;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yhu;->f:Ll/whu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/whu;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pd4;",
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
    iget-object v0, p0, Ll/yhu;->g:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/yhu;->g:Ljava/util/List;

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
