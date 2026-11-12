.class public final Ld3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public a:J

.field public b:Z


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, [B

    if-eqz p1, :cond_c

    iget-wide v0, p0, Ld3g;->a:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_d

    :cond_c
    return-void

    :cond_d
    invoke-static {v0, v1, p1}, LJ/N;->M9uudxxC(JLjava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Ld3g;->b:Z

    return-void
.end method
