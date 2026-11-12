.class public final synthetic Lo00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsrg;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lo00;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lgpk;)V
    .registers 2

    const/16 p1, 0xa

    iput-byte p1, p0, Lo00;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 6

    iget-byte p0, p0, Lo00;->a:B

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p0, :pswitch_data_7e

    check-cast p1, Lvun;

    iget-object p0, p1, Lvun;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v0, v1

    :cond_11
    if-ge v0, p1, :cond_2c

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    check-cast v3, Luun;

    iget-boolean v3, v3, Luun;->b:Z

    if-nez v3, :cond_11

    goto :goto_2b

    :pswitch_20
    check-cast p1, Look;

    iget-byte p0, p1, Look;->e:B

    const/4 p1, 0x7

    if-eq p0, p1, :cond_2b

    const/16 p1, 0x8

    if-ne p0, p1, :cond_2c

    :cond_2b
    :goto_2b
    move v1, v2

    :cond_2c
    xor-int/2addr v1, v2

    return v1

    :pswitch_2e
    check-cast p1, Ljzj;

    return v2

    :pswitch_31
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_39
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_41
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_49
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_51
    check-cast p1, Lgyj;

    iget-boolean p0, p1, Lgyj;->e:Z

    return p0

    :pswitch_56
    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_5b

    move v1, v2

    :cond_5b
    return v1

    :pswitch_5c
    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_65

    move v1, v2

    :cond_65
    return v1

    :pswitch_66
    check-cast p1, Ldn5;

    iget-boolean p0, p1, Ldn5;->d:Z

    return p0

    :pswitch_6b
    check-cast p1, Llgh;

    iget-object p0, p1, Llgh;->c:Ljava/util/List;

    if-eqz p0, :cond_76

    iget p0, p1, Llgh;->a:I

    if-eq p0, v0, :cond_76

    move v1, v2

    :cond_76
    return v1

    :pswitch_77
    check-cast p1, Lw06;

    invoke-static {p1, v0}, Ls00;->q(Lw06;I)Z

    move-result p0

    return p0

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_77
        :pswitch_6b
        :pswitch_66
        :pswitch_5c
        :pswitch_56
        :pswitch_51
        :pswitch_49
        :pswitch_41
        :pswitch_39
        :pswitch_31
        :pswitch_2e
        :pswitch_20
    .end packed-switch
.end method
