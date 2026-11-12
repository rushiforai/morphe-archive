.class public final Lf7o;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;

.field public final c:I

.field public final d:F


# direct methods
.method public constructor <init>(Lq5g;)V
    .registers 4

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lf7o;->b:Lq5g;

    new-instance v0, Ljxh;

    const v1, 0x7f070a41

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    iget-object p1, p1, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lf7o;->c:I

    new-instance v0, Ljxh;

    const v1, 0x7f070a42

    invoke-direct {v0, v1}, Ljxh;-><init>(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lf7o;->d:F

    new-instance v0, Loon;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Loon;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_3f

    return-void

    :cond_3f
    invoke-static {p0, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method
