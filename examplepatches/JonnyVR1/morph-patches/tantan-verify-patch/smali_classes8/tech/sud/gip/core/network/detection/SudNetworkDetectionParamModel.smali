.class public Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final FILE_TAG:Ljava/lang/String; = "SudNetworkDetectionParamModel"

.field private static _TAG:Ljava/lang/String; = "SudNetworkDetectionParamModel"


# instance fields
.field public appId:Ljava/lang/String;

.field public appKey:Ljava/lang/String;

.field public context:Landroid/content/Context;

.field public isTestEnv:Z

.field public userId:Ljava/lang/String;


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


# virtual methods
.method public check()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->context:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "SudNetworkDetectionParamModel"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->_TAG:Ljava/lang/String;

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
    iget-object v0, p0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->appId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object p0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->_TAG:Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "Please check appId invalid"

    .line 30
    .line 31
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    iget-object p0, p0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->appKey:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    sget-object p0, Ltech/sud/gip/core/network/detection/SudNetworkDetectionParamModel;->_TAG:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "Please check appKey invalid"

    .line 49
    .line 50
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return v1

    .line 57
    :cond_2
    const/4 p0, 0x1

    .line 58
    return p0
.end method
