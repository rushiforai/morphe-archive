.class public final synthetic Lrzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/api/Callback;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;Ljava/util/List;)V
    .registers 4

    .line 11
    const/4 v0, 0x1

    iput-byte v0, p0, Lrzj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrzj;->b:Lcom/opera/api/Callback;

    iput-object p2, p0, Lrzj;->c:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Ld7h;Lcom/opera/api/Callback;Ljava/util/List;)V
    .registers 4

    const/4 p1, 0x0

    iput-byte p1, p0, Lrzj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lrzj;->b:Lcom/opera/api/Callback;

    iput-object p3, p0, Lrzj;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Lrzj;->a:B

    iget-object v1, p0, Lrzj;->c:Ljava/util/List;

    iget-object p0, p0, Lrzj;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_60

    check-cast p1, Lylk;

    invoke-static {p0, v1, p1}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->a(Lcom/opera/api/Callback;Ljava/util/List;Lylk;)V

    return-void

    :pswitch_f
    check-cast p1, Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhq8;

    new-instance v3, Ljzj;

    sget-object v4, Lp6l;->a:Lp6l;

    move-object v5, v4

    invoke-virtual {v2, v5}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v4

    move-object v6, v5

    invoke-virtual {v2}, Lhq8;->h()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v6}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    invoke-virtual {v2}, Lhq8;->g()Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v3 .. v8}, Ljzj;-><init>(Ljava/lang/String;Ljava/lang/String;DLjava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    :cond_52
    new-instance p1, Lomj;

    const/4 v1, 0x6

    invoke-direct {p1, v1}, Lomj;-><init>(B)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
