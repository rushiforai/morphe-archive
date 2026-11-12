.class public final Le4f;
.super Ljava/io/OutputStream;
.source "SourceFile"


# instance fields
.field public a:Z


# virtual methods
.method public final close()V
    .registers 2

    invoke-super {p0}, Ljava/io/OutputStream;->close()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Le4f;->a:Z

    return-void
.end method

.method public final write(I)V
    .registers 2

    iget-boolean p0, p0, Le4f;->a:Z

    if-nez p0, :cond_5

    return-void

    :cond_5
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final write([B)V
    .registers 2

    .line 11
    iget-boolean p0, p0, Le4f;->a:Z

    if-nez p0, :cond_5

    return-void

    :cond_5
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
