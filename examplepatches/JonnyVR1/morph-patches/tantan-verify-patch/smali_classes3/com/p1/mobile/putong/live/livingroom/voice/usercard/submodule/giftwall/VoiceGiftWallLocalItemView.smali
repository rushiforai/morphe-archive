.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/view/View;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;


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
    invoke-static {p0, p1}, Ll/ykn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;Ll/y20;)V
    .locals 4
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
    new-instance v0, Ll/xkn0;

    .line 5
    .line 6
    invoke-direct {v0, p2, p1}, Ll/xkn0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->f:Lv/VDraweeView;

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
    const/4 v2, 0x1

    .line 23
    xor-int/2addr v0, v2

    .line 24
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->e:Landroid/view/View;

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
    xor-int/2addr v0, v2

    .line 36
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->g:Lv/VText;

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->g:Lv/VText;

    .line 55
    .line 56
    sget p2, Ll/n9c0;->p1:I

    .line 57
    .line 58
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->d:Lv/VDraweeView;

    .line 66
    .line 67
    sget p2, Ll/obc0;->S8:I

    .line 68
    .line 69
    invoke-static {p1, p2}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->h:Lv/VText;

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->name:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->h:Lv/VText;

    .line 85
    .line 86
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->h:Lv/VText;

    .line 90
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v1, "x"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAmount:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->h:Lv/VText;

    .line 111
    .line 112
    sget v0, Ll/n9c0;->m1:I

    .line 113
    .line 114
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 119
    .line 120
    .line 121
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->d:Lv/VDraweeView;

    .line 122
    .line 123
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->icon:Ljava/lang/String;

    .line 124
    .line 125
    const/high16 v1, 0x42740000    # 61.0f

    .line 126
    .line 127
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    const-string v3, "context_livingAct"

    .line 136
    .line 137
    invoke-static {v3, p2, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->f:Lv/VDraweeView;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAvatar:Ljava/lang/String;

    .line 143
    .line 144
    const/high16 p2, 0x42140000    # 37.0f

    .line 145
    .line 146
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    invoke-static {v3, p0, p1, v0, p2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceGiftWallLocalItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
