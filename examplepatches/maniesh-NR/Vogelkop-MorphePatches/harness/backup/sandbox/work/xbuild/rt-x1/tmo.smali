.class public final Ltmo;
.super Li7c;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltmo;->d:B

    iput-object p1, p0, Ltmo;->e:Ljava/lang/Object;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Li7c;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ltmo;->d:B

    const/4 v1, 0x0

    iget-object p0, p0, Ltmo;->e:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_da

    invoke-static {}, Lf1p;->a()Lf1p;

    move-result-object v0

    check-cast p0, Llxo;

    iget-object p0, p0, Llxo;->q:Lw6j;

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Ltmo;

    invoke-virtual {p0}, Li7c;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_20

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_28

    :cond_20
    iget-object v0, v0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Lb6p;

    invoke-virtual {v0, p0}, Lb6p;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_28
    return-object v1

    :pswitch_29
    invoke-static {}, Lf1p;->a()Lf1p;

    move-result-object v0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_36

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto/16 :goto_d8

    :cond_36
    iget-object v0, v0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Lb6p;

    sget-object v1, Lf1p;->d:[C

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    move v4, v3

    :goto_43
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_d4

    invoke-virtual {p0, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v6

    if-eqz v6, :cond_cd

    int-to-char v6, v5

    move v7, v3

    :goto_55
    const/4 v8, 0x5

    if-ge v7, v8, :cond_73

    aget-char v8, v1, v7

    if-ne v6, v8, :cond_70

    invoke-static {v5}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v6

    if-eqz v6, :cond_73

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    :goto_67
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_ca

    :cond_70
    add-int/lit8 v7, v7, 0x1

    goto :goto_55

    :cond_73
    const/16 v6, 0xff

    if-ge v5, v6, :cond_7c

    iget-object v6, v0, Lboo;->a:[Ljava/lang/String;

    aget-object v6, v6, v5

    goto :goto_80

    :cond_7c
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    :goto_80
    if-nez v6, :cond_8e

    invoke-static {v5}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v7

    if-eqz v7, :cond_8e

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_67

    :cond_8e
    const/16 v7, 0x1f

    if-gt v5, v7, :cond_9e

    const/16 v7, 0x9

    if-eq v5, v7, :cond_9e

    const/16 v7, 0xa

    if-eq v5, v7, :cond_9e

    const/16 v7, 0xd

    if-ne v5, v7, :cond_a6

    :cond_9e
    const/16 v7, 0x7f

    if-lt v5, v7, :cond_ac

    const/16 v7, 0x9f

    if-gt v5, v7, :cond_ac

    :cond_a6
    const-string v6, "fffd"

    const v7, 0xfffd

    goto :goto_ad

    :cond_ac
    move v7, v5

    :goto_ad
    sget-object v8, Lb6p;->b:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string v8, ";"

    if-eqz v7, :cond_c4

    const-string v6, "&"

    invoke-static {v6, v7, v8}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_ca

    :cond_c4
    const-string v7, "&#x"

    invoke-static {v7, v6, v8}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_ca
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_cd
    invoke-static {v5}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v4, v5

    goto/16 :goto_43

    :cond_d4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_d8
    return-object v1

    nop

    :pswitch_data_da
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
