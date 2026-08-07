.class public Lcom/ss/bytertc/engine/live/SourceCrop;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public heightProportion:D

.field public locationX:D

.field public locationY:D

.field public widthProportion:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->locationX:D

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->locationY:D

    .line 9
    .line 10
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->widthProportion:D

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/ss/bytertc/engine/live/SourceCrop;->heightProportion:D

    .line 15
    .line 16
    return-void
.end method
