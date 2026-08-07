.class public Lcom/p1/mobile/putong/core/newui/fake/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/fake/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/fake/b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/fake/b$a;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/fake/b$a;->b(Landroid/app/Activity;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/app/Activity;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/fake/b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/fake/b;->t(Lcom/p1/mobile/putong/data/User;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/fake/b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/newui/fake/b;->s(Landroid/app/Activity;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 50
    .line 51
    const-string v1, "fakeView"

    .line 52
    .line 53
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/core/newui/fake/b;->G(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    return-void
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/fake/b;->l(Lcom/p1/mobile/putong/core/newui/fake/b;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    new-instance v1, Ll/t2g;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/t2g;-><init>(Lcom/p1/mobile/putong/core/newui/fake/b$a;Landroid/app/Activity;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 p0, 0x78

    .line 32
    .line 33
    invoke-virtual {v0, v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
