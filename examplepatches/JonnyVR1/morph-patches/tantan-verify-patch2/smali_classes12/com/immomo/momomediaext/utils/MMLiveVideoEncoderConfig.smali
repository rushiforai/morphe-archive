.class public Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public encodeHeight:I

.field public encodeWidth:I

.field public videoBitRate:I

.field public videoFPS:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x210

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeWidth:I

    .line 7
    .line 8
    const/16 v0, 0x3c0

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeHeight:I

    .line 11
    .line 12
    const/16 v0, 0xf

    .line 13
    .line 14
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoFPS:I

    .line 15
    .line 16
    const v0, 0xc3500

    .line 17
    .line 18
    .line 19
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<encodeWidth:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeWidth:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",encodeHeight:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->encodeHeight:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",fps:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoFPS:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ",videoBitRate:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLiveVideoEncoderConfig;->videoBitRate:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x3e

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
