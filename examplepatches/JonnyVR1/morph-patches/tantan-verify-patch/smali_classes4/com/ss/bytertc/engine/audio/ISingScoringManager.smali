.class public abstract Lcom/ss/bytertc/engine/audio/ISingScoringManager;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract getAverageScore()I
.end method

.method public abstract getLastSentenceScore()I
.end method

.method public abstract getStandardPitchInfo(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/StandardPitchInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTotalScore()I
.end method

.method public abstract initSingScoring(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/ISingScoringEventHandler;)I
.end method

.method public abstract setSingScoringConfig(Lcom/ss/bytertc/engine/data/SingScoringConfig;)I
.end method

.method public abstract startSingScoring(II)I
.end method

.method public abstract stopSingScoring()I
.end method
