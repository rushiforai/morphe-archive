.class public final synthetic Luk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ligi;


# direct methods
.method public synthetic constructor <init>(Ligi;B)V
    .registers 3

    iput-byte p2, p0, Luk5;->a:B

    iput-object p1, p0, Luk5;->b:Ligi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Luk5;->a:B

    iget-object p0, p0, Luk5;->b:Ligi;

    check-cast p1, Ltw7;

    packed-switch v0, :pswitch_data_8a

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_1b

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Lp58;

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    :cond_1b
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_34

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ly5j;

    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2c
    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    goto :goto_37

    :cond_34
    invoke-static {}, Lh9o;->p()V

    :goto_37
    return-void

    :pswitch_38
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_4a

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Lp58;

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_54

    :cond_4a
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_5c

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    :goto_54
    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    goto :goto_5f

    :cond_5c
    invoke-static {}, Lh9o;->p()V

    :goto_5f
    return-void

    :pswitch_60
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_74

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_7e

    :cond_74
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_86

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    :goto_7e
    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    goto :goto_89

    :cond_86
    invoke-static {}, Lh9o;->p()V

    :goto_89
    return-void

    :pswitch_data_8a
    .packed-switch 0x0
        :pswitch_60
        :pswitch_38
    .end packed-switch
.end method
