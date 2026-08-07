.class public Lcom/ss/bytertc/engine/video/AmazingEffect;
.super Lcom/ss/bytertc/engine/video/IAmazingEffect;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AmazingEffect"

.field private static mLibraryLoaded:Z = false

.field private static final sSoLibraryName:Ljava/lang/String; = "volcenginertc"


# instance fields
.field private mNativeAmazingEffect:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "volcenginertc"

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    sput-boolean v0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mLibraryLoaded:Z
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception v0

    .line 16
    const/4 v1, 0x0

    .line 17
    sput-boolean v1, Lcom/ss/bytertc/engine/video/AmazingEffect;->mLibraryLoaded:Z

    .line 18
    .line 19
    const-string v1, "AmazingEffect"

    .line 20
    .line 21
    const-string v2, "Failed to load native library: effect"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/IAmazingEffect;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 5
    .line 6
    const-string p0, "AmazingEffect"

    .line 7
    .line 8
    const-string p1, "create amazing effect"

    .line 9
    .line 10
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private amazingEffectInvalid()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static getEffectSDKVersion()Ljava/lang/String;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mLibraryLoaded:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "unkonw"

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeGetEffectSDKVersion()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method


# virtual methods
.method public appendEffectNodes(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "AmazingEffect"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "invalid, appendEffectNodes failed."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x3ee

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string p0, "param invalid, appendEffectNodes failed."

    .line 20
    .line 21
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, -0x1

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    new-array v0, v0, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-wide p0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 36
    .line 37
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeAppendAmazingEffectNodes(J[Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public dispose()V
    .locals 2

    .line 1
    const-string v0, "AmazingEffect"

    .line 2
    .line 3
    const-string v1, "dispose amazing effect"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 11
    .line 12
    return-void
.end method

.method public removeEffectNodes(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "AmazingEffect"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "invalid, removeEffectNodes failed."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x3ee

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string p0, "param invalid, appendEffectNodes failed."

    .line 20
    .line 21
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, -0x1

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    new-array v0, v0, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-wide p0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 36
    .line 37
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeRemoveAmazingEffectNodes(J[Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public replaceEffectNodes(Ljava/util/List;Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "AmazingEffect"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "invalid, removeEffectNodes failed."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x3ee

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    if-eqz p1, :cond_2

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    new-array v0, v0, [Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    new-array p1, p1, [Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {p2, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    iget-wide v1, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 41
    .line 42
    invoke-static {v1, v2, v0, p1}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeReplaceAmazingEffectNodes(J[Ljava/lang/String;[Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_2
    :goto_0
    const-string p0, "param invalid, appendEffectNodes failed."

    .line 48
    .line 49
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, -0x1

    .line 53
    return p0
.end method

.method public setAlgoModelResourceFinder(Lcom/ss/bytertc/engine/video/IRtcResourceFinder;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "AmazingEffect"

    .line 8
    .line 9
    const-string p1, "invalid, setAlgoModelResourceFinder failed."

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x3ee

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    sput-object p1, Lcom/ss/bytertc/engine/video/EffectResourceFinderAdapter;->sFinder:Lcom/ss/bytertc/engine/video/IRtcResourceFinder;

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public setEffectNodes(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "AmazingEffect"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "invalid, setEffectNodes failed."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x3ee

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string p0, "param invalid, appendEffectNodes failed."

    .line 20
    .line 21
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, -0x1

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    new-array v0, v0, [Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-wide p0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 36
    .line 37
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeSetAmazingEffectNodes(J[Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public setVirtualBackgroundFilePath(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "AmazingEffect"

    .line 8
    .line 9
    const-string p1, "invalid, updateEffectNode failed."

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 16
    .line 17
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeSetVirtualBackgroundFilePath(JLjava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public updateEffectNode(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/AmazingEffect;->amazingEffectInvalid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "AmazingEffect"

    .line 8
    .line 9
    const-string p1, "invalid, updateEffectNode failed."

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/16 p0, -0x3ee

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/AmazingEffect;->mNativeAmazingEffect:J

    .line 18
    .line 19
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeAmazingEffectFunctions;->nativeUpdateAmazingEffectNode(JLjava/lang/String;Ljava/lang/String;F)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method
