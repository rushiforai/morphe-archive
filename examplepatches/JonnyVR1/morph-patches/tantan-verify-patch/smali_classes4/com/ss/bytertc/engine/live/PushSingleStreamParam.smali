.class public Lcom/ss/bytertc/engine/live/PushSingleStreamParam;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public destInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/DestInfo;",
            ">;"
        }
    .end annotation
.end field

.field public isScreen:Z

.field public pushType:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

.field public roomId:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->isScreen:Z

    .line 34
    sget-object v0, Lcom/ss/bytertc/engine/live/SingleStreamPushType;->SINGLE_STREAM_PUSH_TYPE_TO_CDN:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    iput-object v0, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->pushType:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->isScreen:Z

    .line 6
    .line 7
    sget-object v0, Lcom/ss/bytertc/engine/live/SingleStreamPushType;->SINGLE_STREAM_PUSH_TYPE_TO_CDN:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->userId:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->url:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->isScreen:Z

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->destInfos:Ljava/util/List;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->pushType:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Lcom/ss/bytertc/engine/live/SingleStreamPushType;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/DestInfo;",
            ">;",
            "Lcom/ss/bytertc/engine/live/SingleStreamPushType;",
            ")V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->isScreen:Z

    .line 25
    sget-object v0, Lcom/ss/bytertc/engine/live/SingleStreamPushType;->SINGLE_STREAM_PUSH_TYPE_TO_CDN:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    .line 26
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->roomId:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->userId:Ljava/lang/String;

    .line 28
    iput-object p3, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->url:Ljava/lang/String;

    .line 29
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->isScreen:Z

    .line 30
    iput-object p5, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->destInfos:Ljava/util/List;

    .line 31
    iput-object p6, p0, Lcom/ss/bytertc/engine/live/PushSingleStreamParam;->pushType:Lcom/ss/bytertc/engine/live/SingleStreamPushType;

    return-void
.end method
