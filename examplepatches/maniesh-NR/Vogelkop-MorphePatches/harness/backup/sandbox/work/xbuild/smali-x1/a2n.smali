.class public final La2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final a:Ldj9;

.field public final b:Lskm;

.field public final c:J


# direct methods
.method public constructor <init>(Ldj9;Lskm;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La2n;->a:Ldj9;

    iput-object p2, p0, La2n;->b:Lskm;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, La2n;->c:J

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 9

    iget-object p1, p0, La2n;->a:Ldj9;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcj9;

    invoke-virtual {v0}, Lcj9;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    sget-object v1, Lpn7;->b:Lon7;

    iget v0, v0, Lcj9;->c:I

    int-to-long v0, v0

    sget-object v2, Lun7;->e:Lun7;

    invoke-static {v0, v1, v2}, Lcs5;->y0(JLun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    iget-object v2, p0, La2n;->b:Lskm;

    check-cast v2, Lx5f;

    iget-object v3, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v3

    iget-wide v5, p0, La2n;->c:J

    sub-long/2addr v5, v0

    const/4 v0, 0x1

    const/16 v1, 0x24

    invoke-virtual {v3, v1, v0, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v4}, Lx5f;->U0(Lx56;)V

    invoke-virtual {p1, p0}, Lno7;->p(Lmo7;)V

    return-void
.end method
