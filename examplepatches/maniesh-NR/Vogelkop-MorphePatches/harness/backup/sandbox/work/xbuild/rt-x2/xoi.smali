.class public final Lxoi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ls9i;

.field public final c:Lhu8;

.field public final d:Lx5f;

.field public e:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

.field public f:Z

.field public final g:Landroidx/recyclerview/widget/RecyclerView;

.field public final h:Lvx;

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ls9i;Landroidx/recyclerview/widget/RecyclerView;Lvx;Lhu8;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxoi;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iput-object p2, p0, Lxoi;->b:Ls9i;

    iput-object p5, p0, Lxoi;->c:Lhu8;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p2

    iget-object p2, p2, Ld6j;->c:Lx5f;

    iput-object p2, p0, Lxoi;->d:Lx5f;

    iput-object p3, p0, Lxoi;->g:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Lxoi;->h:Lvx;

    new-instance p2, Lyc3;

    const/4 p4, 0x5

    invoke-direct {p2, p0, p4}, Lyc3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance p2, Lwoi;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lwoi;-><init>(Lxoi;Landroid/content/res/Resources;)V

    iput-object p2, p3, Landroidx/recyclerview/widget/RecyclerView;->V:Lzwg;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 3

    iget-object v0, p0, Lxoi;->h:Lvx;

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_29

    iget-object p0, p0, Lxoi;->g:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v1

    if-eqz v1, :cond_21

    iget-object v1, v1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    if-nez v1, :cond_21

    move p0, v0

    goto :goto_26

    :cond_21
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    :goto_26
    if-eqz p0, :cond_29

    return v0

    :cond_29
    const/4 p0, 0x1

    return p0
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    const/4 p1, 0x1

    iput-boolean p1, p0, Lxoi;->f:Z

    iget-object v0, p0, Lxoi;->b:Ls9i;

    invoke-virtual {v0, p0}, Ls9i;->U(Lxoi;)V

    iget-object p0, p0, Lxoi;->c:Lhu8;

    iget-object p0, p0, Lhu8;->a:Lxw8;

    invoke-virtual {p0}, Lxw8;->g()V

    iget-object v0, p0, Lxw8;->o:Lkue;

    iget-object v0, v0, Lkue;->c:Landroid/view/View;

    invoke-static {v0}, Lq9n;->x(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x2

    goto :goto_1c

    :cond_1b
    move v0, p1

    :goto_1c
    invoke-virtual {p0, v0, p1}, Lxw8;->e(IZ)V

    return-void
.end method
