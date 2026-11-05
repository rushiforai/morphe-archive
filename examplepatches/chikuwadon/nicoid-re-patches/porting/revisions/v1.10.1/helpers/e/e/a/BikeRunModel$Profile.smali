.class final Le/e/a/BikeRunModel$Profile;
.super Ljava/lang/Object;
.source "BikeRunModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRunModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Profile"
.end annotation


# instance fields
.field final height:F

.field final kind:I

.field final ledge:F

.field final ramp:F

.field final variant:I


# direct methods
.method constructor <init>(JJ)V
    .registers 10

    .line 373
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 374
    new-instance v0, Ljava/util/Random;

    const-wide v1, -0x61c8864680b583ebL

    mul-long v1, v1, p3

    xor-long/2addr v1, p1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    long-to-float v1, p3

    const/high16 v2, 0x46160000    # 9600.0f

    mul-float v1, v1, v2

    const/high16 v2, 0x41200000    # 10.0f

    div-float/2addr v1, v2

    const/4 v2, 0x0

    .line 375
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    const v2, 0x45bb8000    # 6000.0f

    add-float/2addr v2, v1

    div-float/2addr v1, v2

    const-wide/16 v2, 0x3

    and-long/2addr p1, v2

    add-long/2addr p3, p1

    and-long p1, p3, v2

    long-to-int p2, p1

    const/16 p1, 0x48

    .line 379
    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    .line 380
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result p3

    const/high16 p4, 0x3f000000    # 0.5f

    const/16 v2, 0x24

    cmpg-float p3, p3, p4

    if-gez p3, :cond_55

    .line 381
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result p1

    const p3, 0x3f266666    # 0.65f

    mul-float p3, p3, v1

    const p4, 0x3e4ccccd    # 0.2f

    add-float/2addr p3, p4

    cmpg-float p1, p1, p3

    if-gez p1, :cond_4f

    const/16 p1, 0x24

    goto :goto_50

    :cond_4f
    const/4 p1, 0x0

    .line 382
    :goto_50
    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result p3

    add-int/2addr p1, p3

    :cond_55
    const/4 p3, 0x2

    if-eqz p2, :cond_5a

    if-ne p2, p3, :cond_6f

    .line 384
    :cond_5a
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result p4

    const v3, 0x3eb33333    # 0.35f

    mul-float v3, v3, v1

    const v4, 0x3f59999a    # 0.85f

    sub-float/2addr v4, v3

    cmpg-float p4, p4, v4

    if-gez p4, :cond_6f

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    :cond_6f
    const/4 p4, 0x3

    const/4 v2, 0x6

    if-ne p2, p4, :cond_8f

    .line 385
    invoke-virtual {v0}, Ljava/util/Random;->nextFloat()F

    move-result p2

    const p4, 0x3e99999a    # 0.3f

    mul-float v1, v1, p4

    const p4, 0x3f666666    # 0.9f

    sub-float/2addr p4, v1

    cmpg-float p2, p2, p4

    if-gez p2, :cond_8f

    invoke-virtual {v0, p3}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    mul-int/lit8 p1, p1, 0x6

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result p2

    add-int/2addr p1, p2

    .line 386
    :cond_8f
    div-int/lit8 p2, p1, 0x6

    iput p2, p0, Le/e/a/BikeRunModel$Profile;->kind:I

    .line 387
    rem-int/2addr p1, v2

    iput p1, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 p2, p1, 0x11

    add-int/lit8 p2, p2, 0x46

    int-to-float p2, p2

    .line 388
    iput p2, p0, Le/e/a/BikeRunModel$Profile;->height:F

    mul-int/lit8 p2, p1, 0x41

    add-int/lit16 p2, p2, 0x17c

    int-to-float p2, p2

    .line 389
    iput p2, p0, Le/e/a/BikeRunModel$Profile;->ramp:F

    mul-int/lit8 p1, p1, 0x6

    add-int/lit8 p1, p1, 0x1e

    int-to-float p1, p1

    .line 390
    iput p1, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    return-void
.end method


