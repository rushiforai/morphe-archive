.class public final enum Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

.field public static final enum MIXED_STREAM_AUDIO_CODEC_TYPE_AAC:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;


# instance fields
.field private audioCodecType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "AAC"

    .line 5
    .line 6
    const-string v3, "MIXED_STREAM_AUDIO_CODEC_TYPE_AAC"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->MIXED_STREAM_AUDIO_CODEC_TYPE_AAC:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 12
    .line 13
    filled-new-array {v0}, [Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->$VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->audioCodecType:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->$VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->audioCodecType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
