.class public final Lc15;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Lta7;

.field public final k:Ls9i;

.field public final l:Lip4;

.field public final m:Li3j;

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
.method public constructor <init>(Lta7;Ltm5;Ls9i;Lip4;)V
    .registers 5

    invoke-direct {p0, p2}, Lt7j;-><init>(Ltm5;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lc15;->o:Z

    iput-object p1, p0, Lc15;->j:Lta7;

    iput-object p3, p0, Lc15;->k:Ls9i;

    iput-object p4, p0, Lc15;->l:Lip4;

    new-instance p2, Li3j;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p1, p2, Li3j;->a:Ljava/lang/Object;

    iput-object p3, p2, Li3j;->b:Ljava/lang/Object;

    iput-object p2, p0, Lc15;->m:Li3j;

    return-void
.end method

.method public static bridge synthetic e(Lc15;)Lq8j;
    .registers 1

    iget-object p0, p0, Lc15;->n:Lq8j;

    return-object p0
.end method

.method public static bridge synthetic f(Lc15;)V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lc15;->n:Lq8j;

    return-void
.end method

.method public static g(Lfp4;Lbre;Z)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x1

    if-nez p2, :cond_c

    iget p1, p1, Lbre;->e:I

    if-eq p1, v1, :cond_c

    return v0

    :cond_c
    iget-object p0, p0, Lfp4;->f:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_25

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyqe;

    invoke-virtual {p1}, Lyqe;->a()Z

    move-result p1

    if-eqz p1, :cond_12

    return v1

    :cond_25
    return v0
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 3

    new-instance v0, Lb15;

    invoke-direct {v0, p0, p1}, Lb15;-><init>(Lc15;Lisd;)V

    return-object v0
.end method

.method public final h(Lbre;)V
    .registers 3

    new-instance v0, La15;

    invoke-direct {v0, p0, p0, p1}, La15;-><init>(Lc15;Lc15;Lbre;)V

    iput-object v0, p0, Lc15;->n:Lq8j;

    invoke-virtual {p0, v0}, Lt7j;->b(Lq8j;)V

    return-void
.end method
