.class public final Lu93;
.super Lgph;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/ViewGroup;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:Ljava/lang/Object;

.field public final d:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public e:Landroidx/recyclerview/widget/d;

.field public final synthetic f:Ly93;


# direct methods
.method public constructor <init>(Ly93;Landroid/view/ViewGroup;Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu93;->f:Ly93;

    iput-object p2, p0, Lu93;->a:Landroid/view/ViewGroup;

    iput-object p3, p0, Lu93;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Lu93;->c:Ljava/lang/Object;

    iput-object p5, p0, Lu93;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-object v0, p0, Lu93;->b:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->X(I)Liph;

    move-result-object v0

    check-cast v0, Lr8a;

    iget-object v1, p0, Lu93;->f:Ly93;

    iget-object p0, p0, Lu93;->c:Ljava/lang/Object;

    invoke-virtual {v1, p0}, Ly93;->I0(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lr8a;->b:Ljava/lang/String;

    const/4 p0, 0x0

    iput-object p0, v0, Lr8a;->e:Landroid/text/StaticLayout;

    iget-object p0, v0, Lr8a;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    return-void
.end method

.method public final c(II)V
    .registers 3

    invoke-virtual {p0}, Lu93;->b()V

    return-void
.end method

.method public final f(II)V
    .registers 3

    invoke-virtual {p0}, Lu93;->b()V

    return-void
.end method

.method public final g(II)V
    .registers 3

    invoke-virtual {p0}, Lu93;->b()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    invoke-virtual {p0}, Lu93;->b()V

    return-void
.end method
