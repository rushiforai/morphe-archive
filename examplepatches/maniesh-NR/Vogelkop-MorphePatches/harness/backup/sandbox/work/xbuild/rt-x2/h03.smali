.class public final Lh03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfck;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout;B)V
    .registers 3

    iput-byte p2, p0, Lh03;->a:B

    iput-object p1, p0, Lh03;->b:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 2

    iget-byte v0, p0, Lh03;->a:B

    iget-object p0, p0, Lh03;->b:Landroid/widget/FrameLayout;

    packed-switch v0, :pswitch_data_28

    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    sget v0, Lcom/opera/android/StatusBarDrawingFrameLayout;->l:I

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-static {p0, v0}, Lp37;->a0(FI)I

    move-result p0

    return p0

    :pswitch_16
    check-cast p0, Lcom/opera/android/browser/OperaPageRootView;

    iget p0, p0, Lcom/opera/android/browser/OperaPageRootView;->g:I

    return p0

    :pswitch_1b
    check-cast p0, Li03;

    iget v0, p0, Li03;->f:I

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-static {p0, v0}, Lp37;->a0(FI)I

    move-result p0

    return p0

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_16
    .end packed-switch
.end method

.method public final b()I
    .registers 2

    iget-byte v0, p0, Lh03;->a:B

    iget-object p0, p0, Lh03;->b:Landroid/widget/FrameLayout;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    sget v0, Lcom/opera/android/StatusBarDrawingFrameLayout;->l:I

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->e:Z

    if-eqz v0, :cond_12

    iget v0, p0, Lcom/opera/android/StatusBarDrawingFrameLayout;->j:I

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-static {p0, v0}, Lp37;->a0(FI)I

    move-result p0

    return p0

    :pswitch_1c
    check-cast p0, Lcom/opera/android/browser/OperaPageRootView;

    iget p0, p0, Lcom/opera/android/browser/OperaPageRootView;->f:I

    return p0

    :pswitch_21
    check-cast p0, Li03;

    iget v0, p0, Li03;->e:I

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-static {p0, v0}, Lp37;->a0(FI)I

    move-result p0

    return p0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_21
        :pswitch_1c
    .end packed-switch
.end method

.method public final getView()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lh03;->a:B

    iget-object p0, p0, Lh03;->b:Landroid/widget/FrameLayout;

    packed-switch v0, :pswitch_data_10

    check-cast p0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    return-object p0

    :pswitch_a
    check-cast p0, Lcom/opera/android/browser/OperaPageRootView;

    return-object p0

    :pswitch_d
    check-cast p0, Li03;

    return-object p0

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method
