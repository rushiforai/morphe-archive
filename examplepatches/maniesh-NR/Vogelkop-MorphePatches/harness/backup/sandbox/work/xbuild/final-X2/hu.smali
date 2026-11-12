.class public final Lhu;
.super Lft;
.source "SourceFile"


# instance fields
.field public final synthetic h:B


# direct methods
.method public synthetic constructor <init>(Lumi;Lkotlin/jvm/functions/Function1;IB)V
    .registers 5

    iput-byte p4, p0, Lhu;->h:B

    invoke-direct {p0, p1, p2, p3}, Lft;-><init>(Lumi;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lhu;->h:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_8e

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_19
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llq8;

    iget-object v1, v0, Llq8;->b:Ljava/lang/String;

    new-instance v3, Lqxh;

    invoke-direct {v3, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object v4, v0, Llq8;->d:Ljava/lang/String;

    iget-object v9, v0, Llq8;->e:Ljava/lang/String;

    iget-object v5, v0, Llq8;->c:Ljava/lang/String;

    sget-object v7, Lht;->b:Lht;

    iget-object v8, v0, Llq8;->f:Ljava/util/Set;

    new-instance v2, Lst;

    const/4 v10, 0x0

    const/16 v11, 0x188

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v11}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_43
    return-object p0

    :pswitch_44
    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ld82;

    invoke-direct {v0, p1, v1}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Ly2;

    invoke-direct {p1, p0}, Ly2;-><init>(Lhu;)V

    invoke-static {v0, p1}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object p0

    new-instance p1, Ly2;

    const/16 v0, 0xe

    invoke-direct {p1, v0}, Ly2;-><init>(B)V

    new-instance v0, Lm2m;

    invoke-direct {v0, p0, p1}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_67
    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    new-instance p0, Ld82;

    invoke-direct {p0, p1, v1}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lyg9;

    const/16 v0, 0x9

    invoke-direct {p1, v0}, Lyg9;-><init>(B)V

    new-instance v0, Lec7;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lec7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Ly2;

    const/16 p1, 0xc

    invoke-direct {p0, p1}, Ly2;-><init>(B)V

    new-instance p1, Lm2m;

    invoke-direct {p1, v0, p0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    invoke-static {p1}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_data_8e
    .packed-switch 0x0
        :pswitch_67
        :pswitch_44
    .end packed-switch
.end method
