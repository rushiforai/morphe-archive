.class public Ll/yil0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yil0;->G1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yil0;


# direct methods
.method public constructor <init>(Ll/yil0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IZ)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ll/b0m;->Q()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/yil0;->L0(Ll/yil0;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/yil0;->x0(Ll/yil0;)Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 30
    .line 31
    invoke-static {v0}, Ll/yil0;->x0(Ll/yil0;)Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/CameraSticker;->isBeautySticker()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 42
    .line 43
    invoke-static {v0}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ll/b0m;->T()V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/yil0;->K0(Ll/yil0;Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 56
    .line 57
    iget-object v0, v0, Ll/yil0;->L:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e()V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 65
    .line 66
    iget-object v0, v0, Ll/yil0;->M:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 74
    .line 75
    invoke-static {v0}, Ll/yil0;->E0(Ll/yil0;)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 86
    .line 87
    invoke-static {v0}, Ll/yil0;->E0(Ll/yil0;)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 95
    .line 96
    invoke-static {v0}, Ll/yil0;->z0(Ll/yil0;)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 107
    .line 108
    invoke-static {v0}, Ll/yil0;->z0(Ll/yil0;)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 113
    .line 114
    .line 115
    :cond_3
    if-eqz p2, :cond_4

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_4
    iget-object p2, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 119
    .line 120
    invoke-static {p2}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-interface {p2}, Ll/b0m;->U()V

    .line 125
    .line 126
    .line 127
    if-nez p1, :cond_5

    .line 128
    .line 129
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 130
    .line 131
    invoke-static {p1}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p1}, Ll/b0m;->Q()Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_5

    .line 140
    .line 141
    iget-object p0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 142
    .line 143
    invoke-static {p0}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {}, Ll/yil0;->U0()[F

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-interface {p0, p1}, Ll/b0m;->w([F)V

    .line 152
    .line 153
    .line 154
    :cond_5
    :goto_0
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/xc4;->m(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/yil0;->B0(Ll/yil0;)Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->i(I)V

    .line 15
    .line 16
    .line 17
    iget-boolean p2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 18
    .line 19
    if-eqz p2, :cond_6

    .line 20
    .line 21
    if-nez p3, :cond_6

    .line 22
    .line 23
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 26
    .line 27
    invoke-static {p3}, Ll/yil0;->y0(Ll/yil0;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :cond_0
    iget-object p2, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 40
    .line 41
    invoke-static {p2}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-interface {p2}, Ll/b0m;->Q()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 50
    .line 51
    invoke-static {p3, p1}, Ll/yil0;->K0(Ll/yil0;Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 52
    .line 53
    .line 54
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 55
    .line 56
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p3, v0}, Ll/yil0;->L0(Ll/yil0;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 62
    .line 63
    invoke-static {p3}, Ll/yil0;->E0(Ll/yil0;)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    if-eqz p3, :cond_1

    .line 72
    .line 73
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 74
    .line 75
    invoke-static {p3}, Ll/yil0;->E0(Ll/yil0;)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-virtual {p3}, Landroid/animation/Animator;->cancel()V

    .line 80
    .line 81
    .line 82
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/CameraSticker;->isBeautySticker()Z

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 87
    .line 88
    if-eqz p3, :cond_2

    .line 89
    .line 90
    const/4 p3, 0x0

    .line 91
    invoke-static {v0, p3}, Ll/yil0;->J0(Ll/yil0;Ll/g6x;)V

    .line 92
    .line 93
    .line 94
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 95
    .line 96
    invoke-static {p3}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    new-instance v0, Ljava/io/File;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p3, v0}, Ll/b0m;->N(Ljava/io/File;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    const/4 p3, 0x1

    .line 112
    invoke-static {v0, p3}, Ll/yil0;->M0(Ll/yil0;Z)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 116
    .line 117
    invoke-static {v0, p3}, Ll/yil0;->N0(Ll/yil0;Z)V

    .line 118
    .line 119
    .line 120
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 121
    .line 122
    invoke-static {p3}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    invoke-interface {p3}, Ll/b0m;->T()V

    .line 127
    .line 128
    .line 129
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 130
    .line 131
    invoke-static {p3}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    invoke-interface {p3}, Ll/b0m;->B()V

    .line 136
    .line 137
    .line 138
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 139
    .line 140
    invoke-virtual {p3}, Ll/yil0;->C0()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Ljava/io/File;

    .line 145
    .line 146
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 147
    .line 148
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v0, v1}, Ll/wdl0;->a(Landroid/content/Context;Ljava/io/File;)Ll/g6x;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-static {p3, v0}, Ll/yil0;->J0(Ll/yil0;Ll/g6x;)V

    .line 156
    .line 157
    .line 158
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 159
    .line 160
    invoke-static {p3}, Ll/yil0;->w0(Ll/yil0;)Ll/g6x;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p3

    .line 168
    if-eqz p3, :cond_3

    .line 169
    .line 170
    iget-object p3, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 171
    .line 172
    invoke-static {p3}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 177
    .line 178
    invoke-static {v0}, Ll/yil0;->w0(Ll/yil0;)Ll/g6x;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-interface {p3, v0}, Ll/b0m;->A(Ll/g6x;)Z

    .line 183
    .line 184
    .line 185
    :cond_3
    :goto_0
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 186
    .line 187
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 188
    .line 189
    iget-object v0, v0, Ll/yil0;->L:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 192
    .line 193
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->getDraweeView()Lv/VDraweeView;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->icon:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {p3, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 203
    .line 204
    iget-object v0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 205
    .line 206
    iget-object v0, v0, Ll/yil0;->M:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;

    .line 207
    .line 208
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->getDraweeView()Lv/VDraweeView;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->icon:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {p3, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 220
    .line 221
    invoke-static {p1}, Ll/yil0;->w0(Ll/yil0;)Ll/g6x;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_4

    .line 230
    .line 231
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 232
    .line 233
    const/4 p3, 0x0

    .line 234
    invoke-static {p1, p3, p3}, Ll/yil0;->R0(Ll/yil0;IZ)V

    .line 235
    .line 236
    .line 237
    :cond_4
    if-nez p2, :cond_5

    .line 238
    .line 239
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 240
    .line 241
    invoke-static {p1}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-interface {p1}, Ll/b0m;->Q()Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_5

    .line 250
    .line 251
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 252
    .line 253
    invoke-static {p1}, Ll/yil0;->D0(Ll/yil0;)Ll/b0m;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-static {}, Ll/yil0;->U0()[F

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    invoke-interface {p1, p2}, Ll/b0m;->w([F)V

    .line 262
    .line 263
    .line 264
    :cond_5
    iget-object p1, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 265
    .line 266
    invoke-static {p1}, Ll/yil0;->A0(Ll/yil0;)Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    if-eqz p1, :cond_6

    .line 275
    .line 276
    iget-object p0, p0, Ll/yil0$e;->a:Ll/yil0;

    .line 277
    .line 278
    invoke-static {p0}, Ll/yil0;->A0(Ll/yil0;)Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->S()V

    .line 283
    .line 284
    .line 285
    :cond_6
    :goto_1
    return-void
.end method
