.class public final Lutd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnActionExpandListener;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lutd;->a:B

    iput-object p1, p0, Lutd;->c:Ljava/lang/Object;

    iput-object p2, p0, Lutd;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onMenuItemActionCollapse(Landroid/view/MenuItem;)Z
    .registers 4

    iget-byte v0, p0, Lutd;->a:B

    iget-object v1, p0, Lutd;->c:Ljava/lang/Object;

    iget-object p0, p0, Lutd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Litd;

    const v0, 0x7f0a0932

    invoke-virtual {p0, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_1f

    check-cast v1, Luoj;

    invoke-virtual {v1, p1}, Luoj;->G0(Z)V

    const/4 p1, 0x1

    :cond_1f
    return p1

    :pswitch_20
    check-cast p0, Landroid/view/MenuItem$OnActionExpandListener;

    check-cast v1, Lvtd;

    invoke-virtual {v1, p1}, Lk8;->U(Landroid/view/MenuItem;)Landroid/view/MenuItem;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/view/MenuItem$OnActionExpandListener;->onMenuItemActionCollapse(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method

.method public final onMenuItemActionExpand(Landroid/view/MenuItem;)Z
    .registers 4

    iget-byte v0, p0, Lutd;->a:B

    iget-object v1, p0, Lutd;->c:Ljava/lang/Object;

    iget-object p0, p0, Lutd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Litd;

    const v0, 0x7f0a0932

    invoke-virtual {p0, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    const/4 p0, 0x0

    goto :goto_20

    :cond_1a
    check-cast v1, Luoj;

    const/4 p0, 0x1

    invoke-virtual {v1, p0}, Luoj;->G0(Z)V

    :goto_20
    return p0

    :pswitch_21
    check-cast p0, Landroid/view/MenuItem$OnActionExpandListener;

    check-cast v1, Lvtd;

    invoke-virtual {v1, p1}, Lk8;->U(Landroid/view/MenuItem;)Landroid/view/MenuItem;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/view/MenuItem$OnActionExpandListener;->onMenuItemActionExpand(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
