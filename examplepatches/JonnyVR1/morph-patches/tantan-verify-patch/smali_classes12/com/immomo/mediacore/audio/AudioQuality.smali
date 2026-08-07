.class public Lcom/immomo/mediacore/audio/AudioQuality;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DEFAULT_AUDIO_QUALITY:Lcom/immomo/mediacore/audio/AudioQuality;


# instance fields
.field public bitRate:I

.field public channelNum:I

.field public samplingRate:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/AudioQuality;

    .line 2
    .line 3
    const v1, 0xac44

    .line 4
    .line 5
    .line 6
    const v2, 0x17700

    .line 7
    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioQuality;-><init>(II)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/immomo/mediacore/audio/AudioQuality;->DEFAULT_AUDIO_QUALITY:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 14
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 15
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 16
    iput p2, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    return-void
.end method

.method public static merge(Lcom/immomo/mediacore/audio/AudioQuality;Lcom/immomo/mediacore/audio/AudioQuality;)Lcom/immomo/mediacore/audio/AudioQuality;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p1, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget p1, p1, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 18
    .line 19
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 20
    .line 21
    :cond_1
    return-object p0
.end method

.method public static parseQuality(Ljava/lang/String;)Lcom/immomo/mediacore/audio/AudioQuality;
    .locals 3

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/AudioQuality;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1}, Lcom/immomo/mediacore/audio/AudioQuality;-><init>(II)V

    .line 5
    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string v2, "-"

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :try_start_0
    aget-object v1, p0, v1

    .line 16
    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    mul-int/lit16 v1, v1, 0x3e8

    .line 22
    .line 23
    iput v1, v0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    aget-object p0, p0, v1

    .line 27
    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    iput p0, v0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    :catch_0
    :cond_0
    return-object v0
.end method


# virtual methods
.method public clone()Lcom/immomo/mediacore/audio/AudioQuality;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/AudioQuality;

    .line 2
    .line 3
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 4
    .line 5
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lcom/immomo/mediacore/audio/AudioQuality;-><init>(II)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 11
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioQuality;->clone()Lcom/immomo/mediacore/audio/AudioQuality;

    move-result-object p0

    return-object p0
.end method

.method public equals(Lcom/immomo/mediacore/audio/AudioQuality;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget v1, p1, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 6
    .line 7
    iget v2, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne v1, v2, :cond_1

    .line 11
    .line 12
    move v1, v3

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    move v1, v0

    .line 15
    :goto_0
    iget p1, p1, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 16
    .line 17
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 18
    .line 19
    if-ne p1, p0, :cond_2

    .line 20
    .line 21
    move v0, v3

    .line 22
    :cond_2
    and-int p0, v1, v0

    .line 23
    .line 24
    return p0
.end method
