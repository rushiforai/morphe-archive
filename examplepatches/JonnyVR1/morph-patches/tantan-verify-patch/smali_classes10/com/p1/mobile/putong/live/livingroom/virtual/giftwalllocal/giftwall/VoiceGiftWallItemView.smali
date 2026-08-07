.class public Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VImage;

.field public e:Lv/VDraweeView;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

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
    invoke-static {p0, p1}, Ll/okn0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;Landroid/view/View;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->h:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->i:Lv/VText;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "x"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAmount:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->icon:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->icon:Ljava/lang/String;

    .line 42
    .line 43
    sget v2, Ll/qa00;->F:I

    .line 44
    .line 45
    const-string v3, "context_livingAct"

    .line 46
    .line 47
    invoke-static {v3, v0, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/mkn0;

    .line 51
    .line 52
    invoke-direct {v0, p2, p1}, Ll/mkn0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->g:Lv/VDraweeView;

    .line 59
    .line 60
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->unlocked:Z

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    const/4 v2, 0x1

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAvatar:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    move v0, v2

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    move v0, v1

    .line 77
    :goto_0
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->f:Landroid/view/View;

    .line 81
    .line 82
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->unlocked:Z

    .line 83
    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAvatar:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_2

    .line 93
    .line 94
    move v1, v2

    .line 95
    :cond_2
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->unlocked:Z

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->d:Lv/VImage;

    .line 101
    .line 102
    if-eqz p2, :cond_4

    .line 103
    .line 104
    sget p2, Ll/obc0;->w2:I

    .line 105
    .line 106
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 107
    .line 108
    .line 109
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->h:Lv/VText;

    .line 110
    .line 111
    sget v0, Ll/n9c0;->p1:I

    .line 112
    .line 113
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 121
    .line 122
    const/4 v0, 0x0

    .line 123
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 127
    .line 128
    const/high16 v0, 0x3f800000    # 1.0f

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAvatar:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-nez p2, :cond_3

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->g:Lv/VDraweeView;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->mvpAvatar:Ljava/lang/String;

    .line 144
    .line 145
    const/high16 p2, 0x41c00000    # 24.0f

    .line 146
    .line 147
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    invoke-static {v3, p0, p1, p2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 152
    .line 153
    .line 154
    :cond_3
    :goto_1
    return-void

    .line 155
    :cond_4
    sget p1, Ll/obc0;->v2:I

    .line 156
    .line 157
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->h:Lv/VText;

    .line 161
    .line 162
    sget p2, Ll/n9c0;->j1:I

    .line 163
    .line 164
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->i:Lv/VText;

    .line 172
    .line 173
    sget p2, Ll/n9c0;->j1:I

    .line 174
    .line 175
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 180
    .line 181
    .line 182
    new-instance p1, Landroid/graphics/ColorMatrix;

    .line 183
    .line 184
    invoke-direct {p1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 185
    .line 186
    .line 187
    const/4 p2, 0x0

    .line 188
    invoke-virtual {p1, p2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 189
    .line 190
    .line 191
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 192
    .line 193
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    .line 194
    .line 195
    invoke-direct {v0, p1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 202
    .line 203
    const p1, 0x3f333333    # 0.7f

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
