.class public final Lip4;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Lta7;

.field public final k:Ls9i;

.field public final l:Lstm;

.field private final m:Ljp4;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field private n:Lq8j;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lq8j;"
        }
    .end annotation
.end field

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lta7;Ltm5;Ls9i;Lstm;)V
    .registers 6

    invoke-direct {p0, p3}, Lt7j;-><init>(Ltm5;)V

    const/4 p3, 0x1

    iput-boolean p3, p0, Lip4;->o:Z

    iput-object p2, p0, Lip4;->j:Lta7;

    iput-object p4, p0, Lip4;->k:Ls9i;

    iput-object p5, p0, Lip4;->l:Lstm;

    new-instance p2, Ljp4;

    invoke-direct {p2, p1, p0}, Ljp4;-><init>(Landroid/content/Context;Lip4;)V

    iget-object p1, p2, Ljp4;->c:Lhb6;

    invoke-virtual {p1}, Lhb6;->d()Ld5o;

    move-result-object p3

    if-nez p3, :cond_1f

    invoke-virtual {p1}, Lhb6;->b()Ld5o;

    move-result-object p1

    if-eqz p1, :cond_22

    :cond_1f
    invoke-virtual {p0, p2}, Lt7j;->b(Lq8j;)V

    :cond_22
    iput-object p2, p0, Lip4;->m:Ljp4;

    return-void
.end method

.method public static bridge synthetic e(Lip4;)Lq8j;
    .registers 1

    iget-object p0, p0, Lip4;->n:Lq8j;

    return-object p0
.end method

.method public static bridge synthetic f(Lip4;)V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lip4;->n:Lq8j;

    return-void
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 3

    new-instance v0, Lhp4;

    invoke-direct {v0, p0, p1}, Lhp4;-><init>(Lip4;Lisd;)V

    return-object v0
.end method

.method public final g(Ljava/util/List;Ljava/util/Set;)V
    .registers 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance p2, Lgp4;

    invoke-direct {p2, p0, p0, v0, p1}, Lgp4;-><init>(Lip4;Lip4;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    iput-object p2, p0, Lip4;->n:Lq8j;

    invoke-virtual {p0, p2}, Lt7j;->b(Lq8j;)V

    return-void
.end method
