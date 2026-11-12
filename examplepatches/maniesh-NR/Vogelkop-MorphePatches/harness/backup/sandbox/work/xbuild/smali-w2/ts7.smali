.class public Lts7;
.super Lss7;
.source "SourceFile"


# instance fields
.field public D:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f140382

    const v1, 0x7f100039

    invoke-direct {p0, v0, v1}, Lss7;-><init>(II)V

    return-void
.end method


# virtual methods
.method public final G0(Lal3;Ljava/lang/String;)Lal3;
    .registers 6

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_2e

    iget-object p0, p0, Lss7;->t:Lcr2;

    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    if-nez p1, :cond_23

    invoke-static {v1, v2, p2, p0}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object p0

    return-object p0

    :cond_23
    check-cast p1, Lpl3;

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v0

    invoke-static {v0, v1, p2, p0}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object p0

    return-object p0

    :cond_2e
    if-nez p1, :cond_37

    iget-object p0, p0, Lts7;->D:Ljava/lang/String;

    invoke-static {v1, v2, p2, p0}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object p0

    return-object p0

    :cond_37
    check-cast p1, Lpl3;

    new-instance p0, Llkj;

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v0

    invoke-interface {p1}, Lpl3;->getUrl()Lshf;

    move-result-object p1

    invoke-direct {p0, v0, v1, p2, p1}, Llkj;-><init>(JLjava/lang/String;Lshf;)V

    return-object p0
.end method

.method public final H0()Lx80;
    .registers 1

    sget-object p0, Lx80;->b:Lx80;

    return-object p0
.end method

.method public final J0()Z
    .registers 1

    iget-object p0, p0, Lss7;->t:Lcr2;

    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    iget-object v0, p0, Lss7;->v:Lal3;

    check-cast v0, Lpl3;

    iget-object v1, p0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->d:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-interface {v0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->c:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-interface {v0}, Lpl3;->f()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lts7;->D:Ljava/lang/String;

    invoke-static {v1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    iget-object v3, p0, Lss7;->t:Lcr2;

    if-eqz v1, :cond_3d

    iget-object v0, v3, Lcr2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    const v1, 0x7f14017c

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_4c

    :cond_3d
    iget-object v1, v3, Lcr2;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-interface {v0}, Lpl3;->getUrl()Lshf;

    move-result-object v0

    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_4c
    invoke-super {p0, p1, p2}, Lss7;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lss7;->N0()V

    return-void
.end method
