.class public Ltech/sud/mgp/core/SudMGP;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final FILE_TAG:Ljava/lang/String; = "SudMGP"

.field private static final _TAG:Ljava/lang/String; = "SudMGP SudMGP"


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

.method public static cancelPreloadMGPkgList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "SudMGP"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "cancelPreloadMGPkgList Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {v1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Ll/wxg0;->c:Ll/wxg0;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-string p0, "cancelPreloadMGPkgList preloader is null"

    .line 20
    .line 21
    invoke-static {v1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {v0, p0}, Ll/wxg0;->cancelPreloadMGPkgList(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static destroyMG(Ltech/sud/gip/core/ISudFSTAPP;)Z
    .locals 1

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "SudMGP"

    .line 8
    .line 9
    const-string v0, "destroyMG Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->destroyMG()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public static getCfg()Ltech/sud/gip/core/ISudCfg;
    .locals 2

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "SudMGP"

    .line 8
    .line 9
    const-string v1, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object v0, Ll/arg0;->a:Ll/pjg0;

    .line 15
    .line 16
    return-object v0
.end method

.method public static getLogDirPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getLogDirPath(Landroid/content/Context;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getMGList(Ltech/sud/gip/core/ISudListenerGetMGList;)V
    .locals 4

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "Please call on UI or Main thread"

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, v2, v1}, Ltech/sud/gip/core/ISudListenerGetMGList;->onFailure(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    sget-object v0, Ll/utg0;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    if-ne v0, v3, :cond_2

    .line 26
    .line 27
    sget-object v0, Ll/utg0;->b:Ll/uyg0;

    .line 28
    .line 29
    iget-boolean v1, v0, Ll/uyg0;->a:Z

    .line 30
    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/16 v0, -0x2777

    .line 36
    .line 37
    const-string v1, "Please call initSDK first successfully"

    .line 38
    .line 39
    invoke-interface {p0, v0, v1}, Ltech/sud/gip/core/ISudListenerGetMGList;->onFailure(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object v1, v0, Ll/uyg0;->i:Ljava/lang/String;

    .line 44
    .line 45
    new-instance v2, Ll/kfg0;

    .line 46
    .line 47
    invoke-direct {v2, v0, v1, p0}, Ll/kfg0;-><init>(Ll/uyg0;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerGetMGList;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    if-eqz p0, :cond_3

    .line 57
    .line 58
    invoke-interface {p0, v2, v1}, Ltech/sud/gip/core/ISudListenerGetMGList;->onFailure(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "1.6.7.1286"

    .line 2
    .line 3
    return-object v0
.end method

.method public static getVersionAlias()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "v1.6.7.1286-static"

    .line 2
    .line 3
    return-object v0
.end method

.method public static initSDK(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLtech/sud/gip/core/ISudListenerInitSDK;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ltech/sud/gip/core/SudInitSDKParamModel;

    .line 2
    .line 3
    invoke-direct {v0}, Ltech/sud/gip/core/SudInitSDKParamModel;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iput-object p0, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p1, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p2, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 15
    .line 16
    iput-boolean p3, v0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 17
    .line 18
    invoke-static {v0, p4}, Ltech/sud/mgp/core/SudMGP;->initSDK(Ltech/sud/gip/core/SudInitSDKParamModel;Ltech/sud/gip/core/ISudListenerInitSDK;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static initSDK(Ltech/sud/gip/core/SudInitSDKParamModel;Ltech/sud/gip/core/ISudListenerInitSDK;)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-static {p0, p1, v0, v0}, Ll/utg0;->b(Ltech/sud/gip/core/SudInitSDKParamModel;Ltech/sud/gip/core/ISudListenerInitSDK;Ll/yng0;Ll/yng0;)V

    return-void
.end method

.method public static loadMG(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ltech/sud/gip/core/ISudFSMMG;)Ltech/sud/gip/core/ISudFSTAPP;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 69
    new-instance v0, Ltech/sud/gip/core/SudLoadMGParamModel;

    invoke-direct {v0}, Ltech/sud/gip/core/SudLoadMGParamModel;-><init>()V

    .line 70
    iput-object p0, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->activity:Landroid/app/Activity;

    .line 71
    iput-object p1, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->userId:Ljava/lang/String;

    .line 72
    iput-object p2, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->roomId:Ljava/lang/String;

    .line 73
    iput-object p3, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->code:Ljava/lang/String;

    .line 74
    iput-wide p4, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->mgId:J

    .line 75
    iput-object p6, v0, Ltech/sud/gip/core/SudLoadMGParamModel;->language:Ljava/lang/String;

    .line 76
    invoke-static {v0, p7}, Ltech/sud/mgp/core/SudMGP;->loadMG(Ltech/sud/gip/core/SudLoadMGParamModel;Ltech/sud/gip/core/ISudFSMMG;)Ltech/sud/gip/core/ISudFSTAPP;

    move-result-object p0

    return-object p0
.end method

.method public static loadMG(Ltech/sud/gip/core/SudLoadMGParamModel;Ltech/sud/gip/core/ISudFSMMG;)Ltech/sud/gip/core/ISudFSTAPP;
    .locals 4

    .line 1
    sget-object v0, Ltech/sud/mgp/core/SudMGP;->_TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "loadMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const-string v3, "SudMGP"

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string p0, "Please call on UI or Main thread"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "loadMG Please call on UI or Main thread"

    .line 23
    .line 24
    invoke-static {v3, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-object v2

    .line 28
    :cond_0
    if-eqz p0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Ltech/sud/gip/core/SudLoadMGParamModel;->check()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->activity:Landroid/app/Activity;

    .line 40
    .line 41
    invoke-static {v0}, Ltech/sud/base/utils/Utils;->initContext(Landroid/content/Context;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->userId:Ljava/lang/String;

    .line 45
    .line 46
    sput-object v0, Ll/fug0;->a:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v0, p0, Ltech/sud/gip/core/SudLoadMGParamModel;->language:Ljava/lang/String;

    .line 49
    .line 50
    sput-object v0, Ll/utg0;->d:Ljava/lang/String;

    .line 51
    .line 52
    new-instance v0, Ll/dhg0;

    .line 53
    .line 54
    invoke-direct {v0, p0, p1}, Ll/dhg0;-><init>(Ltech/sud/gip/core/SudLoadMGParamModel;Ltech/sud/gip/core/ISudFSMMG;)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_2
    :goto_0
    const-string p0, "Parameters cannot be null"

    .line 59
    .line 60
    invoke-static {v0, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string p0, "loadMG Parameters cannot be null"

    .line 64
    .line 65
    invoke-static {v3, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-object v2
.end method

.method public static preloadMGPkgList(Landroid/content/Context;Ljava/util/List;Ltech/sud/gip/core/ISudListenerPreloadMGPkg;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;",
            "Ltech/sud/gip/core/ISudListenerPreloadMGPkg;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "SudMGP"

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    const-string p1, "Please call on UI or Main thread"

    .line 15
    .line 16
    invoke-interface {p2, v2, v3, p0, p1}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadFailure(JILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string p0, "preloadMGPkgList Please call on UI or Main thread"

    .line 20
    .line 21
    invoke-static {v1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    sget-object v0, Ll/wxg0;->c:Ll/wxg0;

    .line 26
    .line 27
    const-string v4, "preloadMGPkgList Please call initSDK first successfully"

    .line 28
    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    const/16 p0, -0x2777

    .line 34
    .line 35
    const-string p1, "Please call initSDK first successfully"

    .line 36
    .line 37
    invoke-interface {p2, v2, v3, p0, p1}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadFailure(JILjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-static {v1, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    if-eqz p1, :cond_5

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-nez v5, :cond_4

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_4
    invoke-virtual {v0, p0, p1, p2}, Ll/wxg0;->preloadMGPkgList(Landroid/content/Context;Ljava/util/List;Ltech/sud/gip/core/ISudListenerPreloadMGPkg;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_5
    :goto_0
    if-eqz p2, :cond_6

    .line 58
    .line 59
    const/16 p0, -0x2778

    .line 60
    .line 61
    const-string p1, "Parameters cannot be null"

    .line 62
    .line 63
    invoke-interface {p2, v2, v3, p0, p1}, Ltech/sud/gip/core/ISudListenerPreloadMGPkg;->onPreloadFailure(JILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_6
    invoke-static {v1, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static setLogLevel(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLogLevel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "SudMGP"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p0, "Please call on UI or Main thread"

    .line 27
    .line 28
    invoke-static {v1, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "setLogLevel Please call on UI or Main thread"

    .line 32
    .line 33
    invoke-static {v1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {p0}, Ltech/sud/gip/logger/SudLogger;->setLogLevel(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static setLogger(Ltech/sud/gip/core/ISudLogger;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setLogger:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "SudMGP"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p0, "Please call on UI or Main thread"

    .line 27
    .line 28
    invoke-static {v1, p0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "setLogger Please call on UI or Main thread"

    .line 32
    .line 33
    invoke-static {v1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {p0}, Ltech/sud/gip/logger/SudLogger;->setLogger(Ltech/sud/gip/core/ISudLogger;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static setReportStatsEventListener(Ltech/sud/gip/core/ISudListenerReportStatsEvent;)Z
    .locals 1

    .line 1
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "SudMGP"

    .line 8
    .line 9
    const-string v0, "Please call on UI or Main thread"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    sput-object p0, Ll/fug0;->b:Ltech/sud/gip/core/ISudListenerReportStatsEvent;

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public static setUserId(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public static startNetworkDetection(Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;Ltech/sud/gip/core/network/detection/INetworkDetectionListener;)Ltech/sud/gip/core/network/detection/INetworkDetectionFuture;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->check()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/chg0;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Ll/chg0;-><init>(Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;Ltech/sud/gip/core/network/detection/INetworkDetectionListener;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/lang/Thread;

    .line 16
    .line 17
    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    iget-object p0, v0, Ll/chg0;->c:Ll/yfg0;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    :goto_0
    const-string p0, "SudMGP"

    .line 27
    .line 28
    const-string v0, "initSDK Parameters cannot be null"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Ltech/sud/mgp/core/SudMGP;->_TAG:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    new-instance p0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;

    .line 41
    .line 42
    invoke-direct {p0}, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;-><init>()V

    .line 43
    .line 44
    .line 45
    const/16 v0, -0x2778

    .line 46
    .line 47
    iput v0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->code:I

    .line 48
    .line 49
    const-string v0, "Parameters cannot be null"

    .line 50
    .line 51
    iput-object v0, p0, Ltech/sud/gip/core/network/detection/NetworkDetectionResult;->msg:Ljava/lang/String;

    .line 52
    .line 53
    invoke-interface {p1, p0}, Ltech/sud/gip/core/network/detection/INetworkDetectionListener;->onCompleted(Ltech/sud/gip/core/network/detection/NetworkDetectionResult;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public static uninitSDK(Ltech/sud/gip/core/ISudListenerUninitSDK;)V
    .locals 2

    .line 1
    const-string v0, "SudMGP"

    .line 2
    .line 3
    const-string v1, "uninitSDK"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ltech/sud/gip/base/ThreadUtils;->checkUIThread()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    const-string v1, "Please call on UI or Main thread"

    .line 18
    .line 19
    invoke-interface {p0, v0, v1}, Ltech/sud/gip/core/ISudListenerUninitSDK;->onFailure(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v0, Ll/utg0;->b:Ll/uyg0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/uyg0;->f()V

    .line 26
    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ltech/sud/gip/core/ISudListenerUninitSDK;->onSuccess()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method
