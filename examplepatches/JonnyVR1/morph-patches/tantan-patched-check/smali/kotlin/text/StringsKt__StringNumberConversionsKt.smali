.class Lkotlin/text/StringsKt__StringNumberConversionsKt;
.super Lkotlin/text/c;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0010\u000e\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0005\u001a\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u001a\u001d\u0010\u0005\u001a\u0004\u0018\u00010\u0001*\u00020\u00002\u0006\u0010\u0004\u001a\u00020\u0001H\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u001a\u0015\u0010\u0008\u001a\u0004\u0018\u00010\u0007*\u00020\u0000H\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\t\u001a\u001d\u0010\n\u001a\u0004\u0018\u00010\u0007*\u00020\u00002\u0006\u0010\u0004\u001a\u00020\u0001H\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "",
        "",
        "toIntOrNull",
        "(Ljava/lang/String;)Ljava/lang/Integer;",
        "radix",
        "o",
        "(Ljava/lang/String;I)Ljava/lang/Integer;",
        "",
        "p",
        "(Ljava/lang/String;)Ljava/lang/Long;",
        "q",
        "(Ljava/lang/String;I)Ljava/lang/Long;",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x31
    xs = "kotlin/text/StringsKt"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lkotlin/text/c;-><init>()V

    return-void
.end method

.method public static final o(Ljava/lang/String;I)Ljava/lang/Integer;
    .locals 10
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/SinceKotlin;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lkotlin/text/CharsKt__CharJVMKt;->checkRadix(I)I

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/16 v4, 0x30

    .line 21
    .line 22
    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->e(II)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const v5, -0x7fffffff

    .line 27
    .line 28
    .line 29
    if-gez v4, :cond_4

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    if-ne v0, v4, :cond_1

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_1
    const/16 v6, 0x2b

    .line 36
    .line 37
    if-eq v3, v6, :cond_3

    .line 38
    .line 39
    const/16 v5, 0x2d

    .line 40
    .line 41
    if-eq v3, v5, :cond_2

    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_2
    const/high16 v5, -0x80000000

    .line 45
    .line 46
    move v3, v4

    .line 47
    goto :goto_0

    .line 48
    :cond_3
    move v3, v2

    .line 49
    goto :goto_0

    .line 50
    :cond_4
    move v3, v2

    .line 51
    move v4, v3

    .line 52
    :goto_0
    const v6, -0x38e38e3

    .line 53
    .line 54
    .line 55
    move v7, v6

    .line 56
    :goto_1
    if-ge v4, v0, :cond_9

    .line 57
    .line 58
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    invoke-static {v8, p1}, Lkotlin/text/CharsKt__CharJVMKt;->a(CI)I

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    if-gez v8, :cond_5

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_5
    if-ge v2, v7, :cond_7

    .line 70
    .line 71
    if-ne v7, v6, :cond_6

    .line 72
    .line 73
    div-int v7, v5, p1

    .line 74
    .line 75
    if-ge v2, v7, :cond_7

    .line 76
    .line 77
    :cond_6
    return-object v1

    .line 78
    :cond_7
    mul-int/2addr v2, p1

    .line 79
    add-int v9, v5, v8

    .line 80
    .line 81
    if-ge v2, v9, :cond_8

    .line 82
    .line 83
    return-object v1

    .line 84
    :cond_8
    sub-int/2addr v2, v8

    .line 85
    add-int/lit8 v4, v4, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_9
    if-eqz v3, :cond_a

    .line 89
    .line 90
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0

    .line 95
    :cond_a
    neg-int p0, v2

    .line 96
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method public static p(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/SinceKotlin;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    invoke-static {p0, v0}, Lkotlin/text/StringsKt__StringNumberConversionsKt;->q(Ljava/lang/String;I)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static final q(Ljava/lang/String;I)Ljava/lang/Long;
    .locals 20
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/SinceKotlin;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/text/CharsKt__CharJVMKt;->checkRadix(I)I

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    return-object v3

    .line 19
    :cond_0
    const/4 v4, 0x0

    .line 20
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    const/16 v6, 0x30

    .line 25
    .line 26
    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->e(II)I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    if-gez v6, :cond_4

    .line 36
    .line 37
    const/4 v6, 0x1

    .line 38
    if-ne v2, v6, :cond_1

    .line 39
    .line 40
    return-object v3

    .line 41
    :cond_1
    const/16 v9, 0x2b

    .line 42
    .line 43
    if-eq v5, v9, :cond_3

    .line 44
    .line 45
    const/16 v4, 0x2d

    .line 46
    .line 47
    if-eq v5, v4, :cond_2

    .line 48
    .line 49
    return-object v3

    .line 50
    :cond_2
    const-wide/high16 v7, -0x8000000000000000L

    .line 51
    .line 52
    move v4, v6

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    move/from16 v19, v6

    .line 55
    .line 56
    move v6, v4

    .line 57
    move/from16 v4, v19

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    move v6, v4

    .line 61
    :goto_0
    const-wide v9, -0x38e38e38e38e38eL    # -2.772000429909333E291

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    const-wide/16 v11, 0x0

    .line 67
    .line 68
    move-wide v13, v9

    .line 69
    :goto_1
    if-ge v4, v2, :cond_9

    .line 70
    .line 71
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    invoke-static {v5, v1}, Lkotlin/text/CharsKt__CharJVMKt;->a(CI)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-gez v5, :cond_5

    .line 80
    .line 81
    return-object v3

    .line 82
    :cond_5
    cmp-long v15, v11, v13

    .line 83
    .line 84
    if-gez v15, :cond_6

    .line 85
    .line 86
    cmp-long v13, v13, v9

    .line 87
    .line 88
    if-nez v13, :cond_7

    .line 89
    .line 90
    int-to-long v13, v1

    .line 91
    div-long v13, v7, v13

    .line 92
    .line 93
    cmp-long v15, v11, v13

    .line 94
    .line 95
    if-gez v15, :cond_6

    .line 96
    .line 97
    return-object v3

    .line 98
    :cond_6
    move-object v15, v3

    .line 99
    move/from16 v16, v4

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_7
    return-object v3

    .line 103
    :goto_2
    int-to-long v3, v1

    .line 104
    mul-long/2addr v11, v3

    .line 105
    int-to-long v3, v5

    .line 106
    add-long v17, v7, v3

    .line 107
    .line 108
    cmp-long v5, v11, v17

    .line 109
    .line 110
    if-gez v5, :cond_8

    .line 111
    .line 112
    return-object v15

    .line 113
    :cond_8
    sub-long/2addr v11, v3

    .line 114
    add-int/lit8 v4, v16, 0x1

    .line 115
    .line 116
    move-object v3, v15

    .line 117
    goto :goto_1

    .line 118
    :cond_9
    if-eqz v6, :cond_a

    .line 119
    .line 120
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    return-object v0

    .line 125
    :cond_a
    neg-long v0, v11

    .line 126
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    return-object v0
.end method

.method public static toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/SinceKotlin;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    invoke-static {p0, v0}, Lkotlin/text/StringsKt__StringNumberConversionsKt;->o(Ljava/lang/String;I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
