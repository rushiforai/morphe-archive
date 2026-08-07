.class public Ll/fhj;
.super Ll/im60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fhj$a;
    }
.end annotation


# instance fields
.field public R:Lv/VFrame;

.field public S:Lv/VText;

.field public T:Lv/VFrame;

.field public U:Lv/VText;

.field public V:Lv/VText;

.field public W:Landroid/widget/TextView;

.field public X:Lcom/p1/mobile/putong/core/data/Privilege;

.field public Y:Z

.field public Z:Z

.field public a0:Ljava/lang/String;

.field public final b0:Ljava/lang/String;

.field public c0:Ll/y20;

.field public d0:Landroid/view/View$OnClickListener;

.field public e0:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/im60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/fhj;->Y:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/fhj;->Z:Z

    .line 8
    .line 9
    const-class p1, Ll/fhj;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/fhj;->b0:Ljava/lang/String;

    .line 16
    .line 17
    new-instance p1, Ll/bhj;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/bhj;-><init>(Ll/fhj;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/fhj;->d0:Landroid/view/View$OnClickListener;

    .line 23
    .line 24
    new-instance p1, Ll/chj;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/chj;-><init>(Ll/fhj;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/fhj;->e0:Landroid/view/View$OnClickListener;

    .line 30
    .line 31
    return-void
.end method

.method private B0()Ljava/lang/CharSequence;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q9:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s9:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    if-ne v0, v1, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->E9:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 72
    .line 73
    if-ne v0, v1, :cond_4

    .line 74
    .line 75
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->g9:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_4
    invoke-static {v1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_9

    .line 89
    .line 90
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Z9:I

    .line 91
    .line 92
    iget-object v1, p0, Ll/fhj;->X:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 93
    .line 94
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->intl_visitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 95
    .line 96
    if-ne v1, v2, :cond_5

    .line 97
    .line 98
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->F2:I

    .line 99
    .line 100
    :goto_1
    move v1, v0

    .line 101
    goto :goto_2

    .line 102
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 105
    .line 106
    invoke-virtual {v1}, Ll/z99;->j3()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-eqz v1, :cond_6

    .line 111
    .line 112
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->D9:I

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_6
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->A9:I

    .line 116
    .line 117
    move v6, v1

    .line 118
    move v1, v0

    .line 119
    move v0, v6

    .line 120
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-interface {v2}, Ll/r97;->B()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_7

    .line 133
    .line 134
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->w3:I

    .line 135
    .line 136
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v3:I

    .line 137
    .line 138
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bn()J

    .line 147
    .line 148
    .line 149
    move-result-wide v2

    .line 150
    const-wide/16 v4, 0x0

    .line 151
    .line 152
    cmp-long v2, v2, v4

    .line 153
    .line 154
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    if-eqz v2, :cond_8

    .line 157
    .line 158
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0

    .line 163
    :cond_8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    return-object p0

    .line 168
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 169
    .line 170
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 171
    .line 172
    if-ne v0, v1, :cond_b

    .line 173
    .line 174
    iget-object v0, p0, Ll/fhj;->V:Lv/VText;

    .line 175
    .line 176
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 177
    .line 178
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    sget v2, Ll/h9c0;->C:I

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Ll/joa;->g4()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 196
    .line 197
    if-eqz v0, :cond_a

    .line 198
    .line 199
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->c7:I

    .line 200
    .line 201
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    return-object p0

    .line 206
    :cond_a
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->b7:I

    .line 207
    .line 208
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    return-object p0

    .line 213
    :cond_b
    const/4 p0, 0x0

    .line 214
    return-object p0
.end method

.method private synthetic E0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Ll/fhj;->Z:Z

    .line 2
    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string v0, ""

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const-string p1, "1"

    .line 63
    .line 64
    :goto_1
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v2, "tttSeeWhoLikedMe"

    .line 71
    .line 72
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_2

    .line 77
    .line 78
    const-string v0, "see"

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    const-string v2, "tttVip"

    .line 82
    .line 83
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    const-string v0, "vip"

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    const-string v2, "tttSvipGoogleplay"

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_4

    .line 99
    .line 100
    const-string v0, "svip"

    .line 101
    .line 102
    :cond_4
    :goto_2
    invoke-direct {p0, v0, p1}, Ll/fhj;->L0(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_5
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    const-string p1, "p_purchase_page"

    .line 109
    .line 110
    invoke-static {p0, p1}, Ll/otp0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method private J0(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/fhj;->A0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/fhj;->V:Lv/VText;

    .line 6
    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 14
    .line 15
    .line 16
    move-result-object v0

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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-double v2, v2

    .line 28
    div-double/2addr v0, v2

    .line 29
    const-wide v2, 0x3feb333340000000L    # 0.8500000238418579

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    mul-double/2addr v0, v2

    .line 35
    invoke-static {v0, v1}, Ll/a9g0;->b(D)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 48
    .line 49
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v0, "%s %s"

    .line 54
    .line 55
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v1, p0, Ll/fhj;->V:Lv/VText;

    .line 64
    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U2:I

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const-string v0, "Google Pay"

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 81
    .line 82
    invoke-virtual {v0}, Ll/nd9;->o3()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    iget-object v2, p0, Ll/fhj;->S:Lv/VText;

    .line 91
    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    iget-boolean v0, p0, Ll/fhj;->Z:Z

    .line 95
    .line 96
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->D3:I

    .line 101
    .line 102
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    goto :goto_1

    .line 107
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->C3:I

    .line 108
    .line 109
    const-string v3, "15%"

    .line 110
    .line 111
    filled-new-array {v3, p1}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {v1, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    :goto_1
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_2
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :goto_2
    iget-boolean p1, p0, Ll/fhj;->Z:Z

    .line 127
    .line 128
    const-string v0, "p_purchase_page"

    .line 129
    .line 130
    if-eqz p1, :cond_3

    .line 131
    .line 132
    iget-object p0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string p1, "productType"

    .line 143
    .line 144
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    filled-new-array {p0}, [Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    const-string p1, "e_purchase_button_web"

    .line 153
    .line 154
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_3
    const-string p0, "e_web_purchase"

    .line 159
    .line 160
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_4
    const/4 p1, 0x0

    .line 165
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Ll/fhj;->S:Lv/VText;

    .line 169
    .line 170
    iget-object p0, p0, Ll/fhj;->a0:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method private K0(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    const-string v2, "skuID"

    .line 6
    .line 7
    const-string v3, "showFrom"

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 12
    .line 13
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "vip_purchase_click"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 28
    .line 29
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "see_purchase_click"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    .line 41
    if-ne v0, v1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 44
    .line 45
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "superlike_purchase_click"

    .line 50
    .line 51
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 56
    .line 57
    if-ne v0, v1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 60
    .line 61
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "boost_purchase_click"

    .line 66
    .line 67
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void
.end method

.method private L0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/niw;->f(Ljava/lang/String;Z)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "productType"

    .line 34
    .line 35
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, "m"

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v3, "default_duration"

    .line 57
    .line 58
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "tracker"

    .line 63
    .line 64
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v2, "e_purchase_button_web"

    .line 73
    .line 74
    const-string v3, "p_purchase_page"

    .line 75
    .line 76
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/nd9;->q3()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    if-eqz v1, :cond_0

    .line 90
    .line 91
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 92
    .line 93
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 101
    .line 102
    invoke-virtual {v2}, Ll/nd9;->m3()Lcom/p1/mobile/putong/core/data/NativeConfig;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v2, v3, p1, p2}, Ll/nd9;->k3(Lcom/p1/mobile/putong/core/data/NativeConfig;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance p2, Ll/dhj;

    .line 115
    .line 116
    invoke-direct {p2, p0, v0}, Ll/dhj;-><init>(Ll/fhj;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/ehj;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/ehj;-><init>(Ll/fhj;)V

    .line 122
    .line 123
    .line 124
    const/4 p0, 0x0

    .line 125
    invoke-static {p2, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 136
    .line 137
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->thirdPartConfig:Lcom/p1/mobile/putong/core/data/ThirdPartConfig;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ThirdPartConfig;->thirdPartLandPage:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v2, p0, p1, p2, v0}, Ll/otp0;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method private M0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->S0:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 28
    .line 29
    iget-boolean v1, v0, Ll/nd9;->R:Z

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v0, v0, Ll/nd9;->W:Ljava/util/ArrayList;

    .line 34
    .line 35
    sget v1, Ll/uqb0;->f0:I

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    :goto_0
    iput-boolean v0, p0, Ll/fhj;->Y:Z

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/nd9;->p3()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput-boolean v0, p0, Ll/fhj;->Z:Z

    .line 61
    .line 62
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nd9;->m3()Lcom/p1/mobile/putong/core/data/NativeConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Ll/fhj;->Z:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/NativeConfig;->btnBgColor:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    :try_start_0
    iget-object v1, p0, Ll/fhj;->R:Lv/VFrame;

    .line 28
    .line 29
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/NativeConfig;->btnBgColor:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    sget v3, Ll/qa00;->i:I

    .line 36
    .line 37
    int-to-float v3, v3

    .line 38
    invoke-static {v2, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/NativeConfig;->btnTextColor:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_0

    .line 52
    .line 53
    iget-object p0, p0, Ll/fhj;->S:Lv/VText;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NativeConfig;->btnTextColor:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void

    .line 65
    :catch_0
    move-exception p0

    .line 66
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    sget v0, Ll/jbc0;->c1:I

    .line 71
    .line 72
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 73
    .line 74
    invoke-static {v1}, Ll/wib0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 81
    .line 82
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    sget v0, Ll/jbc0;->a1:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    sget v0, Ll/jbc0;->b1:I

    .line 92
    .line 93
    :cond_3
    :goto_0
    iget-object v1, p0, Ll/fhj;->R:Lv/VFrame;

    .line 94
    .line 95
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static synthetic v0(Ll/fhj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fhj;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w0(Ll/fhj;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fhj;->F0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;)V

    return-void
.end method

.method public static synthetic x0(Ll/fhj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fhj;->E0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y0(Ll/fhj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fhj;->G0(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->t()Z

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
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p0, Ll/fhj;->Y:Z

    .line 10
    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/fhj;->Z:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return v1

    .line 19
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public C0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fhj;->d0:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fhj;->R:Lv/VFrame;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iget-object v2, p0, Ll/fhj;->c0:Ll/y20;

    .line 65
    .line 66
    invoke-virtual {p0, v1, v0, v2, p1}, Ll/fhj;->I0(ZLjava/lang/String;Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0, v0}, Ll/fhj;->K0(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    iget-object p1, p0, Ll/fhj;->c0:Ll/y20;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    invoke-static {}, Ll/cjj;->L()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/fhj;->c0:Ll/y20;

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    return-void
.end method

.method public final synthetic F0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v0, "tantan://intlNativeRecharge?url="

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->paymentRequest:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/nd9;->u3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;

    .line 43
    .line 44
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->hideNavigationBar:Z

    .line 45
    .line 46
    iget-boolean v6, p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->hardwareAccelerated:Z

    .line 47
    .line 48
    iget-boolean v7, p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->isUseMkWebView:Z

    .line 49
    .line 50
    move-object v3, p1

    .line 51
    invoke-static/range {v1 .. v7}, Ll/otp0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final synthetic G0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final H0(Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v0, "platform"

    .line 2
    .line 3
    const-string v1, "googleplay"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v0, "productType"

    .line 10
    .line 11
    invoke-static {v0, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string p5, "skuID"

    .line 16
    .line 17
    invoke-static {p5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-object p1, p0, Ll/im60;->t:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p5, "purchaseShowFrom"

    .line 28
    .line 29
    invoke-static {p5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    iget-object p0, p0, Ll/fhj;->X:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    invoke-static {p0}, Ll/mib0;->m(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "first_carousel_page"

    .line 40
    .line 41
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string p0, "price"

    .line 46
    .line 47
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    const-string p0, "currency_code"

    .line 56
    .line 57
    invoke-static {p0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "e_purchase_button"

    .line 66
    .line 67
    const-string p2, "p_purchase_page"

    .line 68
    .line 69
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final I0(ZLjava/lang/String;Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v1, 0x0

    .line 2
    :try_start_0
    const-string v0, ""

    .line 3
    .line 4
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 21
    .line 22
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 23
    .line 24
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 25
    .line 26
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 33
    .line 34
    move-object v9, v2

    .line 35
    :goto_0
    move-object v6, v0

    .line 36
    move-wide v7, v3

    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    move-object v5, p0

    .line 40
    goto :goto_2

    .line 41
    :cond_0
    const-wide/16 v3, 0x0

    .line 42
    .line 43
    move-object v9, v1

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    move-object v5, p0

    .line 54
    :try_start_1
    invoke-virtual/range {v5 .. v10}, Ll/fhj;->H0(Ljava/lang/String;DLjava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    const-string p0, "purchase_button_click"

    .line 64
    .line 65
    const-string v0, "currency"

    .line 66
    .line 67
    const-string v2, "platform"

    .line 68
    .line 69
    const-string v3, "android"

    .line 70
    .line 71
    filled-new-array {v0, v9, v2, v3}, [Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {p0, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    .line 77
    .line 78
    goto :goto_3

    .line 79
    :catchall_1
    move-exception v0

    .line 80
    :goto_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 81
    .line 82
    const-string v2, "Failed to generate payment params"

    .line 83
    .line 84
    invoke-direct {p0, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    :goto_3
    new-instance p0, Ll/hso;

    .line 91
    .line 92
    iget-object v0, v5, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    iget-object v2, v5, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 95
    .line 96
    invoke-direct {p0, v0, v2}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, v5, Ll/im60;->B:Ljava/lang/Object;

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ll/hso;->u(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Ll/fhj$a;

    .line 105
    .line 106
    iget-object v2, v5, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    iget-object v3, v5, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 109
    .line 110
    invoke-direct {v0, v2, v3, p4, p2}, Ll/fhj$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/hso;->t(Ll/bn50;)V

    .line 114
    .line 115
    .line 116
    iget-object p4, v5, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 117
    .line 118
    invoke-static {p4}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 119
    .line 120
    .line 121
    move-result p4

    .line 122
    if-eqz p4, :cond_2

    .line 123
    .line 124
    invoke-virtual {p0, p3}, Ll/hso;->s(Ll/y20;)V

    .line 125
    .line 126
    .line 127
    const/4 v0, 0x1

    .line 128
    invoke-virtual {p0, v0}, Ll/hso;->r(Z)V

    .line 129
    .line 130
    .line 131
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_4

    .line 144
    .line 145
    iget-object v0, v5, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 146
    .line 147
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 148
    .line 149
    if-ne v0, v2, :cond_4

    .line 150
    .line 151
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object v0, v0, Ll/ijj;->c:Ll/wyd0;

    .line 156
    .line 157
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_4

    .line 168
    .line 169
    iget-object p2, v5, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 170
    .line 171
    instance-of v0, p2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 172
    .line 173
    if-eqz v0, :cond_3

    .line 174
    .line 175
    move-object v0, p2

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 177
    .line 178
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    :cond_3
    invoke-static {p2, v1}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iget-object v0, v0, Ll/ijj;->d:Ll/wyd0;

    .line 195
    .line 196
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    check-cast v0, Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    iget-object v2, v5, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 207
    .line 208
    invoke-virtual {v1, v2}, Ll/ijj;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {p0, p2, p1, v0, v1}, Ll/hso;->q(Ll/aso;ZLjava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    goto :goto_4

    .line 216
    :cond_4
    iget-object v0, v5, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 217
    .line 218
    instance-of v2, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 219
    .line 220
    if-eqz v2, :cond_5

    .line 221
    .line 222
    move-object v1, v0

    .line 223
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 224
    .line 225
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {v1}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    :cond_5
    invoke-static {v0, v1}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {p0, v0, p1, p2}, Ll/hso;->p(Ll/aso;ZLjava/lang/String;)V

    .line 238
    .line 239
    .line 240
    :goto_4
    if-nez p4, :cond_6

    .line 241
    .line 242
    const/4 p0, 0x0

    .line 243
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    :cond_6
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->T2:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/fhj;->z0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_2

    .line 40
    .line 41
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-eqz p2, :cond_1

    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r:I

    .line 79
    .line 80
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    iput-object p2, p0, Ll/fhj;->a0:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    :goto_0
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q:I

    .line 90
    .line 91
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iput-object p2, p0, Ll/fhj;->a0:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/a0;->e:Ll/jxd0;

    .line 103
    .line 104
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    check-cast p2, Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_3

    .line 115
    .line 116
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->i2:I

    .line 119
    .line 120
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    iput-object p2, p0, Ll/fhj;->a0:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_3
    invoke-direct {p0}, Ll/fhj;->B0()Ljava/lang/CharSequence;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    iput-object p2, p0, Ll/fhj;->a0:Ljava/lang/String;

    .line 136
    .line 137
    :goto_1
    invoke-direct {p0}, Ll/fhj;->M0()V

    .line 138
    .line 139
    .line 140
    iget-object p2, p0, Ll/fhj;->V:Lv/VText;

    .line 141
    .line 142
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    iget-object p2, p0, Ll/fhj;->S:Lv/VText;

    .line 146
    .line 147
    iget-object v0, p0, Ll/fhj;->a0:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    invoke-direct {p0}, Ll/fhj;->u()V

    .line 153
    .line 154
    .line 155
    iget-object p2, p0, Ll/fhj;->R:Lv/VFrame;

    .line 156
    .line 157
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 162
    .line 163
    const/high16 v0, 0x41400000    # 12.0f

    .line 164
    .line 165
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 170
    .line 171
    iget-object p0, p0, Ll/fhj;->R:Lv/VFrame;

    .line 172
    .line 173
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 174
    .line 175
    .line 176
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/im60;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    invoke-direct {p0, p1}, Ll/fhj;->J0(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public c0(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fhj;->W:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/fhj;->W:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    sget v1, Ll/h9c0;->C:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget v1, Ll/h9c0;->q:I

    .line 24
    .line 25
    :goto_0
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/fhj;->W:Landroid/widget/TextView;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/fhj;->W:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 2

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/ui/purchase/d;->k:Z

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    if-eq v1, p1, :cond_1

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "tttSeeWhoLikedMe"

    .line 41
    .line 42
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const/4 v0, 0x0

    .line 51
    :goto_1
    invoke-super {p0, p1}, Ll/im60;->g0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 52
    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/fhj;->C0()V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fhj;->X:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fhj;->c0:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p0, Ll/fhj;->R:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fhj;->A0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/fhj;->e0:Landroid/view/View$OnClickListener;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/fhj;->d0:Landroid/view/View$OnClickListener;

    .line 15
    .line 16
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/fhj;->V:Lv/VText;

    .line 20
    .line 21
    iget-object p0, p0, Ll/fhj;->d0:Landroid/view/View$OnClickListener;

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public final z0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ghj;->a(Ll/fhj;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
