.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:I

.field public j:Lcom/p1/mobile/putong/feed/data/Moment;

.field public k:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public l:Ljava/lang/String;

.field public m:I

.field public n:I

.field public o:Z

.field public p:I

.field public q:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->o:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n:I

    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n:I

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->o:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->k(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qch;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final e(F)V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42d00000    # 104.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    int-to-float v1, v0

    .line 13
    mul-float/2addr v1, p1

    .line 14
    const/high16 p1, 0x41c00000    # 24.0f

    .line 15
    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    add-int/2addr p1, v0

    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 28
    .line 29
    iput p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 30
    .line 31
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n:I

    .line 32
    .line 33
    const/4 v3, -0x1

    .line 34
    if-ne p1, v3, :cond_0

    .line 35
    .line 36
    const/high16 p1, 0x42800000    # 64.0f

    .line 37
    .line 38
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    const/high16 p1, 0x41400000    # 12.0f

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_1
    iput p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->f:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 60
    .line 61
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 62
    .line 63
    float-to-int v0, v1

    .line 64
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->f:Lv/VDraweeView;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final f()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x42fa0000    # 125.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-lez v2, :cond_2

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 v1, 0x0

    .line 49
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    iget v3, v2, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 58
    .line 59
    if-lez v3, :cond_2

    .line 60
    .line 61
    iget v2, v2, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 62
    .line 63
    int-to-float v2, v2

    .line 64
    int-to-float v3, v3

    .line 65
    div-float/2addr v2, v3

    .line 66
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e(F)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Landroid/graphics/Point;

    .line 70
    .line 71
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 72
    .line 73
    iget v4, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 74
    .line 75
    iget v3, v3, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 76
    .line 77
    invoke-direct {v2, v4, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v2}, Ll/dmk0;->b(ILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 85
    .line 86
    const-string v3, "raw"

    .line 87
    .line 88
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-nez v2, :cond_2

    .line 93
    .line 94
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-nez v2, :cond_2

    .line 101
    .line 102
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 103
    .line 104
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->f:Lv/VDraweeView;

    .line 105
    .line 106
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 107
    .line 108
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v2, v3, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 118
    .line 119
    const-string v1, "type=\"img\""

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_3

    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 136
    .line 137
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h:Lv/VText;

    .line 141
    .line 142
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g:Lv/VText;

    .line 150
    .line 151
    const/4 v1, 0x2

    .line 152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g:Lv/VText;

    .line 156
    .line 157
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->q:Ljava/lang/String;

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 165
    .line 166
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 167
    .line 168
    const-string v2, "moments_user_id"

    .line 169
    .line 170
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    filled-new-array {v1}, [Ll/pf60;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v2, "e_moment_christmas"

    .line 179
    .line 180
    invoke-static {v2, v0, v1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g:Lv/VText;

    .line 185
    .line 186
    const v1, 0x7fffffff

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h:Lv/VText;

    .line 193
    .line 194
    const-string v1, "\u70b9\u51fb\u67e5\u770b"

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 200
    .line 201
    new-instance v1, Ll/och;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/och;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;

    .line 210
    .line 211
    new-instance v1, Ll/pch;

    .line 212
    .line 213
    invoke-direct {v1, p0}, Ll/pch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->i()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "type=\"img\""

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->q:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "moments_user_id"

    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    filled-new-array {p0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v1, "e_moment_christmas"

    .line 49
    .line 50
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final h()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->q:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "1"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "0"

    .line 13
    .line 14
    :goto_0
    const-string v2, "qa_optional"

    .line 15
    .line 16
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    :goto_1
    const-string v1, ""

    .line 48
    .line 49
    :goto_2
    const-string v2, "topic_id"

    .line 50
    .line 51
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, "moment_id"

    .line 60
    .line 61
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 68
    .line 69
    const-string v2, "owner_id"

    .line 70
    .line 71
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->m:I

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "order"

    .line 82
    .line 83
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const-string v2, "moment_type"

    .line 98
    .line 99
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 104
    .line 105
    invoke-static {v1}, Ll/ksg;->G(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v1

    .line 109
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "moment_distance"

    .line 114
    .line 115
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 120
    .line 121
    invoke-static {v1}, Ll/ksg;->F(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 122
    .line 123
    .line 124
    move-result-wide v1

    .line 125
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    const-string v2, "moment_create_time"

    .line 130
    .line 131
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object v10

    .line 135
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v1, p0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {p0}, Ll/ksg;->S(Lcom/p1/mobile/putong/data/User;)J

    .line 146
    .line 147
    .line 148
    move-result-wide v1

    .line 149
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string v1, "owner_active_time"

    .line 154
    .line 155
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v11

    .line 159
    filled-new-array/range {v3 .. v11}, [Ll/pf60;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-string v1, "e_moment"

    .line 164
    .line 165
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public final i()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->q:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "activity_id"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 32
    .line 33
    const-string v3, "activity_name"

    .line 34
    .line 35
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "moment_show_type"

    .line 40
    .line 41
    const-string v4, "card"

    .line 42
    .line 43
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 50
    .line 51
    const-string v4, "moments_user_id"

    .line 52
    .line 53
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {v1, v2, v3, p0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v1, "e_activity_moment"

    .line 62
    .line 63
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g:Lv/VText;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/16 p0, 0x8

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    const-string v2, "\u6d3b\u52a8"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    const/high16 v2, 0x41200000    # 10.0f

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/4 v3, 0x1

    .line 47
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 48
    .line 49
    .line 50
    const-string v2, "#ffffff"

    .line 51
    .line 52
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    const/high16 v2, 0x41600000    # 14.0f

    .line 60
    .line 61
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setHeight(I)V

    .line 66
    .line 67
    .line 68
    const/high16 v2, 0x40800000    # 4.0f

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-virtual {v1, v4, v0, v2, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 79
    .line 80
    .line 81
    const/16 v2, 0x11

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 84
    .line 85
    .line 86
    sget v2, Ll/lbc0;->x:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v3}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-virtual {v1, v2, v4}, Landroid/view/View;->measure(II)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    invoke-virtual {v1, v0, v0, v2, v4}, Landroid/view/View;->layout(IIII)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    new-instance v2, Landroid/text/SpannableString;

    .line 121
    .line 122
    new-instance v4, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v5, "   "

    .line 125
    .line 126
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 130
    .line 131
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-direct {v2, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    new-instance v4, Ll/otg;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    invoke-direct {v4, v5, v1}, Ll/otg;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 150
    .line 151
    .line 152
    const/16 v1, 0x21

    .line 153
    .line 154
    invoke-virtual {v2, v4, v0, v3, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g:Lv/VText;

    .line 158
    .line 159
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p1, p0}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "type=\"img\""

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 51
    .line 52
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    const-class v1, Landroid/text/style/URLSpan;

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-virtual {v0, v2, p1, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, [Landroid/text/style/URLSpan;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    aget-object p1, p1, v2

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string v1, ""

    .line 83
    .line 84
    invoke-static {p0, v1, p1}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 103
    .line 104
    const-string v0, "tantan"

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_2

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p1, p0}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->k4:I

    .line 145
    .line 146
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v0, v1, p0}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->o:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->l:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->s(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    :goto_0
    return-void

    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public m(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IILjava/lang/String;)V
    .locals 0

    .line 1
    iput p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n:I

    .line 2
    .line 3
    move-object p5, p6

    .line 4
    const/4 p6, 0x0

    .line 5
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->n(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 3

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->l:Ljava/lang/String;

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->i:I

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->k:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 8
    .line 9
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->m:I

    .line 10
    .line 11
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->q:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->f()V

    .line 14
    .line 15
    .line 16
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const/4 p5, 0x2

    .line 23
    const/4 p6, 0x0

    .line 24
    if-nez p3, :cond_2

    .line 25
    .line 26
    if-ne p1, p5, :cond_2

    .line 27
    .line 28
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->b:Lv/VLinear;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 37
    .line 38
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->i2:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d:Lv/VText;

    .line 49
    .line 50
    if-eqz p3, :cond_0

    .line 51
    .line 52
    invoke-static {v1, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->c:Landroid/widget/TextView;

    .line 56
    .line 57
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->c:Landroid/widget/TextView;

    .line 63
    .line 64
    const/high16 v0, 0x425c0000    # 55.0f

    .line 65
    .line 66
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 71
    .line 72
    const/high16 v1, 0x41880000    # 17.0f

    .line 73
    .line 74
    invoke-static {p3, v0, p2, v1}, Ll/cai;->f(Landroid/widget/TextView;ILjava/lang/String;F)F

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 86
    .line 87
    const-string p3, "/"

    .line 88
    .line 89
    invoke-virtual {p2, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->c:Landroid/widget/TextView;

    .line 94
    .line 95
    const/high16 v1, 0x41a00000    # 20.0f

    .line 96
    .line 97
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 98
    .line 99
    .line 100
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->c:Landroid/widget/TextView;

    .line 101
    .line 102
    aget-object v1, p2, p6

    .line 103
    .line 104
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d:Lv/VText;

    .line 108
    .line 109
    aget-object p2, p2, v0

    .line 110
    .line 111
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->c:Landroid/widget/TextView;

    .line 115
    .line 116
    if-nez p4, :cond_1

    .line 117
    .line 118
    const/high16 p3, 0x41c00000    # 24.0f

    .line 119
    .line 120
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result p4

    .line 124
    invoke-static {p2, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d:Lv/VText;

    .line 128
    .line 129
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result p3

    .line 133
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 134
    .line 135
    .line 136
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 137
    .line 138
    const/high16 p3, 0x41e00000    # 28.0f

    .line 139
    .line 140
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 141
    .line 142
    .line 143
    move-result p3

    .line 144
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_1
    const/high16 p3, 0x40800000    # 4.0f

    .line 149
    .line 150
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    neg-int p4, p4

    .line 155
    invoke-static {p2, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 156
    .line 157
    .line 158
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d:Lv/VText;

    .line 159
    .line 160
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 161
    .line 162
    .line 163
    move-result p3

    .line 164
    neg-int p3, p3

    .line 165
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 166
    .line 167
    .line 168
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 169
    .line 170
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->p:I

    .line 171
    .line 172
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->b:Lv/VLinear;

    .line 177
    .line 178
    invoke-static {p2, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 182
    .line 183
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->p:I

    .line 184
    .line 185
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 186
    .line 187
    .line 188
    :goto_1
    if-ne p1, p5, :cond_3

    .line 189
    .line 190
    const/high16 p1, 0x41800000    # 16.0f

    .line 191
    .line 192
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 193
    .line 194
    .line 195
    move-result p6

    .line 196
    goto :goto_2

    .line 197
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 202
    .line 203
    if-eqz p1, :cond_4

    .line 204
    .line 205
    const/high16 p1, 0x41000000    # 8.0f

    .line 206
    .line 207
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result p6

    .line 211
    :cond_4
    :goto_2
    invoke-static {p0, p6}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->e:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->p:I

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/4 v2, 0x1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->g:Lv/VText;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->h:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public setNeedInnerClick(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->o:Z

    .line 2
    .line 3
    return-void
.end method
