.class public Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VText;

.field public g:Landroid/widget/ImageView;

.field public h:Lv/VText;

.field public i:Landroid/widget/FrameLayout;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText;

.field public l:Landroid/view/View;

.field public m:Lcom/p1/mobile/android/app/Act;

.field public n:Z

.field public o:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

.field public p:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->o:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RoamedLocationData;->new_()Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->o:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;->a(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/List;)Lcom/p1/mobile/putong/core/api/CoreLikers$a;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->t5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/joa;->y3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->a:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;->my_privilege_liker:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;->a(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->l(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    return-void
.end method


# virtual methods
.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yvd0;->a(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k(I)Landroid/graphics/drawable/Drawable;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->o:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->o:Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 12
    .line 13
    invoke-interface {p1, v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Q8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/RoamedLocationData;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 8

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->b:I

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->h:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v1}, Ll/jyb;->l0(Ljava/util/List;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v2}, Ll/r97;->B()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->e:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {p1}, Ll/jyb;->l0(Ljava/util/List;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    move-object v1, p1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->j:Landroid/widget/ImageView;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    const/4 v3, 0x0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    move v4, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move v4, v3

    .line 43
    :goto_0
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k:Lv/VText;

    .line 47
    .line 48
    if-lez v0, :cond_2

    .line 49
    .line 50
    move v4, v2

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    move v4, v3

    .line 53
    :goto_1
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/rbb0;->q()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_9

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-interface {p1}, Ll/r97;->B()Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_5

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 82
    .line 83
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 89
    .line 90
    invoke-static {}, Ll/c17;->u0()Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_3

    .line 95
    .line 96
    sget v2, Ll/jbc0;->H3:I

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    sget v2, Ll/jbc0;->G3:I

    .line 100
    .line 101
    :goto_2
    invoke-virtual {p1, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 102
    .line 103
    .line 104
    if-lez v0, :cond_4

    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m:Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->J6:I

    .line 111
    .line 112
    invoke-static {v0}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 128
    .line 129
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->b2:I

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_7

    .line 140
    .line 141
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 142
    .line 143
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    const/4 v6, 0x2

    .line 158
    const/16 v7, 0x8

    .line 159
    .line 160
    invoke-virtual {p1, v4, v5, v6, v7}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 164
    .line 165
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 169
    .line 170
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 174
    .line 175
    invoke-static {v0}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    .line 181
    .line 182
    if-lez v0, :cond_6

    .line 183
    .line 184
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 185
    .line 186
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 187
    .line 188
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-interface {v2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Td(I)Ljava/lang/CharSequence;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 200
    .line 201
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 202
    .line 203
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 208
    .line 209
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 210
    .line 211
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Cs(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)Ljava/lang/CharSequence;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    .line 221
    .line 222
    :cond_6
    return-void

    .line 223
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 224
    .line 225
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 229
    .line 230
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 231
    .line 232
    .line 233
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 234
    .line 235
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 236
    .line 237
    invoke-static {}, Ll/c17;->u0()Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_8

    .line 242
    .line 243
    sget v1, Ll/jbc0;->H3:I

    .line 244
    .line 245
    goto :goto_3

    .line 246
    :cond_8
    sget v1, Ll/jbc0;->G3:I

    .line 247
    .line 248
    :goto_3
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 252
    .line 253
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->N6:I

    .line 254
    .line 255
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 256
    .line 257
    .line 258
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 259
    .line 260
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->k7:I

    .line 261
    .line 262
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 267
    .line 268
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 269
    .line 270
    .line 271
    sget p1, Ll/qa00;->e:I

    .line 272
    .line 273
    if-eqz v0, :cond_b

    .line 274
    .line 275
    if-nez v1, :cond_a

    .line 276
    .line 277
    goto :goto_4

    .line 278
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 279
    .line 280
    sget v4, Ll/jbc0;->K:I

    .line 281
    .line 282
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 283
    .line 284
    .line 285
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 286
    .line 287
    invoke-virtual {v2, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 288
    .line 289
    .line 290
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 291
    .line 292
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 293
    .line 294
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    invoke-virtual {p1, v2, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 303
    .line 304
    .line 305
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 306
    .line 307
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 311
    .line 312
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m:Lcom/p1/mobile/android/app/Act;

    .line 313
    .line 314
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->J6:I

    .line 315
    .line 316
    invoke-static {v0}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 332
    .line 333
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->K6:I

    .line 334
    .line 335
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 336
    .line 337
    .line 338
    goto :goto_5

    .line 339
    :cond_b
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 340
    .line 341
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 342
    .line 343
    .line 344
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 345
    .line 346
    invoke-virtual {p1, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 347
    .line 348
    .line 349
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 350
    .line 351
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 352
    .line 353
    sget v1, Ll/jbc0;->Wa:I

    .line 354
    .line 355
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 356
    .line 357
    .line 358
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 359
    .line 360
    const/4 v0, 0x4

    .line 361
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 362
    .line 363
    .line 364
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 365
    .line 366
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->M6:I

    .line 367
    .line 368
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 369
    .line 370
    .line 371
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 372
    .line 373
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->L6:I

    .line 374
    .line 375
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 376
    .line 377
    .line 378
    :goto_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 379
    .line 380
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 381
    .line 382
    .line 383
    return-void
.end method

.method public o(Ll/jic0;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;ZLcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;",
            "Z",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->l:Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p5, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p5

    .line 16
    const/4 v0, 0x0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz p5, :cond_b

    .line 19
    .line 20
    invoke-virtual {p4}, Ll/a690;->j()I

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    const/4 v2, 0x1

    .line 25
    if-eqz p5, :cond_5

    .line 26
    .line 27
    sget-object p5, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    if-eq p5, p2, :cond_5

    .line 30
    .line 31
    sget-object p5, Lcom/p1/mobile/putong/core/data/Privilege;->see_not_match_guide:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    if-eq p5, p2, :cond_5

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    if-ne p1, p2, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 40
    .line 41
    sget p5, Ll/jbc0;->S9:I

    .line 42
    .line 43
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k(I)Landroid/graphics/drawable/Drawable;

    .line 44
    .line 45
    .line 46
    move-result-object p5

    .line 47
    invoke-virtual {p1, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->leave_message:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 52
    .line 53
    if-ne p1, p2, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 56
    .line 57
    sget p5, Ll/jbc0;->u0:I

    .line 58
    .line 59
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p5

    .line 63
    invoke-virtual {p1, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 68
    .line 69
    if-ne p1, p2, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 72
    .line 73
    sget p5, Ll/jbc0;->v0:I

    .line 74
    .line 75
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k(I)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p5

    .line 79
    invoke-virtual {p1, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 84
    .line 85
    if-ne p1, p2, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 88
    .line 89
    sget p5, Ll/jbc0;->t0:I

    .line 90
    .line 91
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k(I)Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    .line 94
    move-result-object p5

    .line 95
    invoke-virtual {p1, p5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->recover_unmatches:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 100
    .line 101
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 102
    .line 103
    if-ne p1, p2, :cond_4

    .line 104
    .line 105
    sget p1, Ll/jbc0;->w0:I

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k(I)Landroid/graphics/drawable/Drawable;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p5, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_4
    invoke-virtual {p4}, Ll/a690;->j()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k(I)Landroid/graphics/drawable/Drawable;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p5, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k:Lv/VText;

    .line 132
    .line 133
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->j:Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 142
    .line 143
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 147
    .line 148
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 152
    .line 153
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_5
    sget-object p5, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 158
    .line 159
    if-ne p5, p2, :cond_6

    .line 160
    .line 161
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->r(Ll/jic0;)V

    .line 162
    .line 163
    .line 164
    :cond_6
    :goto_1
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->q(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, p2, p4}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->p(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V

    .line 168
    .line 169
    .line 170
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 173
    .line 174
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-nez p1, :cond_7

    .line 183
    .line 184
    invoke-static {}, Ll/joa;->f4()Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-nez p1, :cond_b

    .line 189
    .line 190
    :cond_7
    invoke-virtual {p4}, Ll/a690;->r()I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-lez p1, :cond_8

    .line 195
    .line 196
    invoke-virtual {p4}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    sget-object p5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 201
    .line 202
    if-ne p1, p5, :cond_8

    .line 203
    .line 204
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 205
    .line 206
    if-nez p1, :cond_8

    .line 207
    .line 208
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 209
    .line 210
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 211
    .line 212
    .line 213
    move-result-object p5

    .line 214
    invoke-virtual {p4}, Ll/a690;->r()I

    .line 215
    .line 216
    .line 217
    move-result p4

    .line 218
    invoke-virtual {p5, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 219
    .line 220
    .line 221
    move-result p4

    .line 222
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 227
    .line 228
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 229
    .line 230
    .line 231
    move-result-object p4

    .line 232
    sget p5, Ll/h9c0;->f0:I

    .line 233
    .line 234
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getColor(I)I

    .line 235
    .line 236
    .line 237
    move-result p4

    .line 238
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 239
    .line 240
    .line 241
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m:Lcom/p1/mobile/android/app/Act;

    .line 242
    .line 243
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 244
    .line 245
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->k0:Lcom/p1/mobile/putong/core/api/q;

    .line 246
    .line 247
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/q;->R:Lcom/p1/mobile/putong/core/api/q$b;

    .line 248
    .line 249
    invoke-virtual {p4}, Ll/mof0;->k()Lrx/c;

    .line 250
    .line 251
    .line 252
    move-result-object p4

    .line 253
    invoke-virtual {p1, p4}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    new-instance p4, Ll/pvd0;

    .line 262
    .line 263
    invoke-direct {p4, p0}, Ll/pvd0;-><init>(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;)V

    .line 264
    .line 265
    .line 266
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 267
    .line 268
    .line 269
    move-result-object p4

    .line 270
    invoke-virtual {p1, p4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 271
    .line 272
    .line 273
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 274
    .line 275
    if-ne p2, p1, :cond_9

    .line 276
    .line 277
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 278
    .line 279
    if-nez p1, :cond_9

    .line 280
    .line 281
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 282
    .line 283
    new-instance p4, Ll/qvd0;

    .line 284
    .line 285
    invoke-direct {p4, p0}, Ll/qvd0;-><init>(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 289
    .line 290
    .line 291
    goto :goto_3

    .line 292
    :cond_9
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-eqz p1, :cond_a

    .line 297
    .line 298
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 299
    .line 300
    if-nez p1, :cond_a

    .line 301
    .line 302
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 303
    .line 304
    new-instance p4, Ll/rvd0;

    .line 305
    .line 306
    invoke-direct {p4, p3, p2}, Ll/rvd0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    .line 311
    .line 312
    goto :goto_3

    .line 313
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 314
    .line 315
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 316
    .line 317
    .line 318
    :cond_b
    :goto_3
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 319
    .line 320
    if-ne p2, p1, :cond_c

    .line 321
    .line 322
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->g:Landroid/widget/ImageView;

    .line 323
    .line 324
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 325
    .line 326
    .line 327
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->g:Landroid/widget/ImageView;

    .line 328
    .line 329
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 330
    .line 331
    .line 332
    move-result-object p4

    .line 333
    invoke-virtual {p4}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 334
    .line 335
    .line 336
    move-result-object p4

    .line 337
    invoke-interface {p4}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->cc()I

    .line 338
    .line 339
    .line 340
    move-result p4

    .line 341
    invoke-virtual {p1, p4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 342
    .line 343
    .line 344
    goto :goto_4

    .line 345
    :cond_c
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 346
    .line 347
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->g:Landroid/widget/ImageView;

    .line 348
    .line 349
    if-ne p2, p1, :cond_d

    .line 350
    .line 351
    invoke-virtual {p4, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 352
    .line 353
    .line 354
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->g:Landroid/widget/ImageView;

    .line 355
    .line 356
    sget p4, Ll/jbc0;->Ya:I

    .line 357
    .line 358
    invoke-virtual {p1, p4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 359
    .line 360
    .line 361
    goto :goto_4

    .line 362
    :cond_d
    const/16 p1, 0x8

    .line 363
    .line 364
    invoke-virtual {p4, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 365
    .line 366
    .line 367
    :goto_4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 368
    .line 369
    if-eqz p1, :cond_e

    .line 370
    .line 371
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 372
    .line 373
    .line 374
    return-void

    .line 375
    :cond_e
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    move-result p1

    .line 379
    if-eqz p1, :cond_f

    .line 380
    .line 381
    new-instance p1, Ll/svd0;

    .line 382
    .line 383
    invoke-direct {p1, p3, p2}, Ll/svd0;-><init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 387
    .line 388
    .line 389
    return-void

    .line 390
    :cond_f
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    .line 392
    .line 393
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/core/data/Privilege;Ll/a690;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 7
    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->b9:I

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final r(Ll/jic0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->b:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->j:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->k:Lv/VText;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->e:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->d:Lv/VImage;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->c:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-static {}, Ll/c17;->u0()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    sget v2, Ll/jbc0;->H3:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget v2, Ll/jbc0;->G3:I

    .line 47
    .line 48
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->f:Lv/VText;

    .line 52
    .line 53
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->N6:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->h:Lv/VText;

    .line 59
    .line 60
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->K6:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->m:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->S6()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v3, Ll/tvd0;

    .line 80
    .line 81
    invoke-direct {v3}, Ll/tvd0;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    new-instance v3, Ll/uvd0;

    .line 89
    .line 90
    invoke-direct {v3}, Ll/uvd0;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v3}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    new-instance v3, Ll/vvd0;

    .line 98
    .line 99
    invoke-direct {v3}, Ll/vvd0;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v1, v2}, Lrx/c;->mergeWith(Lrx/c;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance v0, Ll/wvd0;

    .line 115
    .line 116
    invoke-direct {v0}, Ll/wvd0;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    new-instance v0, Ll/xvd0;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/xvd0;-><init>(Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x42820000    # 65.0f

    .line 6
    .line 7
    invoke-static {}, Ll/vnb;->m1()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    mul-float/2addr v2, v1

    .line 12
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->a:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/vnb;->m1()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/high16 v2, 0x42280000    # 42.0f

    .line 29
    .line 30
    mul-float/2addr v1, v2

    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->a:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {}, Ll/vnb;->m1()F

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    mul-float/2addr v1, v2

    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->i:Landroid/widget/FrameLayout;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->n:Z

    .line 62
    .line 63
    return-void
.end method
