.class public final Le/e/a/BikeRunModel;
.super Ljava/lang/Object;
.source "BikeRunModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/BikeRunModel$Hazard;
    }
.end annotation


# static fields
.field public static final EDGE_GRACE:F = 0.1f

.field public static final GRAVITY:F = 1600.0f

.field public static final JUMP:F = -650.0f

.field public static final RIDER_X:F = 120.0f

.field public static final START_SPEED:F = 440.0f


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

.field private jumpsUsed:I

.field public over:Z

.field private final random:Ljava/util/Random;

.field public spawn:F

.field public started:Z

.field public velocity:F

.field public y:F


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "seed"    # J

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0, p1, p2}, Ljava/util/Random;-><init>(J)V

    iput-object v0, p0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {p0}, Le/e/a/BikeRunModel;->reset()V

    return-void
.end method

.method public static flatSpan(FF)Z
    .registers 8
    .param p0, "start"    # F
    .param p1, "end"    # F

    .line 42
    invoke-static {p0}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result v0

    .line 43
    .local v0, "base":F
    const/high16 v1, 0x40800000    # 4.0f

    add-float v2, p0, v1

    .local v2, "x":F
    :goto_8
    const/4 v3, 0x0

    const v4, 0x3c23d70a    # 0.01f

    cmpg-float v5, v2, p1

    if-gez v5, :cond_20

    invoke-static {v2}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result v5

    sub-float/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v4, v5, v4

    if-lez v4, :cond_1e

    return v3

    :cond_1e
    add-float/2addr v2, v1

    goto :goto_8

    .line 44
    .end local v2    # "x":F
    :cond_20
    invoke-static {p1}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result v1

    sub-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpg-float v1, v1, v4

    if-gtz v1, :cond_2e

    const/4 v3, 0x1

    :cond_2e
    return v3
.end method

.method public static terrain(F)F
    .registers 7
    .param p0, "worldX"    # F

    .line 29
    const/4 v0, 0x0

    const/high16 v1, 0x44160000    # 600.0f

    cmpg-float v2, p0, v1

    if-gtz v2, :cond_8

    return v0

    .line 30
    :cond_8
    sub-float v1, p0, v1

    const v2, 0x45898000    # 4400.0f

    rem-float/2addr v1, v2

    .line 31
    .local v1, "phase":F
    const/high16 v2, -0x3ccc0000    # -180.0f

    const/high16 v3, 0x43e10000    # 450.0f

    cmpg-float v4, v1, v3

    if-gez v4, :cond_1a

    mul-float v2, v2, v1

    div-float/2addr v2, v3

    return v2

    .line 32
    :cond_1a
    const v4, 0x44e74000    # 1850.0f

    cmpg-float v5, v1, v4

    if-gez v5, :cond_22

    return v2

    .line 33
    :cond_22
    const v5, 0x450fc000    # 2300.0f

    cmpg-float v5, v1, v5

    if-gez v5, :cond_32

    const/high16 v0, 0x43340000    # 180.0f

    sub-float v4, v1, v4

    mul-float v4, v4, v0

    div-float/2addr v4, v3

    add-float/2addr v4, v2

    return v4

    .line 34
    :cond_32
    const v2, 0x45322000    # 2850.0f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_3a

    return v0

    .line 35
    :cond_3a
    const v2, 0x45426000    # 3110.0f

    const/high16 v3, -0x3d380000    # -100.0f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_44

    return v3

    .line 36
    :cond_44
    const v2, 0x4552a000    # 3370.0f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_4e

    const/high16 v0, -0x3cb80000    # -200.0f

    return v0

    .line 37
    :cond_4e
    const v2, 0x4562e000    # 3630.0f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_56

    return v3

    .line 38
    :cond_56
    return v0
.end method


# virtual methods
.method public groundAt(F)F
    .registers 3
    .param p1, "screenX"    # F

    .line 52
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v0, p1

    invoke-static {v0}, Le/e/a/BikeRunModel;->terrain(F)F

    move-result v0

    return v0