# virtual methods
.method added(F)F
    .registers 9

    const/4 v0, 0x0

    const/high16 v1, 0x447a0000    # 1000.0f

    cmpg-float v2, p1, v1

    if-ltz v2, :cond_d7

    const/high16 v2, 0x45e10000    # 7200.0f

    cmpl-float v2, p1, v2

    if-ltz v2, :cond_f

    goto/16 :goto_d7

    .line 472
    :cond_f
    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->climbEnd()F

    move-result v2

    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->steps()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->rise()F

    move-result v4

    mul-float v3, v3, v4

    .line 473
    iget v4, p0, Le/e/a/BikeRunModel$Profile;->kind:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_9b

    const/4 v6, 0x7

    if-ne v4, v6, :cond_29

    goto/16 :goto_9b

    :cond_29
    const/16 v2, 0x8

    const/high16 v5, 0x3f800000    # 1.0f

    if-ne v4, v2, :cond_52

    const/high16 v2, 0x452f0000    # 2800.0f

    const/high16 v4, 0x44e10000    # 1800.0f

    cmpg-float v2, p1, v2

    if-gez v2, :cond_3c

    sub-float/2addr p1, v1

    mul-float v3, v3, p1

    div-float/2addr v3, v4

    return v3

    :cond_3c
    const v1, 0x455ac000    # 3500.0f

    cmpg-float v2, p1, v1

    if-gez v2, :cond_44

    return v3

    :cond_44
    const v2, 0x45a5a000    # 5300.0f

    cmpg-float v2, p1, v2

    if-gez v2, :cond_51

    sub-float/2addr p1, v1

    div-float/2addr p1, v4

    sub-float/2addr v5, p1

    mul-float v3, v3, v5

    return v3

    :cond_51
    return v0

    :cond_52
    const/16 v2, 0x9

    if-ne v4, v2, :cond_76

    sub-float/2addr p1, v1

    const/high16 v1, 0x44960000    # 1200.0f

    div-float/2addr p1, v1

    const/high16 v1, 0x40800000    # 4.0f

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_61

    return v0

    :cond_61
    float-to-int v0, p1

    int-to-float v1, v0

    sub-float/2addr p1, v1

    .line 491
    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_6a

    neg-float p1, p1

    goto :goto_6c

    :cond_6a
    sub-float/2addr v5, p1

    neg-float p1, v5

    :goto_6c
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v0, v0, 0x16

    add-int/lit8 v0, v0, 0x64

    int-to-float v0, v0

    mul-float p1, p1, v0

    return p1

    :cond_76
    const/16 v2, 0xa

    if-ne v4, v2, :cond_7b

    return v0

    .line 495
    :cond_7b
    iget v2, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v2, v2, 0x18

    add-int/lit16 v2, v2, 0x82

    neg-int v2, v2

    int-to-float v2, v2

    const v3, 0x450fc000    # 2300.0f

    cmpg-float v3, p1, v3

    if-gez v3, :cond_92

    sub-float/2addr p1, v1

    mul-float v2, v2, p1

    const p1, 0x44a28000    # 1300.0f

    div-float/2addr v2, p1

    return v2

    :cond_92
    const v1, 0x45b22000    # 5700.0f

    cmpg-float p1, p1, v1

    if-gez p1, :cond_9a

    return v2

    :cond_9a
    return v0

    :cond_9b
    :goto_9b
    cmpg-float v6, p1, v2

    if-gez v6, :cond_b1

    sub-float/2addr p1, v1

    .line 474
    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->width()F

    move-result v0

    div-float/2addr p1, v0

    float-to-int p1, p1

    add-int/lit8 p1, p1, 0x1

    neg-int p1, p1

    int-to-float p1, p1

    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->rise()F

    move-result v0

    mul-float p1, p1, v0

    return p1

    :cond_b1
    const/high16 v1, 0x442f0000    # 700.0f

    add-float v6, v2, v1

    cmpg-float v6, p1, v6

    if-gez v6, :cond_ba

    return v3

    :cond_ba
    if-ne v4, v5, :cond_bd

    return v0

    :cond_bd
    sub-float/2addr p1, v2

    sub-float/2addr p1, v1

    .line 477
    iget v1, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v1, v1, 0x6

    add-int/lit16 v1, v1, 0xdc

    int-to-float v1, v1

    div-float/2addr p1, v1

    float-to-int p1, p1

    add-int/lit8 p1, p1, 0x1

    int-to-float p1, p1

    .line 478
    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->rise()F

    move-result v1

    mul-float p1, p1, v1

    add-float/2addr v3, p1

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result p1

    return p1

    :cond_d7
    :goto_d7
    return v0
