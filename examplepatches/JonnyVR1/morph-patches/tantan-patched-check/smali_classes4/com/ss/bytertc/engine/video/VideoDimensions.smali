.class public Lcom/ss/bytertc/engine/video/VideoDimensions;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/video/VideoDimensions;->width:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/video/VideoDimensions;->height:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Lcom/ss/bytertc/engine/video/VideoDimensions;->width:I

    .line 12
    iput p2, p0, Lcom/ss/bytertc/engine/video/VideoDimensions;->height:I

    return-void
.end method
