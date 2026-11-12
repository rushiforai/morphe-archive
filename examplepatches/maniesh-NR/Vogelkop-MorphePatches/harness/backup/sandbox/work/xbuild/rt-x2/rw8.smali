.class public final Lrw8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lu82;

.field public final b:Low8;

.field public final c:Li82;

.field public final d:Leq6;

.field public e:Z


# direct methods
.method public constructor <init>(Lu82;Low8;Li82;Leq6;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrw8;->a:Lu82;

    iput-object p2, p0, Lrw8;->b:Low8;

    iput-object p3, p0, Lrw8;->c:Li82;

    iput-object p4, p0, Lrw8;->d:Leq6;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .registers 8

    iget-object v0, p0, Lrw8;->d:Leq6;

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lxw8;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lrw8;->e:Z

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_19

    iget-object v2, v0, Lxw8;->j:Lf92;

    iget-object v3, v0, Lxw8;->l:Ljava/lang/Object;

    iget-object v4, v0, Lxw8;->k:Lv82;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Lf92;->e(Ljava/lang/Object;Loqe;Lw82;)V

    :cond_19
    invoke-virtual {p0, p1}, Lrw8;->b(Ljava/util/List;)Lg95;

    move-result-object p0

    iget-object p1, v0, Lxw8;->x:Lww8;

    iget-object v0, p1, Lww8;->b:Lwr9;

    iput-object p0, v0, Lwr9;->c:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lww8;->a(Z)V

    return-void
.end method

.method public final b(Ljava/util/List;)Lg95;
    .registers 4

    new-instance v0, Lqw8;

    const/4 v1, 0x0

    iget-object p0, p0, Lrw8;->c:Li82;

    invoke-direct {v0, p0, v1}, Lqw8;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object p0

    sget-object p1, Lbsg;->b:Lasg;

    new-instance v0, Lg95;

    invoke-direct {v0, p0, p1}, Lg95;-><init>(Ljava/util/Collection;Lsrg;)V

    return-object v0
.end method
