.class public Ll/gc50;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/lc50;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Lv/VDraweeView;

.field public n:Lv/VDraweeView;

.field public o:Lv/VDraweeView;

.field public p:Landroid/widget/TextView;

.field public q:Lv/VFrame;

.field public r:Lv/VText;

.field public s:Landroid/widget/TextView;

.field public t:Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;

.field public u:Landroid/widget/LinearLayout;

.field public v:Lv/VText;

.field public w:Lv/VText;


# direct methods
.method public constructor <init>(Ll/lc50;)V
    .locals 3
    .param p1    # Ll/lc50;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->I4:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x3e99999a    # 0.3f

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ll/qag0;->c(F)Ll/rq2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic F(Ll/gc50;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc50;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/gc50;Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gc50;->I(Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;)V

    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hc50;->a(Ll/gc50;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    check-cast v0, Ll/lc50;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/u9t;->c(Ll/oo2;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p0, "\u60a8\u5f53\u524d\u6b63\u5728\u516c\u6f14\uff0c\u65e0\u6cd5\u67e5\u770b\u8be5\u9875\u9762"

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 26
    .line 27
    check-cast p0, Ll/lc50;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v0, Ll/bae0$a;

    .line 40
    .line 41
    const/16 v1, 0xc8

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;->jumpUrl:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/lc50;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/lc50;->V3()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 15
    .line 16
    check-cast p0, Ll/lc50;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p1, p0, v0}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/tfs$a;->a()Ll/tfs;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "p_live_profile"

    .line 32
    .line 33
    invoke-static {p1, p0}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gc50;->v:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u5df2\u8ba2\u9605"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    sget v1, Ll/obc0;->T0:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/gc50;->v:Lv/VText;

    .line 16
    .line 17
    sget v1, Ll/n9c0;->m1:I

    .line 18
    .line 19
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gc50;->n:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 15
    .line 16
    int-to-float v1, v1

    .line 17
    const v2, 0x40066666    # 2.1f

    .line 18
    .line 19
    .line 20
    div-float/2addr v1, v2

    .line 21
    float-to-int v1, v1

    .line 22
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    .line 24
    iget-object v1, p0, Ll/gc50;->n:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/gc50;->n:Lv/VDraweeView;

    .line 30
    .line 31
    sget-object v1, Ll/zft;->a:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "context_single_room"

    .line 34
    .line 35
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/gc50;->o:Lv/VDraweeView;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->userAvatar:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/gc50;->p:Landroid/widget/TextView;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->userName:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->timeDesc:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget-object v1, p0, Ll/gc50;->q:Lv/VFrame;

    .line 59
    .line 60
    const/16 v2, 0x8

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/gc50;->r:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/gc50;->r:Lv/VText;

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->timeDesc:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/gc50;->r:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    :goto_0
    iget-object v0, p0, Ll/gc50;->s:Landroid/widget/TextView;

    .line 90
    .line 91
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->userDesc:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    move v1, v2

    .line 100
    goto :goto_1

    .line 101
    :cond_2
    move v1, v3

    .line 102
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/gc50;->s:Landroid/widget/TextView;

    .line 106
    .line 107
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->userDesc:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->userBanner:Lcom/p1/mobile/putong/live/base/data/BLiveBanner;

    .line 113
    .line 114
    if-eqz v0, :cond_3

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBanner;->tabs:Ljava/util/List;

    .line 117
    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-lez v0, :cond_3

    .line 125
    .line 126
    iget-object v0, p0, Ll/gc50;->t:Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 129
    .line 130
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->userBanner:Lcom/p1/mobile/putong/live/base/data/BLiveBanner;

    .line 131
    .line 132
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveBanner;->tabs:Ljava/util/List;

    .line 133
    .line 134
    new-instance v5, Ll/ec50;

    .line 135
    .line 136
    invoke-direct {v5, p0}, Ll/ec50;-><init>(Ll/gc50;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->k(Ll/ner;Ljava/util/List;Ll/y20;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/gc50;->t:Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_3
    iget-object v0, p0, Ll/gc50;->t:Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 151
    .line 152
    .line 153
    :goto_2
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->isFollowed:Z

    .line 154
    .line 155
    if-nez p1, :cond_5

    .line 156
    .line 157
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1}, Ll/p6s;->D0()Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_4

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_4
    iget-object p1, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 169
    .line 170
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ll/gc50;->v:Lv/VText;

    .line 174
    .line 175
    const-string v0, "\u8ba2\u9605"

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Ll/gc50;->v:Lv/VText;

    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    const/4 v0, 0x1

    .line 187
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Ll/gc50;->v:Lv/VText;

    .line 191
    .line 192
    sget v1, Ll/n9c0;->e1:I

    .line 193
    .line 194
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 202
    .line 203
    sget v1, Ll/obc0;->o0:I

    .line 204
    .line 205
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 209
    .line 210
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 211
    .line 212
    .line 213
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 218
    .line 219
    check-cast v1, Ll/lc50;

    .line 220
    .line 221
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual {p1, v1, v0}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {p1}, Ll/tfs$a;->a()Ll/tfs;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    const-string v0, "p_live_profile"

    .line 234
    .line 235
    invoke-static {v0, p1}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_5
    :goto_3
    iget-object p1, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 240
    .line 241
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 242
    .line 243
    .line 244
    :goto_4
    iget-object p1, p0, Ll/gc50;->u:Landroid/widget/LinearLayout;

    .line 245
    .line 246
    new-instance v0, Ll/fc50;

    .line 247
    .line 248
    invoke-direct {v0, p0}, Ll/fc50;-><init>(Ll/gc50;)V

    .line 249
    .line 250
    .line 251
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 252
    .line 253
    .line 254
    :cond_6
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/gc50;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/gc50;->t:Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerView;->i()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
