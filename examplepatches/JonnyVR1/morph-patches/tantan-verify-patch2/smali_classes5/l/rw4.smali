.class public Ll/rw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ow4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VLinear;

.field public c:Lv/VListCell;

.field public d:Lcom/p1/mobile/android/app/Act;

.field public e:Ll/ow4;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rw4;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/rw4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rw4;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/rw4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rw4;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rw4;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rw4;->c:Lv/VListCell;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->s:Ll/jxd0;

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string p1, "off_on"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string p1, "on_off"

    .line 22
    .line 23
    :goto_0
    const-string v0, "push_switch"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "e_keyboard_setting_switch"

    .line 34
    .line 35
    const-string v1, "p_chat_keyboard_setting"

    .line 36
    .line 37
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Ll/qt4;->e:Ll/jxd0;

    .line 41
    .line 42
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sw4;->b(Ll/rw4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/ow4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rw4;->e:Ll/ow4;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ow4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rw4;->d(Ll/ow4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rw4;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rw4;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v1, "\u804a\u5929\u8bbe\u7f6e"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/rw4;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/pw4;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/pw4;-><init>(Ll/rw4;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/rw4;->c:Lv/VListCell;

    .line 19
    .line 20
    sget-object v1, Ll/qt4;->e:Ll/jxd0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 33
    .line 34
    .line 35
    const-string v0, "e_keyboard_setting_switch"

    .line 36
    .line 37
    const-string v1, "p_chat_keyboard_setting"

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/rw4;->c:Lv/VListCell;

    .line 43
    .line 44
    new-instance v1, Ll/qw4;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/qw4;-><init>(Ll/rw4;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
