.class public final synthetic Lm5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(IZ)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lm5f;->a:B

    iput-boolean p2, p0, Lm5f;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    check-cast p1, Lhi0;

    iget-byte v0, p0, Lm5f;->a:B

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lhi0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lbr0;

    const/4 v2, -0x1

    const/4 v3, 0x2

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lhi0;->b:Lfi0;

    const/16 v2, 0x2a

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    const/4 v4, 0x1

    if-eqz v3, :cond_2f

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2f

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_3c

    :cond_2f
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lif0;

    invoke-direct {v5, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_3c
    invoke-virtual {v5, v0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean p0, p0, Lm5f;->b:Z

    const-wide/16 v2, 0x1

    if-eqz p0, :cond_4a

    const/4 p0, 0x0

    invoke-virtual {v1, p0, v4, v2, v3}, Ljf0;->p(IIJ)V

    goto :goto_4d

    :cond_4a
    invoke-virtual {v1, v4, v4, v2, v3}, Ljf0;->p(IIJ)V

    :goto_4d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
