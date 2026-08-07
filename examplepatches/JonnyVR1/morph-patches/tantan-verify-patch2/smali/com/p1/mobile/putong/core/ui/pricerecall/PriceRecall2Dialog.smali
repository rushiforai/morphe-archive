.class public Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/x20;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_discount_retain"

    .line 5
    .line 6
    const-string v0, "p_discount_retain"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic g(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;)Lcom/p1/mobile/android/app/Dialog;
    .locals 6
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ll/x20;",
            ")",
            "Lcom/p1/mobile/android/app/Dialog;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/rec0;->d:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v1, v0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget v4, Ll/dgc0;->j:I

    .line 32
    .line 33
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v4, Ll/h9c0;->g0:I

    .line 38
    .line 39
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->r(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/high16 v1, 0x41400000    # 12.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/16 v5, 0x82

    .line 58
    .line 59
    invoke-virtual {p0, v4, v3, v1, v5}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p1}, Ll/du80;->h(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v1, Ll/kt80;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/kt80;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 74
    .line 75
    .line 76
    new-instance v3, Ll/lt80;

    .line 77
    .line 78
    invoke-direct {v3, p2, p0}, Ll/lt80;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Dialog;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, p1, v1, v3}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->i(Lcom/p1/mobile/putong/core/data/Merchandise;Ll/x20;Ll/x20;)V

    .line 82
    .line 83
    .line 84
    new-instance p1, Ll/mt80;

    .line 85
    .line 86
    invoke-direct {p1, p2}, Ll/mt80;-><init>(Ll/x20;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 90
    .line 91
    .line 92
    const-class p1, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;

    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    const-string p2, "p_discount_retain"

    .line 99
    .line 100
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string v0, "passive"

    .line 105
    .line 106
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    const-string v0, "tooltips_trigger_module"

    .line 111
    .line 112
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const-string v3, "tooltips_trigger_reason"

    .line 121
    .line 122
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    const-string v3, "tooltips_type_ui"

    .line 127
    .line 128
    const-string v4, "alert_self_definition_business_a"

    .line 129
    .line 130
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    filled-new-array {p2, v1, v0, v2, v3}, [Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-virtual {p1, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 142
    .line 143
    .line 144
    new-instance p2, Ll/nt80;

    .line 145
    .line 146
    invoke-direct {p2, p1}, Ll/nt80;-><init>(Ll/l4g0;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, p2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 153
    .line 154
    .line 155
    return-object p0
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rt80;->a(Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Merchandise;Ll/x20;Ll/x20;)V
    .locals 4
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->f:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/ot80;

    .line 4
    .line 5
    invoke-direct {v1, p2}, Ll/ot80;-><init>(Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->b:Lv/VImage;

    .line 12
    .line 13
    new-instance v0, Ll/pt80;

    .line 14
    .line 15
    invoke-direct {v0, p3}, Ll/pt80;-><init>(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->g:Lv/VText;

    .line 22
    .line 23
    new-instance v0, Ll/qt80;

    .line 24
    .line 25
    invoke-direct {v0, p3}, Ll/qt80;-><init>(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->c:Lv/VText;

    .line 32
    .line 33
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->p0:I

    .line 34
    .line 35
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->c:Lv/VText;

    .line 39
    .line 40
    const/4 p3, 0x3

    .line 41
    invoke-static {p3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->f:Lv/VText;

    .line 49
    .line 50
    invoke-static {p3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->g:Lv/VText;

    .line 58
    .line 59
    invoke-static {p3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->f:Lv/VText;

    .line 67
    .line 68
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->q0:I

    .line 69
    .line 70
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 71
    .line 72
    .line 73
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 74
    .line 75
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    const/4 p3, 0x0

    .line 80
    if-nez p2, :cond_0

    .line 81
    .line 82
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    check-cast p2, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 89
    .line 90
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 91
    .line 92
    double-to-long v0, v0

    .line 93
    invoke-static {}, Ll/pzi0;->o()J

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    sub-long/2addr v0, v2

    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const-wide/16 v0, 0x0

    .line 100
    .line 101
    :goto_0
    const-wide/32 v2, 0x5265c00

    .line 102
    .line 103
    .line 104
    cmp-long p2, v0, v2

    .line 105
    .line 106
    if-gez p2, :cond_1

    .line 107
    .line 108
    const-string p2, "0"

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_1
    long-to-double v0, v0

    .line 112
    invoke-static {v0, v1}, Ll/pzi0;->k(D)Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    const/4 v1, 0x4

    .line 121
    if-ne v0, v1, :cond_2

    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    check-cast p2, Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p2, ""

    .line 142
    .line 143
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    goto :goto_1

    .line 151
    :cond_2
    const-string p2, "1"

    .line 152
    .line 153
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 154
    .line 155
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->r0:I

    .line 156
    .line 157
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->s0:I

    .line 158
    .line 159
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 176
    .line 177
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->s0:I

    .line 178
    .line 179
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    invoke-virtual {v1, v2, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->d:Lv/VText;

    .line 188
    .line 189
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->d:Lv/VText;

    .line 201
    .line 202
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    sget v1, Ll/h9c0;->l:I

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 220
    .line 221
    .line 222
    move-result-object p2

    .line 223
    sget v0, Ll/rec0;->e:I

    .line 224
    .line 225
    const/4 v1, 0x0

    .line 226
    invoke-virtual {p2, v0, v1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    check-cast p2, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;

    .line 231
    .line 232
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 233
    .line 234
    const/4 v1, -0x1

    .line 235
    const/4 v2, -0x2

    .line 236
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 237
    .line 238
    .line 239
    const/4 v1, 0x1

    .line 240
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 241
    .line 242
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->e:Landroid/widget/LinearLayout;

    .line 243
    .line 244
    invoke-virtual {p0, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->i0(Lcom/p1/mobile/putong/core/data/Merchandise;Z)V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecall2Dialog;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
