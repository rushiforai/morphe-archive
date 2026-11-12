.class public Lvv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwv8;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lvv8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lyz;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lvv8;->a:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_24

    check-cast p1, Lgnf;

    iget-object p0, p1, Lgnf;->u:Lbie;

    iget-object p0, p0, Lbie;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqhe;

    if-eqz p0, :cond_1e

    iget-object p0, p0, Lqhe;->a:Landroid/net/Uri;

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    if-eqz p0, :cond_22

    move-object v0, p0

    :cond_22
    :pswitch_22
    return-object v0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final b(Lyz;)D
    .registers 4

    iget-byte p0, p0, Lvv8;->a:B

    const-wide/16 v0, 0x0

    packed-switch p0, :pswitch_data_26

    check-cast p1, Lgnf;

    iget-object p0, p1, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_1e

    iget-object p0, p0, Lc4p;->m:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    if-eqz p0, :cond_25

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    :cond_25
    :pswitch_25
    return-wide v0

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method

.method public c(Lyz;)Ljava/lang/String;
    .registers 3

    iget-byte p0, p0, Lvv8;->a:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_14

    check-cast p1, Lgnf;

    iget-object p0, p1, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->f()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_12

    move-object v0, p0

    :cond_12
    :pswitch_12
    return-object v0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public e(Lyz;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte p0, p0, Lvv8;->a:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_24

    check-cast p1, Lgnf;

    iget-object p0, p1, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_1e

    iget-object p0, p0, Lc4p;->n:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    if-eqz p0, :cond_22

    move-object v0, p0

    :cond_22
    :pswitch_22
    return-object v0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final f(Lyz;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte p0, p0, Lvv8;->a:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_14

    check-cast p1, Lgnf;

    iget-object p0, p1, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->c()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_12

    move-object v0, p0

    :cond_12
    :pswitch_12
    return-object v0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public g(Lyz;)Ljava/lang/CharSequence;
    .registers 3

    iget-byte p0, p0, Lvv8;->a:B

    const-string v0, ""

    packed-switch p0, :pswitch_data_24

    check-cast p1, Lgnf;

    iget-object p0, p1, Lgnf;->u:Lbie;

    invoke-virtual {p0}, Lbie;->b()Lo7p;

    move-result-object p0

    invoke-virtual {p0}, Lo7p;->j()Lc4p;

    move-result-object p0

    if-eqz p0, :cond_1e

    iget-object p0, p0, Lc4p;->i:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    if-eqz p0, :cond_22

    move-object v0, p0

    :cond_22
    :pswitch_22
    return-object v0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method
