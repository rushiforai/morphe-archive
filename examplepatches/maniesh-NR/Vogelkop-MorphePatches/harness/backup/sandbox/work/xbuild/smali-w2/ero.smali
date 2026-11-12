.class public final Lero;
.super Laoo;
.source "SourceFile"


# instance fields
.field public final synthetic u:B

.field public v:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/view/View;B)V
    .registers 4

    iput-byte p3, p0, Lero;->u:B

    invoke-direct {p0, p1, p2}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final k()Landroid/view/View;
    .registers 6

    iget-byte v0, p0, Lero;->u:B

    const/4 v1, -0x1

    const/4 v2, 0x0

    iget-object v3, p0, Laoo;->a:Landroid/content/Context;

    packed-switch v0, :pswitch_data_52

    new-instance v0, Ly46;

    invoke-direct {v0, v3, v2, v1}, Ly46;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lero;->v:Landroid/view/ViewGroup;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lero;->v:Landroid/view/ViewGroup;

    check-cast v1, Ly46;

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Lero;->v:Landroid/view/ViewGroup;

    check-cast p0, Ly46;

    return-object p0

    :pswitch_22
    new-instance v0, Ljxo;

    const/4 v4, 0x0

    invoke-direct {v0, v3, v2, v4}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v2, Landroidx/recyclerview/widget/GridLayoutManager;

    const/4 v4, 0x3

    invoke-direct {v2, v4}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v2, Lx93;

    invoke-direct {v2}, Lx93;-><init>()V

    iput-object v3, v2, Lx93;->b:Ljava/lang/Object;

    const/4 v2, 0x1

    iput-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    invoke-virtual {v0, v2}, Landroid/view/View;->setWillNotDraw(Z)V

    iput-object v0, p0, Lero;->v:Landroid/view/ViewGroup;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lero;->v:Landroid/view/ViewGroup;

    check-cast v1, Ljxo;

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Lero;->v:Landroid/view/ViewGroup;

    check-cast p0, Ljxo;

    return-object p0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final p()V
    .registers 2

    iget-byte v0, p0, Lero;->u:B

    packed-switch v0, :pswitch_data_14

    return-void

    :pswitch_6
    iget-object p0, p0, Lero;->v:Landroid/view/ViewGroup;

    check-cast p0, Ly46;

    iget-object p0, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p0, Lfro;

    if-eqz p0, :cond_13

    invoke-interface {p0}, Lfro;->a()V

    :cond_13
    return-void

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
