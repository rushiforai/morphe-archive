.class public final Lc6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final a:Lt7j;

.field public b:Ljava/lang/Object;

.field public final c:Ljava/util/HashSet;

.field public final d:Z


# direct methods
.method public constructor <init>(Lt7j;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc6j;->a:Lt7j;

    iput-boolean p2, p0, Lc6j;->d:Z

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lc6j;->d:Z

    if-eqz v0, :cond_7

    const/4 v0, 0x0

    iput-object v0, p0, Lc6j;->b:Ljava/lang/Object;

    :cond_7
    iget-object v0, p0, Lc6j;->a:Lt7j;

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 3

    if-eqz p1, :cond_23

    iget-object v0, p0, Lc6j;->b:Ljava/lang/Object;

    if-eq v0, p1, :cond_23

    iput-object p1, p0, Lc6j;->b:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashSet;

    iget-object p0, p0, Lc6j;->c:Ljava/util/HashSet;

    invoke-direct {p1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_23

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb6j;

    invoke-interface {p1}, Lb6j;->b()V

    goto :goto_13

    :cond_23
    return-void
.end method
