.class public Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;
.super Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;
.source "SourceFile"


# instance fields
.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lv/VRelative;

.field public f:Lv/VLinear;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Landroidx/legacy/widget/Space;

.field public k:Landroid/view/View;

.field public l:Lv/VDraweeView;

.field public m:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->k(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Ll/y20;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getScaleY()F

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/high16 v0, 0x3f000000    # 0.5f

    .line 8
    .line 9
    cmpg-float p2, p2, v0

    .line 10
    .line 11
    if-gez p2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method private m()V
    .locals 8

    .line 1
    const-string v0, "#000000"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_3

    .line 20
    .line 21
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v2}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const/4 v3, 0x1

    .line 50
    invoke-virtual {v2, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const/16 v4, 0x3e8

    .line 55
    .line 56
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 61
    .line 62
    invoke-virtual {v2, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->i:Landroid/widget/TextView;

    .line 66
    .line 67
    const/4 v4, 0x2

    .line 68
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 69
    .line 70
    .line 71
    :try_start_0
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ljava/lang/String;

    .line 79
    .line 80
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    check-cast v5, Ljava/lang/String;

    .line 87
    .line 88
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->h:Landroid/widget/TextView;

    .line 89
    .line 90
    sget-object v7, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->Y:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->i:Landroid/widget/TextView;

    .line 96
    .line 97
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->h:Landroid/widget/TextView;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->i:Landroid/widget/TextView;

    .line 114
    .line 115
    iget-object v6, v1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->e:Lv/VRelative;

    .line 121
    .line 122
    iget-object v6, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 123
    .line 124
    invoke-static {v6}, Ll/zce;->a(Ljava/util/List;)Landroid/graphics/drawable/GradientDrawable;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->e:Lv/VRelative;

    .line 132
    .line 133
    sget v6, Ll/qa00;->t:I

    .line 134
    .line 135
    invoke-static {v0, v6}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->m:Landroid/view/View;

    .line 139
    .line 140
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->m:Landroid/view/View;

    .line 148
    .line 149
    sget v6, Ll/qa00;->h:I

    .line 150
    .line 151
    invoke-static {v0, v6}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->f:Lv/VLinear;

    .line 155
    .line 156
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->f:Lv/VLinear;

    .line 164
    .line 165
    sget v5, Ll/qa00;->r:I

    .line 166
    .line 167
    invoke-static {v0, v5}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->l:Lv/VDraweeView;

    .line 171
    .line 172
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->k:Landroid/view/View;

    .line 176
    .line 177
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    iget-object v0, v1, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 181
    .line 182
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_2

    .line 187
    .line 188
    iget-object v0, v1, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 189
    .line 190
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-lez v0, :cond_2

    .line 195
    .line 196
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 197
    .line 198
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->l:Lv/VDraweeView;

    .line 199
    .line 200
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 201
    .line 202
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    check-cast v1, Ljava/lang/String;

    .line 207
    .line 208
    sget v4, Ll/qa00;->s:I

    .line 209
    .line 210
    invoke-virtual {v0, v3, v1, v4, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 211
    .line 212
    .line 213
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->k:Landroid/view/View;

    .line 214
    .line 215
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->k:Landroid/view/View;

    .line 223
    .line 224
    sget v0, Ll/qa00;->s:I

    .line 225
    .line 226
    invoke-static {p0, v0}, Ll/zll0;->b(Landroid/view/View;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :catch_0
    move-exception p0

    .line 231
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    :cond_3
    :goto_0
    return-void
.end method

.method private setContentAlpha(Ljava/lang/Float;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpg-float v0, v0, v1

    .line 7
    .line 8
    if-gez v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->f:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->i:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->l:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public c(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->h:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->j:Landroidx/legacy/widget/Space;

    .line 15
    .line 16
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->k:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->l:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->f:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->f:Lv/VLinear;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->i:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;->h(Landroid/view/View;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->i:Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->m:Landroid/view/View;

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public e(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/high16 v2, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v1, v2

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 28
    .line 29
    .line 30
    float-to-double v0, p1

    .line 31
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    .line 32
    .line 33
    sub-double/2addr v0, v2

    .line 34
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 35
    .line 36
    mul-double/2addr v0, v2

    .line 37
    double-to-float v0, v0

    .line 38
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->setContentAlpha(Ljava/lang/Float;)V

    .line 43
    .line 44
    .line 45
    sget v0, Ll/qa00;->L:I

    .line 46
    .line 47
    sget v1, Ll/qa00;->t:I

    .line 48
    .line 49
    sub-int v1, v0, v1

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    mul-float/2addr v1, p1

    .line 53
    float-to-int p1, v1

    .line 54
    sub-int/2addr v0, p1

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->e:Lv/VRelative;

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/zll0;->b(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public getAnimLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a35;->a(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/BaseBubbleItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->h:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->m()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    new-instance v1, Ll/z25;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/z25;-><init>(Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/recyclerview/item/ChatRoomBubbleItemView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
