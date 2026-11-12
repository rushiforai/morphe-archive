.class public abstract Lsj2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public final c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;IILrj2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsj2;->c:Ljava/lang/Object;

    invoke-static {p1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object p1

    iput-object p1, p0, Lsj2;->e:Ljava/lang/Object;

    iput p2, p0, Lsj2;->a:I

    iput p3, p0, Lsj2;->b:I

    iput-object p4, p0, Lsj2;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lsj2;->a:I

    iput v0, p0, Lsj2;->b:I

    iput-object p1, p0, Lsj2;->c:Ljava/lang/Object;

    return-void
.end method

.method public static g(Landroid/content/Context;)Z
    .registers 2

    const-string v0, "keyguard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/KeyguardManager;

    invoke-virtual {p0}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract b(Ljava/lang/Object;)Z
.end method

.method public abstract c()Ljava/lang/Object;
.end method

.method public abstract d()Ljava/lang/Object;
.end method

.method public final e()V
    .registers 5

    iget-object v0, p0, Lsj2;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/KeyguardManager;

    invoke-virtual {v1}, Landroid/app/KeyguardManager;->isKeyguardSecure()Z

    move-result v2

    if-nez v2, :cond_1d

    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    check-cast v0, Lrj2;

    invoke-interface {v0}, Lrj2;->Y()V

    invoke-virtual {p0}, Lsj2;->i()V

    return-void

    :cond_1d
    iget v2, p0, Lsj2;->b:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lsj2;->a:I

    if-nez v3, :cond_29

    const/4 v0, 0x0

    goto :goto_2d

    :cond_29
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_2d
    invoke-virtual {v1, v0, v2}, Landroid/app/KeyguardManager;->createConfirmDeviceCredentialIntent(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lsj2;->e:Ljava/lang/Object;

    check-cast v1, Loi;

    new-instance v2, Lqj2;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    check-cast v1, Lhjf;

    invoke-virtual {v1, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    return-void
.end method

.method public f()Z
    .registers 5

    iget-object v0, p0, Lsj2;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lsj2;->d:Ljava/lang/Object;

    const/4 v2, 0x1

    if-eqz v1, :cond_a

    return v2

    :cond_a
    const/4 v1, 0x0

    if-nez v0, :cond_e

    return v1

    :cond_e
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_15

    return v1

    :cond_15
    iget p0, p0, Lsj2;->a:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt p0, v0, :cond_1e

    return v1

    :cond_1e
    return v2
.end method

.method public abstract h()V
.end method

.method public i()V
    .registers 1

    return-void
.end method
