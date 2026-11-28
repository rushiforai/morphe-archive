.class public abstract Lcom/google/common/escape/CharEscaper;
.super Lcom/google/common/escape/Escaper;
.source "CharEscaper.java"


# static fields
.field private static final DEST_PAD_MULTIPLIER:I = 0x2


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 47
    invoke-direct {p0}, Lcom/google/common/escape/Escaper;-><init>()V

    return-void
.end method

.method private static growBuffer([CII)[C
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "dest",
            "index",
            "size"
        }
    .end annotation

    if-ltz p2, :cond_1

    .line 171
    new-array p2, p2, [C

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 173
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2

    .line 169
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "Cannot increase internal buffer any further"

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "string"
        }
    .end annotation

    .line 58
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 62
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/common/escape/CharEscaper;->escape(C)[C

    move-result-object v2

    if-eqz v2, :cond_0

    .line 63
    invoke-virtual {p0, p1, v1}, Lcom/google/common/escape/CharEscaper;->escapeSlow(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p1
.end method

.method protected abstract escape(C)[C
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation
.end method

.method final escapeInternal(C)[C
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .line 87
    invoke-virtual {p0, p1}, Lcom/google/common/escape/CharEscaper;->escape(C)[C

    move-result-object p0

    return-object p0
.end method

.method protected final escapeSlow(Ljava/lang/String;I)Ljava/lang/String;
    .registers 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "s",
            "index"
        }
    .end annotation

    .line 102
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 105
    invoke-static {}, Lcom/google/common/escape/Platform;->charBufferFromThreadLocal()[C

    move-result-object v1

    .line 106
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge p2, v0, :cond_4

    .line 115
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {p0, v6}, Lcom/google/common/escape/CharEscaper;->escape(C)[C

    move-result-object v6

    if-eqz v6, :cond_3

    .line 122
    array-length v7, v6

    sub-int v8, p2, v4

    add-int v9, v5, v8

    add-int v10, v9, v7

    if-ge v2, v10, :cond_0

    sub-int v2, v0, p2

    shl-int/lit8 v2, v2, 0x1

    add-int/2addr v2, v10

    .line 131
    invoke-static {v1, v5, v2}, Lcom/google/common/escape/CharEscaper;->growBuffer([CII)[C

    move-result-object v1

    :cond_0
    if-lez v8, :cond_1

    .line 136
    invoke-virtual {p1, v4, p2, v1, v5}, Ljava/lang/String;->getChars(II[CI)V

    move v5, v9

    :cond_1
    if-lez v7, :cond_2

    .line 142
    invoke-static {v6, v3, v1, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v5, v7

    :cond_2
    add-int/lit8 v4, p2, 0x1

    :cond_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_4
    sub-int p0, v0, v4

    if-lez p0, :cond_6

    add-int/2addr p0, v5

    if-ge v2, p0, :cond_5

    .line 155
    invoke-static {v1, v5, p0}, Lcom/google/common/escape/CharEscaper;->growBuffer([CII)[C

    move-result-object p2

    move-object v1, p2

    .line 157
    :cond_5
    invoke-virtual {p1, v4, v0, v1, v5}, Ljava/lang/String;->getChars(II[CI)V

    move v5, p0

    .line 160
    :cond_6
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v3, v5}, Ljava/lang/String;-><init>([CII)V

    return-object p0
.end method
