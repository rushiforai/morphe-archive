.class public final Lr3i;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Lqfl;

.field public k:Z


# direct methods
.method public constructor <init>(Lqfl;)V
    .registers 2

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lr3i;->j:Lqfl;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 5

    const p2, 0x7f100030

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    iget-object p2, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p2, Lm66;

    const v0, 0x7f0a0689

    invoke-virtual {p2, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    const/4 v0, 0x1

    invoke-interface {p2, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v1, 0x7f0d031f

    invoke-interface {p2, v1}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {p2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_3c

    sget-object v1, Lq9n;->c:Ll5b;

    const v1, 0x7f0a05bd

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p2, Landroidx/appcompat/widget/SwitchCompat;

    iget-boolean v1, p0, Lr3i;->k:Z

    invoke-virtual {p2, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    new-instance v1, Liwf;

    invoke-direct {v1, p0, p1, v0}, Liwf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_3c
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const v0, 0x7f0a0689

    if-ne p0, v0, :cond_22

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_20

    sget-object p1, Lq9n;->c:Ll5b;

    const p1, 0x7f0a05bd

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p0}, Landroidx/appcompat/widget/SwitchCompat;->toggle()V

    :cond_20
    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0
.end method
