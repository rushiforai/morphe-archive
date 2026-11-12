.class public final Ldu1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ldu1;


# instance fields
.field public final a:Li3j;

.field public final b:Lf30;

.field public c:Ln9k;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ldu1;

    invoke-direct {v0}, Ldu1;-><init>()V

    sput-object v0, Ldu1;->d:Ldu1;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li3j;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Li3j;-><init>(B)V

    iput-object v0, p0, Ldu1;->a:Li3j;

    new-instance v1, Lf30;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lf30;-><init>(B)V

    iput-object v1, p0, Ldu1;->b:Lf30;

    iget-object v1, v0, Li3j;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_16
    iput-object p0, v0, Li3j;->d:Ljava/lang/Object;

    monitor-exit v1

    return-void

    :goto_1a
    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_16 .. :try_end_1b} :catchall_1c

    throw p0

    :catchall_1c
    move-exception p0

    goto :goto_1a
.end method


# virtual methods
.method public final a(JLjava/lang/String;)V
    .registers 9

    const-string v0, "startup#ui"

    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_13

    sget-object v1, Lava;->a:Lcva;

    new-instance v3, Lcu1;

    invoke-direct {v3, p0, v2}, Lcu1;-><init>(Ldu1;B)V

    invoke-virtual {v1, v3}, Lcva;->a(Ljava/lang/Runnable;)V

    :cond_13
    iget-object p0, p0, Ldu1;->c:Ln9k;

    if-eqz p0, :cond_a7

    iget-object v1, p0, Ln9k;->b:Ljava/lang/Object;

    check-cast v1, Lx5f;

    iget-object v3, v1, Lx5f;->d:Lzpa;

    iget-boolean p0, p0, Ln9k;->a:Z

    if-nez p0, :cond_a7

    const-string p0, "startup#core"

    invoke-virtual {p3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v4, 0x1

    if-nez p0, :cond_6c

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a7

    iget-boolean p0, v1, Lx5f;->h:Z

    if-eqz p0, :cond_a7

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v3}, Lx56;->A(Lzpa;)Luc0;

    move-result-object p3

    invoke-virtual {p3, v3}, Luc0;->x(Lzpa;)Lvq0;

    move-result-object p3

    invoke-virtual {p3, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_54

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_54

    new-instance v2, Lhf0;

    invoke-direct {v2, p3, v4, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_61

    :cond_54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p3, v4, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lhf0;

    invoke-direct {v2, p3, v4, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_61
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, p0}, Lx5f;->U0(Lx56;)V

    goto :goto_a7

    :cond_6c
    iget-boolean p0, v1, Lx5f;->h:Z

    if-eqz p0, :cond_a7

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v3}, Lx56;->A(Lzpa;)Luc0;

    move-result-object p3

    invoke-virtual {p3, v3}, Luc0;->x(Lzpa;)Lvq0;

    move-result-object p3

    invoke-virtual {p3, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_90

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_90

    new-instance v3, Lhf0;

    invoke-direct {v3, p3, v2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_9d

    :cond_90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p3, v2, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, p3, v2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_9d
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, p0}, Lx5f;->U0(Lx56;)V

    :cond_a7
    :goto_a7
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 7

    const-string v0, "startup#ui"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Ldu1;->b:Lf30;

    iget-object v2, p0, Ldu1;->a:Li3j;

    const-string v3, "startup#core"

    if-eqz v0, :cond_20

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Layl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3}, Li3j;->p(Ljava/lang/String;)J

    const-string p0, "startup#fps"

    invoke-virtual {v2, p0}, Li3j;->O(Ljava/lang/String;)V

    goto :goto_31

    :cond_20
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_31

    sget-object v0, Lava;->a:Lcva;

    new-instance v3, Lcu1;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lcu1;-><init>(Ldu1;B)V

    invoke-virtual {v0, v3}, Lcva;->a(Ljava/lang/Runnable;)V

    :cond_31
    :goto_31
    invoke-virtual {v2, p1}, Li3j;->O(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Layl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
