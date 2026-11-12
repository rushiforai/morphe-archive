.class public final Lwdh;
.super Lgph;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lile;


# instance fields
.field public a:Z

.field public final synthetic b:Lcy;


# direct methods
.method public constructor <init>(Lcy;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwdh;->b:Lcy;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/core/widget/NestedScrollView;IIII)V
    .registers 6

    if-ne p2, p4, :cond_5

    if-ne p3, p5, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final c(II)V
    .registers 3

    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final e(IILjava/lang/Object;)V
    .registers 4

    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final f(II)V
    .registers 3

    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final g(II)V
    .registers 3

    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    invoke-virtual {p0}, Lwdh;->j()V

    return-void
.end method

.method public final j()V
    .registers 2

    iget-object v0, p0, Lwdh;->b:Lcy;

    iget-boolean v0, v0, Lcy;->a:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lwdh;->a:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lwdh;->a:Z

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_10
    return-void
.end method

.method public final run()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lwdh;->a:Z

    iget-object p0, p0, Lwdh;->b:Lcy;

    iget-object v0, p0, Lcy;->g:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_c

    return-void

    :cond_c
    iget-object p0, p0, Lcy;->d:Ljava/lang/Object;

    check-cast p0, Lxdh;

    invoke-virtual {p0, v0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
