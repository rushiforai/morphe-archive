.class public Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Ll/ri40;

.field public e:Landroid/app/Dialog;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/Boolean;

.field public h:Ljava/lang/Boolean;

.field public i:[Ll/si40;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->g:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->h:Ljava/lang/Boolean;

    .line 9
    .line 10
    new-instance p1, Ll/si40;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->E2:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/ibc0;->m0:I

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-direct {p1, v2, v0, v1}, Ll/si40;-><init>(ILjava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/si40;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 29
    .line 30
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->F2:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Ll/ibc0;->l0:I

    .line 37
    .line 38
    const/4 v3, 0x2

    .line 39
    invoke-direct {v0, v3, v1, v2}, Ll/si40;-><init>(ILjava/lang/String;I)V

    .line 40
    .line 41
    .line 42
    filled-new-array {p1, v0}, [Ll/si40;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->i:[Ll/si40;

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 49
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->g:Ljava/lang/Boolean;

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->h:Ljava/lang/Boolean;

    .line 52
    new-instance p1, Ll/si40;

    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->E2:I

    .line 53
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    sget v0, Ll/ibc0;->m0:I

    const/4 v1, 0x1

    invoke-direct {p1, v1, p2, v0}, Ll/si40;-><init>(ILjava/lang/String;I)V

    new-instance p2, Ll/si40;

    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->F2:I

    .line 54
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Ll/ibc0;->l0:I

    const/4 v2, 0x2

    invoke-direct {p2, v2, v0, v1}, Ll/si40;-><init>(ILjava/lang/String;I)V

    filled-new-array {p1, p2}, [Ll/si40;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->i:[Ll/si40;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 55
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->g:Ljava/lang/Boolean;

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->h:Ljava/lang/Boolean;

    .line 58
    new-instance p1, Ll/si40;

    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget p3, Lcom/p1/mobile/putong/core/message/R$string;->E2:I

    .line 59
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    sget p3, Ll/ibc0;->m0:I

    const/4 v0, 0x1

    invoke-direct {p1, v0, p2, p3}, Ll/si40;-><init>(ILjava/lang/String;I)V

    new-instance p2, Ll/si40;

    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->F2:I

    .line 60
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    sget v0, Ll/ibc0;->l0:I

    const/4 v1, 0x2

    invoke-direct {p2, v1, p3, v0}, Ll/si40;-><init>(ILjava/lang/String;I)V

    filled-new-array {p1, p2}, [Ll/si40;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->i:[Ll/si40;

    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->B()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->g:Ljava/lang/Boolean;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;Lcom/p1/mobile/putong/core/newui/greet/NewTagStatusItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->C(Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;Lcom/p1/mobile/putong/core/newui/greet/NewTagStatusItem;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;ILl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->G(ILl/uxj0;)V

    return-void
.end method

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->E(Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->F(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B()V
    .locals 5

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_stranger_message_setting"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pej0;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget v3, Ll/cgc0;->d:I

    .line 23
    .line 24
    invoke-direct {v1, v2, v3}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v2, Ll/qec0;->H:I

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Ll/edc0;->k4:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;

    .line 51
    .line 52
    new-instance v3, Ll/ri40;

    .line 53
    .line 54
    invoke-direct {v3}, Ll/ri40;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->d:Ll/ri40;

    .line 58
    .line 59
    new-instance v4, Ll/pie;

    .line 60
    .line 61
    invoke-direct {v4, p0, v2}, Ll/pie;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ll/lgm;->k(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;->setCanAdjustChildHeight(Z)V

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->d:Ll/ri40;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;->setAdapter(Ll/igm;)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->d:Ll/ri40;

    .line 77
    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->i:[Ll/si40;

    .line 79
    .line 80
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v2, v3}, Ll/ri40;->o(Ljava/util/List;)V

    .line 85
    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->d:Ll/ri40;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->i:[Ll/si40;

    .line 90
    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->h:Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    xor-int/lit8 v4, v4, 0x1

    .line 98
    .line 99
    aget-object v3, v3, v4

    .line 100
    .line 101
    invoke-virtual {v2, v3}, Ll/lgm;->l(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->d:Ll/ri40;

    .line 105
    .line 106
    invoke-virtual {v2}, Ll/lgm;->j()V

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 110
    .line 111
    invoke-virtual {v2, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 115
    .line 116
    new-instance v2, Ll/qie;

    .line 117
    .line 118
    invoke-direct {v2, p0, v0}, Ll/qie;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Ll/l4g0;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;Lcom/p1/mobile/putong/core/newui/greet/NewTagStatusItem;)V
    .locals 1

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
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->K(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic E(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->g:Ljava/lang/Boolean;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic G(ILl/uxj0;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p1, 0x0

    .line 6
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->h:Ljava/lang/Boolean;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->e:Landroid/app/Dialog;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final K(I)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string v0, "off"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "open"

    .line 7
    .line 8
    :goto_0
    const-string v1, "stranger_message_state"

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    filled-new-array {v0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "e_stranger_message_setting_button"

    .line 19
    .line 20
    const-string v2, "p_stranger_message_setting"

    .line 21
    .line 22
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->c:Lv/VText;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v2, 0x1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    move v3, v2

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move v3, v1

    .line 34
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->b:Lv/VText;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    move v3, v2

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v3, v1

    .line 44
    :goto_2
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->f:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 52
    .line 53
    if-nez p1, :cond_3

    .line 54
    .line 55
    move v1, v2

    .line 56
    :cond_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/api/j;->D6(Ljava/lang/Boolean;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/rie;

    .line 69
    .line 70
    invoke-direct {v1, p0, p1}, Ll/rie;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;I)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/sie;

    .line 74
    .line 75
    invoke-direct {p0}, Ll/sie;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->f:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    .line 16
    .line 17
    new-instance v1, Ll/oie;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/oie;-><init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setSelectTag(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->b:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    xor-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->h:Ljava/lang/Boolean;

    .line 22
    .line 23
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tie;->a(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
