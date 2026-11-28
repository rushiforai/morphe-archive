.class public abstract Lcom/google/common/escape/UnicodeEscaper;
.super Lcom/google/common/escape/Escaper;
.source "UnicodeEscaper.java"


# static fields
.field private static final DEST_PAD:I = 0x20


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 61
    invoke-direct {p0}, Lcom/google/common/escape/Escaper;-><init>()V

    return-void
.end method

.method protected static codePointAt(Ljava/lang/CharSequence;II)I
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "seq",
            "index",
            "end"
        }
    .end annotation

    .line 252
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-ge p1, p2, :cond_4

    add-int/lit8 v0, p1, 0x1

    .line 254
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const v2, 0xd800

    if-lt v1, v2, :cond_3

    const v2, 0xdfff

    if-gt v1, v2, :cond_3

    const v2, 0xdbff

    .line 258
    const-string v3, "\'"

    const-string v4, " in \'"

    const-string v5, " at index "

    const-string v6, "\' with value "

    if-gt v1, v2, :cond_2

    if-ne v0, p2, :cond_0

    neg-int p0, v1

    return p0

    .line 264
    :cond_0
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    .line 265
    invoke-static {p1}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 266
    invoke-static {v1, p1}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result p0

    return p0

    .line 268
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected low surrogate but got char \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 279
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected low surrogate character \'"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    return v1

    .line 291
    :cond_4
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    const-string p1, "Index exceeds specified range"

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static codePointAtInternal(Ljava/lang/CharSequence;II)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "seq",
            "index",
            "end"
        }
    .end annotation

    .line 295
    invoke-static {p0, p1, p2}, Lcom/google/common/escape/UnicodeEscaper;->codePointAt(Ljava/lang/CharSequence;II)I

    move-result p0

    return p0
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

    .line 306
    new-array p2, p2, [C

    if-lez p1, :cond_0

    const/4 v0, 0x0

    .line 308
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object p2

    .line 304
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "Cannot increase internal buffer any further"

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "string"
        }
    .end annotation

    .line 108
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    .line 110
    invoke-virtual {p0, p1, v1, v0}, Lcom/google/common/escape/UnicodeEscaper;->nextEscapeIndex(Ljava/lang/CharSequence;II)I

    move-result v1

    if-ne v1, v0, :cond_0

    return-object p1

    .line 111
    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/google/common/escape/UnicodeEscaper;->escapeSlow(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method protected abstract escape(I)[C
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cp"
        }
    .end annotation
.end method

.method final escapeInternal(I)[C
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cp"
        }
    .end annotation

    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/escape/UnicodeEscaper;->escape(I)[C

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

    .line 164
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 167
    invoke-static {}, Lcom/google/common/escape/Platform;->charBufferFromThreadLocal()[C

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_0
    if-ge p2, v0, :cond_5

    .line 172
    invoke-static {p1, p2, v0}, Lcom/google/common/escape/UnicodeEscaper;->codePointAt(Ljava/lang/CharSequence;II)I

    move-result v5

    if-ltz v5, :cond_4

    .line 179
    invoke-virtual {p0, v5}, Lcom/google/common/escape/UnicodeEscaper;->escape(I)[C

    move-result-object v6

    .line 180
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v5, p2

    if-eqz v6, :cond_3

    sub-int v7, p2, v3

    add-int v8, v4, v7

    .line 186
    array-length v9, v6

    add-int/2addr v9, v8

    .line 187
    array-length v10, v1

    if-ge v10, v9, :cond_0

    sub-int v10, v0, p2

    add-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x20

    .line 189
    invoke-static {v1, v4, v9}, Lcom/google/common/escape/UnicodeEscaper;->growBuffer([CII)[C

    move-result-object v1

    :cond_0
    if-lez v7, :cond_1

    .line 193
    invoke-virtual {p1, v3, p2, v1, v4}, Ljava/lang/String;->getChars(II[CI)V

    move v4, v8

    .line 196
    :cond_1
    array-length p2, v6

    if-lez p2, :cond_2

    .line 197
    array-length p2, v6

    invoke-static {v6, v2, v1, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    array-length p2, v6

    add-int/2addr v4, p2

    :cond_2
    move v3, v5

    .line 203
    :cond_3
    invoke-virtual {p0, p1, v5, v0}, Lcom/google/common/escape/UnicodeEscaper;->nextEscapeIndex(Ljava/lang/CharSequence;II)I

    move-result p2

    goto :goto_0

    .line 174
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Trailing high surrogate at end of input"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    sub-int p0, v0, v3

    if-lez p0, :cond_7

    add-int/2addr p0, v4

    .line 211
    array-length p2, v1

    if-ge p2, p0, :cond_6

    .line 212
    invoke-static {v1, v4, p0}, Lcom/google/common/escape/UnicodeEscaper;->growBuffer([CII)[C

    move-result-object p2

    move-object v1, p2

    .line 214
    :cond_6
    invoke-virtual {p1, v3, v0, v1, v4}, Ljava/lang/String;->getChars(II[CI)V

    move v4, p0

    .line 217
    :cond_7
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2, v4}, Ljava/lang/String;-><init>([CII)V

    return-object p0
.end method

.method protected nextEscapeIndex(Ljava/lang/CharSequence;II)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "csq",
            "start",
            "end"
        }
    .end annotation

    :goto_0
    if-ge p2, p3, :cond_0

    .line 139
    invoke-static {p1, p2, p3}, Lcom/google/common/escape/UnicodeEscaper;->codePointAt(Ljava/lang/CharSequence;II)I

    move-result v0

    if-ltz v0, :cond_0

    .line 140
    invoke-virtual {p0, v0}, Lcom/google/common/escape/UnicodeEscaper;->escape(I)[C

    move-result-object v1

    if-nez v1, :cond_0

    .line 143
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr p2, v0

    goto :goto_0

    :cond_0
    return p2
.end method
