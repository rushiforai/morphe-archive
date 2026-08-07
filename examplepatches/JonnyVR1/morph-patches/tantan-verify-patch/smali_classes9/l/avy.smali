.class public Ll/avy;
.super Ll/ruy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ruy<",
        "Ll/bvy;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public e:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ruy;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/avy;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic A0(Ll/avy;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/avy;->F0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic C0(Ll/avy;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/avy;->H0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic D0(Ll/avy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/avy;->E0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic F0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/bvy;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/vuy;->d(Ll/ruy;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/h39;->M()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/qzz;->m0()Lv/navigationbar/VNavigationBar;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/zuy;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/zuy;-><init>(Ll/avy;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private synthetic G0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/avy;->d:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic z0(Ll/avy;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/avy;->G0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method


# virtual methods
.method public final synthetic E0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p1, v0, v1}, Ll/hcm;->q(J)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/hcm;->r()Ll/hcm;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Ll/hcm;->F(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bvy;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/avy;->e:Z

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Ll/bvy;->w(Lcom/p1/mobile/putong/core/data/ChatGroup;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public I0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/avy;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/avy;->e:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "online_user_number"

    .line 18
    .line 19
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "e_group_chat_online"

    .line 30
    .line 31
    invoke-static {v3, v1, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/bvy;

    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Ll/bvy;->w(Lcom/p1/mobile/putong/core/data/ChatGroup;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wuy;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wuy;-><init>(Ll/avy;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/xuy;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/xuy;-><init>(Ll/avy;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/yuy;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/yuy;-><init>(Ll/avy;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
