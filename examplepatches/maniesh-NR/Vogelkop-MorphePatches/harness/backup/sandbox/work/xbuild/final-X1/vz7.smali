.class public final Lvz7;
.super Lxz7;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout;B)V
    .registers 3

    iput-byte p2, p0, Lvz7;->b:B

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lvz7;->c:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final U(I)V
    .registers 3

    iget-byte v0, p0, Lvz7;->b:B

    iget-object p0, p0, Lvz7;->c:Landroid/widget/FrameLayout;

    packed-switch v0, :pswitch_data_14

    check-cast p0, Lcom/opera/android/custom_views/EmptyListView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/EmptyListView;->e(I)V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final V(I)V
    .registers 3

    iget-byte v0, p0, Lvz7;->b:B

    iget-object p0, p0, Lvz7;->c:Landroid/widget/FrameLayout;

    packed-switch v0, :pswitch_data_14

    check-cast p0, Lcom/opera/android/custom_views/EmptyListView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/EmptyListView;->g(I)V

    return-void

    :pswitch_d
    check-cast p0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
