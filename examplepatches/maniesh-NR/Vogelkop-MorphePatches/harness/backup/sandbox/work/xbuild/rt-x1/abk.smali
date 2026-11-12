.class public final Labk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public volatile a:Z


# virtual methods
.method public final a()V
    .registers 1

    iget-boolean p0, p0, Labk;->a:Z

    if-nez p0, :cond_5

    return-void

    :cond_5
    const-string p0, "Already released"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
