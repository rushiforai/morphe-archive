.class public final Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;
.super Ljava/lang/Object;
.source "CaptionLanguageMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;
    }
.end annotation


# direct methods
.method public static synthetic $r8$lambda$NFJY13ynnvSKTolw-M4KxBIZdOo([B)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->label([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$RO-vMFvPYFHow-FcmOfkJYHwirM([B)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->code([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addSimplified([B)[B
    .registers 15

    if-eqz p0, :cond_16a

    .line 9
    array-length v0, p0

    const/high16 v1, 0x100000

    if-le v0, v1, :cond_9

    goto/16 :goto_16a

    .line 11
    :cond_9
    :try_start_9
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->fields([B)Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, v3

    :cond_19
    :goto_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-eqz v6, :cond_47

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    iget v10, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    if-ne v10, v7, :cond_19

    iget v7, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    if-ne v7, v8, :cond_19

    iget-object v7, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v7, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    invoke-static {v7}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->code([B)Ljava/lang/String;

    move-result-object v7

    .line 13
    invoke-static {v7}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->rank(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v9, :cond_42

    move v5, v9

    :cond_42
    if-nez v4, :cond_19

    iget-object v4, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    goto :goto_19

    :cond_47
    if-nez v4, :cond_4b

    goto/16 :goto_16a

    :cond_4b
    const/4 v2, 0x4

    if-nez v5, :cond_a0

    .line 15
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 16
    const-string v6, "zh-Hans"

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v6, v10}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-static {v5, v9, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 17
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->simplifiedLabel()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v10, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v10

    invoke-static {v6, v2, v10}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-static {v5, v8, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    .line 18
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->fields([B)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7f
    :goto_7f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_99

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    iget v10, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    if-eq v10, v9, :cond_7f

    iget v10, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    if-eq v10, v8, :cond_7f

    iget-object v6, v6, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->raw:[B

    invoke-virtual {v5, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_7f

    :cond_99
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_a0
    move v4, v3

    .line 19
    :goto_a1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_115

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->code([B)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->rank(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v9, :cond_112

    .line 20
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 21
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->simplifiedLabel()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v10, v11}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v10

    invoke-static {v6, v2, v10}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    .line 23
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [B

    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->fields([B)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move v11, v3

    :cond_dd
    :goto_dd
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_102

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    iget v13, v12, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    if-ne v13, v8, :cond_fc

    iget v13, v12, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    if-ne v13, v8, :cond_fc

    if-nez v11, :cond_dd

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    invoke-static {v5, v8, v11}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    move v11, v9

    goto :goto_dd

    :cond_fc
    iget-object v12, v12, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->raw:[B

    invoke-virtual {v5, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_dd

    :cond_102
    if-nez v11, :cond_10b

    .line 24
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-static {v5, v8, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    :cond_10b
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_112
    add-int/lit8 v4, v4, 0x1

    goto :goto_a1

    .line 26
    :cond_115
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$$ExternalSyntheticLambda0;-><init>()V

    new-instance v4, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$$ExternalSyntheticLambda1;

    invoke-direct {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v1, v2, v4}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->insertSimplified(Ljava/util/List;Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/List;

    move-result-object v1

    .line 27
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 28
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_12c
    :goto_12c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_15e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    iget v5, v4, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    if-ne v5, v7, :cond_158

    iget v5, v4, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    if-ne v5, v8, :cond_158

    if-nez v3, :cond_12c

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_146
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_156

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    invoke-static {v2, v7, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->write(Ljava/io/ByteArrayOutputStream;I[B)V

    goto :goto_146

    :cond_156
    move v3, v9

    goto :goto_12c

    :cond_158
    iget-object v4, v4, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->raw:[B

    invoke-virtual {v2, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_12c

    .line 29
    :cond_15e
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-static {p0, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1
    :try_end_166
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_166} :catch_16a

    if-eqz v1, :cond_169

    goto :goto_16a

    :cond_169
    return-object v0

    :catch_16a
    :cond_16a
    :goto_16a
    return-object p0
.end method

.method private static code([B)Ljava/lang/String;
    .registers 4

    .line 37
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->fields([B)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    iget v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_8

    iget v1, v0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_8

    new-instance p0, Ljava/lang/String;

    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p0

    :cond_28
    const-string p0, ""

    return-object p0
.end method

.method static fields([B)Ljava/util/List;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;",
            ">;"
        }
    .end annotation

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput v3, v2, v3

    .line 55
    :goto_b
    aget v4, v2, v3

    array-length v5, p0

    if-ge v4, v5, :cond_8b

    .line 56
    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->read([B[I)J

    move-result-wide v5

    const/4 v7, 0x3

    ushr-long v7, v5, v7

    long-to-int v7, v7

    const-wide/16 v8, 0x7

    and-long/2addr v5, v8

    long-to-int v5, v5

    if-lez v7, :cond_83

    if-nez v5, :cond_24

    .line 59
    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->read([B[I)J

    goto :goto_36

    :cond_24
    if-ne v5, v1, :cond_2d

    .line 60
    aget v6, v2, v3

    add-int/lit8 v6, v6, 0x8

    aput v6, v2, v3

    goto :goto_36

    :cond_2d
    const/4 v6, 0x5

    if-ne v5, v6, :cond_38

    .line 61
    aget v6, v2, v3

    add-int/lit8 v6, v6, 0x4

    aput v6, v2, v3

    :goto_36
    const/4 v6, 0x0

    goto :goto_57

    :cond_38
    const/4 v6, 0x2

    if-ne v5, v6, :cond_7b

    .line 63
    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->read([B[I)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-ltz v6, :cond_73

    .line 64
    array-length v6, p0

    aget v10, v2, v3

    sub-int/2addr v6, v10

    int-to-long v11, v6

    cmp-long v6, v8, v11

    if-gtz v6, :cond_73

    long-to-int v6, v8

    add-int/2addr v6, v10

    .line 65
    invoke-static {p0, v10, v6}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v8

    aput v6, v2, v3

    move-object v6, v8

    .line 67
    :goto_57
    aget v8, v2, v3

    array-length v9, p0

    if-gt v8, v9, :cond_6b

    .line 68
    new-instance v8, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    aget v9, v2, v3

    invoke-static {p0, v4, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v4

    invoke-direct {v8, v7, v5, v6, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;-><init>(II[B[B)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 67
    :cond_6b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "truncated fixed"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 64
    :cond_73
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "length"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 66
    :cond_7b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "unsupported wire type"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 57
    :cond_83
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "field zero"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8b
    return-object v0
.end method

.method private static label([B)Ljava/lang/String;
    .registers 7

    .line 33
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->fields([B)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    iget v2, v1, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_8

    iget v2, v1, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    if-ne v2, v3, :cond_8

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->fields([B)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_27
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;

    .line 34
    iget v4, v2, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->number:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_27

    iget v4, v2, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->wire:I

    if-ne v4, v3, :cond_27

    new-instance p0, Ljava/lang/String;

    iget-object v0, v2, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata$Field;->value:[B

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p0

    .line 35
    :cond_46
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->code([B)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->label(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static read([B[I)J
    .registers 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move v3, v2

    :goto_4
    const/16 v4, 0x40

    if-ge v3, v4, :cond_28

    .line 47
    aget v4, p1, v2

    array-length v5, p0

    if-ge v4, v5, :cond_20

    add-int/lit8 v5, v4, 0x1

    .line 48
    aput v5, p1, v2

    aget-byte v4, p0, v4

    and-int/lit8 v5, v4, 0x7f

    int-to-long v5, v5

    shl-long/2addr v5, v3

    or-long/2addr v0, v5

    and-int/lit16 v4, v4, 0x80

    if-nez v4, :cond_1d

    return-wide v0

    :cond_1d
    add-int/lit8 v3, v3, 0x7

    goto :goto_4

    .line 47
    :cond_20
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "truncated"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 51
    :cond_28
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "varint overflow"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static varint(Ljava/io/ByteArrayOutputStream;J)V
    .registers 7

    :goto_0
    const-wide/16 v0, -0x80

    and-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_15

    const-wide/16 v0, 0x7f

    and-long/2addr v0, p1

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    .line 42
    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/4 v0, 0x7

    ushr-long/2addr p1, v0

    goto :goto_0

    :cond_15
    long-to-int p1, p1

    invoke-virtual {p0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    return-void
.end method

.method static write(Ljava/io/ByteArrayOutputStream;I[B)V
    .registers 5

    shl-int/lit8 p1, p1, 0x3

    or-int/lit8 p1, p1, 0x2

    int-to-long v0, p1

    .line 39
    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->varint(Ljava/io/ByteArrayOutputStream;J)V

    array-length p1, p2

    int-to-long v0, p1

    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionLanguageMetadata;->varint(Ljava/io/ByteArrayOutputStream;J)V

    const/4 p1, 0x0

    array-length v0, p2

    invoke-virtual {p0, p2, p1, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    return-void
.end method
