.class public final Le/e/a/PlaybackRules;
.super Ljava/lang/Object;
.source "PlaybackRules.java"


# static fields
.field public static final SPEEDS:[F


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    const/16 v0, 0x3b

    new-array v0, v0, [F

    sput-object v0, Le/e/a/PlaybackRules;->SPEEDS:[F

    .line 6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    sget-object v1, Le/e/a/PlaybackRules;->SPEEDS:[F

    array-length v1, v1

    if-ge v0, v1, :cond_19

    sget-object v1, Le/e/a/PlaybackRules;->SPEEDS:[F

    add-int/lit8 v2, v0, 0x2

    int-to-float v2, v2

    const/high16 v3, 0x41a00000    # 20.0f

    div-float/2addr v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .end local v0    # "i":I
    :cond_19
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canRestore(JJJJ)Z
    .registers 13
    .param p0, "position"    # J
    .param p2, "duration"    # J
    .param p4, "current"    # J
    .param p6, "transfer"    # J

    .line 16
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_1e

    const-wide/16 v2, 0x3e8

    cmp-long v4, p4, v2

    if-gez v4, :cond_1e

    cmp-long v2, p6, v0

    if-gtz v2, :cond_1e

    cmp-long v2, p2, v0

    if-lez v2, :cond_1c

    const-wide/16 v0, 0x7d0

    sub-long v0, p2, v0

    cmp-long v2, p0, v0

    if-gez v2, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    return v0
.end method

.method public static checkpoint(JJ)J
    .registers 9
    .param p0, "position"    # J
    .param p2, "duration"    # J

    .line 12
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gez v2, :cond_9

    const-wide/16 v0, -0x1

    return-wide v0

    .line 13
    :cond_9
    cmp-long v2, p2, v0

    if-lez v2, :cond_16

    const-wide/16 v2, 0x7d0

    sub-long v2, p2, v2

    cmp-long v4, p0, v2

    if-ltz v4, :cond_16

    goto :goto_17

    :cond_16
    move-wide v0, p0

    :goto_17
    return-wide v0
.end method

.method public static defaultSpeed(Ljava/lang/String;)F
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .line 8
    :try_start_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .local v0, "result":F
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_29

    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-nez v1, :cond_29

    const v1, 0x3dcccccd    # 0.1f

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_29

    const/high16 v1, 0x40400000    # 3.0f

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_29

    const/high16 v1, 0x41a00000    # 20.0f

    mul-float v2, v0, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2
    :try_end_25
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_25} :catch_28

    int-to-float v2, v2

    div-float/2addr v2, v1

    return v2

    .end local v0    # "result":F
    :catch_28
    move-exception v0

    .line 9
    :cond_29
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public static version(Ljava/lang/Object;)I
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;

    .line 19
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_c

    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    return v0

    .line 20
    :cond_c
    :try_start_c
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_14} :catch_15

    return v0

    :catch_15
    move-exception v0

    .local v0, "ignored":Ljava/lang/RuntimeException;
    const/4 v1, 0x2

    return v1
.end method
