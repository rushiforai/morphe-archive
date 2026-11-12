.class public final Lqkg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;
.implements Lekg;
.implements Lrjg;


# instance fields
.field public final a:Lq65;

.field public b:Z

.field public c:I

.field public d:Landroid/app/Notification;

.field public e:Z

.field public final synthetic f:Lcom/opera/android/media/PlayerService;


# direct methods
.method public constructor <init>(Lcom/opera/android/media/PlayerService;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqkg;->f:Lcom/opera/android/media/PlayerService;

    new-instance p1, Lpjg;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lpjg;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lq65;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lqkg;->a:Lq65;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqkg;->e:Z

    return-void
.end method


# virtual methods
.method public final P(Z)V
    .registers 2

    iput-boolean p1, p0, Lqkg;->b:Z

    invoke-virtual {p0}, Lqkg;->u()V

    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-object v0, p0, Lqkg;->f:Lcom/opera/android/media/PlayerService;

    if-eqz p1, :cond_b

    sget p1, Lcom/opera/android/media/PlayerService;->e:I

    sget-object p1, Lyh0;->i:Lyh0;

    invoke-virtual {v0, p1}, Lcom/opera/android/media/PlayerService;->c(Lyh0;)V

    :cond_b
    sget p1, Lcom/opera/android/media/PlayerService;->e:I

    const-string p1, "cancel"

    invoke-virtual {v0, p1}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    const/4 p1, 0x0

    iput p1, p0, Lqkg;->c:I

    const/4 p1, 0x0

    iput-object p1, p0, Lqkg;->d:Landroid/app/Notification;

    iget-object p0, p0, Lqkg;->a:Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    return-void
.end method

.method public final j(Landroid/app/Notification;I)V
    .registers 4

    iput p2, p0, Lqkg;->c:I

    iput-object p1, p0, Lqkg;->d:Landroid/app/Notification;

    iget-boolean v0, p0, Lqkg;->e:Z

    if-eqz v0, :cond_17

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqkg;->e:Z

    invoke-virtual {p0, p1, p2}, Lqkg;->t(Landroid/app/Notification;I)V

    sget p1, Lcom/opera/android/media/PlayerService;->e:I

    iget-object p1, p0, Lqkg;->f:Lcom/opera/android/media/PlayerService;

    const-string p2, "force-fg"

    invoke-virtual {p1, p2}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    :cond_17
    invoke-virtual {p0}, Lqkg;->u()V

    return-void
.end method

.method public final k()V
    .registers 2

    iget-boolean v0, p0, Lqkg;->b:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqkg;->b:Z

    invoke-virtual {p0}, Lqkg;->u()V

    :cond_a
    sget v0, Lcom/opera/android/media/PlayerService;->e:I

    iget-object p0, p0, Lqkg;->f:Lcom/opera/android/media/PlayerService;

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerService;->a()V

    return-void
.end method

.method public final t(Landroid/app/Notification;I)V
    .registers 6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    iget-object v2, p0, Lqkg;->f:Lcom/opera/android/media/PlayerService;

    if-lt v0, v1, :cond_25

    invoke-static {v2, p2, p1}, Lm41;->L(Landroid/app/Service;ILandroid/app/Notification;)Z

    move-result p1

    if-nez p1, :cond_24

    sget p1, Lcom/opera/android/media/PlayerService;->e:I

    const-string p1, "denied-fg"

    invoke-virtual {v2, p1}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    iget-boolean p1, p0, Lqkg;->b:Z

    if-eqz p1, :cond_24

    sget-object p1, Lvml;->d:Lumi;

    const-wide/16 v0, 0x1e

    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object p0, p0, Lqkg;->a:Lq65;

    invoke-virtual {p0, p1, v0, v1, p2}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    :cond_24
    return-void

    :cond_25
    invoke-virtual {v2, p2, p1}, Landroid/app/Service;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method public final u()V
    .registers 5

    iget-object v0, p0, Lqkg;->a:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-boolean v0, p0, Lqkg;->b:Z

    iget-object v1, p0, Lqkg;->f:Lcom/opera/android/media/PlayerService;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lqkg;->d:Landroid/app/Notification;

    if-eqz v0, :cond_1c

    iget v2, p0, Lqkg;->c:I

    invoke-virtual {p0, v0, v2}, Lqkg;->t(Landroid/app/Notification;I)V

    sget p0, Lcom/opera/android/media/PlayerService;->e:I

    const-string p0, "start-fg"

    invoke-virtual {v1, p0}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    return-void

    :cond_1c
    iget-object v0, v1, Lcom/opera/android/media/PlayerService;->a:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_37

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    if-nez v0, :cond_37

    const/4 v0, 0x1

    goto :goto_38

    :cond_37
    const/4 v0, 0x0

    :goto_38
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/app/Service;->stopForeground(I)V

    const-string v2, "stop-fg"

    invoke-virtual {v1, v2}, Lcom/opera/android/media/PlayerService;->b(Ljava/lang/String;)V

    if-eqz v0, :cond_52

    iget-object v0, p0, Lqkg;->d:Landroid/app/Notification;

    if-eqz v0, :cond_52

    new-instance v0, Ll2f;

    invoke-direct {v0, v1}, Ll2f;-><init>(Landroid/content/Context;)V

    iget p0, p0, Lqkg;->c:I

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ll2f;->a(ILjava/lang/String;)V

    :cond_52
    return-void
.end method
