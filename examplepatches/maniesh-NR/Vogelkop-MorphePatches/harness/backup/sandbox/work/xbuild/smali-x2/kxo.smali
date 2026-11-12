.class public final Lkxo;
.super Lboo;
.source "SourceFile"


# instance fields
.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lkxo;->b:B

    invoke-direct {p0}, Lboo;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lsj2;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lkxo;->b:B

    packed-switch v0, :pswitch_data_13e

    invoke-virtual {p1}, Lsj2;->a()V

    move-object p0, p1

    check-cast p0, Labp;

    invoke-virtual {p0}, Labp;->l()Ljava/lang/Character;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_132

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    const/16 v2, 0x5c

    if-ne v0, v2, :cond_132

    invoke-virtual {p0}, Labp;->l()Ljava/lang/Character;

    move-result-object v0

    if-eqz v0, :cond_132

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x62

    const/16 v5, 0x8

    if-ne v3, v4, :cond_30

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    goto/16 :goto_137

    :cond_30
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x74

    if-ne v3, v4, :cond_40

    const/16 p0, 0x9

    :goto_3a
    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    goto/16 :goto_137

    :cond_40
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x6e

    if-ne v3, v4, :cond_4b

    const/16 p0, 0xa

    goto :goto_3a

    :cond_4b
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x76

    if-ne v3, v4, :cond_56

    const/16 p0, 0xb

    goto :goto_3a

    :cond_56
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x66

    if-ne v3, v4, :cond_61

    const/16 p0, 0xc

    goto :goto_3a

    :cond_61
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x72

    if-ne v3, v4, :cond_6c

    const/16 p0, 0xd

    goto :goto_3a

    :cond_6c
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x22

    if-eq v3, v4, :cond_7c

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_82

    :cond_7c
    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    goto/16 :goto_137

    :cond_82
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    if-ne v3, v2, :cond_8e

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    goto/16 :goto_137

    :cond_8e
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    const/16 v3, 0x78

    const/16 v4, 0x10

    const/4 v6, 0x0

    if-ne v2, v3, :cond_c2

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    :goto_a2
    const/4 v2, 0x2

    if-ge v6, v2, :cond_b3

    invoke-virtual {p1}, Lsj2;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    if-eqz v2, :cond_132

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_a2

    :cond_b3
    :try_start_b3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v2
    :try_end_bf
    .catch Ljava/lang/NumberFormatException; {:try_start_b3 .. :try_end_bf} :catch_132

    if-eqz v2, :cond_136

    goto :goto_12c

    :cond_c2
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    const/16 v3, 0x75

    if-ne v2, v3, :cond_f3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    :goto_d3
    const/4 v2, 0x4

    if-ge v6, v2, :cond_e4

    invoke-virtual {p1}, Lsj2;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    if-eqz v2, :cond_132

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_d3

    :cond_e4
    :try_start_e4
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v2
    :try_end_f0
    .catch Ljava/lang/NumberFormatException; {:try_start_e4 .. :try_end_f0} :catch_132

    if-eqz v2, :cond_136

    goto :goto_12c

    :cond_f3
    invoke-static {v0}, Labp;->k(Ljava/lang/Character;)Z

    move-result v2

    if-eqz v2, :cond_136

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Labp;->l()Ljava/lang/Character;

    move-result-object v3

    invoke-static {v3}, Labp;->k(Ljava/lang/Character;)Z

    move-result v4

    if-eqz v4, :cond_118

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Labp;->l()Ljava/lang/Character;

    move-result-object v3

    invoke-static {v3}, Labp;->k(Ljava/lang/Character;)Z

    move-result p0

    if-nez p0, :cond_11b

    :cond_118
    iput-object v3, p1, Lsj2;->d:Ljava/lang/Object;

    goto :goto_11e

    :cond_11b
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_11e
    :try_start_11e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v2

    if-eqz v2, :cond_136

    :goto_12c
    int-to-char p0, p0

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1
    :try_end_131
    .catch Ljava/lang/NumberFormatException; {:try_start_11e .. :try_end_131} :catch_132

    goto :goto_137

    :catch_132
    :cond_132
    invoke-virtual {p1}, Lsj2;->h()V

    goto :goto_137

    :cond_136
    move-object v1, v0

    :goto_137
    return-object v1

    :pswitch_138
    invoke-virtual {p0, p1}, Lkxo;->c(Lsj2;)Ljava/lang/Character;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_138
    .end packed-switch
.end method

.method public final c(Lsj2;)Ljava/lang/Character;
    .registers 8

    invoke-virtual {p1}, Lsj2;->a()V

    move-object v0, p1

    check-cast v0, Labp;

    invoke-virtual {v0}, Labp;->l()Ljava/lang/Character;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_95

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    const/16 v3, 0x5c

    if-ne v1, v3, :cond_95

    invoke-virtual {v0}, Labp;->l()Ljava/lang/Character;

    move-result-object v1

    if-eqz v1, :cond_95

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v3

    if-eqz v3, :cond_90

    const/16 v4, 0xa

    if-eq v3, v4, :cond_90

    const/16 v5, 0xc

    if-eq v3, v5, :cond_90

    const/16 v5, 0xd

    if-eq v3, v5, :cond_83

    invoke-static {v1}, Labp;->j(Ljava/lang/Character;)Z

    move-result p0

    if-nez p0, :cond_34

    return-object v1

    :cond_34
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_3d
    const/4 v3, 0x5

    if-ge v1, v3, :cond_5e

    invoke-virtual {v0}, Labp;->l()Ljava/lang/Character;

    move-result-object v3

    if-eqz v3, :cond_5e

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_5e

    invoke-static {v3}, Labp;->j(Ljava/lang/Character;)Z

    move-result v4

    if-eqz v4, :cond_5c

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_3d

    :cond_5c
    iput-object v3, p1, Lsj2;->d:Ljava/lang/Object;

    :cond_5e
    :try_start_5e
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x10

    invoke-static {p0, p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result p1

    if-eqz p1, :cond_74

    int-to-char p0, p0

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0

    return-object p0

    :cond_74
    const p0, 0xfffd

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0
    :try_end_7b
    .catch Ljava/lang/NumberFormatException; {:try_start_5e .. :try_end_7b} :catch_7c

    return-object p0

    :catch_7c
    move-exception p0

    const-string p1, "Received a NumberFormateException parsing a string verified to be hex"

    invoke-static {p1, p0}, Lh9o;->m(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v2

    :cond_83
    invoke-static {v4}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-virtual {p1, v1}, Lsj2;->b(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_90

    invoke-virtual {v0}, Labp;->l()Ljava/lang/Character;

    :cond_90
    invoke-virtual {p0, p1}, Lkxo;->c(Lsj2;)Ljava/lang/Character;

    move-result-object p0

    return-object p0

    :cond_95
    invoke-virtual {p1}, Lsj2;->h()V

    return-object v2
.end method
