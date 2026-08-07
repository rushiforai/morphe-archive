.class public Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText_NoTopPadding;

.field public d:Lv/VText_NoTopPadding;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->S(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->T(Landroid/view/View;)V

    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W()V
    .locals 4

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
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    new-instance v3, Ll/a7q;

    .line 16
    .line 17
    invoke-direct {v3, p0}, Ll/a7q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "p_chat_view,e_intl_im_readreceipt_btn,click"

    .line 21
    .line 22
    invoke-interface {v0, v1, p0, v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "readreceipt_entrance"

    .line 26
    .line 27
    const-string v0, "0_message"

    .line 28
    .line 29
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "e_intl_im_readreceipt_btn"

    .line 38
    .line 39
    const-string v1, "p_chat_view"

    .line 40
    .line 41
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final synthetic S(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Message;Ll/n100;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->c:Lv/VText_NoTopPadding;

    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->w6:I

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 23
    .line 24
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->o4:I

    .line 25
    .line 26
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 32
    .line 33
    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->n4:I

    .line 34
    .line 35
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Q4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText_NoTopPadding;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->c:Lv/VText_NoTopPadding;

    .line 13
    .line 14
    sget v0, Ll/edc0;->N:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText_NoTopPadding;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->d:Lv/VText_NoTopPadding;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->c:Lv/VText_NoTopPadding;

    .line 25
    .line 26
    new-instance v1, Ll/y6q;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/y6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;->d:Lv/VText_NoTopPadding;

    .line 35
    .line 36
    new-instance v1, Ll/z6q;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/z6q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemIntlReadReceiptsGuide;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
