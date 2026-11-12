.class public interface abstract Lorg/chromium/base/Callback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/Callback$Helper;
    }
.end annotation


# virtual methods
.method public a(Ljava/lang/Object;)Lbi2;
    .registers 4

    new-instance v0, Lbi2;

    const/16 v1, 0x16

    invoke-direct {v0, p0, p1, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v0
.end method

.method public synthetic c(Ljava/lang/Object;)V
    .registers 2

    invoke-interface {p0, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    return-void
.end method

.method public abstract onResult(Ljava/lang/Object;)V
.end method
