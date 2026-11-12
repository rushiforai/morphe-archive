.class public final Lvw8;
.super Loph;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public a:Z

.field public b:Z

.field public final synthetic c:Lxw8;


# direct methods
.method public constructor <init>(Lxw8;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvw8;->c:Lxw8;

    invoke-virtual {p0}, Lvw8;->a()V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "speed_dial.enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lvw8;->a()V

    :cond_b
    return-void
.end method

.method public final a()V
    .registers 6

    iget-object v0, p0, Lvw8;->c:Lxw8;

    iget-boolean v1, v0, Lxw8;->D:Z

    iget-object v2, v0, Lxw8;->g:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v0, Lxw8;->r:Lcom/opera/android/settings/SettingsManager;

    const/4 v4, 0x0

    if-eqz v1, :cond_21

    iget-boolean v0, v0, Lxw8;->C:Z

    if-eqz v0, :cond_21

    const-string v0, "speed_dial.enabled"

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "enable_newsfeed"

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v0, 0x1

    goto :goto_22

    :cond_21
    move v0, v4

    :goto_22
    iget-boolean v1, p0, Lvw8;->a:Z

    if-ne v0, v1, :cond_27

    return-void

    :cond_27
    iput-boolean v0, p0, Lvw8;->a:Z

    if-eqz v0, :cond_47

    invoke-virtual {v3, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v0

    if-eqz v0, :cond_3f

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    if-eqz v0, :cond_44

    :cond_3f
    const/4 v0, -0x1

    invoke-virtual {v2, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v4

    :cond_44
    iput-boolean v4, p0, Lvw8;->b:Z

    return-void

    :cond_47
    invoke-virtual {v3, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    return-void
.end method

.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 4

    if-nez p2, :cond_25

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object v0

    if-eqz v0, :cond_11

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    if-eqz v0, :cond_16

    :cond_11
    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p2

    :cond_16
    iget-boolean p1, p0, Lvw8;->b:Z

    if-nez p1, :cond_23

    if-eqz p2, :cond_23

    iget-object p1, p0, Lvw8;->c:Lxw8;

    iget-object p1, p1, Lxw8;->q:Lete;

    invoke-virtual {p1}, Lete;->a()V

    :cond_23
    iput-boolean p2, p0, Lvw8;->b:Z

    :cond_25
    return-void
.end method
