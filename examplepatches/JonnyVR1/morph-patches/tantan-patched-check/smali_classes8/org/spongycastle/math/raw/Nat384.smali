.class public abstract Lorg/spongycastle/math/raw/Nat384;
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
    invoke-static/range {p0 .. p2}, Lorg/spongycastle/math/raw/Nat192;->mul([I[I[I)V

    .line 2
    .line 3
    .line 4
    const/4 v3, 0x6

    .line 5
    const/16 v5, 0xc

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    move-object/from16 v0, p0

    .line 9
    .line 10
    move-object/from16 v2, p1

    .line 11
    .line 12
    move-object/from16 v4, p2

    .line 13
    .line 14
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/raw/Nat192;->mul([II[II[II)V

    .line 15
    .line 16
    .line 17
    move-object v12, v4

    .line 18
    const/4 v13, 0x6

    .line 19
    const/16 v14, 0xc

    .line 20
    .line 21
    invoke-static {v12, v13, v12, v14}, Lorg/spongycastle/math/raw/Nat192;->addToEachOther([II[II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v15, 0x0

    .line 26
    invoke-static {v12, v15, v12, v13, v15}, Lorg/spongycastle/math/raw/Nat192;->addTo([II[III)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    add-int/2addr v1, v0

    .line 31
    const/16 v2, 0x12

    .line 32
    .line 33
    invoke-static {v12, v2, v12, v14, v1}, Lorg/spongycastle/math/raw/Nat192;->addTo([II[III)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int v16, v0, v1

    .line 38
    .line 39
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create()[I

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create()[I

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const/4 v9, 0x0

    .line 48
    const/4 v11, 0x0

    .line 49
    const/4 v7, 0x6

    .line 50
    move-object/from16 v8, p0

    .line 51
    .line 52
    move-object/from16 v6, p0

    .line 53
    .line 54
    invoke-static/range {v6 .. v11}, Lorg/spongycastle/math/raw/Nat192;->diff([II[II[II)Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    const/4 v3, 0x0

    .line 59
    const/4 v5, 0x0

    .line 60
    const/4 v1, 0x6

    .line 61
    move v0, v2

    .line 62
    move-object/from16 v2, p1

    .line 63
    .line 64
    move v7, v0

    .line 65
    move-object/from16 v0, p1

    .line 66
    .line 67
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/raw/Nat192;->diff([II[II[II)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eq v6, v0, :cond_0

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    move v0, v15

    .line 76
    :goto_0
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt()[I

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {v10, v4, v1}, Lorg/spongycastle/math/raw/Nat192;->mul([I[I[I)V

    .line 81
    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-static {v14, v1, v15, v12, v13}, Lorg/spongycastle/math/raw/Nat;->addTo(I[II[II)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    goto :goto_1

    .line 90
    :cond_1
    invoke-static {v14, v1, v15, v12, v13}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[II[II)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    :goto_1
    add-int v0, v16, v0

    .line 95
    .line 96
    const/16 v1, 0x18

    .line 97
    .line 98
    invoke-static {v1, v0, v12, v7}, Lorg/spongycastle/math/raw/Nat;->addWordAt(II[II)I

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static square([I[I)V
    .locals 12

    .line 1
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat192;->square([I[I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    const/16 v1, 0xc

    .line 6
    .line 7
    invoke-static {p0, v0, p1, v1}, Lorg/spongycastle/math/raw/Nat192;->square([II[II)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0, p1, v1}, Lorg/spongycastle/math/raw/Nat192;->addToEachOther([II[II)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-static {p1, v3, p1, v0, v3}, Lorg/spongycastle/math/raw/Nat192;->addTo([II[III)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    add-int/2addr v4, v2

    .line 20
    const/16 v5, 0x12

    .line 21
    .line 22
    invoke-static {p1, v5, p1, v1, v4}, Lorg/spongycastle/math/raw/Nat192;->addTo([II[III)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    add-int/2addr v2, v4

    .line 27
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->create()[I

    .line 28
    .line 29
    .line 30
    move-result-object v10

    .line 31
    const/4 v9, 0x0

    .line 32
    const/4 v11, 0x0

    .line 33
    const/4 v7, 0x6

    .line 34
    move-object v8, p0

    .line 35
    move-object v6, p0

    .line 36
    invoke-static/range {v6 .. v11}, Lorg/spongycastle/math/raw/Nat192;->diff([II[II[II)Z

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lorg/spongycastle/math/raw/Nat192;->createExt()[I

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v10, p0}, Lorg/spongycastle/math/raw/Nat192;->square([I[I)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, p0, v3, p1, v0}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[II[II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    add-int/2addr v2, p0

    .line 51
    const/16 p0, 0x18

    .line 52
    .line 53
    invoke-static {p0, v2, p1, v5}, Lorg/spongycastle/math/raw/Nat;->addWordAt(II[II)I

    .line 54
    .line 55
    .line 56
    return-void
.end method
