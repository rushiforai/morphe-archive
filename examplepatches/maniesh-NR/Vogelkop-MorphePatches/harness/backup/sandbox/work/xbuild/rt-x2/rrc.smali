.class public final synthetic Lrrc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lurc;


# direct methods
.method public synthetic constructor <init>(Lurc;B)V
    .registers 3

    iput-byte p2, p0, Lrrc;->a:B

    iput-object p1, p0, Lrrc;->b:Lurc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lrrc;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lrrc;->b:Lurc;

    packed-switch v0, :pswitch_data_1b2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lurc;->j:Lkze;

    if-eqz p1, :cond_16

    sget-object p1, Ltrc;->b:Ltrc;

    goto :goto_18

    :cond_16
    sget-object p1, Ltrc;->c:Ltrc;

    :goto_18
    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iput-boolean v2, p0, Lurc;->l:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_20
    check-cast p1, Lndc;

    iget-object p1, p0, Lurc;->d:Lxoc;

    iget-object v0, p1, Lxoc;->d:Ljava/util/HashMap;

    iget-object v3, p1, Lxoc;->c:Ljava/util/HashMap;

    iget-object v4, p1, Lxoc;->a:Lx5f;

    iget-object v5, v4, Lx5f;->d:Lzpa;

    iget-object v6, p1, Lxoc;->b:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_36
    :goto_36
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_76

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Set;

    check-cast v8, Ljava/lang/Iterable;

    invoke-static {v8}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v8

    iget-boolean v10, v4, Lx5f;->h:Z

    if-eqz v10, :cond_36

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    new-instance v11, Lck0;

    invoke-direct {v11, v5, v10}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v11}, Lck0;->e()Lhi0;

    move-result-object v11

    invoke-virtual {v11}, Lhi0;->a()Lvg0;

    move-result-object v11

    new-instance v12, Lfy5;

    const/4 v13, 0x2

    invoke-direct {v12, v8, v13}, Lfy5;-><init>(Ljava/util/List;B)V

    invoke-virtual {v11, v9, v12}, Lvg0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v10}, Lx5f;->U0(Lx56;)V

    goto :goto_36

    :cond_76
    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_81
    :goto_81
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Set;

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v7

    iget-boolean v9, v4, Lx5f;->h:Z

    if-eqz v9, :cond_81

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    new-instance v10, Lck0;

    invoke-direct {v10, v5, v9}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v10}, Lck0;->e()Lhi0;

    move-result-object v10

    invoke-virtual {v10}, Lhi0;->a()Lvg0;

    move-result-object v10

    new-instance v11, Lfy5;

    const/4 v12, 0x3

    invoke-direct {v11, v7, v12}, Lfy5;-><init>(Ljava/util/List;B)V

    invoke-virtual {v10, v8, v11}, Lvg0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v9}, Lx5f;->U0(Lx56;)V

    goto :goto_81

    :cond_c1
    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_cc
    :goto_cc
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_10b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    check-cast v6, Ljava/lang/Iterable;

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    iget-boolean v8, v4, Lx5f;->h:Z

    if-eqz v8, :cond_cc

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v8

    new-instance v9, Lck0;

    invoke-direct {v9, v5, v8}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v9}, Lck0;->e()Lhi0;

    move-result-object v9

    invoke-virtual {v9}, Lhi0;->a()Lvg0;

    move-result-object v9

    new-instance v10, Lfy5;

    invoke-direct {v10, v6, v1}, Lfy5;-><init>(Ljava/util/List;B)V

    invoke-virtual {v9, v7, v10}, Lvg0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v8}, Lx5f;->U0(Lx56;)V

    goto :goto_cc

    :cond_10b
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-boolean v0, p1, Lxoc;->e:Z

    if-eqz v0, :cond_130

    iget-boolean v0, v4, Lx5f;->h:Z

    if-eqz v0, :cond_12e

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, v5, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v3, Lrkc;

    const/16 v5, 0x19

    sget-object v6, Lxg0;->f:Lxg0;

    invoke-direct {v3, v6, v5}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v0}, Lx5f;->U0(Lx56;)V

    :cond_12e
    iput-boolean v2, p1, Lxoc;->e:Z

    :cond_130
    iget-object p1, p0, Lurc;->h:Ls9i;

    iget-object p1, p1, Ls9i;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v0, p1, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    invoke-static {v0, v1}, LJ/N;->MVisE3We(J)V

    const-wide/16 v0, 0x0

    iput-wide v0, p1, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    iget-object p0, p0, Lurc;->a:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_147
    check-cast p1, Lbp7;

    sget-object v0, Lbp7;->c:Lbp7;

    if-ne p1, v0, :cond_150

    invoke-virtual {p0}, Lurc;->a()V

    :cond_150
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_153
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lurc;->h:Ls9i;

    iget-object p0, p0, Ls9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    invoke-virtual {p0, p1}, Lcom/opera/android/webcore/WebcoreRpcBridge;->a(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_161
    check-cast p1, Lcla;

    iget-object p0, p0, Lurc;->h:Ls9i;

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lnv6;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lyzb;

    const/16 v2, 0x8

    invoke-direct {v0, p0, v2}, Lyzb;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    invoke-virtual {v2, v3}, Lvpb;->a(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcla;->a()Lorb;

    move-result-object p1

    const-string v4, "state"

    invoke-virtual {v3, p1, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-virtual {p0}, Lqq8;->h()Ljava/lang/String;

    move-result-object p1

    const-string v3, "2.0"

    const-string v4, "method"

    const-string v5, "jsonrpc"

    const-string v6, "views.v1.notifyHostStateChanged"

    invoke-static {v5, v3, v4, v6}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v3

    const-string v4, "params"

    invoke-virtual {v3, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "id"

    invoke-virtual {v3, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Lrkc;

    invoke-direct {p1, v0, v1}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v3, p1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_1b2
    .packed-switch 0x0
        :pswitch_161
        :pswitch_153
        :pswitch_147
        :pswitch_20
    .end packed-switch
.end method
