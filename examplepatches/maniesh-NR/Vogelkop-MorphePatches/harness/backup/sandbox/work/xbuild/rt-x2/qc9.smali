.class public final Lqc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsc9;


# instance fields
.field public final synthetic a:Lrc9;


# direct methods
.method public constructor <init>(Lrc9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqc9;->a:Lrc9;

    return-void
.end method


# virtual methods
.method public final a(ILjava/util/List;)V
    .registers 4

    iget-object p0, p0, Lqc9;->a:Lrc9;

    iget-object v0, p0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    iget-object p0, p0, Lrc9;->d:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_11
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmb9;

    invoke-interface {v0, p1, p2}, Lmb9;->h(II)V

    goto :goto_11

    :cond_21
    return-void
.end method
