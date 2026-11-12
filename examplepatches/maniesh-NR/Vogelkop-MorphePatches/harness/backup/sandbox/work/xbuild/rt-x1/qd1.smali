.class public final Lqd1;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lqd1;->i:B

    iput-object p1, p0, Lqd1;->j:Ljava/lang/Object;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lqd1;->i:B

    iget-object p0, p0, Lqd1;->j:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_70

    check-cast p2, Ljava/io/OutputStream;

    check-cast p0, Loio;

    iget-object v0, p0, Loio;->c:Lrpb;

    iget-object p0, p0, Loio;->d:Lkotlinx/serialization/KSerializer;

    invoke-static {v0, p0, p1, p2}, Lcqp;->O(Lrpb;Lkotlinx/serialization/KSerializer;Ljava/lang/Object;Ljava/io/OutputStream;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/util/Map;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-static {p0, p1}, Lrbd;->b(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbqg;

    iget-object p0, p0, Lbqg;->b:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2b
    :goto_2b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_53

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llrg;

    if-eqz v0, :cond_2b

    invoke-virtual {v0, p1}, Llrg;->a(Z)V

    goto :goto_2b

    :cond_53
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_56
    check-cast p1, Le48;

    check-cast p2, Le48;

    sget-object v0, Le48;->c:Le48;

    if-ne p1, v0, :cond_6a

    if-ne p2, v0, :cond_6a

    check-cast p0, Lvh8;

    iget-object p0, p0, Lvh8;->a:La3m;

    iget-boolean p0, p0, La3m;->e:Z

    if-nez p0, :cond_6a

    const/4 p0, 0x1

    goto :goto_6b

    :cond_6a
    const/4 p0, 0x0

    :goto_6b
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_56
        :pswitch_15
    .end packed-switch
.end method
