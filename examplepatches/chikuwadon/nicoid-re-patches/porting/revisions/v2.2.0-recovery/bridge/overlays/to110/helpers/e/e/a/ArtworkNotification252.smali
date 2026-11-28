.class public final Le/e/a/ArtworkNotification252;
.super Ljava/lang/Object;
.source "ArtworkNotification252.java"


# static fields
.field private static final ART:Ljava/lang/String; = "android.media.metadata.ART"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/app/Notification$Builder;Landroid/media/session/MediaSession;)V
    .registers 2

    .line 20
    :try_start_0
    invoke-static {p1}, Le/e/a/ArtworkNotification252;->bitmap(Landroid/media/session/MediaSession;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 21
    :cond_0
    :goto_0
    return-void
.end method

.method private static bitmap(Landroid/media/session/MediaSession;)Landroid/graphics/Bitmap;
    .registers 3

    .line 14
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/media/session/MediaSession;->isActive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 15
    invoke-virtual {p0}, Landroid/media/session/MediaSession;->getController()Landroid/media/session/MediaController;

    move-result-object p0

    invoke-virtual {p0}, Landroid/media/session/MediaController;->getMetadata()Landroid/media/MediaMetadata;

    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    move-object p0, v0

    goto :goto_0

    :cond_0
    const-string v1, "android.media.metadata.ART"

    invoke-virtual {p0, v1}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 17
    :goto_0
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1

    move-object v0, p0

    :cond_1
    return-object v0

    .line 14
    :cond_2
    return-object v0
.end method

.method public static refresh(Landroid/content/Context;Landroid/media/session/MediaSession;ILandroid/app/Notification;)Landroid/app/Notification;
    .registers 13

    .line 24
    const-string v0, "android.mediaSession"

    const-string v1, "NicoidArtwork"

    if-eqz p0, :cond_5

    if-eqz p3, :cond_5

    if-eqz p1, :cond_5

    :try_start_0
    invoke-virtual {p1}, Landroid/media/session/MediaSession;->isActive()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 25
    invoke-static {p1}, Le/e/a/ArtworkNotification252;->bitmap(Landroid/media/session/MediaSession;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_0

    return-object p3

    .line 26
    :cond_0
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    if-nez v3, :cond_1

    return-object p3

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/media/session/MediaSession;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object p1

    .line 28
    if-eqz p1, :cond_4

    iget-object v4, p3, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-eqz v4, :cond_4

    iget-object v4, p3, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    invoke-virtual {v4, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/media/session/MediaSession$Token;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 29
    invoke-virtual {v3}, Landroid/app/NotificationManager;->getActiveNotifications()[Landroid/service/notification/StatusBarNotification;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_3

    aget-object v7, v4, v6

    .line 30
    invoke-virtual {v7}, Landroid/service/notification/StatusBarNotification;->getId()I

    move-result v8

    if-ne v8, p2, :cond_2

    invoke-virtual {v7}, Landroid/service/notification/StatusBarNotification;->getTag()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_2

    .line 31
    invoke-virtual {v7}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v7

    .line 32
    iget-object v8, v7, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    if-eqz v8, :cond_2

    iget-object v7, v7, Landroid/app/Notification;->extras:Landroid/os/Bundle;

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroid/media/session/MediaSession$Token;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 33
    invoke-static {p0, p3}, Landroid/app/Notification$Builder;->recoverBuilder(Landroid/content/Context;Landroid/app/Notification;)Landroid/app/Notification$Builder;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    .line 34
    invoke-virtual {v3, p2, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "notification refresh icon="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " id="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    return-object p0

    .line 29
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 38
    :cond_3
    const-string p0, "notification refresh skipped: no matching posted session"

    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    goto :goto_1

    .line 28
    :cond_4
    return-object p3

    .line 39
    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "notification refresh error="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    :goto_1
    return-object p3

    .line 24
    :cond_5
    return-object p3
.end method
