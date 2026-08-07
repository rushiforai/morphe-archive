.class public Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;
    }
.end annotation


# instance fields
.field public repeatCount:I

.field public streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

.field public streamType:Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/StreamIndex;ILcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->repeatCount:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->streamType:Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig$SyncInfoStreamType;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "StreamSyncInfoConfig{ streamIndex=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->streamIndex:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/StreamIndex;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "\'repeatCount=\'"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget p0, p0, Lcom/ss/bytertc/engine/data/StreamSyncInfoConfig;->repeatCount:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "\'streamType=Audio }"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method
