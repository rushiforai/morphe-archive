.class public abstract Lwu8;
.super Lab2;
.source "SourceFile"

# interfaces
.implements Lev8;
.implements Lrjm;
.implements Ly9n;


# instance fields
.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/CardView;

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;->a:Ll2c;

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Ll2c;->d(I)V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    if-lez p2, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x0

    :goto_5
    iput-boolean p1, p0, Lwu8;->d:Z

    invoke-virtual {p0}, Lwu8;->b0()V

    return-void
.end method

.method public Y()V
    .registers 2

    iget-boolean v0, p0, Lwu8;->f:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    iput-boolean v0, p0, Lwu8;->f:Z

    invoke-virtual {p0}, Lwu8;->c0()V

    :cond_a
    return-void
.end method

.method public final b(Lsjm;)V
    .registers 2

    invoke-virtual {p1}, Lsjm;->a()Z

    move-result p1

    iput-boolean p1, p0, Lwu8;->e:Z

    invoke-virtual {p0}, Lwu8;->b0()V

    return-void
.end method

.method public final b0()V
    .registers 5

    iget-boolean v0, p0, Lwu8;->e:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lwu8;->d:Z

    if-eqz v0, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    move v0, v1

    :goto_d
    if-eqz v0, :cond_18

    iget-boolean v3, p0, Lwu8;->f:Z

    if-nez v3, :cond_18

    iput-boolean v2, p0, Lwu8;->f:Z

    invoke-virtual {p0}, Lwu8;->e0()V

    :cond_18
    if-nez v0, :cond_23

    iget-boolean v0, p0, Lwu8;->f:Z

    if-eqz v0, :cond_23

    iput-boolean v1, p0, Lwu8;->f:Z

    invoke-virtual {p0}, Lwu8;->c0()V

    :cond_23
    return-void
.end method

.method public abstract c0()V
.end method

.method public abstract e0()V
.end method
