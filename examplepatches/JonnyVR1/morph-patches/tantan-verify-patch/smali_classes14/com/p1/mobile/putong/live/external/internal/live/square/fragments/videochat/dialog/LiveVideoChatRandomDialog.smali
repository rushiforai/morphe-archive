.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public _background:Landroid/view/View;

.field public _confirm:Landroid/widget/TextView;

.field public _desc1:Landroid/widget/TextView;

.field public _desc2:Landroid/widget/TextView;

.field public _desc3:Landroid/widget/TextView;

.field public _text:Landroid/widget/TextView;

.field public descList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private dialog:Ll/jbt;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Landroid/animation/Animator;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yxu;->a(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->dialog:Ll/jbt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->dialog:Ll/jbt;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->remainCoupons:I

    .line 9
    .line 10
    const-string p3, "square"

    .line 11
    .line 12
    invoke-static {p1, p0, p3}, Ll/jwk0;->f(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->remainCoupons:I

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    const-string p0, "exchangeAndcall"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-string p0, "call"

    .line 23
    .line 24
    :goto_0
    const-string p1, "pop_type"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "e_live_video_quickchat_random_pop"

    .line 35
    .line 36
    const-string p2, "p_live_video_quickchat"

    .line 37
    .line 38
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/jwu;->P()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/sxu;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/sxu;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/txu;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/txu;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V
    .locals 11

    .line 1
    new-instance v0, Ll/jbt;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/jbt;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->dialog:Ll/jbt;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_background:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_background:Landroid/view/View;

    .line 15
    .line 16
    new-instance v1, Ll/uxu;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/uxu;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_background:Landroid/view/View;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_background:Landroid/view/View;

    .line 31
    .line 32
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 33
    .line 34
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    new-array v9, v0, [F

    .line 39
    .line 40
    fill-array-data v9, :array_0

    .line 41
    .line 42
    .line 43
    const-string v3, "alpha"

    .line 44
    .line 45
    const-wide/16 v4, 0x64

    .line 46
    .line 47
    const-wide/16 v6, 0xc8

    .line 48
    .line 49
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->descList:Ljava/util/ArrayList;

    .line 54
    .line 55
    new-instance v3, Ll/vxu;

    .line 56
    .line 57
    invoke-direct {v3}, Ll/vxu;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v2, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 61
    .line 62
    .line 63
    sget v2, Ll/m9c0;->i:I

    .line 64
    .line 65
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const/4 v3, 0x0

    .line 70
    move v4, v3

    .line 71
    :goto_0
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->notices:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    const/4 v6, 0x3

    .line 78
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-ge v4, v5, :cond_4

    .line 83
    .line 84
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->notices:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponNotice;

    .line 91
    .line 92
    iget-object v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponNotice;->template:Ljava/lang/String;

    .line 93
    .line 94
    const-string v7, "%s"

    .line 95
    .line 96
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    const/4 v7, 0x0

    .line 101
    move v8, v3

    .line 102
    :goto_1
    array-length v9, v6

    .line 103
    if-ge v8, v9, :cond_2

    .line 104
    .line 105
    if-nez v8, :cond_0

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    aget-object v9, v6, v8

    .line 112
    .line 113
    invoke-static {v7, v9}, Ll/vuf0;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    invoke-virtual {v7, v2}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    goto :goto_2

    .line 122
    :cond_0
    aget-object v9, v6, v8

    .line 123
    .line 124
    invoke-virtual {v7, v9}, Ll/vuf0$a;->a(Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    invoke-virtual {v9, v2}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 129
    .line 130
    .line 131
    :goto_2
    iget-object v9, v5, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponNotice;->fields:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result v9

    .line 137
    if-ge v8, v9, :cond_1

    .line 138
    .line 139
    iget-object v9, v5, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponNotice;->fields:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    check-cast v9, Ljava/lang/CharSequence;

    .line 146
    .line 147
    invoke-virtual {v7, v9}, Ll/vuf0$a;->a(Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 148
    .line 149
    .line 150
    move-result-object v9

    .line 151
    sget v10, Ll/m9c0;->o:I

    .line 152
    .line 153
    invoke-static {v10}, Ll/n3d0;->a(I)I

    .line 154
    .line 155
    .line 156
    move-result v10

    .line 157
    invoke-virtual {v9, v10}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 158
    .line 159
    .line 160
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_2
    if-eqz v7, :cond_3

    .line 164
    .line 165
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->descList:Ljava/util/ArrayList;

    .line 166
    .line 167
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    check-cast v5, Landroid/widget/TextView;

    .line 172
    .line 173
    invoke-virtual {v7}, Ll/vuf0$a;->b()Landroid/text/SpannableStringBuilder;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->descList:Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    check-cast v5, Landroid/view/View;

    .line 187
    .line 188
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_4
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->remainCoupons:I

    .line 195
    .line 196
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_confirm:Landroid/widget/TextView;

    .line 197
    .line 198
    if-nez v1, :cond_5

    .line 199
    .line 200
    const-string v1, "\u5151\u6362\u6b21\u6570\u5e76\u53d1\u8d77"

    .line 201
    .line 202
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    .line 204
    .line 205
    goto :goto_3

    .line 206
    :cond_5
    const-string v1, "\u7acb\u5373\u53d1\u8d77"

    .line 207
    .line 208
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_text:Landroid/widget/TextView;

    .line 212
    .line 213
    new-instance v2, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    const-string v3, "\u968f\u673a\u5339\u914d\u5269\u4f59\u6b21\u6570\uff1a"

    .line 216
    .line 217
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->remainCoupons:I

    .line 221
    .line 222
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->dialog:Ll/jbt;

    .line 233
    .line 234
    new-instance v2, Ll/wxu;

    .line 235
    .line 236
    invoke-direct {v2, v0}, Ll/wxu;-><init>(Landroid/animation/Animator;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 240
    .line 241
    .line 242
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->dialog:Ll/jbt;

    .line 243
    .line 244
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 245
    .line 246
    .line 247
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_confirm:Landroid/widget/TextView;

    .line 248
    .line 249
    new-instance v1, Ll/xxu;

    .line 250
    .line 251
    invoke-direct {v1, p0, p1, p2}, Ll/xxu;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;)V

    .line 252
    .line 253
    .line 254
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->remainCoupons:I

    .line 258
    .line 259
    if-nez p0, :cond_6

    .line 260
    .line 261
    const-string p0, "exchangeAndcall"

    .line 262
    .line 263
    goto :goto_4

    .line 264
    :cond_6
    const-string p0, "call"

    .line 265
    .line 266
    :goto_4
    const-string p1, "pop_type"

    .line 267
    .line 268
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    filled-new-array {p0}, [Ll/pf60;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    const-string p1, "e_live_video_quickchat_random_pop"

    .line 277
    .line 278
    const-string p2, "p_live_video_quickchat"

    .line 279
    .line 280
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    nop

    .line 285
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_desc1:Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_desc2:Landroid/widget/TextView;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->_desc3:Landroid/widget/TextView;

    .line 12
    .line 13
    filled-new-array {v0, v1, v2}, [Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/dialog/LiveVideoChatRandomDialog;->descList:Ljava/util/ArrayList;

    .line 22
    .line 23
    return-void
.end method
