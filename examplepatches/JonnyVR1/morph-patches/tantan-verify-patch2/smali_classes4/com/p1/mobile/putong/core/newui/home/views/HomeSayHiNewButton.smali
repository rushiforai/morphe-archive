.class public Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/bvl;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;

.field public b:Lv/VFrame_FlipContainer;

.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lv/VFrame_FlipContainer;

.field public h:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public k:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Lcom/tantan/library/svga/SVGAnimationView;

.field public n:Lv/VText;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "default"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->o:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->p:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->p:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->o:Ljava/lang/String;

    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->p:Ljava/lang/Boolean;

    return-void
.end method

.method private d()V
    .locals 4

    .line 1
    invoke-static {}, Ll/vnb;->s1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeWarpLayout()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 27
    .line 28
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeWarpLayout()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 54
    .line 55
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 81
    .line 82
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeLayout()Lv/VFrame_FlipContainer;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getButtonRadius()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    int-to-float v1, v1

    .line 100
    invoke-virtual {v0, v1}, Lv/VFrame_FlipContainer;->setRoundRadius(F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getUndoLayout()Lv/VFrame_FlipContainer;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getUndoLayout()Lv/VFrame_FlipContainer;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getButtonRadius()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    int-to-float p0, p0

    .line 122
    invoke-virtual {v0, p0}, Lv/VFrame_FlipContainer;->setRoundRadius(F)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeWarpLayout()Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    const/high16 v2, 0x42400000    # 48.0f

    .line 141
    .line 142
    const/4 v3, 0x0

    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 150
    .line 151
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeWarpLayout()Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 169
    .line 170
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_5

    .line 175
    .line 176
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 181
    .line 182
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    .line 190
    .line 191
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 200
    .line 201
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_6

    .line 206
    .line 207
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 212
    .line 213
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    .line 221
    .line 222
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeLayout()Lv/VFrame_FlipContainer;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v0, v3}, Lv/VFrame_FlipContainer;->setRoundRadius(F)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getUndoLayout()Lv/VFrame_FlipContainer;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_7

    .line 238
    .line 239
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getUndoLayout()Lv/VFrame_FlipContainer;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-virtual {p0, v3}, Lv/VFrame_FlipContainer;->setRoundRadius(F)V

    .line 244
    .line 245
    .line 246
    :cond_7
    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->p:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/a6l;->INSTANCE:Ll/a6l;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->o:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->p:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/a6l;->a(Landroid/content/Context;Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/obl;->a(Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic getButtonRadius()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getButtonRadius()I

    move-result p0

    return p0
.end method

.method public getButtonRootLayout()Landroid/view/ViewGroup;
    .locals 0

    return-object p0
.end method

.method public bridge synthetic getButtonScrolledDistance()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getButtonScrolledDistance()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getButtonsRightLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getButtonsRightLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getDislikeBtn()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getDislikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getDislikePressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getDislikePressBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getImmediatelyAndSuperLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyAndSuperLikeLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getImmediatelyMatch()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyMatch()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getImmediatelyMatchButton()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyMatchButton()Ll/avl;

    move-result-object p0

    return-object p0
.end method

.method public getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getLikeBtn()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getLikeBtn()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getLikePressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getLikePressBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getNormalBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getNormalBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getOperationBtnBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getOperationBtnBg()I

    move-result p0

    return p0
.end method

.method public bridge synthetic getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getPinImage()Lv/VImage;

    move-result-object p0

    return-object p0
.end method

.method public getPinLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getPinText()Lv/VText;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public getSayHiNewLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLike()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getSuperLike()Ll/avl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getSuperLike()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->g:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getSuperLikePressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getSuperLikePressBg()I

    move-result p0

    return p0
.end method

.method public getSuperLikeRemaining()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->i:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeWarpLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndo()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    return-object p0
.end method

.method public bridge synthetic getUndo()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->getUndo()Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getUndoLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->b:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getUndoPressBg()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bvl;->getUndoPressBg()I

    move-result p0

    return p0
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->d()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->n:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setButtonStyleType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic setSuperLikeBtnGray(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/bvl;->setSuperLikeBtnGray(Z)V

    return-void
.end method

.method public setSuperLikeComboIsSlowly(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->p:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeSayHiNewButton;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
