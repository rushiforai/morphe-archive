.class public Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;
.super Lv/VFrame_Shadow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;
    }
.end annotation


# instance fields
.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VText;

.field public m:Lv/VImage;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 7
    .line 8
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

    .line 9
    invoke-direct {p0, p1, p2}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

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

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame_Shadow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    return-void
.end method


# virtual methods
.method public getUser()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->n:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i0g;->a(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->m:Lv/VImage;

    .line 2
    .line 3
    sget v0, Ll/gbc0;->f2:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/data/User;J)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->HIDE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeCardInfo;->cardTypes:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SwipeCardInfo;->cardTypes:Ljava/util/List;

    .line 47
    .line 48
    const-string v3, "newLikeAfterVerification"

    .line 49
    .line 50
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->VERIFY:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 61
    .line 62
    const-string p2, "\u6765\u81ea\u9080\u8bf7\u8ba4\u8bc1"

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 68
    .line 69
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 75
    .line 76
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 77
    .line 78
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 79
    .line 80
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_0

    .line 85
    .line 86
    sget p2, Ll/gbc0;->l2:I

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    sget p2, Ll/gbc0;->k2:I

    .line 90
    .line 91
    :goto_0
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 95
    .line 96
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 97
    .line 98
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 99
    .line 100
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-eqz p2, :cond_1

    .line 105
    .line 106
    sget p2, Ll/gbc0;->h2:I

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    sget p2, Ll/gbc0;->g2:I

    .line 110
    .line 111
    :goto_1
    invoke-virtual {p1, p2, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 115
    .line 116
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    sget-object p2, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->SUPER_LIKE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 127
    .line 128
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 129
    .line 130
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 131
    .line 132
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 136
    .line 137
    sget p3, Ll/gbc0;->m2:I

    .line 138
    .line 139
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 143
    .line 144
    sget p3, Ll/gbc0;->e2:I

    .line 145
    .line 146
    invoke-virtual {p2, p3, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sf()Z

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    if-eqz p2, :cond_3

    .line 162
    .line 163
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 164
    .line 165
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    if-eqz p2, :cond_3

    .line 170
    .line 171
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 172
    .line 173
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 174
    .line 175
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-eqz p2, :cond_3

    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 190
    .line 191
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 192
    .line 193
    iget-object p3, p3, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 194
    .line 195
    invoke-interface {p2, p3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hl(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result p2

    .line 199
    if-le p2, v2, :cond_3

    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 204
    .line 205
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 208
    .line 209
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    const-string p2, "\u8d85\u7ea7\u559c\u6b22x%s"

    .line 214
    .line 215
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 224
    .line 225
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_4

    .line 230
    .line 231
    const-string p1, "\u5979"

    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_4
    const-string p1, "\u4ed6"

    .line 235
    .line 236
    :goto_2
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    const-string p2, "%s\u8d85\u7ea7\u559c\u6b22\u4f60"

    .line 241
    .line 242
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_5
    const-wide/16 v3, 0x0

    .line 251
    .line 252
    cmp-long v0, p2, v3

    .line 253
    .line 254
    if-eqz v0, :cond_6

    .line 255
    .line 256
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 257
    .line 258
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-eqz v0, :cond_6

    .line 263
    .line 264
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 265
    .line 266
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 267
    .line 268
    const-wide/16 v5, 0x0

    .line 269
    .line 270
    cmpl-double p1, v3, v5

    .line 271
    .line 272
    if-eqz p1, :cond_6

    .line 273
    .line 274
    long-to-double p1, p2

    .line 275
    cmpg-double p1, p1, v3

    .line 276
    .line 277
    if-gez p1, :cond_6

    .line 278
    .line 279
    sget-object p1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->NEW_LIKE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 280
    .line 281
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 282
    .line 283
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 284
    .line 285
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 286
    .line 287
    .line 288
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 289
    .line 290
    const-string p2, "\u65b0\u559c\u6b22"

    .line 291
    .line 292
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 293
    .line 294
    .line 295
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 296
    .line 297
    sget p2, Ll/gbc0;->k2:I

    .line 298
    .line 299
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 300
    .line 301
    .line 302
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 303
    .line 304
    sget p1, Ll/gbc0;->d2:I

    .line 305
    .line 306
    invoke-virtual {p0, p1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 307
    .line 308
    .line 309
    :cond_6
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;J)V
    .locals 5

    return-void

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->n:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->h:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x3

    .line 20
    const/16 v4, 0x64

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->l:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p1, v1}, Ll/yie0;->i(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->k:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-static {p1}, Ll/yie0;->q(Lcom/p1/mobile/putong/data/User;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->j(Lcom/p1/mobile/putong/data/User;J)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    return-void

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->n:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->h:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, 0x4

    .line 20
    const/16 v4, 0x23

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->l:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {p1, v1}, Ll/yie0;->i(Lcom/p1/mobile/putong/data/User;Landroid/content/Context;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->k:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-static {p1}, Ll/yie0;->q(Lcom/p1/mobile/putong/data/User;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    int-to-float p2, p2

    .line 6
    const v0, 0x3faa3d71    # 1.33f

    .line 7
    .line 8
    .line 9
    mul-float/2addr p2, v0

    .line 10
    float-to-int p2, p2

    .line 11
    const/high16 v0, 0x40000000    # 2.0f

    .line 12
    .line 13
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->j:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    invoke-static {}, Ll/bnl0;->y0()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    div-int/lit8 p2, p2, 0x2

    .line 33
    .line 34
    sget v0, Ll/qa00;->j:I

    .line 35
    .line 36
    sub-int/2addr p2, v0

    .line 37
    int-to-double v0, p2

    .line 38
    const-wide v2, 0x3ff547ae147ae148L    # 1.33

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    mul-double/2addr v0, v2

    .line 44
    const-wide v2, 0x3fd851eb80000000L    # 0.3799999952316284

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    mul-double/2addr v0, v2

    .line 50
    double-to-int p2, v0

    .line 51
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 52
    .line 53
    if-eq v0, p2, :cond_0

    .line 54
    .line 55
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->j:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public setNewLikesBadgesText(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->o:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;->NEW_LIKE:Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem$LikeLabelType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;->i:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
