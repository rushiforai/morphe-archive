.class public final Ld1c;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Lz0c;

.field public d:Lcom/opera/android/custom_views/RadioButton;

.field public e:Lcom/opera/android/custom_views/RadioButton;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILz0c;)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnz0;-><init>(ZZ)V

    iput-object p1, p0, Ld1c;->a:Ljava/lang/String;

    iput p2, p0, Ld1c;->b:I

    iput-object p3, p0, Ld1c;->c:Lz0c;

    return-void
.end method


# virtual methods
.method public final onCreateDialog(Laz0;)V
    .registers 6

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {v1, v0}, Lkf;->g(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lkf;

    move-result-object v2

    iget-object v2, v2, Lkf;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/RadioButton;

    iput-object v2, p0, Ld1c;->d:Lcom/opera/android/custom_views/RadioButton;

    const v3, 0x7f1412dd

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    invoke-static {v1, v0}, Lkf;->g(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/RadioButton;

    iput-object v1, p0, Ld1c;->e:Lcom/opera/android/custom_views/RadioButton;

    const v2, 0x7f1412de

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p0, p0, Ld1c;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Laz0;->setTitle(Ljava/lang/CharSequence;)Laz0;

    move-result-object p0

    invoke-virtual {p0, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 5

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    const/4 v0, 0x1

    iget v1, p0, Ld1c;->b:I

    if-eqz v1, :cond_15

    if-ne v1, v0, :cond_1f

    iget-object v1, p0, Ld1c;->e:Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    iget-object v0, p0, Ld1c;->e:Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {v0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    goto :goto_1f

    :cond_15
    iget-object v1, p0, Ld1c;->d:Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    iget-object v0, p0, Ld1c;->d:Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {v0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    :cond_1f
    :goto_1f
    iget-object v0, p0, Ld1c;->d:Lcom/opera/android/custom_views/RadioButton;

    new-instance v1, Lc1c;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lc1c;-><init>(Ld1c;Lbz0;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Ld1c;->e:Lcom/opera/android/custom_views/RadioButton;

    new-instance v1, Lc1c;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lc1c;-><init>(Ld1c;Lbz0;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
