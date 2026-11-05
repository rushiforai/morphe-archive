.class public final Le/e/a/MediaStop240;
.super Ljava/lang/Object;
.source "MediaStop240.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static stop(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 4

    .line 6
    invoke-static {}, Le/e/a/MediaControls;->clear()V

    .line 7
    invoke-static {p0}, Le/e/a/MiniSession225;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-static {}, Le/e/a/MiniSession225;->closeCurrent()V

    return-void

    .line 8
    :cond_d
    if-eqz p2, :cond_19

    instance-of p2, p0, Landroid/app/Service;

    if-eqz p2, :cond_19

    .line 9
    check-cast p0, Landroid/app/Service;

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void

    .line 11
    :cond_19
    :try_start_19
    const-string p0, "pause"

    const/4 p2, 0x0

    new-array v0, p2, [Ljava/lang/Class;

    new-array p2, p2, [Ljava/lang/Object;

    invoke-static {p1, p0, v0, p2}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_23} :catch_24

    goto :goto_28

    .line 12
    :catch_24
    move-exception p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->log(Ljava/lang/Exception;)V

    .line 13
    :goto_28
    return-void
.end method
