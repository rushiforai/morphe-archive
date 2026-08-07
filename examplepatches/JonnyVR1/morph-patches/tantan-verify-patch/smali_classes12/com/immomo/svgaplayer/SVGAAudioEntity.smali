.class public final Lcom/immomo/svgaplayer/SVGAAudioEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0012\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u001e\u0010\r\u001a\u0004\u0018\u00010\nX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\u0012\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u001e\u0010\u0013\u001a\u0004\u0018\u00010\nX\u0086\u000e\u00a2\u0006\u0010\n\u0002\u0010\u0012\u001a\u0004\u0008\u0014\u0010\u000f\"\u0004\u0008\u0015\u0010\u0011R\u0011\u0010\u0016\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u000cR\u0011\u0010\u0018\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u000cR\u0011\u0010\u001a\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u000c\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAAudioEntity;",
        "",
        "audioItem",
        "Lcom/immomo/svgaplayer/proto/AudioEntity;",
        "(Lcom/immomo/svgaplayer/proto/AudioEntity;)V",
        "audioKey",
        "",
        "getAudioKey",
        "()Ljava/lang/String;",
        "endFrame",
        "",
        "getEndFrame",
        "()I",
        "playID",
        "getPlayID",
        "()Ljava/lang/Integer;",
        "setPlayID",
        "(Ljava/lang/Integer;)V",
        "Ljava/lang/Integer;",
        "soundID",
        "getSoundID",
        "setSoundID",
        "startFrame",
        "getStartFrame",
        "startTime",
        "getStartTime",
        "totalTime",
        "getTotalTime",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private final audioKey:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final endFrame:I

.field private playID:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private soundID:Ljava/lang/Integer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final startFrame:I

.field private final startTime:I

.field private final totalTime:I


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/proto/AudioEntity;)V
    .locals 2
    .param p1    # Lcom/immomo/svgaplayer/proto/AudioEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->audioKey:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->audioKey:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->startFrame:Ljava/lang/Integer;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v1

    .line 22
    :goto_0
    iput v0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->startFrame:I

    .line 23
    .line 24
    iget-object v0, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->endFrame:Ljava/lang/Integer;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move v0, v1

    .line 34
    :goto_1
    iput v0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->endFrame:I

    .line 35
    .line 36
    iget-object v0, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->startTime:Ljava/lang/Integer;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move v0, v1

    .line 46
    :goto_2
    iput v0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->startTime:I

    .line 47
    .line 48
    iget-object p1, p1, Lcom/immomo/svgaplayer/proto/AudioEntity;->totalTime:Ljava/lang/Integer;

    .line 49
    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :cond_3
    iput v1, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->totalTime:I

    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public final getAudioKey()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->audioKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getEndFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->endFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final getPlayID()Ljava/lang/Integer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->playID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSoundID()Ljava/lang/Integer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->soundID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getStartFrame()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->startFrame:I

    .line 2
    .line 3
    return p0
.end method

.method public final getStartTime()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->startTime:I

    .line 2
    .line 3
    return p0
.end method

.method public final getTotalTime()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->totalTime:I

    .line 2
    .line 3
    return p0
.end method

.method public final setPlayID(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->playID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public final setSoundID(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAAudioEntity;->soundID:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method
