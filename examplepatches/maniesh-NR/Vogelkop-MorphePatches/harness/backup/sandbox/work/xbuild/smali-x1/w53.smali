.class public final synthetic Lw53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnHoverListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lw53;->a:B

    iput-object p1, p0, Lw53;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onHover(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9

    iget-byte v0, p0, Lw53;->a:B

    const/4 v1, 0x1

    const v2, 0x7f06063b

    const/16 v3, 0xa

    const v4, 0x7f06026c

    const/16 v5, 0x9

    iget-object p0, p0, Lw53;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_72

    check-cast p0, Lcom/opera/android/menu/CustomMenuItemView;

    sget v0, Lcom/opera/android/menu/CustomMenuItemView;->f:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_27

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_27
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-ne p2, v3, :cond_3b

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p2, 0x7f0402f3

    invoke-static {p2, p0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_3b
    return v1

    :pswitch_3c
    check-cast p0, Ly53;

    iget-object p1, p0, Ly53;->g:Landroid/content/Context;

    iget-object p0, p0, Ly53;->c:Lor2;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_58

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lrf2;

    iget-object p0, p0, Lrf2;->i:Ljava/lang/Object;

    check-cast p0, Landroidx/cardview/widget/CardView;

    invoke-virtual {p1, v4}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->b(I)V

    goto :goto_70

    :cond_58
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    if-ne p2, v3, :cond_70

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lrf2;

    iget-object p0, p0, Lrf2;->i:Ljava/lang/Object;

    check-cast p0, Landroidx/cardview/widget/CardView;

    const p2, 0x7f040670

    invoke-static {p2, p1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->b(I)V

    :cond_70
    :goto_70
    return v1

    nop

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_3c
    .end packed-switch
.end method
