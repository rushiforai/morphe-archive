.class public final synthetic Lyqk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmrk;


# direct methods
.method public synthetic constructor <init>(Lmrk;B)V
    .registers 3

    iput-byte p2, p0, Lyqk;->a:B

    iput-object p1, p0, Lyqk;->b:Lmrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lyqk;->a:B

    iget-object p0, p0, Lyqk;->b:Lmrk;

    packed-switch v0, :pswitch_data_3a

    iget-object p0, p0, Lmrk;->y:Lw6j;

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object p0

    return-object p0

    :pswitch_16
    sget-object v0, Lrc5;->d:Lixh;

    iget-object p0, p0, Lmrk;->y:Lw6j;

    iget-object p0, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_2b
    iget-object p0, p0, Lmrk;->b:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_36
    iget-object p0, p0, Lmrk;->b:Landroid/view/ViewGroup;

    return-object p0

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_36
        :pswitch_2b
        :pswitch_16
    .end packed-switch
.end method
