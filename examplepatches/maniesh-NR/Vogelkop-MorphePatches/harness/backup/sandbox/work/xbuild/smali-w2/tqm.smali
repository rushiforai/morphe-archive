.class public final Ltqm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/util/LongSparseArray;

.field public final b:J

.field public c:Lkqm;


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Ltqm;->a:Landroid/util/LongSparseArray;

    new-instance v1, Lkqm;

    const-wide/16 v3, -0x1

    const-wide/16 v5, 0x0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lkqm;-><init>(Ljava/lang/String;JJ)V

    iput-object v1, p0, Ltqm;->c:Lkqm;

    iput-wide p2, p0, Ltqm;->b:J

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 3

    invoke-virtual {p0}, Ltqm;->b()Ljava/util/ArrayDeque;

    move-result-object p0

    :goto_4
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkqm;

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_4

    :cond_14
    return-void
.end method

.method public final b()Ljava/util/ArrayDeque;
    .registers 3

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iget-object p0, p0, Ltqm;->c:Lkqm;

    invoke-virtual {v0, p0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    :goto_f
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_24

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkqm;

    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    iget-object p0, p0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    goto :goto_f

    :cond_24
    return-object v1
.end method

.method public final c(Lkqm;)V
    .registers 7

    iget-object v0, p0, Ltqm;->c:Lkqm;

    iget-object v1, v0, Lkqm;->d:Lipm;

    iget-wide v1, v1, Lipm;->b:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_25

    iget-object v0, v0, Lkqm;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkqm;

    invoke-virtual {p1, v1}, Lkqm;->b(Lkqm;)V

    goto :goto_12

    :cond_22
    const/4 v0, 0x1

    iput-boolean v0, p1, Lkqm;->f:Z

    :cond_25
    iput-object p1, p0, Ltqm;->c:Lkqm;

    iget-object v0, p1, Lkqm;->d:Lipm;

    iget-wide v0, v0, Lipm;->b:J

    iget-object p0, p0, Ltqm;->a:Landroid/util/LongSparseArray;

    invoke-virtual {p0, v0, v1, p1}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    return-void
.end method
