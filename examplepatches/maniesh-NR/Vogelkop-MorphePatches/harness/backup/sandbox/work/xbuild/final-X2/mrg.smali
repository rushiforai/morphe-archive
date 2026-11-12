.class public final Lmrg;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lghf;

.field public final synthetic k:Ljava/util/Map$Entry;

.field public final synthetic l:Ljava/util/Map$Entry;


# direct methods
.method public synthetic constructor <init>(Lghf;Ljava/util/Map$Entry;Ljava/util/Map$Entry;B)V
    .registers 5

    iput-byte p4, p0, Lmrg;->i:B

    iput-object p1, p0, Lmrg;->j:Lghf;

    iput-object p2, p0, Lmrg;->k:Ljava/util/Map$Entry;

    iput-object p3, p0, Lmrg;->l:Ljava/util/Map$Entry;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lmrg;->i:B

    iget-object v1, p0, Lmrg;->l:Ljava/util/Map$Entry;

    iget-object v2, p0, Lmrg;->k:Ljava/util/Map$Entry;

    iget-object p0, p0, Lmrg;->j:Lghf;

    packed-switch v0, :pswitch_data_58

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0, v1, p1}, Lghf;->D(Ljava/lang/String;Ljava/lang/String;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_55

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_45
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_55

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2, v1, p1}, Lghf;->N(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_45

    :cond_55
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
