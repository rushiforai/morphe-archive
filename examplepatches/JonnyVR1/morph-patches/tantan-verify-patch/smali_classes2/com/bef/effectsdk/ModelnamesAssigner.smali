.class public Lcom/bef/effectsdk/ModelnamesAssigner;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativeSetAssignedModelNames(J[Ljava/lang/String;[Ljava/lang/String;)I
.end method

.method private static native nativeSetAssignedModelNamesWithPriority(J[Ljava/lang/String;[Ljava/lang/String;[I)I
.end method

.method public static setAssignedModelNames(J[Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/bef/effectsdk/ModelnamesAssigner;->nativeSetAssignedModelNames(J[Ljava/lang/String;[Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static setAssignedModelNamesWithPriority(J[Ljava/lang/String;[Ljava/lang/String;[I)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/ModelnamesAssigner;->nativeSetAssignedModelNamesWithPriority(J[Ljava/lang/String;[Ljava/lang/String;[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
