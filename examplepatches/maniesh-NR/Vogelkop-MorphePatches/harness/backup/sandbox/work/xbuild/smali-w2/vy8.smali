.class public final synthetic Lvy8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lox8;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luue;

.field public final synthetic c:Lmsh;


# direct methods
.method public synthetic constructor <init>(Luue;Lmsh;B)V
    .registers 4

    iput-byte p3, p0, Lvy8;->a:B

    iput-object p1, p0, Lvy8;->b:Luue;

    iput-object p2, p0, Lvy8;->c:Lmsh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final f(Ljava/util/List;)V
    .registers 7

    iget-byte v0, p0, Lvy8;->a:B

    const/16 v1, 0x9c4

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lvy8;->c:Lmsh;

    iget-object p0, p0, Lvy8;->b:Luue;

    packed-switch v0, :pswitch_data_8a

    if-nez p1, :cond_11

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_11
    invoke-virtual {p0}, Luue;->u0()Lr9i;

    move-result-object v0

    iget-object v0, v0, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Luqe;

    invoke-virtual {v0, v4, p1, v3, v2}, Luqe;->j(Lmsh;Ljava/util/List;ZZ)V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_31

    iget-object p0, p0, Luue;->o:Ljava/lang/Object;

    check-cast p0, Lrl3;

    new-instance p1, Lglj;

    const v0, 0x7f141275

    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Lrl3;->f(Lo93;)V

    :cond_31
    return-void

    :pswitch_32
    if-nez p1, :cond_36

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_36
    invoke-virtual {p0}, Luue;->u0()Lr9i;

    move-result-object v0

    iget-object v0, v0, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Luqe;

    invoke-virtual {v0, v4, p1, v2}, Luqe;->k(Lmsh;Ljava/util/List;Z)V

    iget-object v0, v0, Luqe;->h:Luy8;

    invoke-virtual {v0, v4, p1, v3}, Luy8;->k(Lmsh;Ljava/util/List;Z)V

    iget-object p0, p0, Luue;->o:Ljava/lang/Object;

    check-cast p0, Lrl3;

    new-instance p1, Lglj;

    instance-of v0, v4, Lure;

    if-eqz v0, :cond_54

    const v0, 0x7f14035e

    goto :goto_57

    :cond_54
    const v0, 0x7f14035a

    :goto_57
    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Lrl3;->f(Lo93;)V

    return-void

    :pswitch_5e
    if-nez p1, :cond_62

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_62
    invoke-virtual {p0}, Luue;->u0()Lr9i;

    move-result-object v0

    iget-object v0, v0, Lr9i;->b:Ljava/lang/Object;

    check-cast v0, Luqe;

    invoke-virtual {v0, v4, p1, v2}, Luqe;->k(Lmsh;Ljava/util/List;Z)V

    iget-object v0, v0, Luqe;->h:Luy8;

    invoke-virtual {v0, v4, p1, v3}, Luy8;->k(Lmsh;Ljava/util/List;Z)V

    iget-object p0, p0, Luue;->o:Ljava/lang/Object;

    check-cast p0, Lrl3;

    new-instance p1, Lglj;

    instance-of v0, v4, Lure;

    if-eqz v0, :cond_80

    const v0, 0x7f140773

    goto :goto_83

    :cond_80
    const v0, 0x7f140771

    :goto_83
    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Lrl3;->f(Lo93;)V

    return-void

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_32
    .end packed-switch
.end method
