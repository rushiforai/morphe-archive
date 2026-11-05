.class public final Le/e/a/BikeRunModel;
.super Ljava/lang/Object;
.source "BikeRunModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/BikeRunModel$Hazard;,
        Le/e/a/BikeRunModel$Profile;
    }
.end annotation


# static fields
.field public static final EDGE_GRACE:F = 0.1f

.field public static final GRAVITY:F = 1600.0f

.field public static final JUMP:F = -650.0f

.field public static final OBSTACLE_PATTERNS:I = 0x30

.field public static final RIDER_X:F = 120.0f

.field private static final SECTION:F = 9600.0f

.field public static final START_SPEED:F = 440.0f

.field public static final TERRAIN_PATTERNS:I = 0x48

.field public static final VERSION:Ljava/lang/String; = "1.3.1"


# instance fields
.field public distance:F

.field private falling:Z

.field private gapTime:F

.field public final hazards:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/BikeRunModel$Hazard;",
            ">;"
        }
    .end annotation
.end field

.field private jumpBuffer:F

.field private jumpsUsed:I

.field public over:Z

.field private final patternBag:[I

.field private patternIndex:I

.field private final profiles:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Long;",
            "Le/e/a/BikeRunModel$Profile;",
            ">;"
        }
    .end annotation
.end field

.field private final random:Ljava/util/Random;

.field public spawn:F

.field public started:Z

.field private terrainSeed:J

.field public velocity:F

.field private waves:I

.field public y:F


