.class public Ltech/sud/gip/core/GameInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public appID:Ljava/lang/String;

.field public autUrl:Ljava/lang/String;

.field public bigLoadingPic:Ljava/lang/String;

.field public clientVersion:J

.field public desc:Ljava/lang/String;

.field public dynamicConfig:Ljava/lang/String;

.field public eUrl:Ljava/lang/String;

.field public engine:I

.field public etCorePath:Ljava/lang/String;

.field public gameLargeModelCfg:Ll/xlg0;

.field public gamePath:Ljava/lang/String;

.field public hash:Ljava/lang/String;

.field public isInstalled:Z

.field public loadingPic:Ljava/lang/String;

.field public mgId:J

.field public name:Ljava/lang/String;

.field public orientation:I

.field public require:[Ljava/lang/String;

.field public screenMode:I

.field public tags:[Ljava/lang/String;

.field public unityFrameworkType:I

.field public url:Ljava/lang/String;

.field public version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v1, v0, [Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->tags:[Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->version:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    iput v2, p0, Ltech/sud/gip/core/GameInfo;->orientation:I

    .line 15
    .line 16
    iput v2, p0, Ltech/sud/gip/core/GameInfo;->screenMode:I

    .line 17
    .line 18
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->url:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->eUrl:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->autUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->appID:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->hash:Ljava/lang/String;

    .line 27
    .line 28
    new-array v1, v0, [Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->require:[Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "{}"

    .line 33
    .line 34
    iput-object v1, p0, Ltech/sud/gip/core/GameInfo;->dynamicConfig:Ljava/lang/String;

    .line 35
    .line 36
    iput v2, p0, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 37
    .line 38
    iput v0, p0, Ltech/sud/gip/core/GameInfo;->unityFrameworkType:I

    .line 39
    .line 40
    iput-boolean v0, p0, Ltech/sud/gip/core/GameInfo;->isInstalled:Z

    .line 41
    .line 42
    return-void
.end method
