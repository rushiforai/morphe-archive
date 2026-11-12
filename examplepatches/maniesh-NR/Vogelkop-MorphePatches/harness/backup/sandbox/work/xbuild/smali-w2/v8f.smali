.class public final Lv8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lati;
.implements Lclh;


# instance fields
.field public final a:Lglh;

.field public final b:Lode;

.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lglh;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv8f;->a:Lglh;

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lv8f;->b:Lode;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lv8f;->c:Ljava/util/ArrayList;

    new-instance v0, Lo8f;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    new-instance v0, Lo8f;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lv8f;->a:Lglh;

    invoke-virtual {p0, v0}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final b(J)V
    .registers 5

    new-instance v0, Laz4;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, p2, v1}, Laz4;-><init>(Ljava/lang/Object;JB)V

    iget-object p0, p0, Lv8f;->a:Lglh;

    invoke-virtual {p0, v0, p1, p2}, Lglh;->c(Lcom/opera/api/Callback;J)V

    return-void
.end method

.method public final c(Ljava/util/Collection;)V
    .registers 4

    new-instance v0, Lh6;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lh6;-><init>(Ljava/util/Collection;B)V

    iget-object p1, p0, Lv8f;->c:Ljava/util/ArrayList;

    invoke-static {p1, v0}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object p0, p0, Lv8f;->b:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final d(J)V
    .registers 5

    new-instance v0, Laz4;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, p2, v1}, Laz4;-><init>(Ljava/lang/Object;JB)V

    iget-object p0, p0, Lv8f;->a:Lglh;

    invoke-virtual {p0, v0, p1, p2}, Lglh;->c(Lcom/opera/api/Callback;J)V

    return-void
.end method

.method public final e(J)V
    .registers 5

    new-instance v0, Laz4;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, p2, v1}, Laz4;-><init>(Ljava/lang/Object;JB)V

    iget-object p0, p0, Lv8f;->a:Lglh;

    invoke-virtual {p0, v0, p1, p2}, Lglh;->c(Lcom/opera/api/Callback;J)V

    return-void
.end method

.method public final g(Lesi;)V
    .registers 2

    return-void
.end method

.method public final i()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final l()V
    .registers 3

    new-instance v0, Lo8f;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lo8f;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lv8f;->a:Lglh;

    invoke-virtual {p0, v0}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final m()Lekc;
    .registers 1

    iget-object p0, p0, Lv8f;->b:Lode;

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Lilh;

    iget-wide v0, p1, Lilh;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    const/4 v0, 0x1

    iget-object p0, p0, Lv8f;->a:Lglh;

    invoke-virtual {p0, p1, v0}, Lglh;->a(Ljava/util/Collection;Z)V

    return-void
.end method
