.class public final Lcom/opera/android/browser/Webdump;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static send(ILjava/lang/String;)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lzyn;

    invoke-direct {v0, p0, p1}, Lzyn;-><init>(ILjava/lang/String;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
