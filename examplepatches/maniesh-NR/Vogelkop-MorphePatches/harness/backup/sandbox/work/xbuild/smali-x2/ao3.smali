.class public final synthetic Lao3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JJLjava/lang/String;Ljava/lang/String;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lao3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lao3;->d:Ljava/lang/Object;

    iput-object p6, p0, Lao3;->e:Ljava/lang/Object;

    iput-wide p1, p0, Lao3;->b:J

    iput-wide p3, p0, Lao3;->c:J

    return-void
.end method

.method public synthetic constructor <init>(Lnvj;JJLnk7;)V
    .registers 8

    .line 15
    const/4 v0, 0x0

    iput-byte v0, p0, Lao3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lao3;->d:Ljava/lang/Object;

    iput-wide p2, p0, Lao3;->b:J

    iput-wide p4, p0, Lao3;->c:J

    iput-object p6, p0, Lao3;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lao3;->a:B

    iget-object v1, p0, Lao3;->e:Ljava/lang/Object;

    iget-object v2, p0, Lao3;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_96

    check-cast v2, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    check-cast p1, Lhi0;

    iget-object v0, p1, Lhi0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lon0;

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x1

    invoke-direct {v0, v3, v4, v5}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/16 v6, 0x2c

    invoke-virtual {p1, v6}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    if-eqz v7, :cond_35

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_35

    new-instance v8, Lif0;

    invoke-direct {v8, p1, v6, v7}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_42

    :cond_35
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v6, v5, v7}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v8, Lif0;

    invoke-direct {v8, p1, v6, v7}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_42
    invoke-virtual {v8, v2, v0}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lpn0;

    const/4 v2, 0x2

    invoke-direct {p1, v3, v4, v2}, Ljf0;-><init>(III)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_60

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_60

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_6d

    :cond_60
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v2, v5, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, v0, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_6d
    invoke-virtual {v4, v1, p1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v0, p0, Lao3;->b:J

    invoke-virtual {p1, v2, v5, v0, v1}, Ljf0;->p(IIJ)V

    iget-wide v0, p0, Lao3;->c:J

    invoke-virtual {p1, v5, v5, v0, v1}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7d
    check-cast v2, Lnvj;

    move-object v7, v1

    check-cast v7, Lnk7;

    move-object v0, p1

    check-cast v0, Lo3c;

    invoke-virtual {v0}, Lo3c;->a()V

    const/4 v6, 0x0

    const/16 v8, 0x68

    move-object v1, v2

    iget-wide v2, p0, Lao3;->b:J

    iget-wide v4, p0, Lao3;->c:J

    invoke-static/range {v0 .. v8}, Lmk7;->E0(Lmk7;Ldz3;JJFLnk7;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_7d
    .end packed-switch
.end method
