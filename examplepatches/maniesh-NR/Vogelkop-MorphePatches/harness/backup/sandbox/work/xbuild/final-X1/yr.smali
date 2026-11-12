.class public Lyr;
.super Lss7;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f140384

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lss7;-><init>(II)V

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "bookmark"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

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

    iget-object v1, p0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-interface {v0}, Lpl3;->getUrl()Lshf;

    move-result-object v0

    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-super {p0, p1, p2}, Lss7;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method