.end method

.method at(F)F
    .registers 12

    .line 395
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->kind:I

    const/4 v1, 0x6

    if-lt v0, v1, :cond_a

    invoke-virtual {p0, p1}, Le/e/a/BikeRunModel$Profile;->added(F)F

    move-result p1

    return p1

    :cond_a
    const/high16 v1, 0x44480000    # 800.0f

    const/4 v2, 0x0

    cmpg-float v3, p1, v1

    if-ltz v3, :cond_fe

    const v3, 0x45bb8000    # 6000.0f

    cmpl-float v3, p1, v3

    if-ltz v3, :cond_1a

    goto/16 :goto_fe

    :cond_1a
    const/4 v3, 0x1

    .line 399
    iget v4, p0, Le/e/a/BikeRunModel$Profile;->height:F

    if-ne v0, v3, :cond_25

    const v5, 0x3f266666    # 0.65f

    mul-float v4, v4, v5

    goto :goto_26

    :cond_25
    neg-float v4, v4

    :goto_26
    const/4 v5, 0x4

    if-ne v0, v5, :cond_54

    .line 401
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->ramp:F

    add-float v3, v0, v1

    cmpg-float v3, p1, v3

    if-gez v3, :cond_39

    .line 402
    iget v2, p0, Le/e/a/BikeRunModel$Profile;->height:F

    neg-float v2, v2

    sub-float/2addr p1, v1

    mul-float v2, v2, p1

    div-float/2addr v2, v0

    return v2

    :cond_39
    const v1, 0x4573c000    # 3900.0f

    cmpg-float v3, p1, v1

    if-gez v3, :cond_44

    .line 405
    iget p1, p0, Le/e/a/BikeRunModel$Profile;->height:F

    :goto_42
    neg-float p1, p1

    return p1

    :cond_44
    add-float v3, v0, v1

    cmpg-float v3, p1, v3

    if-gez v3, :cond_53

    .line 408
    iget v2, p0, Le/e/a/BikeRunModel$Profile;->height:F

    neg-float v3, v2

    sub-float/2addr p1, v1

    mul-float v2, v2, p1

    div-float/2addr v2, v0

    add-float/2addr v3, v2

    return v3

    :cond_53
    return v2

    .line 412
    :cond_54
    iget v5, p0, Le/e/a/BikeRunModel$Profile;->ramp:F

    add-float v6, v5, v1

    cmpg-float v6, p1, v6

    if-gez v6, :cond_61

    sub-float/2addr p1, v1

    mul-float v4, v4, p1

    div-float/2addr v4, v5

    return v4

    :cond_61
    const v1, 0x4541c000    # 3100.0f

    cmpg-float v6, p1, v1

    if-gez v6, :cond_69

    return v4

    :cond_69
    add-float v6, v5, v1

    const/high16 v7, 0x3f800000    # 1.0f

    cmpg-float v6, p1, v6

    if-gez v6, :cond_77

    sub-float/2addr p1, v1

    div-float/2addr p1, v5

    sub-float/2addr v7, p1

    mul-float v4, v4, v7

    return v4

    :cond_77
    if-eqz v0, :cond_fe

    if-ne v0, v3, :cond_7d

    goto/16 :goto_fe

    :cond_7d
    const v1, 0x45866000    # 4300.0f

    sub-float/2addr p1, v1

    .line 425
    iget v1, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v4, v1, 0xe

    add-int/lit16 v4, v4, 0x104

    int-to-float v4, v4

    cmpg-float v5, p1, v2

    if-gez v5, :cond_8d

    return v2

    :cond_8d
    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v8, 0x2

    if-ne v0, v8, :cond_b2

    cmpg-float v0, p1, v4

    if-gez v0, :cond_9b

    .line 431
    iget p1, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    goto :goto_42

    :cond_9b
    mul-float v6, v6, v4

    cmpg-float v0, p1, v6

    if-gez v0, :cond_a8

    const/high16 p1, -0x40000000    # -2.0f

    .line 434
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    mul-float v0, v0, p1

    return v0

    :cond_a8
    mul-float v4, v4, v5

    cmpg-float p1, p1, v4

    if-gez p1, :cond_b1

    .line 437
    iget p1, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    goto :goto_42

    :cond_b1
    return v2

    :cond_b2
    const/4 v9, 0x3

    if-ne v0, v9, :cond_ce

    cmpg-float v0, p1, v4

    if-gez v0, :cond_bc

    .line 443
    iget p1, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    goto :goto_42

    :cond_bc
    mul-float v6, v6, v4

    cmpg-float v0, p1, v6

    if-gez v0, :cond_c3

    return v2

    :cond_c3
    mul-float v4, v4, v5

    cmpg-float p1, p1, v4

    if-gez p1, :cond_cd

    .line 449
    iget p1, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    goto/16 :goto_42

    :cond_cd
    return v2

    .line 453
    :cond_ce
    rem-int/2addr v1, v8

    if-nez v1, :cond_d2

    const/4 v3, -0x1

    :cond_d2
    int-to-float v0, v3

    const/high16 v1, 0x43c80000    # 400.0f

    cmpg-float v3, p1, v1

    if-gez v3, :cond_e1

    .line 455
    iget v2, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    mul-float v0, v0, v2

    mul-float v0, v0, p1

    div-float/2addr v0, v1

    return v0

    :cond_e1
    const v3, 0x44548000    # 850.0f

    cmpg-float v4, p1, v3

    if-gez v4, :cond_ed

    .line 458
    iget p1, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    mul-float v0, v0, p1

    return v0

    :cond_ed
    const v4, 0x449c4000    # 1250.0f

    cmpg-float v4, p1, v4

    if-gez v4, :cond_fe

    .line 461
    iget v2, p0, Le/e/a/BikeRunModel$Profile;->ledge:F

    mul-float v0, v0, v2

    sub-float/2addr p1, v3

    div-float/2addr p1, v1

    sub-float/2addr v7, p1

    mul-float v0, v0, v7

    return v0

    :cond_fe
    :goto_fe
    return v2
