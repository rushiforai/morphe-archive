.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/FrameLayout;

.field public h:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 68
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    sget-object v0, Ll/shc0;->a:[I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget p2, Ll/shc0;->f:I

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget p3, Ll/shc0;->d:I

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->b:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    sget p3, Ll/shc0;->e:I

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->a:Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    sget p3, Ll/shc0;->b:I

    .line 37
    .line 38
    const/16 v0, 0x14

    .line 39
    .line 40
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    sget v0, Ll/shc0;->c:I

    .line 45
    .line 46
    const/high16 v1, 0x40000000    # 2.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    int-to-float v0, v0

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->h:F

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->b:Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    invoke-virtual {p0, p2, p1, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c(Ljava/lang/String;Landroid/graphics/drawable/Drawable;I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    :cond_0
    move-object v1, v0

    .line 14
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 15
    .line 16
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 17
    .line 18
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x2

    .line 22
    new-array v8, p0, [F

    .line 23
    .line 24
    fill-array-data v8, :array_0

    .line 25
    .line 26
    .line 27
    const-wide/16 v3, 0x1e

    .line 28
    .line 29
    const-wide/16 v5, 0x32

    .line 30
    .line 31
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 36
    .line 37
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 38
    .line 39
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 40
    .line 41
    .line 42
    new-array v8, p0, [F

    .line 43
    .line 44
    fill-array-data v8, :array_1

    .line 45
    .line 46
    .line 47
    const-wide/16 v3, 0x0

    .line 48
    .line 49
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {v0, p0}, [Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f99999a    # 1.2f
    .end array-data

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    :array_1
    .array-data 4
        0x3f99999a    # 1.2f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c(Ljava/lang/String;Landroid/graphics/drawable/Drawable;I)V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/widget/ImageView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 19
    .line 20
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 21
    .line 22
    invoke-direct {v0, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    const/16 v1, 0x11

    .line 26
    .line 27
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 30
    .line 31
    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 37
    .line 38
    invoke-virtual {p0, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Landroid/widget/FrameLayout;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    const/16 v3, 0x8

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 58
    .line 59
    invoke-direct {v2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 60
    .line 61
    .line 62
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 63
    .line 64
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 65
    .line 66
    invoke-virtual {p3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    new-instance p3, Lv/VDraweeView;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-direct {p3, v4}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->f:Lv/VDraweeView;

    .line 79
    .line 80
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->f:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-virtual {p3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    check-cast p3, Ll/wlj;

    .line 90
    .line 91
    sget-object v4, Ll/h1e0;->a:Ll/h1e0;

    .line 92
    .line 93
    invoke-virtual {p3, v4}, Ll/wlj;->w(Ll/h1e0;)V

    .line 94
    .line 95
    .line 96
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->f:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-virtual {p3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    check-cast p3, Ll/wlj;

    .line 103
    .line 104
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {p3, v5}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 109
    .line 110
    .line 111
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 112
    .line 113
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->f:Lv/VDraweeView;

    .line 114
    .line 115
    invoke-virtual {p3, v5, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    .line 117
    .line 118
    new-instance p3, Lv/VDraweeView;

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-direct {p3, v5}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 125
    .line 126
    .line 127
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e:Lv/VDraweeView;

    .line 128
    .line 129
    invoke-virtual {p3, v3}, Landroid/view/View;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e:Lv/VDraweeView;

    .line 133
    .line 134
    invoke-virtual {p3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 135
    .line 136
    .line 137
    move-result-object p3

    .line 138
    check-cast p3, Ll/wlj;

    .line 139
    .line 140
    invoke-virtual {p3, v4}, Ll/wlj;->w(Ll/h1e0;)V

    .line 141
    .line 142
    .line 143
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e:Lv/VDraweeView;

    .line 144
    .line 145
    invoke-virtual {p3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    check-cast p3, Ll/wlj;

    .line 150
    .line 151
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {p3, v3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 156
    .line 157
    .line 158
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 159
    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e:Lv/VDraweeView;

    .line 161
    .line 162
    invoke-virtual {p3, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    .line 164
    .line 165
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 166
    .line 167
    invoke-virtual {p0, p3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    .line 169
    .line 170
    new-instance p3, Landroid/widget/TextView;

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-direct {p3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 177
    .line 178
    .line 179
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 180
    .line 181
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    .line 182
    .line 183
    sget v0, Ll/bnl0;->f:I

    .line 184
    .line 185
    invoke-direct {p3, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 186
    .line 187
    .line 188
    iput v1, p3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 189
    .line 190
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->h:F

    .line 191
    .line 192
    float-to-int v0, v0

    .line 193
    iput v0, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 194
    .line 195
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 196
    .line 197
    const-string v2, "#34000000"

    .line 198
    .line 199
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    const/high16 v3, 0x40000000    # 2.0f

    .line 204
    .line 205
    const/4 v4, 0x0

    .line 206
    invoke-virtual {v0, v3, v4, v3, v2}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 210
    .line 211
    const/high16 v2, 0x41200000    # 10.0f

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 217
    .line 218
    const/4 v2, -0x1

    .line 219
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 228
    .line 229
    invoke-virtual {p0, v0, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 230
    .line 231
    .line 232
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 233
    .line 234
    .line 235
    move-result p3

    .line 236
    if-nez p3, :cond_0

    .line 237
    .line 238
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 239
    .line 240
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    if-eqz p1, :cond_1

    .line 248
    .line 249
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 250
    .line 251
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 252
    .line 253
    .line 254
    :cond_1
    return-void
.end method

.method public final synthetic d(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getDraweeLayout()Landroid/widget/FrameLayout;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    return-object p0
.end method

.method public getDraweeView()Lv/VDraweeView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->g:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->e:Lv/VDraweeView;

    .line 20
    .line 21
    return-object p0
.end method

.method public setImageResource(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/ka4;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ka4;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setThemeType(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->b:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x2

    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->d:Landroid/widget/ImageView;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->a:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->c:Landroid/widget/TextView;

    .line 29
    .line 30
    const/high16 p1, -0x1000000

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method
