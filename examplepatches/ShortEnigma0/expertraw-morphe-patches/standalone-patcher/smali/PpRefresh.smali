.class public final Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;
.super Ljava/lang/Object;
.source "PpRefresh.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GrawMod"

.field private static volatile sCtx:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sStoragePrompted:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 29
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sCtx:Ljava/lang/ref/WeakReference;

    .line 30
    const/4 v0, 0x0

    sput-boolean v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sStoragePrompted:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 3

    .line 36
    instance-of v0, p0, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/ref/WeakReference;

    move-object v1, p0

    check-cast v1, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sCtx:Ljava/lang/ref/WeakReference;

    .line 37
    :cond_e
    invoke-static {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->checkStoragePermission(Ljava/lang/Object;)V

    .line 38
    return-void
.end method

.method private static checkStoragePermission(Ljava/lang/Object;)V
    .registers 5

    .line 41
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_48

    .line 45
    :try_start_4
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_2a

    if-eqz v0, :cond_b

    .line 46
    return-void

    .line 51
    :cond_b
    nop

    .line 53
    sget-boolean v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sStoragePrompted:Z

    if-eqz v0, :cond_11

    .line 54
    return-void

    .line 56
    :cond_11
    const/4 v0, 0x1

    sput-boolean v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sStoragePrompted:Z

    .line 58
    check-cast p0, Landroid/app/Activity;

    .line 59
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$1;

    invoke-direct {v1, p0}, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$1;-><init>(Landroid/app/Activity;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 79
    return-void

    .line 48
    :catchall_2a
    move-exception p0

    .line 49
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isExternalStorageManager check failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GrawMod"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    return-void

    .line 42
    :cond_48
    return-void
.end method

.method static synthetic lambda$checkStoragePermission$0(Landroid/app/Activity;)V
    .registers 6

    .line 61
    const-string v0, "GrawMod"

    :try_start_2
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 62
    return-void

    .line 64
    :cond_9
    const-string v1, "Allow \'All files access\' so Expert RAW can save photos"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 65
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "package:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 67
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_3b
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_3b} :catch_58
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3b} :catch_3c

    goto :goto_7f

    .line 75
    :catch_3c
    move-exception p0

    .line 76
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to launch storage permission settings: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_80

    .line 68
    :catch_58
    move-exception v1

    .line 70
    :try_start_59
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 71
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_59 .. :try_end_63} :catch_64

    .line 74
    goto :goto_7f

    .line 72
    :catch_64
    move-exception p0

    .line 73
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not open manage storage settings: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :goto_7f
    nop

    .line 78
    :goto_80
    return-void
.end method

.method static synthetic lambda$onScanned$0(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V
    .registers 4

    .line 90
    const-string v0, "GrawMod"

    :try_start_2
    invoke-interface {p0}, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;->updateLatestMedia()V

    .line 91
    invoke-interface {p0}, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;->updateThumbnail()V

    .line 92
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "thumbnail refreshed after scan: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1e
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_1e} :catch_1f

    .line 95
    goto :goto_3a

    .line 93
    :catch_1f
    move-exception p0

    .line 94
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "thumbnail refresh failed: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :goto_3a
    return-void
.end method

.method public static onScanned(Ljava/lang/String;Landroid/net/Uri;)V
    .registers 6

    .line 83
    sget-object v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sCtx:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    .line 84
    if-eqz v0, :cond_3d

    if-nez p1, :cond_d

    goto :goto_3d

    .line 86
    :cond_d
    :try_start_d
    invoke-interface {v0}, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;->getBackgroundHandler()Landroid/os/Handler;

    move-result-object p1

    .line 87
    if-nez p1, :cond_14

    return-void

    .line 88
    :cond_14
    new-instance v1, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;

    invoke-direct {v1, v0, p0}, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;-><init>(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1e
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_1e} :catch_1f

    .line 99
    goto :goto_3c

    .line 97
    :catch_1f
    move-exception p0

    .line 98
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "thumbnail refresh not scheduled: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "GrawMod"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :goto_3c
    return-void

    .line 84
    :cond_3d
    :goto_3d
    return-void
.end method