.end method

.method public placement(F)F
    .registers 7
    .param p1, "width"    # F

    .line 47
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->speed()F

    move-result v0

    const v1, 0x3dcccccd    # 0.1f

    mul-float v0, v0, v1

    const/high16 v2, 0x43700000    # 240.0f

    add-float/2addr v0, v2

    .local v0, "approach":F
    invoke-virtual {p0}, Le/e/a/BikeRunModel;->speed()F

    move-result v2

    mul-float v2, v2, v1

    const/high16 v1, 0x43200000    # 160.0f

    add-float/2addr v2, v1

    .line 48
    .local v2, "landing":F
    const/high16 v1, 0x443e0000    # 760.0f

    .local v1, "x":F
    :goto_17
    const v3, 0x46156000    # 9560.0f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_32

    .line 49
    iget v3, p0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v3, v1

    sub-float/2addr v3, v0

    iget v4, p0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v4, v1

    add-float/2addr v4, p1

    add-float/2addr v4, v2

    invoke-static {v3, v4}, Le/e/a/BikeRunModel;->flatSpan(FF)Z

    move-result v3

    if-eqz v3, :cond_2e

    return v1

    .line 48
    :cond_2e
    const/high16 v3, 0x41a00000    # 20.0f

    add-float/2addr v1, v3

    goto :goto_17

    .line 50
    .end local v1    # "x":F
    :cond_32
    const/high16 v1, 0x7fc00000    # Float.NaN

    return v1
.end method

.method public reset()V
    .registers 2

    .line 26
    iget-object v0, p0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/BikeRunModel;->gapTime:F

    iput v0, p0, Le/e/a/BikeRunModel;->distance:F

    iput v0, p0, Le/e/a/BikeRunModel;->velocity:F

    iput v0, p0, Le/e/a/BikeRunModel;->y:F

    const/high16 v0, 0x442f0000    # 700.0f

    iput v0, p0, Le/e/a/BikeRunModel;->spawn:F

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    iput-boolean v0, p0, Le/e/a/BikeRunModel;->falling:Z

    iput-boolean v0, p0, Le/e/a/BikeRunModel;->over:Z

    iput-boolean v0, p0, Le/e/a/BikeRunModel;->started:Z

    return-void
.end method

.method public score()I
    .registers 3

    .line 109
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public slopeAt(F)F
    .registers 5
    .param p1, "screenX"    # F

    .line 53
    const/high16 v0, 0x40800000    # 4.0f

    add-float v1, p1, v0

    invoke-virtual {p0, v1}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v1

    sub-float v0, p1, v0

    invoke-virtual {p0, v0}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v0

    sub-float/2addr v1, v0

    .local v1, "delta":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v2, 0x41000000    # 8.0f

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1b

    const/4 v0, 0x0

    goto :goto_1d

    :cond_1b
    div-float v0, v1, v2

    :goto_1d
    return v0
.end method

.method public speed()F
    .registers 3

    .line 54
    iget v0, p0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v1, 0x42820000    # 65.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x438c0000    # 280.0f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x43dc0000    # 440.0f

    add-float/2addr v0, v1

    return v0
.end method

