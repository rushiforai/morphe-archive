.class public Lcom/ss/bytertc/engine/UserInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public extraInfo:Ljava/lang/String;

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/UserInfo;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/UserInfo;->extraInfo:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/bytertc/engine/UserInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/UserInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/ss/bytertc/engine/UserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public getExtraInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/UserInfo;->extraInfo:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUid()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/UserInfo;->uid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
