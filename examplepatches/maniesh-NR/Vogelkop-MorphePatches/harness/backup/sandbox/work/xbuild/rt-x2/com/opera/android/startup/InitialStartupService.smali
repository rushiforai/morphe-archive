.class public Lcom/opera/android/startup/InitialStartupService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static final synthetic b:I


# instance fields
.field public a:Ltn;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreate()V
    .registers 4

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Ltn;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    new-instance v1, Lld9;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, v2}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Ltn;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/opera/android/startup/InitialStartupService;->a:Ltn;

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    iget-object p0, p0, Lcom/opera/android/startup/InitialStartupService;->a:Ltn;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Ls03;

    sget-object v0, Lcak;->d:Lavj;

    invoke-static {p0}, Lavj;->f(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Ls03;->run()V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 7

    sget p1, Lcom/opera/android/startup/WelcomeActivity;->w:I

    new-instance p1, Landroid/content/Intent;

    const-class p2, Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p2, "com.opera.android.startup.ONGOING_NOTIFICATION"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/4 p2, 0x0

    invoke-static {p0, p2, p1, p2, p2}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object p1

    new-instance p2, Lcm;

    const/4 p3, 0x5

    const/4 v0, 0x0

    const v1, 0x7f0a0a18

    invoke-direct {p2, v0, v1, p3}, Lcm;-><init>(Ljava/lang/String;IB)V

    const-string p3, "other"

    invoke-static {p3, p2}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object p2

    invoke-virtual {p2, p1}, Lua7;->N(Lyhe;)V

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Lua7;->R(Z)V

    const p3, 0x7f0803bc

    invoke-virtual {p2, p3}, Lua7;->S(I)V

    const p3, 0x7f1401b7

    invoke-virtual {p0, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    const v0, 0x7f141181

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p0, v0, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lua7;->P(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Lua7;->l()Li16;

    move-result-object p2

    iget-object p2, p2, Li16;->b:Ljava/lang/Object;

    check-cast p2, Landroid/app/Notification;

    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1f

    if-lt p3, v0, :cond_58

    invoke-static {p0, v1, p2}, Lm41;->L(Landroid/app/Service;ILandroid/app/Notification;)Z

    move-result p2

    goto :goto_5c

    :cond_58
    invoke-virtual {p0, v1, p2}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    move p2, p1

    :goto_5c
    if-eqz p2, :cond_86

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_86

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p3

    invoke-static {p2, p3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p2

    iget-object p2, p2, Lhi0;->b:Lfi0;

    const/16 v0, 0x18

    const-wide/16 v1, 0x1

    invoke-virtual {p2, v0, p1, v1, v2}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, p3}, Lx5f;->U0(Lx56;)V

    :cond_86
    return p1
.end method

.method public final onTimeout(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/app/Service;->onTimeout(II)V

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void
.end method
