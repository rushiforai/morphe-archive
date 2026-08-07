.class public Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VLinear;

.field public e:Lv/VDraweeView;

.field public f:Lv/VLinear;

.field public g:Lv/VDraweeView;

.field public h:Lv/VLinear;

.field public i:Lv/VDraweeView;


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

.method public static synthetic h0(Lv/VDraweeView;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 6
    .line 7
    const/high16 v1, 0x41a00000    # 20.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic i0(Lv/VLinear;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 6
    .line 7
    const/high16 v1, 0x41c00000    # 24.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "#C2D4FF"

    .line 25
    .line 26
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->m0(I)Landroid/graphics/drawable/GradientDrawable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static m0(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 1
    .param p0    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y9i;->a(Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 2
    .line 3
    const/high16 v1, 0x41600000    # 14.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 13
    .line 14
    const/high16 v0, 0x41e80000    # 29.0f

    .line 15
    .line 16
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 4
    .line 5
    filled-new-array {v0, v1, v1}, [Lv/VLinear;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/w9i;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/w9i;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->g:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->i:Lv/VDraweeView;

    .line 26
    .line 27
    filled-new-array {v0, v1, v2}, [Lv/VDraweeView;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/x9i;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/x9i;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 44
    .line 45
    const/high16 v1, 0x41800000    # 16.0f

    .line 46
    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 55
    .line 56
    const/high16 v0, 0x42040000    # 33.0f

    .line 57
    .line 58
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public n0(Ljava/util/List;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 v0, 0x2

    .line 25
    const/4 v2, 0x1

    .line 26
    if-eqz p2, :cond_3

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    const/high16 v3, 0x41a00000    # 20.0f

    .line 33
    .line 34
    if-eq p2, v2, :cond_2

    .line 35
    .line 36
    if-eq p2, v0, :cond_1

    .line 37
    .line 38
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    invoke-virtual {p2, v4, v1, v5, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 57
    .line 58
    .line 59
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->g:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    invoke-virtual {p2, v1, v4, v5, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 78
    .line 79
    .line 80
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->i:Lv/VDraweeView;

    .line 83
    .line 84
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {p2, v1, p1, v0, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 102
    .line 103
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 107
    .line 108
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 112
    .line 113
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 120
    .line 121
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    check-cast v4, Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    invoke-virtual {p2, v0, v4, v5, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 136
    .line 137
    .line 138
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->g:Lv/VDraweeView;

    .line 141
    .line 142
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    invoke-virtual {p2, v0, p1, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 160
    .line 161
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 165
    .line 166
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 170
    .line 171
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_2
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 178
    .line 179
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    check-cast p1, Ljava/lang/String;

    .line 184
    .line 185
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    invoke-virtual {p2, v0, p1, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 197
    .line 198
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 202
    .line 203
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 204
    .line 205
    .line 206
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 207
    .line 208
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 213
    .line 214
    .line 215
    move-result p2

    .line 216
    if-eq p2, v2, :cond_f

    .line 217
    .line 218
    if-eq p2, v0, :cond_a

    .line 219
    .line 220
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 221
    .line 222
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    check-cast v3, Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {p2, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 233
    .line 234
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    check-cast v4, Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v3, v4}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 245
    .line 246
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    check-cast p1, Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v4, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    if-nez p2, :cond_4

    .line 257
    .line 258
    if-nez v3, :cond_4

    .line 259
    .line 260
    if-nez p1, :cond_4

    .line 261
    .line 262
    goto/16 :goto_3

    .line 263
    .line 264
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    .line 265
    .line 266
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v5

    .line 273
    if-eqz v5, :cond_5

    .line 274
    .line 275
    invoke-interface {v4, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    :cond_5
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result p2

    .line 282
    if-eqz p2, :cond_6

    .line 283
    .line 284
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    :cond_6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result p2

    .line 291
    if-eqz p2, :cond_7

    .line 292
    .line 293
    invoke-interface {v4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    :cond_7
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    if-ne p1, v2, :cond_8

    .line 301
    .line 302
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 303
    .line 304
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 305
    .line 306
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 311
    .line 312
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    invoke-virtual {p1, p2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 321
    .line 322
    .line 323
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 324
    .line 325
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 326
    .line 327
    .line 328
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 329
    .line 330
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 331
    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 334
    .line 335
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 336
    .line 337
    .line 338
    :cond_8
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    if-ne p1, v0, :cond_9

    .line 343
    .line 344
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 345
    .line 346
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 347
    .line 348
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v3

    .line 352
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 353
    .line 354
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    invoke-virtual {p1, p2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 363
    .line 364
    .line 365
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 366
    .line 367
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->g:Lv/VDraweeView;

    .line 368
    .line 369
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 374
    .line 375
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-virtual {p1, p2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 384
    .line 385
    .line 386
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 387
    .line 388
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 389
    .line 390
    .line 391
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 392
    .line 393
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 394
    .line 395
    .line 396
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 397
    .line 398
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 399
    .line 400
    .line 401
    :cond_9
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    const/4 p2, 0x3

    .line 406
    if-ne p1, p2, :cond_10

    .line 407
    .line 408
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 409
    .line 410
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 411
    .line 412
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 417
    .line 418
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    invoke-virtual {p1, p2, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 427
    .line 428
    .line 429
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 430
    .line 431
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->g:Lv/VDraweeView;

    .line 432
    .line 433
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 438
    .line 439
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 444
    .line 445
    .line 446
    move-result-object v1

    .line 447
    invoke-virtual {p1, p2, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 448
    .line 449
    .line 450
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 451
    .line 452
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->i:Lv/VDraweeView;

    .line 453
    .line 454
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 459
    .line 460
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    invoke-virtual {p1, p2, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 469
    .line 470
    .line 471
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 472
    .line 473
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 474
    .line 475
    .line 476
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 477
    .line 478
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 479
    .line 480
    .line 481
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 482
    .line 483
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 484
    .line 485
    .line 486
    return-void

    .line 487
    :cond_a
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 488
    .line 489
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    check-cast v0, Ljava/lang/String;

    .line 494
    .line 495
    invoke-virtual {p2, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 496
    .line 497
    .line 498
    move-result-object p2

    .line 499
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 500
    .line 501
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object p1

    .line 505
    check-cast p1, Ljava/lang/String;

    .line 506
    .line 507
    invoke-virtual {v0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 508
    .line 509
    .line 510
    move-result-object p1

    .line 511
    if-nez p2, :cond_b

    .line 512
    .line 513
    if-nez p1, :cond_b

    .line 514
    .line 515
    goto :goto_3

    .line 516
    :cond_b
    if-eqz p2, :cond_d

    .line 517
    .line 518
    if-nez p1, :cond_c

    .line 519
    .line 520
    goto :goto_0

    .line 521
    :cond_c
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 522
    .line 523
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 524
    .line 525
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 526
    .line 527
    .line 528
    move-result-object p1

    .line 529
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 530
    .line 531
    .line 532
    move-result-object p1

    .line 533
    invoke-virtual {v0, v3, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 534
    .line 535
    .line 536
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 537
    .line 538
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->g:Lv/VDraweeView;

    .line 539
    .line 540
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 541
    .line 542
    .line 543
    move-result-object p2

    .line 544
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 545
    .line 546
    .line 547
    move-result-object p2

    .line 548
    invoke-virtual {p1, v0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 549
    .line 550
    .line 551
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 552
    .line 553
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 554
    .line 555
    .line 556
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 557
    .line 558
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 559
    .line 560
    .line 561
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 562
    .line 563
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 564
    .line 565
    .line 566
    return-void

    .line 567
    :cond_d
    :goto_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 568
    .line 569
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 570
    .line 571
    if-nez p2, :cond_e

    .line 572
    .line 573
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 574
    .line 575
    .line 576
    move-result-object p1

    .line 577
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 578
    .line 579
    .line 580
    move-result-object p1

    .line 581
    goto :goto_2

    .line 582
    :cond_e
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    goto :goto_1

    .line 587
    :goto_2
    invoke-virtual {v0, v3, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 588
    .line 589
    .line 590
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 591
    .line 592
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 593
    .line 594
    .line 595
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 596
    .line 597
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 598
    .line 599
    .line 600
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 601
    .line 602
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 603
    .line 604
    .line 605
    return-void

    .line 606
    :cond_f
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 607
    .line 608
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 609
    .line 610
    .line 611
    move-result-object p1

    .line 612
    check-cast p1, Ljava/lang/String;

    .line 613
    .line 614
    invoke-virtual {p2, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 615
    .line 616
    .line 617
    move-result-object p1

    .line 618
    if-nez p1, :cond_11

    .line 619
    .line 620
    :cond_10
    :goto_3
    return-void

    .line 621
    :cond_11
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 622
    .line 623
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->e:Lv/VDraweeView;

    .line 624
    .line 625
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 626
    .line 627
    .line 628
    move-result-object p1

    .line 629
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 630
    .line 631
    .line 632
    move-result-object p1

    .line 633
    invoke-virtual {p2, v0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 634
    .line 635
    .line 636
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->d:Lv/VLinear;

    .line 637
    .line 638
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 639
    .line 640
    .line 641
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->f:Lv/VLinear;

    .line 642
    .line 643
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 644
    .line 645
    .line 646
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->h:Lv/VLinear;

    .line 647
    .line 648
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 649
    .line 650
    .line 651
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
