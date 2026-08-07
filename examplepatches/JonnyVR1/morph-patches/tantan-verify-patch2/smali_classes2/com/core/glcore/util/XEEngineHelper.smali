.class public Lcom/core/glcore/util/XEEngineHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "XEEngineHelper"

.field private static sRootPath:Ljava/lang/String;

.field private static sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;


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

.method private static create(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/momo/xeengine/XE3DEngine;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/momo/xeengine/XE3DEngine;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 15
    .line 16
    sget-object p0, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/XE3DEngine;->setLibraryPath(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "\u4e0a\u4e00\u4e2a\u8fd8\u6ca1\u8c03\u7528remove\uff0c\u5c31\u8fc7\u6765\u521b\u5efa\u4e86\uff1f"

    .line 23
    .line 24
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const-string p0, "\u8bf7\u5148\u914d\u7f6erootPath"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static destroy()V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->endEngine()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 10
    .line 11
    sput-object v0, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static get()Lcom/momo/xeengine/XE3DEngine;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getLibraryPath()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "last root path :"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",this root path :"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "XEEngineHelper"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const-string v0, "RootPath has been configured!!!!!!!!!!!!!!!!!\u26a0\ufe0f\u26a0\ufe0f\u26a0\ufe0f"

    .line 41
    .line 42
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    const-string v0, "\u4e24\u79cd\u539f\u56e0\uff0c\u4e0a\u4e00\u6b21\u6ca1remove\uff0c\u6216\u8005rootPath\u53d8\u52a8"

    .line 46
    .line 47
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    :cond_0
    sput-object p1, Lcom/core/glcore/util/XEEngineHelper;->sRootPath:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p0, p2}, Lcom/core/glcore/util/XEEngineHelper;->create(Landroid/content/Context;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static loadScene(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/momo/xeengine/XE3DEngine;->loadSceneWithId(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "\u5f15\u64ce\u4e3a\u7a7a\uff01\uff01\uff01\u8bf7\u68c0\u67e5\u903b\u8f91 "

    .line 10
    .line 11
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->throwException(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static queueEvent(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/XE3DEngine;->queueEvent(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static render(II)V
    .locals 1

    .line 44
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {v0, p0, p1}, Lcom/momo/xeengine/XE3DEngine;->resizeWindow(II)V

    .line 46
    sget-object p0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->render()V

    return-void

    .line 47
    :cond_0
    const-string p0, "XEEngineHelper"

    const-string p1, "render \u65f6sXE3DEngine = null"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    const-string p0, "\u5f15\u64ce\u4e3a\u7a7a\uff01\uff01\uff01\u8bf7\u68c0\u67e5\u903b\u8f91 "

    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->throwException(Ljava/lang/String;)V

    return-void
.end method

.method public static render(IILjava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/momo/xeengine/XE3DEngine;->resizeWindow(II)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Lcom/momo/xeengine/XE3DEngine;->render(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p1, "render: "

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " \u65f6sXE3DEngine = null"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "XEEngineHelper"

    .line 34
    .line 35
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    const-string p0, "\u5f15\u64ce\u4e3a\u7a7a\uff01\uff01\uff01\u8bf7\u68c0\u67e5\u903b\u8f91 "

    .line 39
    .line 40
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->throwException(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static runEngine(II)V
    .locals 1

    const/4 v0, 0x0

    .line 53
    invoke-static {p0, p1, v0}, Lcom/core/glcore/util/XEEngineHelper;->runEngine(IIZ)V

    return-void
.end method

.method public static runEngine(IIZ)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/momo/xeengine/XE3DEngine;->runEngine(II)Z

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->clearBackground()V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/momo/xeengine/XE3DEngine;->enableClearColor(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string p1, "\u5f15\u64ce\u5df2\u7ecf\u542f\u52a8\u4e86\uff01\uff01\uff01\u8bf7\u68c0\u67e5\u903b\u8f91 "

    .line 30
    .line 31
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->throwException(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const-string p0, "\u5f15\u64ce\u4e3a\u7a7a\uff01\uff01\uff01\u8bf7\u68c0\u67e5\u903b\u8f91 "

    .line 48
    .line 49
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->throwException(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static setBodyInfos(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/momo/xeengine/cv/bean/CVBodyInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchBodyInfo(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setExpressionInfos(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/momo/xeengine/cv/bean/CVExpressInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchExpressInfo(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setFaceInfos(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/momo/xeengine/cv/bean/XEFaceInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setFaceSegmentInfo(Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchFaceSegmentInfo(Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setHandInfos(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/momo/xeengine/cv/bean/XEHandInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchHandInfo(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setObjectInfo(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/momo/xeengine/cv/bean/CVObjectInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchObjectInfo(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static setSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static throwException(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public static unloadScene(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/XE3DEngine;->unloadScene(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/core/glcore/util/XEEngineHelper;->sXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->render()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "\u5f15\u64ce\u4e3a\u7a7a\uff01\uff01\uff01\u8bf7\u68c0\u67e5\u903b\u8f91 "

    .line 15
    .line 16
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->throwException(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
