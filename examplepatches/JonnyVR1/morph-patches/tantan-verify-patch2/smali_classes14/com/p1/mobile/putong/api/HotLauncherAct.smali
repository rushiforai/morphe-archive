.class public Lcom/p1/mobile/putong/api/HotLauncherAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/HotLauncherAct$a;
    }
.end annotation


# instance fields
.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/HotLauncherAct;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/api/HotLauncherAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/HotLauncherAct;->b2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/api/HotLauncherAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/HotLauncherAct;->c2()V

    return-void
.end method

.method private synthetic b2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/api/HotLauncherAct;->c:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/HotLauncherAct;->Z1()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/HotLauncherAct;->c:Z

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/HotLauncherAct;->d2()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/HotLauncherAct;->c:Z

    .line 25
    .line 26
    :cond_2
    return-void
.end method


# virtual methods
.method public final Z1()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/api/HotLauncherAct;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/HotLauncherAct;->a2()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/HotLauncherAct;->c:Z

    .line 11
    .line 12
    return-void
.end method

.method public final a2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/w7c0;->b:I

    .line 5
    .line 6
    sget v1, Ll/w7c0;->c:I

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic c2()V
    .locals 5

    .line 1
    invoke-static {}, Ll/rsh0;->e()Ll/rsh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/rsh0;->d()Ll/tsh0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    new-instance v2, Lcom/p1/mobile/putong/api/HotLauncherAct$a;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/api/HotLauncherAct$a;-><init>(Lcom/p1/mobile/putong/api/HotLauncherAct;)V

    .line 22
    .line 23
    .line 24
    const-string v3, "AD_SPLASH_HOT_START"

    .line 25
    .line 26
    const-string v4, "active"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v3, v4, v2}, Ll/tsh0;->a(Landroid/view/ViewGroup;Ljava/lang/String;Ljava/lang/String;Ll/b6m;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/HotLauncherAct;->a2()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final d2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/phl;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/phl;-><init>(Lcom/p1/mobile/putong/api/HotLauncherAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/g70;->INSTANCE:Ll/g70;

    .line 5
    .line 6
    const-string v1, "hotlanch"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/g70;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/ohl;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ohl;-><init>(Lcom/p1/mobile/putong/api/HotLauncherAct;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/16 p1, 0x1706

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setTheme()V
    .locals 0

    return-void
.end method
