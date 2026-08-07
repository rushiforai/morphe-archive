.class public Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public roomId:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;->roomId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;->userId:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getRoomId()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/type/ProblemFeedbackRoomInfo;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
