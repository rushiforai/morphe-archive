.class public final synthetic Lr5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lu50;

.field public final synthetic c:Lv50;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lu50;Lv50;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr5f;->a:Ljava/lang/String;

    iput-object p2, p0, Lr5f;->b:Lu50;

    iput-object p3, p0, Lr5f;->c:Lv50;

    iput-object p4, p0, Lr5f;->d:Ljava/lang/String;

    iput-object p5, p0, Lr5f;->e:Ljava/lang/String;

    iput-object p6, p0, Lr5f;->f:Ljava/lang/String;

    iput-object p7, p0, Lr5f;->g:Ljava/lang/String;

    iput-object p8, p0, Lr5f;->h:Ljava/lang/String;

    iput-object p9, p0, Lr5f;->i:Ljava/lang/String;

    iput-object p10, p0, Lr5f;->j:Ljava/lang/String;

    iput-object p11, p0, Lr5f;->k:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->c()Ltb0;

    move-result-object p1

    new-instance v0, Ls5f;

    iget-object v1, p0, Lr5f;->b:Lu50;

    iget-object v2, p0, Lr5f;->c:Lv50;

    iget-object v3, p0, Lr5f;->d:Ljava/lang/String;

    iget-object v4, p0, Lr5f;->e:Ljava/lang/String;

    iget-object v5, p0, Lr5f;->f:Ljava/lang/String;

    iget-object v6, p0, Lr5f;->g:Ljava/lang/String;

    iget-object v7, p0, Lr5f;->h:Ljava/lang/String;

    iget-object v8, p0, Lr5f;->i:Ljava/lang/String;

    iget-object v9, p0, Lr5f;->j:Ljava/lang/String;

    iget-object v10, p0, Lr5f;->k:Ljava/lang/String;

    invoke-direct/range {v0 .. v10}, Ls5f;-><init>(Lu50;Lv50;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p1, Ltb0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lsi0;

    const/4 v2, -0x1

    const/16 v3, 0xa

    const/16 v4, 0x98b

    invoke-direct {v1, v4, v2, v3}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltb0;->b:Lq56;

    const/16 v2, 0x1a

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_46

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_46

    new-instance v4, Lif0;

    invoke-direct {v4, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_54

    :cond_46
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {p1, v2, v4, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lif0;

    invoke-direct {v4, p1, v2, v3}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_54
    iget-object p0, p0, Lr5f;->a:Ljava/lang/String;

    invoke-virtual {v4, p0, v1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lti0;

    invoke-direct {p0, v1}, Lti0;-><init>(Lsi0;)V

    invoke-virtual {v0, p0}, Ls5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
