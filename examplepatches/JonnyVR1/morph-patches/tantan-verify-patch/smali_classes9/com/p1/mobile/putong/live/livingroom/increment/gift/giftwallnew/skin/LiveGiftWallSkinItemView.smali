.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Ll/jqs;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/jqs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->user:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/jqs;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/jqs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/jqs;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fqs;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;Ll/jqs;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->e:Ll/jqs;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "context_livingAct"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->d:Lv/VText;

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->name:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v3, 0x5

    .line 20
    invoke-static {v2, v3}, Ll/xau;->s(Ljava/lang/String;I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->b:Lv/VDraweeView;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->icon:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->b:Lv/VDraweeView;

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->namedUserId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v0, v2}, Ll/n3d0;->i(Lv/VDraweeView;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->namedUserId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->a:Lv/VDraweeView;

    .line 58
    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    sget v0, Ll/obc0;->P0:I

    .line 62
    .line 63
    invoke-virtual {v2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    sget v0, Ll/obc0;->O0:I

    .line 68
    .line 69
    invoke-virtual {v2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->user:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->c:Lv/VDraweeView;

    .line 79
    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;->user:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->avatar:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v1, v2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->c:Lv/VDraweeView;

    .line 90
    .line 91
    const/4 v1, 0x1

    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->c:Lv/VDraweeView;

    .line 96
    .line 97
    new-instance v1, Ll/dqs;

    .line 98
    .line 99
    invoke-direct {v1, p2, p1}, Ll/dqs;-><init>(Ll/jqs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    const/4 v0, 0x0

    .line 107
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    :goto_1
    new-instance v0, Ll/eqs;

    .line 111
    .line 112
    invoke-direct {v0, p2, p1}, Ll/eqs;-><init>(Ll/jqs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGiftDetail;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/skin/LiveGiftWallSkinItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x432f0000    # 175.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
