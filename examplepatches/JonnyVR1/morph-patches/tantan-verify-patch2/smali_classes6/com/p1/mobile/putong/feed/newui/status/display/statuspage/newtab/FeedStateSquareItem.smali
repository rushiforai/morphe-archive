.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VDraweeView;

.field public g:Landroid/widget/Space;

.field public h:Landroid/view/View;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/Space;


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

.method public static i0(I)Landroid/graphics/drawable/GradientDrawable;
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

.method public static j0(Ljava/util/List;)Landroid/graphics/drawable/GradientDrawable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/graphics/drawable/GradientDrawable;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gtz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :try_start_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    new-array v1, v1, [I

    .line 20
    .line 21
    move v2, v0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-ge v2, v3, :cond_1

    .line 27
    .line 28
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    aput v3, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x2

    .line 48
    new-array v1, p0, [I

    .line 49
    .line 50
    const-string p0, "#c9bdff"

    .line 51
    .line 52
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    aput p0, v1, v0

    .line 57
    .line 58
    const-string p0, "#cdecff"

    .line 59
    .line 60
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    const/4 v0, 0x1

    .line 65
    aput p0, v1, v0

    .line 66
    .line 67
    :cond_1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 68
    .line 69
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 70
    .line 71
    invoke-direct {p0, v0, v1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 72
    .line 73
    .line 74
    sget v0, Ll/qa00;->i:I

    .line 75
    .line 76
    int-to-float v0, v0

    .line 77
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 78
    .line 79
    .line 80
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->RIGHT_LEFT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 83
    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_2
    :goto_1
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v3i;->a(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Ll/c2i;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->j:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Ll/c2i;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;->nullCheck()V

    .line 17
    .line 18
    .line 19
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->i:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v4, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 34
    .line 35
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 36
    .line 37
    sget v5, Ll/qa00;->n:I

    .line 38
    .line 39
    invoke-virtual {v2, v3, v4, v5, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->j:Lv/VText;

    .line 43
    .line 44
    iget-object v3, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const-string v3, "#ffffff"

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 63
    .line 64
    iget-object v5, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 65
    .line 66
    iget-object v5, v5, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {v5}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->j0(Ljava/util/List;)Landroid/graphics/drawable/GradientDrawable;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ljava/lang/String;

    .line 84
    .line 85
    :try_start_0
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->d:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;

    .line 86
    .line 87
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v5, v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->setContentColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catch_0
    move-exception v2

    .line 96
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->d:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;

    .line 97
    .line 98
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->setContentColor(I)V

    .line 103
    .line 104
    .line 105
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 109
    .line 110
    iget-object v2, v2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 111
    .line 112
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->h:Landroid/view/View;

    .line 117
    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 130
    .line 131
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Ljava/lang/String;

    .line 136
    .line 137
    :try_start_1
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->h:Landroid/view/View;

    .line 138
    .line 139
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->i0(I)Landroid/graphics/drawable/GradientDrawable;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :catch_1
    move-exception v1

    .line 152
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->h:Landroid/view/View;

    .line 153
    .line 154
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    invoke-static {v5}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->i0(I)Landroid/graphics/drawable/GradientDrawable;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 163
    .line 164
    .line 165
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->m:Landroid/view/View;

    .line 169
    .line 170
    const-string v2, "#68de48"

    .line 171
    .line 172
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->i0(I)Landroid/graphics/drawable/GradientDrawable;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->l:Landroid/view/View;

    .line 184
    .line 185
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->i0(I)Landroid/graphics/drawable/GradientDrawable;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    .line 195
    .line 196
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 197
    .line 198
    iget-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 199
    .line 200
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    new-instance v2, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_4

    .line 216
    .line 217
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 218
    .line 219
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->f:Lv/VDraweeView;

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 222
    .line 223
    .line 224
    move-result-object v5

    .line 225
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 226
    .line 227
    .line 228
    move-result-object v5

    .line 229
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v5

    .line 233
    sget v6, Ll/qa00;->A:I

    .line 234
    .line 235
    invoke-virtual {v3, v4, v5, v6, v6}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 236
    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-interface {v3, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ia(Lcom/p1/mobile/putong/data/User;)Z

    .line 243
    .line 244
    .line 245
    move-result v4

    .line 246
    :cond_4
    iget-object v3, p1, Ll/c2i;->d:Ljava/lang/String;

    .line 247
    .line 248
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    if-eqz v3, :cond_5

    .line 253
    .line 254
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    if-eqz v3, :cond_6

    .line 259
    .line 260
    iget-wide v5, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->createdTime:D

    .line 261
    .line 262
    double-to-long v5, v5

    .line 263
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 264
    .line 265
    .line 266
    move-result-wide v7

    .line 267
    invoke-static {v1, v5, v6, v7, v8}, Ll/ksg;->R(Lcom/p1/mobile/putong/data/User;JJ)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    goto :goto_2

    .line 275
    :cond_5
    iget-object v0, p1, Ll/c2i;->d:Ljava/lang/String;

    .line 276
    .line 277
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    :cond_6
    :goto_2
    iget-object v0, p1, Ll/c2i;->e:Ljava/lang/String;

    .line 281
    .line 282
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_8

    .line 287
    .line 288
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-nez v0, :cond_7

    .line 297
    .line 298
    const-string v0, "\u00b7"

    .line 299
    .line 300
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    :cond_7
    iget-object p1, p1, Ll/c2i;->e:Ljava/lang/String;

    .line 304
    .line 305
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->k:Lv/VText;

    .line 309
    .line 310
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 315
    .line 316
    .line 317
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->m:Landroid/view/View;

    .line 318
    .line 319
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 320
    .line 321
    .line 322
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->l:Landroid/view/View;

    .line 323
    .line 324
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 325
    .line 326
    .line 327
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareItem;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
