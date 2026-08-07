.class public Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public problemDesc:Ljava/lang/String;

.field public roomInfo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;->problemDesc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getProblemDesc()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;->problemDesc:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomInfo()[Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackInfo;->roomInfo:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;

    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, [Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;

    .line 15
    .line 16
    return-object p0
.end method