.method public step(F)V
    .registers 21
    .param p1, "dt"    # F

    .line 61
    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-boolean v2, v0, Le/e/a/BikeRunModel;->started:Z

    if-eqz v2, :cond_221

    iget-boolean v2, v0, Le/e/a/BikeRunModel;->over:Z

    if-nez v2, :cond_221

    const/4 v2, 0x0

    cmpg-float v3, v1, v2

    if-gtz v3, :cond_13

    goto/16 :goto_221

    .line 62
    :cond_13
    const v3, 0x3d0f5c29    # 0.035f

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 63
    .end local p1    # "dt":F
    .local v1, "dt":F
    const/high16 v3, 0x42f00000    # 120.0f

    invoke-virtual {v0, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v4

    .line 64
    .local v4, "oldGround":F
    invoke-virtual {v0}, Le/e/a/BikeRunModel;->speed()F

    move-result v5

    mul-float v5, v5, v1

    .line 65
    .local v5, "movement":F
    iget v6, v0, Le/e/a/BikeRunModel;->distance:F

    add-float/2addr v6, v5

    iput v6, v0, Le/e/a/BikeRunModel;->distance:F

    iget v6, v0, Le/e/a/BikeRunModel;->spawn:F

    sub-float/2addr v6, v5

    iput v6, v0, Le/e/a/BikeRunModel;->spawn:F

    .line 66
    invoke-virtual {v0, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v6

    sub-float v6, v4, v6

    .line 68
    .local v6, "rise":F
    const/high16 v7, 0x41a00000    # 20.0f

    const/high16 v8, 0x41200000    # 10.0f

    const/4 v9, 0x1

    cmpl-float v7, v6, v7

    if-lez v7, :cond_4a

    iget v7, v0, Le/e/a/BikeRunModel;->y:F

    neg-float v10, v6

    add-float/2addr v10, v8

    cmpl-float v7, v7, v10

    if-lez v7, :cond_4a

    iput-boolean v9, v0, Le/e/a/BikeRunModel;->over:Z

    return-void

    .line 70
    :cond_4a
    iget-boolean v7, v0, Le/e/a/BikeRunModel;->falling:Z

    if-nez v7, :cond_60

    iget v7, v0, Le/e/a/BikeRunModel;->y:F

    cmpg-float v7, v7, v2

    if-ltz v7, :cond_60

    iget v7, v0, Le/e/a/BikeRunModel;->velocity:F

    cmpg-float v7, v7, v2

    if-ltz v7, :cond_60

    const/high16 v7, -0x3e600000    # -20.0f

    cmpg-float v7, v6, v7

    if-gez v7, :cond_85

    .line 71
    :cond_60
    iget v7, v0, Le/e/a/BikeRunModel;->y:F

    add-float/2addr v7, v6

    iput v7, v0, Le/e/a/BikeRunModel;->y:F

    .line 72
    iget v7, v0, Le/e/a/BikeRunModel;->velocity:F

    const/high16 v10, 0x44c80000    # 1600.0f

    mul-float v10, v10, v1

    add-float/2addr v7, v10

    iput v7, v0, Le/e/a/BikeRunModel;->velocity:F

    iget v7, v0, Le/e/a/BikeRunModel;->y:F

    iget v10, v0, Le/e/a/BikeRunModel;->velocity:F

    mul-float v10, v10, v1

    add-float/2addr v7, v10

    iput v7, v0, Le/e/a/BikeRunModel;->y:F

    .line 73
    iget-boolean v7, v0, Le/e/a/BikeRunModel;->falling:Z

    if-nez v7, :cond_85

    iget v7, v0, Le/e/a/BikeRunModel;->y:F

    cmpl-float v7, v7, v2

    if-ltz v7, :cond_85

    iput v2, v0, Le/e/a/BikeRunModel;->y:F

    iput v2, v0, Le/e/a/BikeRunModel;->velocity:F

    .line 75
    :cond_85
    iget v7, v0, Le/e/a/BikeRunModel;->spawn:F

    const/4 v10, 0x0

    cmpg-float v7, v7, v2

    if-gtz v7, :cond_15e

    .line 76
    iget-object v7, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v7}, Ljava/util/Random;->nextBoolean()Z

    move-result v15

    .line 78
    .local v15, "gap":Z
    iget v7, v0, Le/e/a/BikeRunModel;->distance:F

    const/high16 v11, 0x447a0000    # 1000.0f

    cmpl-float v7, v7, v11

    if-lez v7, :cond_a5

    iget-object v7, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    const/4 v11, 0x4

    invoke-virtual {v7, v11}, Ljava/util/Random;->nextInt(I)I

    move-result v7

    if-nez v7, :cond_a5

    const/4 v7, 0x1

    goto :goto_a6

    :cond_a5
    const/4 v7, 0x0

    .line 79
    .local v7, "tall":Z
    :goto_a6
    const/16 v11, 0x28

    if-eqz v15, :cond_bf

    if-eqz v7, :cond_b6

    invoke-virtual {v0}, Le/e/a/BikeRunModel;->speed()F

    move-result v12

    const v13, 0x3f733333    # 0.95f

    mul-float v12, v12, v13

    goto :goto_ca

    :cond_b6
    iget-object v12, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v12, v11}, Ljava/util/Random;->nextInt(I)I

    move-result v12

    add-int/lit8 v12, v12, 0x73

    goto :goto_c9

    :cond_bf
    iget-object v12, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    const/16 v13, 0x16

    invoke-virtual {v12, v13}, Ljava/util/Random;->nextInt(I)I

    move-result v12

    add-int/lit8 v12, v12, 0x24

    :goto_c9
    int-to-float v12, v12

    .line 80
    .local v12, "width":F
    :goto_ca
    if-eqz v15, :cond_ce

    const/4 v13, 0x0

    goto :goto_e4

    :cond_ce
    iget-object v13, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    if-eqz v7, :cond_db

    const/16 v14, 0x10

    invoke-virtual {v13, v14}, Ljava/util/Random;->nextInt(I)I

    move-result v13

    add-int/lit16 v13, v13, 0xa5

    goto :goto_e3

    :cond_db
    const/16 v14, 0x1b

    invoke-virtual {v13, v14}, Ljava/util/Random;->nextInt(I)I

    move-result v13

    add-int/lit8 v13, v13, 0x1c

    :goto_e3
    int-to-float v13, v13

    .line 81
    .local v13, "height":F
    :goto_e4
    if-nez v15, :cond_f3

    if-nez v7, :cond_f3

    iget-object v14, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    invoke-virtual {v14}, Ljava/util/Random;->nextBoolean()Z

    move-result v14

    if-eqz v14, :cond_f3

    const/16 v16, 0x1

    goto :goto_f5

    :cond_f3
    const/16 v16, 0x0

    .line 82
    .local v16, "spikes":Z
    :goto_f5
    if-eqz v16, :cond_118

    iget v14, v0, Le/e/a/BikeRunModel;->distance:F

    const v17, 0x451c4000    # 2500.0f

    cmpl-float v14, v14, v17

    const/16 v17, 0x0

    iget-object v2, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    if-lez v14, :cond_10d

    const/16 v11, 0x46

    invoke-virtual {v2, v11}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x64

    goto :goto_113

    :cond_10d
    invoke-virtual {v2, v11}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x3c

    :goto_113
    int-to-float v2, v2

    move v12, v2

    const/high16 v13, 0x41f00000    # 30.0f

    goto :goto_11a

    :cond_118
    const/16 v17, 0x0

    :goto_11a
    move v14, v13

    move v13, v12

    .line 84
    .end local v12    # "width":F
    .local v13, "width":F
    .local v14, "height":F
    invoke-virtual {v0, v13}, Le/e/a/BikeRunModel;->placement(F)F

    move-result v2

    .line 85
    .local v2, "x":F
    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v11

    if-eqz v11, :cond_12b

    const/high16 v3, 0x42c80000    # 100.0f

    iput v3, v0, Le/e/a/BikeRunModel;->spawn:F

    return-void

    .line 86
    :cond_12b
    iget-object v11, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    move-object v12, v11

    new-instance v11, Le/e/a/BikeRunModel$Hazard;

    move-object/from16 v18, v12

    add-float v12, v2, v5

    move-object/from16 v8, v18

    const/high16 p1, 0x41200000    # 10.0f

    invoke-direct/range {v11 .. v16}, Le/e/a/BikeRunModel$Hazard;-><init>(FFFZZ)V

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    const/high16 v8, 0x443e0000    # 760.0f

    sub-float v8, v2, v8

    iget-object v11, v0, Le/e/a/BikeRunModel;->random:Ljava/util/Random;

    const/16 v12, 0xdc

    invoke-virtual {v11, v12}, Ljava/util/Random;->nextInt(I)I

    move-result v11

    add-int/lit16 v11, v11, 0x1b8

    int-to-float v11, v11

    invoke-virtual {v0}, Le/e/a/BikeRunModel;->speed()F

    move-result v12

    const/high16 v18, 0x3fa00000    # 1.25f

    mul-float v12, v12, v18

    add-float/2addr v12, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    move-result v11

    add-float/2addr v8, v11

    iput v8, v0, Le/e/a/BikeRunModel;->spawn:F

    goto :goto_162

    .line 75
    .end local v2    # "x":F
    .end local v7    # "tall":Z
    .end local v13    # "width":F
    .end local v14    # "height":F
    .end local v15    # "gap":Z
    .end local v16    # "spikes":Z
    :cond_15e
    const/high16 p1, 0x41200000    # 10.0f

    const/16 v17, 0x0

    .line 90
    :goto_162
    const/4 v2, 0x0

    .line 91
    .local v2, "unsupported":Z
    iget-object v7, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v7, v9

    .local v7, "n":I
    :goto_16a
    if-ltz v7, :cond_1d9

    .line 92
    iget-object v8, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Le/e/a/BikeRunModel$Hazard;

    .local v8, "h":Le/e/a/BikeRunModel$Hazard;
    iget v11, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    sub-float/2addr v11, v5

    iput v11, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    .line 93
    iget-boolean v11, v8, Le/e/a/BikeRunModel$Hazard;->gap:Z

    if-eqz v11, :cond_192

    .line 95
    iget v11, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    const/high16 v12, 0x41600000    # 14.0f

    add-float/2addr v11, v12

    cmpl-float v11, v3, v11

    if-lez v11, :cond_1c8

    iget v11, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v13, v8, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v11, v13

    sub-float/2addr v11, v12

    cmpg-float v11, v3, v11

    if-gez v11, :cond_1c8

    const/4 v2, 0x1

    goto :goto_1c8

    .line 97
    :cond_192
    iget v11, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v12, v8, Le/e/a/BikeRunModel$Hazard;->width:F

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    add-float/2addr v11, v12

    invoke-virtual {v0, v11}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v11

    invoke-virtual {v0, v3}, Le/e/a/BikeRunModel;->groundAt(F)F

    move-result v12

    sub-float/2addr v11, v12

    .line 99
    .local v11, "base":F
    iget v12, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    const/high16 v13, 0x41000000    # 8.0f

    add-float/2addr v12, v13

    const/high16 v14, 0x43060000    # 134.0f

    cmpl-float v12, v14, v12

    if-lez v12, :cond_1c8

    iget v12, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v14, v8, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v12, v14

    sub-float/2addr v12, v13

    const/high16 v13, 0x42d40000    # 106.0f

    cmpg-float v12, v13, v12

    if-gez v12, :cond_1c8

    iget v12, v0, Le/e/a/BikeRunModel;->y:F

    iget v13, v8, Le/e/a/BikeRunModel$Hazard;->height:F

    sub-float v13, v11, v13

    add-float v13, v13, p1

    cmpl-float v12, v12, v13

    if-lez v12, :cond_1c8

    iput-boolean v9, v0, Le/e/a/BikeRunModel;->over:Z

    .line 101
    .end local v11    # "base":F
    :cond_1c8
    :goto_1c8
    iget v11, v8, Le/e/a/BikeRunModel$Hazard;->x:F

    iget v12, v8, Le/e/a/BikeRunModel$Hazard;->width:F

    add-float/2addr v11, v12

    cmpg-float v11, v11, v17

    if-gez v11, :cond_1d6

    iget-object v11, v0, Le/e/a/BikeRunModel;->hazards:Ljava/util/ArrayList;

    invoke-virtual {v11, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 91
    .end local v8    # "h":Le/e/a/BikeRunModel$Hazard;
    :cond_1d6
    add-int/lit8 v7, v7, -0x1

    goto :goto_16a

    .line 103
    .end local v7    # "n":I
    :cond_1d9
    if-eqz v2, :cond_1e9

    iget v3, v0, Le/e/a/BikeRunModel;->y:F

    cmpl-float v3, v3, v17

    if-ltz v3, :cond_1e9

    iget v3, v0, Le/e/a/BikeRunModel;->velocity:F

    cmpl-float v3, v3, v17

    if-ltz v3, :cond_1e9

    iput-boolean v9, v0, Le/e/a/BikeRunModel;->falling:Z

    .line 104
    :cond_1e9
    if-eqz v2, :cond_1ef

    iget v3, v0, Le/e/a/BikeRunModel;->gapTime:F

    add-float/2addr v3, v1

    goto :goto_1f0

    :cond_1ef
    const/4 v3, 0x0

    :goto_1f0
    iput v3, v0, Le/e/a/BikeRunModel;->gapTime:F

    .line 105
    if-nez v2, :cond_206

    iget-boolean v3, v0, Le/e/a/BikeRunModel;->falling:Z

    if-nez v3, :cond_206

    iget v3, v0, Le/e/a/BikeRunModel;->y:F

    cmpl-float v3, v3, v17

    if-nez v3, :cond_206

    iget v3, v0, Le/e/a/BikeRunModel;->velocity:F

    cmpl-float v3, v3, v17

    if-nez v3, :cond_206

    iput v10, v0, Le/e/a/BikeRunModel;->jumpsUsed:I

    .line 106
    :cond_206
    iget-boolean v3, v0, Le/e/a/BikeRunModel;->falling:Z

    if-eqz v3, :cond_214

    iget v3, v0, Le/e/a/BikeRunModel;->y:F

    const/high16 v7, 0x435c0000    # 220.0f

    cmpl-float v3, v3, v7

    if-lez v3, :cond_214

    iput-boolean v9, v0, Le/e/a/BikeRunModel;->over:Z

    .line 107
    :cond_214
    iget-boolean v3, v0, Le/e/a/BikeRunModel;->falling:Z

    if-eqz v3, :cond_220

    iget v3, v0, Le/e/a/BikeRunModel;->y:F

    cmpg-float v3, v3, v17

    if-gez v3, :cond_220

    iput-boolean v10, v0, Le/e/a/BikeRunModel;->falling:Z

    .line 108
    :cond_220
    return-void

    .line 61
    .end local v1    # "dt":F
    .end local v2    # "unsupported":Z
    .end local v4    # "oldGround":F
    .end local v5    # "movement":F
    .end local v6    # "rise":F
    .restart local p1    # "dt":F
    :cond_221
    :goto_221
    return-void
.end method

.method public tap()V
    .registers 4

    .line 56
    iget-boolean v0, p0, Le/e/a/BikeRunModel;->over:Z

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Le/e/a/BikeRunModel;->reset()V

    .line 57
    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/BikeRunModel;->started:Z

    .line 58
    iget v1, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    const/4 v2, 0x2

    if-ge v1, v2, :cond_1c

    const v1, -0x3bdd8000    # -650.0f

    iput v1, p0, Le/e/a/BikeRunModel;->velocity:F

    const/4 v1, 0x0

    iput v1, p0, Le/e/a/BikeRunModel;->gapTime:F

    iget v1, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    add-int/2addr v1, v0

    iput v1, p0, Le/e/a/BikeRunModel;->jumpsUsed:I

    .line 59
    :cond_1c
    return-void
.end method
