.class public final Ljok;
.super Lgph;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:Z

.field public final synthetic b:Lkok;


# direct methods
.method public constructor <init>(Lkok;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljok;->b:Lkok;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    invoke-virtual {p0}, Ljok;->j()V

    return-void
.end method

.method public final c(II)V
    .registers 3

    invoke-virtual {p0}, Ljok;->j()V

    return-void
.end method

.method public final e(IILjava/lang/Object;)V
    .registers 4

    invoke-virtual {p0}, Ljok;->j()V

    return-void
.end method

.method public final f(II)V
    .registers 3

    invoke-virtual {p0}, Ljok;->j()V

    return-void
.end method

.method public final g(II)V
    .registers 3

    invoke-virtual {p0}, Ljok;->j()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    invoke-virtual {p0}, Ljok;->j()V

    return-void
.end method

.method public final j()V
    .registers 2

    iget-boolean v0, p0, Ljok;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljok;->a:Z

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final run()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Ljok;->a:Z

    iget-object p0, p0, Ljok;->b:Lkok;

    iget-boolean v0, p0, Lkok;->q:Z

    if-nez v0, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Lkok;->s:Leok;

    iget-object p0, p0, Lkok;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
