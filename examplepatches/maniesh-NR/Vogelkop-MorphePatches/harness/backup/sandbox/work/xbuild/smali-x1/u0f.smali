.class public final synthetic Lu0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx0f;


# direct methods
.method public synthetic constructor <init>(Lx0f;B)V
    .registers 3

    iput-byte p2, p0, Lu0f;->a:B

    iput-object p1, p0, Lu0f;->b:Lx0f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lu0f;->a:B

    const/4 v1, -0x1

    const/4 v2, 0x1

    iget-object p0, p0, Lu0f;->b:Lx0f;

    packed-switch v0, :pswitch_data_d4

    check-cast p1, Lw0f;

    iget-object p0, p0, Lx0f;->e:Lode;

    invoke-static {p0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ljava/util/Set;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    move v3, v0

    :goto_23
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lx0f;->a:Landroid/content/Context;

    invoke-static {v5, v4}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    if-eq v4, v1, :cond_44

    if-eqz v4, :cond_41

    if-eq v4, v2, :cond_3e

    sget-object v4, Lv0f;->a:Lv0f;

    goto :goto_46

    :cond_3e
    sget-object v4, Lv0f;->c:Lv0f;

    goto :goto_46

    :cond_41
    sget-object v4, Lv0f;->b:Lv0f;

    goto :goto_46

    :cond_44
    sget-object v4, Lv0f;->a:Lv0f;

    :goto_46
    sget-object v5, Lv0f;->c:Lv0f;

    if-ne v4, v5, :cond_4c

    move v0, v2

    goto :goto_23

    :cond_4c
    move v3, v2

    goto :goto_23

    :cond_4e
    if-eqz v0, :cond_58

    if-eqz v3, :cond_55

    sget-object p0, Lw0f;->c:Lw0f;

    goto :goto_5a

    :cond_55
    sget-object p0, Lw0f;->a:Lw0f;

    goto :goto_5a

    :cond_58
    sget-object p0, Lw0f;->b:Lw0f;

    :goto_5a
    return-object p0

    :pswitch_5b
    check-cast p1, Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_65
    :goto_65
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv0f;

    iget-object v2, p0, Lx0f;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lode;

    if-eqz v1, :cond_65

    invoke-static {v1, v0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    goto :goto_65

    :cond_8b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8e
    check-cast p1, Ljava/util/Set;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v3, 0xa

    invoke-static {p1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-static {v3}, Lqbd;->a(I)I

    move-result v3

    const/16 v4, 0x10

    if-ge v3, v4, :cond_a3

    move v3, v4

    :cond_a3
    invoke-direct {v0, v3}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_aa
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lx0f;->a:Landroid/content/Context;

    invoke-static {v5, v4}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    if-eq v4, v1, :cond_cc

    if-eqz v4, :cond_c9

    if-eq v4, v2, :cond_c6

    sget-object v4, Lv0f;->a:Lv0f;

    goto :goto_ce

    :cond_c6
    sget-object v4, Lv0f;->c:Lv0f;

    goto :goto_ce

    :cond_c9
    sget-object v4, Lv0f;->b:Lv0f;

    goto :goto_ce

    :cond_cc
    sget-object v4, Lv0f;->a:Lv0f;

    :goto_ce
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_aa

    :cond_d2
    return-object v0

    nop

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_8e
        :pswitch_5b
        :pswitch_16
    .end packed-switch
.end method
