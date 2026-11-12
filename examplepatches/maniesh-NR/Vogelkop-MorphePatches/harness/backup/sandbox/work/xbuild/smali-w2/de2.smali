.class public final Lde2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loxc;


# virtual methods
.method public final r(Ljava/lang/Runnable;)V
    .registers 4

    const/4 p0, 0x1

    const-wide/16 v0, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/chromium/base/task/PostTask;->b(ILjava/lang/Runnable;J)V

    return-void
.end method
