.class public Lcom/ss/bytertc/engine/NetworkTimeInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public timestamp:J


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

.method public static create()Lcom/ss/bytertc/engine/NetworkTimeInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/NetworkTimeInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/bytertc/engine/NetworkTimeInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public nativeSetTimestamp(J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/ss/bytertc/engine/NetworkTimeInfo;->timestamp:J

    .line 2
    .line 3
    return-void
.end method
