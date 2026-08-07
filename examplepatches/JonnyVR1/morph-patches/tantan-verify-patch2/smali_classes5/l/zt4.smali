.class public Ll/zt4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/qt4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Lv/VProgressBar;

.field public d:Lv/VScroll;

.field public e:Lv/VText;

.field public f:Lv/VFrame;

.field public g:Lv/VFrame;

.field public h:Lv/VFrame;

.field public i:Landroid/view/ViewStub;

.field public j:Lv/VFrame;

.field public k:Lv/VText;

.field public l:Lv/VFrame;

.field public m:Lv/VText;

.field public n:Landroid/view/View;

.field public o:Lv/VText;

.field public p:Lv/VFrame;

.field public q:Lv/VFrame;

.field public r:Lv/VLinear;

.field public s:Lv/VText;

.field public t:Lv/VRelative;

.field public u:Lv/VSwitch;

.field public v:Ll/qt4;

.field public w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

.field public x:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzNotifySettingView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zt4;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt4;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zt4;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt4;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt4;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zt4;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zt4;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/zt4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zt4;->s(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->closed:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u60a8\u5df2\u5173\u95ed\u901a\u77e5\u63d0\u9192\uff0c\u8bf7\u8bbe\u7f6e\u5f00\u542f"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/iz40;->A()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 19
    .line 20
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/zt4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/NotificationManagerAct;

    .line 27
    .line 28
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 2
    .line 3
    new-instance v0, Landroid/content/Intent;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zt4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-class v1, Lcom/p1/mobile/putong/core/ui/settings/NoticeSettingAct;

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/zt4;->p:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s:Ll/jxd0;

    .line 10
    .line 11
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/zt4;->v:Ll/qt4;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/qt4;->o0(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zt4;->v:Ll/qt4;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zt4;->q:Lv/VFrame;

    .line 4
    .line 5
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ll/qt4;->n0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public A(ZZZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zt4;->j:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/zt4;->j:Lv/VFrame;

    .line 7
    .line 8
    new-instance v0, Ll/rt4;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/rt4;-><init>(Ll/zt4;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/zt4;->g:Lv/VFrame;

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/zt4;->g:Lv/VFrame;

    .line 22
    .line 23
    new-instance p2, Ll/st4;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/st4;-><init>(Ll/zt4;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/zt4;->p:Lv/VFrame;

    .line 32
    .line 33
    invoke-static {p1, p3}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/zt4;->p:Lv/VFrame;

    .line 37
    .line 38
    new-instance p2, Ll/tt4;

    .line 39
    .line 40
    invoke-direct {p2, p0}, Ll/tt4;-><init>(Ll/zt4;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/zt4;->q:Lv/VFrame;

    .line 47
    .line 48
    invoke-static {p1, p4}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/zt4;->q:Lv/VFrame;

    .line 52
    .line 53
    new-instance p2, Ll/ut4;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/ut4;-><init>(Ll/zt4;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/zt4;->q:Lv/VFrame;

    .line 62
    .line 63
    const/16 p1, 0x8

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public A3(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/zt4;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v0, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ao:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/zt4;->b:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    new-instance v0, Ll/vt4;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/vt4;-><init>(Ll/zt4;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/zt4;->n()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/ytk;->c()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v0, 0x0

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Ll/zt4;->f:Lv/VFrame;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/zt4;->f:Lv/VFrame;

    .line 40
    .line 41
    new-instance v1, Ll/wt4;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/wt4;-><init>(Ll/zt4;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-static {}, Ll/d09;->i()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object v1, p0, Ll/zt4;->l:Lv/VFrame;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/zt4;->l:Lv/VFrame;

    .line 62
    .line 63
    new-instance v1, Ll/xt4;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/xt4;-><init>(Ll/zt4;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    :goto_0
    invoke-static {}, Ll/d79;->e0()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    iget-object p1, p0, Ll/zt4;->x:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzNotifySettingView;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_2

    .line 88
    .line 89
    iget-object p1, p0, Ll/zt4;->i:Landroid/view/ViewStub;

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzNotifySettingView;

    .line 96
    .line 97
    iput-object p1, p0, Ll/zt4;->x:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzNotifySettingView;

    .line 98
    .line 99
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->qs()Ll/ceo;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v1, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 108
    .line 109
    invoke-interface {p1, v1}, Ll/ceo;->a(Lcom/p1/mobile/android/app/Act;)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object v1, p0, Ll/zt4;->h:Lv/VFrame;

    .line 114
    .line 115
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/zt4;->h:Lv/VFrame;

    .line 119
    .line 120
    if-eqz p1, :cond_3

    .line 121
    .line 122
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/zt4;->h:Lv/VFrame;

    .line 126
    .line 127
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_3
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public B(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zt4;->t:Lv/VRelative;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr p1, v1

    .line 5
    invoke-static {v0, p1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/zt4;->r:Lv/VLinear;

    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/zt4;->t:Lv/VRelative;

    .line 14
    .line 15
    new-instance v0, Ll/yt4;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/yt4;-><init>(Ll/zt4;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public C()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zt4;->d:Lv/VScroll;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/zt4;->c:Lv/VProgressBar;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/zt4;->l()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/qt4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zt4;->m(Ll/qt4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zt4;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/au4;->b(Ll/zt4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zt4;->w:Lcom/p1/mobile/putong/core/ui/settings/ChatAndNotifiAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ll/qt4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zt4;->v:Ll/qt4;

    .line 2
    .line 3
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zt4;->j:Lv/VFrame;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zt4;->v:Ll/qt4;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zt4;->j:Lv/VFrame;

    .line 4
    .line 5
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ll/qt4;->q0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zt4;->v:Ll/qt4;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zt4;->g:Lv/VFrame;

    .line 4
    .line 5
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ll/qt4;->p0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zt4;->v:Ll/qt4;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zt4;->t:Lv/VRelative;

    .line 4
    .line 5
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ll/qt4;->D0(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zt4;->d:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/zt4;->d:Lv/VScroll;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/zt4;->c:Lv/VProgressBar;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
