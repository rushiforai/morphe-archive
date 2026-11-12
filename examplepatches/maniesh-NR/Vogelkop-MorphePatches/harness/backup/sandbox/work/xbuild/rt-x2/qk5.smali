.class public final Lqk5;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luk5;


# direct methods
.method public synthetic constructor <init>(Luk5;B)V
    .registers 3

    iput-byte p2, p0, Lqk5;->a:B

    iput-object p1, p0, Lqk5;->b:Luk5;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final variablesChanged()V
    .registers 6

    iget-byte v0, p0, Lqk5;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lqk5;->b:Luk5;

    packed-switch v0, :pswitch_data_70

    new-instance v0, Lqk5;

    invoke-direct {v0, p0, v1}, Lqk5;-><init>(Luk5;B)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void

    :pswitch_11
    invoke-static {}, Lcom/leanplum/Leanplum;->messageMetadata()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_24
    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Ljava/util/Map;

    if-eqz v4, :cond_24

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    :cond_36
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_60

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_40
    if-ge v1, v0, :cond_60

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Ljava/util/Map;

    const-string v4, "action"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Config Bundle Sheet"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_40

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lsw7;

    invoke-direct {v1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_6c

    :cond_60
    new-instance v0, Ldzh;

    const-string v1, "Onboarding"

    invoke-direct {v0, v1}, Ldzh;-><init>(Ljava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_6c
    invoke-virtual {p0, v1}, Luk5;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
