.class public final Lww8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lwr9;

.field public final b:Lwr9;

.field public c:Z

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lhv2;Ldg7;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lhv2;->d:Ld53;

    invoke-virtual {v0, p1}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lww8;->c:Z

    new-instance v0, Lwr9;

    new-instance v1, Lhu5;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lwr9;-><init>(Lcom/opera/api/Callback;)V

    iput-object v0, p0, Lww8;->a:Lwr9;

    new-instance p1, Lwr9;

    invoke-direct {p1, p2}, Lwr9;-><init>(Lcom/opera/api/Callback;)V

    iput-object p1, p0, Lww8;->b:Lwr9;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    const/4 v0, 0x0

    if-eqz p1, :cond_17

    iget-boolean p1, p0, Lww8;->d:Z

    if-eqz p1, :cond_8

    return-void

    :cond_8
    iget-boolean p1, p0, Lww8;->c:Z

    if-eqz p1, :cond_17

    const/4 p1, 0x1

    iput-boolean p1, p0, Lww8;->d:Z

    iput-boolean v0, p0, Lww8;->c:Z

    const-wide/16 v0, 0x7d0

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void

    :cond_17
    iput-boolean v0, p0, Lww8;->d:Z

    iput-boolean v0, p0, Lww8;->c:Z

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lww8;->run()V

    return-void
.end method

.method public final run()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lww8;->d:Z

    iget-object v0, p0, Lww8;->a:Lwr9;

    invoke-virtual {v0}, Lwr9;->run()V

    iget-object p0, p0, Lww8;->b:Lwr9;

    invoke-virtual {p0}, Lwr9;->run()V

    return-void
.end method
