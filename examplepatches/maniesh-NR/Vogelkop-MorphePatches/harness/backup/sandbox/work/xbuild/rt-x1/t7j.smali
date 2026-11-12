.class public abstract Lt7j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ljava/util/Set;

.field public final c:Ljava/util/HashSet;

.field public d:Ljava/lang/Object;

.field private e:Lk7j;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public f:Z

.field public g:Z

.field public h:I

.field public final i:Lfwh;


# direct methods
.method public constructor <init>(Ltm5;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lt7j;->b:Ljava/util/Set;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lt7j;->c:Ljava/util/HashSet;

    new-instance v0, Lyhe;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lyhe;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lfwh;

    invoke-direct {v1, p1, v0}, Lfwh;-><init>(Ltm5;Lyhe;)V

    iput-object v1, p0, Lt7j;->i:Lfwh;

    return-void
.end method


# virtual methods
.method public abstract a(Lisd;)Lk7j;
.end method

.method public final b(Lq8j;)V
    .registers 3

    if-nez p1, :cond_6

    invoke-virtual {p0}, Lt7j;->d()V

    return-void

    :cond_6
    iget v0, p0, Lt7j;->h:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lt7j;->h:I

    invoke-virtual {p0}, Lt7j;->d()V

    iget v0, p0, Lt7j;->h:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lt7j;->h:I

    iget-boolean v0, p0, Lt7j;->a:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lt7j;->b:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lt7j;->d:Ljava/lang/Object;

    invoke-interface {p1, p0}, Lq8j;->c(Ljava/lang/Object;)V

    return-void

    :cond_24
    iget-object p0, p0, Lt7j;->c:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c()V
    .registers 5

    iget-boolean v0, p0, Lt7j;->a:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_26

    iput-boolean v2, p0, Lt7j;->a:Z

    iput-object v1, p0, Lt7j;->d:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lt7j;->b:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_18
    if-ge v2, v1, :cond_38

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lq8j;

    invoke-interface {v3}, Lq8j;->a()V

    goto :goto_18

    :cond_26
    iget-boolean v0, p0, Lt7j;->f:Z

    if-eqz v0, :cond_38

    iget-object v0, p0, Lt7j;->e:Lk7j;

    if-eqz v0, :cond_31

    invoke-interface {v0}, Lk7j;->b()V

    :cond_31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lt7j;->g:Z

    iput-boolean v2, p0, Lt7j;->f:Z

    iput-object v1, p0, Lt7j;->e:Lk7j;

    :cond_38
    iget v0, p0, Lt7j;->h:I

    if-gtz v0, :cond_45

    iget-object v0, p0, Lt7j;->c:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_45

    return-void

    :cond_45
    invoke-virtual {p0}, Lt7j;->d()V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-boolean v0, p0, Lt7j;->f:Z

    if-nez v0, :cond_27

    iget-boolean v0, p0, Lt7j;->a:Z

    if-nez v0, :cond_27

    const/4 v0, 0x0

    iput-boolean v0, p0, Lt7j;->a:Z

    iput-boolean v0, p0, Lt7j;->g:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lt7j;->f:Z

    new-instance v0, Lisd;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lisd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lt7j;->a(Lisd;)Lk7j;

    move-result-object v0

    iput-object v0, p0, Lt7j;->e:Lk7j;

    iget-boolean v1, p0, Lt7j;->g:Z

    if-eqz v1, :cond_27

    invoke-interface {v0}, Lk7j;->b()V

    const/4 v0, 0x0

    iput-object v0, p0, Lt7j;->e:Lk7j;

    :cond_27
    return-void
.end method
