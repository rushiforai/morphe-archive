.class public Ll/ou80;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public A:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public B:Landroid/view/View;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lv/VText;

.field public G:Landroid/widget/RelativeLayout;

.field public H:Landroid/widget/TextView;

.field public I:Lv/VText;

.field public J:Lv/VText;

.field public K:Lv/VText;

.field public final L:Lcom/p1/mobile/android/app/Act;

.field public final M:Ll/x20;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final N:Ljava/lang/String;

.field public final O:Ljava/lang/Object;

.field public P:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public Q:Ll/l4g0;

.field public R:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public S:Ljava/text/DecimalFormat;

.field public T:Ljava/lang/String;

.field public U:Ljava/lang/String;

.field public V:Ll/lib0;

.field public final W:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VText_AutoFit;

.field public o:Lv/VText;

.field public p:Lv/VText_AutoFit;

.field public q:Landroid/view/View;

.field public r:Landroid/widget/LinearLayout;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Landroid/widget/LinearLayout;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/dgc0;->b:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ou80;->W:Ljava/util/List;

    .line 13
    .line 14
    iput-object p1, p0, Ll/ou80;->L:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iput-object p5, p0, Ll/ou80;->O:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance p5, Ll/fu80;

    .line 19
    .line 20
    invoke-direct {p5, p0, p1, p2}, Ll/fu80;-><init>(Ll/ou80;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    iput-object p5, p0, Ll/ou80;->M:Ll/x20;

    .line 24
    .line 25
    iput-object p3, p0, Ll/ou80;->P:Ljava/util/List;

    .line 26
    .line 27
    iput-object p4, p0, Ll/ou80;->N:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic E(Ll/ou80;Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ou80;->Z(Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public static synthetic G(Ll/ou80;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ou80;->W(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic H(Ll/ou80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ou80;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/ou80;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ou80;->V(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic J(Ll/ou80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ou80;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/ou80;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ou80;->c0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    return-void
.end method

.method public static synthetic L(Ll/ou80;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ou80;->d0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic M(Ll/ou80;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ou80;->b0(Ll/y20;)V

    return-void
.end method

.method public static synthetic N(Ll/ou80;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ou80;->a0(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static Q(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "tttVip"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, "svip"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    return-object p0
.end method

.method private S()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ou80;->P:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/ou80;->P:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-le v0, v2, :cond_0

    .line 15
    .line 16
    invoke-static {v1}, Ll/du80;->h(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 29
    .line 30
    iput-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 31
    .line 32
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/ou80;->S:Ljava/text/DecimalFormat;

    .line 33
    .line 34
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/ou80;->T:Ljava/lang/String;

    .line 45
    .line 46
    return-void
.end method

.method private U()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ou80;->R()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gu80;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gu80;-><init>(Ll/ou80;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/hu80;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/hu80;-><init>(Ll/ou80;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ljava/text/DecimalFormat;

    .line 24
    .line 25
    const-string v1, "#.#"

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/ou80;->S:Ljava/text/DecimalFormat;

    .line 31
    .line 32
    sget-object v1, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ou80;->x:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/16 v1, 0x11

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/ou80;->y:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/ou80;->D:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Ll/ou80;->S()V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_0

    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_0

    .line 92
    .line 93
    iget-object v0, p0, Ll/ou80;->H:Landroid/widget/TextView;

    .line 94
    .line 95
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->h:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    iget-object v0, p0, Ll/ou80;->H:Landroid/widget/TextView;

    .line 102
    .line 103
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->C:I

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 106
    .line 107
    .line 108
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const/4 v1, 0x1

    .line 121
    if-eqz v0, :cond_1

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v2, p0, Ll/ou80;->I:Lv/VText;

    .line 136
    .line 137
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/ou80;->I:Lv/VText;

    .line 141
    .line 142
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    :cond_1
    iget-object v0, p0, Ll/ou80;->k:Lv/VImage;

    .line 146
    .line 147
    new-instance v2, Ll/iu80;

    .line 148
    .line 149
    invoke-direct {v2, p0}, Ll/iu80;-><init>(Ll/ou80;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/ou80;->B:Landroid/view/View;

    .line 156
    .line 157
    new-instance v2, Ll/ju80;

    .line 158
    .line 159
    invoke-direct {v2, p0}, Ll/ju80;-><init>(Ll/ou80;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/ou80;->T()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/ou80;->j0()V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/ou80;->t:Landroid/widget/LinearLayout;

    .line 172
    .line 173
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 174
    .line 175
    .line 176
    const/4 v0, 0x0

    .line 177
    move v2, v0

    .line 178
    :goto_1
    iget-object v3, p0, Ll/ou80;->P:Ljava/util/List;

    .line 179
    .line 180
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-ge v2, v3, :cond_3

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    sget v4, Ll/rec0;->f:I

    .line 195
    .line 196
    const/4 v5, 0x0

    .line 197
    invoke-virtual {v3, v4, v5, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    check-cast v3, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;

    .line 202
    .line 203
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 204
    .line 205
    const/high16 v5, 0x43950000    # 298.0f

    .line 206
    .line 207
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    const/high16 v6, 0x43200000    # 160.0f

    .line 212
    .line 213
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 218
    .line 219
    .line 220
    const/high16 v5, 0x3f800000    # 1.0f

    .line 221
    .line 222
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 223
    .line 224
    iget-object v5, p0, Ll/ou80;->t:Landroid/widget/LinearLayout;

    .line 225
    .line 226
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 227
    .line 228
    .line 229
    iget-object v4, p0, Ll/ou80;->P:Ljava/util/List;

    .line 230
    .line 231
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 236
    .line 237
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;->b(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 238
    .line 239
    .line 240
    if-nez v2, :cond_2

    .line 241
    .line 242
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;->setSelectState(Z)V

    .line 243
    .line 244
    .line 245
    goto :goto_2

    .line 246
    :cond_2
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;->setSelectState(Z)V

    .line 247
    .line 248
    .line 249
    :goto_2
    iget-object v4, p0, Ll/ou80;->W:Ljava/util/List;

    .line 250
    .line 251
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    new-instance v4, Ll/ku80;

    .line 255
    .line 256
    invoke-direct {v4, p0, v3}, Ll/ku80;-><init>(Ll/ou80;Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;)V

    .line 257
    .line 258
    .line 259
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 260
    .line 261
    .line 262
    add-int/lit8 v2, v2, 0x1

    .line 263
    .line 264
    goto :goto_1

    .line 265
    :cond_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 266
    .line 267
    iget-object v1, p0, Ll/ou80;->j:Lv/VImage;

    .line 268
    .line 269
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkdHRExES0hVWUFDMkIzNDVRRUZYTk1UMzVGQlAyWjE0IiwidyI6MTA4MCwiaCI6OTYzLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjE2MjgzM30.webp"

    .line 270
    .line 271
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    new-instance v0, Ll/beb0;

    .line 275
    .line 276
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 277
    .line 278
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 279
    .line 280
    sget-object v2, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->page_discount_callback:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 281
    .line 282
    iget-object v3, p0, Ll/ou80;->N:Ljava/lang/String;

    .line 283
    .line 284
    invoke-direct {v0, v1, v2, v3}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    iput-object v0, p0, Ll/ou80;->V:Ll/lib0;

    .line 288
    .line 289
    const-string v1, "p_purchase_page"

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ll/lib0;->p(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    iget-object v0, p0, Ll/ou80;->V:Ll/lib0;

    .line 295
    .line 296
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 297
    .line 298
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ll/lib0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Ll/ou80;->V:Ll/lib0;

    .line 304
    .line 305
    iget-object v1, p0, Ll/ou80;->P:Ljava/util/List;

    .line 306
    .line 307
    new-instance v2, Ll/lu80;

    .line 308
    .line 309
    invoke-direct {v2, p0}, Ll/lu80;-><init>(Ll/ou80;)V

    .line 310
    .line 311
    .line 312
    invoke-static {v1, v2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    invoke-virtual {v0, v1, p0}, Ll/lib0;->D(Ljava/util/List;I)V

    .line 317
    .line 318
    .line 319
    return-void
.end method

.method private synthetic W(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ou80;->Q:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ou80;->M:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/ou80;->V:Ll/lib0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    const-string v1, "alipay"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 8
    .line 9
    .line 10
    move-result-object v1

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
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v2, v3

    .line 39
    :goto_0
    invoke-virtual {p1, v0, v1, v3, v2}, Ll/lib0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZ)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 45
    .line 46
    invoke-static {p1}, Ll/du80;->c(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "discountproduct"

    .line 51
    .line 52
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v0, p0, Ll/ou80;->P:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {v0}, Ll/du80;->i(Ljava/util/List;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v1, "discountduration"

    .line 63
    .line 64
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Ll/ou80;->N:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v1}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "discountshowfrom"

    .line 75
    .line 76
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    filled-new-array {p1, v0, v1}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string v0, "e_purchase_discount"

    .line 85
    .line 86
    const-string v1, "p_purchase_discount_page"

    .line 87
    .line 88
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    invoke-direct {p0}, Ll/ou80;->e0()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private e0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ou80;->V:Ll/lib0;

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
    iget-object v0, p0, Ll/ou80;->V:Ll/lib0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/lib0;->n()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/xl60;->k()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    sget-object v1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 38
    .line 39
    iget-object p0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "alipay not install"

    .line 46
    .line 47
    invoke-virtual {v1, v0, p0, v2}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    new-instance v1, Ll/wn60;

    .line 52
    .line 53
    iget-object v2, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 56
    .line 57
    invoke-static {v2}, Ll/ou80;->Q(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-object v3, p0, Ll/ou80;->L:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    const-string v4, ""

    .line 64
    .line 65
    invoke-direct {v1, v2, v3, v4, v4}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->F4()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    const/4 v2, 0x0

    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 89
    .line 90
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_2

    .line 95
    .line 96
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_2

    .line 113
    .line 114
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 123
    .line 124
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v1, v0}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 127
    .line 128
    .line 129
    :cond_2
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 132
    .line 133
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 134
    .line 135
    new-instance v3, Ll/nu80;

    .line 136
    .line 137
    invoke-direct {v3, p0}, Ll/nu80;-><init>(Ll/ou80;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1, v2, v0, v3}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method private g0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ou80;->l:Landroid/widget/LinearLayout;

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
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const/16 v0, 0x500

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static h0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const-string p0, "\u4f18\u60e0\u5238\u5df2\u5230\u671f"

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->D(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-static {}, Ll/s7a;->x()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x1

    .line 27
    const/4 v2, 0x0

    .line 28
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 47
    .line 48
    const-string p4, "lowPriceCallback3SVIP"

    .line 49
    .line 50
    invoke-static {p0, p4, p2, p1, p3}, Ll/p6b0;->S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/y20;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ne v0, v1, :cond_3

    .line 59
    .line 60
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    check-cast p2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 77
    .line 78
    const-string p4, "lowPriceCallback3VIP"

    .line 79
    .line 80
    invoke-static {p0, p4, p2, p1, p3}, Ll/p6b0;->S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/y20;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    new-instance v0, Ll/eu80;

    .line 85
    .line 86
    invoke-direct {v0}, Ll/eu80;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {p2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 90
    .line 91
    .line 92
    new-instance v1, Ll/ou80;

    .line 93
    .line 94
    move-object v2, p0

    .line 95
    move-object v3, p1

    .line 96
    move-object v4, p2

    .line 97
    move-object v5, p3

    .line 98
    move-object v6, p4

    .line 99
    invoke-direct/range {v1 .. v6}, Ll/ou80;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ll/ou80;->show()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Ll/ou80;->f0()V

    .line 106
    .line 107
    .line 108
    return-void
.end method


# virtual methods
.method public final O(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pu80;->a(Ll/ou80;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pu80;->b(Ll/ou80;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final R()V
    .locals 4

    .line 1
    const-string v0, "FROM_SVIP_LOW_PRICE"

    .line 2
    .line 3
    invoke-static {v0}, Ll/pta;->s(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/ou80;->J:Lv/VText;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/bn60;->D()Landroid/text/Spannable;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v2, p0, Ll/ou80;->J:Lv/VText;

    .line 19
    .line 20
    new-instance v3, Ll/od0;

    .line 21
    .line 22
    invoke-direct {v3, v1}, Ll/od0;-><init>(Landroid/text/Spannable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/ou80;->J:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Ll/ou80;->G:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const/high16 v2, 0x42700000    # 60.0f

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/high16 v2, 0x42400000    # 48.0f

    .line 41
    .line 42
    :goto_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/ou80;->G:Landroid/widget/RelativeLayout;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    const/high16 v0, -0x40000000    # -2.0f

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const/high16 v0, -0x3e700000    # -18.0f

    .line 57
    .line 58
    :goto_1
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final T()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-static {v0}, Ll/du80;->f(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->z0:I

    .line 10
    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 17
    .line 18
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->y0:I

    .line 19
    .line 20
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v4, " "

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, p0, Ll/ou80;->K:Lv/VText;

    .line 49
    .line 50
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 51
    .line 52
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->y0:I

    .line 53
    .line 54
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v3, v5, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    filled-new-array {v0}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v3, "#ff5435"

    .line 71
    .line 72
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const-string v5, "sans-serif"

    .line 77
    .line 78
    const/4 v6, 0x3

    .line 79
    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    filled-new-array {v7, v5}, [Landroid/graphics/Typeface;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    invoke-static {v5}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-static {v1, v0, v3, v5}, Ll/q8g0;->g0(Ljava/lang/String;Ljava/util/ArrayList;ILjava/util/ArrayList;)Landroid/text/SpannableStringBuilder;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 105
    .line 106
    invoke-static {v0}, Ll/du80;->b(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v1, p0, Ll/ou80;->n:Lv/VText_AutoFit;

    .line 111
    .line 112
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v1, v2, v6}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Ll/ou80;->p:Lv/VText_AutoFit;

    .line 120
    .line 121
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v1, v2, v6}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/ou80;->o:Lv/VText;

    .line 129
    .line 130
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v1, v2, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Ll/ou80;->v:Lv/VText;

    .line 138
    .line 139
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    const/4 v3, 0x1

    .line 144
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Ll/ou80;->w:Lv/VText;

    .line 148
    .line 149
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Ll/ou80;->x:Lv/VText;

    .line 157
    .line 158
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Ll/ou80;->y:Lv/VText;

    .line 166
    .line 167
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 175
    .line 176
    invoke-static {v1}, Ll/du80;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    iget-object v2, p0, Ll/ou80;->n:Lv/VText_AutoFit;

    .line 181
    .line 182
    const-string v5, "tttSeeWhoLikedMe"

    .line 183
    .line 184
    const/4 v6, 0x0

    .line 185
    if-eqz v1, :cond_0

    .line 186
    .line 187
    const-string v1, "\u7eed\u8d39\u300c%s\u300d"

    .line 188
    .line 189
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/ou80;->o:Lv/VText;

    .line 201
    .line 202
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Ll/ou80;->q:Landroid/view/View;

    .line 206
    .line 207
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ll/ou80;->r:Landroid/widget/LinearLayout;

    .line 211
    .line 212
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_0
    const-string v1, "\u300c%s\u300d"

    .line 217
    .line 218
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Ll/ou80;->m:Landroid/widget/LinearLayout;

    .line 230
    .line 231
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 236
    .line 237
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 238
    .line 239
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 240
    .line 241
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    if-eqz v1, :cond_1

    .line 246
    .line 247
    sget v1, Ll/qa00;->k:I

    .line 248
    .line 249
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 250
    .line 251
    iget-object v1, p0, Ll/ou80;->o:Lv/VText;

    .line 252
    .line 253
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 254
    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_1
    sget v1, Ll/qa00;->n:I

    .line 258
    .line 259
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 260
    .line 261
    iget-object v1, p0, Ll/ou80;->o:Lv/VText;

    .line 262
    .line 263
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 264
    .line 265
    .line 266
    :goto_0
    iget-object v1, p0, Ll/ou80;->m:Landroid/widget/LinearLayout;

    .line 267
    .line 268
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Ll/ou80;->q:Landroid/view/View;

    .line 272
    .line 273
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Ll/ou80;->r:Landroid/widget/LinearLayout;

    .line 277
    .line 278
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 282
    .line 283
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 284
    .line 285
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 290
    .line 291
    .line 292
    const-string v1, "tttVip"

    .line 293
    .line 294
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-nez v1, :cond_3

    .line 299
    .line 300
    const-string v1, "svip"

    .line 301
    .line 302
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    if-nez v0, :cond_2

    .line 307
    .line 308
    goto :goto_1

    .line 309
    :cond_2
    iget-object v0, p0, Ll/ou80;->s:Lv/VText;

    .line 310
    .line 311
    const-string v1, "\u5c0a\u4eab\u67e5\u770b\u8c01\u559c\u6b22\u6211\u3001\u95ea\u804a\u3001\u4f18\u5148\u63a8\u8350\u7b49\u5168\u90e816\u9879\u7279\u6743"

    .line 312
    .line 313
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 314
    .line 315
    .line 316
    goto :goto_1

    .line 317
    :cond_3
    iget-object v0, p0, Ll/ou80;->s:Lv/VText;

    .line 318
    .line 319
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->C0:I

    .line 320
    .line 321
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 322
    .line 323
    .line 324
    :goto_1
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 325
    .line 326
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 327
    .line 328
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    iget-object v1, p0, Ll/ou80;->n:Lv/VText_AutoFit;

    .line 333
    .line 334
    if-eqz v0, :cond_4

    .line 335
    .line 336
    const/high16 v0, 0x42000000    # 32.0f

    .line 337
    .line 338
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 339
    .line 340
    .line 341
    goto :goto_2

    .line 342
    :cond_4
    const/high16 v0, 0x42100000    # 36.0f

    .line 343
    .line 344
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 345
    .line 346
    .line 347
    :goto_2
    iget-object v0, p0, Ll/ou80;->p:Lv/VText_AutoFit;

    .line 348
    .line 349
    new-instance v1, Ljava/lang/StringBuilder;

    .line 350
    .line 351
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 352
    .line 353
    .line 354
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 355
    .line 356
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->A0:I

    .line 357
    .line 358
    iget-object v7, p0, Ll/ou80;->S:Ljava/text/DecimalFormat;

    .line 359
    .line 360
    iget-object v8, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 361
    .line 362
    iget-object v9, v8, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 363
    .line 364
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 365
    .line 366
    iget-wide v9, v9, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 367
    .line 368
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 369
    .line 370
    .line 371
    move-result-wide v11

    .line 372
    sub-double/2addr v9, v11

    .line 373
    invoke-virtual {v7, v9, v10}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v7

    .line 377
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v7

    .line 381
    invoke-virtual {v2, v5, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    .line 397
    .line 398
    iget-object v0, p0, Ll/ou80;->P:Ljava/util/List;

    .line 399
    .line 400
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    iget-object v1, p0, Ll/ou80;->t:Landroid/widget/LinearLayout;

    .line 405
    .line 406
    if-le v0, v3, :cond_5

    .line 407
    .line 408
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 409
    .line 410
    .line 411
    iget-object p0, p0, Ll/ou80;->u:Landroid/widget/LinearLayout;

    .line 412
    .line 413
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :cond_5
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Ll/ou80;->u:Landroid/widget/LinearLayout;

    .line 421
    .line 422
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 423
    .line 424
    .line 425
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 428
    .line 429
    .line 430
    move-result v0

    .line 431
    if-eqz v0, :cond_6

    .line 432
    .line 433
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 434
    .line 435
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->D:I

    .line 436
    .line 437
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    goto :goto_3

    .line 442
    :cond_6
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 443
    .line 444
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 445
    .line 446
    .line 447
    move-result v0

    .line 448
    if-eqz v0, :cond_7

    .line 449
    .line 450
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 451
    .line 452
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->E:I

    .line 453
    .line 454
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    goto :goto_3

    .line 459
    :cond_7
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 460
    .line 461
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    if-eqz v0, :cond_8

    .line 466
    .line 467
    const-string v0, "\u534a\u5e74"

    .line 468
    .line 469
    goto :goto_3

    .line 470
    :cond_8
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 471
    .line 472
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 473
    .line 474
    .line 475
    move-result v0

    .line 476
    if-eqz v0, :cond_9

    .line 477
    .line 478
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 479
    .line 480
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->F:I

    .line 481
    .line 482
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    goto :goto_3

    .line 487
    :cond_9
    const-string v0, ""

    .line 488
    .line 489
    :goto_3
    iget-object v1, p0, Ll/ou80;->v:Lv/VText;

    .line 490
    .line 491
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 492
    .line 493
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->o0:I

    .line 494
    .line 495
    new-instance v4, Ljava/lang/StringBuilder;

    .line 496
    .line 497
    const-string v5, "\u00a5"

    .line 498
    .line 499
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    iget-object v6, p0, Ll/ou80;->T:Ljava/lang/String;

    .line 503
    .line 504
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object v4

    .line 511
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v2

    .line 519
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 520
    .line 521
    .line 522
    iget-object v1, p0, Ll/ou80;->w:Lv/VText;

    .line 523
    .line 524
    new-instance v2, Ljava/lang/StringBuilder;

    .line 525
    .line 526
    const-string v3, "/"

    .line 527
    .line 528
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    .line 533
    .line 534
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 539
    .line 540
    .line 541
    iget-object v1, p0, Ll/ou80;->x:Lv/VText;

    .line 542
    .line 543
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 544
    .line 545
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->m0:I

    .line 546
    .line 547
    new-instance v6, Ljava/lang/StringBuilder;

    .line 548
    .line 549
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    iget-object v5, p0, Ll/ou80;->U:Ljava/lang/String;

    .line 553
    .line 554
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v5

    .line 561
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 562
    .line 563
    .line 564
    move-result-object v5

    .line 565
    invoke-virtual {v2, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v2

    .line 569
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 570
    .line 571
    .line 572
    iget-object p0, p0, Ll/ou80;->y:Lv/VText;

    .line 573
    .line 574
    new-instance v1, Ljava/lang/StringBuilder;

    .line 575
    .line 576
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 577
    .line 578
    .line 579
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 587
    .line 588
    .line 589
    return-void
.end method

.method public final synthetic V(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/ou80;->M:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ou80;->W:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;

    .line 18
    .line 19
    if-ne v1, p2, :cond_0

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;->setSelectState(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;->getCurrentMerchandise()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 30
    .line 31
    iget-object v2, p0, Ll/ou80;->V:Ll/lib0;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ll/lib0;->A(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Ll/ou80;->S()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ou80;->j0()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v2, 0x0

    .line 44
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallTellPriceSelectItem;->setSelectState(Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic b0(Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/du80;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ou80;->P:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/mu80;

    .line 14
    .line 15
    invoke-direct {v1, p0, p2}, Ll/mu80;-><init>(Ll/ou80;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;)Lcom/p1/mobile/android/app/Dialog;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 23
    .line 24
    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic d0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f0()V
    .locals 3

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
    iget-object v1, p0, Ll/ou80;->H:Landroid/widget/TextView;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->h:I

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->R9:I

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0}, Ll/ou80;->i0()V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-object v0, p0, Ll/ou80;->H:Landroid/widget/TextView;

    .line 43
    .line 44
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->C:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 47
    .line 48
    .line 49
    :goto_1
    iget-object v0, p0, Ll/ou80;->H:Landroid/widget/TextView;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sget v2, Ll/jbc0;->f3:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v1, p0, Ll/ou80;->I:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Ll/ou80;->I:Lv/VText;

    .line 99
    .line 100
    const/4 v0, 0x1

    .line 101
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    :cond_2
    return-void
.end method

.method public final i0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    double-to-int v0, v0

    .line 18
    iget-object v1, p0, Ll/ou80;->L:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->f:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Ll/ou80;->E:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Ll/ou80;->E:Lv/VText;

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->G:I

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final j0()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->D:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->E:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    const-string v0, "\u534a\u5e74"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 55
    .line 56
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->F:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const-string v0, ""

    .line 64
    .line 65
    :goto_0
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v2, p0, Ll/ou80;->z:Lv/VText;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v3, p0, Ll/ou80;->U:Ljava/lang/String;

    .line 80
    .line 81
    filled-new-array {v0, v3, v0}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v3, "* %1$s\u540e\u7eed\u8d39\u4e3a\u539f\u4ef7\u00a5%2$s/%3$s"

    .line 86
    .line 87
    invoke-static {v1, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 100
    .line 101
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->B0:I

    .line 102
    .line 103
    iget-object v5, p0, Ll/ou80;->U:Ljava/lang/String;

    .line 104
    .line 105
    filled-new-array {v0, v5, v0}, [Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v3, "* %s"

    .line 118
    .line 119
    invoke-static {v1, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    const/4 v1, 0x3

    .line 139
    const/4 v2, 0x4

    .line 140
    const/4 v3, 0x2

    .line 141
    const/4 v4, 0x1

    .line 142
    const/4 v5, 0x0

    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    iget-object v0, p0, Ll/ou80;->C:Lv/VText;

    .line 146
    .line 147
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Ll/ou80;->D:Lv/VText;

    .line 151
    .line 152
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 156
    .line 157
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 158
    .line 159
    .line 160
    iget-object v6, p0, Ll/ou80;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 161
    .line 162
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/widget/a;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 163
    .line 164
    .line 165
    iget-object v6, p0, Ll/ou80;->F:Lv/VText;

    .line 166
    .line 167
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    iget-object v7, p0, Ll/ou80;->E:Lv/VText;

    .line 172
    .line 173
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    .line 174
    .line 175
    .line 176
    move-result v7

    .line 177
    invoke-virtual {v0, v6, v2, v7, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 178
    .line 179
    .line 180
    iget-object v1, p0, Ll/ou80;->F:Lv/VText;

    .line 181
    .line 182
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    iget-object v2, p0, Ll/ou80;->E:Lv/VText;

    .line 187
    .line 188
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    invoke-virtual {v0, v1, v4, v2, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Ll/ou80;->F:Lv/VText;

    .line 196
    .line 197
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    iget-object v2, p0, Ll/ou80;->E:Lv/VText;

    .line 202
    .line 203
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    invoke-virtual {v0, v1, v3, v2, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Ll/ou80;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0}, Ll/ou80;->i0()V

    .line 216
    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_5
    iget-object v0, p0, Ll/ou80;->D:Lv/VText;

    .line 220
    .line 221
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/ou80;->C:Lv/VText;

    .line 225
    .line 226
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Ll/ou80;->E:Lv/VText;

    .line 230
    .line 231
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->q0:I

    .line 232
    .line 233
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(I)V

    .line 234
    .line 235
    .line 236
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 237
    .line 238
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 239
    .line 240
    .line 241
    iget-object v6, p0, Ll/ou80;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 242
    .line 243
    invoke-virtual {v0, v6}, Landroidx/constraintlayout/widget/a;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 244
    .line 245
    .line 246
    iget-object v6, p0, Ll/ou80;->F:Lv/VText;

    .line 247
    .line 248
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    .line 249
    .line 250
    .line 251
    move-result v6

    .line 252
    iget-object v7, p0, Ll/ou80;->E:Lv/VText;

    .line 253
    .line 254
    invoke-virtual {v7}, Landroid/view/View;->getId()I

    .line 255
    .line 256
    .line 257
    move-result v7

    .line 258
    invoke-virtual {v0, v6, v2, v7, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 259
    .line 260
    .line 261
    iget-object v1, p0, Ll/ou80;->F:Lv/VText;

    .line 262
    .line 263
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    iget-object v2, p0, Ll/ou80;->E:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    invoke-virtual {v0, v1, v4, v2, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 274
    .line 275
    .line 276
    iget-object v1, p0, Ll/ou80;->F:Lv/VText;

    .line 277
    .line 278
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    iget-object v2, p0, Ll/ou80;->E:Lv/VText;

    .line 283
    .line 284
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    invoke-virtual {v0, v1, v3, v2, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 289
    .line 290
    .line 291
    iget-object v1, p0, Ll/ou80;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 292
    .line 293
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 294
    .line 295
    .line 296
    :goto_2
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 297
    .line 298
    invoke-static {v0}, Ll/z7a;->t0(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    new-instance v1, Ljava/text/DecimalFormat;

    .line 303
    .line 304
    const-string v2, "0.0"

    .line 305
    .line 306
    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    new-instance v2, Ljava/math/BigDecimal;

    .line 310
    .line 311
    iget-object v3, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 312
    .line 313
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 314
    .line 315
    .line 316
    move-result-wide v6

    .line 317
    int-to-double v8, v0

    .line 318
    div-double/2addr v6, v8

    .line 319
    invoke-direct {v2, v6, v7}, Ljava/math/BigDecimal;-><init>(D)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v2, v4, v5}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    .line 327
    .line 328
    .line 329
    move-result-wide v2

    .line 330
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    iget-object v1, p0, Ll/ou80;->F:Lv/VText;

    .line 335
    .line 336
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 337
    .line 338
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->w0:I

    .line 339
    .line 340
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    .line 350
    .line 351
    iget-object v0, p0, Ll/ou80;->p:Lv/VText_AutoFit;

    .line 352
    .line 353
    invoke-virtual {v0}, Lv/VText_AutoFit;->p()V

    .line 354
    .line 355
    .line 356
    iget-object v0, p0, Ll/ou80;->p:Lv/VText_AutoFit;

    .line 357
    .line 358
    new-instance v1, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 361
    .line 362
    .line 363
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 364
    .line 365
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->A0:I

    .line 366
    .line 367
    iget-object v4, p0, Ll/ou80;->S:Ljava/text/DecimalFormat;

    .line 368
    .line 369
    iget-object v5, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 370
    .line 371
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 372
    .line 373
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 374
    .line 375
    iget-wide v6, v6, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 376
    .line 377
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 378
    .line 379
    .line 380
    move-result-wide v8

    .line 381
    sub-double/2addr v6, v8

    .line 382
    invoke-virtual {v4, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v2

    .line 394
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    const-string v2, " "

    .line 398
    .line 399
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 407
    .line 408
    .line 409
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 410
    .line 411
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    if-nez v0, :cond_7

    .line 416
    .line 417
    iget-object v0, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 418
    .line 419
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-eqz v0, :cond_6

    .line 424
    .line 425
    goto :goto_3

    .line 426
    :cond_6
    return-void

    .line 427
    :cond_7
    :goto_3
    invoke-virtual {p0}, Ll/ou80;->f0()V

    .line 428
    .line 429
    .line 430
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ou80;->L:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, p1, v0}, Ll/ou80;->P(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ou80;->O(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ll/ou80;->g0()V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/ou80;->U()V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "p_purchase_page"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/ou80;->Q:Ll/l4g0;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 28
    .line 29
    invoke-static {v1}, Ll/du80;->c(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "discountproduct"

    .line 34
    .line 35
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/ou80;->P:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {v1}, Ll/du80;->i(Ljava/util/List;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "discountduration"

    .line 49
    .line 50
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ll/ou80;->N:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "discountshowfrom"

    .line 64
    .line 65
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/ou80;->N:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v2, "purchaseShowFrom"

    .line 79
    .line 80
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Ll/ou80;->R:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const-string v2, "productType"

    .line 96
    .line 97
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Ll/ou80;->O:Ljava/lang/Object;

    .line 105
    .line 106
    instance-of v1, v1, Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v1, :cond_0

    .line 109
    .line 110
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iget-object v2, p0, Ll/ou80;->O:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v2, Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ll/rj50;->T(Ljava/lang/String;)Ljava/util/List;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-nez v2, :cond_0

    .line 131
    .line 132
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 133
    .line 134
    .line 135
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    new-array v1, v1, [Ll/pf60;

    .line 140
    .line 141
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Ll/ou80;->Q:Ll/l4g0;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Ll/ou80;->Q:Ll/l4g0;

    .line 150
    .line 151
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method
