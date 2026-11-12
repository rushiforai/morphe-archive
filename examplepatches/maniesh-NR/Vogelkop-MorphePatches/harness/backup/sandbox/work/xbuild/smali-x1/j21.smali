.class public final synthetic Lj21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lj21;->a:B

    iput-object p1, p0, Lj21;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .registers 3

    iget-byte v0, p0, Lj21;->a:B

    iget-object p0, p0, Lj21;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lp37;->h0(Landroid/view/View;)V

    return-void

    :pswitch_d
    check-cast p0, Lfsj;

    invoke-virtual {p0}, Lfsj;->b()V

    return-void

    :pswitch_13
    check-cast p0, Lkxe;

    iget-object v0, p0, Lkxe;->H:Lvs;

    if-eqz v0, :cond_3b

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget v1, p0, Lkxe;->N:I

    if-eq v0, v1, :cond_3b

    iget-object v0, p0, Lkxe;->F:Lb98;

    if-eqz v0, :cond_2c

    invoke-virtual {p0}, Lkxe;->L0()V

    :cond_2c
    invoke-virtual {p0}, Lkxe;->K0()V

    iget-object v0, p0, Lkxe;->H:Lvs;

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iput v0, p0, Lkxe;->N:I

    :cond_3b
    return-void

    :pswitch_3c
    check-cast p0, Lcom/opera/android/bubbleview/BubbleView;

    sget v0, Lcom/opera/android/bubbleview/BubbleView;->D:I

    invoke-virtual {p0}, Lcom/opera/android/bubbleview/BubbleView;->c()Z

    return-void

    :pswitch_44
    check-cast p0, Lcom/opera/android/custom_views/AnchoringViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_44
        :pswitch_3c
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
