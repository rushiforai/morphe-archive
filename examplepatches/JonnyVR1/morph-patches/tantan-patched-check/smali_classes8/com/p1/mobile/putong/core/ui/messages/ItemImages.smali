.class public Lcom/p1/mobile/putong/core/ui/messages/ItemImages;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/core/data/Message;

.field public c:Landroid/widget/ProgressBar;

.field public d:Landroid/graphics/drawable/AnimationDrawable;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemImages;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->e(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemImages;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->f(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private synthetic e(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    const-string v0, "-1"

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    const-string v0, "-11001"

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    :cond_1
    new-instance v0, Ll/pf60;

    .line 50
    .line 51
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageExtData;->extra:Ljava/lang/String;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const-string v1, ""

    .line 65
    .line 66
    :goto_0
    const-string v2, "ext_data"

    .line 67
    .line 68
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    filled-new-array {v0}, [Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v1, "e_official_pic_video_handle"

    .line 76
    .line 77
    const-string v2, "p_chat_view"

    .line 78
    .line 79
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    invoke-interface {v0, p0, p1, p2}, Ll/r97;->J4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    :goto_1
    return-void
.end method

.method private synthetic f(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/high16 v0, 0x42820000    # 65.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/high16 v1, 0x42180000    # 38.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-direct {p1, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 30
    .line 31
    sget v0, Ll/ibc0;->s7:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 37
    .line 38
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->d:Landroid/graphics/drawable/AnimationDrawable;

    .line 44
    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 48
    .line 49
    sget v0, Ll/ibc0;->x7:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->d:Landroid/graphics/drawable/AnimationDrawable;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_6

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->d:Landroid/graphics/drawable/AnimationDrawable;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->h()V

    .line 81
    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 97
    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    iget v2, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 101
    .line 102
    if-eqz v2, :cond_2

    .line 103
    .line 104
    iget v2, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 105
    .line 106
    if-nez v2, :cond_3

    .line 107
    .line 108
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 109
    .line 110
    const/16 v2, 0xb4

    .line 111
    .line 112
    invoke-direct {v0, v2, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 113
    .line 114
    .line 115
    :cond_3
    iget v2, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 116
    .line 117
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 118
    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->e:Landroid/widget/TextView;

    .line 120
    .line 121
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    instance-of v4, v4, Lcom/p1/mobile/putong/data/Video;

    .line 128
    .line 129
    invoke-virtual {p0, v2, v0, v4}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->d(IIZ)Z

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->e:Landroid/widget/TextView;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->M3:I

    .line 143
    .line 144
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->g(II)Landroid/graphics/Point;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 156
    .line 157
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 162
    .line 163
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 164
    .line 165
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 166
    .line 167
    iget v4, v0, Landroid/graphics/Point;->y:I

    .line 168
    .line 169
    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 170
    .line 171
    .line 172
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 173
    .line 174
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .line 176
    .line 177
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 178
    .line 179
    const-string v3, "raw"

    .line 180
    .line 181
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    if-eqz v2, :cond_5

    .line 186
    .line 187
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 188
    .line 189
    if-eqz v2, :cond_4

    .line 190
    .line 191
    move-object v2, v1

    .line 192
    check-cast v2, Lcom/p1/mobile/putong/data/Video;

    .line 193
    .line 194
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 195
    .line 196
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    if-eqz v2, :cond_4

    .line 203
    .line 204
    goto :goto_0

    .line 205
    :cond_4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_5
    :goto_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 218
    .line 219
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 224
    .line 225
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 226
    .line 227
    const-string v4, "chat"

    .line 228
    .line 229
    invoke-virtual {v2, v3, v0, v4}, Ll/fsb0;->R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {p1, v1}, Ll/k900;->h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 246
    .line 247
    new-instance v1, Ll/s6q;

    .line 248
    .line 249
    invoke-direct {v1, p0, p1}, Ll/s6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemImages;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 250
    .line 251
    .line 252
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 256
    .line 257
    new-instance v1, Ll/t6q;

    .line 258
    .line 259
    invoke-direct {v1, p0}, Ll/t6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemImages;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    if-nez p1, :cond_6

    .line 270
    .line 271
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->i()V

    .line 272
    .line 273
    .line 274
    :cond_6
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 27
    .line 28
    invoke-interface {v0, v1, v2, p0}, Ll/r97;->M5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->c:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->c:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(IIZ)Z
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p3, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p3, 0x1

    .line 6
    if-le p1, p3, :cond_4

    .line 7
    .line 8
    if-gt p2, p3, :cond_1

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {}, Ll/bnl0;->w0()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v1, v1

    .line 20
    const v2, 0x3dcccccd    # 0.1f

    .line 21
    .line 22
    .line 23
    mul-float/2addr v1, v2

    .line 24
    int-to-float v0, v0

    .line 25
    div-float/2addr v1, v0

    .line 26
    int-to-float p2, p2

    .line 27
    mul-float v0, p2, v2

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    div-float/2addr v0, p1

    .line 31
    const/high16 v3, 0x40000000    # 2.0f

    .line 32
    .line 33
    mul-float/2addr v1, v3

    .line 34
    cmpl-float v0, v0, v1

    .line 35
    .line 36
    if-gtz v0, :cond_3

    .line 37
    .line 38
    mul-float/2addr p1, v2

    .line 39
    div-float/2addr p1, p2

    .line 40
    cmpl-float p1, p1, v1

    .line 41
    .line 42
    if-lez p1, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return p0

    .line 46
    :cond_3
    :goto_0
    return p3

    .line 47
    :cond_4
    :goto_1
    return p0
.end method

.method public final g(II)Landroid/graphics/Point;
    .locals 3

    .line 1
    const/high16 p0, 0x430c0000    # 140.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 v0, 0x429e0000    # 79.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x43790000    # 249.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float p1, p1

    .line 20
    const/high16 v2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    mul-float/2addr p1, v2

    .line 23
    int-to-float p2, p2

    .line 24
    div-float/2addr p1, p2

    .line 25
    int-to-float p2, p0

    .line 26
    div-float/2addr p2, p1

    .line 27
    float-to-int p1, p2

    .line 28
    if-lt p1, v0, :cond_0

    .line 29
    .line 30
    if-gt p1, v1, :cond_0

    .line 31
    .line 32
    move v0, p1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    if-ge p1, v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v0, v1

    .line 38
    :goto_0
    new-instance p1, Landroid/graphics/Point;

    .line 39
    .line 40
    invoke-direct {p1, p0, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 41
    .line 42
    .line 43
    return-object p1
.end method

.method public h()V
    .locals 4

    .line 1
    sget v0, Ll/qa00;->h:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    int-to-float v2, v0

    .line 5
    int-to-float v3, v0

    .line 6
    int-to-float v0, v0

    .line 7
    invoke-static {v1, v2, v3, v0}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 20
    .line 21
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/am2;->l()Ll/xlj;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ll/xlj;->a()Ll/wlj;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/wlj;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/wlj;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-virtual {p0, v0}, Ll/wlj;->y(I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->b:Lcom/p1/mobile/putong/core/data/Message;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    new-instance v1, Ll/x0e0;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    sget v2, Ll/ibc0;->r5:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget v2, Ll/ibc0;->q5:I

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object v2, Ll/h1e0;->g:Ll/h1e0;

    .line 52
    .line 53
    invoke-direct {v1, p0, v2}, Ll/x0e0;-><init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    const/4 v1, 0x0

    .line 58
    :goto_1
    invoke-virtual {v0, v1}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->c:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->c:Landroid/widget/ProgressBar;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->j3:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/edc0;->d4:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/ProgressBar;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->c:Landroid/widget/ProgressBar;

    .line 23
    .line 24
    sget v0, Ll/edc0;->Z1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemImages;->e:Landroid/widget/TextView;

    .line 33
    .line 34
    return-void
.end method
