.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Ljava/text/DecimalFormat;

.field public f:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public g:Lcom/p1/mobile/putong/core/data/Coupon;

.field public h:D

.field public i:D

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/x20;

.field public l:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/text/DecimalFormat;

    .line 5
    .line 6
    const-string p3, "#.#"

    .line 7
    .line 8
    invoke-direct {p2, p3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->e:Ljava/text/DecimalFormat;

    .line 12
    .line 13
    new-instance p2, Ll/yey;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/yey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->l:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->h()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->j()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->k(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method private getAct()Lcom/p1/mobile/android/app/Act;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method


# virtual methods
.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bfy;->b(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final e(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u4f18\u60e0"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, "\u540e\u8fc7\u671f\uff0c\u6062\u590d\u539f\u4ef7"

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->e:Ljava/text/DecimalFormat;

    .line 20
    .line 21
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->i:D

    .line 22
    .line 23
    invoke-virtual {p1, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p0, "\u5143"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public f()V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 9
    .line 10
    const-string v2, "lowPriceCallback3SVIP"

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->j:Ljava/util/List;

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    const/4 v6, 0x0

    .line 30
    const/4 v2, 0x0

    .line 31
    const-string v4, "p_promotion,callback_other"

    .line 32
    .line 33
    invoke-interface/range {v0 .. v6}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->wm(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 38
    .line 39
    const-string v2, "lowPriceCustomerSVIP"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 58
    .line 59
    const/4 v6, 0x0

    .line 60
    const/4 v7, 0x0

    .line 61
    const/4 v2, 0x0

    .line 62
    const-string v5, "p_meet,e_promotion_countdown_module,click"

    .line 63
    .line 64
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Cg(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :goto_0
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->d:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/zey;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zey;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->b:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/4 v3, 0x1

    .line 9
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->d:Lv/VText;

    .line 13
    .line 14
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 11
    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    long-to-double v2, v2

    .line 17
    sub-double/2addr v0, v2

    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    cmpg-double p1, v0, v2

    .line 21
    .line 22
    if-gtz p1, :cond_1

    .line 23
    .line 24
    const-string p0, "\u4f18\u60e0\u5238\u5df2\u5230\u671f"

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 42
    .line 43
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Z7(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string v0, "promotion_type"

    .line 48
    .line 49
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 59
    .line 60
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p0, "m"

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string v0, "duration"

    .line 75
    .line 76
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "e_promotion_countdown_module"

    .line 85
    .line 86
    const-string v0, "p_meet"

    .line 87
    .line 88
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->k:Ll/x20;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->k:Ll/x20;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/afy;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/afy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public m(Ll/pf60;Ll/x20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 8
    .line 9
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 23
    .line 24
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 27
    .line 28
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->i:D

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Coupon;->getCouponPrice()D

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->h:D

    .line 37
    .line 38
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->k:Ll/x20;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->p()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->n()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->l()V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 61
    .line 62
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Z7(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string p2, "promotion_type"

    .line 67
    .line 68
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->f:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 78
    .line 79
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v0, "m"

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    const-string v0, "duration"

    .line 94
    .line 95
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string p2, "e_promotion_countdown_module"

    .line 104
    .line 105
    const-string v0, "p_meet"

    .line 106
    .line 107
    invoke-static {p2, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 111
    .line 112
    const-string p2, "lowPriceCallback3SVIP"

    .line 113
    .line 114
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_1

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    const/4 p2, 0x1

    .line 129
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->S7(Z)Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->j:Ljava/util/List;

    .line 134
    .line 135
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->e:Ljava/text/DecimalFormat;

    .line 7
    .line 8
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->h:D

    .line 9
    .line 10
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "\u5143\u89e3\u9501"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->d:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public o(I)V
    .locals 2

    return-void

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    const-string v1, "\u7acb\u4eab\u4f18\u60e0\uff0c\u89e3\u5bc6\u559c\u6b22\u6211\u7684"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/c17;->q0(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, "\u4eba"

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p1, "\u7acb\u4eab\u4f18\u60e0\uff0c\u89e3\u5bc6\u8c01\u559c\u6b22\u6211"

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->b:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->p()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->q()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->c:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->g:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 29
    .line 30
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->pk(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->c:Lv/VText;

    .line 35
    .line 36
    iget-object v3, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v3, Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->e(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->l:Ljava/lang/Runnable;

    .line 48
    .line 49
    invoke-static {v2}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->l:Ljava/lang/Runnable;

    .line 63
    .line 64
    const-wide/16 v1, 0x3e8

    .line 65
    .line 66
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 67
    .line 68
    .line 69
    :cond_2
    :goto_0
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
