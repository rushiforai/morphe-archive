.class public final Lpbn;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Ly83;

.field public final c:Llrk;


# direct methods
.method public constructor <init>(Ly83;Llrk;)V
    .registers 4

    iget-object v0, p1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lpbn;->b:Ly83;

    iput-object p2, p0, Lpbn;->c:Llrk;

    iget-object p2, p1, Ly83;->h:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Ly83;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    const p2, 0x7f080512

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    new-instance p2, Lsvk;

    const/16 v0, 0x14

    invoke-direct {p2, p0, v0}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lsvk;->a(Landroid/view/View;)V

    return-void
.end method
