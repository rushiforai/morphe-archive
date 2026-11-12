.class public final Laxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final a:Lqlk;

.field public final b:Loml;

.field public final c:Lzwk;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lqlk;Lumi;Lzwk;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laxk;->a:Lqlk;

    iput-object p3, p0, Laxk;->c:Lzwk;

    new-instance p1, Lqlk;

    const/16 v0, 0xd

    invoke-direct {p1, p0, v0}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p2, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    iput-object v0, p0, Laxk;->b:Loml;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x2

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    invoke-virtual {p3, p0}, Lzwk;->a(Lywk;)V

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 3

    const/4 p1, 0x1

    iput-boolean p1, p0, Laxk;->d:Z

    iget-boolean p1, p0, Laxk;->e:Z

    if-eqz p1, :cond_17

    iget-object p1, p0, Laxk;->b:Loml;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Loml;->cancel(Z)Z

    iget-object p1, p0, Laxk;->c:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->j(Lywk;)V

    iget-object p0, p0, Laxk;->a:Lqlk;

    invoke-virtual {p0}, Lqlk;->run()V

    :cond_17
    return-void
.end method

.method public final c0()V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Laxk;->e:Z

    iget-boolean v0, p0, Laxk;->d:Z

    if-eqz v0, :cond_17

    iget-object v0, p0, Laxk;->b:Loml;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    iget-object v0, p0, Laxk;->c:Lzwk;

    invoke-virtual {v0, p0}, Lzwk;->j(Lywk;)V

    iget-object p0, p0, Laxk;->a:Lqlk;

    invoke-virtual {p0}, Lqlk;->run()V

    :cond_17
    return-void
.end method