.end method

.method climbEnd()F
    .registers 3

    .line 469
    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->steps()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Le/e/a/BikeRunModel$Profile;->width()F

    move-result v1

    mul-float v0, v0, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    add-float/2addr v0, v1

    return v0
.end method

.method gap(F)Z
    .registers 7

    .line 501
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->kind:I

    const/4 v1, 0x0

    const/16 v2, 0xa

    if-eq v0, v2, :cond_c

    const/16 v3, 0xb

    if-eq v0, v3, :cond_c

    return v1

    :cond_c
    if-ne v0, v2, :cond_11

    const/16 v0, 0x578

    goto :goto_13

    :cond_11
    const/16 v0, 0xa8c

    :goto_13
    int-to-float v0, v0

    .line 503
    iget v2, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v3, v2, 0xe

    add-int/lit16 v3, v3, 0x294

    int-to-float v3, v3

    mul-int/lit8 v2, v2, 0xc

    add-int/lit8 v2, v2, 0x7d

    int-to-float v2, v2

    cmpg-float v4, p1, v0

    if-ltz v4, :cond_37

    const/high16 v4, 0x40800000    # 4.0f

    mul-float v4, v4, v3

    add-float/2addr v4, v0

    cmpl-float v4, p1, v4

    if-ltz v4, :cond_2e

    goto :goto_37

    :cond_2e
    sub-float/2addr p1, v0

    rem-float/2addr p1, v3

    sub-float/2addr v3, v2

    cmpl-float p1, p1, v3

    if-ltz p1, :cond_37

    const/4 p1, 0x1

    return p1

    :cond_37
    :goto_37
    return v1
.end method

.method rise()F
    .registers 2

    .line 467
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v0, v0, 0x3

    add-int/lit8 v0, v0, 0x2c

    int-to-float v0, v0

    return v0
.end method

.method steps()I
    .registers 2

    .line 466
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    rem-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method width()F
    .registers 2

    .line 468
    iget v0, p0, Le/e/a/BikeRunModel$Profile;->variant:I

    mul-int/lit8 v0, v0, 0xc

    add-int/lit16 v0, v0, 0x1cc

    int-to-float v0, v0

    return v0
.end method
