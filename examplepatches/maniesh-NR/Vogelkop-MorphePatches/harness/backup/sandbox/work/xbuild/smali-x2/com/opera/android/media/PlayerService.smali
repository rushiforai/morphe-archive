.class public Lcom/opera/android/media/PlayerService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public a:Lxbf;

.field public b:Lgkg;

.field public final c:Lqkg;

.field public final d:Lwe7;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Lqkg;

    invoke-direct {v0, p0}, Lqkg;-><init>(Lcom/opera/android/media/PlayerService;)V

    iput-object v0, p0, Lcom/opera/android/media/PlayerService;->c:Lqkg;

    new-instance v1, Lwe7;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v0, v2}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v1, p0, Lcom/opera/android/media/PlayerService;->d:Lwe7;

    return-void
.end method

.method public static d(Ltjg;Lqjd;Lyh0;)V
    .registers 9

    if-eqz p1, :cond_27

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-static {p0, p1}, Lzkd;->R(Ltjg;Lqjd;)Lrh0;

    move-result-object v1

    invoke-virtual {p0, p1}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object p0

    sget-object p1, Lkg7;->g:Lkg7;

    if-ne p0, p1, :cond_21

    sget-object p0, Lsh0;->b:Lsh0;

    goto :goto_23

    :cond_21
    sget-object p0, Lsh0;->c:Lsh0;

    :goto_23
    iget-boolean p1, v0, Lx5f;->h:Z

    if-nez p1, :cond_28

    :cond_27
    return-void

    :cond_28
    iget-object p1, v0, Lx5f;->d:Lzpa;

    new-instance v2, Lzh0;

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/16 v5, 0x98b

    invoke-direct {v2, v5, v3, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lvh0;

    if-nez p2, :cond_4d

    invoke-static {}, Lzpa;->A()Lvh0;

    move-result-object p2

    invoke-virtual {v2, v4, v4, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v2, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lvh0;

    :cond_4d
    invoke-virtual {p2, v4, v4, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p2, v3, v4, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, p1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 p2, 0xd

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_71

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_71

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_7a

    :cond_71
    invoke-static {p1, p2, v4}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, p2, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_7a
    invoke-virtual {v3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, p0}, Lx5f;->U0(Lx56;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->b:Lgkg;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lgkg;->b(Lgk9;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->d:Lwe7;

    iget-object v2, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    invoke-virtual {v0, v2}, Lhkg;->b(Lxbf;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v2, p0, Lcom/opera/android/media/PlayerService;->c:Lqkg;

    invoke-virtual {v0, v2}, Ltjg;->i(Lrjg;)V

    iput-object v1, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-static {v0, p0, p1}, Lbp;->S(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public final c(Lyh0;)V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgig;

    invoke-interface {p0}, Lgig;->g()Lqjd;

    move-result-object p0

    invoke-static {v0, p0, p1}, Lcom/opera/android/media/PlayerService;->d(Ltjg;Lqjd;Lyh0;)V

    return-void
.end method

.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onCreate()V
    .registers 9

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_c0

    const-string v0, "create"

    invoke-virtual {p0, v0}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->c:Lqkg;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lqkg;->e:Z

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v2

    iget-object v3, v2, Ltjg;->o:Lxbf;

    iput-object v3, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object v4, p0, Lcom/opera/android/media/PlayerService;->d:Lwe7;

    invoke-virtual {v4, v3}, Lhkg;->a(Lxbf;)V

    invoke-virtual {v2, v0}, Ltjg;->a(Lrjg;)V

    new-instance v2, Li4d;

    const/16 v3, 0x10

    invoke-direct {v2, p0, v3}, Li4d;-><init>(Ljava/lang/Object;B)V

    const-string v3, "notification"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Landroid/app/NotificationChannel;

    const v5, 0x7f140b57

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "media"

    const/4 v7, 0x2

    invoke-direct {v4, v6, v5, v7}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v3, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    new-instance v3, Lgkg;

    const v4, 0x7f0a0610

    invoke-direct {v3, p0, v4, v2, v0}, Lgkg;-><init>(Landroid/app/Service;ILdkg;Lekg;)V

    iput-object v3, p0, Lcom/opera/android/media/PlayerService;->b:Lgkg;

    iget-boolean v0, v3, Lgkg;->F:Z

    if-eqz v0, :cond_6f

    const/4 v0, 0x0

    iput-boolean v0, v3, Lgkg;->F:Z

    iget-boolean v0, v3, Lgkg;->r:Z

    if-eqz v0, :cond_6f

    iget-object v0, v3, Lgkg;->f:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v2

    if-nez v2, :cond_6f

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_6f
    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_91

    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->b:Lgkg;

    new-instance v2, Lrkg;

    iget-object v3, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object v3, v3, Lxbf;->c:Ljava/lang/Object;

    check-cast v3, Lode;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgig;

    invoke-direct {v2, p0, v3}, Lrkg;-><init>(Lcom/opera/android/media/PlayerService;Lgig;)V

    invoke-virtual {v0, v2}, Lgkg;->b(Lgk9;)V

    :cond_91
    iget-object v0, p0, Lcom/opera/android/media/PlayerService;->b:Lgkg;

    iget-object p0, p0, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lpod;

    iget-object p0, p0, Lpod;->a:Lnpd;

    iget-object p0, p0, Lnpd;->h:Laqd;

    iget-object p0, p0, Laqd;->j:Lbpd;

    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lxod;

    iget-object p0, p0, Lxod;->c:Lapd;

    iget-object p0, p0, Lapd;->b:Landroid/media/session/MediaSession$Token;

    iget-object v2, v0, Lgkg;->t:Landroid/media/session/MediaSession$Token;

    invoke-static {v2, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c0

    iput-object p0, v0, Lgkg;->t:Landroid/media/session/MediaSession$Token;

    iget-boolean p0, v0, Lgkg;->r:Z

    if-eqz p0, :cond_c0

    iget-object p0, v0, Lgkg;->f:Landroid/os/Handler;

    invoke-virtual {p0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_c0

    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_c0
    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const-string v0, "destroy"

    invoke-virtual {p0, v0}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerService;->a()V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 5

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "onStart["

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-nez p1, :cond_c

    const-string p1, "null"

    goto :goto_e

    :cond_c
    const-string p1, "avail"

    :goto_e
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ",fl="

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "]"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method
