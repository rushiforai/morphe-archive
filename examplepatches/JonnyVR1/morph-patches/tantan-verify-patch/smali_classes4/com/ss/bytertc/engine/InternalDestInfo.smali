.class public Lcom/ss/bytertc/engine/InternalDestInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public roomId:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/DestInfo;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/ss/bytertc/engine/data/DestInfo;->roomId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalDestInfo;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/DestInfo;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalDestInfo;->userId:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalDestInfo;->roomId:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/ss/bytertc/engine/InternalDestInfo;->userId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getRoomId()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalDestInfo;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalDestInfo;->userId:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method
