.class public Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public afterEnable:Z

.field public afterVideoIndex:I

.field public beforeEnable:Z

.field public beforeVideoIndex:I

.field public isScreen:Z

.field public reason:I

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZIIZZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->isScreen:Z

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->beforeVideoIndex:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->afterVideoIndex:I

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->beforeEnable:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->afterEnable:Z

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;->reason:I

    .line 17
    .line 18
    return-void
.end method

.method public static create(Ljava/lang/String;ZIIZZI)Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;
    .locals 8
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    move v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Lcom/ss/bytertc/engine/InternalRemoteStreamSwitch;-><init>(Ljava/lang/String;ZIIZZI)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method
