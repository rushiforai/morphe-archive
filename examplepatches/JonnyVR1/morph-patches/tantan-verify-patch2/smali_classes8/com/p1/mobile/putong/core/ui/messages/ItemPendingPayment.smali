.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Landroid/widget/ImageView;

.field public k:Lv/VText;

.field public l:Lv/VLinear;

.field public m:Lv/VCheckBox;

.field public n:Lv/VText;

.field public o:Lcom/p1/mobile/android/app/Act;

.field public p:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

.field public r:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public s:Lcom/p1/mobile/putong/data/PayMethod;

.field public t:Lcom/p1/mobile/putong/core/data/Coupon;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/Runnable;

.field public w:Ljava/text/DecimalFormat;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    const-string p1, "alipay"

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 15
    .line 16
    new-instance p1, Ll/adq;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/adq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 22
    .line 23
    new-instance p1, Ljava/text/DecimalFormat;

    .line 24
    .line 25
    const-string v0, "#.#"

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w:Ljava/text/DecimalFormat;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 35
    const-string p1, "alipay"

    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 36
    new-instance p1, Ll/adq;

    invoke-direct {p1, p0}, Ll/adq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 37
    new-instance p1, Ljava/text/DecimalFormat;

    const-string p2, "#.#"

    invoke-direct {p1, p2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    const-string p1, "alipay"

    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 41
    new-instance p1, Ll/adq;

    invoke-direct {p1, p0}, Ll/adq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 42
    new-instance p1, Ljava/text/DecimalFormat;

    const-string p2, "#.#"

    invoke-direct {p1, p2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w:Ljava/text/DecimalFormat;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 45
    const-string p1, "alipay"

    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 46
    new-instance p1, Ll/adq;

    invoke-direct {p1, p0}, Ll/adq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 47
    new-instance p1, Ljava/text/DecimalFormat;

    const-string p2, "#.#"

    invoke-direct {p1, p2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w:Ljava/text/DecimalFormat;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r(Landroid/view/View;)V

    return-void
.end method

.method private getSubTitle()Ljava/lang/String;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 6
    .line 7
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 28
    .line 29
    iget-wide v5, v4, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 30
    .line 31
    long-to-double v2, v2

    .line 32
    sub-double/2addr v5, v2

    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    cmpl-double v2, v5, v2

    .line 36
    .line 37
    if-lez v2, :cond_0

    .line 38
    .line 39
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Coupon;->getCouponPrice()D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 44
    .line 45
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 46
    .line 47
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w:Ljava/text/DecimalFormat;

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "%s\u4e2a\u6708\u4ec5\u9700%s\u5143"

    .line 62
    .line 63
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method private setNoDataView(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->f:Lv/VText;

    .line 7
    .line 8
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->x6:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->g:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->l:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private u()V
    .locals 11

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 14
    .line 15
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->u:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 18
    .line 19
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 20
    .line 21
    new-instance v10, Ll/fdq;

    .line 22
    .line 23
    invoke-direct {v10, p0}, Ll/fdq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    .line 24
    .line 25
    .line 26
    const-string v9, "p_navigation,privilege_button"

    .line 27
    .line 28
    invoke-interface/range {v1 .. v10}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ci(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private v()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->h()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 23
    .line 24
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->endTime:J

    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->vt(J)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->k:Lv/VText;

    .line 31
    .line 32
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->j(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 56
    .line 57
    const-wide/16 v1, 0x3e8

    .line 58
    .line 59
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w()V

    .line 64
    .line 65
    .line 66
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->setNoDataView(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gdq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h()Z
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ag()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 14
    .line 15
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->endTime:J

    .line 16
    .line 17
    cmp-long v4, v2, v0

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    if-gez v4, :cond_0

    .line 21
    .line 22
    return v5

    .line 23
    :cond_0
    cmp-long v0, v2, v0

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 36
    .line 37
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->endTime:J

    .line 38
    .line 39
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->lf(J)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 43
    .line 44
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->endTime:J

    .line 45
    .line 46
    invoke-static {}, Ll/pzi0;->o()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    sub-long/2addr v0, v2

    .line 51
    const-wide/16 v2, 0x0

    .line 52
    .line 53
    cmp-long p0, v0, v2

    .line 54
    .line 55
    if-gtz p0, :cond_2

    .line 56
    .line 57
    return v5

    .line 58
    :cond_2
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public final i()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Sj()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->w()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 28
    .line 29
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final j(Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    invoke-interface {v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ng(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string p0, "\u514d\u5bc6\u652f\u4ed8\u00b7"

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string p0, "\u53bb\u652f\u4ed8\u00b7"

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method public final k()V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->t:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 20
    .line 21
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 22
    .line 23
    long-to-double v0, v0

    .line 24
    sub-double/2addr v2, v0

    .line 25
    const-wide/16 v0, 0x0

    .line 26
    .line 27
    cmpg-double v0, v2, v0

    .line 28
    .line 29
    if-gtz v0, :cond_0

    .line 30
    .line 31
    const-string p0, "\u4f18\u60e0\u5238\u5df2\u8fc7\u671f"

    .line 32
    .line 33
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->c1:Ll/usa;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/usa;->N3()Lrx/c;

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->n()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->m:Lv/VCheckBox;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 67
    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 79
    .line 80
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 83
    .line 84
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 85
    .line 86
    invoke-interface {v0, v5, v6, v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ng(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 103
    .line 104
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 105
    .line 106
    invoke-interface {v0, v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Uk(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->u:Ljava/lang/String;

    .line 111
    .line 112
    new-instance v10, Ll/edq;

    .line 113
    .line 114
    invoke-direct {v10, p0}, Ll/edq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    .line 115
    .line 116
    .line 117
    const-string v7, "p_chat_view"

    .line 118
    .line 119
    invoke-interface/range {v1 .. v10}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->td(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->u()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    new-instance v1, Ll/bdq;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bdq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->k:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/cdq;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/cdq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final n()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Of(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final o()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D7(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->b:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    sget v5, Ll/qa00;->i:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->l()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->m:Lv/VCheckBox;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->k()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 10

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->platform:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p1, v1, v2, v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->om(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v8

    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 41
    .line 42
    iget-object v7, p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v9, Ll/ddq;

    .line 45
    .line 46
    invoke-direct {v9, p0}, Ll/ddq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V

    .line 47
    .line 48
    .line 49
    invoke-interface/range {v3 .. v9}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Gs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ljava/util/List;Ll/y20;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->i()Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->k:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "\u67e5\u770b\u4f1a\u5458\u6743\u76ca"

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->fj(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "vas_guide_type"

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    filled-new-array {p1}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "e_vas_guide_assistant"

    .line 52
    .line 53
    const-string v1, "p_chat_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->o:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 77
    .line 78
    invoke-interface {v1, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Jf(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string v1, "p_privilege,assistant_guide"

    .line 83
    .line 84
    invoke-interface {p1, v0, v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qd(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->x()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->k()V

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic s(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->v:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v0, "wechat"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->i:Lv/VText;

    .line 12
    .line 13
    const-string v0, "\u5fae\u4fe1\u652f\u4ed8"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->h:Lv/VImage;

    .line 19
    .line 20
    sget p1, Ll/ibc0;->Q6:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    invoke-interface {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ng(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->i:Lv/VText;

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const-string p1, "\u652f\u4ed8\u5b9d\u514d\u5bc6\u652f\u4ed8"

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const-string p1, "\u652f\u4ed8\u5b9d"

    .line 54
    .line 55
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->h:Lv/VImage;

    .line 59
    .line 60
    sget p1, Ll/ibc0;->P6:I

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->l:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->k:Lv/VText;

    .line 13
    .line 14
    const-string v0, "\u67e5\u770b\u4f1a\u5458\u6743\u76ca"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final x()V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->p:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 20
    .line 21
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->s:Lcom/p1/mobile/putong/data/PayMethod;

    .line 24
    .line 25
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    invoke-interface {v0, v4, v5, v6}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ng(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->q:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 38
    .line 39
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->guideType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v0, v4}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Uk(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string v7, "p_chat_view"

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Sb(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->u:Ljava/lang/String;

    .line 53
    .line 54
    return-void
.end method
