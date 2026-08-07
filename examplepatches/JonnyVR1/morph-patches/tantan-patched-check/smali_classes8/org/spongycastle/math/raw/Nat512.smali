.class public abstract Lorg/spongycastle/math/raw/Nat512;
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

.method public static mul([I[I[I)V
    .locals 17

    .line 1
    invoke-static/range {p0 .. p2}, Lorg/spongycastle/math/raw/Nat256;->mul([I[I[I)V

    .line 2
    .line 3
    .line 4
    const/16 v3, 0x8

    .line 5
    .line 6
    const/16 v5, 0x10

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    move-object/from16 v0, p0

    .line 11
    .line 12
    move-object/from16 v2, p1

    .line 13
    .line 14
    move-object/from16 v4, p2

    .line 15
    .line 16
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/raw/Nat256;->mul([II[II[II)V

    .line 17
    .line 18
    .line 19
    move-object v12, v4

    .line 20
    const/16 v13, 0x8

    .line 21
    .line 22
    const/16 v14, 0x10

    .line 23
    .line 24
    invoke-static {v12, v13, v12, v14}, Lorg/spongycastle/math/raw/Nat256;->addToEachOther([II[II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v15, 0x0

    .line 29
    invoke-static {v12, v15, v12, v13, v15}, Lorg/spongycastle/math/raw/Nat256;->addTo([II[III)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v1, v0

    .line 34
    const/16 v2, 0x18

    .line 35
    .line 36
    invoke-static {v12, v2, v12, v14, v1}, Lorg/spongycastle/math/raw/Nat256;->addTo([II[III)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    add-int v16, v0, v1

    .line 41
    .line 42
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create()[I

    .line 43
    .line 44
    .line 45
    move-result-object v10

    .line 46
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create()[I

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    const/4 v9, 0x0

    .line 51
    const/4 v11, 0x0

    .line 52
    const/16 v7, 0x8

    .line 53
    .line 54
    move-object/from16 v8, p0

    .line 55
    .line 56
    move-object/from16 v6, p0

    .line 57
    .line 58
    invoke-static/range {v6 .. v11}, Lorg/spongycastle/math/raw/Nat256;->diff([II[II[II)Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    const/4 v3, 0x0

    .line 63
    const/4 v5, 0x0

    .line 64
    const/16 v1, 0x8

    .line 65
    .line 66
    move v0, v2

    .line 67
    move-object/from16 v2, p1

    .line 68
    .line 69
    move v7, v0

    .line 70
    move-object/from16 v0, p1

    .line 71
    .line 72
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/raw/Nat256;->diff([II[II[II)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eq v6, v0, :cond_0

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    move v0, v15

    .line 81
    :goto_0
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt()[I

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v10, v4, v1}, Lorg/spongycastle/math/raw/Nat256;->mul([I[I[I)V

    .line 86
    .line 87
    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    invoke-static {v14, v1, v15, v12, v13}, Lorg/spongycastle/math/raw/Nat;->addTo(I[II[II)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    invoke-static {v14, v1, v15, v12, v13}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[II[II)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    :goto_1
    add-int v0, v16, v0

    .line 100
    .line 101
    const/16 v1, 0x20

    .line 102
    .line 103
    invoke-static {v1, v0, v12, v7}, Lorg/spongycastle/math/raw/Nat;->addWordAt(II[II)I

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static square([I[I)V
    .locals 12

    .line 1
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat256;->square([I[I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    invoke-static {p0, v0, p1, v1}, Lorg/spongycastle/math/raw/Nat256;->square([II[II)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0, p1, v1}, Lorg/spongycastle/math/raw/Nat256;->addToEachOther([II[II)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-static {p1, v3, p1, v0, v3}, Lorg/spongycastle/math/raw/Nat256;->addTo([II[III)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    add-int/2addr v4, v2

    .line 21
    const/16 v5, 0x18

    .line 22
    .line 23
    invoke-static {p1, v5, p1, v1, v4}, Lorg/spongycastle/math/raw/Nat256;->addTo([II[III)I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    add-int/2addr v2, v4

    .line 28
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create()[I

    .line 29
    .line 30
    .line 31
    move-result-object v10

    .line 32
    const/4 v9, 0x0

    .line 33
    const/4 v11, 0x0

    .line 34
    const/16 v7, 0x8

    .line 35
    .line 36
    move-object v8, p0

    .line 37
    move-object v6, p0

    .line 38
    invoke-static/range {v6 .. v11}, Lorg/spongycastle/math/raw/Nat256;->diff([II[II[II)Z

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt()[I

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {v10, p0}, Lorg/spongycastle/math/raw/Nat256;->square([I[I)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p0, v3, p1, v0}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[II[II)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    add-int/2addr v2, p0

    .line 53
    const/16 p0, 0x20

    .line 54
    .line 55
    invoke-static {p0, v2, p1, v5}, Lorg/spongycastle/math/raw/Nat;->addWordAt(II[II)I

    .line 56
    .line 57
    .line 58
    return-void
.end method
