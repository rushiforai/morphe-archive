.class public final synthetic Le5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Le5f;->a:B

    iput-object p1, p0, Le5f;->b:Ljava/lang/String;

    iput-object p2, p0, Le5f;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Le5f;->a:B

    const/4 v1, -0x1

    const/16 v2, 0x98b

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object v7, p0, Le5f;->c:Ljava/lang/String;

    iget-object p0, p0, Le5f;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_186

    check-cast p1, Lwa1;

    invoke-interface {p1, v5, p0}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {p1, v6, v7}, Lwa1;->w(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b
    check-cast p1, Landroid/content/Intent;

    const-string v0, "android.intent.extra.TEXT"

    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "android.intent.extra.SUBJECT"

    invoke-virtual {p1, p0, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "android.intent.extra.TITLE"

    invoke-virtual {p1, p0, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "text/plain"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_34
    check-cast p1, Laq0;

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iget-object p1, p1, Laq0;->a:Lzp0;

    invoke-virtual {p1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_50

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_50

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v4, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_5d

    :cond_50
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v4, v6, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lif0;

    invoke-direct {v2, p1, v4, v1}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_5d
    invoke-virtual {v2, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_63
    check-cast p1, Lbk0;

    iget-object p1, p1, Lbk0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltn0;

    if-eqz p0, :cond_76

    iget-object v0, p1, Ltn0;->a:Lrn0;

    const/16 v1, 0x9

    invoke-virtual {v0, v1, p0}, Lrn0;->x(ILjava/lang/String;)V

    :cond_76
    if-eqz v7, :cond_7e

    iget-object p0, p1, Ltn0;->a:Lrn0;

    const/4 p1, 0x6

    invoke-virtual {p0, p1, v7}, Lrn0;->x(ILjava/lang/String;)V

    :cond_7e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_81
    check-cast p1, Lbk0;

    iget-object p1, p1, Lbk0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ltn0;

    if-eqz p0, :cond_92

    iget-object v0, p1, Ltn0;->a:Lrn0;

    invoke-virtual {v0, v4, p0}, Lrn0;->x(ILjava/lang/String;)V

    :cond_92
    if-eqz v7, :cond_99

    iget-object p0, p1, Ltn0;->a:Lrn0;

    invoke-virtual {p0, v3, v7}, Lrn0;->x(ILjava/lang/String;)V

    :cond_99
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_9c
    check-cast p1, Lak0;

    iget-object p1, p1, Lak0;->g:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lms0;

    iget-object v0, p1, Lms0;->a:Lks0;

    invoke-virtual {v0, v5, p0}, Lks0;->x(ILjava/lang/String;)V

    iget-object p0, p1, Lms0;->a:Lks0;

    invoke-virtual {p0, v6, v7}, Lks0;->x(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b3
    check-cast p1, Llt0;

    iget-object v0, p1, Llt0;->a:Lkt0;

    invoke-virtual {v0, v5, p0}, Lkt0;->x(ILjava/lang/String;)V

    iget-object p0, p1, Llt0;->a:Lkt0;

    invoke-virtual {p0, v6, v7}, Lkt0;->x(ILjava/lang/String;)V

    const-string p1, "2.32.0"

    invoke-virtual {p0, v4, p1}, Lkt0;->x(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c7
    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->c()Ltb0;

    move-result-object p1

    new-instance v0, Le5f;

    const/4 v4, 0x5

    invoke-direct {v0, p0, v7, v4}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    iget-object p0, p1, Ltb0;->a:Lzpa;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lkt0;

    invoke-direct {p0, v2, v1, v3}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltb0;->b:Lq56;

    const/16 v1, 0xd

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_f5

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_f5

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_102

    :cond_f5
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v1, v6, v2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_102
    invoke-virtual {v3, p0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    new-instance p1, Llt0;

    invoke-direct {p1, p0}, Llt0;-><init>(Lkt0;)V

    invoke-virtual {v0, p1}, Le5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_110
    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object p1, p1, Ltd0;->d:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Laf0;

    iget-object v0, p1, Laf0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lbf0;

    invoke-direct {v0, v2, v1, v4}, Ljf0;-><init>(III)V

    iget-object p1, p1, Laf0;->b:Lze0;

    invoke-virtual {p1, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_13e

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_13e

    new-instance v2, Lhf0;

    invoke-direct {v2, p1, v5, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_14b

    :cond_13e
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v5, v6, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lhf0;

    invoke-direct {v2, p1, v5, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_14b
    invoke-virtual {v2, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-eqz p0, :cond_153

    invoke-virtual {v0, v5, p0}, Lbf0;->x(ILjava/lang/String;)V

    :cond_153
    invoke-virtual {v0, v6, v7}, Lbf0;->x(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_159
    check-cast p1, Ljk0;

    new-instance v0, Ltx0;

    const/16 v1, 0x18

    invoke-direct {v0, v7, v1}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p1, p0, v0}, Ljk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_168
    check-cast p1, Ljk0;

    new-instance v0, Ltx0;

    const/16 v1, 0x1a

    invoke-direct {v0, v7, v1}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p1, p0, v0}, Ljk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_177
    check-cast p1, Ljk0;

    new-instance v0, Ltx0;

    const/16 v1, 0x19

    invoke-direct {v0, v7, v1}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-virtual {p1, p0, v0}, Ljk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_186
    .packed-switch 0x0
        :pswitch_177
        :pswitch_168
        :pswitch_159
        :pswitch_110
        :pswitch_c7
        :pswitch_b3
        :pswitch_9c
        :pswitch_81
        :pswitch_63
        :pswitch_34
        :pswitch_1b
    .end packed-switch
.end method
