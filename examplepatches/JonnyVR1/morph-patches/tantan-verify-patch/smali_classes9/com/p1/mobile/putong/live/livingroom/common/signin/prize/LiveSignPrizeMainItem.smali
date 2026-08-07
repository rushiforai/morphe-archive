.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    new-instance v0, Ll/bae0$a;

    .line 12
    .line 13
    const/16 v1, 0x271

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->button:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->scheme:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/bae0$a;->c()Ll/bae0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p3, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->title:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->x4(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyt;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;Ljava/lang/String;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->c:Landroid/widget/TextView;

    .line 5
    .line 6
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->title:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->d:Landroid/widget/TextView;

    .line 12
    .line 13
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->description:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->e:Landroid/widget/TextView;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->e:Landroid/widget/TextView;

    .line 25
    .line 26
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->button:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    const-string v0, "medal"

    .line 34
    .line 35
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->type:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->b:Lv/VDraweeView;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 50
    .line 51
    const/high16 v1, 0x41f00000    # 30.0f

    .line 52
    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 58
    .line 59
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 71
    .line 72
    const/high16 v1, 0x42200000    # 40.0f

    .line 73
    .line 74
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 79
    .line 80
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 85
    .line 86
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->b:Lv/VDraweeView;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->b:Lv/VDraweeView;

    .line 92
    .line 93
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;->icon:Ljava/lang/String;

    .line 94
    .line 95
    sget v2, Ll/qa00;->y:I

    .line 96
    .line 97
    const-string v3, "context_single_room"

    .line 98
    .line 99
    invoke-static {v3, v0, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->e:Landroid/widget/TextView;

    .line 103
    .line 104
    new-instance v0, Ll/hyt;

    .line 105
    .line 106
    invoke-direct {v0, p1, p2, p3}, Ll/hyt;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizesRewards;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignPrizeMainItem;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
