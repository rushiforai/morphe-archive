.class public final Lsm3;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public final k:I

.field public final l:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lsm3;->j:B

    invoke-direct {p0}, Lo73;-><init>()V

    iput p1, p0, Lsm3;->k:I

    iput-object p2, p0, Lsm3;->l:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 13

    iget-byte p2, p0, Lsm3;->j:B

    const/4 v0, 0x0

    const/4 v1, 0x3

    const/4 v2, 0x2

    iget p0, p0, Lsm3;->k:I

    const/4 v3, 0x1

    packed-switch p2, :pswitch_data_8c

    const p2, 0x7f10002e

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    iget-object p2, p1, Lr9i;->c:Ljava/lang/Object;

    move-object v4, p2

    check-cast v4, Lm66;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v5, 0x7f14060f

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Litd;->u(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_3c

    if-eq p0, v3, :cond_38

    if-eq p0, v2, :cond_34

    if-ne p0, v1, :cond_3f

    const v0, 0x7f0a06a6

    goto :goto_3f

    :cond_34
    const v0, 0x7f0a06a5

    goto :goto_3f

    :cond_38
    const v0, 0x7f0a06a7

    goto :goto_3f

    :cond_3c
    const v0, 0x7f0a06a4

    :cond_3f
    :goto_3f
    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_47
    const p2, 0x7f10000e

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    iget-object p2, p1, Lr9i;->c:Ljava/lang/Object;

    move-object v4, p2

    check-cast v4, Lm66;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v5, 0x7f14060f

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v4 .. v9}, Litd;->u(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eq p0, v3, :cond_80

    if-eq p0, v2, :cond_7c

    if-eq p0, v1, :cond_78

    const/4 p2, 0x4

    if-eq p0, p2, :cond_74

    const/4 p2, 0x5

    if-ne p0, p2, :cond_83

    const v0, 0x7f0a0178

    goto :goto_83

    :cond_74
    const v0, 0x7f0a0177

    goto :goto_83

    :cond_78
    const v0, 0x7f0a0176

    goto :goto_83

    :cond_7c
    const v0, 0x7f0a0174

    goto :goto_83

    :cond_80
    const v0, 0x7f0a0175

    :cond_83
    :goto_83
    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_47
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 9

    iget-byte v0, p0, Lsm3;->j:B

    const/4 v1, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x4

    iget-object p0, p0, Lsm3;->l:Ljava/lang/Object;

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_8c

    check-cast p0, Lr9g;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v6, 0x7f0a06a4

    if-ne v0, v6, :cond_1c

    invoke-virtual {p0, v5}, Lr9g;->h(I)V

    :goto_1a
    move v1, v5

    goto :goto_43

    :cond_1c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v6, 0x7f0a06a6

    if-ne v0, v6, :cond_29

    invoke-virtual {p0, v4}, Lr9g;->h(I)V

    goto :goto_1a

    :cond_29
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v4, 0x7f0a06a7

    if-ne v0, v4, :cond_36

    invoke-virtual {p0, v3}, Lr9g;->h(I)V

    goto :goto_1a

    :cond_36
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a06a5

    if-ne p1, v0, :cond_43

    invoke-virtual {p0, v2}, Lr9g;->h(I)V

    goto :goto_1a

    :cond_43
    :goto_43
    return v1

    :pswitch_44
    check-cast p0, Lva2;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v6, 0x7f0a0175

    if-ne v0, v6, :cond_54

    invoke-virtual {p0, v3}, Lva2;->m(I)V

    :goto_52
    move v1, v5

    goto :goto_8a

    :cond_54
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v3, 0x7f0a0176

    if-ne v0, v3, :cond_61

    invoke-virtual {p0, v4}, Lva2;->m(I)V

    goto :goto_52

    :cond_61
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v3, 0x7f0a0177

    if-ne v0, v3, :cond_6f

    const/4 p1, 0x5

    invoke-virtual {p0, p1}, Lva2;->m(I)V

    goto :goto_52

    :cond_6f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v3, 0x7f0a0178

    if-ne v0, v3, :cond_7d

    const/4 p1, 0x6

    invoke-virtual {p0, p1}, Lva2;->m(I)V

    goto :goto_52

    :cond_7d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0174

    if-ne p1, v0, :cond_8a

    invoke-virtual {p0, v2}, Lva2;->m(I)V

    goto :goto_52

    :cond_8a
    :goto_8a
    return v1

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_44
    .end packed-switch
.end method
