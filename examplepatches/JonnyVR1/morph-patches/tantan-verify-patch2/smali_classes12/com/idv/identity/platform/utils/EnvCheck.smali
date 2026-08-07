.class public Lcom/idv/identity/platform/utils/EnvCheck;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;
    .locals 2

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_LOW_OS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->b()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->c()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eq v0, v1, :cond_2

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_2
    return-object v1
.end method

.method public static b()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;
    .locals 2

    .line 1
    invoke-static {}, Ll/un0;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_NO_BACK_CAMERA:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 12
    .line 13
    return-object v0
.end method

.method public static c()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;
    .locals 2

    .line 1
    invoke-static {}, Ll/un0;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_NO_FRONT_CAMERA:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 12
    .line 13
    return-object v0
.end method

.method public static d()Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;
    .locals 1

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/utils/EnvCheck;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_ERROR_LOW_OS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    sget-object v0, Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;->ENV_SUCCESS:Lcom/idv/identity/platform/utils/EnvCheck$EnvErrorType;

    .line 11
    .line 12
    return-object v0
.end method

.method private static e()Z
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x12

    .line 10
    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method
