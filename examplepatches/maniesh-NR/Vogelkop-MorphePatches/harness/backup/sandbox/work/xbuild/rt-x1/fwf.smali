.class public final Lfwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;
.implements Lidc;


# instance fields
.field public final a:Ltcc;

.field public final b:Lqdc;

.field public c:Z


# direct methods
.method public constructor <init>(Ltcc;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lqdc;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lqdc;-><init>(Lndc;Z)V

    iput-object v0, p0, Lfwf;->b:Lqdc;

    iput-object p1, p0, Lfwf;->a:Ltcc;

    return-void
.end method


# virtual methods
.method public final E(Lndc;Locc;)V
    .registers 3

    invoke-virtual {p0}, Lfwf;->b()V

    return-void
.end method

.method public final a(Z)V
    .registers 3

    iget-boolean v0, p0, Lfwf;->c:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lfwf;->a:Ltcc;

    if-eqz p1, :cond_d

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    goto :goto_10

    :cond_d
    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    :goto_10
    iput-boolean p1, p0, Lfwf;->c:Z

    invoke-virtual {p0}, Lfwf;->b()V

    return-void
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Lfwf;->c:Z

    iget-object v1, p0, Lfwf;->a:Ltcc;

    if-nez v0, :cond_12

    move-object v0, v1

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->a:Lqcc;

    if-eq v0, v2, :cond_12

    sget-object v0, Lqcc;->c:Lqcc;

    goto :goto_16

    :cond_12
    check-cast v1, Lqdc;

    iget-object v0, v1, Lqdc;->i:Lqcc;

    :goto_16
    iget-object p0, p0, Lfwf;->b:Lqdc;

    invoke-virtual {p0, v0}, Lqdc;->g(Lqcc;)V

    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lfwf;->b:Lqdc;

    return-object p0
.end method
