.class public Ll/wn60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final b:Lcom/p1/mobile/android/app/Act;

.field public final c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public e:Lcom/p1/mobile/putong/core/data/Privilege;

.field public f:Ljava/lang/String;

.field public g:Ll/y3m;

.field public h:Z

.field public i:Z

.field public j:Ljava/lang/String;

.field public k:Z

.field public l:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Z

.field public r:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p4, 0x1

    .line 5
    iput-boolean p4, p0, Ll/wn60;->h:Z

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    iput-boolean p4, p0, Ll/wn60;->i:Z

    .line 9
    .line 10
    iput-boolean p4, p0, Ll/wn60;->k:Z

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 44
    .line 45
    iput-boolean p4, p0, Ll/wn60;->r:Z

    .line 46
    .line 47
    iput-object p1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 48
    .line 49
    iput-object p2, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    iput-object p3, p0, Ll/wn60;->c:Ljava/lang/String;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Ll/wn60;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wn60;->m(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/wn60;Ll/y20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wn60;->l(Ll/y20;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public B(Ll/y3m;)Ll/wn60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->g:Ll/y3m;

    .line 2
    .line 3
    return-object p0
.end method

.method public C(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wn60;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    invoke-static {v1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->s7:I

    .line 15
    .line 16
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    const-string v3, "\u5143"

    .line 30
    .line 31
    if-ne v1, v2, :cond_1

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "\u5fae\u4fe1\u8d2d\u4e70\u5e74\u8d39\u95ea\u804a\u7279\u6743\u6682\u65e0\u4f18\u60e0\u4e14\u4e0d\u53ef\u8fde\u7eed\u5305\u5e74\uff0c\u6bcf\u4e2a\u6708"

    .line 36
    .line 37
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, "\u5fae\u4fe1\u8d2d\u4e70\u5e74\u8d39\u201cSVIP\u8d85\u7ea7\u4f1a\u5458\u201d\u6682\u65e0\u4f18\u60e0\u4e14\u4e0d\u53ef\u8fde\u7eed\u5305\u5e74\uff0c\u6bcf\u4e2a\u6708"

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->w9:I

    .line 76
    .line 77
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    :goto_0
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->y9:I

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->x9:I

    .line 92
    .line 93
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    new-instance p3, Ll/th0$a;

    .line 101
    .line 102
    invoke-direct {p3, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 103
    .line 104
    .line 105
    sget v4, Ll/h9c0;->l:I

    .line 106
    .line 107
    invoke-virtual {p1, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    const/4 v4, 0x3

    .line 112
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-static {v1, v0, p1, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p3, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    new-instance p3, Ll/un60;

    .line 129
    .line 130
    invoke-direct {p3, p0, p4, p2}, Ll/un60;-><init>(Ll/wn60;Ll/y20;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, p3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1, v3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    new-instance p2, Ll/vn60;

    .line 142
    .line 143
    invoke-direct {p2, p0, p4}, Ll/vn60;-><init>(Ll/wn60;Ll/y20;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 26
    .line 27
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 28
    .line 29
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Ll/wn60;->l:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Ll/wn60;->l:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 47
    .line 48
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 49
    .line 50
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const-string v0, ""

    .line 56
    .line 57
    :goto_0
    invoke-virtual {p0, p1, p2, v0, p3}, Ll/wn60;->E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreProduct;->c0:Ll/jxd0;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/do60;

    .line 25
    .line 26
    iget-object v1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/do60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ll/do60;->h(Ljava/lang/String;)Ll/do60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v2, 0x1

    .line 48
    const/4 v3, 0x0

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    const-string v1, "alipay"

    .line 52
    .line 53
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    iget-boolean v1, p0, Ll/wn60;->h:Z

    .line 60
    .line 61
    if-eqz v1, :cond_0

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v4, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 72
    .line 73
    invoke-interface {v1, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ab(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_0

    .line 78
    .line 79
    iget-object v1, p0, Ll/wn60;->c:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v4, p0, Ll/wn60;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 82
    .line 83
    invoke-static {v1, v4}, Ll/s7a;->g(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_0

    .line 88
    .line 89
    move v1, v2

    .line 90
    goto :goto_0

    .line 91
    :cond_0
    move v1, v3

    .line 92
    :goto_0
    invoke-virtual {v0, v1}, Ll/do60;->o(Z)Ll/do60;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->K4()Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-eqz v1, :cond_1

    .line 109
    .line 110
    iget-boolean v1, p0, Ll/wn60;->i:Z

    .line 111
    .line 112
    if-eqz v1, :cond_1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    move v2, v3

    .line 116
    :goto_1
    invoke-virtual {v0, v2}, Ll/do60;->f(Z)Ll/do60;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v1, p0, Ll/wn60;->j:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ll/do60;->e(Ljava/lang/String;)Ll/do60;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 129
    .line 130
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->M4(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {v0, p2}, Ll/do60;->n(Ljava/lang/String;)Ll/do60;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    iget-boolean v0, p0, Ll/wn60;->k:Z

    .line 139
    .line 140
    invoke-virtual {p2, v0}, Ll/do60;->m(Z)Ll/do60;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    iget-object v0, p0, Ll/wn60;->f:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p2, v0}, Ll/do60;->j(Ljava/lang/String;)Ll/do60;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    iget-object v0, p0, Ll/wn60;->o:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p2, v0}, Ll/do60;->g(Ljava/lang/String;)Ll/do60;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    iget-object v0, p0, Ll/wn60;->n:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ll/do60;->k(Ljava/lang/String;)Ll/do60;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p2}, Ll/do60;->b()Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    iget-object v0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/PaymentParam;->setPurchaseTrackId(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    new-instance v0, Ll/ndf0;

    .line 172
    .line 173
    invoke-direct {v0}, Ll/ndf0;-><init>()V

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Ll/wn60;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Ll/ndf0;->b(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/ndf0;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0, p2}, Ll/ndf0;->e(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Ll/ndf0;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p2, p1}, Ll/ndf0;->d(Lcom/p1/mobile/putong/data/PayMethod;)Ll/ndf0;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    invoke-virtual {p2}, Ll/ndf0;->a()Ll/mdf0;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    invoke-virtual {p0}, Ll/wn60;->n()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0, p1}, Ll/wn60;->k(Lcom/p1/mobile/putong/data/PayMethod;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    iget-object v1, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    if-eqz v0, :cond_2

    .line 204
    .line 205
    iget-object p0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 206
    .line 207
    invoke-static {v1, p1, p2, p0}, Ll/xl60;->C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 208
    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_2
    iget-object p0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 212
    .line 213
    invoke-static {v1, p1, p2, p0}, Ll/xl60;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 214
    .line 215
    .line 216
    :goto_2
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_3

    .line 221
    .line 222
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    :cond_3
    return-void
.end method

.method public H(Ljava/lang/String;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ib()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p2, "\u8d26\u53f7\u5df2\u51bb\u7ed3\uff0c\u529f\u80fd\u53d7\u9650"

    .line 16
    .line 17
    invoke-static {p2}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p2, Ll/lib0;->Companion:Ll/lib0$a;

    .line 21
    .line 22
    iget-object p0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "user block"

    .line 25
    .line 26
    invoke-virtual {p2, p0, p1, v0}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance v0, Ll/do60;

    .line 31
    .line 32
    iget-object v1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ll/do60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/do60;->h(Ljava/lang/String;)Ll/do60;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v2, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ab(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v2, 0x0

    .line 56
    const/4 v3, 0x1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    iget-object v1, p0, Ll/wn60;->c:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v4, p0, Ll/wn60;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    invoke-static {v1, v4}, Ll/s7a;->g(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    move v1, v3

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move v1, v2

    .line 72
    :goto_0
    invoke-virtual {v0, v1}, Ll/do60;->o(Z)Ll/do60;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->K4()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    iget-boolean v1, p0, Ll/wn60;->i:Z

    .line 91
    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    move v1, v3

    .line 95
    goto :goto_1

    .line 96
    :cond_2
    move v1, v2

    .line 97
    :goto_1
    invoke-virtual {v0, v1}, Ll/do60;->f(Z)Ll/do60;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v1, p0, Ll/wn60;->j:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ll/do60;->e(Ljava/lang/String;)Ll/do60;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v1, p0, Ll/wn60;->f:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ll/do60;->j(Ljava/lang/String;)Ll/do60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-boolean v1, p0, Ll/wn60;->k:Z

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ll/do60;->m(Z)Ll/do60;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 122
    .line 123
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->M4(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {v0, p1}, Ll/do60;->n(Ljava/lang/String;)Ll/do60;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iget-object v0, p0, Ll/wn60;->o:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/do60;->g(Ljava/lang/String;)Ll/do60;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget-object v0, p0, Ll/wn60;->n:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/do60;->k(Ljava/lang/String;)Ll/do60;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1}, Ll/do60;->b()Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iget-object v0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/PaymentParam;->setPurchaseTrackId(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_3

    .line 157
    .line 158
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    :cond_3
    iget-object p2, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    invoke-static {p2}, Ll/bn60;->U(Lcom/p1/mobile/android/app/Act;)V

    .line 168
    .line 169
    .line 170
    new-instance p2, Ll/ndf0;

    .line 171
    .line 172
    invoke-direct {p2}, Ll/ndf0;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/wn60;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 176
    .line 177
    invoke-virtual {p2, v0}, Ll/ndf0;->b(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/ndf0;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    invoke-virtual {p2, v3}, Ll/ndf0;->c(Z)Ll/ndf0;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    invoke-virtual {p2, p1}, Ll/ndf0;->e(Lcom/p1/mobile/putong/core/data/SignPaymentParam;)Ll/ndf0;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    const-string p2, "alipay"

    .line 190
    .line 191
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p1, v0}, Ll/ndf0;->d(Lcom/p1/mobile/putong/data/PayMethod;)Ll/ndf0;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p1}, Ll/ndf0;->a()Ll/mdf0;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p0}, Ll/wn60;->n()V

    .line 204
    .line 205
    .line 206
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p0, v0}, Ll/wn60;->k(Lcom/p1/mobile/putong/data/PayMethod;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    iget-object v1, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 215
    .line 216
    if-eqz v0, :cond_4

    .line 217
    .line 218
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    iget-object p0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 223
    .line 224
    invoke-static {v1, p2, p1, p0}, Ll/xl60;->C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_4
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    iget-object p0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 233
    .line 234
    invoke-static {v1, p2, p1, p0}, Ll/xl60;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Ll/mdf0;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 235
    .line 236
    .line 237
    return-void
.end method

.method public I(ZLjava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/xl60;->p()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "wechat"

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Ll/wn60;->G(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 20
    .line 21
    iget-object p0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 22
    .line 23
    const-string p3, "wx not install"

    .line 24
    .line 25
    invoke-virtual {p1, p0, p2, p3}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/wn60;->d()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 38
    .line 39
    iget-object v0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p2, p3}, Ll/wn60;->H(Ljava/lang/String;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-static {}, Ll/xl60;->k()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    const-string p1, "alipay"

    .line 58
    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p1, p2, p3}, Ll/wn60;->G(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 68
    .line 69
    iget-object p0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 70
    .line 71
    const-string p3, "alipay not install"

    .line 72
    .line 73
    invoke-virtual {p1, p0, p2, p3}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public J(Z)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    if-nez p1, :cond_2

    .line 12
    .line 13
    iget-object p0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->i()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public c(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "alipay"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0, p1, p2}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final d()Z
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
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-boolean p0, p0, Ll/wn60;->h:Z

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_2
    :goto_0
    return v1
.end method

.method public e()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public f(Ll/y20;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/wn60;->J(Z)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v3, v1}, Ll/wn60;->q(ZLcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 51
    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0, v2, p1}, Ll/wn60;->H(Ljava/lang/String;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    return-object v2

    .line 59
    :cond_1
    invoke-virtual {p0, v2, p1}, Ll/wn60;->c(Ljava/lang/String;Ll/y20;)V

    .line 60
    .line 61
    .line 62
    return-object v2

    .line 63
    :cond_2
    const-string p0, ""

    .line 64
    .line 65
    return-object p0
.end method

.method public g(Ll/y20;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wn60;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/wn60;->f(Ll/y20;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const-string v1, ""

    .line 19
    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_4

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/wn60;->J(Z)Z

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0, v4, v2}, Ll/wn60;->q(ZLcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 64
    .line 65
    .line 66
    const-string v2, "alipay"

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    invoke-static {}, Ll/xl60;->k()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-static {v2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0, v3, p1}, Ll/wn60;->G(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 81
    .line 82
    .line 83
    return-object v3

    .line 84
    :cond_2
    const-string p1, "skuID"

    .line 85
    .line 86
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    const-string p1, "platform"

    .line 91
    .line 92
    invoke-static {p1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    const p1, 0x31511

    .line 97
    .line 98
    .line 99
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string v0, "code"

    .line 104
    .line 105
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    const-string p1, "contract_id"

    .line 110
    .line 111
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    const-string p1, "order_type"

    .line 116
    .line 117
    const-string v0, "contract"

    .line 118
    .line 119
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object v8

    .line 123
    const-string p1, "error_message"

    .line 124
    .line 125
    const-string v0, "alipay not install"

    .line 126
    .line 127
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v9

    .line 131
    filled-new-array/range {v4 .. v9}, [Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    const-string v1, "e_purchase_order_response"

    .line 136
    .line 137
    const-string v2, "p_purchase_page"

    .line 138
    .line 139
    invoke-static {v1, v2, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 140
    .line 141
    .line 142
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 143
    .line 144
    iget-object v1, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/wn60;->e()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p1, v1, p0, v0}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-object v3

    .line 154
    :cond_3
    invoke-static {v2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p0, v0, v3, p1}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 159
    .line 160
    .line 161
    return-object v3

    .line 162
    :cond_4
    return-object v1
.end method

.method public h(Ll/y20;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Ll/s7a;->n()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x0

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0, v3}, Ll/wn60;->J(Z)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v2, v0}, Ll/wn60;->q(ZLcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0, v3}, Ll/wn60;->J(Z)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const-string v0, "\u4eac\u4e1c\u652f\u4ed8\u6682\u4e0d\u4eab\u53d7\u4f18\u60e0\uff0c\u5c06\u4ee5\u539f\u4ef7\u8d2d\u4e70"

    .line 55
    .line 56
    invoke-static {v0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    const-string v0, "jingdong"

    .line 60
    .line 61
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0, v1, p1}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 66
    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_2
    const-string p0, ""

    .line 70
    .line 71
    return-object p0
.end method

.method public i(Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "jingdong"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0, p2, p1}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public j(Ll/y20;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/xl60;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 6
    .line 7
    const-string v2, "wechat"

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    if-eqz v0, :cond_5

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_4

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/wn60;->J(Z)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {p0, v4, v5}, Ll/wn60;->q(ZLcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    const/16 v0, 0xc

    .line 70
    .line 71
    if-ne v1, v0, :cond_2

    .line 72
    .line 73
    iget-object v0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 74
    .line 75
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_1

    .line 80
    .line 81
    iget-object v0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_ONLINE_MATCH_TICKETS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 90
    .line 91
    iget-object v1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 92
    .line 93
    if-eq v0, v1, :cond_1

    .line 94
    .line 95
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    :cond_1
    iget-object v0, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    invoke-virtual {p0, v0, v3, p1}, Ll/wn60;->F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 104
    .line 105
    .line 106
    return-object v3

    .line 107
    :cond_2
    invoke-static {v2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0, v3, p1}, Ll/wn60;->G(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 112
    .line 113
    .line 114
    return-object v3

    .line 115
    :cond_3
    invoke-static {v2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0, v3, p1}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    return-object v3

    .line 123
    :cond_5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    goto :goto_1

    .line 136
    :cond_6
    const/4 p1, 0x1

    .line 137
    :goto_1
    const-string v0, "skuID"

    .line 138
    .line 139
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    const-string v0, "platform"

    .line 144
    .line 145
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    const v0, 0x31511

    .line 150
    .line 151
    .line 152
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    const-string v1, "code"

    .line 157
    .line 158
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    if-eqz p1, :cond_7

    .line 163
    .line 164
    const-string v0, "contract"

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_7
    const-string v0, "pay"

    .line 168
    .line 169
    :goto_2
    const-string v1, "order_type"

    .line 170
    .line 171
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    if-eqz p1, :cond_8

    .line 176
    .line 177
    const-string p1, "contract_id"

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_8
    const-string p1, "order_id"

    .line 181
    .line 182
    :goto_3
    invoke-static {p1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    const-string p1, "error_message"

    .line 187
    .line 188
    const-string v0, "wx not install"

    .line 189
    .line 190
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v9

    .line 194
    filled-new-array/range {v4 .. v9}, [Ll/pf60;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    const-string v1, "e_purchase_order_response"

    .line 199
    .line 200
    const-string v2, "p_purchase_page"

    .line 201
    .line 202
    invoke-static {v1, v2, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 203
    .line 204
    .line 205
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 206
    .line 207
    iget-object v1, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p0}, Ll/wn60;->e()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {p1, v1, p0, v0}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    return-object v3
.end method

.method public final k(Lcom/p1/mobile/putong/data/PayMethod;)Z
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/wn60;->p:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-boolean p0, p0, Ll/wn60;->q:Z

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    return v0
.end method

.method public final synthetic l(Ll/y20;Ljava/lang/String;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-object p3, p0, Ll/wn60;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    sget-object p3, Ll/cok0;->a:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Ll/wn60;->c:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    const/4 p3, 0x3

    .line 26
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-interface {p1, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-static {}, Ll/xl60;->k()Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    const-string v0, "alipay"

    .line 38
    .line 39
    if-eqz p3, :cond_1

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p0, p3, p2, p1}, Ll/wn60;->G(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    const-string p1, "skuID"

    .line 50
    .line 51
    const-string p3, ""

    .line 52
    .line 53
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string p1, "platform"

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const p1, 0x31511

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const-string v0, "code"

    .line 71
    .line 72
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    const-string p1, "contract_id"

    .line 77
    .line 78
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    const-string p1, "order_type"

    .line 83
    .line 84
    const-string p3, "contract"

    .line 85
    .line 86
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    const-string p1, "error_message"

    .line 91
    .line 92
    const-string p3, "alipay not install"

    .line 93
    .line 94
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-string v0, "e_purchase_order_response"

    .line 103
    .line 104
    const-string v1, "p_purchase_page"

    .line 105
    .line 106
    invoke-static {v0, v1, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 107
    .line 108
    .line 109
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 110
    .line 111
    iget-object p0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p1, p0, p2, p3}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final synthetic m(Ll/y20;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p2, p0, Ll/wn60;->l:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    iget-object p2, p0, Ll/wn60;->l:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 39
    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p2, ""

    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->i()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v1, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p0, v0, v1}, Ll/wn60;->q(ZLcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    const-string v0, "wechat"

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0, p2, p1}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final n()V
    .locals 0

    .line 1
    invoke-static {}, Ll/s7a;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/br60;->m()Ll/br60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/br60;->B()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public o(Ljava/lang/String;ZLl/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wn60;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p3}, Ll/wn60;->c(Ljava/lang/String;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-eqz p2, :cond_2

    .line 14
    .line 15
    invoke-static {}, Ll/xl60;->p()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    const-string p2, "wechat"

    .line 22
    .line 23
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p2, p1, p3}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object p1, Ll/lib0;->Companion:Ll/lib0$a;

    .line 32
    .line 33
    iget-object p2, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/wn60;->e()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p3, "wx not install"

    .line 40
    .line 41
    invoke-virtual {p1, p2, p0, p3}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    const-string p2, "alipay"

    .line 46
    .line 47
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p0, p2, p1, p3}, Ll/wn60;->p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/do60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/do60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ll/do60;->h(Ljava/lang/String;)Ll/do60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "alipay"

    .line 13
    .line 14
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/wn60;->d()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v3, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ab(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    iget-object v1, p0, Ll/wn60;->c:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p0, Ll/wn60;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 46
    .line 47
    invoke-static {v1, v3}, Ll/s7a;->g(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    move v1, v2

    .line 56
    :goto_0
    invoke-virtual {v0, v1}, Ll/do60;->o(Z)Ll/do60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/wn60;->j:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/do60;->e(Ljava/lang/String;)Ll/do60;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 69
    .line 70
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->M4(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {v0, p2}, Ll/do60;->n(Ljava/lang/String;)Ll/do60;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iget-object v0, p0, Ll/wn60;->f:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p2, v0}, Ll/do60;->j(Ljava/lang/String;)Ll/do60;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    iget-object v0, p0, Ll/wn60;->o:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Ll/do60;->g(Ljava/lang/String;)Ll/do60;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iget-object v0, p0, Ll/wn60;->n:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p2, v0}, Ll/do60;->k(Ljava/lang/String;)Ll/do60;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2}, Ll/do60;->a()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    iget-object v0, p0, Ll/wn60;->m:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/PaymentParam;->setPurchaseTrackId(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/qeb0;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/qeb0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, p2}, Ll/qeb0;->b(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Ll/qeb0;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    new-instance v0, Ll/pow;

    .line 115
    .line 116
    iget-object v1, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    iget-object v3, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 119
    .line 120
    iget-object v4, p0, Ll/wn60;->g:Ll/y3m;

    .line 121
    .line 122
    invoke-direct {v0, v1, v3, v4}, Ll/pow;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/y3m;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, v0}, Ll/qeb0;->c(Ll/bn50;)Ll/qeb0;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p2}, Ll/qeb0;->a()Ll/peb0;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p0}, Ll/wn60;->n()V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/wn60;->b:Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    iget-object p0, p0, Ll/wn60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 139
    .line 140
    invoke-static {v0, p1, p0, p2}, Ll/xl60;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/peb0;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_1

    .line 148
    .line 149
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    :cond_1
    return-void
.end method

.method public final q(ZLcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 1

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->F4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/wn60;->j:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-boolean v0, p0, Ll/wn60;->r:Z

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Ll/wn60;->r:Z

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 42
    .line 43
    const/4 p2, 0x0

    .line 44
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    const-string p1, ""

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_0
    return-void
.end method

.method public r(Ljava/lang/String;)Ll/wn60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/ui/purchase/d;)Ll/wn60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->d:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wn60;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/wn60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wn60;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wn60;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/core/data/Merchandise;)Ll/wn60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->l:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Ljava/lang/String;)Ll/wn60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wn60;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
