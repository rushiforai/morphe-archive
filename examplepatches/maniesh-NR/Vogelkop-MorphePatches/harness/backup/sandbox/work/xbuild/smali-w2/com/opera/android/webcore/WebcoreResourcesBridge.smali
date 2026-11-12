.class public final Lcom/opera/android/webcore/WebcoreResourcesBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static notifyVersion(Lcom/opera/api/Callback;Ljava/lang/String;)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
