.class public Ll/qtg;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()I
    .locals 2

    .line 1
    sget v0, Ll/cai;->c:I

    .line 2
    .line 3
    sget v1, Ll/cai;->d:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cai;->c(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static b(Lcom/p1/mobile/putong/data/Picture;Z)Lcom/p1/mobile/putong/data/Dimension;
    .locals 3

    .line 1
    invoke-static {}, Ll/qtg;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 8
    .line 9
    int-to-float v1, v1

    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 26
    .line 27
    if-lez v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    invoke-direct {p0, v0, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 36
    .line 37
    int-to-float v1, v1

    .line 38
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 39
    .line 40
    int-to-float p0, p0

    .line 41
    div-float/2addr v1, p0

    .line 42
    const p0, 0x3f333333    # 0.7f

    .line 43
    .line 44
    .line 45
    cmpg-float p0, v1, p0

    .line 46
    .line 47
    if-gtz p0, :cond_2

    .line 48
    .line 49
    mul-int/lit8 p0, v0, 0x9

    .line 50
    .line 51
    div-int/lit8 p0, p0, 0x10

    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    :goto_1
    move v0, p0

    .line 56
    goto :goto_2

    .line 57
    :cond_1
    move v2, v0

    .line 58
    move v0, p0

    .line 59
    move p0, v2

    .line 60
    goto :goto_2

    .line 61
    :cond_2
    const p0, 0x3f547ae1    # 0.83f

    .line 62
    .line 63
    .line 64
    cmpg-float p0, v1, p0

    .line 65
    .line 66
    if-gtz p0, :cond_3

    .line 67
    .line 68
    mul-int/lit8 p0, v0, 0x3

    .line 69
    .line 70
    div-int/lit8 p0, p0, 0x4

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    const p0, 0x3f99999a    # 1.2f

    .line 76
    .line 77
    .line 78
    cmpl-float p0, v1, p0

    .line 79
    .line 80
    if-ltz p0, :cond_4

    .line 81
    .line 82
    mul-int/lit8 p0, v0, 0x3

    .line 83
    .line 84
    div-int/lit8 p0, p0, 0x4

    .line 85
    .line 86
    if-eqz p1, :cond_5

    .line 87
    .line 88
    :cond_4
    move p0, v0

    .line 89
    :cond_5
    :goto_2
    new-instance p1, Lcom/p1/mobile/putong/data/Dimension;

    .line 90
    .line 91
    invoke-direct {p1, v0, p0}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 92
    .line 93
    .line 94
    return-object p1
.end method

.method public static c(Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "community_optimization_long_graphic"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "horizontal_ratio"

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const-string v4, "vertical_ratio"

    .line 25
    .line 26
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    iget v4, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 33
    .line 34
    int-to-float v4, v4

    .line 35
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 36
    .line 37
    int-to-float p0, p0

    .line 38
    div-float/2addr v4, p0

    .line 39
    const/high16 p0, 0x40000000    # 2.0f

    .line 40
    .line 41
    cmpl-float p0, v4, p0

    .line 42
    .line 43
    if-ltz p0, :cond_0

    .line 44
    .line 45
    int-to-float p0, v2

    .line 46
    cmpg-float p0, v4, p0

    .line 47
    .line 48
    if-gtz p0, :cond_0

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 51
    .line 52
    invoke-static {p0}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    xor-int/2addr p0, v3

    .line 57
    return p0

    .line 58
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 59
    .line 60
    int-to-float v0, v0

    .line 61
    div-float/2addr p0, v0

    .line 62
    cmpl-float p0, v4, p0

    .line 63
    .line 64
    if-ltz p0, :cond_1

    .line 65
    .line 66
    const p0, 0x3eaaaaab

    .line 67
    .line 68
    .line 69
    cmpg-float p0, v4, p0

    .line 70
    .line 71
    if-gtz p0, :cond_1

    .line 72
    .line 73
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 74
    .line 75
    invoke-static {p0}, Ll/cgw;->h(Landroid/content/Context;)Z

    .line 76
    .line 77
    .line 78
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    xor-int/2addr p0, v3

    .line 80
    return p0

    .line 81
    :catch_0
    :cond_1
    return v1
.end method

.method public static e(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;Landroid/widget/FrameLayout;Ljava/lang/String;Ll/a30;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Landroid/widget/FrameLayout;",
            "Ljava/lang/String;",
            "Ll/a30;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/qtg;->f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;Landroid/widget/FrameLayout;Ljava/lang/String;ZLl/a30;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;Landroid/widget/FrameLayout;Ljava/lang/String;ZLl/a30;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Landroid/widget/FrameLayout;",
            "Ljava/lang/String;",
            "Z",
            "Ll/a30;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    move v6, v4

    .line 15
    :goto_0
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    const/4 v8, 0x3

    .line 20
    const/4 v9, 0x0

    .line 21
    const/4 v10, 0x1

    .line 22
    const/4 v11, 0x2

    .line 23
    if-ge v6, v7, :cond_2

    .line 24
    .line 25
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v7

    .line 29
    invoke-static {v7, v4}, Ll/qtg;->c(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    instance-of v7, v7, Lv/VRelative;

    .line 37
    .line 38
    if-eqz v7, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    check-cast v7, Lv/VRelative;

    .line 45
    .line 46
    invoke-static {v7, v4}, Ll/qtg;->c(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v7, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v12

    .line 53
    instance-of v13, v12, Lv/VDraweeView;

    .line 54
    .line 55
    if-eqz v13, :cond_0

    .line 56
    .line 57
    move-object v13, v12

    .line 58
    check-cast v13, Lv/VDraweeView;

    .line 59
    .line 60
    sget-object v14, Ll/uqb0;->G:Ll/fsb0;

    .line 61
    .line 62
    invoke-virtual {v14, v13}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v13, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v12, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v13, v9}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-virtual {v7, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    invoke-static {v9, v4}, Ll/qtg;->c(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    if-lt v9, v8, :cond_1

    .line 86
    .line 87
    invoke-virtual {v7, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-static {v7, v4}, Ll/qtg;->c(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    const/high16 v7, 0x40800000    # 4.0f

    .line 102
    .line 103
    const-string v12, "raw"

    .line 104
    .line 105
    if-ne v6, v10, :cond_f

    .line 106
    .line 107
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 112
    .line 113
    instance-of v6, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 114
    .line 115
    instance-of v13, v1, Lcom/p1/mobile/putong/data/Video;

    .line 116
    .line 117
    if-eqz v6, :cond_3

    .line 118
    .line 119
    move-object v9, v1

    .line 120
    check-cast v9, Lcom/p1/mobile/putong/data/Picture;

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_3
    if-eqz v13, :cond_4

    .line 124
    .line 125
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 126
    .line 127
    iget-object v9, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 128
    .line 129
    :cond_4
    :goto_1
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_1b

    .line 134
    .line 135
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    check-cast v1, Lv/VRelative;

    .line 140
    .line 141
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 146
    .line 147
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    if-nez v6, :cond_5

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_5

    .line 160
    .line 161
    move v0, v10

    .line 162
    goto :goto_2

    .line 163
    :cond_5
    move v0, v4

    .line 164
    :goto_2
    invoke-virtual {v1, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    if-eqz v0, :cond_6

    .line 169
    .line 170
    invoke-static {}, Ll/cmg;->C0()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eqz v0, :cond_6

    .line 175
    .line 176
    move v4, v10

    .line 177
    :cond_6
    invoke-static {v6, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    invoke-static {v1, v10}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-lt v0, v8, :cond_7

    .line 188
    .line 189
    iget-object v0, v9, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 190
    .line 191
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_7

    .line 196
    .line 197
    invoke-static {}, Ll/cmg;->v0()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_7

    .line 202
    .line 203
    invoke-virtual {v1, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-static {v0, v10}, Ll/qtg;->c(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    :cond_7
    move/from16 v0, p4

    .line 211
    .line 212
    invoke-static {v9, v0}, Ll/qtg;->b(Lcom/p1/mobile/putong/data/Picture;Z)Lcom/p1/mobile/putong/data/Dimension;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 217
    .line 218
    iget v6, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 219
    .line 220
    iget v8, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 221
    .line 222
    invoke-direct {v4, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 226
    .line 227
    .line 228
    instance-of v1, v2, Lv/VDraweeView;

    .line 229
    .line 230
    if-nez v1, :cond_8

    .line 231
    .line 232
    goto/16 :goto_e

    .line 233
    .line 234
    :cond_8
    check-cast v2, Lv/VDraweeView;

    .line 235
    .line 236
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    if-eqz v1, :cond_9

    .line 241
    .line 242
    invoke-interface {v3, v2, v5, v5}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    :cond_9
    iget-object v1, v9, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 246
    .line 247
    invoke-static {v1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_e

    .line 252
    .line 253
    iget-object v1, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-nez v1, :cond_e

    .line 260
    .line 261
    if-eqz v13, :cond_a

    .line 262
    .line 263
    const-string v1, ""

    .line 264
    .line 265
    goto :goto_3

    .line 266
    :cond_a
    move-object/from16 v1, p3

    .line 267
    .line 268
    :goto_3
    sget v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 269
    .line 270
    int-to-float v3, v3

    .line 271
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    invoke-static {}, Ll/qtg;->a()I

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    mul-int/2addr v4, v11

    .line 280
    add-int/2addr v3, v4

    .line 281
    invoke-virtual {v9, v3}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    invoke-static {v3}, Ll/qtg;->d(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Z

    .line 286
    .line 287
    .line 288
    move-result v4

    .line 289
    if-eqz v4, :cond_c

    .line 290
    .line 291
    instance-of v1, v2, Lv/AutoVDraweeView;

    .line 292
    .line 293
    if-eqz v1, :cond_b

    .line 294
    .line 295
    move-object v1, v2

    .line 296
    check-cast v1, Lv/AutoVDraweeView;

    .line 297
    .line 298
    invoke-virtual {v1}, Lv/AutoVDraweeView;->u()V

    .line 299
    .line 300
    .line 301
    :cond_b
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 302
    .line 303
    iget v4, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 304
    .line 305
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 306
    .line 307
    invoke-virtual {v1, v2, v3, v4, v0}, Ll/fsb0;->P0(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V

    .line 308
    .line 309
    .line 310
    goto :goto_4

    .line 311
    :cond_c
    instance-of v0, v2, Lv/AutoVDraweeView;

    .line 312
    .line 313
    if-eqz v0, :cond_d

    .line 314
    .line 315
    move-object v0, v2

    .line 316
    check-cast v0, Lv/AutoVDraweeView;

    .line 317
    .line 318
    iget-object v1, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    goto :goto_4

    .line 324
    :cond_d
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 325
    .line 326
    invoke-virtual {v0, v2, v3, v1}, Ll/fsb0;->R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    :goto_4
    iget-object v0, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 330
    .line 331
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {v2, v0}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    :cond_e
    invoke-static {v7}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    sget-object v1, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 343
    .line 344
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    check-cast v1, Ll/wlj;

    .line 353
    .line 354
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 355
    .line 356
    .line 357
    return-void

    .line 358
    :cond_f
    move v5, v4

    .line 359
    :goto_5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 360
    .line 361
    .line 362
    move-result v6

    .line 363
    const/16 v9, 0x9

    .line 364
    .line 365
    invoke-static {v6, v9}, Ljava/lang/Math;->min(II)I

    .line 366
    .line 367
    .line 368
    move-result v6

    .line 369
    if-ge v5, v6, :cond_1b

    .line 370
    .line 371
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v6

    .line 375
    check-cast v6, Lcom/p1/mobile/putong/data/Media;

    .line 376
    .line 377
    instance-of v9, v6, Lcom/p1/mobile/putong/data/Picture;

    .line 378
    .line 379
    if-eqz v9, :cond_10

    .line 380
    .line 381
    check-cast v6, Lcom/p1/mobile/putong/data/Picture;

    .line 382
    .line 383
    goto :goto_6

    .line 384
    :cond_10
    instance-of v9, v6, Lcom/p1/mobile/putong/data/Video;

    .line 385
    .line 386
    if-eqz v9, :cond_19

    .line 387
    .line 388
    check-cast v6, Lcom/p1/mobile/putong/data/Video;

    .line 389
    .line 390
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 391
    .line 392
    :goto_6
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 393
    .line 394
    .line 395
    move-result-object v9

    .line 396
    check-cast v9, Lv/VRelative;

    .line 397
    .line 398
    invoke-virtual {v9, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 399
    .line 400
    .line 401
    move-result-object v13

    .line 402
    instance-of v13, v13, Lv/VDraweeView;

    .line 403
    .line 404
    if-nez v13, :cond_11

    .line 405
    .line 406
    goto/16 :goto_e

    .line 407
    .line 408
    :cond_11
    invoke-virtual {v9, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 409
    .line 410
    .line 411
    move-result-object v13

    .line 412
    check-cast v13, Lv/VDraweeView;

    .line 413
    .line 414
    invoke-static {v9, v10}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 415
    .line 416
    .line 417
    iget-object v14, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 418
    .line 419
    invoke-static {v14}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 420
    .line 421
    .line 422
    move-result v14

    .line 423
    if-nez v14, :cond_12

    .line 424
    .line 425
    iget-object v14, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 426
    .line 427
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 428
    .line 429
    .line 430
    move-result-object v15

    .line 431
    invoke-interface {v14, v15}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result v14

    .line 435
    if-eqz v14, :cond_12

    .line 436
    .line 437
    move v14, v10

    .line 438
    goto :goto_7

    .line 439
    :cond_12
    move v14, v4

    .line 440
    :goto_7
    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v15

    .line 444
    if-eqz v14, :cond_13

    .line 445
    .line 446
    invoke-static {}, Ll/cmg;->C0()Z

    .line 447
    .line 448
    .line 449
    move-result v14

    .line 450
    if-eqz v14, :cond_13

    .line 451
    .line 452
    move v14, v10

    .line 453
    goto :goto_8

    .line 454
    :cond_13
    move v14, v4

    .line 455
    :goto_8
    invoke-static {v15, v14}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 456
    .line 457
    .line 458
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    .line 459
    .line 460
    .line 461
    move-result v14

    .line 462
    if-lt v14, v8, :cond_14

    .line 463
    .line 464
    iget-object v14, v6, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 465
    .line 466
    invoke-static {v14}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 467
    .line 468
    .line 469
    move-result v14

    .line 470
    if-eqz v14, :cond_14

    .line 471
    .line 472
    invoke-static {}, Ll/cmg;->v0()Z

    .line 473
    .line 474
    .line 475
    move-result v14

    .line 476
    if-eqz v14, :cond_14

    .line 477
    .line 478
    invoke-virtual {v9, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 479
    .line 480
    .line 481
    move-result-object v14

    .line 482
    invoke-static {v14, v10}, Ll/qtg;->c(Landroid/view/View;Z)V

    .line 483
    .line 484
    .line 485
    :cond_14
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    .line 486
    .line 487
    invoke-static {}, Ll/qtg;->a()I

    .line 488
    .line 489
    .line 490
    move-result v15

    .line 491
    move/from16 v16, v7

    .line 492
    .line 493
    invoke-static {}, Ll/qtg;->a()I

    .line 494
    .line 495
    .line 496
    move-result v7

    .line 497
    invoke-direct {v14, v15, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 498
    .line 499
    .line 500
    invoke-static/range {v16 .. v16}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 501
    .line 502
    .line 503
    move-result-object v7

    .line 504
    sget-object v15, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 505
    .line 506
    invoke-virtual {v7, v15}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 507
    .line 508
    .line 509
    move-result-object v7

    .line 510
    invoke-virtual {v13}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 511
    .line 512
    .line 513
    move-result-object v15

    .line 514
    check-cast v15, Ll/wlj;

    .line 515
    .line 516
    invoke-virtual {v15, v7}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 517
    .line 518
    .line 519
    invoke-virtual {v9, v14}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 520
    .line 521
    .line 522
    packed-switch v5, :pswitch_data_0

    .line 523
    .line 524
    .line 525
    goto/16 :goto_9

    .line 526
    .line 527
    :pswitch_0
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 528
    .line 529
    mul-int/2addr v7, v11

    .line 530
    int-to-float v7, v7

    .line 531
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 532
    .line 533
    .line 534
    move-result v7

    .line 535
    invoke-static {}, Ll/qtg;->a()I

    .line 536
    .line 537
    .line 538
    move-result v9

    .line 539
    mul-int/2addr v9, v11

    .line 540
    add-int/2addr v7, v9

    .line 541
    sget v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 542
    .line 543
    mul-int/2addr v9, v11

    .line 544
    int-to-float v9, v9

    .line 545
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 546
    .line 547
    .line 548
    move-result v9

    .line 549
    invoke-static {}, Ll/qtg;->a()I

    .line 550
    .line 551
    .line 552
    move-result v15

    .line 553
    mul-int/2addr v15, v11

    .line 554
    add-int/2addr v9, v15

    .line 555
    invoke-virtual {v14, v7, v9, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 556
    .line 557
    .line 558
    goto/16 :goto_9

    .line 559
    .line 560
    :pswitch_1
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 561
    .line 562
    int-to-float v7, v7

    .line 563
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 564
    .line 565
    .line 566
    move-result v7

    .line 567
    invoke-static {}, Ll/qtg;->a()I

    .line 568
    .line 569
    .line 570
    move-result v9

    .line 571
    add-int/2addr v7, v9

    .line 572
    sget v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 573
    .line 574
    mul-int/2addr v9, v11

    .line 575
    int-to-float v9, v9

    .line 576
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 577
    .line 578
    .line 579
    move-result v9

    .line 580
    invoke-static {}, Ll/qtg;->a()I

    .line 581
    .line 582
    .line 583
    move-result v15

    .line 584
    mul-int/2addr v15, v11

    .line 585
    add-int/2addr v9, v15

    .line 586
    invoke-virtual {v14, v7, v9, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 587
    .line 588
    .line 589
    goto/16 :goto_9

    .line 590
    .line 591
    :pswitch_2
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 592
    .line 593
    mul-int/2addr v7, v11

    .line 594
    int-to-float v7, v7

    .line 595
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 596
    .line 597
    .line 598
    move-result v7

    .line 599
    invoke-static {}, Ll/qtg;->a()I

    .line 600
    .line 601
    .line 602
    move-result v9

    .line 603
    mul-int/2addr v9, v11

    .line 604
    add-int/2addr v7, v9

    .line 605
    invoke-virtual {v14, v4, v7, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 606
    .line 607
    .line 608
    goto :goto_9

    .line 609
    :pswitch_3
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 610
    .line 611
    mul-int/2addr v7, v11

    .line 612
    int-to-float v7, v7

    .line 613
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 614
    .line 615
    .line 616
    move-result v7

    .line 617
    invoke-static {}, Ll/qtg;->a()I

    .line 618
    .line 619
    .line 620
    move-result v9

    .line 621
    mul-int/2addr v9, v11

    .line 622
    add-int/2addr v7, v9

    .line 623
    sget v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 624
    .line 625
    int-to-float v9, v9

    .line 626
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 627
    .line 628
    .line 629
    move-result v9

    .line 630
    invoke-static {}, Ll/qtg;->a()I

    .line 631
    .line 632
    .line 633
    move-result v15

    .line 634
    add-int/2addr v9, v15

    .line 635
    invoke-virtual {v14, v7, v9, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 636
    .line 637
    .line 638
    goto :goto_9

    .line 639
    :pswitch_4
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 640
    .line 641
    int-to-float v7, v7

    .line 642
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 643
    .line 644
    .line 645
    move-result v7

    .line 646
    invoke-static {}, Ll/qtg;->a()I

    .line 647
    .line 648
    .line 649
    move-result v9

    .line 650
    add-int/2addr v7, v9

    .line 651
    sget v9, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 652
    .line 653
    int-to-float v9, v9

    .line 654
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 655
    .line 656
    .line 657
    move-result v9

    .line 658
    invoke-static {}, Ll/qtg;->a()I

    .line 659
    .line 660
    .line 661
    move-result v15

    .line 662
    add-int/2addr v9, v15

    .line 663
    invoke-virtual {v14, v7, v9, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 664
    .line 665
    .line 666
    goto :goto_9

    .line 667
    :pswitch_5
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 668
    .line 669
    int-to-float v7, v7

    .line 670
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 671
    .line 672
    .line 673
    move-result v7

    .line 674
    invoke-static {}, Ll/qtg;->a()I

    .line 675
    .line 676
    .line 677
    move-result v9

    .line 678
    add-int/2addr v7, v9

    .line 679
    invoke-virtual {v14, v4, v7, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 680
    .line 681
    .line 682
    goto :goto_9

    .line 683
    :pswitch_6
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 684
    .line 685
    mul-int/2addr v7, v11

    .line 686
    int-to-float v7, v7

    .line 687
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 688
    .line 689
    .line 690
    move-result v7

    .line 691
    invoke-static {}, Ll/qtg;->a()I

    .line 692
    .line 693
    .line 694
    move-result v9

    .line 695
    mul-int/2addr v9, v11

    .line 696
    add-int/2addr v7, v9

    .line 697
    invoke-virtual {v14, v7, v4, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 698
    .line 699
    .line 700
    goto :goto_9

    .line 701
    :pswitch_7
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 702
    .line 703
    int-to-float v7, v7

    .line 704
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 705
    .line 706
    .line 707
    move-result v7

    .line 708
    invoke-static {}, Ll/qtg;->a()I

    .line 709
    .line 710
    .line 711
    move-result v9

    .line 712
    add-int/2addr v7, v9

    .line 713
    invoke-virtual {v14, v7, v4, v4, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 714
    .line 715
    .line 716
    :goto_9
    iget-object v7, v6, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 717
    .line 718
    invoke-static {v7, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 719
    .line 720
    .line 721
    move-result v7

    .line 722
    if-nez v7, :cond_18

    .line 723
    .line 724
    iget-object v7, v6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 725
    .line 726
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 727
    .line 728
    .line 729
    move-result v7

    .line 730
    if-nez v7, :cond_18

    .line 731
    .line 732
    sget v7, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 733
    .line 734
    int-to-float v7, v7

    .line 735
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 736
    .line 737
    .line 738
    move-result v7

    .line 739
    invoke-static {}, Ll/qtg;->a()I

    .line 740
    .line 741
    .line 742
    move-result v9

    .line 743
    mul-int/2addr v9, v11

    .line 744
    add-int/2addr v7, v9

    .line 745
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 746
    .line 747
    .line 748
    move-result-object v7

    .line 749
    invoke-static {v7}, Ll/qtg;->d(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Z

    .line 750
    .line 751
    .line 752
    move-result v9

    .line 753
    if-eqz v9, :cond_16

    .line 754
    .line 755
    instance-of v9, v13, Lv/AutoVDraweeView;

    .line 756
    .line 757
    if-eqz v9, :cond_15

    .line 758
    .line 759
    move-object v9, v13

    .line 760
    check-cast v9, Lv/AutoVDraweeView;

    .line 761
    .line 762
    invoke-virtual {v9}, Lv/AutoVDraweeView;->u()V

    .line 763
    .line 764
    .line 765
    :cond_15
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 766
    .line 767
    invoke-static {}, Ll/qtg;->a()I

    .line 768
    .line 769
    .line 770
    move-result v14

    .line 771
    invoke-static {}, Ll/qtg;->a()I

    .line 772
    .line 773
    .line 774
    move-result v15

    .line 775
    invoke-virtual {v9, v13, v7, v14, v15}, Ll/fsb0;->P0(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V

    .line 776
    .line 777
    .line 778
    :goto_a
    move-object/from16 v14, p3

    .line 779
    .line 780
    goto :goto_b

    .line 781
    :cond_16
    instance-of v9, v13, Lv/AutoVDraweeView;

    .line 782
    .line 783
    if-eqz v9, :cond_17

    .line 784
    .line 785
    move-object v7, v13

    .line 786
    check-cast v7, Lv/AutoVDraweeView;

    .line 787
    .line 788
    iget-object v9, v6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 789
    .line 790
    invoke-virtual {v7, v9}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 791
    .line 792
    .line 793
    goto :goto_a

    .line 794
    :cond_17
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 795
    .line 796
    move-object/from16 v14, p3

    .line 797
    .line 798
    invoke-virtual {v9, v13, v7, v14}, Ll/fsb0;->R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 799
    .line 800
    .line 801
    :goto_b
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 802
    .line 803
    invoke-static {v6}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object v6

    .line 807
    invoke-virtual {v13, v6}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 808
    .line 809
    .line 810
    goto :goto_c

    .line 811
    :cond_18
    move-object/from16 v14, p3

    .line 812
    .line 813
    :goto_c
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 814
    .line 815
    .line 816
    move-result v6

    .line 817
    if-eqz v6, :cond_1a

    .line 818
    .line 819
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 820
    .line 821
    .line 822
    move-result-object v6

    .line 823
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 824
    .line 825
    .line 826
    move-result-object v7

    .line 827
    invoke-interface {v3, v13, v6, v7}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 828
    .line 829
    .line 830
    goto :goto_d

    .line 831
    :cond_19
    move-object/from16 v14, p3

    .line 832
    .line 833
    move/from16 v16, v7

    .line 834
    .line 835
    :cond_1a
    :goto_d
    add-int/lit8 v5, v5, 0x1

    .line 836
    .line 837
    move/from16 v7, v16

    .line 838
    .line 839
    goto/16 :goto_5

    .line 840
    .line 841
    :cond_1b
    :goto_e
    return-void

    .line 842
    nop

    .line 843
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
