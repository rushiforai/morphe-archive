.class public final synthetic Lj12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;B)V
    .registers 3

    iput-byte p2, p0, Lj12;->a:B

    iput-object p1, p0, Lj12;->b:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lj12;->a:B

    sget-object v1, Laf9;->c:Laf9;

    sget-object v2, Laf9;->a:Laf9;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object p0, p0, Lj12;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_d6

    check-cast p1, Ldy1;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_21

    if-ne p1, v5, :cond_1e

    sget-object p1, Lxrn;->a:Lxrn;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_21

    :cond_1e
    invoke-static {}, Lh9o;->p()V

    :cond_21
    :goto_21
    return-void

    :pswitch_22
    check-cast p1, Laln;

    if-eqz p1, :cond_2f

    new-instance v0, Lomn;

    invoke-direct {v0, p1}, Lomn;-><init>(Laln;)V

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_37

    :cond_2f
    new-instance p1, Lpmn;

    invoke-direct {p1, v5}, Lpmn;-><init>(B)V

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_37
    return-void

    :pswitch_38
    check-cast p1, Lb0k;

    iget p1, p1, Lb0k;->b:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_44
    check-cast p1, Ljava/util/List;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ln2g;

    invoke-direct {v2, v0, v1}, Ln2g;-><init>(J)V

    invoke-static {p1, v2}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object p1

    invoke-static {p1}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_5b
    check-cast p1, Lc3g;

    if-eqz p1, :cond_69

    iget-wide v0, p1, Lc3g;->b:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_6a

    :cond_69
    move-object v4, p1

    :cond_6a
    invoke-interface {p0, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_6e
    check-cast p1, Ljava/util/List;

    new-instance v0, Lj7m;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x2

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lj7m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_86
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_8f

    move-object v1, v2

    :cond_8f
    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_93
    check-cast p1, Lq43;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_9b
    check-cast p1, Lq43;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_a3
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_ac

    move-object v1, v2

    :cond_ac
    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_b0
    check-cast p1, Lq43;

    if-eqz p0, :cond_b7

    invoke-interface {p0, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_b7
    return-void

    :pswitch_b8
    if-eqz p1, :cond_bb

    move v3, v5

    :cond_bb
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_c3
    check-cast p1, Ljava/lang/Boolean;

    invoke-interface {p0, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_c9
    check-cast p1, Landroid/net/Uri;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_cf
    check-cast p1, Landroid/net/Uri;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_d6
    .packed-switch 0x0
        :pswitch_cf
        :pswitch_c9
        :pswitch_c3
        :pswitch_b8
        :pswitch_b0
        :pswitch_a3
        :pswitch_9b
        :pswitch_93
        :pswitch_86
        :pswitch_6e
        :pswitch_5b
        :pswitch_44
        :pswitch_38
        :pswitch_22
    .end packed-switch
.end method
