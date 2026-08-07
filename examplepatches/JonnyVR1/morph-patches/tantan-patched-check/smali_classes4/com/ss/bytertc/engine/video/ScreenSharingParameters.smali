.class public Lcom/ss/bytertc/engine/video/ScreenSharingParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bitrate:I

.field public frameRate:I

.field public maxHeight:I

.field public maxWidth:I

.field public minBitrate:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->maxWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->maxHeight:I

    .line 8
    .line 9
    const/16 v1, 0xf

    .line 10
    .line 11
    iput v1, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->frameRate:I

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    iput v1, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->bitrate:I

    .line 15
    .line 16
    iput v0, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->minBitrate:I

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p2, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->maxHeight:I

    .line 21
    iput p1, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->maxWidth:I

    .line 22
    iput p3, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->frameRate:I

    .line 23
    iput p4, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->bitrate:I

    .line 24
    iput p5, p0, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->minBitrate:I

    return-void
.end method
