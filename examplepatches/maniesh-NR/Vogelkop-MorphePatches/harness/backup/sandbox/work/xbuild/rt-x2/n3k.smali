.class public final synthetic Ln3k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhcb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp3k;


# direct methods
.method public synthetic constructor <init>(Lp3k;B)V
    .registers 3

    iput-byte p2, p0, Ln3k;->a:B

    iput-object p1, p0, Ln3k;->b:Lp3k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAsInt()I
    .registers 3

    iget-byte v0, p0, Ln3k;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ln3k;->b:Lp3k;

    packed-switch v0, :pswitch_data_3e

    iget-object p0, p0, Lp3k;->c:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    goto :goto_22

    :cond_1b
    invoke-virtual {p0, v1, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    :goto_22
    return p0

    :pswitch_23
    iget-object p0, p0, Lp3k;->b:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-virtual {p0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_36

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    goto :goto_3d

    :cond_36
    invoke-virtual {p0, v1, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    :goto_3d
    return p0

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
