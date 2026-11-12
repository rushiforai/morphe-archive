.class public final Lsbf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsbf;->a:B

    iput-object p1, p0, Lsbf;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lukh;)V
    .registers 6

    iget-byte v0, p0, Lsbf;->a:B

    iget-object p0, p0, Lsbf;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_64

    check-cast p0, Ls9i;

    iget-object p0, p0, Ls9i;->e:Ljava/lang/Object;

    check-cast p0, Lkwf;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p0

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    const v0, 0x7f0a07ed

    invoke-virtual {p0, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    iget-boolean v0, p1, Lukh;->b:Z

    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    const v1, 0x7f0a05bd

    invoke-static {v1, p0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/appcompat/widget/SwitchCompat;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-boolean p1, p1, Lukh;->c:Z

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_3b
    check-cast p0, Lvbf;

    iget-boolean v0, p1, Lukh;->b:Z

    iget-boolean v1, p1, Lukh;->c:Z

    iget-boolean p1, p1, Lukh;->d:Z

    invoke-virtual {p0}, Lvbf;->q()V

    const-wide/16 v2, 0x2

    invoke-virtual {p0, v2, v3, v0}, Lvbf;->r(JZ)V

    const-wide/16 v2, 0x4

    invoke-virtual {p0, v2, v3, v1}, Lvbf;->r(JZ)V

    const-wide/16 v0, 0x200

    invoke-virtual {p0, v0, v1, p1}, Lvbf;->r(JZ)V

    iget-object p1, p0, Lvbf;->t:Ltbf;

    invoke-virtual {p1}, Ltbf;->a()Lqwi;

    move-result-object v0

    invoke-virtual {p0}, Lvbf;->q()V

    iput-object v0, p1, Ltbf;->d:Lqwi;

    invoke-virtual {p0}, Lvbf;->u()V

    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method
