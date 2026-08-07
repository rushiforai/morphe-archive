.class public Lcom/ss/bytertc/engine/VideoStreamDescription;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;,
        Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;,
        Lcom/ss/bytertc/engine/VideoStreamDescription$CodecMode;
    }
.end annotation


# instance fields
.field public encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

.field public frameRate:I

.field public maxKbps:I

.field public minKbps:I

.field public videoSize:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 47
    iput v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 48
    sget-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->MaintainFramerate:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 40
    iput v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 41
    sget-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->MaintainFramerate:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 42
    new-instance v0, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 43
    iput p3, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 44
    iput p4, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 45
    iput p5, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    return-void
.end method

.method public constructor <init>(IIIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p6, 0x0

    .line 5
    iput p6, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 6
    .line 7
    sget-object p6, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->MaintainFramerate:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 8
    .line 9
    iput-object p6, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 10
    .line 11
    new-instance p6, Landroid/util/Pair;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-direct {p6, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iput-object p6, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 25
    .line 26
    iput p3, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 27
    .line 28
    iput p4, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 29
    .line 30
    iput p5, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 31
    .line 32
    invoke-static {p8}, Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;->convertFromInt(I)Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 37
    .line 38
    return-void
.end method

.method private static create(IIIII)Lcom/ss/bytertc/engine/VideoStreamDescription;
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/VideoStreamDescription;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/ss/bytertc/engine/VideoStreamDescription;-><init>(IIIII)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public isValid()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 16
    .line 17
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    iget v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 28
    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget v0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 32
    .line 33
    if-lez v0, :cond_0

    .line 34
    .line 35
    iget p0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 36
    .line 37
    if-le p0, v0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoStreamDescription{videoSize="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->videoSize:Landroid/util/Pair;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", frameRate="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->frameRate:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", maxKbps="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->maxKbps:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", minKbps="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->minKbps:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", encodePreference="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription;->encodePreference:Lcom/ss/bytertc/engine/VideoStreamDescription$EncoderPreference;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
