.class public final Lx6n;
.super Lo6n;
.source "SourceFile"

# interfaces
.implements Lh4a;
.implements Ly9n;


# instance fields
.field public final c:Ltjn;

.field public final d:Lbt1;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILtjn;)V
    .registers 7

    new-instance v0, Ly46;

    new-instance v1, Lk6n;

    const/4 v2, 0x5

    invoke-direct {v1, p3, v2}, Lk6n;-><init>(Ltjn;B)V

    const/4 v2, 0x0

    invoke-direct {v0, p1, v2, v1}, Ly46;-><init>(Landroid/content/Context;Lhcb;Lhcb;)V

    invoke-direct {p0, v0, p2, p3}, Lo6n;-><init>(Ly46;ILtjn;)V

    iput-object p3, p0, Lx6n;->c:Ltjn;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p2, Landroid/view/ViewGroup;

    invoke-static {p1, p2}, Lbt1;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lbt1;

    move-result-object p1

    iput-object p1, p0, Lx6n;->d:Lbt1;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lsvk;

    const/16 p3, 0x11

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lpkm;

    const/4 p3, 0x6

    invoke-direct {p2, p0, p3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    const/16 p1, 0x64

    if-ge p3, p1, :cond_b

    if-lt p2, p1, :cond_b

    iget-object p0, p0, Lx6n;->c:Ltjn;

    invoke-interface {p0}, Ltjn;->l()V

    :cond_b
    return-void
.end method

.method public final l(Landroid/graphics/Rect;)V
    .registers 3

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v0, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->top:I

    return-void
.end method
