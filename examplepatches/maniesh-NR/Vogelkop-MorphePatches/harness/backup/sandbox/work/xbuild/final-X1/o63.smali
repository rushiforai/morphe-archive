.class public abstract Lo63;
.super Lh6e;
.source "SourceFile"


# instance fields
.field public final d:Ljava/util/HashSet;

.field public final e:Ljava/util/HashSet;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x63

    invoke-direct {p0, v0}, Lh6e;-><init>(I)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lo63;->d:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lo63;->e:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final e(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 8

    iget-object v0, p0, Lo63;->e:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    :goto_5
    iget-object v1, p0, Lo63;->d:Ljava/util/HashSet;

    if-gt p2, p3, :cond_27

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v2}, Landroidx/recyclerview/widget/RecyclerView;->N(IZ)Landroidx/recyclerview/widget/i;

    move-result-object v2

    instance-of v3, v2, Lfs8;

    if-eqz v3, :cond_24

    check-cast v2, Lfs8;

    iget-object v2, v2, Lfs8;->f:Lhq8;

    if-eqz v2, :cond_24

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_24

    invoke-virtual {p0, v2}, Lo63;->h(Lhq8;)V

    :cond_24
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_27
    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final f()V
    .registers 1

    iget-object p0, p0, Lo63;->d:Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    return-void
.end method

.method public abstract h(Lhq8;)V
.end method

.method public final i()V
    .registers 1

    iget-object p0, p0, Lo63;->d:Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    return-void
.end method
