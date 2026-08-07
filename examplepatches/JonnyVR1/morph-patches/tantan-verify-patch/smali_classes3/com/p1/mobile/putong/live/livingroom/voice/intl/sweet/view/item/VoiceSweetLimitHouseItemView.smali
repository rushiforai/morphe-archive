.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;


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


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k0p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->image:Ljava/lang/String;

    .line 4
    .line 5
    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    invoke-static {}, Ll/irn;->a()Z

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    const/4 v8, 0x0

    .line 20
    const-string v0, "context_single_room"

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 25
    .line 26
    .line 27
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->wore:Z

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bh:I

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b:Landroid/widget/TextView;

    .line 39
    .line 40
    sget v1, Ll/obc0;->e8:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Ll/n9c0;->A0:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ah:I

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b:Landroid/widget/TextView;

    .line 71
    .line 72
    sget v1, Ll/obc0;->f8:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->b:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    sget v2, Ll/n9c0;->e1:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    .line 95
    .line 96
    :goto_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->remainingMill:J

    .line 97
    .line 98
    const-wide/16 v2, -0x1

    .line 99
    .line 100
    cmp-long v0, v0, v2

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;

    .line 103
    .line 104
    if-nez v0, :cond_1

    .line 105
    .line 106
    const/4 p0, 0x0

    .line 107
    invoke-static {v1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    const/4 v0, 0x1

    .line 112
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;

    .line 116
    .line 117
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->remainingMill:J

    .line 118
    .line 119
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->b(JZ)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetLimitHouseItemView;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->zh:I

    .line 15
    .line 16
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ":"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
