.class public final synthetic Lo62;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbqb;
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;B)V
    .registers 3

    iput-byte p2, p0, Lo62;->a:B

    iput-object p1, p0, Lo62;->b:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lo62;->a:B

    iget-object p0, p0, Lo62;->b:Lkotlin/jvm/functions/Function1;

    packed-switch v0, :pswitch_data_2c

    check-cast p1, Lz37;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_14
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_19
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1e
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    check-cast p1, Ljava/lang/String;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_23
        :pswitch_1e
        :pswitch_19
        :pswitch_14
        :pswitch_f
    .end packed-switch
.end method

.method public final n(Ltw7;)V
    .registers 10

    instance-of v0, p1, Lrw7;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    goto/16 :goto_7c

    :cond_d
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_8e

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lx32;

    if-eqz p1, :cond_8a

    instance-of v0, p1, Lv32;

    const-string v2, ""

    if-eqz v0, :cond_78

    check-cast p1, Lv32;

    iget-object p1, p1, Lv32;->a:Lgu4;

    iget-object v0, p1, Lgu4;->b:Ljava/lang/String;

    iget-object p1, p1, Lgu4;->i:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_37
    if-ge v4, v3, :cond_71

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lmu4;

    iget-object v6, v5, Lmu4;->a:Lou4;

    iget-object v5, v5, Lmu4;->b:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_6d

    const/4 v7, 0x1

    if-eq v6, v7, :cond_64

    const/4 v7, 0x2

    if-eq v6, v7, :cond_5e

    const/4 v7, 0x3

    if-ne v6, v7, :cond_5a

    new-instance v6, Lcw0;

    invoke-direct {v6, v5}, Lcw0;-><init>(Ljava/lang/String;)V

    goto :goto_69

    :cond_5a
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_5e
    new-instance v6, Ldw0;

    invoke-direct {v6, v5}, Ldw0;-><init>(Ljava/lang/String;)V

    goto :goto_69

    :cond_64
    new-instance v6, Lcw0;

    invoke-direct {v6, v5}, Lcw0;-><init>(Ljava/lang/String;)V

    :goto_69
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_37

    :cond_6d
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_71
    new-instance p1, Latn;

    invoke-direct {p1, v0, v1}, Latn;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    move-object v1, p1

    goto :goto_7c

    :cond_78
    instance-of v0, p1, Lw32;

    if-eqz v0, :cond_82

    :goto_7c
    iget-object p0, p0, Lo62;->b:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_82
    instance-of p0, p1, Ly32;

    if-eqz p0, :cond_8a

    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_8a
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_8e
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
