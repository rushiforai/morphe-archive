.class public Lcom/ss/bytertc/engine/video/VideoPreset;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bandwidth:I

.field private fps:I

.field private height:I

.field private width:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->height:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->fps:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->bandwidth:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getBandwidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->bandwidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getFps()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->fps:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/video/VideoPreset;->width:I

    .line 2
    .line 3
    return p0
.end method
