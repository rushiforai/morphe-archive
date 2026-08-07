.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;


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

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ezj;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/syj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;)V
    .locals 3

    .line 1
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->id:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/ezj;->b4(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->g:Lv/VText;

    .line 8
    .line 9
    new-instance v2, Ll/ryj;

    .line 10
    .line 11
    invoke-direct {v2, p1, v0}, Ll/ryj;-><init>(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->c:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "context_single_room"

    .line 22
    .line 23
    invoke-static {v2, p1, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->d:Lv/VText;

    .line 27
    .line 28
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->accumulatedNum:I

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->entranceNum:I

    .line 35
    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "%s/%s"

    .line 45
    .line 46
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->e:Lv/VText;

    .line 57
    .line 58
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->se:I

    .line 59
    .line 60
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 61
    .line 62
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-static {p1, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public d(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->framePicUrl:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, "context_single_room"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->e:Lv/VText;

    .line 13
    .line 14
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->purchasePriceColor:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Ll/ezj;->t4(Lv/VText;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->processFramePicUrl:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->d:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Ll/ezj;->r4(Ljava/lang/String;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->d:Lv/VText;

    .line 31
    .line 32
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->processColor:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Ll/ezj;->t4(Lv/VText;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->givenGiftIconUrl:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->f:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Ll/ezj;->q4(Ljava/lang/String;Lv/VDraweeView;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->g:Lv/VText;

    .line 49
    .line 50
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 51
    .line 52
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->givenGiftTextColor:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, p0, p2}, Ll/ezj;->t4(Lv/VText;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->entranceNum:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;->accumulatedNum:I

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->g:Lv/VText;

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {v1, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->g:Lv/VText;

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->p5:I

    .line 16
    .line 17
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const/4 p1, 0x1

    .line 26
    invoke-virtual {v1, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->g:Lv/VText;

    .line 30
    .line 31
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q5:I

    .line 32
    .line 33
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
