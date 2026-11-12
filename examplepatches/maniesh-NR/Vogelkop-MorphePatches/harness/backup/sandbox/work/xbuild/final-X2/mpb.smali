.class public final Lmpb;
.super Llpb;
.source "SourceFile"


# instance fields
.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Llpb;-><init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V

    iput-object p5, p0, Lmpb;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final e(Laz0;Landroid/widget/LinearLayout;)V
    .registers 5

    invoke-super {p0, p1, p2}, Llpb;->e(Laz0;Landroid/widget/LinearLayout;)V

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1, p2}, Lov0;->j(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lov0;

    move-result-object p1

    iget-object v0, p1, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaEditText;

    iget-object p1, p1, Lov0;->b:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    iget-object p0, p0, Lmpb;->e:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_29

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    :cond_29
    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 2

    invoke-super {p0, p1}, Llpb;->onShowDialog(Lbz0;)V

    const p0, 0x7f0a0596

    invoke-virtual {p1, p0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->H(Landroid/view/View;)Z

    return-void
.end method
