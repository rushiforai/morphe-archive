.class public final Lcom/opera/android/browser/chromium/OfflineUrlLoaderBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getOfflinePageMimeTypeAndPath(JJ)V
    .registers 5

    new-instance v0, Lw8f;

    invoke-direct {v0, p0, p1, p2, p3}, Lw8f;-><init>(JJ)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static reportProblem(ILjava/lang/String;)V
    .registers 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Failure: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "contentScheme"

    invoke-static {v0, p1}, Lscd;->p(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, p1, v0}, Lhsh;->m(I[Ljava/lang/Object;Lk1b;)Lhsh;

    move-result-object p1

    new-instance v0, Lyo8;

    const-string v1, "Offline page failure"

    invoke-direct {v0, v1, p0}, Lyo8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p1}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    return-void
.end method
