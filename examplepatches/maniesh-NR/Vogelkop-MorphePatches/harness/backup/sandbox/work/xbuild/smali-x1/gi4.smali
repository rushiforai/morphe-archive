.class public final Lgi4;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;

.field public final c:Lu59;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Lu59;)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Lgi4;->a:Ljava/util/List;

    iput-object p2, p0, Lgi4;->b:Ljava/util/List;

    iput-object p3, p0, Lgi4;->c:Lu59;

    return-void
.end method


# virtual methods
.method public final b(Lcom/google/android/material/textfield/TextInputLayout;ILjava/util/List;Ltj9;)V
    .registers 11

    new-instance v4, Lro9;

    invoke-direct {v4, p1, p4}, Lro9;-><init>(Lcom/google/android/material/textfield/TextInputLayout;Ltj9;)V

    new-instance v0, Lei4;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance p4, Lb10;

    const/4 v1, 0x2

    invoke-direct {p4, v1}, Lb10;-><init>(B)V

    invoke-static {p4, p3}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v3

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lei4;-><init>(Ljava/lang/Object;Landroid/content/Context;Ljava/util/AbstractList;Lro9;B)V

    iget-object p0, v4, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p0, v0}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    const/4 p0, 0x0

    invoke-interface {p3, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lfi4;

    iget-object p3, p3, Lfi4;->b:Ljava/lang/String;

    invoke-virtual {v4, p0, p3}, Lro9;->a0(ILjava/lang/CharSequence;)V

    if-eqz p2, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-static {p2, p3}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    goto :goto_39

    :cond_38
    const/4 p2, 0x0

    :goto_39
    iget-object p3, p1, Lcom/google/android/material/textfield/TextInputLayout;->b:Lr3k;

    invoke-virtual {p3, p2}, Lr3k;->b(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f14059a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 11

    iget-object v0, p0, Lgi4;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    iget-object v2, p0, Lgi4;->b:Ljava/util/List;

    if-nez v1, :cond_14

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    const v1, 0x7f140afc

    goto :goto_17

    :cond_14
    const v1, 0x7f141119

    :goto_17
    invoke-virtual {p1, v1}, Laz0;->a(I)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v3, 0x0

    const v4, 0x7f0d00b3

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a01c4

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_ac

    invoke-static {v4}, Lhi4;->a(Landroid/view/View;)Lhi4;

    move-result-object v3

    const v4, 0x7f0a06ba

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_ab

    invoke-static {v6}, Lhi4;->a(Landroid/view/View;)Lhi4;

    move-result-object v4

    const v6, 0x7f0a08cd

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_a9

    invoke-static {v7}, Lkf;->a(Landroid/view/View;)Lkf;

    move-result-object v6

    check-cast v1, Landroid/widget/LinearLayout;

    iget-object v3, v3, Lhi4;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_72

    new-instance v7, Ldi4;

    const/4 v8, 0x1

    invoke-direct {v7, p0, v8}, Ldi4;-><init>(Lgi4;B)V

    const v8, 0x7f08050d

    invoke-virtual {p0, v3, v8, v0, v7}, Lgi4;->b(Lcom/google/android/material/textfield/TextInputLayout;ILjava/util/List;Ltj9;)V

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfi4;

    iget-object v0, v0, Lfi4;->a:Ljava/lang/String;

    iput-object v0, p0, Lgi4;->d:Ljava/lang/String;

    :cond_72
    iget-object v0, v4, Lhi4;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_90

    new-instance v3, Ldi4;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v4}, Ldi4;-><init>(Lgi4;B)V

    const v4, 0x7f080589

    invoke-virtual {p0, v0, v4, v2, v3}, Lgi4;->b(Lcom/google/android/material/textfield/TextInputLayout;ILjava/util/List;Ltj9;)V

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfi4;

    iget-object v0, v0, Lfi4;->a:Ljava/lang/String;

    iput-object v0, p0, Lgi4;->e:Ljava/lang/String;

    :cond_90
    iget-object v0, v6, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/CheckBox;

    const v2, 0x7f140e97

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Ldi4;

    invoke-direct {v2, p0, v5}, Ldi4;-><init>(Lgi4;B)V

    iput-object v2, v0, Lcom/opera/android/custom_views/CheckBox;->m:Lav4;

    iget-boolean v0, v0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    iput-boolean v0, p0, Lgi4;->f:Z

    invoke-virtual {p1, v1}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void

    :cond_a9
    move v3, v6

    goto :goto_ac

    :cond_ab
    move v3, v4

    :cond_ac
    :goto_ac
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final onDialogCreated(Lbz0;)V
    .registers 2

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-void
.end method

.method public final onFinished(Lhjm;)V
    .registers 4

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_11

    iget-object p0, p0, Lgi4;->c:Lu59;

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/CaptureDevicesDialogDelegate;

    iget-wide p0, p0, Lcom/opera/android/media/CaptureDevicesDialogDelegate;->a:J

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v0, v1}, LJ/N;->Mhlly_d7(JLjava/lang/Object;Ljava/lang/Object;Z)V

    :cond_11
    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 6

    iget-object p1, p0, Lgi4;->d:Ljava/lang/String;

    iget-object v0, p0, Lgi4;->e:Ljava/lang/String;

    iget-boolean v1, p0, Lgi4;->f:Z

    iget-object p0, p0, Lgi4;->c:Lu59;

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/CaptureDevicesDialogDelegate;

    iget-wide v2, p0, Lcom/opera/android/media/CaptureDevicesDialogDelegate;->a:J

    invoke-static {v2, v3, p1, v0, v1}, LJ/N;->Mhlly_d7(JLjava/lang/Object;Ljava/lang/Object;Z)V

    return-void
.end method
