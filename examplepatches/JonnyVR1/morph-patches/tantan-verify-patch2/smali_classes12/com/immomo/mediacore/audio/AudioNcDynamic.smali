.class public Lcom/immomo/mediacore/audio/AudioNcDynamic;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/coninf/MRtcAudioHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediacore/audio/AudioNcDynamic$Sigleton;,
        Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioNcDynamic"


# instance fields
.field private audioNcDynamicCallBack:Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;

.field private index:J

.field private vScoreArray:[J


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->index:J

    .line 7
    .line 8
    const/16 v0, 0x1e

    .line 9
    .line 10
    new-array v0, v0, [J

    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->vScoreArray:[J

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/mediacore/audio/AudioNcDynamic$1;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioNcDynamic;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/immomo/mediacore/audio/AudioNcDynamic;
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mediacore/audio/AudioNcDynamic$Sigleton;->access$000()Lcom/immomo/mediacore/audio/AudioNcDynamic;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public onAudioVolumeIndication([Lcom/immomo/mediacore/audio/AudioVolumeWeight;I)V
    .locals 9

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-object p1, p1, p2

    .line 3
    .line 4
    iget p1, p1, Lcom/immomo/mediacore/audio/AudioVolumeWeight;->volume:F

    .line 5
    .line 6
    const/high16 v0, 0x42c80000    # 100.0f

    .line 7
    .line 8
    mul-float/2addr p1, v0

    .line 9
    float-to-int p1, p1

    .line 10
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->vScoreArray:[J

    .line 11
    .line 12
    const-wide/16 v1, 0x1e

    .line 13
    .line 14
    const-wide/16 v3, 0x1

    .line 15
    .line 16
    const/16 v5, 0x14

    .line 17
    .line 18
    if-lt p1, v5, :cond_0

    .line 19
    .line 20
    iget-wide v5, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->index:J

    .line 21
    .line 22
    add-long v7, v5, v3

    .line 23
    .line 24
    iput-wide v7, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->index:J

    .line 25
    .line 26
    rem-long/2addr v5, v1

    .line 27
    long-to-int v1, v5

    .line 28
    aput-wide v3, v0, v1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-wide v5, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->index:J

    .line 32
    .line 33
    add-long/2addr v3, v5

    .line 34
    iput-wide v3, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->index:J

    .line 35
    .line 36
    rem-long/2addr v5, v1

    .line 37
    long-to-int v1, v5

    .line 38
    const-wide/16 v2, 0x0

    .line 39
    .line 40
    aput-wide v2, v0, v1

    .line 41
    .line 42
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->vScoreArray:[J

    .line 43
    .line 44
    array-length v1, v0

    .line 45
    move v2, p2

    .line 46
    :goto_1
    if-ge p2, v1, :cond_1

    .line 47
    .line 48
    aget-wide v3, v0, p2

    .line 49
    .line 50
    int-to-long v5, v2

    .line 51
    add-long/2addr v5, v3

    .line 52
    long-to-int v2, v5

    .line 53
    add-int/lit8 p2, p2, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    mul-int/lit8 p2, v2, 0x64

    .line 57
    .line 58
    div-int/lit8 p2, p2, 0x1e

    .line 59
    .line 60
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->audioNcDynamicCallBack:Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;

    .line 61
    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    invoke-interface {p0, p2}, Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;->onAudioDynamic(I)V

    .line 65
    .line 66
    .line 67
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v0, "onAudioVolumeIndication "

    .line 70
    .line 71
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string p1, "/ "

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p1, "/"

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "AudioNcDynamic"

    .line 98
    .line 99
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public setAudioNcDynamicCallBack(Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/immomo/mediacore/audio/AudioNcDynamic;->audioNcDynamicCallBack:Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;

    .line 4
    .line 5
    :cond_0
    return-void
.end method
