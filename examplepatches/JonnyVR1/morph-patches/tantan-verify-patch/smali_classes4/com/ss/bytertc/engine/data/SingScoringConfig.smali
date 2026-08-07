.class public Lcom/ss/bytertc/engine/data/SingScoringConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public lyricsFilepath:Ljava/lang/String;

.field public midiFilepath:Ljava/lang/String;

.field public mode:Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

.field public sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/SingScoringConfig;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/SingScoringConfig;->mode:Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/data/SingScoringConfig;->lyricsFilepath:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/ss/bytertc/engine/data/SingScoringConfig;->midiFilepath:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
