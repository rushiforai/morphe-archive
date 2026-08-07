.class public Ll/e0d0;
.super Landroid/app/AlertDialog;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VImage;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Landroid/widget/TextView;

.field public n:Lv/VText;

.field public o:Landroid/widget/ImageView;

.field public p:Lv/VButton;

.field public final q:Lcom/p1/mobile/android/app/Act;

.field public final r:Ll/x20;

.field public final s:Ljava/lang/String;

.field public t:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public u:Ll/l4g0;

.field public v:Z

.field public w:Ljava/text/NumberFormat;

.field public final x:Ljava/lang/String;

.field public y:Z

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget v0, Ll/dgc0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ll/e0d0;->v:Z

    .line 8
    .line 9
    const-string v0, "p_reauto"

    .line 10
    .line 11
    iput-object v0, p0, Ll/e0d0;->x:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/e0d0;->q:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iput-object p3, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    iput-object p4, p0, Ll/e0d0;->s:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p2, p0, Ll/e0d0;->r:Ll/x20;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/e0d0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0d0;->l(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/e0d0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0d0;->p(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ll/e0d0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0d0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/e0d0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0d0;->m(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e(Ll/e0d0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0d0;->o(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f0d0;->b(Ll/e0d0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final g()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    const-string v1, "svip"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->D5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/yzc0;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/yzc0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 44
    .line 45
    iput-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 46
    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_0
    return v2
.end method

.method public final h()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean p0, p0, Ll/e0d0;->v:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x9

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x3

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "\u300c\u6700\u9ad8%s\u500d\u52a0\u901f\u66dd\u5149\u300d\u5f85\u9886\u53d6"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final i()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/xzc0;->t()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/e0d0;->m:Landroid/widget/TextView;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "\u652f\u4ed8\u5b9d\u514d\u5bc6\u652f\u4ed8"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string v0, "\u652f\u4ed8\u5b9d"

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v1, p0, Ll/e0d0;->n:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/e0d0;->n:Lv/VText;

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    :cond_2
    return-void
.end method

.method public final k()V
    .locals 13

    .line 1
    new-instance v0, Ljava/text/DecimalFormat;

    .line 2
    .line 3
    const-string v1, "#.#"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/e0d0;->w:Ljava/text/NumberFormat;

    .line 9
    .line 10
    sget-object v1, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 20
    .line 21
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 22
    .line 23
    new-instance v2, Ll/zzc0;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/zzc0;-><init>(Ll/e0d0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/a0d0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/a0d0;-><init>(Ll/e0d0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 40
    .line 41
    iget v3, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 42
    .line 43
    const/4 v4, 0x1

    .line 44
    if-eq v3, v4, :cond_2

    .line 45
    .line 46
    const/4 v5, 0x3

    .line 47
    if-eq v3, v5, :cond_1

    .line 48
    .line 49
    const/4 v5, 0x6

    .line 50
    if-eq v3, v5, :cond_0

    .line 51
    .line 52
    const-string v3, "\u5e74"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string v3, "\u534a\u5e74"

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    const-string v3, "\u5b63"

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const-string v3, "\u6708"

    .line 62
    .line 63
    :goto_0
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 64
    .line 65
    const-string v5, "svip"

    .line 66
    .line 67
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const-string v6, "VIP"

    .line 72
    .line 73
    const-string v7, "SVIP"

    .line 74
    .line 75
    const-string v8, "%s\u8fde\u7eed\u5305%s"

    .line 76
    .line 77
    const-string v9, "SVIP6\u4e2a\u6708\u8fde\u5305"

    .line 78
    .line 79
    if-eqz v2, :cond_3

    .line 80
    .line 81
    iget-object v2, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    iget-object v2, p0, Ll/e0d0;->e:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    iget-object v2, p0, Ll/e0d0;->e:Lv/VText;

    .line 96
    .line 97
    iget-boolean v10, p0, Ll/e0d0;->v:Z

    .line 98
    .line 99
    if-eqz v10, :cond_4

    .line 100
    .line 101
    move-object v10, v7

    .line 102
    goto :goto_1

    .line 103
    :cond_4
    move-object v10, v6

    .line 104
    :goto_1
    filled-new-array {v10, v3}, [Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v10

    .line 108
    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    :goto_2
    iget-object v2, p0, Ll/e0d0;->e:Lv/VText;

    .line 116
    .line 117
    invoke-virtual {v2}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 118
    .line 119
    .line 120
    move-result-object v10

    .line 121
    invoke-virtual {v2, v10, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 122
    .line 123
    .line 124
    iget-boolean v2, p0, Ll/e0d0;->y:Z

    .line 125
    .line 126
    if-eqz v2, :cond_8

    .line 127
    .line 128
    iget-object v2, p0, Ll/e0d0;->k:Lv/VText;

    .line 129
    .line 130
    const-string v10, "\u300c\u52a0\u901f\u66dd\u5149\u300d\u5f85\u9886\u53d6"

    .line 131
    .line 132
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Ll/e0d0;->g:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/e0d0;->h()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v10

    .line 141
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    iget-object v2, p0, Ll/e0d0;->j:Lv/VText;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/e0d0;->i()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v10

    .line 150
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 151
    .line 152
    .line 153
    move-result-object v11

    .line 154
    invoke-virtual {v11}, Ll/xzc0;->w()J

    .line 155
    .line 156
    .line 157
    move-result-wide v11

    .line 158
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 159
    .line 160
    .line 161
    move-result-object v11

    .line 162
    iget-object v12, p0, Ll/e0d0;->w:Ljava/text/NumberFormat;

    .line 163
    .line 164
    invoke-virtual {v12, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    filled-new-array {v10, v3, v11, v0, v3}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-string v1, "* %s\u798f\u5229\u4e3a\u8fde\u7eed\u5305%s\u4f1a\u5458\u4e13\u4eab\u798f\u5229 \n   %s\u5929\u540e\u5c06\u4ee5\u00a5%s/%s\u81ea\u52a8\u7eed\u8d39"

    .line 173
    .line 174
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/e0d0;->i:Landroid/widget/TextView;

    .line 182
    .line 183
    const-string v1, "\u5f53\u524d\u65e0\u9700\u6263\u6b3e\n\u5f00\u901a\u514d\u5bc6\u652f\u4ed8\u5373\u53ef\u83b7\u5f97\u798f\u5229"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 189
    .line 190
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 191
    .line 192
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-eqz v0, :cond_5

    .line 197
    .line 198
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 199
    .line 200
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-eqz v0, :cond_5

    .line 205
    .line 206
    iget-object v0, p0, Ll/e0d0;->e:Lv/VText;

    .line 207
    .line 208
    const-string v1, "SVIP3\u4e2a\u6708\u8fde\u5305"

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_5
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 215
    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 217
    .line 218
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-eqz v0, :cond_6

    .line 223
    .line 224
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 225
    .line 226
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    if-eqz v0, :cond_6

    .line 231
    .line 232
    iget-object v0, p0, Ll/e0d0;->e:Lv/VText;

    .line 233
    .line 234
    invoke-virtual {v0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    .line 236
    .line 237
    goto :goto_3

    .line 238
    :cond_6
    iget-object v0, p0, Ll/e0d0;->e:Lv/VText;

    .line 239
    .line 240
    iget-boolean v1, p0, Ll/e0d0;->v:Z

    .line 241
    .line 242
    if-eqz v1, :cond_7

    .line 243
    .line 244
    move-object v6, v7

    .line 245
    :cond_7
    filled-new-array {v6, v3}, [Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-static {v8, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    .line 255
    .line 256
    :goto_3
    iget-object v0, p0, Ll/e0d0;->p:Lv/VButton;

    .line 257
    .line 258
    const-string v1, "\u7acb\u5373\u5f00\u901a\u4eab\u53d7\u798f\u5229"

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    goto :goto_4

    .line 264
    :cond_8
    invoke-virtual {p0, v0, v1, v3}, Ll/e0d0;->q(DLjava/lang/String;)V

    .line 265
    .line 266
    .line 267
    new-instance v0, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .line 271
    .line 272
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    invoke-virtual {v1}, Ll/xzc0;->o()I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v1, "\u5929"

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {p0, v0}, Ll/e0d0;->r(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Ll/e0d0;->g:Lv/VText;

    .line 296
    .line 297
    invoke-virtual {p0}, Ll/e0d0;->i()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    const-string v2, "\u300c%s\u300d\u5df2\u5931\u6548"

    .line 306
    .line 307
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    .line 313
    .line 314
    :goto_4
    iget-object v0, p0, Ll/e0d0;->b:Lv/VImage;

    .line 315
    .line 316
    new-instance v1, Ll/b0d0;

    .line 317
    .line 318
    invoke-direct {v1, p0}, Ll/b0d0;-><init>(Ll/e0d0;)V

    .line 319
    .line 320
    .line 321
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Ll/e0d0;->g:Lv/VText;

    .line 325
    .line 326
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-virtual {v0, v1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 331
    .line 332
    .line 333
    iget-object v0, p0, Ll/e0d0;->p:Lv/VButton;

    .line 334
    .line 335
    new-instance v1, Ll/c0d0;

    .line 336
    .line 337
    invoke-direct {v1, p0}, Ll/c0d0;-><init>(Ll/e0d0;)V

    .line 338
    .line 339
    .line 340
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 341
    .line 342
    .line 343
    iget-object v0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 344
    .line 345
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 346
    .line 347
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    const-string v1, "reauto_duration"

    .line 352
    .line 353
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    iget-boolean v1, p0, Ll/e0d0;->v:Z

    .line 358
    .line 359
    if-eqz v1, :cond_9

    .line 360
    .line 361
    goto :goto_5

    .line 362
    :cond_9
    const-string v5, "vip"

    .line 363
    .line 364
    :goto_5
    const-string v1, "reauto_product"

    .line 365
    .line 366
    invoke-static {v1, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    const-string v2, "reauto_showfrom"

    .line 371
    .line 372
    iget-object v3, p0, Ll/e0d0;->s:Ljava/lang/String;

    .line 373
    .line 374
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    iget-boolean v3, p0, Ll/e0d0;->y:Z

    .line 379
    .line 380
    xor-int/2addr v3, v4

    .line 381
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    const-string v5, "if_auto_order"

    .line 386
    .line 387
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    const-string v1, "e_reauto"

    .line 396
    .line 397
    const-string v2, "p_reauto"

    .line 398
    .line 399
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 400
    .line 401
    .line 402
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 403
    .line 404
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 405
    .line 406
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    iget-object v1, p0, Ll/e0d0;->m:Landroid/widget/TextView;

    .line 411
    .line 412
    if-eqz v0, :cond_a

    .line 413
    .line 414
    const-string v0, "\u652f\u4ed8\u5b9d\u514d\u5bc6\u652f\u4ed8"

    .line 415
    .line 416
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    .line 418
    .line 419
    goto :goto_6

    .line 420
    :cond_a
    const-string v0, "\u652f\u4ed8\u5b9d"

    .line 421
    .line 422
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 423
    .line 424
    .line 425
    :goto_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    if-eqz v0, :cond_b

    .line 438
    .line 439
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    iget-object v1, p0, Ll/e0d0;->n:Lv/VText;

    .line 452
    .line 453
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 454
    .line 455
    .line 456
    iget-object v0, p0, Ll/e0d0;->n:Lv/VText;

    .line 457
    .line 458
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 459
    .line 460
    .line 461
    :cond_b
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 462
    .line 463
    iget-object p0, p0, Ll/e0d0;->a:Lv/VImage;

    .line 464
    .line 465
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkdHRExES0hVWUFDMkIzNDVRRUZYTk1UMzVGQlAyWjE0IiwidyI6MTA4MCwiaCI6OTYzLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjE2MjgzM30.webp"

    .line 466
    .line 467
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    return-void
.end method

.method public final synthetic l(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Ll/v5b0;->z(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/e0d0;->u:Ll/l4g0;

    .line 6
    .line 7
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic m(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/e0d0;->r:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/e0d0;->r:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "reauto_duration"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-boolean v0, p0, Ll/e0d0;->v:Z

    .line 16
    .line 17
    const-string v1, "svip"

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move-object v0, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string v0, "vip"

    .line 24
    .line 25
    :goto_0
    const-string v2, "reauto_product"

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "reauto_showfrom"

    .line 32
    .line 33
    iget-object v3, p0, Ll/e0d0;->s:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-boolean v3, p0, Ll/e0d0;->y:Z

    .line 40
    .line 41
    xor-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v4, "if_auto_order"

    .line 48
    .line 49
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    filled-new-array {p1, v0, v2, v3}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "e_reauto"

    .line 58
    .line 59
    const-string v2, "p_reauto"

    .line 60
    .line 61
    invoke-static {v0, v2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-static {}, Ll/pzi0;->o()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iput-object p1, p0, Ll/e0d0;->z:Ljava/lang/String;

    .line 96
    .line 97
    iget-object p1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 98
    .line 99
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 100
    .line 101
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_2

    .line 106
    .line 107
    iget-object p1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_1

    .line 114
    .line 115
    iget-object p1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_2

    .line 122
    .line 123
    :cond_1
    invoke-static {}, Ll/xl60;->k()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_2

    .line 128
    .line 129
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 130
    .line 131
    iget-object v0, p0, Ll/e0d0;->z:Ljava/lang/String;

    .line 132
    .line 133
    iget-object p0, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 138
    .line 139
    const-string v1, "alipay not install"

    .line 140
    .line 141
    invoke-virtual {p1, v0, p0, v1}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_2
    invoke-virtual {p0}, Ll/e0d0;->t()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/e0d0;->q:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/e0d0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/xzc0;->l()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, p0, Ll/e0d0;->y:Z

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/e0d0;->s()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/e0d0;->g()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 45
    .line 46
    const-string v0, "svip"

    .line 47
    .line 48
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput-boolean p1, p0, Ll/e0d0;->v:Z

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/e0d0;->j()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/e0d0;->k()V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic p(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q(DLjava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e0d0;->j:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/e0d0;->i()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/xzc0;->w()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object p0, p0, Ll/e0d0;->w:Ljava/text/NumberFormat;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {v1, p3, v2, p0, p3}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "* %s\u798f\u5229\u4e3a\u8fde\u7eed\u5305%s\u4f1a\u5458\u4e13\u4eab\u798f\u5229 \n   %s\u5929\u540e\u5c06\u4ee5\u00a5%s/%s\u81ea\u52a8\u7eed\u8d39"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/e0d0;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "\u300c%s\u300d\u5df2\u5931\u6548 %s"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/e0d0;->k:Lv/VText;

    .line 16
    .line 17
    filled-new-array {p1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v1, "#ff5435"

    .line 26
    .line 27
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x2

    .line 32
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v0, p1, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final s()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e0d0;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->F0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x4000000

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/high16 v1, -0x80000000

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/16 v1, 0x500

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 47
    .line 48
    .line 49
    const/4 v0, 0x1

    .line 50
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public show()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "p_reauto"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/e0d0;->u:Ll/l4g0;

    .line 17
    .line 18
    iget-object v1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 19
    .line 20
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "reauto_duration"

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-boolean v2, p0, Ll/e0d0;->v:Z

    .line 33
    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    const-string v2, "svip"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v2, "vip"

    .line 40
    .line 41
    :goto_0
    const-string v3, "reauto_product"

    .line 42
    .line 43
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const-string v3, "reauto_showfrom"

    .line 48
    .line 49
    iget-object v4, p0, Ll/e0d0;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/e0d0;->u:Ll/l4g0;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/xzc0;->T()V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    new-instance v0, Ll/wn60;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/e0d0;->v:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    :goto_0
    iget-object v2, p0, Ll/e0d0;->q:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    const-string v3, ""

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v3}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/e0d0;->z:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Ll/wn60;->t(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/e0d0;->t:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v2, Ll/d0d0;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/d0d0;-><init>(Ll/e0d0;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    invoke-virtual {v0, p0, v1, v2}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
