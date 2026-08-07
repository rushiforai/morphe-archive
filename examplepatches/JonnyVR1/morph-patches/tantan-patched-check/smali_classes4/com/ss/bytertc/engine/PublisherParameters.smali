.class public Lcom/ss/bytertc/engine/PublisherParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioKBitrate:I

.field public audiochannels:I

.field public audiosamplerate:I

.field public defaultLayout:I

.field public extraInfo:Ljava/lang/String;

.field public framerate:I

.field public height:I

.field public kBitrate:I

.field public lifecycle:I

.field public mosaicStream:Ljava/lang/String;

.field public owner:Z

.field public width:I


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
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->owner:Z

    .line 6
    .line 7
    const/16 v0, 0x168

    .line 8
    .line 9
    iput v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->width:I

    .line 10
    .line 11
    const/16 v0, 0x280

    .line 12
    .line 13
    iput v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->height:I

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->lifecycle:I

    .line 17
    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->defaultLayout:I

    .line 19
    .line 20
    const/16 v1, 0xf

    .line 21
    .line 22
    iput v1, p0, Lcom/ss/bytertc/engine/PublisherParameters;->framerate:I

    .line 23
    .line 24
    const/16 v1, 0x1f4

    .line 25
    .line 26
    iput v1, p0, Lcom/ss/bytertc/engine/PublisherParameters;->kBitrate:I

    .line 27
    .line 28
    const v1, 0xac44

    .line 29
    .line 30
    .line 31
    iput v1, p0, Lcom/ss/bytertc/engine/PublisherParameters;->audiosamplerate:I

    .line 32
    .line 33
    const/16 v1, 0x60

    .line 34
    .line 35
    iput v1, p0, Lcom/ss/bytertc/engine/PublisherParameters;->audioKBitrate:I

    .line 36
    .line 37
    iput v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->audiochannels:I

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lcom/ss/bytertc/engine/PublisherParameters;->extraInfo:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method
