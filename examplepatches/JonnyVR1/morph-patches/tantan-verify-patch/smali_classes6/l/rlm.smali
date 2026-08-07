.class public Ll/rlm;
.super Ll/di5;
.source "SourceFile"


# instance fields
.field public k:Ll/fmm;

.field public l:Z

.field public m:Lcom/p1/mobile/putong/data/Links;

.field public final n:Lcom/p1/mobile/android/app/Act;

.field public final o:Ll/n570;

.field public p:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final q:Ljava/lang/String;

.field public final r:Z

.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ll/fmm;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/di5;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/rlm;->l:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/rlm;->r:Z

    .line 8
    .line 9
    iput-object p2, p0, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iput-object p3, p0, Ll/rlm;->o:Ll/n570;

    .line 12
    .line 13
    iput-object p4, p0, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iput-object p5, p0, Ll/rlm;->q:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p6, p0, Ll/rlm;->k:Ll/fmm;

    .line 18
    .line 19
    iput-object p7, p0, Ll/rlm;->s:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rlm;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/tec0;->e:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 18
    .line 19
    const/high16 p1, 0x42700000    # 60.0f

    .line 20
    .line 21
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const/4 v0, 0x5

    .line 35
    if-ne p2, v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget p2, Ll/tec0;->q1:I

    .line 44
    .line 45
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    const/4 v0, 0x4

    .line 51
    if-ne p2, v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget p2, Ll/tec0;->a2:I

    .line 60
    .line 61
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_2
    iget-object p0, p0, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    const/4 v0, 0x3

    .line 69
    if-ne p2, v0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget p2, Ll/tec0;->c2:I

    .line 76
    .line 77
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget p2, Ll/tec0;->p5:I

    .line 87
    .line 88
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v10, p2

    .line 6
    .line 7
    move/from16 v11, p3

    .line 8
    .line 9
    const/4 v12, 0x3

    .line 10
    const/4 v13, 0x4

    .line 11
    const/4 v14, 0x1

    .line 12
    if-ne v11, v14, :cond_0

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    .line 15
    .line 16
    iget-object v2, v1, Ll/rlm;->o:Ll/n570;

    .line 17
    .line 18
    iget-object v3, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v4, v1, Ll/rlm;->k:Ll/fmm;

    .line 21
    .line 22
    iget-object v4, v4, Ll/fmm;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v2, v10, v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;->u(Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    move-object v3, v10

    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_0
    const/4 v2, 0x5

    .line 31
    if-ne v11, v2, :cond_1

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;

    .line 34
    .line 35
    iget-object v2, v1, Ll/rlm;->o:Ll/n570;

    .line 36
    .line 37
    iget-object v3, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v4, v1, Ll/rlm;->k:Ll/fmm;

    .line 40
    .line 41
    iget-object v4, v4, Ll/fmm;->j:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v5, v10, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 44
    .line 45
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v5}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    iget-object v7, v10, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 52
    .line 53
    iget-object v8, v7, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v9, v1, Ll/di5;->g:Ljava/util/Map;

    .line 56
    .line 57
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v9, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    check-cast v7, Ljava/lang/Boolean;

    .line 64
    .line 65
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    add-int/lit8 v9, p4, -0x1

    .line 70
    .line 71
    move-object v15, v2

    .line 72
    move-object v2, v1

    .line 73
    move-object v1, v15

    .line 74
    move-object v15, v8

    .line 75
    move v8, v7

    .line 76
    move-object v7, v15

    .line 77
    invoke-virtual/range {v0 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailExpandBottomView;->l(Ll/n570;Ll/di5;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Ljava/lang/String;ZI)V

    .line 78
    .line 79
    .line 80
    move-object v1, v2

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    if-ne v11, v13, :cond_2

    .line 83
    .line 84
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;

    .line 85
    .line 86
    invoke-virtual {v0, v14}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->setIsFromImmersionVideo(Z)V

    .line 87
    .line 88
    .line 89
    iget-object v2, v1, Ll/rlm;->o:Ll/n570;

    .line 90
    .line 91
    iget-object v4, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, v1, Ll/rlm;->k:Ll/fmm;

    .line 94
    .line 95
    iget-object v5, v3, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 96
    .line 97
    iget-object v6, v1, Ll/rlm;->s:Ljava/lang/String;

    .line 98
    .line 99
    move-object v3, v10

    .line 100
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->q0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    move-object/from16 v3, p2

    .line 104
    .line 105
    goto/16 :goto_2

    .line 106
    .line 107
    :cond_2
    if-ne v11, v12, :cond_3

    .line 108
    .line 109
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentParentDetailsView;

    .line 110
    .line 111
    invoke-virtual {v0, v14}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->setIsFromImmersionVideo(Z)V

    .line 112
    .line 113
    .line 114
    iget-object v2, v1, Ll/rlm;->o:Ll/n570;

    .line 115
    .line 116
    iget-object v4, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v3, v1, Ll/rlm;->k:Ll/fmm;

    .line 119
    .line 120
    iget-object v5, v3, Ll/fmm;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 121
    .line 122
    iget-object v6, v1, Ll/rlm;->s:Ljava/lang/String;

    .line 123
    .line 124
    move-object/from16 v3, p2

    .line 125
    .line 126
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->q0(Ll/di5;Ll/n570;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    goto/16 :goto_2

    .line 130
    .line 131
    :cond_3
    move-object/from16 v3, p2

    .line 132
    .line 133
    const/4 v2, 0x2

    .line 134
    if-ne v11, v2, :cond_8

    .line 135
    .line 136
    iget-boolean v2, v1, Ll/rlm;->l:Z

    .line 137
    .line 138
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 142
    .line 143
    iget-object v2, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    if-eqz v2, :cond_4

    .line 158
    .line 159
    iget-object v2, v1, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 160
    .line 161
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->a4:I

    .line 162
    .line 163
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    goto :goto_1

    .line 168
    :cond_4
    const-string v2, "feed"

    .line 169
    .line 170
    iget-object v4, v1, Ll/rlm;->s:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-eqz v2, :cond_6

    .line 177
    .line 178
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 179
    .line 180
    iget-object v4, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v2, v4}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-eqz v2, :cond_5

    .line 191
    .line 192
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 193
    .line 194
    iget-object v4, v1, Ll/rlm;->q:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v2, v4}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-eqz v2, :cond_5

    .line 205
    .line 206
    const-string v2, "\u6682\u65f6\u6ca1\u6709\u8bc4\u8bba\uff0c\u6765\u548c\u5979\u4e92\u52a8\u4e00\u4e0b\u5427\uff5e"

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_5
    const-string v2, "\u6682\u65f6\u6ca1\u6709\u8bc4\u8bba\uff0c\u6765\u548c\u4ed6\u4e92\u52a8\u4e00\u4e0b\u5427\uff5e"

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_6
    const-string v2, "\u6682\u65f6\u6ca1\u6709\u8bc4\u8bba\uff0c\u5feb\u6765\u4e92\u52a8\u4e00\u4e0b\u5427\uff01"

    .line 213
    .line 214
    :goto_1
    iget-boolean v4, v1, Ll/rlm;->r:Z

    .line 215
    .line 216
    if-eqz v4, :cond_7

    .line 217
    .line 218
    iget-object v2, v1, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 219
    .line 220
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 221
    .line 222
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    :cond_7
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 227
    .line 228
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 232
    .line 233
    sget v4, Ll/lbc0;->j1:I

    .line 234
    .line 235
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 236
    .line 237
    .line 238
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 239
    .line 240
    iget-object v4, v1, Ll/rlm;->n:Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    sget v5, Ll/k9c0;->m0:I

    .line 247
    .line 248
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 249
    .line 250
    .line 251
    move-result v4

    .line 252
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 253
    .line 254
    .line 255
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 256
    .line 257
    invoke-static {v0, v14}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 258
    .line 259
    .line 260
    :cond_8
    :goto_2
    if-eq v11, v14, :cond_a

    .line 261
    .line 262
    if-eq v11, v13, :cond_a

    .line 263
    .line 264
    if-ne v11, v12, :cond_9

    .line 265
    .line 266
    goto :goto_3

    .line 267
    :cond_9
    return-void

    .line 268
    :cond_a
    :goto_3
    const-string v0, "comment_user_id"

    .line 269
    .line 270
    iget-object v2, v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {v0, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iget-object v2, v1, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 277
    .line 278
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 279
    .line 280
    const-string v4, "owner_id"

    .line 281
    .line 282
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    iget-object v4, v1, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 287
    .line 288
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 289
    .line 290
    const-string v5, "moment_id"

    .line 291
    .line 292
    invoke-static {v5, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 297
    .line 298
    .line 299
    move-result-object v5

    .line 300
    iget-object v1, v1, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 301
    .line 302
    invoke-virtual {v5, v1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    const-string v5, "moment_type"

    .line 307
    .line 308
    invoke-static {v5, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-eqz v3, :cond_b

    .line 317
    .line 318
    const-string v3, "reply"

    .line 319
    .line 320
    goto :goto_4

    .line 321
    :cond_b
    const-string v3, "comment"

    .line 322
    .line 323
    :goto_4
    const-string v5, "comment_detail"

    .line 324
    .line 325
    invoke-static {v5, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    filled-new-array {v0, v2, v4, v1, v3}, [Ll/pf60;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    const-string v1, "e_user_comment"

    .line 334
    .line 335
    const-string v2, "p_immersion_comment_page"

    .line 336
    .line 337
    invoke-static {v1, v2, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 338
    .line 339
    .line 340
    return-void
.end method

.method public U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 18
    .line 19
    return-object p0
.end method

.method public d0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/di5;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/di5;->h:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/rlm;->l:Z

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 37
    .line 38
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v2, v3}, Ll/di5;->Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v1, 0x0

    .line 48
    move v2, v1

    .line 49
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge v2, v3, :cond_3

    .line 54
    .line 55
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 60
    .line 61
    invoke-virtual {p0, v3}, Ll/di5;->i0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 62
    .line 63
    .line 64
    iget-object v4, p0, Ll/di5;->e:Ljava/util/Map;

    .line 65
    .line 66
    iget-object v5, v3, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    check-cast v4, Ljava/util/List;

    .line 73
    .line 74
    invoke-virtual {p0, v3, v4, v1}, Ll/di5;->Q(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/util/List;Z)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-lez v4, :cond_2

    .line 89
    .line 90
    add-int/lit8 v4, v2, 0x1

    .line 91
    .line 92
    invoke-interface {p1, v4, v3}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    add-int/2addr v3, v0

    .line 100
    add-int/2addr v2, v3

    .line 101
    goto :goto_1

    .line 102
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    invoke-super {p0, p1}, Ll/di5;->d0(Ljava/util/List;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rlm;->m:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    invoke-static {v0}, Ll/di5;->W(Lcom/p1/mobile/putong/data/Links;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sub-int/2addr v0, p1

    .line 24
    const/4 p1, 0x2

    .line 25
    if-ge v0, p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/rlm;->o:Ll/n570;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/n570;->z()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rlm;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/rlm;->p:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/rlm;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/di5;->a0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 p0, 0x4

    .line 38
    return p0

    .line 39
    :cond_2
    const/4 p0, 0x3

    .line 40
    return p0

    .line 41
    :cond_3
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rlm;->k:Ll/fmm;

    .line 2
    .line 3
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/fmm;->b1(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)I
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/qlm;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/qlm;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/lit8 p0, p0, 0x2

    .line 17
    .line 18
    return p0
.end method
