.class public Ll/fej;
.super Ll/dmj;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ll/dmj;-><init>()V

    return-void
.end method

.method public constructor <init>(DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dmj;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/dmj;->b:D

    .line 5
    .line 6
    iput-wide p3, p0, Ll/dmj;->a:D

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c()Ll/dop0;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Ll/dmj;->b:D

    .line 4
    .line 5
    const-wide v3, 0x3f847ae147ae147bL    # 0.01

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    sub-double v5, v1, v3

    .line 11
    .line 12
    iget-wide v7, v0, Ll/dmj;->a:D

    .line 13
    .line 14
    sub-double v9, v7, v3

    .line 15
    .line 16
    add-double/2addr v1, v3

    .line 17
    add-double/2addr v7, v3

    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x0

    .line 20
    :goto_0
    const/16 v11, 0x1e

    .line 21
    .line 22
    if-ge v4, v11, :cond_3

    .line 23
    .line 24
    add-double v11, v5, v1

    .line 25
    .line 26
    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    .line 27
    .line 28
    div-double/2addr v11, v13

    .line 29
    add-double v15, v9, v7

    .line 30
    .line 31
    div-double v13, v15, v13

    .line 32
    .line 33
    new-instance v3, Ll/dop0;

    .line 34
    .line 35
    invoke-direct {v3, v11, v12, v13, v14}, Ll/dop0;-><init>(DD)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Ll/dop0;->c()Ll/fej;

    .line 39
    .line 40
    .line 41
    move-result-object v15

    .line 42
    invoke-virtual {v15}, Ll/dmj;->a()D

    .line 43
    .line 44
    .line 45
    move-result-wide v16

    .line 46
    invoke-virtual {v0}, Ll/dmj;->a()D

    .line 47
    .line 48
    .line 49
    move-result-wide v18

    .line 50
    sub-double v16, v16, v18

    .line 51
    .line 52
    invoke-virtual {v15}, Ll/dmj;->b()D

    .line 53
    .line 54
    .line 55
    move-result-wide v18

    .line 56
    invoke-virtual {v0}, Ll/dmj;->b()D

    .line 57
    .line 58
    .line 59
    move-result-wide v20

    .line 60
    sub-double v18, v18, v20

    .line 61
    .line 62
    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->abs(D)D

    .line 63
    .line 64
    .line 65
    move-result-wide v20

    .line 66
    const-wide v22, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    cmpg-double v15, v20, v22

    .line 72
    .line 73
    if-gez v15, :cond_0

    .line 74
    .line 75
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->abs(D)D

    .line 76
    .line 77
    .line 78
    move-result-wide v20

    .line 79
    cmpg-double v15, v20, v22

    .line 80
    .line 81
    if-gez v15, :cond_0

    .line 82
    .line 83
    return-object v3

    .line 84
    :cond_0
    const-wide/16 v20, 0x0

    .line 85
    .line 86
    cmpl-double v15, v16, v20

    .line 87
    .line 88
    if-lez v15, :cond_1

    .line 89
    .line 90
    move-wide v1, v11

    .line 91
    goto :goto_1

    .line 92
    :cond_1
    move-wide v5, v11

    .line 93
    :goto_1
    cmpl-double v11, v18, v20

    .line 94
    .line 95
    if-lez v11, :cond_2

    .line 96
    .line 97
    move-wide v7, v13

    .line 98
    goto :goto_2

    .line 99
    :cond_2
    move-wide v9, v13

    .line 100
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    return-object v3
.end method
