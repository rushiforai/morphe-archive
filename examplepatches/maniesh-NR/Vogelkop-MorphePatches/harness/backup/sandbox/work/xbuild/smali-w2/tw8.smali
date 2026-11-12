.class public final Ltw8;
.super Lgph;
.source "SourceFile"


# instance fields
.field public final a:Low8;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Z

.field public d:Lbn7;


# direct methods
.method public constructor <init>(Low8;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltw8;->a:Low8;

    iput-object p2, p0, Ltw8;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    invoke-virtual {p0}, Ltw8;->j()V

    return-void
.end method

.method public final c(II)V
    .registers 3

    invoke-virtual {p0}, Ltw8;->j()V

    return-void
.end method

.method public final f(II)V
    .registers 3

    invoke-virtual {p0}, Ltw8;->j()V

    return-void
.end method

.method public final g(II)V
    .registers 3

    invoke-virtual {p0}, Ltw8;->j()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    invoke-virtual {p0}, Ltw8;->j()V

    return-void
.end method

.method public final j()V
    .registers 3

    iget-boolean v0, p0, Ltw8;->c:Z

    if-nez v0, :cond_8

    iget-object v0, p0, Ltw8;->d:Lbn7;

    if-eqz v0, :cond_9

    :cond_8
    return-void

    :cond_9
    new-instance v0, Lbn7;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ltw8;->d:Lbn7;

    iget-object p0, p0, Ltw8;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
