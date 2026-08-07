.class public Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;
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

.method public static native nativeGetAverageScore(J)I
.end method

.method public static native nativeGetLastSentenceScore(J)I
.end method

.method public static native nativeGetStandardPitchInfo(JLjava/lang/String;)[Lcom/ss/bytertc/engine/data/StandardPitchInfo;
.end method

.method public static native nativeGetTotalScore(J)I
.end method

.method public static native nativeInitSingScoring(JJLjava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;)I
.end method

.method public static native nativeSetSingScoringConfig(JIILjava/lang/String;Ljava/lang/String;)I
.end method

.method public static native nativeStartSingScoring(JII)I
.end method

.method public static native nativeStopSingScoring(J)I
.end method
