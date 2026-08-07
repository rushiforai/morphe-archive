.class public Ltech/sud/gip/core/SudInitSDKParamModel;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final FILE_TAG:Ljava/lang/String; = "SudInitSDKParamModel"

.field private static _TAG:Ljava/lang/String; = "SudInitSdkParamModel"


# instance fields
.field public appId:Ljava/lang/String;

.field public appKey:Ljava/lang/String;

.field public context:Landroid/content/Context;

.field public isTestEnv:Z

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public check()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "SudInitSDKParamModel"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ltech/sud/gip/core/SudInitSDKParamModel;->_TAG:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "Please check context invalid"

    .line 11
    .line 12
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    iget-object v0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-object p0, p0, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_3
    :goto_0
    sget-object p0, Ltech/sud/gip/core/SudInitSDKParamModel;->_TAG:Ljava/lang/String;

    .line 44
    .line 45
    const-string v0, "Please check appKey invalid"

    .line 46
    .line 47
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :cond_4
    :goto_1
    sget-object p0, Ltech/sud/gip/core/SudInitSDKParamModel;->_TAG:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "Please check appId invalid"

    .line 57
    .line 58
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return v1
.end method
