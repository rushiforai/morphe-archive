.class public Ll/lke0;
.super Ll/v6b0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lke0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/v6b0<",
        "Ll/bkj0<",
        "Lcom/p1/mobile/putong/data/User;",
        "Lcom/p1/mobile/putong/core/api/CoreLikers$a;",
        "Ljava/lang/Integer;",
        ">;>;"
    }
.end annotation


# instance fields
.field public f:I

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v6b0;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/lke0;->f:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/lke0;->g:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/rbb0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/bke0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/bke0;-><init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic q(Ll/lke0;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lke0;->G(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic s(Ll/lke0;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lke0;->F(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic u(Ll/lke0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lke0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/lke0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lke0;->I(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic w(Ll/lke0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lke0;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreLikers$a;Ljava/lang/Integer;Ljava/lang/Boolean;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z(Ll/lke0;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lke0;->H(Ll/bkj0;)V

    return-void
.end method


# virtual methods
.method public C()Ll/lke0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n6;->b:Ll/u4;

    .line 2
    .line 3
    check-cast p0, Ll/lke0$a;

    .line 4
    .line 5
    return-object p0
.end method

.method public final D()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->Eh()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string v0, "secondary_page_type"

    .line 15
    .line 16
    const-string v2, "see"

    .line 17
    .line 18
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    filled-new-array {v0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "e_intl_message_meet_entrance"

    .line 27
    .line 28
    const-string v3, "p_messages_view"

    .line 29
    .line 30
    invoke-static {v2, v3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;->INTL_MEET:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 38
    .line 39
    invoke-static {p0, v1, v0}, Ll/bhe0;->d(Landroid/content/Context;ZLcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;->SEE:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;

    .line 48
    .line 49
    invoke-static {p0, v1, v0}, Ll/bhe0;->d(Landroid/content/Context;ZLcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->t:Landroid/view/ViewStub;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->Bp:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/view/LookUpView;->setNumbersBackground(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/n6;->f()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget v1, Lcom/p1/mobile/putong/core/R$string;->jn:I

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/view/LookUpView;->setText(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iget p0, p0, Ll/lke0;->f:I

    .line 3
    .line 4
    invoke-static {p1, p0}, Ll/bhe0;->g(ZI)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/bhe0;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic G(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/u4;->s(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/lke0;->f:I

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 14
    .line 15
    iget v1, v1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 16
    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-ge v0, v1, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Ll/b8d0;->l(Z)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p1, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Ll/lke0;->f:I

    .line 46
    .line 47
    iget-boolean v0, p0, Ll/lke0;->g:Z

    .line 48
    .line 49
    invoke-static {v0, p1}, Ll/bhe0;->g(ZI)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-boolean p1, p0, Ll/lke0;->g:Z

    .line 54
    .line 55
    return-void
.end method

.method public final synthetic H(Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n6;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n6;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lke0;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lke0;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/lke0$a;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/lke0;->E()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->setLookUpViewVisibility(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Ll/lke0$a;->c()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/view/LookUpView;->u(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 39
    .line 40
    new-instance v2, Ll/yje0;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/yje0;-><init>(Ll/lke0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->setLookUpViewVisibility(Z)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {v2}, Ll/lke0$a;->d()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-static {v2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-interface {v2}, Ll/lke0$a;->a()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->s:Lv/VImage;

    .line 98
    .line 99
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->setLookUpViewVisibility(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ll/lke0$a;->d()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->q:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/lke0;->C()Ll/lke0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v2}, Ll/lke0$a;->b()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->o:Lv/VText_AutoFit;

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->s:Lv/VImage;

    .line 51
    .line 52
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public b(Ll/ner;Ll/dq1;)V
    .locals 5
    .param p1    # Ll/ner;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/v6b0;->b(Ll/ner;Ll/dq1;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->S6()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->y5()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    new-instance v4, Ll/cke0;

    .line 39
    .line 40
    invoke-direct {v4}, Ll/cke0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    new-instance v4, Ll/dke0;

    .line 52
    .line 53
    invoke-direct {v4}, Ll/dke0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v1, v2, v3, v4}, Ll/psd0;->t(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p2, p1, v0}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/eke0;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/eke0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/fke0;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/fke0;-><init>(Ll/lke0;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/gke0;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/gke0;-><init>(Ll/lke0;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p2, p1, v0}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/hke0;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/hke0;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/ike0;

    .line 112
    .line 113
    invoke-direct {v1}, Ll/ike0;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/jke0;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/jke0;-><init>(Ll/lke0;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    move-object v0, p1

    .line 133
    check-cast v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->o7()Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p2, p1, v0}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const/4 p2, 0x1

    .line 144
    invoke-virtual {p1, p2}, Lrx/c;->skip(I)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    const-wide/16 v0, 0x3

    .line 149
    .line 150
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 151
    .line 152
    invoke-virtual {p1, v0, v1, p2}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    new-instance p2, Ll/kke0;

    .line 157
    .line 158
    invoke-direct {p2}, Ll/kke0;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    new-instance p2, Ll/zje0;

    .line 166
    .line 167
    invoke-direct {p2, p0}, Ll/zje0;-><init>(Ll/lke0;)V

    .line 168
    .line 169
    .line 170
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->s:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->m:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->r:Lcom/tantan/library/svga/SVGAnimationView;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 26
    .line 27
    sget v1, Ll/dbc0;->T5:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/n6;->b:Ll/u4;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/u4;->o()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/lke0;->M()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p0}, Ll/lke0;->L()V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object v0, p0, Ll/n6;->a:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 48
    .line 49
    new-instance v1, Ll/ake0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ake0;-><init>(Ll/lke0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
