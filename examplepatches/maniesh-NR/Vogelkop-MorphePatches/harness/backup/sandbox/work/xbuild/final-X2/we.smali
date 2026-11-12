.class public final Lwe;
.super Ld43;
.source "SourceFile"


# instance fields
.field public final e:Landroid/widget/TextView;

.field public f:Landroid/view/MenuItem;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;I)V
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lmc8;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lmc8;-><init>(B)V

    invoke-direct {p0, v0, v1, p2}, Ld43;-><init>(Landroid/content/Context;Lgrj;I)V

    iput-object p1, p0, Lwe;->e:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 4

    iget-object p0, p0, Lwe;->e:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result p0

    if-ltz v1, :cond_23

    if-ltz p0, :cond_23

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-virtual {v0, v2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_23
    const-string p0, ""

    return-object p0
.end method

.method public final onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 7

    invoke-super {p0, p1, p2}, Ld43;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_26

    iget-object p1, p0, Lwe;->f:Landroid/view/MenuItem;

    if-eq p2, p1, :cond_14

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v1, 0x7f0a096a

    if-ne p1, v1, :cond_29

    :cond_14
    invoke-virtual {p0}, Lwe;->b()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lye;->a:Lxe;

    const/16 p1, 0x3e8

    invoke-static {p1, p0}, Lxih;->r(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_27

    :cond_26
    return v0

    :cond_27
    const/4 p0, 0x0

    throw p0

    :cond_29
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const p2, 0x1020035

    if-ne p1, p2, :cond_54

    iget-object p1, p0, Lwe;->e:Landroid/widget/TextView;

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    new-instance p2, Lghf;

    invoke-virtual {p0}, Lwe;->b()Ljava/lang/String;

    move-result-object p0

    new-instance v1, Li4d;

    new-instance v2, Lu5f;

    const/16 v3, 0xb

    invoke-direct {v2, p0, v3}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-direct {v1, v2}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {p2, v1}, Lghf;-><init>(Li4d;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p2, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return v0

    :cond_54
    const/4 p0, 0x0

    return p0
.end method

.method public final onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    invoke-super {p0, p1}, Ld43;->onDestroyActionMode(Landroid/view/ActionMode;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lwe;->f:Landroid/view/MenuItem;

    return-void
.end method

.method public final onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 11

    iget-object v0, p0, Lwe;->e:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f140f08

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    move v4, v1

    move v3, v2

    :goto_11
    invoke-interface {p2}, Landroid/view/Menu;->size()I

    move-result v5

    if-ge v3, v5, :cond_53

    invoke-interface {p2, v3}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v6

    if-nez v6, :cond_23

    move v6, v2

    goto :goto_2d

    :cond_23
    const-string v7, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    :goto_2d
    if-eqz v6, :cond_50

    if-ne v4, v1, :cond_32

    move v4, v3

    :cond_32
    invoke-interface {v5}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v6

    if-eqz v6, :cond_3e

    invoke-virtual {v6}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    if-nez v6, :cond_40

    :cond_3e
    move v6, v2

    goto :goto_4a

    :cond_40
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Ld43;->b:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    :goto_4a
    if-eqz v6, :cond_50

    invoke-interface {v5, v0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_53

    :cond_50
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :cond_53
    :goto_53
    invoke-super {p0, p1, p2}, Ld43;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    const/4 p0, 0x1

    return p0
.end method
