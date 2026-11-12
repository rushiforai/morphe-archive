.class public final Lr8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lclh;


# instance fields
.field public final a:Lglh;

.field public final b:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lglh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lr8f;->b:Ljava/util/HashMap;

    iput-object p1, p0, Lr8f;->a:Lglh;

    iget-object p1, p1, Lglh;->b:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    return-void
.end method

.method public final b(J)V
    .registers 3

    return-void
.end method

.method public final c(Ljava/util/Collection;)V
    .registers 5

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lr8f;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li7f;

    if-eqz v0, :cond_4

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Li7f;)V

    :goto_27
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq8f;

    iget-object v2, v0, Lq8f;->b:Lzzh;

    iget-object v0, v0, Lq8f;->a:Look;

    invoke-virtual {v2, v0}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_27

    :cond_3b
    return-void
.end method

.method public final d(J)V
    .registers 3

    return-void
.end method

.method public final e(J)V
    .registers 3

    return-void
.end method
