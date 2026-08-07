.class public Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public applyRotation:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

.field public mirrorType:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

.field public pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public position:Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;->AFTER_POST_PROCESS:Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->position:Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 11
    .line 12
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->DEFAULT:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->applyRotation:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 15
    .line 16
    sget-object v0, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->OFF:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->mirrorType:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 19
    .line 20
    return-void
.end method
