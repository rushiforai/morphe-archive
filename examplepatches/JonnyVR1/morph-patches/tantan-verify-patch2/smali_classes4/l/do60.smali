.class public Ll/do60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Z

.field public g:I

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Ljava/lang/String;

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/do60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/data/PurchasePaymentParam;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->new_()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/do60;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v2, p0, Ll/do60;->e:Z

    .line 10
    .line 11
    iput-boolean v2, v0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 12
    .line 13
    iget-object v2, p0, Ll/do60;->h:Ljava/lang/String;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->M4(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    :cond_0
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/do60;->c()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 32
    .line 33
    iget-object v1, p0, Ll/do60;->j:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Ll/do60;->d:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 40
    .line 41
    iget v1, p0, Ll/do60;->g:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 44
    .line 45
    iget-boolean p0, p0, Ll/do60;->f:Z

    .line 46
    .line 47
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->jsBridge:Z

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/PaymentParam;->useJDNew:Z

    .line 51
    .line 52
    return-object v0
.end method

.method public b()Lcom/p1/mobile/putong/core/data/SignPaymentParam;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->new_()Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/do60;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v2, p0, Ll/do60;->e:Z

    .line 10
    .line 11
    iput-boolean v2, v0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 12
    .line 13
    iget-object v2, p0, Ll/do60;->h:Ljava/lang/String;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->M4(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    :cond_0
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/do60;->c()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 32
    .line 33
    iget-object v1, p0, Ll/do60;->j:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 36
    .line 37
    iget-boolean v1, p0, Ll/do60;->i:Z

    .line 38
    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 40
    .line 41
    iget-boolean p0, p0, Ll/do60;->k:Z

    .line 42
    .line 43
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->reSignAfterFail:Z

    .line 44
    .line 45
    return-object v0
.end method

.method public c()Lcom/p1/mobile/putong/data/PaymentParamExtra;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentParamExtra;->new_()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Ll/do60;->m:I

    .line 6
    .line 7
    const/16 v2, 0x20

    .line 8
    .line 9
    if-eq v1, v2, :cond_2

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentParamExtraLandingPageInfo;->new_()Lcom/p1/mobile/putong/data/PaymentParamExtraLandingPageInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Ll/do60;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "quickchatMembership"

    .line 22
    .line 23
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    const-string v3, "svip"

    .line 30
    .line 31
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    :cond_0
    iget-object v3, p0, Ll/do60;->b:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    iget-object v3, p0, Ll/do60;->b:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v3, v1, Lcom/p1/mobile/putong/data/PaymentParamExtraLandingPageInfo;->targetUserId:Ljava/lang/String;

    .line 48
    .line 49
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iput-object v2, v1, Lcom/p1/mobile/putong/data/PaymentParamExtraLandingPageInfo;->category:Ljava/lang/String;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    iput-boolean v2, v1, Lcom/p1/mobile/putong/data/PaymentParamExtraLandingPageInfo;->enablePush:Z

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PaymentParamExtraLandingPageInfo;->toJson()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;->payLandPageInfo:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Ll/do60;->l:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    iget-object v1, p0, Ll/do60;->l:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;->purchaseEnv:Ljava/lang/String;

    .line 75
    .line 76
    :cond_3
    iget-object v1, p0, Ll/do60;->n:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_4

    .line 83
    .line 84
    iget-object p0, p0, Ll/do60;->n:Ljava/lang/String;

    .line 85
    .line 86
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;->discountToken:Ljava/lang/String;

    .line 87
    .line 88
    :cond_4
    return-object v0
.end method

.method public d(I)Ll/do60;
    .locals 0

    .line 1
    iput p1, p0, Ll/do60;->m:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/do60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/do60;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Ll/do60;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/do60;->i:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/lang/String;)Ll/do60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/do60;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/do60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/do60;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Z)Ll/do60;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/do60;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/do60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/do60;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;)Ll/do60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/do60;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(I)Ll/do60;
    .locals 0

    .line 1
    iput p1, p0, Ll/do60;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Z)Ll/do60;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/do60;->k:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/do60;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/do60;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)Ll/do60;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/do60;->e:Z

    .line 2
    .line 3
    return-object p0
.end method
