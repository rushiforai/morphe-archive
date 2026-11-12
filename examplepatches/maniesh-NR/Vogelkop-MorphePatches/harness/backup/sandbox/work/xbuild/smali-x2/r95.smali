.class public final synthetic Lr95;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(BI)V
    .registers 3

    .line 9
    iput-byte p1, p0, Lr95;->a:B

    iput p2, p0, Lr95;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ILf58;)V
    .registers 3

    const/4 p2, 0x1

    iput-byte p2, p0, Lr95;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lr95;->b:I

    return-void
.end method

.method public synthetic constructor <init>(Lu6c;I)V
    .registers 3

    .line 10
    const/4 p1, 0x3

    iput-byte p1, p0, Lr95;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lr95;->b:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lr95;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget p0, p0, Lr95;->b:I

    packed-switch v0, :pswitch_data_124

    check-cast p1, Lyj0;

    iget-object v0, p1, Lyj0;->a:Lpsp;

    new-instance v0, Lfm0;

    const/16 v1, 0x879

    invoke-direct {v0, v1, v3, v5}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyj0;->b:Lt56;

    const/16 v1, 0x10

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_2f

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2f

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3c

    :cond_2f
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v1, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3c
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    int-to-long p0, p0

    invoke-virtual {v0, v4, v5, p0, p1}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_46
    check-cast p1, Lel0;

    const-wide/16 v0, 0x1

    iget-object v3, p1, Lel0;->a:Ldl0;

    invoke-virtual {v3, v5, v5, v0, v1}, Ljf0;->p(IIJ)V

    int-to-long v0, p0

    new-array p0, v5, [J

    aput-wide v0, p0, v4

    iget-object p1, p1, Lel0;->a:Ldl0;

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_6a

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6a

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_77

    :cond_6a
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v5, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_77
    new-instance p1, La82;

    invoke-direct {p1, p0, v5}, La82;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_82
    check-cast p1, Lq0j;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Tier "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lo0j;->d(Lq0j;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_98
    check-cast p1, Ls5c;

    invoke-static {}, Lbwg;->t()Lttj;

    move-result-object v0

    if-eqz v0, :cond_a4

    invoke-virtual {v0}, Lttj;->e()Lkotlin/jvm/functions/Function1;

    move-result-object v1

    :cond_a4
    invoke-static {v0}, Lbwg;->x(Lttj;)Lttj;

    move-result-object v5

    invoke-static {v0, v5, v1}, Lbwg;->A(Lttj;Lttj;Lkotlin/jvm/functions/Function1;)V

    iget v0, p1, Ls5c;->a:I

    if-eq v0, v3, :cond_b0

    move v2, v0

    :cond_b0
    :goto_b0
    if-ge v4, v2, :cond_ba

    add-int v0, p0, v4

    invoke-virtual {p1, v0}, Ls5c;->a(I)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_b0

    :cond_ba
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_bd
    check-cast p1, Lvg9;

    invoke-virtual {p1, p0}, Lvg9;->T0(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_c8
    const-string v0, "SELECT * FROM entry WHERE tabId = ?"

    check-cast p1, Losk;

    invoke-virtual {p1, v0}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object p1

    int-to-long v2, p0

    :try_start_d1
    invoke-virtual {p1, v5, v2, v3}, Lwsk;->T0(IJ)V

    const-string p0, "tabId"

    invoke-static {p1, p0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result p0

    const-string v0, "descriptionMedium"

    invoke-static {p1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "descriptionMini"

    invoke-static {p1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1}, Lwsk;->n()Z

    move-result v3

    if-eqz v3, :cond_107

    invoke-virtual {p1, p0}, Lwsk;->getLong(I)J

    move-result-wide v3

    long-to-int p0, v3

    invoke-virtual {p1, v0}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lauj;->j(Ljava/lang/String;)Ll7l;

    move-result-object v0

    invoke-virtual {p1, v2}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lauj;->j(Ljava/lang/String;)Ll7l;

    move-result-object v1

    new-instance v2, Lm7l;

    invoke-direct {v2, p0, v0, v1}, Lm7l;-><init>(ILl7l;Ll7l;)V
    :try_end_106
    .catchall {:try_start_d1 .. :try_end_106} :catchall_10b

    move-object v1, v2

    :cond_107
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    return-object v1

    :catchall_10b
    move-exception p0

    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    throw p0

    :pswitch_110
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    const-string v0, "Collection doesn\'t contain element at index "

    const/16 v1, 0x2e

    invoke-static {v0, p0, v1}, Lfki;->r(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_124
    .packed-switch 0x0
        :pswitch_110
        :pswitch_c8
        :pswitch_bd
        :pswitch_98
        :pswitch_82
        :pswitch_46
    .end packed-switch
.end method
