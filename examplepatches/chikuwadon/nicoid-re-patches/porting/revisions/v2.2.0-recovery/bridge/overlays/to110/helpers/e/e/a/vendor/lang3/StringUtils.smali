.class public abstract Le/e/a/vendor/lang3/StringUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 222
    const-string v0, "\\p{InCombiningDiacriticalMarks}+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    return-void
.end method

.method public static isEmpty(Ljava/lang/String;)Z
    .registers 1

    if-eqz p0, :cond_0

    .line 3637
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public static leftPad(Ljava/lang/String;C)Ljava/lang/String;
    .registers 8

    if-eqz p0, :cond_a

    .line 5248
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-le v1, v0, :cond_a

    .line 5251
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    rsub-int/lit8 v0, v0, 0x4

    if-lez v0, :cond_3

    const/16 v2, 0x2000

    if-le v0, v2, :cond_8

    .line 5256
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    .line 5290
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v1, v0, :cond_3

    .line 5293
    invoke-static {p1}, Le/e/a/vendor/lang3/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5294
    const-string p1, " "

    .line 5296
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 5297
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    rsub-int/lit8 v3, v1, 0x4

    if-lez v3, :cond_3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v0, v5, :cond_1

    if-gt v3, v2, :cond_1

    .line 5303
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p0, p1}, Le/e/a/vendor/lang3/StringUtils;->leftPad(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 5306
    :cond_1
    rem-int v2, v3, v0

    if-lez v2, :cond_2

    .line 7739
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_2

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v2

    if-eqz v2, :cond_2

    rsub-int/lit8 v3, v1, 0x3

    :cond_2
    if-gtz v3, :cond_4

    :cond_3
    return-object p0

    :cond_4
    if-ne v3, v0, :cond_5

    .line 5313
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    if-ge v3, v0, :cond_6

    .line 5316
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 5318
    :cond_6
    new-array v1, v3, [C

    .line 5319
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    :goto_0
    if-ge v4, v3, :cond_7

    .line 5321
    rem-int v2, v4, v0

    aget-char v2, p1, v2

    aput-char v2, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 5323
    :cond_7
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_8
    if-gtz v0, :cond_9

    .line 6189
    const-string p1, ""

    goto :goto_1

    .line 6191
    :cond_9
    new-instance v1, Ljava/lang/String;

    new-array v0, v0, [C

    .line 129
    invoke-static {v0, p1}, Ljava/util/Arrays;->fill([CC)V

    .line 6191
    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    move-object p1, v1

    .line 5258
    :goto_1
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_a
    return-object p0
.end method
