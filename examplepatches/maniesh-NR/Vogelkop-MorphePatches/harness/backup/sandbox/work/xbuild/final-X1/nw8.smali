.class public final synthetic Lnw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxw8;


# direct methods
.method public synthetic constructor <init>(Lxw8;B)V
    .registers 3

    iput-byte p2, p0, Lnw8;->a:B

    iput-object p1, p0, Lnw8;->b:Lxw8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lnw8;->a:B

    iget-object p0, p0, Lnw8;->b:Lxw8;

    packed-switch v0, :pswitch_data_4c

    iget-object v0, p0, Lxw8;->j:Lf92;

    iget-object v1, p0, Lxw8;->l:Ljava/lang/Object;

    invoke-virtual {v0}, Lf92;->d()Ld53;

    move-result-object v2

    invoke-virtual {v2, v1}, Ld53;->k(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_45

    iget-object v2, p0, Lxw8;->h:Low8;

    iget-object v2, v2, Lha2;->a:Ljava/util/ArrayList;

    invoke-static {v2}, Lnb6;->R(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_24
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lja2;

    instance-of v5, v5, Lj82;

    if-eqz v5, :cond_24

    goto :goto_38

    :cond_37
    move-object v3, v4

    :goto_38
    check-cast v3, Lj82;

    if-eqz v3, :cond_40

    check-cast v3, Lpue;

    iget-object v4, v3, Lj82;->c:Loqe;

    :cond_40
    iget-object p0, p0, Lxw8;->k:Lv82;

    invoke-virtual {v0, v1, v4, p0}, Lf92;->e(Ljava/lang/Object;Loqe;Lw82;)V

    :cond_45
    return-void

    :pswitch_46
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lxw8;->e(IZ)V

    return-void

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_46
    .end packed-switch
.end method
