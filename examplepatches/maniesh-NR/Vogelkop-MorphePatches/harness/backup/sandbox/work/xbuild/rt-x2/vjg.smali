.class public final synthetic Lvjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lakg;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lakg;Ljava/util/ArrayList;Ljava/util/ArrayList;B)V
    .registers 5

    iput-byte p4, p0, Lvjg;->a:B

    iput-object p1, p0, Lvjg;->b:Lakg;

    iput-object p2, p0, Lvjg;->c:Ljava/util/ArrayList;

    iput-object p3, p0, Lvjg;->d:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lvjg;->a:B

    iget-object v1, p0, Lvjg;->d:Ljava/util/ArrayList;

    iget-object v2, p0, Lvjg;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Lvjg;->b:Lakg;

    check-cast p1, Likg;

    packed-switch v0, :pswitch_data_dc

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-nez p1, :cond_5f

    iget-object p1, p0, Lakg;->l:Ljava/lang/Object;

    check-cast p1, Lxbf;

    iget-object p1, p1, Lxbf;->e:Ljava/lang/Object;

    check-cast p1, Ljjg;

    iget-object p1, p1, Ljjg;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iget-object p1, p1, Ltjg;->n:Ljx6;

    invoke-virtual {p1}, Ljx6;->d()Lbx6;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lax6;

    invoke-direct {v1, v0}, Lax6;-><init>(Lbx6;)V

    const/4 v0, 0x0

    :goto_2e
    iget-object v2, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v2, Lsvb;

    iget-object v2, v2, Lsvb;->g:Ljava/lang/Object;

    check-cast v2, Lpr;

    iget v3, v2, Lpr;->a:I

    const/4 v4, 0x0

    if-ge v0, v3, :cond_53

    iget-object v3, v2, Lpr;->b:Ljava/lang/Object;

    check-cast v3, [I

    aget v3, v3, v0

    const/4 v5, 0x3

    if-ne v3, v5, :cond_50

    iget-object p0, v2, Lpr;->c:Ljava/lang/Object;

    check-cast p0, [Lfyl;

    aget-object p0, p0, v0

    if-eqz p0, :cond_53

    invoke-virtual {v1, v0, p0, v4}, Lax6;->o(ILfyl;Lcx6;)V

    goto :goto_53

    :cond_50
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    :cond_53
    :goto_53
    invoke-virtual {v1, v4}, Lax6;->n(Ljava/lang/String;)V

    new-instance p0, Lbx6;

    invoke-direct {p0, v1}, Lbx6;-><init>(Lax6;)V

    invoke-virtual {p1, p0}, Ljx6;->k(Lnyl;)V

    goto :goto_71

    :cond_5f
    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzjg;

    new-instance v0, Lodf;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lodf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Lakg;->u(Lzjg;Lodf;)V

    :goto_71
    return-void

    :pswitch_72
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzjg;

    new-instance v0, Lodf;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lodf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Lakg;->u(Lzjg;Lodf;)V

    return-void

    :pswitch_87
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzjg;

    new-instance v0, Lcx6;

    iget v1, p1, Lzjg;->d:I

    iget v2, p1, Lzjg;->e:I

    filled-new-array {v2}, [I

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcx6;-><init>(I[I)V

    iget-object p0, p0, Lakg;->l:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object p0, p0, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Ljjg;

    iget-object p0, p0, Ljjg;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    iget-object p0, p0, Ltjg;->n:Ljx6;

    invoke-virtual {p0}, Ljx6;->d()Lbx6;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lax6;

    invoke-direct {v2, v1}, Lax6;-><init>(Lbx6;)V

    iget v1, p1, Lzjg;->b:I

    iget-object v3, p1, Lzjg;->c:Lfyl;

    invoke-virtual {v2, v1, v3, v0}, Lax6;->o(ILfyl;Lcx6;)V

    iget-object p1, p1, Lzjg;->a:Loj9;

    iget p1, p1, Loj9;->u:I

    const/4 v0, -0x1

    const v1, 0x7fffffff

    if-ne p1, v0, :cond_ce

    iput v1, v2, Lmyl;->a:I

    iput v1, v2, Lmyl;->b:I

    goto :goto_d2

    :cond_ce
    iput p1, v2, Lmyl;->a:I

    iput v1, v2, Lmyl;->b:I

    :goto_d2
    new-instance p1, Lbx6;

    invoke-direct {p1, v2}, Lbx6;-><init>(Lax6;)V

    invoke-virtual {p0, p1}, Ljx6;->k(Lnyl;)V

    return-void

    nop

    :pswitch_data_dc
    .packed-switch 0x0
        :pswitch_87
        :pswitch_72
    .end packed-switch
.end method
