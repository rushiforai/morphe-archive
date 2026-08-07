.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vos;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->isSkin:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/obc0;->j4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 21
    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    move v0, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v4

    .line 27
    :goto_0
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    sget v0, Ll/obc0;->T0:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    :goto_1
    new-instance v0, Ll/uos;

    .line 36
    .line 37
    invoke-direct {v0, p2, p1}, Ll/uos;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->c:Lv/VDraweeView;

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->icon:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "context_livingAct"

    .line 50
    .line 51
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->c:Lv/VDraweeView;

    .line 55
    .line 56
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 57
    .line 58
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 59
    .line 60
    if-gtz v0, :cond_2

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move v3, v4

    .line 64
    :goto_2
    invoke-static {p2, v3}, Ll/n3d0;->i(Lv/VDraweeView;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->d:Landroid/widget/TextView;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->name:Ljava/lang/String;

    .line 72
    .line 73
    const/4 v2, 0x5

    .line 74
    invoke-static {v0, v2}, Ll/xau;->s(Ljava/lang/String;I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->e:Lv/VDraweeView;

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->category:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->icon:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/LiveGiftWallNewGiftItemView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 93
    .line 94
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->grade:I

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftFiveStarView;->j0(I)V

    .line 97
    .line 98
    .line 99
    return-void
.end method
