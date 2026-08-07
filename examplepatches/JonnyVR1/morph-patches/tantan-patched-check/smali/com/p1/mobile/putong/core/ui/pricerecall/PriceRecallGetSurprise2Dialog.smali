.class public Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static synthetic d(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/util/List;Ll/x20;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-interface {p0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 9
    .line 10
    invoke-static {v0}, Ll/du80;->c(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "discountproduct"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "discountduration"

    .line 21
    .line 22
    invoke-static {p0}, Ll/du80;->i(Ljava/util/List;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "e_got_discount"

    .line 35
    .line 36
    const-string v1, "p_got_discount"

    .line 37
    .line 38
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1}, Ll/x20;->call()V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, p3}, Ll/du80;->d(Z)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "p_promotion,callback_other"

    .line 53
    .line 54
    const/4 p3, 0x0

    .line 55
    invoke-static {p2, p3, p0, p1, p3}, Ll/ou80;->h0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Ll/g1e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Z)Ll/g1e;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;Z)",
            "Ll/g1e;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "p_got_discount"

    .line 16
    .line 17
    invoke-static {v2, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 29
    .line 30
    invoke-static {v3}, Ll/du80;->c(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, "discountproduct"

    .line 35
    .line 36
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    const-string v3, "discountduration"

    .line 41
    .line 42
    invoke-static {p1}, Ll/du80;->i(Ljava/util/List;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    const-string v3, "p_discount_retain"

    .line 51
    .line 52
    const-string v4, "passive"

    .line 53
    .line 54
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    const-string v3, "tooltips_trigger_module"

    .line 59
    .line 60
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    const-string v3, "tooltips_trigger_reason"

    .line 69
    .line 70
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    const-string v3, "tooltips_type_ui"

    .line 75
    .line 76
    const-string v4, "alert_self_definition_business_a"

    .line 77
    .line 78
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    filled-new-array/range {v5 .. v11}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v0, v3}, Ll/l4g0;->p([Ll/pf60;)V

    .line 87
    .line 88
    .line 89
    new-instance v3, Ll/st80;

    .line 90
    .line 91
    invoke-direct {v3}, Ll/st80;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {p1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    sget v4, Ll/rec0;->c:I

    .line 102
    .line 103
    invoke-virtual {v3, v4, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v3, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    sget v4, Ll/dgc0;->j:I

    .line 122
    .line 123
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    sget v4, Ll/h9c0;->g0:I

    .line 128
    .line 129
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->r(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    const/16 v4, 0x82

    .line 138
    .line 139
    invoke-virtual {v3, v2, v2, v2, v4}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    new-instance v3, Ll/tt80;

    .line 148
    .line 149
    invoke-direct {v3, v2}, Ll/tt80;-><init>(Ll/g1e;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1, p0, p1, v3, p2}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->k(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;Z)V

    .line 153
    .line 154
    .line 155
    new-instance p0, Ll/ut80;

    .line 156
    .line 157
    invoke-direct {p0, v0}, Ll/ut80;-><init>(Ll/l4g0;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v2}, Ll/g1e;->show()V

    .line 167
    .line 168
    .line 169
    return-object v2
.end method


# virtual methods
.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bu80;->a(Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ll/x20;",
            "Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_0

    .line 8
    .line 9
    neg-int v2, v1

    .line 10
    const/high16 v3, 0x42080000    # 34.0f

    .line 11
    .line 12
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    mul-int/2addr v2, v3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    sget v4, Ll/rec0;->e:I

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    invoke-virtual {v3, v4, v5, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;

    .line 33
    .line 34
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 35
    .line 36
    const/4 v5, -0x1

    .line 37
    const/4 v6, -0x2

    .line 38
    invoke-direct {v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v0, v2, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    iput v2, v4, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 46
    .line 47
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->e:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 57
    .line 58
    invoke-virtual {v3, v4, v2, p4}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->j0(Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    if-nez p4, :cond_1

    .line 65
    .line 66
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p4

    .line 70
    check-cast p4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 71
    .line 72
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->m(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->f:Lv/VText;

    .line 76
    .line 77
    new-instance v1, Ll/vt80;

    .line 78
    .line 79
    invoke-direct {v1, p2, p3, p1}, Ll/vt80;-><init>(Ljava/util/List;Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->b:Lv/VImage;

    .line 86
    .line 87
    new-instance p4, Ll/wt80;

    .line 88
    .line 89
    invoke-direct {p4, p3}, Ll/wt80;-><init>(Ll/x20;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 102
    .line 103
    const-string p2, "tttVip"

    .line 104
    .line 105
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->c:Lv/VText;

    .line 110
    .line 111
    if-eqz p1, :cond_2

    .line 112
    .line 113
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 114
    .line 115
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->v0:I

    .line 116
    .line 117
    invoke-virtual {p1, p3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->g:Lv/VImage;

    .line 125
    .line 126
    sget p2, Ll/jbc0;->V5:I

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 133
    .line 134
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->u0:I

    .line 135
    .line 136
    invoke-virtual {p1, p3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->g:Lv/VImage;

    .line 144
    .line 145
    sget p2, Ll/jbc0;->U5:I

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 148
    .line 149
    .line 150
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->d:Lv/VText;

    .line 151
    .line 152
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 153
    .line 154
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->t0:I

    .line 155
    .line 156
    invoke-virtual {p1, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->F4()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->L5(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/xt80;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/xt80;-><init>()V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/yt80;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/yt80;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 67
    .line 68
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_1

    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 77
    .line 78
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreProduct;->w0:Ljava/lang/String;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const/4 v2, 0x0

    .line 87
    invoke-virtual {p0, v1, p1, v2, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->N5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance p1, Ll/zt80;

    .line 92
    .line 93
    invoke-direct {p1}, Ll/zt80;-><init>()V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ll/au80;

    .line 97
    .line 98
    invoke-direct {v0}, Ll/au80;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->j(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
