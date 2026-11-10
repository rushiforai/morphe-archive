.class public final Landroidx/lifecycle/r;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroidx/lifecycle/l;

.field public b:Landroidx/lifecycle/o;


# virtual methods
.method public final a(Landroidx/lifecycle/q;Landroidx/lifecycle/k;)V
    .locals 3

    invoke-virtual {p2}, Landroidx/lifecycle/k;->a()Landroidx/lifecycle/l;

    move-result-object v0

    iget-object v1, p0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    const-string v2, "state1"

    invoke-static {v1, v2}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v2

    if-gez v2, :cond_0

    move-object v1, v0

    :cond_0
    iput-object v1, p0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    iget-object v1, p0, Landroidx/lifecycle/r;->b:Landroidx/lifecycle/o;

    invoke-interface {v1, p1, p2}, Landroidx/lifecycle/o;->b(Landroidx/lifecycle/q;Landroidx/lifecycle/k;)V

    iput-object v0, p0, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    return-void
.end method
