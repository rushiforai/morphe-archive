.class public Lcom/p1/mobile/putong/api/push/PushTrackData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public alreadyClicked:Z

.field public createdTime:D

.field public currentTime:J

.field public duration:J

.field public gid:Ljava/lang/String;

.field public intent:Ljava/lang/String;

.field public pushName:Ljava/lang/String;

.field public reqId:Ljava/lang/String;


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


# virtual methods
.method public alreadyClick()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->alreadyClicked:Z

    .line 3
    .line 4
    return-void
.end method
