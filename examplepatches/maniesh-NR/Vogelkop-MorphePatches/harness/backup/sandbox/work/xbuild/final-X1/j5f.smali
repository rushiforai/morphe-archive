.class public final synthetic Lj5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:B

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILwb0;Ljava/lang/Integer;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lj5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lj5f;->b:B

    iput-object p2, p0, Lj5f;->c:Ljava/lang/Object;

    iput-object p3, p0, Lj5f;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lod0;I)V
    .registers 5

    .line 13
    const/4 v0, 0x1

    iput-byte v0, p0, Lj5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj5f;->c:Ljava/lang/Object;

    iput-object p2, p0, Lj5f;->d:Ljava/lang/Object;

    iput-byte p3, p0, Lj5f;->b:B

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lj5f;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, -0x1

    const/16 v4, 0x98b

    iget-byte v5, p0, Lj5f;->b:B

    iget-object v6, p0, Lj5f;->d:Ljava/lang/Object;

    iget-object p0, p0, Lj5f;->c:Ljava/lang/Object;

    const/4 v7, 0x1

    packed-switch v0, :pswitch_data_d0

    check-cast p0, Ljava/lang/String;

    check-cast v6, Lod0;

    check-cast p1, Lhi0;

    iget-object p1, p1, Lhi0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmj0;

    iget-object v0, p1, Lmj0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lhj0;

    const/4 v8, 0x6

    invoke-direct {v0, v4, v3, v8}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lmj0;->b:Llj0;

    const/16 v3, 0xe

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_42

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_42

    new-instance v8, Lif0;

    invoke-direct {v8, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_4f

    :cond_42
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v3, v7, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v8, Lif0;

    invoke-direct {v8, p1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_4f
    invoke-virtual {v8, p0, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v6, :cond_56

    move p0, v1

    goto :goto_57

    :cond_56
    move p0, v7

    :goto_57
    invoke-virtual {v0, v1, p0, v6}, Ljf0;->q(IILjava/lang/Object;)V

    const-wide/16 p0, 0x1

    if-eq v5, v7, :cond_79

    if-eq v5, v2, :cond_75

    const/4 v1, 0x3

    if-eq v5, v1, :cond_71

    const/4 v1, 0x4

    if-eq v5, v1, :cond_6d

    const/4 v1, 0x5

    if-ne v5, v1, :cond_7c

    invoke-virtual {v0, v1, v7, p0, p1}, Ljf0;->p(IIJ)V

    goto :goto_7c

    :cond_6d
    invoke-virtual {v0, v1, v7, p0, p1}, Ljf0;->p(IIJ)V

    goto :goto_7c

    :cond_71
    invoke-virtual {v0, v1, v7, p0, p1}, Ljf0;->p(IIJ)V

    goto :goto_7c

    :cond_75
    invoke-virtual {v0, v2, v7, p0, p1}, Ljf0;->p(IIJ)V

    goto :goto_7c

    :cond_79
    invoke-virtual {v0, v7, v7, p0, p1}, Ljf0;->p(IIJ)V

    :cond_7c
    :goto_7c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7f
    check-cast p0, Lwb0;

    check-cast v6, Ljava/lang/Integer;

    check-cast p1, Ltd0;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iget-object v5, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lzb0;

    invoke-direct {v5, v4, v3, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/16 v2, 0x43

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_ab

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_ab

    new-instance v4, Lif0;

    invoke-direct {v4, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_b8

    :cond_ab
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v2, v7, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_b8
    invoke-virtual {v4, v0, v5}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p0, :cond_bf

    move p1, v1

    goto :goto_c0

    :cond_bf
    move p1, v7

    :goto_c0
    invoke-virtual {v5, v1, p1, p0}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v6, :cond_cd

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long p0, p0

    invoke-virtual {v5, v7, v7, p0, p1}, Ljf0;->p(IIJ)V

    :cond_cd
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_7f
    .end packed-switch
.end method
