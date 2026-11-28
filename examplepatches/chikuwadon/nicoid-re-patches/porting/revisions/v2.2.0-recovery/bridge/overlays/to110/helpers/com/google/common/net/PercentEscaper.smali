.class public final Lcom/google/common/net/PercentEscaper;
.super Lcom/google/common/escape/UnicodeEscaper;
.source "PercentEscaper.java"


# static fields
.field private static final plusSign:[C

.field private static final upperHexDigits:[C


# instance fields
.field private final plusForSpace:Z

.field private final safeOctets:[Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    .line 58
    new-array v0, v0, [C

    const/16 v1, 0x2b

    const/4 v2, 0x0

    aput-char v1, v0, v2

    sput-object v0, Lcom/google/common/net/PercentEscaper;->plusSign:[C

    const/16 v0, 0x10

    .line 61
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/common/net/PercentEscaper;->upperHexDigits:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "safeChars",
            "plusForSpace"
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Lcom/google/common/escape/UnicodeEscaper;-><init>()V

    .line 89
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v0, ".*[0-9A-Za-z].*"

    .line 92
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Alphanumeric characters are always \'safe\' and should not be explicitly specified"

    .line 91
    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p2, :cond_0

    .line 97
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "plusForSpace cannot be specified when space is a \'safe\' character"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 101
    :cond_0
    iput-boolean p2, p0, Lcom/google/common/net/PercentEscaper;->plusForSpace:Z

    .line 102
    invoke-static {p1}, Lcom/google/common/net/PercentEscaper;->createSafeOctets(Ljava/lang/String;)[Z

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/net/PercentEscaper;->safeOctets:[Z

    return-void
.end method

.method private static createSafeOctets(Ljava/lang/String;)[Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "safeChars"
        }
    .end annotation

    .line 112
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    .line 113
    array-length v0, p0

    const/4 v1, -0x1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    aget-char v4, p0, v3

    .line 114
    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    add-int/2addr v1, v0

    .line 116
    new-array v1, v1, [Z

    .line 117
    array-length v3, p0

    :goto_1
    if-ge v2, v3, :cond_1

    aget-char v4, p0, v2

    .line 118
    aput-boolean v0, v1, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-object v1
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .line 145
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 148
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 149
    iget-object v3, p0, Lcom/google/common/net/PercentEscaper;->safeOctets:[Z

    array-length v4, v3

    if-ge v2, v4, :cond_0

    aget-boolean v2, v3, v2

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 150
    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/google/common/net/PercentEscaper;->escapeSlow(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    return-object p1
.end method

.method protected escape(I)[C
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cp"
        }
    .end annotation

    .line 161
    iget-object v0, p0, Lcom/google/common/net/PercentEscaper;->safeOctets:[Z

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/16 v0, 0x20

    if-ne p1, v0, :cond_1

    .line 163
    iget-boolean p0, p0, Lcom/google/common/net/PercentEscaper;->plusForSpace:Z

    if-eqz p0, :cond_1

    .line 164
    sget-object p0, Lcom/google/common/net/PercentEscaper;->plusSign:[C

    return-object p0

    :cond_1
    const/16 p0, 0x7f

    const/4 v0, 0x1

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x4

    const/16 v4, 0x25

    const/4 v5, 0x3

    if-gt p1, p0, :cond_2

    .line 168
    new-array p0, v5, [C

    .line 169
    aput-char v4, p0, v2

    .line 170
    sget-object v2, Lcom/google/common/net/PercentEscaper;->upperHexDigits:[C

    and-int/lit8 v4, p1, 0xf

    aget-char v4, v2, v4

    aput-char v4, p0, v1

    ushr-int/2addr p1, v3

    .line 171
    aget-char p1, v2, p1

    aput-char p1, p0, v0

    return-object p0

    :cond_2
    const/16 p0, 0x7ff

    const/4 v6, 0x5

    const/16 v7, 0xc

    const/16 v8, 0xa

    const/4 v9, 0x6

    const/16 v10, 0x8

    if-gt p1, p0, :cond_3

    .line 176
    new-array p0, v9, [C

    .line 177
    aput-char v4, p0, v2

    .line 178
    aput-char v4, p0, v5

    .line 179
    sget-object v2, Lcom/google/common/net/PercentEscaper;->upperHexDigits:[C

    and-int/lit8 v4, p1, 0xf

    aget-char v4, v2, v4

    aput-char v4, p0, v6

    ushr-int/lit8 v4, p1, 0x4

    and-int/2addr v4, v5

    or-int/2addr v4, v10

    .line 181
    aget-char v4, v2, v4

    aput-char v4, p0, v3

    ushr-int/lit8 v3, p1, 0x6

    and-int/lit8 v3, v3, 0xf

    .line 183
    aget-char v3, v2, v3

    aput-char v3, p0, v1

    ushr-int/2addr p1, v8

    or-int/2addr p1, v7

    .line 185
    aget-char p1, v2, p1

    aput-char p1, p0, v0

    return-object p0

    :cond_3
    const p0, 0xffff

    const/16 v11, 0x9

    const/4 v12, 0x7

    if-gt p1, p0, :cond_4

    .line 190
    new-array p0, v11, [C

    .line 191
    aput-char v4, p0, v2

    const/16 v2, 0x45

    .line 192
    aput-char v2, p0, v0

    .line 193
    aput-char v4, p0, v5

    .line 194
    aput-char v4, p0, v9

    .line 195
    sget-object v0, Lcom/google/common/net/PercentEscaper;->upperHexDigits:[C

    and-int/lit8 v2, p1, 0xf

    aget-char v2, v0, v2

    aput-char v2, p0, v10

    ushr-int/lit8 v2, p1, 0x4

    and-int/2addr v2, v5

    or-int/2addr v2, v10

    .line 197
    aget-char v2, v0, v2

    aput-char v2, p0, v12

    ushr-int/lit8 v2, p1, 0x6

    and-int/lit8 v2, v2, 0xf

    .line 199
    aget-char v2, v0, v2

    aput-char v2, p0, v6

    ushr-int/lit8 v2, p1, 0xa

    and-int/2addr v2, v5

    or-int/2addr v2, v10

    .line 201
    aget-char v2, v0, v2

    aput-char v2, p0, v3

    ushr-int/2addr p1, v7

    .line 203
    aget-char p1, v0, p1

    aput-char p1, p0, v1

    return-object p0

    :cond_4
    const p0, 0x10ffff

    if-gt p1, p0, :cond_5

    .line 206
    new-array p0, v7, [C

    .line 209
    aput-char v4, p0, v2

    const/16 v2, 0x46

    .line 210
    aput-char v2, p0, v0

    .line 211
    aput-char v4, p0, v5

    .line 212
    aput-char v4, p0, v9

    .line 213
    aput-char v4, p0, v11

    .line 214
    sget-object v0, Lcom/google/common/net/PercentEscaper;->upperHexDigits:[C

    and-int/lit8 v2, p1, 0xf

    aget-char v2, v0, v2

    const/16 v4, 0xb

    aput-char v2, p0, v4

    ushr-int/lit8 v2, p1, 0x4

    and-int/2addr v2, v5

    or-int/2addr v2, v10

    .line 216
    aget-char v2, v0, v2

    aput-char v2, p0, v8

    ushr-int/lit8 v2, p1, 0x6

    and-int/lit8 v2, v2, 0xf

    .line 218
    aget-char v2, v0, v2

    aput-char v2, p0, v10

    ushr-int/lit8 v2, p1, 0xa

    and-int/2addr v2, v5

    or-int/2addr v2, v10

    .line 220
    aget-char v2, v0, v2

    aput-char v2, p0, v12

    ushr-int/lit8 v2, p1, 0xc

    and-int/lit8 v2, v2, 0xf

    .line 222
    aget-char v2, v0, v2

    aput-char v2, p0, v6

    ushr-int/lit8 v2, p1, 0x10

    and-int/2addr v2, v5

    or-int/2addr v2, v10

    .line 224
    aget-char v2, v0, v2

    aput-char v2, p0, v3

    ushr-int/lit8 p1, p1, 0x12

    and-int/2addr p1, v12

    .line 226
    aget-char p1, v0, p1

    aput-char p1, p0, v1

    return-object p0

    .line 230
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid unicode character value "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method protected nextEscapeIndex(Ljava/lang/CharSequence;II)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "csq",
            "index",
            "end"
        }
    .end annotation

    .line 129
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    if-ge p2, p3, :cond_0

    .line 131
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 132
    iget-object v1, p0, Lcom/google/common/net/PercentEscaper;->safeOctets:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_0

    aget-boolean v0, v1, v0

    if-eqz v0, :cond_0

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return p2
.end method
