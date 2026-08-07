.class public Lio/agora/base/internal/PermissionChecker;
.super Ljava/lang/Object;


# static fields
.field static forceCheckPermissionFail:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasCameraPermission()Z
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string v0, "android.permission.CAMERA"

    invoke-static {v0}, Lio/agora/base/internal/PermissionChecker;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static hasChangeNetPermission()Z
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string v0, "android.permission.CHANGE_NETWORK_STATE"

    invoke-static {v0}, Lio/agora/base/internal/PermissionChecker;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static hasPermission(Ljava/lang/String;)Z
    .locals 4

    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget-boolean v2, Lio/agora/base/internal/PermissionChecker;->forceCheckPermissionFail:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    invoke-virtual {v0, p0, v2, v3}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    return v1
.end method

.method public static hasRecordAudioPermission()Z
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const-string v0, "android.permission.RECORD_AUDIO"

    invoke-static {v0}, Lio/agora/base/internal/PermissionChecker;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static setForceCheckPermissionFail(Z)V
    .locals 0

    sput-boolean p0, Lio/agora/base/internal/PermissionChecker;->forceCheckPermissionFail:Z

    return-void
.end method
