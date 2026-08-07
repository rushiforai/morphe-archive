.class public Lcom/ss/bytertc/engine/InternalRoomEventInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public forbiddenTime:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/ss/bytertc/engine/InternalRoomEventInfo;->forbiddenTime:J

    .line 5
    .line 6
    return-void
.end method

.method private static create(J)Lcom/ss/bytertc/engine/InternalRoomEventInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRoomEventInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/ss/bytertc/engine/InternalRoomEventInfo;-><init>(J)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
