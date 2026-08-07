.class public Lcom/bef/effectsdk/BEFEffectNative;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BEF_CLOCKWISE_ROTATE_0:I = 0x0

.field public static final BEF_CLOCKWISE_ROTATE_180:I = 0x2

.field public static final BEF_CLOCKWISE_ROTATE_270:I = 0x3

.field public static final BEF_CLOCKWISE_ROTATE_90:I = 0x1

.field private static final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "effect"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/bef/effectsdk/BEFEffectNative;->list:Ljava/util/List;

    .line 12
    .line 13
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createHandle(Z)J
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/bef/effectsdk/BEFEffectNative;->nativeCreateHandle(Z)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static destroyHandle(J)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/bef/effectsdk/BEFEffectNative;->nativeDestroyHandle(J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static getEffectSDKVersion()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/bef/effectsdk/BEFEffectNative;->nativeGetEffectSDKVersion()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static initResourceFinder(JLcom/bef/effectsdk/ResourceFinder;IILjava/lang/String;)I
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/bef/effectsdk/BEFEffectNative;->nativeInitResourceFinder(JLcom/bef/effectsdk/ResourceFinder;IILjava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static native nativeCreateHandle(Z)J
.end method

.method private static native nativeDestroyHandle(J)I
.end method

.method private static native nativeGetEffectSDKVersion()Ljava/lang/String;
.end method

.method private static native nativeInitResourceFinder(JLcom/bef/effectsdk/ResourceFinder;IILjava/lang/String;)I
.end method

.method private static native nativeProcessAlgorithm(JIIID)I
.end method

.method private static native nativeProcessFrame(JIIIID)I
.end method

.method private static native nativeReleaseResourceFinder(JLcom/bef/effectsdk/ResourceFinder;)I
.end method

.method private static native nativeSendMessage(JJJJLjava/lang/String;)I
.end method

.method private static native nativeSetCameraPosition(JZ)V
.end method

.method private static native nativeSetFrameOrientation(JI)V
.end method

.method private static native nativeSetOrientation(JI)V
.end method

.method private static native nativeSetStickerPath(JLjava/lang/String;)I
.end method

.method private static native nativeTouchEvent(JI[I[F[F)I
.end method

.method public static processAlgorithm(JIIID)I
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, Lcom/bef/effectsdk/BEFEffectNative;->nativeProcessAlgorithm(JIIID)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static processFrame(JIIIID)I
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lcom/bef/effectsdk/BEFEffectNative;->nativeProcessFrame(JIIIID)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static releaseResourceFinder(JLcom/bef/effectsdk/ResourceFinder;)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/bef/effectsdk/BEFEffectNative;->nativeReleaseResourceFinder(JLcom/bef/effectsdk/ResourceFinder;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static sendMessage(JJJJLjava/lang/String;)I
    .locals 0

    .line 1
    invoke-static/range {p0 .. p8}, Lcom/bef/effectsdk/BEFEffectNative;->nativeSendMessage(JJJJLjava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static setCameraPosition(JZ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/bef/effectsdk/BEFEffectNative;->nativeSetCameraPosition(JZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setFrameOrientation(JI)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/bef/effectsdk/BEFEffectNative;->nativeSetFrameOrientation(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setOrientation(JI)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/bef/effectsdk/BEFEffectNative;->nativeSetOrientation(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static setStickerPath(JLjava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/bef/effectsdk/BEFEffectNative;->nativeSetStickerPath(JLjava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static touchBeginEvent(J[I[F[F)I
    .locals 6

    .line 1
    const/4 v2, 0x0

    .line 2
    move-wide v0, p0

    .line 3
    move-object v3, p2

    .line 4
    move-object v4, p3

    .line 5
    move-object v5, p4

    .line 6
    invoke-static/range {v0 .. v5}, Lcom/bef/effectsdk/BEFEffectNative;->nativeTouchEvent(JI[I[F[F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static touchEndEvent(J[I[F[F)I
    .locals 6

    .line 1
    const/4 v2, 0x2

    .line 2
    move-wide v0, p0

    .line 3
    move-object v3, p2

    .line 4
    move-object v4, p3

    .line 5
    move-object v5, p4

    .line 6
    invoke-static/range {v0 .. v5}, Lcom/bef/effectsdk/BEFEffectNative;->nativeTouchEvent(JI[I[F[F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static touchMoveEvent(J[I[F[F)I
    .locals 6

    .line 1
    const/4 v2, 0x1

    .line 2
    move-wide v0, p0

    .line 3
    move-object v3, p2

    .line 4
    move-object v4, p3

    .line 5
    move-object v5, p4

    .line 6
    invoke-static/range {v0 .. v5}, Lcom/bef/effectsdk/BEFEffectNative;->nativeTouchEvent(JI[I[F[F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method
