.class public final Labp;
.super Lsj2;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    iput-byte p2, p0, Labp;->f:B

    invoke-direct {p0, p1}, Lsj2;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static j(Ljava/lang/Character;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result p0

    const/16 v0, 0x30

    if-lt p0, v0, :cond_c

    const/16 v0, 0x39

    if-le p0, v0, :cond_1c

    :cond_c
    const/16 v0, 0x61

    if-lt p0, v0, :cond_14

    const/16 v0, 0x66

    if-le p0, v0, :cond_1c

    :cond_14
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1e

    const/16 v0, 0x46

    if-gt p0, v0, :cond_1e

    :cond_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public static k(Ljava/lang/Character;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Character;->charValue()C

    move-result p0

    const/16 v1, 0x30

    if-lt p0, v1, :cond_12

    const/16 v1, 0x37

    if-gt p0, v1, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    return v0
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Labp;->f:B

    packed-switch v0, :pswitch_data_18

    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    iput-object v0, p0, Lsj2;->e:Ljava/lang/Object;

    iget v0, p0, Lsj2;->a:I

    iput v0, p0, Lsj2;->b:I

    return-void

    :pswitch_e
    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    iput-object v0, p0, Lsj2;->e:Ljava/lang/Object;

    iget v0, p0, Lsj2;->a:I

    iput v0, p0, Lsj2;->b:I

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final b(Ljava/lang/Object;)Z
    .registers 7

    iget-byte v0, p0, Labp;->f:B

    const/4 v1, 0x0

    iget-object v2, p0, Lsj2;->c:Ljava/lang/Object;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_6e

    check-cast p1, Ljava/lang/Character;

    check-cast v2, Ljava/lang/String;

    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    if-eqz v0, :cond_1d

    check-cast v0, Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result v4

    if-eq v0, v4, :cond_39

    :cond_1d
    if-eqz v2, :cond_3a

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3a

    iget v0, p0, Lsj2;->a:I

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_3a

    iget p0, p0, Lsj2;->a:I

    invoke-virtual {v2, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result p1

    if-ne p0, p1, :cond_3a

    :cond_39
    move v1, v3

    :cond_3a
    return v1

    :pswitch_3b
    check-cast p1, Ljava/lang/Integer;

    check-cast v2, Ljava/lang/String;

    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    if-eqz v0, :cond_4f

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq v0, v4, :cond_6b

    :cond_4f
    if-eqz v2, :cond_6c

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_6c

    iget v0, p0, Lsj2;->a:I

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_6c

    iget p0, p0, Lsj2;->a:I

    invoke-virtual {v2, p0}, Ljava/lang/String;->codePointAt(I)I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p0, p1, :cond_6c

    :cond_6b
    move v1, v3

    :cond_6c
    return v1

    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method

.method public final c()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Labp;->f:B

    iget-object v1, p0, Lsj2;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_52

    check-cast v1, Ljava/lang/String;

    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    if-eqz v0, :cond_12

    move-object v2, v0

    check-cast v2, Ljava/lang/Character;

    goto :goto_2c

    :cond_12
    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2c

    iget v0, p0, Lsj2;->a:I

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_2c

    iget p0, p0, Lsj2;->a:I

    invoke-virtual {v1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    :cond_2c
    :goto_2c
    return-object v2

    :pswitch_2d
    check-cast v1, Ljava/lang/String;

    iget-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    if-eqz v0, :cond_37

    move-object v2, v0

    check-cast v2, Ljava/lang/Integer;

    goto :goto_51

    :cond_37
    if-eqz v1, :cond_51

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_51

    iget v0, p0, Lsj2;->a:I

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_51

    iget p0, p0, Lsj2;->a:I

    invoke-virtual {v1, p0}, Ljava/lang/String;->codePointAt(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_51
    :goto_51
    return-object v2

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2d
    .end packed-switch
.end method

.method public final d()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Labp;->f:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_4c

    invoke-virtual {p0}, Labp;->l()Ljava/lang/Character;

    move-result-object p0

    if-eqz p0, :cond_13

    invoke-static {p0}, Labp;->j(Ljava/lang/Character;)Z

    move-result v0

    if-eqz v0, :cond_13

    move-object v1, p0

    :cond_13
    return-object v1

    :pswitch_14
    invoke-virtual {p0}, Labp;->m()Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_4b

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x30

    if-lt v0, v2, :cond_2a

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x39

    if-le v0, v2, :cond_4a

    :cond_2a
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x61

    if-lt v0, v2, :cond_3a

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x66

    if-le v0, v2, :cond_4a

    :cond_3a
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x41

    if-lt v0, v2, :cond_4b

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x46

    if-gt v0, v2, :cond_4b

    :cond_4a
    move-object v1, p0

    :cond_4b
    return-object v1

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method

.method public final f()Z
    .registers 5

    iget-byte v0, p0, Labp;->f:B

    packed-switch v0, :pswitch_data_26

    invoke-super {p0}, Lsj2;->f()Z

    move-result p0

    return p0

    :pswitch_a
    iget-object v0, p0, Lsj2;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lsj2;->d:Ljava/lang/Object;

    const/4 v2, 0x1

    if-nez v1, :cond_25

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_24

    iget p0, p0, Lsj2;->a:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt p0, v0, :cond_25

    :cond_24
    move v2, v1

    :cond_25
    return v2

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final h()V
    .registers 2

    iget-byte v0, p0, Labp;->f:B

    packed-switch v0, :pswitch_data_18

    iget-object v0, p0, Lsj2;->e:Ljava/lang/Object;

    iput-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    iget v0, p0, Lsj2;->b:I

    iput v0, p0, Lsj2;->a:I

    return-void

    :pswitch_e
    iget-object v0, p0, Lsj2;->e:Ljava/lang/Object;

    iput-object v0, p0, Lsj2;->d:Ljava/lang/Object;

    iget v0, p0, Lsj2;->b:I

    iput v0, p0, Lsj2;->a:I

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final l()Ljava/lang/Character;
    .registers 5

    iget-object v0, p0, Lsj2;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lsj2;->d:Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    check-cast v1, Ljava/lang/Character;

    iput-object v2, p0, Lsj2;->d:Ljava/lang/Object;

    return-object v1

    :cond_e
    if-nez v0, :cond_11

    return-object v2

    :cond_11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_18

    return-object v2

    :cond_18
    iget v1, p0, Lsj2;->a:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_21

    return-object v2

    :cond_21
    iget v1, p0, Lsj2;->a:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lsj2;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0

    return-object p0
.end method

.method public final m()Ljava/lang/Integer;
    .registers 5

    iget-object v0, p0, Lsj2;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lsj2;->d:Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    check-cast v1, Ljava/lang/Integer;

    iput-object v2, p0, Lsj2;->d:Ljava/lang/Object;

    return-object v1

    :cond_e
    if-nez v0, :cond_11

    return-object v2

    :cond_11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_18

    return-object v2

    :cond_18
    iget v1, p0, Lsj2;->a:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_21

    return-object v2

    :cond_21
    iget v1, p0, Lsj2;->a:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lsj2;->a:I

    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    add-int/2addr v0, v2

    iput v0, p0, Lsj2;->a:I

    return-object v1
.end method
