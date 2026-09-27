.class Lkotlin/text/StringsKt__StringNumberConversionsKt;
.super Lkotlin/text/StringsKt__StringNumberConversionsJVMKt;
.source "StringNumberConversions.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0000\n\u0002\u0010\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\n\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0001\n\u0002\u0008\u0002\u001a#\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\u0003\u001a+\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\t\u001a#\u0010\n\u001a\u0004\u0018\u00010\u000b*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\u000c\u001a+\u0010\n\u001a\u0004\u0018\u00010\u000b*\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\r\u001a#\u0010\u000e\u001a\u0004\u0018\u00010\u0008*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\u000f\u001a+\u0010\u000e\u001a\u0004\u0018\u00010\u0008*\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\u0010\u001a#\u0010\u0011\u001a\u0004\u0018\u00010\u0012*\u00020\u0002H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\u0013\u001a+\u0010\u0011\u001a\u0004\u0018\u00010\u0012*\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u00a2\u0006\u0002\u0010\u0014\u001a\u0012\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0002H\u0080\u0080\u0004\u00a8\u0006\u0018"
    }
    d2 = {
        "toByteOrNull",
        "",
        "",
        "(Ljava/lang/String;)Ljava/lang/Byte;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.1",
        "radix",
        "",
        "(Ljava/lang/String;I)Ljava/lang/Byte;",
        "toShortOrNull",
        "",
        "(Ljava/lang/String;)Ljava/lang/Short;",
        "(Ljava/lang/String;I)Ljava/lang/Short;",
        "toIntOrNull",
        "(Ljava/lang/String;)Ljava/lang/Integer;",
        "(Ljava/lang/String;I)Ljava/lang/Integer;",
        "toLongOrNull",
        "",
        "(Ljava/lang/String;)Ljava/lang/Long;",
        "(Ljava/lang/String;I)Ljava/lang/Long;",
        "numberFormatError",
        "",
        "input",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x31
    xs = "kotlin/text/StringsKt"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lkotlin/text/StringsKt__StringNumberConversionsJVMKt;-><init>()V

    return-void
.end method

.method public static final numberFormatError(Ljava/lang/String;)Ljava/lang/Void;
    .registers 4

    const-string v0, "input"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 223
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid number format: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x27

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final toByteOrNull(Ljava/lang/String;)Ljava/lang/Byte;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0xa

    .line 22
    invoke-static {p0, v0}, Lkotlin/text/StringsKt;->toByteOrNull(Ljava/lang/String;I)Ljava/lang/Byte;

    move-result-object p0

    return-object p0
.end method

.method public static final toByteOrNull(Ljava/lang/String;I)Ljava/lang/Byte;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-static {p0, p1}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/16 v0, -0x80

    if-lt p0, v0, :cond_1f

    const/16 v0, 0x7f

    if-le p0, v0, :cond_19

    goto :goto_1f

    :cond_19
    int-to-byte p0, p0

    .line 34
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :cond_1f
    :goto_1f
    return-object p1
.end method

.method public static final toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0xa

    .line 72
    invoke-static {p0, v0}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static final toIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;
    .registers 12

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    invoke-static {p1}, Lkotlin/text/CharsKt;->checkRadix(I)I

    .line 84
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_10

    return-object v1

    :cond_10
    const/4 v2, 0x0

    .line 91
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    const v5, -0x7fffffff

    if-ge v3, v4, :cond_2f

    const/4 v4, 0x1

    if-ne v0, v4, :cond_20

    return-object v1

    :cond_20
    const/16 v6, 0x2b

    if-eq v3, v6, :cond_2d

    const/16 v5, 0x2d

    if-eq v3, v5, :cond_29

    return-object v1

    :cond_29
    const/high16 v5, -0x80000000

    move v3, v4

    goto :goto_31

    :cond_2d
    move v3, v2

    goto :goto_31

    :cond_2f
    move v3, v2

    move v4, v3

    :goto_31
    const v6, -0x38e38e3

    move v7, v6

    :goto_35
    if-ge v4, v0, :cond_55

    .line 117
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8, p1}, Lkotlin/text/CharsKt;->digitOf(CI)I

    move-result v8

    if-gez v8, :cond_42

    return-object v1

    :cond_42
    if-ge v2, v7, :cond_4b

    if-ne v7, v6, :cond_4a

    .line 122
    div-int v7, v5, p1

    if-ge v2, v7, :cond_4b

    :cond_4a
    return-object v1

    :cond_4b
    mul-int/2addr v2, p1

    add-int v9, v5, v8

    if-ge v2, v9, :cond_51

    return-object v1

    :cond_51
    sub-int/2addr v2, v8

    add-int/lit8 v4, v4, 0x1

    goto :goto_35

    :cond_55
    if-eqz v3, :cond_5c

    .line 139
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_5c
    neg-int p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static final toLongOrNull(Ljava/lang/String;)Ljava/lang/Long;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0xa

    .line 152
    invoke-static {p0, v0}, Lkotlin/text/StringsKt;->toLongOrNull(Ljava/lang/String;I)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static final toLongOrNull(Ljava/lang/String;I)Ljava/lang/Long;
    .registers 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    const-string v2, "<this>"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 162
    invoke-static {v1}, Lkotlin/text/CharsKt;->checkRadix(I)I

    .line 164
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_14

    return-object v3

    :cond_14
    const/4 v4, 0x0

    .line 171
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x30

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    if-ge v5, v6, :cond_39

    const/4 v6, 0x1

    if-ne v2, v6, :cond_26

    return-object v3

    :cond_26
    const/16 v9, 0x2b

    if-eq v5, v9, :cond_33

    const/16 v4, 0x2d

    if-eq v5, v4, :cond_2f

    return-object v3

    :cond_2f
    const-wide/high16 v7, -0x8000000000000000L

    move v4, v6

    goto :goto_3a

    :cond_33
    move/from16 v19, v6

    move v6, v4

    move/from16 v4, v19

    goto :goto_3a

    :cond_39
    move v6, v4

    :goto_3a
    const-wide v9, -0x38e38e38e38e38eL    # -2.772000429909333E291

    const-wide/16 v11, 0x0

    move-wide v13, v9

    :goto_42
    if-ge v4, v2, :cond_71

    .line 197
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v1}, Lkotlin/text/CharsKt;->digitOf(CI)I

    move-result v5

    if-gez v5, :cond_4f

    return-object v3

    :cond_4f
    cmp-long v15, v11, v13

    if-gez v15, :cond_5f

    cmp-long v13, v13, v9

    if-nez v13, :cond_5e

    int-to-long v13, v1

    .line 202
    div-long v13, v7, v13

    cmp-long v15, v11, v13

    if-gez v15, :cond_5f

    :cond_5e
    return-object v3

    :cond_5f
    move-object v15, v3

    move/from16 v16, v4

    int-to-long v3, v1

    mul-long/2addr v11, v3

    int-to-long v3, v5

    add-long v17, v7, v3

    cmp-long v5, v11, v17

    if-gez v5, :cond_6c

    return-object v15

    :cond_6c
    sub-long/2addr v11, v3

    add-int/lit8 v4, v16, 0x1

    move-object v3, v15

    goto :goto_42

    :cond_71
    if-eqz v6, :cond_78

    .line 219
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_78
    neg-long v0, v11

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static final toShortOrNull(Ljava/lang/String;)Ljava/lang/Short;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, 0xa

    .line 47
    invoke-static {p0, v0}, Lkotlin/text/StringsKt;->toShortOrNull(Ljava/lang/String;I)Ljava/lang/Short;

    move-result-object p0

    return-object p0
.end method

.method public static final toShortOrNull(Ljava/lang/String;I)Ljava/lang/Short;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    invoke-static {p0, p1}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/16 v0, -0x8000

    if-lt p0, v0, :cond_1f

    const/16 v0, 0x7fff

    if-le p0, v0, :cond_19

    goto :goto_1f

    :cond_19
    int-to-short p0, p0

    .line 59
    invoke-static {p0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p0

    return-object p0

    :cond_1f
    :goto_1f
    return-object p1
.end method
