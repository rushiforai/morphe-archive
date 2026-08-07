.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/view/View;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;


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

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s6p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;Ll/y20;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/r6p0;

    .line 5
    .line 6
    invoke-direct {v0, p2, p1}, Ll/r6p0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->f:Lv/VDraweeView;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->id:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "0001"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    xor-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->e:Landroid/view/View;

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    xor-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->g:Lv/VText;

    .line 47
    .line 48
    const-string v1, "context_livingAct"

    .line 49
    .line 50
    if-eqz p2, :cond_1

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->g:Lv/VText;

    .line 58
    .line 59
    sget p2, Ll/n9c0;->h1:I

    .line 60
    .line 61
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->d:Lv/VDraweeView;

    .line 69
    .line 70
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IldLR1I3U0ozRlBURkVXQlRINDVHWk9PVlRJS0pDTzE0IiwidyI6MTQ0LCJoIjoxNDQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNDU1NTYzMzk5NTYzMTgzNjE2fQ.png"

    .line 71
    .line 72
    invoke-static {v1, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->name:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v2, "x"

    .line 87
    .line 88
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAmount:I

    .line 92
    .line 93
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->g:Lv/VText;

    .line 104
    .line 105
    sget v0, Ll/n9c0;->m1:I

    .line 106
    .line 107
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->d:Lv/VDraweeView;

    .line 115
    .line 116
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->icon:Ljava/lang/String;

    .line 117
    .line 118
    sget v2, Ll/qa00;->D:I

    .line 119
    .line 120
    invoke-static {v1, p2, v0, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->f:Lv/VDraweeView;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAvatar:Ljava/lang/String;

    .line 126
    .line 127
    sget p2, Ll/qa00;->p:I

    .line 128
    .line 129
    invoke-static {v1, p0, p1, p2, p2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceUserCardGiftWallItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
