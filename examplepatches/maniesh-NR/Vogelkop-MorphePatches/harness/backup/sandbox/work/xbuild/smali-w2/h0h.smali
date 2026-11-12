.class public final Lh0h;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public final k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;

.field public final m:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lblh;Landroid/view/View;Lilh;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lh0h;->j:B

    .line 21
    iput-object p2, p0, Lh0h;->k:Ljava/lang/Object;

    iput-object p3, p0, Lh0h;->l:Ljava/lang/Object;

    iput-object p1, p0, Lh0h;->m:Ljava/lang/Object;

    invoke-direct {p0}, Lo73;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Llag;Lr9g;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lh0h;->j:B

    .line 17
    invoke-direct {p0}, Lo73;-><init>()V

    .line 18
    iput-object p1, p0, Lh0h;->k:Ljava/lang/Object;

    .line 19
    iput-object p2, p0, Lh0h;->l:Ljava/lang/Object;

    .line 20
    iput-object p3, p0, Lh0h;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ln9k;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lh0h;->j:B

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lh0h;->k:Ljava/lang/Object;

    new-instance p1, Lhe;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lhe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lh0h;->m:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)I
    .registers 5

    iget-byte v0, p0, Lh0h;->j:B

    packed-switch v0, :pswitch_data_34

    invoke-super {p0, p1}, Lo73;->e(Landroid/view/View;)I

    move-result p0

    return p0

    :pswitch_a
    invoke-super {p0, p1}, Lo73;->e(Landroid/view/View;)I

    move-result v0

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result v2

    invoke-virtual {p0, p1}, Lo73;->d(Landroid/view/View;)I

    move-result p0

    invoke-static {p0, v2}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result p0

    and-int/lit8 p0, p0, 0x7

    const/4 p1, 0x3

    if-ne p0, p1, :cond_2e

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result p0

    goto :goto_33

    :cond_2e
    neg-int p0, v1

    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    :goto_33
    return p0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final h(Landroid/view/View;)I
    .registers 3

    iget-byte v0, p0, Lh0h;->j:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Lo73;->h(Landroid/view/View;)I

    move-result p0

    return p0

    :pswitch_a
    invoke-super {p0, p1}, Lo73;->h(Landroid/view/View;)I

    move-result p0

    const/high16 v0, 0x42600000    # 56.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v0, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    sub-int/2addr p0, p1

    return p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final j(Landroid/view/View;)Z
    .registers 3

    iget-byte v0, p0, Lh0h;->j:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Lo73;->j(Landroid/view/View;)Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x1

    return p0

    :pswitch_data_c
    .packed-switch 0x2
        :pswitch_a
    .end packed-switch
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 14

    iget-byte p2, p0, Lh0h;->j:B

    iget-object v0, p0, Lh0h;->k:Ljava/lang/Object;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch p2, :pswitch_data_1ba

    iget-object p2, p1, Lr9i;->b:Ljava/lang/Object;

    check-cast p2, Ldkf;

    iget-object v4, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast v4, Lm66;

    iput-object p2, p0, Lh0h;->l:Ljava/lang/Object;

    const p2, 0x7f100036

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    check-cast v0, Ln9k;

    iget-object p1, v0, Ln9k;->b:Ljava/lang/Object;

    check-cast p1, Lr9l;

    iget-object p2, v0, Ln9k;->b:Ljava/lang/Object;

    check-cast p2, Lr9l;

    invoke-virtual {p1}, Lr9l;->k()Z

    move-result p1

    if-eqz p1, :cond_30

    const v0, 0x7f0a0b3a

    invoke-virtual {v4, v0}, Litd;->removeItem(I)V

    :cond_30
    const v0, 0x7f0a0b3b

    invoke-virtual {v4, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_50

    iget-object v5, p0, Lh0h;->l:Ljava/lang/Object;

    check-cast v5, Ldkf;

    if-nez v5, :cond_40

    move-object v5, v2

    :cond_40
    if-eqz p1, :cond_46

    const p1, 0x7f140b0f

    goto :goto_49

    :cond_46
    const p1, 0x7f1400d9

    :goto_49
    invoke-virtual {v5, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_50
    invoke-virtual {p2}, Lr9l;->k()Z

    move-result p1

    if-nez p1, :cond_66

    iget-object p1, p2, Lr9l;->E:Ll45;

    iget-object p1, p1, Ll45;->a:Ljava/lang/Object;

    check-cast p1, Lebl;

    iget-object p1, p1, Lebl;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_66

    move p1, v3

    goto :goto_6d

    :cond_66
    const p1, 0x7f0a0b3e

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    move p1, v1

    :goto_6d
    iget-object v0, p2, Lr9l;->E:Ll45;

    iget-object v0, v0, Ll45;->a:Ljava/lang/Object;

    check-cast v0, Lebl;

    iget-object v0, v0, Lebl;->v:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_83

    const v0, 0x7f0a0b41

    invoke-virtual {v4, v0}, Litd;->removeItem(I)V

    add-int/lit8 p1, p1, 0x1

    :cond_83
    const/4 v0, 0x2

    if-lt p1, v0, :cond_8c

    const p1, 0x7f0a08a4

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    :cond_8c
    iget-object p1, p2, Lr9l;->c:Lk6l;

    iget-object p1, p1, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result p1

    if-nez p1, :cond_a3

    const p1, 0x7f0a0b3d

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    move v3, v1

    :cond_a3
    iget-object p1, p2, Lr9l;->c:Lk6l;

    iget-object p1, p1, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result p1

    if-nez p1, :cond_bb

    const p1, 0x7f0a0b43

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    add-int/lit8 v3, v3, 0x1

    :cond_bb
    invoke-virtual {p2}, Lr9l;->f()Lz5l;

    move-result-object p1

    iget-object p1, p1, Lz5l;->v:Lx2l;

    iget-object p1, p1, Lx2l;->o:Lo2l;

    iget-object p1, p1, Lo2l;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_d9

    const p1, 0x7f0a0b3f

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    const p1, 0x7f0a0b3c

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    add-int/lit8 v3, v3, 0x2

    :cond_d9
    const/4 p1, 0x4

    if-lt v3, p1, :cond_e2

    const p1, 0x7f0a0230

    invoke-virtual {v4, p1}, Litd;->removeItem(I)V

    :cond_e2
    iget-object p1, p2, Lr9l;->D:Lg4l;

    invoke-virtual {p1, v1}, Lg4l;->b(Z)Z

    move-result v0

    const v1, 0x7f0a0b5c

    if-eqz v0, :cond_11f

    iget-object p1, p1, Lg4l;->i:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    sget-object v0, La4l;->c:La4l;

    if-ne p1, v0, :cond_11f

    invoke-virtual {v4, v1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_122

    iget-object v0, p0, Lh0h;->l:Ljava/lang/Object;

    check-cast v0, Ldkf;

    if-nez v0, :cond_104

    move-object v0, v2

    :cond_104
    iget-object p2, p2, Lr9l;->D:Lg4l;

    iget-object p2, p2, Lg4l;->c:Lc4l;

    iget-object p2, p2, Lc4l;->d:Lzg;

    iget-object p2, p2, Lzg;->d:Ljava/lang/Object;

    check-cast p2, Luz3;

    if-eqz p2, :cond_114

    const p2, 0x7f1404d2

    goto :goto_117

    :cond_114
    const p2, 0x7f141255

    :goto_117
    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_122

    :cond_11f
    invoke-virtual {v4, v1}, Litd;->removeItem(I)V

    :cond_122
    :goto_122
    iget-object p1, p0, Lh0h;->l:Ljava/lang/Object;

    check-cast p1, Ldkf;

    if-eqz p1, :cond_129

    move-object v2, p1

    :cond_129
    invoke-static {v2}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object p1

    iget-object p0, p0, Lh0h;->m:Ljava/lang/Object;

    check-cast p0, Lhe;

    invoke-interface {p1, p0}, Lm24;->a(Ll24;)V

    return-void

    :pswitch_135
    const p0, 0x7f100010

    invoke-virtual {p1, p0}, Lr9i;->L(I)V

    iget-object p0, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    const p1, 0x7f0a06a2

    invoke-virtual {p0, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :pswitch_14a
    iget-object p2, p0, Lo73;->a:Ldkf;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v4, 0x7f07084d

    invoke-virtual {p2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iget-object v4, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v4, Lo66;

    iput p2, v4, Lo66;->u:I

    invoke-virtual {p1, v1}, Lr9i;->S(Z)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    check-cast v0, Ljava/lang/String;

    iget-object p2, p0, Lh0h;->l:Ljava/lang/Object;

    check-cast p2, Llag;

    sget-object v4, Ls9g;->h:Ls9g;

    invoke-virtual {v4, v0, v3}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object v4

    if-eqz v4, :cond_178

    invoke-virtual {v4, p2, v2}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v5

    if-nez v5, :cond_17a

    :cond_178
    move-object v5, v2

    goto :goto_188

    :cond_17a
    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, p2}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_188

    sget-object v5, Lkag;->d:Lkag;

    :cond_188
    :goto_188
    invoke-static {p2}, Lui6;->j(Llag;)[Lkag;

    move-result-object v4

    array-length v6, v4

    move v7, v3

    :goto_18e
    if-ge v7, v6, :cond_1b9

    aget-object v8, v4, v7

    iget-object v9, p0, Lo73;->a:Ldkf;

    invoke-static {v9, p2, v8, v0}, Lui6;->R(Landroid/content/Context;Llag;Lkag;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v3, v3, v3, v9}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v9

    const v10, 0x7f0d00c2

    invoke-virtual {v9, v10}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-virtual {v9, v1}, Lptd;->setCheckable(Z)Landroid/view/MenuItem;

    invoke-virtual {v8, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    invoke-virtual {v9, v10}, Lptd;->setChecked(Z)Landroid/view/MenuItem;

    invoke-virtual {v9}, Lptd;->getActionView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9, v8}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v9, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_18e

    :cond_1b9
    return-void

    :pswitch_data_1ba
    .packed-switch 0x0
        :pswitch_14a
        :pswitch_135
    .end packed-switch
.end method

.method public final onDismiss()V
    .registers 3

    iget-byte v0, p0, Lh0h;->j:B

    packed-switch v0, :pswitch_data_4a

    invoke-super {p0}, Lo73;->onDismiss()V

    return-void

    :pswitch_9
    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object v0, p0, Lh0h;->l:Ljava/lang/Object;

    check-cast v0, Ldkf;

    if-nez v0, :cond_13

    const/4 v0, 0x0

    :cond_13
    invoke-static {v0}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object v0

    iget-object v1, p0, Lh0h;->m:Ljava/lang/Object;

    check-cast v1, Lhe;

    invoke-interface {v0, v1}, Lm24;->c(Ll24;)V

    iget-object p0, p0, Lh0h;->k:Ljava/lang/Object;

    check-cast p0, Ln9k;

    iget-object v0, p0, Ln9k;->b:Ljava/lang/Object;

    check-cast v0, Lr9l;

    iget-boolean p0, p0, Ln9k;->a:Z

    if-eqz p0, :cond_36

    iget-object p0, v0, Lr9l;->D:Lg4l;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, La4l;->b:La4l;

    iget-object p0, p0, Lg4l;->i:Lpde;

    invoke-static {p0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_36
    iget-object p0, v0, Lr9l;->D:Lg4l;

    sget-object v0, Lf4l;->b:Lf4l;

    iget-object v1, p0, Lg4l;->j:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    new-instance v0, Ld4l;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 12

    iget-byte v0, p0, Lh0h;->j:B

    iget-object v1, p0, Lh0h;->m:Ljava/lang/Object;

    const/4 v2, 0x1

    iget-object v3, p0, Lh0h;->k:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_208

    check-cast v3, Ln9k;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const p1, 0x7f0a0b5c

    if-ne p0, p1, :cond_25

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p0, p0, Lr9l;->z:Lzkk;

    sget-object p1, Lvr0;->v:Lvr0;

    invoke-virtual {p0, p1}, Lzkk;->b(Lvr0;)V

    iput-boolean v2, v3, Ln9k;->a:Z

    goto/16 :goto_10d

    :cond_25
    const p1, 0x7f0a0b40

    if-ne p0, p1, :cond_3c

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->z:Lzkk;

    sget-object v0, Lvr0;->E:Lvr0;

    invoke-virtual {p1, v0}, Lzkk;->b(Lvr0;)V

    iget-object p0, p0, Lr9l;->A:Lp9l;

    invoke-virtual {p0}, La21;->y()V

    goto/16 :goto_10d

    :cond_3c
    const p1, 0x7f0a0b3c

    if-ne p0, p1, :cond_75

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->A:Lp9l;

    iget-object v0, p0, Lr9l;->c:Lk6l;

    sget-object v1, Lu3l;->a:Ls3l;

    iget-object p0, p0, Lr9l;->t:Lgal;

    iget-object p0, p0, Lgal;->e:Lp6l;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_60

    if-ne p0, v2, :cond_5a

    sget-object p0, Lu3l;->b:Ls3l;

    goto :goto_62

    :cond_5a
    invoke-static {}, Lh9o;->p()V

    :cond_5d
    move v2, v4

    goto/16 :goto_10d

    :cond_60
    sget-object p0, Lu3l;->a:Ls3l;

    :goto_62
    sget-object v1, Ly6l;->a:Ly6l;

    invoke-static {v0, p0, v1}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    sget-object v0, Lpdb;->c:Lpdb;

    sget-object v1, Lvr0;->f:Lvr0;

    invoke-virtual {p1, p0, v0, v1, v2}, La21;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    goto/16 :goto_10d

    :cond_75
    const p1, 0x7f0a0b3f

    if-ne p0, p1, :cond_83

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0, v2, v4}, Lr9l;->s(ZZ)Z

    goto/16 :goto_10d

    :cond_83
    const p1, 0x7f0a0b3e

    if-ne p0, p1, :cond_91

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Lr9l;->n()V

    goto/16 :goto_10d

    :cond_91
    const p1, 0x7f0a0b41

    if-ne p0, p1, :cond_9f

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Lr9l;->o()V

    goto/16 :goto_10d

    :cond_9f
    const p1, 0x7f0a0b3a

    const/4 v0, 0x0

    if-ne p0, p1, :cond_be

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->t:Lgal;

    iget-object p1, p1, Lgal;->e:Lp6l;

    sget-object v1, Lp6l;->a:Lp6l;

    if-ne p1, v1, :cond_b5

    invoke-virtual {p0}, Lr9l;->l()V

    goto :goto_ba

    :cond_b5
    iget-object p1, p0, Lr9l;->A:Lp9l;

    invoke-virtual {p1, v1, v0}, La21;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    :goto_ba
    invoke-virtual {p0}, Lr9l;->j()Z

    goto :goto_10d

    :cond_be
    const p1, 0x7f0a0b3b

    if-ne p0, p1, :cond_dc

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->t:Lgal;

    iget-object p1, p1, Lgal;->e:Lp6l;

    sget-object v1, Lp6l;->b:Lp6l;

    if-ne p1, v1, :cond_d3

    invoke-virtual {p0}, Lr9l;->l()V

    goto :goto_d8

    :cond_d3
    iget-object p1, p0, Lr9l;->A:Lp9l;

    invoke-virtual {p1, v1, v0}, La21;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    :goto_d8
    invoke-virtual {p0}, Lr9l;->j()Z

    goto :goto_10d

    :cond_dc
    const p1, 0x7f0a0b3d

    if-ne p0, p1, :cond_f5

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->A:Lp9l;

    iget-object p0, p0, Lr9l;->c:Lk6l;

    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-virtual {p1, p0, v2, v2}, La21;->o0(Ljava/lang/Iterable;ZZ)V

    goto :goto_10d

    :cond_f5
    const p1, 0x7f0a0b43

    if-ne p0, p1, :cond_5d

    iget-object p0, v3, Ln9k;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->A:Lp9l;

    iget-object p0, p0, Lr9l;->c:Lk6l;

    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-virtual {p1, p0, v2, v2}, La21;->O(Ljava/lang/Iterable;ZZ)V

    :goto_10d
    return v2

    :pswitch_10e
    check-cast v1, Lblh;

    iget-object p0, p0, Lh0h;->l:Ljava/lang/Object;

    check-cast p0, Lilh;

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v5, 0x7f0a069a

    if-ne v3, v5, :cond_12e

    iget-object p1, v1, Lblh;->j:Lnlh;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0, v2, v4, v2}, Lnlh;->K0(Ljava/util/List;ZZZ)V

    goto/16 :goto_1af

    :cond_12e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v5, 0x7f0a0699

    if-ne v3, v5, :cond_141

    iget-object p1, v1, Lblh;->j:Lnlh;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0, v2, v2, v2}, Lnlh;->K0(Ljava/util/List;ZZZ)V

    goto :goto_1af

    :cond_141
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v5, 0x7f0a0694

    if-ne v3, v5, :cond_168

    iget-object p1, v1, Lblh;->j:Lnlh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lf9c;

    new-instance v1, Leof;

    const/16 v3, 0xb

    invoke-direct {v1, p1, p0, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, p0, v1}, Lf9c;-><init>(Lilh;Leof;)V

    const/4 p0, -0x1

    invoke-static {v0, p0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_1af

    :cond_168
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    const v5, 0x7f0a0691

    if-ne v3, v5, :cond_17d

    iget-object p1, v1, Lblh;->j:Lnlh;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    iget-object p1, p1, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p1, p0}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    goto :goto_1af

    :cond_17d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v3, 0x7f0a068e

    if-ne v1, v3, :cond_18c

    iget-object p0, p0, Lilh;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1af

    :cond_18c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v1, 0x7f0a06a1

    if-ne p1, v1, :cond_1ae

    new-instance p1, Lghf;

    iget-object v1, p0, Lilh;->b:Ljava/lang/String;

    iget-object p0, p0, Lilh;->c:Ljava/lang/String;

    new-instance v3, Li4d;

    new-instance v4, Le5f;

    const/16 v5, 0xa

    invoke-direct {v4, v1, p0, v5}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v3, v4}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {p1, v3}, Lghf;-><init>(Li4d;)V

    invoke-virtual {p1, v0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    goto :goto_1af

    :cond_1ae
    move v2, v4

    :goto_1af
    return v2

    :pswitch_1b0
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Lkag;

    if-eqz v0, :cond_205

    check-cast v1, Lr9g;

    move-object v6, v3

    check-cast v6, Ljava/lang/String;

    iget-object p0, p0, Lh0h;->l:Ljava/lang/Object;

    move-object v7, p0

    check-cast v7, Llag;

    move-object v8, p1

    check-cast v8, Lkag;

    iget-object p0, v1, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lg0h;

    iget-object p1, p0, Lg0h;->c:Lxol;

    iget-object p1, p1, Lxol;->c:Ljava/lang/Object;

    check-cast p1, Li0h;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "com.opera.android.permissions.PermissionHandlerService"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsz4;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Llag;->b:Llag;

    if-ne v7, v1, :cond_1fd

    sget-object v1, Lkag;->b:Lkag;

    if-ne v8, v1, :cond_1fd

    invoke-static {v0}, Lyi4;->T(Lsz4;)Z

    move-result v1

    if-eqz v1, :cond_1fd

    invoke-static {p1}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    new-instance v3, Ls2g;

    invoke-direct {v3, p0, v6, v7, v8}, Ls2g;-><init>(Lg0h;Ljava/lang/String;Llag;Lkag;)V

    invoke-static {p1, v0, v1, v3}, Lyi4;->R(Landroid/content/Context;Lsz4;Loi;Lcom/opera/api/Callback;)V

    goto :goto_206

    :cond_1fd
    sget-object v4, Ls9g;->h:Ls9g;

    const/4 v5, 0x0

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    goto :goto_206

    :cond_205
    move v2, v4

    :goto_206
    return v2

    nop

    :pswitch_data_208
    .packed-switch 0x0
        :pswitch_1b0
        :pswitch_10e
    .end packed-switch
.end method
