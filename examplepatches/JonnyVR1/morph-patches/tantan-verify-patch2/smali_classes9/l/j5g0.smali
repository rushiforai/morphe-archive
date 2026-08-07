.class public Ll/j5g0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "interactive"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/high16 v1, -0x1000000

    .line 10
    .line 11
    const-string v2, "#"

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;->T(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/InteractiveSticker;->setMaxCount(I)V

    .line 28
    .line 29
    .line 30
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    const/high16 p1, 0x41600000    # 14.0f

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    int-to-float p1, p1

    .line 38
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    .line 40
    .line 41
    :try_start_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    goto :goto_1

    .line 60
    :catch_0
    move-exception p1

    .line 61
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    .line 66
    .line 67
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 68
    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_1
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 75
    .line 76
    :goto_2
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 77
    .line 78
    .line 79
    goto :goto_6

    .line 80
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 81
    .line 82
    const-string v3, "gift"

    .line 83
    .line 84
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_5

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    sget v0, Ll/yec0;->U5:I

    .line 95
    .line 96
    const/4 v3, 0x0

    .line 97
    invoke-virtual {p1, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    move-object v0, p1

    .line 102
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->T(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 110
    .line 111
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->setMaxCount(I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->d:Lv/VText;

    .line 115
    .line 116
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 117
    .line 118
    if-nez v3, :cond_3

    .line 119
    .line 120
    const/high16 v3, 0x41200000    # 10.0f

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_3
    int-to-float v3, v3

    .line 124
    :goto_3
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 125
    .line 126
    .line 127
    :try_start_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p1, v1}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 142
    .line 143
    .line 144
    move-result v1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 145
    goto :goto_4

    .line 146
    :catch_1
    move-exception p1

    .line 147
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    :goto_4
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->d:Lv/VText;

    .line 151
    .line 152
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 153
    .line 154
    .line 155
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->d:Lv/VText;

    .line 156
    .line 157
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 158
    .line 159
    if-eqz v1, :cond_4

    .line 160
    .line 161
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_4
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 165
    .line 166
    :goto_5
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 167
    .line 168
    .line 169
    goto :goto_6

    .line 170
    :cond_5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/ImageSticker;

    .line 171
    .line 172
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/ImageSticker;-><init>(Landroid/content/Context;)V

    .line 173
    .line 174
    .line 175
    :goto_6
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 189
    .line 190
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-nez p1, :cond_6

    .line 195
    .line 196
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 197
    .line 198
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setCustomId(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 202
    .line 203
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setTemplateId(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 207
    .line 208
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setCategory(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 212
    .line 213
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 214
    .line 215
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 216
    .line 217
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->e(FF)V

    .line 218
    .line 219
    .line 220
    return-object v0
.end method
