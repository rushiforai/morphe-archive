.class public Ll/zdq;
.super Ll/udq;
.source "SourceFile"


# instance fields
.field public n:Lcom/p1/mobile/android/app/Act;

.field public o:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public p:Z

.field public q:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public r:Lcom/p1/mobile/putong/data/PayMethod;

.field public s:Ljava/lang/String;

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VImage;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lv/VCheckBox;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/udq;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/zdq;->p:Z

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iput-object v0, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    const-string v0, "alipay"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/zdq;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 18
    .line 19
    const-string v0, ""

    .line 20
    .line 21
    iput-object v0, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic I(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J(Ll/zdq;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdq;->S(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic K(Ll/zdq;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdq;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/zdq;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdq;->T(Landroid/view/View;)V

    return-void
.end method

.method public static R(Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "monetization_buy"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "monetization_buy_v2"

    .line 26
    .line 27
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method


# virtual methods
.method public D(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ll/xdq;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/xdq;-><init>(Ll/zdq;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public M(Landroid/widget/RelativeLayout;Lv/VImage;Lv/VText;Lv/VText;Lv/VCheckBox;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zdq;->v:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zdq;->w:Lv/VImage;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zdq;->x:Lv/VText;

    .line 6
    .line 7
    iput-object p4, p0, Ll/zdq;->y:Lv/VText;

    .line 8
    .line 9
    iput-object p5, p0, Ll/zdq;->z:Lv/VCheckBox;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zdq;->Q()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final N()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/zdq;->z:Lv/VCheckBox;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->bi(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    iget-object v0, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    invoke-static {}, Ll/joa;->M3()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Zp()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    return v1

    .line 75
    :cond_2
    invoke-virtual {p0}, Ll/zdq;->P()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    return v1

    .line 82
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v2, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 89
    .line 90
    iget-object p0, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {v0, v2, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ae(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_4

    .line 97
    .line 98
    const/4 p0, 0x1

    .line 99
    return p0

    .line 100
    :cond_4
    return v1
.end method

.method public final O(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 2

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
    iget-object v0, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/zdq;->p:Z

    .line 18
    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const-string p0, "\u786e\u8ba4\u534f\u8bae\u514d\u5bc6\u4ed8%s\u5143"

    .line 22
    .line 23
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string p0, "\u786e\u8ba4\u534f\u8bae\u5e76\u652f\u4ed8%s\u5143"

    .line 33
    .line 34
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public final P()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->G3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Ll/joa;->M3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    if-eq p0, v0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    return v2

    .line 24
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    iget-object p0, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    if-ne p0, v0, :cond_3

    .line 43
    .line 44
    return v1

    .line 45
    :cond_3
    return v2
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zdq;->v:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object v0, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v0, p0, Ll/zdq;->y:Lv/VText;

    .line 12
    .line 13
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/zdq;->v:Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    new-instance v1, Ll/vdq;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/vdq;-><init>(Ll/zdq;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/zdq;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v0, "wechat"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    iput-boolean p1, p0, Ll/zdq;->p:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zdq;->Y()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 28
    .line 29
    iget-object v0, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/zdq;->O(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public final synthetic T(Landroid/view/View;)V
    .locals 6

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v2, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    iget-object v3, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    iget-object v4, p0, Ll/zdq;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 14
    .line 15
    new-instance v5, Ll/wdq;

    .line 16
    .line 17
    invoke-direct {v5, p0}, Ll/wdq;-><init>(Ll/zdq;)V

    .line 18
    .line 19
    .line 20
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Cp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic U(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-nez p1, :cond_4

    .line 4
    .line 5
    const-string p1, "odiamond"

    .line 6
    .line 7
    iget-object v0, p0, Ll/zdq;->u:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    const-string p1, "tantan://vip/diamond"

    .line 18
    .line 19
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p1, "platinum"

    .line 28
    .line 29
    iget-object v0, p0, Ll/zdq;->u:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    const-string p1, "tantan://vip/platinum"

    .line 40
    .line 41
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    const-string p1, "svip"

    .line 50
    .line 51
    iget-object v0, p0, Ll/zdq;->u:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    const-string p1, "tantan://vip/svip"

    .line 62
    .line 63
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    const-string p1, "vip"

    .line 72
    .line 73
    iget-object v0, p0, Ll/zdq;->u:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iget-object p0, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    const-string v0, "tantan://vip/vip"

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    invoke-virtual {p0}, Ll/zdq;->N()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    const/4 v0, 0x0

    .line 106
    if-eqz p1, :cond_6

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 109
    .line 110
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iget-object v2, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 115
    .line 116
    iget-object v3, p0, Ll/zdq;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 117
    .line 118
    iget-object p1, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    const/4 v4, 0x1

    .line 125
    xor-int/2addr p1, v4

    .line 126
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 127
    .line 128
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    if-eqz v5, :cond_5

    .line 137
    .line 138
    iget-boolean v5, p0, Ll/zdq;->p:Z

    .line 139
    .line 140
    if-nez v5, :cond_5

    .line 141
    .line 142
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 143
    .line 144
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 145
    .line 146
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    if-eqz v5, :cond_5

    .line 151
    .line 152
    iget-object v5, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 153
    .line 154
    sget-object v6, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 155
    .line 156
    if-eq v5, v6, :cond_5

    .line 157
    .line 158
    sget-object v6, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 159
    .line 160
    if-eq v5, v6, :cond_5

    .line 161
    .line 162
    move v5, v4

    .line 163
    goto :goto_0

    .line 164
    :cond_5
    move v5, v0

    .line 165
    :goto_0
    const-string v6, "p_chat,assistant_buybutton"

    .line 166
    .line 167
    const-string v7, "p_chat_view"

    .line 168
    .line 169
    move v4, p1

    .line 170
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Sb(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    :cond_6
    new-instance p1, Ljava/util/HashMap;

    .line 174
    .line 175
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 176
    .line 177
    .line 178
    const-string v1, "platform"

    .line 179
    .line 180
    iget-object v2, p0, Ll/zdq;->r:Lcom/p1/mobile/putong/data/PayMethod;

    .line 181
    .line 182
    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 186
    .line 187
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 188
    .line 189
    const-string v2, "productType"

    .line 190
    .line 191
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    const-string v1, "purchaseShowFrom"

    .line 195
    .line 196
    const-string v2, "p_chat,assistant_buybutton"

    .line 197
    .line 198
    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    iget-object v1, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-nez v1, :cond_7

    .line 208
    .line 209
    const-string v1, "couponID"

    .line 210
    .line 211
    iget-object v2, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    :cond_7
    invoke-virtual {p0}, Ll/zdq;->N()Z

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    const-string v2, "if_to_buy"

    .line 221
    .line 222
    if-eqz v1, :cond_8

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/zdq;->W()V

    .line 225
    .line 226
    .line 227
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 228
    .line 229
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    iget-object v3, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 242
    .line 243
    iget-object v4, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 244
    .line 245
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 246
    .line 247
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    const-string v5, "p_privilege,assistant_guide"

    .line 252
    .line 253
    invoke-interface {v1, v3, v5, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qd(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 257
    .line 258
    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    :goto_1
    const-string v1, "e_purchase_button"

    .line 262
    .line 263
    const-string v2, "p_chat_view"

    .line 264
    .line 265
    invoke-static {v1, v2, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, v0}, Ll/zdq;->Z(Z)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method public final V(Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "payProduct"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    if-nez v3, :cond_1

    .line 10
    .line 11
    sget-object v3, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    const-string v3, "null"

    .line 34
    .line 35
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    new-instance v3, Lorg/json/JSONObject;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->extra:Ljava/lang/String;

    .line 46
    .line 47
    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-string p1, "unknown_"

    .line 51
    .line 52
    invoke-virtual {v3, v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string v4, "payCouponID"

    .line 61
    .line 62
    const-string v5, ""

    .line 63
    .line 64
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    iput-object v4, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 69
    .line 70
    const-string v4, "payDuration"

    .line 71
    .line 72
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 73
    .line 74
    .line 75
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 76
    .line 77
    invoke-virtual {v4}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    iget-object v5, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 82
    .line 83
    invoke-interface {v4, p1, v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->fk(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 88
    .line 89
    const-string p1, "payAmount"

    .line 90
    .line 91
    const-wide/16 v4, 0x0

    .line 92
    .line 93
    invoke-virtual {v3, p1, v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    .line 94
    .line 95
    .line 96
    move-result-wide v6

    .line 97
    cmpl-double p1, v6, v4

    .line 98
    .line 99
    if-lez p1, :cond_0

    .line 100
    .line 101
    new-instance p1, Ljava/text/DecimalFormat;

    .line 102
    .line 103
    const-string v4, "#.#"

    .line 104
    .line 105
    invoke-direct {p1, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 109
    .line 110
    div-double/2addr v6, v4

    .line 111
    invoke-virtual {p1, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :catch_0
    move-exception v0

    .line 119
    move-object p1, v0

    .line 120
    goto :goto_1

    .line 121
    :cond_0
    :goto_0
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Ll/zdq;->u:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0, v1}, Ll/zdq;->Z(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    :goto_2
    iget-object p1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 135
    .line 136
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    const-string v0, "\u7acb\u5373\u67e5\u770b"

    .line 141
    .line 142
    if-eqz p1, :cond_4

    .line 143
    .line 144
    iget-object p1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 147
    .line 148
    invoke-static {p1}, Ll/wib0;->b(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 153
    .line 154
    iget-object p1, p0, Ll/zdq;->y:Lv/VText;

    .line 155
    .line 156
    const-string v2, "#de000000"

    .line 157
    .line 158
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/zdq;->y:Lv/VText;

    .line 166
    .line 167
    const/high16 v3, 0x3e800000    # 0.25f

    .line 168
    .line 169
    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iget-object v3, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 181
    .line 182
    invoke-interface {p1, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->bi(Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    iget-object v3, p0, Ll/zdq;->y:Lv/VText;

    .line 187
    .line 188
    if-eqz p1, :cond_2

    .line 189
    .line 190
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    iget-object v4, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 199
    .line 200
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    invoke-interface {p1, v4, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->rl(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 213
    .line 214
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    iget-object v6, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 219
    .line 220
    iget-object v7, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 221
    .line 222
    iget-object v8, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 223
    .line 224
    const/4 v9, 0x0

    .line 225
    const-string v5, ""

    .line 226
    .line 227
    invoke-interface/range {v4 .. v9}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->je(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    :goto_3
    iget-object p1, p0, Ll/zdq;->z:Lv/VCheckBox;

    .line 235
    .line 236
    iget-object v2, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 237
    .line 238
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 243
    .line 244
    .line 245
    iget-object p1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 246
    .line 247
    invoke-virtual {p0, p1}, Ll/zdq;->X(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Ll/zdq;->y:Lv/VText;

    .line 251
    .line 252
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 256
    .line 257
    iget-object v1, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    if-eqz v1, :cond_3

    .line 264
    .line 265
    goto :goto_4

    .line 266
    :cond_3
    iget-object v0, p0, Ll/zdq;->t:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {p0, v0}, Ll/zdq;->O(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    :goto_4
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    .line 274
    .line 275
    goto :goto_5

    .line 276
    :cond_4
    iget-object p1, p0, Ll/udq;->e:Lv/VText;

    .line 277
    .line 278
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    .line 280
    .line 281
    iget-object p1, p0, Ll/zdq;->y:Lv/VText;

    .line 282
    .line 283
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Ll/zdq;->z:Lv/VCheckBox;

    .line 287
    .line 288
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 289
    .line 290
    .line 291
    iget-object p0, p0, Ll/zdq;->v:Landroid/widget/RelativeLayout;

    .line 292
    .line 293
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 294
    .line 295
    .line 296
    :goto_5
    return-void
.end method

.method public final W()V
    .locals 10

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
    iget-object v2, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iget-object v3, p0, Ll/zdq;->n:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v0, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    iget-boolean v6, p0, Ll/zdq;->p:Z

    .line 18
    .line 19
    iget-object v0, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 22
    .line 23
    iget-object v7, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v8, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v9, Ll/ydq;

    .line 28
    .line 29
    invoke-direct {v9}, Ll/ydq;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v4, ""

    .line 33
    .line 34
    invoke-interface/range {v1 .. v9}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->To(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    const-string v1, "oDiamond"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    iput-object p1, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    const-string v0, "svip"

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-ne p1, v0, :cond_1

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    iput-object p1, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    iput-object p1, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    :goto_0
    iget-object p1, p0, Ll/zdq;->v:Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/zdq;->Y()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public Y()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/zdq;->p:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/zdq;->w:Lv/VImage;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/ibc0;->Q6:I

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/zdq;->x:Lv/VText;

    .line 13
    .line 14
    const-string v0, "\u5fae\u4fe1\u652f\u4ed8"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget v0, Ll/ibc0;->P6:I

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "\u652f\u4ed8\u5b9d"

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ll/zdq;->q:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    if-eq v0, v2, :cond_1

    .line 54
    .line 55
    iget-object p0, p0, Ll/zdq;->x:Lv/VText;

    .line 56
    .line 57
    const-string v0, "\u652f\u4ed8\u5b9d\u514d\u5bc6\u652f\u4ed8"

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p0, p0, Ll/zdq;->x:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object p0, p0, Ll/zdq;->x:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public Z(Z)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/zdq;->u:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "svip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "promotion_lowPriceCustomerSVIP"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "promotion_lowPriceCustomerVIP"

    .line 15
    .line 16
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const-string v0, "vas_guide_type"

    .line 24
    .line 25
    const-string v1, "p_chat_view"

    .line 26
    .line 27
    const-string v2, "e_vas_guide_assistant"

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v2, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v2, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/udq;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 20
    .line 21
    const-string v2, "productType"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/zdq;->o:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "duration"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const-string v1, "couponid"

    .line 48
    .line 49
    iget-object p0, p0, Ll/zdq;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    :cond_0
    const-string p0, "e_chat_purchase_banner"

    .line 55
    .line 56
    const-string v1, "p_chat_view"

    .line 57
    .line 58
    invoke-static {p0, v1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/udq;->x(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/zdq;->V(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