# direct methods
.method public constructor <init>(J)V
    .registers 7

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Le/e/a/BikeRunModel$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x8

    invoke-direct {v0, p0, v3, v1, v2}, Le/e/a/BikeRunModel$1;-><init>(Le/e/a/BikeRunModel;IFZ)V

    iput-object v0, p0, Le/e/a/BikeRunModel;->profiles:Ljava/util/LinkedHashMap;

    const/16 v0, 0x30

    .line 41
    new-array v0, v0, [I

    iput-object v0, p0, Le/e/a/BikeRunModel;->patternBag:[I

    .line 51
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0, p1, p2}, Ljava/util/Random;-><init>(J)V

    iput-object v0, p0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    const/4 p1, 0x0

    .line 53
    :goto_24
    iget-object p2, p0, Le/e/a/BikeRunModel;->patternBag:[I

    array-length v0, p2

    if-lt p1, v0, :cond_2d

    .line 57
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->reset()V

    return-void

    .line 54
    :cond_2d
    aput p1, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_24
.end method

.method private isGapAt(FF)Z
    .registers 9

    .line 319
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_b

    return v1

    .line 320
    :cond_b
    iget-object v0, p0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_19

    const/4 p1, 0x0

    return p1

    :cond_19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/BikeRunModel$Hazard;

    .line 321
    iget v3, v2, Le/e/a/BikeRunModel$Hazard;->x:F

    sub-float/2addr v3, p2

    .line 322
    iget-boolean v4, v2, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v4, :cond_11

    const/high16 v4, 0x41600000    # 14.0f

    add-float v5, v3, v4

    cmpl-float v5, p1, v5

    if-lez v5, :cond_11

    iget v2, v2, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v3, v2

    sub-float/2addr v3, v4

    cmpg-float v2, p1, v3

    if-gez v2, :cond_11

    return v1
.end method

.method private nextPattern()I
    .registers 6

    .line 328
    iget v0, p0, Le/e/a/BikeRunModel;->patternIndex:I

    iget-object v1, p0, Le/e/a/BikeRunModel;->patternBag:[I

    array-length v2, v1

    if-lt v0, v2, :cond_25

    .line 329
    array-length v0, v1

    add-int/lit8 v0, v0, -0x1

    :goto_a
    if-gtz v0, :cond_10

    const/4 v0, 0x0

    .line 337
    iput v0, p0, Le/e/a/BikeRunModel;->patternIndex:I

    goto :goto_25

    .line 331
    :cond_10
    iget-object v1, p0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    .line 332
    iget-object v2, p0, Le/e/a/BikeRunModel;->patternBag:[I

    aget v3, v2, v0

    .line 333
    aget v4, v2, v1

    aput v4, v2, v0

    .line 334
    aput v3, v2, v1

    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    .line 339
    :cond_25
    :goto_25
    iget-object v0, p0, Le/e/a/BikeRunModel;->patternBag:[I

    iget v1, p0, Le/e/a/BikeRunModel;->patternIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Le/e/a/BikeRunModel;->patternIndex:I

    aget v0, v0, v1

    return v0
.end method

.method private sectionMood(J)I
    .registers 7

    .line 134
    iget-wide v0, p0, Le/e/a/BikeRunModel;->terrainSeed:J

    const-wide/16 v2, 0x3

    and-long/2addr v0, v2

    add-long/2addr p1, v0

    and-long/2addr p1, v2

    long-to-int p2, p1

    return p2
.end method

.method public static title()Ljava/lang/String;
    .registers 2

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u81ea\u8ee2\u8eca\u30e9\u30f3"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " v1.3.1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public baseSpeed()F
    .registers 9

    .line 139
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-double v0, v0

    neg-double v0, v0

    const-wide v2, 0x408c200000000000L    # 900.0

    div-double v2, v0, v2

    .line 140
    invoke-static {v2, v3}, Ljava/lang/Math;->exp(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    sub-double v2, v4, v2

    const-wide/high16 v6, 0x405e000000000000L    # 120.0

    mul-double v2, v2, v6

    const-wide v6, 0x407b800000000000L    # 440.0

    add-double/2addr v2, v6

    const-wide v6, 0x40d1940000000000L    # 18000.0

    div-double/2addr v0, v6

    .line 141
    invoke-static {v0, v1}, Ljava/lang/Math;->exp(D)D

    move-result-wide v0

    sub-double/2addr v4, v0

    const-wide v0, 0x406b800000000000L    # 220.0

    mul-double v4, v4, v0

    add-double/2addr v2, v4

    double-to-float v0, v2

    return v0
.end method

.method public difficulty()F
    .registers 3

    .line 128
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const v1, 0x45bb8000    # 6000.0f

    add-float/2addr v1, v0

    div-float/2addr v0, v1

    return v0
.end method

.method public flatSpan(FF)Z
    .registers 8

    .line 92
    invoke-virtual {p0, p1}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3f

    invoke-virtual {p0, p2}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v0

    if-eqz v0, :cond_e

    goto :goto_3f

    .line 93
    :cond_e
    invoke-virtual {p0, p1}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result v0

    const/high16 v2, 0x40800000    # 4.0f

    :cond_14
    add-float/2addr p1, v2

    const v3, 0x3c23d70a    # 0.01f

    cmpg-float v4, p1, p2

    if-ltz v4, :cond_2c

    .line 101
    invoke-virtual {p0, p2}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result p1

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpg-float p1, p1, v3

    if-gtz p1, :cond_2b

    const/4 p1, 0x1

    return p1

    :cond_2b
    return v1

    .line 96
    :cond_2c
    invoke-virtual {p0, p1}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v4

    if-nez v4, :cond_3f

    invoke-virtual {p0, p1}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result v4

    sub-float/2addr v4, v0

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v3, v4, v3

    if-lez v3, :cond_14

    :cond_3f
    :goto_3f
    return v1
.end method

.method public groundAt(F)F
    .registers 3

    .line 118
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result p1

    return p1
.end method

.method public mood()I
    .registers 3

    .line 136
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v1, 0x46160000    # 9600.0f

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-long v0, v0

    invoke-direct {p0, v0, v1}, Le/e/a/BikeRunModel;->sectionMood(J)I

    move-result v0

    return v0
.end method

.method public placement(F)F
    .registers 7

    .line 105
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->speed()F

    move-result v0

    const v1, 0x3dcccccd    # 0.1f

    mul-float v0, v0, v1

    const/high16 v2, 0x43700000    # 240.0f

    add-float/2addr v0, v2

    .line 106
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->speed()F

    move-result v2

    mul-float v2, v2, v1

    const/high16 v1, 0x43200000    # 160.0f

    add-float/2addr v2, v1

    const/high16 v1, 0x443e0000    # 760.0f

    :goto_17
    const v3, 0x4695b000    # 19160.0f

    cmpg-float v3, v1, v3

    if-ltz v3, :cond_21

    const/high16 p1, 0x7fc00000    # Float.NaN

    return p1

    .line 109
    :cond_21
    iget v3, p0, Le/e/a/BikeRunModel;->distance:F

    add-float v4, v3, v1

    sub-float/2addr v4, v0

    add-float/2addr v3, v1

    add-float/2addr v3, p1

    add-float/2addr v3, v2

    invoke-virtual {p0, v4, v3}, Le/e/a/BikeRunModel;->flatSpan(FF)Z

    move-result v3

    if-eqz v3, :cond_30

    return v1

    :cond_30
    const/high16 v3, 0x41a00000    # 20.0f

    add-float/2addr v1, v3

    goto :goto_17
.end method

.method public reset()V
    .registers 3

    .line 61
    iget-object v0, p0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/BikeRunModel;->terrainSeed:J

    .line 62
    iget-object v0, p0, Le/e/a/BikeRunModel;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    .line 63
    iget-object v0, p0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    .line 64
    iput v0, p0, Le/e/a/BikeRunModel;->gapTime:F

    .line 65
    iput v0, p0, Le/e/a/BikeRunModel;->distance:F

    .line 66
    iput v0, p0, Le/e/a/BikeRunModel;->velocity:F

    .line 67
    iput v0, p0, Le/e/a/BikeRunModel;->y:F

    const/high16 v1, 0x442f0000    # 700.0f

    .line 68
    iput v1, p0, Le/e/a/BikeRunModel;->spawn:F

    const/4 v1, 0x0

    .line 69
    iput v1, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    .line 70
    iput-boolean v1, p0, Le/e/a/BikeRunModel;->falling:Z

    .line 71
    iput-boolean v1, p0, Le/e/a/BikeRunModel;->over:Z

    .line 72
    iput-boolean v1, p0, Le/e/a/BikeRunModel;->started:Z

    .line 73
    iput v0, p0, Le/e/a/BikeRunModel;->jumpBuffer:F

    .line 74
    iput v1, p0, Le/e/a/BikeRunModel;->waves:I

    .line 75
    iget-object v0, p0, Le/e/a/BikeRunModel;->patternBag:[I

    array-length v0, v0

    iput v0, p0, Le/e/a/BikeRunModel;->patternIndex:I

    return-void
.end method

.method public score()I
    .registers 3

    .line 343
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public slopeAt(F)F
    .registers 4

    const/high16 v0, 0x40800000    # 4.0f

    add-float v1, p1, v0

    .line 122
    invoke-virtual {p0, v1}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v1

    sub-float/2addr p1, v0

    invoke-virtual {p0, p1}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result p1

    sub-float/2addr v1, p1

    .line 123
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v0, 0x41000000    # 8.0f

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1a

    const/4 p1, 0x0

    goto :goto_1c

    :cond_1a
    div-float p1, v1, v0

    :goto_1c
    return p1
.end method

.method public speed()F
    .registers 10

    .line 144
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->difficulty()F

    move-result v0

    .line 145
    iget v1, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v2, 0x46160000    # 9600.0f

    div-float/2addr v1, v2

    float-to-double v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-long v3, v3

    .line 146
    iget v1, p0, Le/e/a/BikeRunModel;->distance:F

    long-to-float v5, v3

    mul-float v5, v5, v2

    sub-float/2addr v1, v5

    const/high16 v5, 0x44610000    # 900.0f

    div-float v6, v1, v5

    sub-float/2addr v2, v1

    div-float/2addr v2, v5

    .line 148
    invoke-static {v6, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 149
    invoke-direct {p0, v3, v4}, Le/e/a/BikeRunModel;->sectionMood(J)I

    move-result v3

    if-nez v3, :cond_2e

    const/high16 v3, 0x41c00000    # 24.0f

    goto :goto_41

    :cond_2e
    const/4 v4, 0x1

    if-ne v3, v4, :cond_34

    const/high16 v3, -0x3e100000    # -30.0f

    goto :goto_41

    :cond_34
    const/4 v4, 0x2

    if-ne v3, v4, :cond_3a

    const/high16 v3, -0x3ee00000    # -10.0f

    goto :goto_41

    :cond_3a
    const/high16 v3, 0x41c80000    # 25.0f

    mul-float v3, v3, v0

    const/high16 v4, -0x3dc00000    # -48.0f

    add-float/2addr v3, v4

    .line 152
    :goto_41
    iget v4, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v5, 0x42f00000    # 120.0f

    add-float/2addr v4, v5

    invoke-virtual {p0, v4}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v4

    if-nez v4, :cond_5b

    invoke-virtual {p0, v5}, Le/e/a/BikeRunModel;->slopeAt(F)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v5, 0x3df5c28f    # 0.12f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_61

    :cond_5b
    const/high16 v4, -0x3e200000    # -28.0f

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 153
    :cond_61
    iget v4, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v5, 0x45160000    # 2400.0f

    div-float/2addr v4, v5

    iget-wide v5, p0, Le/e/a/BikeRunModel;->terrainSeed:J

    const-wide/16 v7, 0x7

    and-long/2addr v5, v7

    long-to-float v5, v5

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    const/high16 v5, 0x41600000    # 14.0f

    mul-float v0, v0, v5

    const/high16 v5, 0x41200000    # 10.0f

    add-float/2addr v0, v5

    mul-float v4, v4, v0

    .line 154
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->baseSpeed()F

    move-result v0

    mul-float v1, v1, v3

    add-float/2addr v0, v1

    iget v1, p0, Le/e/a/BikeRunModel;->distance:F

    const v3, 0x453b8000    # 3000.0f

    div-float/2addr v1, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    mul-float v4, v4, v1

    add-float/2addr v0, v4

    return v0
.end method

.method public step(F)V
    .registers 30

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 176
    iget-boolean v2, v0, Le/e/a/BikeRunModel;->started:Z

    if-eqz v2, :cond_366

    iget-boolean v2, v0, Le/e/a/BikeRunModel;->over:Z

    if-nez v2, :cond_366

    const/4 v2, 0x0

    cmpg-float v3, v1, v2

    if-gtz v3, :cond_13

    goto/16 :goto_366

    :cond_13
    const v3, 0x3d0f5c29    # 0.035f

    .line 179
    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 180
    iget v3, v0, Le/e/a/BikeRunModel;->jumpBuffer:F

    sub-float/2addr v3, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iput v3, v0, Le/e/a/BikeRunModel;->jumpBuffer:F

    const/high16 v3, 0x42f00000    # 120.0f

    .line 181
    invoke-virtual {v0, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v4

    .line 182
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->speed()F

    move-result v5

    mul-float v5, v5, v1

    .line 183
    iget v6, v0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v6, v5

    iput v6, v0, Le/e/a/BikeRunModel;->distance:F

    .line 184
    iget v6, v0, Le/e/a/BikeRunModel;->spawn:F

    sub-float/2addr v6, v5

    iput v6, v0, Le/e/a/BikeRunModel;->spawn:F

    .line 185
    invoke-virtual {v0, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v6

    sub-float/2addr v4, v6

    const/high16 v6, 0x41a00000    # 20.0f

    const/high16 v7, 0x41200000    # 10.0f

    const/4 v8, 0x1

    cmpl-float v6, v4, v6

    if-lez v6, :cond_52

    .line 186
    iget v6, v0, Le/e/a/BikeRunModel;->y:F

    neg-float v9, v4

    add-float/2addr v9, v7

    cmpl-float v6, v6, v9

    if-lez v6, :cond_52

    .line 187
    iput-boolean v8, v0, Le/e/a/BikeRunModel;->over:Z

    return-void

    .line 190
    :cond_52
    invoke-direct {v0, v3, v5}, Le/e/a/BikeRunModel;->isGapAt(FF)Z

    move-result v6

    xor-int/2addr v6, v8

    .line 191
    iget-boolean v9, v0, Le/e/a/BikeRunModel;->falling:Z

    const/4 v10, 0x0

    if-nez v9, :cond_70

    iget v11, v0, Le/e/a/BikeRunModel;->y:F

    cmpg-float v11, v11, v2

    if-ltz v11, :cond_70

    iget v11, v0, Le/e/a/BikeRunModel;->velocity:F

    cmpg-float v11, v11, v2

    if-ltz v11, :cond_70

    const/high16 v11, -0x3e600000    # -20.0f

    cmpg-float v11, v4, v11

    if-ltz v11, :cond_70

    if-nez v6, :cond_9b

    .line 192
    :cond_70
    iget v11, v0, Le/e/a/BikeRunModel;->y:F

    add-float/2addr v11, v4

    .line 193
    iget v4, v0, Le/e/a/BikeRunModel;->velocity:F

    const/high16 v12, 0x44c80000    # 1600.0f

    mul-float v12, v12, v1

    add-float/2addr v4, v12

    iput v4, v0, Le/e/a/BikeRunModel;->velocity:F

    mul-float v12, v4, v1

    add-float/2addr v11, v12

    .line 194
    iput v11, v0, Le/e/a/BikeRunModel;->y:F

    if-eqz v6, :cond_9b

    cmpl-float v6, v11, v2

    if-ltz v6, :cond_9b

    cmpl-float v4, v4, v2

    if-ltz v4, :cond_9b

    if-eqz v9, :cond_95

    const/high16 v4, 0x41800000    # 16.0f

    cmpl-float v4, v11, v4

    if-lez v4, :cond_95

    .line 197
    iput-boolean v8, v0, Le/e/a/BikeRunModel;->over:Z

    .line 198
    :cond_95
    iput v2, v0, Le/e/a/BikeRunModel;->y:F

    .line 199
    iput v2, v0, Le/e/a/BikeRunModel;->velocity:F

    .line 200
    iput-boolean v10, v0, Le/e/a/BikeRunModel;->falling:Z

    .line 203
    :cond_9b
    iget v4, v0, Le/e/a/BikeRunModel;->spawn:F

    cmpg-float v4, v4, v2

    if-gtz v4, :cond_27b

    .line 206
    invoke-direct/range {p0 .. p0}, Le/e/a/BikeRunModel;->nextPattern()I

    move-result v4

    .line 207
    div-int/lit8 v6, v4, 0x8

    .line 208
    rem-int/lit8 v4, v4, 0x8

    .line 209
    iget v9, v0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v11, 0x44160000    # 600.0f

    cmpg-float v9, v9, v11

    if-gez v9, :cond_b5

    .line 210
    rem-int/lit8 v6, v6, 0x3

    .line 211
    rem-int/lit8 v4, v4, 0x2

    .line 213
    :cond_b5
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->speed()F

    move-result v9

    .line 214
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->difficulty()F

    move-result v11

    .line 216
    iget v12, v0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v13, 0x447a0000    # 1000.0f

    const/4 v14, 0x2

    cmpl-float v12, v12, v13

    if-ltz v12, :cond_dc

    iget-object v12, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v12}, Ljava/util/Random;->nextFloat()F

    move-result v12

    const v15, 0x3f2b851f    # 0.67f

    mul-float v15, v15, v11

    const v16, 0x3e8f5c29    # 0.28f

    add-float v15, v15, v16

    cmpg-float v12, v12, v15

    if-gez v12, :cond_dc

    const/4 v12, 0x2

    goto :goto_dd

    :cond_dc
    const/4 v12, 0x1

    .line 217
    :goto_dd
    iget v15, v0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v16, 0x45fa0000    # 8000.0f

    const v17, 0x3f333333    # 0.7f

    const/4 v7, 0x3

    cmpl-float v15, v15, v16

    if-ltz v15, :cond_ff

    rem-int/lit8 v15, v4, 0x3

    if-ne v15, v14, :cond_ff

    iget-object v15, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v15}, Ljava/util/Random;->nextFloat()F

    move-result v15

    const v16, 0x3e3851ec    # 0.18f

    mul-float v18, v11, v17

    add-float v18, v18, v16

    cmpg-float v15, v15, v18

    if-gez v15, :cond_ff

    const/4 v12, 0x3

    .line 218
    :cond_ff
    iget v15, v0, Le/e/a/BikeRunModel;->distance:F

    const v16, 0x48127c00    # 150000.0f

    const/4 v10, 0x5

    const/4 v2, 0x4

    cmpl-float v15, v15, v16

    if-ltz v15, :cond_11f

    if-ne v6, v10, :cond_11f

    const/4 v15, 0x6

    if-lt v4, v15, :cond_11f

    iget-object v15, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v15}, Ljava/util/Random;->nextFloat()F

    move-result v15

    const v16, 0x3f19999a    # 0.6f

    mul-float v16, v16, v11

    cmpg-float v15, v15, v16

    if-gez v15, :cond_11f

    const/4 v12, 0x4

    .line 219
    :cond_11f
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->mood()I

    move-result v15

    if-ne v15, v8, :cond_129

    invoke-static {v12, v14}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 220
    :cond_129
    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->mood()I

    move-result v15

    if-ne v15, v7, :cond_143

    iget-object v15, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v15}, Ljava/util/Random;->nextFloat()F

    move-result v15

    const v16, 0x3f0ccccd    # 0.55f

    mul-float v16, v16, v11

    const/high16 v19, 0x3f800000    # 1.0f

    sub-float v19, v19, v16

    cmpg-float v15, v15, v19

    if-gez v15, :cond_143

    const/4 v12, 0x1

    :cond_143
    if-ne v6, v2, :cond_149

    .line 222
    invoke-static {v14, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    :cond_149
    if-ne v6, v10, :cond_15b

    .line 224
    iget v15, v0, Le/e/a/BikeRunModel;->distance:F

    cmpl-float v13, v15, v13

    if-ltz v13, :cond_15b

    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->mood()I

    move-result v13

    if-eq v13, v7, :cond_15b

    .line 225
    invoke-static {v14, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 227
    :cond_15b
    new-array v13, v12, [F

    .line 228
    new-array v15, v12, [F

    .line 229
    new-array v3, v12, [F

    .line 230
    new-array v14, v12, [Z

    .line 231
    new-array v10, v12, [Z

    const/4 v2, 0x0

    const/4 v7, 0x0

    :goto_167
    if-lt v7, v12, :cond_1f1

    .line 250
    invoke-virtual {v0, v2}, Le/e/a/BikeRunModel;->placement(F)F

    move-result v20

    .line 251
    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->isNaN(F)Z

    move-result v4

    if-eqz v4, :cond_178

    const/high16 v1, 0x42c80000    # 100.0f

    .line 252
    iput v1, v0, Le/e/a/BikeRunModel;->spawn:F

    return-void

    :cond_178
    const/4 v4, 0x0

    :goto_179
    if-lt v4, v12, :cond_1d4

    .line 260
    iget v3, v0, Le/e/a/BikeRunModel;->waves:I

    add-int/2addr v3, v8

    iput v3, v0, Le/e/a/BikeRunModel;->waves:I

    .line 261
    iget-object v3, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    const/16 v4, 0xfa

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/lit16 v3, v3, 0x1b8

    int-to-float v3, v3

    const v4, 0x3ee66666    # 0.45f

    mul-float v4, v4, v11

    const/high16 v6, 0x3fc00000    # 1.5f

    sub-float/2addr v6, v4

    iget-object v4, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v4}, Ljava/util/Random;->nextFloat()F

    move-result v4

    const v7, 0x3eb33333    # 0.35f

    mul-float v4, v4, v7

    add-float/2addr v6, v4

    mul-float v6, v6, v9

    add-float/2addr v2, v6

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 262
    iget v3, v0, Le/e/a/BikeRunModel;->waves:I

    const/4 v4, 0x4

    rem-int/2addr v3, v4

    if-eqz v3, :cond_1b3

    invoke-virtual/range {p0 .. p0}, Le/e/a/BikeRunModel;->mood()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_1ca

    :cond_1b3
    const v3, 0x3ecccccd    # 0.4f

    mul-float v11, v11, v3

    const v3, 0x3f666666    # 0.9f

    sub-float/2addr v3, v11

    .line 263
    iget-object v4, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v4}, Ljava/util/Random;->nextFloat()F

    move-result v4

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float v4, v4, v6

    add-float/2addr v3, v4

    mul-float v9, v9, v3

    add-float/2addr v2, v9

    :cond_1ca
    const/high16 v3, 0x443e0000    # 760.0f

    sub-float v20, v20, v3

    add-float v2, v20, v2

    .line 265
    iput v2, v0, Le/e/a/BikeRunModel;->spawn:F

    goto/16 :goto_27b

    .line 257
    :cond_1d4
    iget-object v6, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    new-instance v7, Le/e/a/BikeRunModel$Hazard;

    add-float v17, v20, v5

    aget v19, v3, v4

    add-float v23, v17, v19

    aget v24, v13, v4

    aget v25, v15, v4

    aget-boolean v26, v14, v4

    aget-boolean v27, v10, v4

    move-object/from16 v22, v7

    invoke-direct/range {v22 .. v27}, Le/e/a/BikeRunModel$Hazard;-><init>(FFFZZ)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_179

    :cond_1f1
    const/4 v8, 0x5

    if-ne v6, v8, :cond_1fd

    add-int v20, v4, v7

    .line 237
    rem-int/lit8 v20, v20, 0x5

    move/from16 v23, v6

    move/from16 v8, v20

    goto :goto_200

    :cond_1fd
    move v8, v6

    move/from16 v23, v8

    :goto_200
    const/4 v6, 0x1

    if-eq v8, v6, :cond_208

    const/4 v6, 0x4

    if-eq v8, v6, :cond_208

    const/4 v6, 0x0

    goto :goto_209

    :cond_208
    const/4 v6, 0x1

    .line 239
    :goto_209
    aput-boolean v6, v14, v7

    const/4 v6, 0x2

    if-ne v8, v6, :cond_211

    const/16 v19, 0x1

    goto :goto_213

    :cond_211
    const/16 v19, 0x0

    .line 240
    :goto_213
    aput-boolean v19, v10, v7

    .line 241
    aget-boolean v24, v14, v7

    if-eqz v24, :cond_22d

    const/4 v6, 0x4

    if-ne v8, v6, :cond_227

    int-to-float v6, v4

    const v26, 0x3ccccccd    # 0.025f

    mul-float v6, v6, v26

    add-float v6, v6, v17

    mul-float v6, v6, v9

    goto :goto_239

    :cond_227
    mul-int/lit8 v6, v4, 0x9

    add-int/lit8 v6, v6, 0x5f

    :goto_22b
    int-to-float v6, v6

    goto :goto_239

    :cond_22d
    if-eqz v19, :cond_234

    mul-int/lit8 v6, v4, 0xc

    add-int/lit8 v6, v6, 0x37

    goto :goto_22b

    :cond_234
    mul-int/lit8 v6, v4, 0x4

    add-int/lit8 v6, v6, 0x20

    goto :goto_22b

    :goto_239
    aput v6, v13, v7

    const/4 v6, 0x3

    if-eqz v24, :cond_240

    const/4 v8, 0x0

    goto :goto_250

    :cond_240
    if-ne v8, v6, :cond_247

    mul-int/lit8 v8, v4, 0x5

    add-int/lit16 v8, v8, 0x82

    goto :goto_250

    :cond_247
    if-eqz v19, :cond_24c

    const/16 v8, 0x1e

    goto :goto_250

    :cond_24c
    mul-int/lit8 v8, v4, 0x4

    add-int/lit8 v8, v8, 0x19

    :goto_250
    int-to-float v8, v8

    .line 242
    aput v8, v15, v7

    .line 243
    aput v2, v3, v7

    .line 244
    aget v8, v13, v7

    add-float/2addr v2, v8

    add-int/lit8 v8, v12, -0x1

    if-ge v7, v8, :cond_274

    const v8, 0x3e6147ae    # 0.22f

    mul-float v8, v8, v11

    const v19, 0x3f9c28f6    # 1.22f

    sub-float v19, v19, v8

    .line 246
    div-int/lit8 v8, v4, 0x3

    int-to-float v8, v8

    const v21, 0x3dcccccd    # 0.1f

    mul-float v8, v8, v21

    add-float v19, v19, v8

    mul-float v19, v19, v9

    add-float v2, v2, v19

    :cond_274
    add-int/lit8 v7, v7, 0x1

    move/from16 v6, v23

    const/4 v8, 0x1

    goto/16 :goto_167

    .line 267
    :cond_27b
    :goto_27b
    iget v2, v0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v3, 0x42f00000    # 120.0f

    add-float/2addr v2, v3

    invoke-virtual {v0, v2}, Le/e/a/BikeRunModel;->terrainGapAt(F)Z

    move-result v2

    .line 268
    iget-object v3, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    move v6, v2

    :goto_28d
    if-gez v3, :cond_2eb

    if-eqz v6, :cond_2a0

    .line 287
    iget v2, v0, Le/e/a/BikeRunModel;->y:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_2a0

    iget v2, v0, Le/e/a/BikeRunModel;->velocity:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_2a0

    .line 288
    iput-boolean v4, v0, Le/e/a/BikeRunModel;->falling:Z

    :cond_2a0
    if-eqz v6, :cond_2a6

    .line 290
    iget v2, v0, Le/e/a/BikeRunModel;->gapTime:F

    add-float/2addr v1, v2

    goto :goto_2a7

    :cond_2a6
    const/4 v1, 0x0

    :goto_2a7
    iput v1, v0, Le/e/a/BikeRunModel;->gapTime:F

    if-nez v6, :cond_2cf

    .line 291
    iget-boolean v1, v0, Le/e/a/BikeRunModel;->falling:Z

    if-nez v1, :cond_2cf

    iget v1, v0, Le/e/a/BikeRunModel;->y:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_2cf

    iget v1, v0, Le/e/a/BikeRunModel;->velocity:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_2cf

    const/4 v1, 0x0

    .line 292
    iput v1, v0, Le/e/a/BikeRunModel;->jumpsUsed:I

    .line 293
    iget v1, v0, Le/e/a/BikeRunModel;->jumpBuffer:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2cf

    const v1, -0x3bdd8000    # -650.0f

    .line 294
    iput v1, v0, Le/e/a/BikeRunModel;->velocity:F

    const/4 v1, 0x1

    .line 295
    iput v1, v0, Le/e/a/BikeRunModel;->jumpsUsed:I

    .line 296
    iput v2, v0, Le/e/a/BikeRunModel;->jumpBuffer:F

    .line 299
    :cond_2cf
    iget-boolean v1, v0, Le/e/a/BikeRunModel;->falling:Z

    if-eqz v1, :cond_2de

    iget v2, v0, Le/e/a/BikeRunModel;->y:F

    const/high16 v3, 0x435c0000    # 220.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2de

    const/4 v2, 0x1

    .line 300
    iput-boolean v2, v0, Le/e/a/BikeRunModel;->over:Z

    :cond_2de
    if-eqz v1, :cond_2ea

    .line 302
    iget v1, v0, Le/e/a/BikeRunModel;->y:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2ea

    const/4 v2, 0x0

    .line 303
    iput-boolean v2, v0, Le/e/a/BikeRunModel;->falling:Z

    :cond_2ea
    return-void

    :cond_2eb
    const/4 v2, 0x0

    .line 270
    iget-object v4, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/BikeRunModel$Hazard;

    .line 271
    iget v7, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    sub-float/2addr v7, v5

    iput v7, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    .line 272
    iget-boolean v7, v4, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v7, :cond_317

    .line 273
    iget v7, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    const/high16 v8, 0x41600000    # 14.0f

    add-float/2addr v7, v8

    const/high16 v9, 0x42f00000    # 120.0f

    cmpl-float v7, v9, v7

    if-lez v7, :cond_313

    iget v7, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v10, v4, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v7, v10

    sub-float/2addr v7, v8

    cmpg-float v7, v9, v7

    if-gez v7, :cond_313

    const/4 v6, 0x1

    :cond_313
    const/4 v7, 0x1

    const/high16 v10, 0x41200000    # 10.0f

    goto :goto_352

    :cond_317
    const/high16 v9, 0x42f00000    # 120.0f

    .line 277
    iget v7, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v8, v4, Le/e/a/BikeRunModel$Hazard;->width:F

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v8, v10

    add-float/2addr v7, v8

    invoke-virtual {v0, v7}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v7

    invoke-virtual {v0, v9}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v8

    sub-float/2addr v7, v8

    .line 278
    iget v8, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    const/high16 v10, 0x41000000    # 8.0f

    add-float/2addr v8, v10

    const/high16 v11, 0x43060000    # 134.0f

    cmpl-float v8, v11, v8

    if-lez v8, :cond_313

    iget v8, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v11, v4, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v8, v11

    sub-float/2addr v8, v10

    const/high16 v10, 0x42d40000    # 106.0f

    cmpg-float v8, v10, v8

    if-gez v8, :cond_313

    iget v8, v0, Le/e/a/BikeRunModel;->y:F

    iget v10, v4, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float/2addr v7, v10

    const/high16 v10, 0x41200000    # 10.0f

    add-float/2addr v7, v10

    cmpl-float v7, v8, v7

    if-lez v7, :cond_351

    const/4 v7, 0x1

    .line 279
    iput-boolean v7, v0, Le/e/a/BikeRunModel;->over:Z

    goto :goto_352

    :cond_351
    const/4 v7, 0x1

    .line 282
    :goto_352
    iget v8, v4, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v4, v4, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v8, v4

    const/4 v4, 0x0

    cmpg-float v8, v8, v4

    if-gez v8, :cond_361

    .line 283
    iget-object v8, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_361
    add-int/lit8 v3, v3, -0x1

    const/4 v4, 0x1

    goto/16 :goto_28d

    :cond_366
    :goto_366
    return-void
.end method

.method public tap()V
    .registers 4

    .line 158
    iget-boolean v0, p0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_7

    .line 159
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->reset()V

    :cond_7
    const/4 v0, 0x1

    .line 161
    iput-boolean v0, p0, Le/e/a/BikeRunModel;->started:Z

    .line 162
    iget v1, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    const/4 v2, 0x2

    if-ge v1, v2, :cond_1d

    const v2, -0x3bdd8000    # -650.0f

    .line 163
    iput v2, p0, Le/e/a/BikeRunModel;->velocity:F

    const/4 v2, 0x0

    .line 164
    iput v2, p0, Le/e/a/BikeRunModel;->gapTime:F

    add-int/2addr v1, v0

    .line 165
    iput v1, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    .line 166
    iput v2, p0, Le/e/a/BikeRunModel;->jumpBuffer:F

    goto :goto_22

    :cond_1d
    const v0, 0x3de147ae    # 0.11f

    .line 168
    iput v0, p0, Le/e/a/BikeRunModel;->jumpBuffer:F

    :goto_22
    return-void
.end method

.method public terrain(F)F
    .registers 8

    const/high16 v0, 0x44480000    # 800.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_8

    const/4 p1, 0x0

    return p1

    :cond_8
    const/high16 v0, 0x46160000    # 9600.0f

    div-float v1, p1, v0

    float-to-double v1, v1

    .line 82
    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-long v1, v1

    .line 83
    iget-object v3, p0, Le/e/a/BikeRunModel;->profiles:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/BikeRunModel$Profile;

    if-nez v3, :cond_30

    .line 85
    new-instance v3, Le/e/a/BikeRunModel$Profile;

    iget-wide v4, p0, Le/e/a/BikeRunModel;->terrainSeed:J

    invoke-direct {v3, v4, v5, v1, v2}, Le/e/a/BikeRunModel$Profile;-><init>(JJ)V

    .line 86
    iget-object v4, p0, Le/e/a/BikeRunModel;->profiles:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_30
    long-to-float v1, v1

    mul-float v1, v1, v0

    sub-float/2addr p1, v1

    .line 88
    invoke-virtual {v3, p1}, Le/e/a/BikeRunModel$Profile;->at(F)F

    move-result p1

    return p1
.end method

.method public terrainGapAt(F)Z
    .registers 8

    const/high16 v0, 0x44480000    # 800.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_8

    const/4 p1, 0x0

    return p1

    :cond_8
    const/high16 v0, 0x46160000    # 9600.0f

    div-float v1, p1, v0

    float-to-double v1, v1

    .line 309
    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-long v1, v1

    .line 310
    iget-object v3, p0, Le/e/a/BikeRunModel;->profiles:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/BikeRunModel$Profile;

    if-nez v3, :cond_30

    .line 312
    new-instance v3, Le/e/a/BikeRunModel$Profile;

    iget-wide v4, p0, Le/e/a/BikeRunModel;->terrainSeed:J

    invoke-direct {v3, v4, v5, v1, v2}, Le/e/a/BikeRunModel$Profile;-><init>(JJ)V

    .line 313
    iget-object v4, p0, Le/e/a/BikeRunModel;->profiles:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_30
    long-to-float v1, v1

    mul-float v1, v1, v0

    sub-float/2addr p1, v1

    .line 315
    invoke-virtual {v3, p1}, Le/e/a/BikeRunModel$Profile;->gap(F)Z

    move-result p1

    return p1
.end method
