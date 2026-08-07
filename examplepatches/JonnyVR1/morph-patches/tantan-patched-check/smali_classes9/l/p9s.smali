.class public Ll/p9s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/yh2;

.field public final b:Ll/gt4;

.field public c:Z


# direct methods
.method public constructor <init>(Ll/yh2;Ll/gt4;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/p9s;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/p9s;->a:Ll/yh2;

    .line 8
    .line 9
    iput-object p2, p0, Ll/p9s;->b:Ll/gt4;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/p9s;Ll/x20;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p9s;->e(Ll/x20;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public b(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p9s;->a:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v2, v1}, Ll/aiv;->h1(ZLjava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/o9s;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/o9s;-><init>(Ll/p9s;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p9s;->a:Ll/yh2;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yh2;->r4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p9s;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic e(Ll/x20;Ljava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/p9s;->c:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/p9s;->b:Ll/gt4;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/p9s;->c:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/p9s;->c:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/p9s;->b:Ll/gt4;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
