.class abstract Lnicoid/network238/kotlin/text/StringsKt__StringNumberConversionsKt;
.super Lnicoid/network238/kotlin/text/StringsKt__StringNumberConversionsJVMKt;
.source "SourceFile"


# direct methods
.method public static toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    const/16 v0, 0xa

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/text/StringsKt__StringNumberConversionsKt;->toIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static final toIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;
    .registers 11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    invoke-static {p1}, Lnicoid/network238/kotlin/text/CharsKt__CharJVMKt;->checkRadix(I)I

    .line 84
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_5

    .line 91
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 92
    const/16 v3, 0x30

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v3

    const v4, -0x7fffffff

    if-gez v3, :cond_3

    const/4 v3, 0x1

    if-eq v0, v3, :cond_0

    const/16 v5, 0x2b

    if-eq v2, v5, :cond_2

    const/16 v4, 0x2d

    if-eq v2, v4, :cond_1

    :cond_0
    goto :goto_2

    :cond_1
    const/high16 v4, -0x80000000

    move v2, v3

    goto :goto_0

    :cond_2
    move v2, v3

    move v3, v1

    goto :goto_0

    :cond_3
    move v2, v1

    move v3, v2

    :goto_0
    const v5, -0x38e38e3

    move v6, v5

    :goto_1
    if-ge v2, v0, :cond_7

    .line 117
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7, p1}, Lnicoid/network238/kotlin/text/CharsKt__CharJVMKt;->digitOf(CI)I

    move-result v7

    if-ltz v7, :cond_5

    if-ge v1, v6, :cond_4

    if-ne v6, v5, :cond_5

    .line 122
    div-int v6, v4, p1

    if-lt v1, v6, :cond_5

    :cond_4
    mul-int/2addr v1, p1

    add-int v8, v4, v7

    if-ge v1, v8, :cond_6

    :cond_5
    :goto_2
    const/4 p0, 0x0

    return-object p0

    :cond_6
    sub-int/2addr v1, v7

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_7
    if-eqz v3, :cond_8

    .line 139
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_8
    neg-int p0, v1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
