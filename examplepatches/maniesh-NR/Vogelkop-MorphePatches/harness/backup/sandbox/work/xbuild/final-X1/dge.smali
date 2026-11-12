.class public final Ldge;
.super Lcom/opera/android/custom_views/LayoutDirectionLinearLayoutManager;
.source "SourceFile"


# instance fields
.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    iput-byte v0, p0, Ldge;->b:B

    invoke-direct {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(IZ)V
    .registers 4

    .line 7
    const/4 v0, 0x1

    iput-byte v0, p0, Ldge;->b:B

    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    return-void
.end method


# virtual methods
.method public final smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Lvph;I)V
    .registers 5

    iget-byte p2, p0, Ldge;->b:B

    packed-switch p2, :pswitch_data_28

    new-instance p2, Lmxf;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x5

    invoke-direct {p2, p0, p1, v0}, Lmxf;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-virtual {p2, p3}, Luph;->setTargetPosition(I)V

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return-void

    :pswitch_16
    new-instance p2, Lmxf;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x4

    invoke-direct {p2, p0, p1, v0}, Lmxf;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-virtual {p2, p3}, Luph;->setTargetPosition(I)V

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
