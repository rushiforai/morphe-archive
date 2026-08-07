.class public Lcom/ss/bytertc/engine/utils/EngineConfigCheck;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ENGINE_CONFIG_INVALID_APP_ID:I = 0x1

.field public static final ENGINE_CONFIG_INVALID_CONTEXT:I = 0x3

.field public static final ENGINE_CONFIG_INVALID_NATIVE_LIB_PATH:I = 0x2

.field public static final ENGINE_CONFIG_VALID:I


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

.method public static checkValid(Lcom/ss/bytertc/engine/data/EngineConfig;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->appID:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/io/File;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->nativeLoadPath:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    :cond_1
    const/4 p0, 0x2

    .line 39
    return p0

    .line 40
    :cond_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/data/EngineConfig;->context:Landroid/content/Context;

    .line 41
    .line 42
    if-nez p0, :cond_3

    .line 43
    .line 44
    const/4 p0, 0x3

    .line 45
    return p0

    .line 46
    :cond_3
    const/4 p0, 0x0

    .line 47
    return p0
.end method
