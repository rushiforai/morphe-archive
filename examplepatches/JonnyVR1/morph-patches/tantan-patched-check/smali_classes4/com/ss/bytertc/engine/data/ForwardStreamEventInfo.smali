.class public Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;
    }
.end annotation


# instance fields
.field public event:Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;

.field public roomId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;->roomId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;->event:Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;

    .line 7
    .line 8
    return-void
.end method

.method private static create(Ljava/lang/String;I)Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;->fromId(I)Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p0, p1}, Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;-><init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
