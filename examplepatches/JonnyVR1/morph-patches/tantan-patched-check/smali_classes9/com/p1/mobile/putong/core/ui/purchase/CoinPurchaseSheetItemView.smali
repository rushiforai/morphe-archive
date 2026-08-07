.class public Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ie5;->a(Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    const/4 v4, 0x1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const/high16 v1, 0x41900000    # 18.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setAutoSizeTextTypeWithDefaults(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 45
    .line 46
    const/16 v2, 0x9

    .line 47
    .line 48
    const/16 v5, 0xe

    .line 49
    .line 50
    invoke-virtual {v1, v2, v5, v4, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    const/4 v1, -0x2

    .line 55
    invoke-static {v2, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 61
    .line 62
    .line 63
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->a:Landroid/widget/LinearLayout;

    .line 68
    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    sget v1, Ll/jbc0;->G9:I

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    sget v1, Ll/jbc0;->F9:I

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 80
    .line 81
    .line 82
    :goto_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->y()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->e(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Z)V

    .line 101
    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_3
    if-ne p2, v3, :cond_4

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    if-eqz p2, :cond_4

    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->e:Lv/VText;

    .line 113
    .line 114
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->k9:I

    .line 115
    .line 116
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->e:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->c()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    sget v2, Ll/jbc0;->H9:I

    .line 126
    .line 127
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {p2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->e:Lv/VText;

    .line 135
    .line 136
    invoke-static {p2, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->e:Lv/VText;

    .line 141
    .line 142
    const/4 v1, 0x0

    .line 143
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    :goto_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->b:Lv/VText;

    .line 151
    .line 152
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->c:Lv/VText;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    :goto_4
    new-instance p2, Ll/he5;

    .line 178
    .line 179
    invoke-direct {p2, p3, p1}, Ll/he5;-><init>(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->b:Lv/VText;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->num:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "x%s"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->c:Lv/VText;

    .line 23
    .line 24
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 25
    .line 26
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "%s\u63a2\u63a2\u5e01"

    .line 35
    .line 36
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->originalPrice:I

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    if-lez v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move v0, v1

    .line 50
    :goto_0
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->price:I

    .line 51
    .line 52
    int-to-float p1, p1

    .line 53
    const/high16 v2, 0x3f800000    # 1.0f

    .line 54
    .line 55
    mul-float/2addr p1, v2

    .line 56
    int-to-float v0, v0

    .line 57
    div-float/2addr p1, v0

    .line 58
    float-to-double v2, p1

    .line 59
    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    .line 60
    .line 61
    mul-double/2addr v2, v4

    .line 62
    cmpl-double p1, v2, v4

    .line 63
    .line 64
    if-ltz p1, :cond_1

    .line 65
    .line 66
    const-string p1, "7\u5929\u6709\u6548"

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    invoke-static {v2, v3, v1}, Ll/q8g0;->F(DI)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string v0, "7\u5929\u6709\u6548 %s\u6298"

    .line 78
    .line 79
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 89
    .line 90
    if-eqz p2, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    sget v0, Ll/h9c0;->l:I

    .line 97
    .line 98
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    sget v0, Ll/h9c0;->c:I

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 117
    .line 118
    .line 119
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->b:Lv/VText;

    .line 120
    .line 121
    sget p2, Ll/qa00;->o:I

    .line 122
    .line 123
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->c:Lv/VText;

    .line 127
    .line 128
    sget v0, Ll/qa00;->h:I

    .line 129
    .line 130
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 134
    .line 135
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->d:Lv/VText;

    .line 139
    .line 140
    invoke-static {p0, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinPurchaseSheetItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
