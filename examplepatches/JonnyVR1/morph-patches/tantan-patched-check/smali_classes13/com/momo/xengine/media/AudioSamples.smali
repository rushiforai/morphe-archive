.class public Lcom/momo/xengine/media/AudioSamples;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private data:[B

.field private samples:I

.field private timestamp:J


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
    iput-object v0, p0, Lcom/momo/xengine/media/AudioSamples;->data:[B

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/AudioSamples;->data:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getSamples()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/AudioSamples;->samples:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/AudioSamples;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setData([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/AudioSamples;->data:[B

    .line 2
    .line 3
    return-void
.end method

.method public setSamples(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/AudioSamples;->samples:I

    .line 2
    .line 3
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/AudioSamples;->timestamp:J

    .line 2
    .line 3
    return-void
.end method
