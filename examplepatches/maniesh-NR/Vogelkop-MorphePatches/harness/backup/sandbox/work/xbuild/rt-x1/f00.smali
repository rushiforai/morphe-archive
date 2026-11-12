.class public abstract Lf00;
.super Ll00;
.source "SourceFile"


# instance fields
.field public final synthetic E:B


# direct methods
.method public constructor <init>(Landroid/view/View;IILkze;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lf00;->E:B

    new-instance v1, Lvv8;

    invoke-direct {v1, v0}, Lvv8;-><init>(B)V

    invoke-direct {p0, p1, v1, p4}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    new-instance p4, Ljsd;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p4, p1}, Ljsd;-><init>(Landroid/content/Context;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    int-to-float p2, p2

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    int-to-float p2, p3

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 p3, 0x1

    invoke-static {p3, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const/16 p1, 0x11

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p4}, Lxv8;->h0(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lkze;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lf00;->E:B

    .line 63
    new-instance v0, Lm00;

    const/4 v1, 0x0

    .line 64
    invoke-direct {v0, v1}, Lvv8;-><init>(B)V

    .line 65
    invoke-direct {p0, p1, v0, p2}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    return-void
.end method


# virtual methods
.method public final bridge synthetic Z()Lmq;
    .registers 2

    iget-byte v0, p0, Lf00;->E:B

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge synthetic e0()Lmq;
    .registers 2

    iget-byte v0, p0, Lf00;->E:B

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Ll00;->k0()Lx10;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Ll00;->k0()Lx10;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge synthetic f0()Lyz;
    .registers 2

    iget-byte v0, p0, Lf00;->E:B

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
