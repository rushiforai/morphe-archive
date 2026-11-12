.class public final Ldr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly9n;
.implements Lrjm;


# instance fields
.field public final a:Lan;

.field public final b:Lo43;

.field public c:Lsjm;

.field public d:I

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lo43;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lsjm;->b:Lqjm;

    iput-object v0, p0, Ldr;->c:Lsjm;

    const-class v0, Lzm;

    invoke-static {p1, v0}, Lq9n;->l(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lzm;

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->i1:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lan;

    iput-object p1, p0, Ldr;->a:Lan;

    iput-object p2, p0, Ldr;->b:Lo43;

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    iget p1, p0, Ldr;->d:I

    if-ne p1, p2, :cond_5

    return-void

    :cond_5
    new-instance p1, Lbr;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p2, p3}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, p1}, Ldr;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a(Ljava/lang/Runnable;)V
    .registers 6

    invoke-virtual {p0}, Ldr;->c()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_e

    iget v0, p0, Ldr;->d:I

    if-lez v0, :cond_e

    move v0, v2

    goto :goto_f

    :cond_e
    move v0, v1

    :goto_f
    invoke-virtual {p0}, Ldr;->c()Z

    move-result v3

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0}, Ldr;->c()Z

    move-result p1

    if-eqz p1, :cond_21

    iget p1, p0, Ldr;->d:I

    if-lez p1, :cond_21

    move v1, v2

    :cond_21
    invoke-virtual {p0}, Ldr;->c()Z

    move-result p1

    iget-object p0, p0, Ldr;->b:Lo43;

    if-eq v3, p1, :cond_2c

    invoke-interface {p0, p1}, Lcr;->i(Z)V

    :cond_2c
    if-eq v0, v1, :cond_31

    invoke-interface {p0, v1}, Lcr;->q(Z)V

    :cond_31
    return-void
.end method

.method public final b(Lsjm;)V
    .registers 4

    iget-object v0, p0, Ldr;->c:Lsjm;

    invoke-virtual {v0, p1}, Lsjm;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Lxa;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Ldr;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()Z
    .registers 2

    iget-boolean v0, p0, Ldr;->e:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Ldr;->c:Lsjm;

    iget-boolean v0, v0, Lsjm;->a:Z

    if-eqz v0, :cond_10

    iget-boolean p0, p0, Ldr;->f:Z

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final d(Z)V
    .registers 4

    iget-boolean v0, p0, Ldr;->e:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    new-instance v0, Lar;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lar;-><init>(Ldr;ZB)V

    invoke-virtual {p0, v0}, Ldr;->a(Ljava/lang/Runnable;)V

    return-void
.end method
