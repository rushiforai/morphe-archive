.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkFPMjdGTTdFWFBYMjJUS1g0UEhMMk1RM0lEWFBDVzEyIiwidyI6MzYsImgiOjM2LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzYxODQxMjU1MDQ2MjI0ODI3MH0.webp"

    .line 4
    .line 5
    const-string v2, "context_single_room"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->d:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->giftUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->e:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->userAvatar:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->g:Lv/VText;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->giftName:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, " x"

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->giftNum:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->h:Lv/VText;

    .line 54
    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->createdTime:J

    .line 56
    .line 57
    const-wide/16 v3, 0x3e8

    .line 58
    .line 59
    mul-long/2addr v1, v3

    .line 60
    invoke-static {v1, v2}, Ll/kdu;->S(J)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->i:Lv/VText;

    .line 68
    .line 69
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;->popularityValue:I

    .line 70
    .line 71
    int-to-long v1, v1

    .line 72
    invoke-static {v1, v2}, Ll/yau;->h(J)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->e:Lv/VDraweeView;

    .line 80
    .line 81
    new-instance v1, Ll/axj;

    .line 82
    .line 83
    invoke-direct {v1, p2, p1}, Ll/axj;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->d:Lv/VDraweeView;

    .line 90
    .line 91
    new-instance v0, Ll/bxj;

    .line 92
    .line 93
    invoke-direct {v0, p2, p1}, Ll/bxj;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveBossGift;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->A2:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->t:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->e:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->G1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->f:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->b2:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->g:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->p2:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->h:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->F4:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VText;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftRecord/GiftRecordDetailItemView;->i:Lv/VText;

    .line 63
    .line 64
    return-void
.end method
