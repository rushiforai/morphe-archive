.class public Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public position:Lcom/ss/bytertc/engine/video/LocalVideoSinkPosition;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/video/LocalVideoSinkPosition;->AFTER_PREPROCESS:Lcom/ss/bytertc/engine/video/LocalVideoSinkPosition;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->position:Lcom/ss/bytertc/engine/video/LocalVideoSinkPosition;

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/LocalVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 11
    .line 12
    return-void
.end method
