.class public final synthetic Lc0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltah;


# direct methods
.method public synthetic constructor <init>(Ltah;B)V
    .registers 3

    iput-byte p2, p0, Lc0a;->a:B

    iput-object p1, p0, Lc0a;->b:Ltah;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lc0a;->a:B

    iget-object p0, p0, Lc0a;->b:Ltah;

    packed-switch v0, :pswitch_data_ae

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v0, p1, Lq0i;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    move-object p1, v1

    :cond_11
    check-cast p1, [Ljava/io/File;

    if-eqz p1, :cond_9a

    new-instance v0, Lp4j;

    invoke-direct {v0}, Lp4j;-><init>()V

    iget-object v2, p0, Ltah;->j:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v2}, Lp4j;->addAll(Ljava/util/Collection;)Z

    iget-object v2, p0, Ltah;->k:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    invoke-virtual {v0, v2}, Lp4j;->addAll(Ljava/util/Collection;)Z

    iget-object v2, p0, Ltah;->h:Ljava/lang/Object;

    check-cast v2, Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_36
    :goto_36
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_62

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb0a;

    if-eqz v3, :cond_5e

    instance-of v4, v3, Lzz9;

    if-eqz v4, :cond_52

    check-cast v3, Lzz9;

    iget-object v3, v3, Lzz9;->b:Ljava/io/File;

    if-eqz v3, :cond_36

    invoke-virtual {v0, v3}, Lp4j;->add(Ljava/lang/Object;)Z

    goto :goto_36

    :cond_52
    instance-of v4, v3, La0a;

    if-eqz v4, :cond_5e

    check-cast v3, La0a;

    iget-object v3, v3, La0a;->b:Ljava/io/File;

    invoke-virtual {v0, v3}, Lp4j;->add(Ljava/lang/Object;)Z

    goto :goto_36

    :cond_5e
    invoke-static {}, Lh9o;->p()V

    goto :goto_9c

    :cond_62
    invoke-static {v0}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    array-length v3, p1

    const/4 v4, 0x0

    :goto_6d
    if-ge v4, v3, :cond_82

    aget-object v5, p1, v4

    iget-object v6, v0, Lp4j;->a:Lu9d;

    invoke-virtual {v6, v5}, Lu9d;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7a

    move-object v5, v1

    :cond_7a
    if-eqz v5, :cond_7f

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7f
    add-int/lit8 v4, v4, 0x1

    goto :goto_6d

    :cond_82
    iget-object p0, p0, Ltah;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance p1, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p1, v0, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Ll51;

    const/4 v0, 0x2

    invoke-direct {p0, v2, v0}, Ll51;-><init>(Ljava/util/ArrayList;B)V

    invoke-virtual {p1, p0}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    :cond_9a
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9c
    return-object v1

    :pswitch_9d
    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Ltah;->i:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    return-object p0

    :pswitch_data_ae
    .packed-switch 0x0
        :pswitch_9d
    .end packed-switch
.end method
