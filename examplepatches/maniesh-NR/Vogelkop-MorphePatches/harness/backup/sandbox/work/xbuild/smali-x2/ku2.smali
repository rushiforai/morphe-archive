.class public final synthetic Lku2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llu2;


# direct methods
.method public synthetic constructor <init>(Llu2;B)V
    .registers 3

    iput-byte p2, p0, Lku2;->a:B

    iput-object p1, p0, Lku2;->b:Llu2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lku2;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object p0, p0, Lku2;->b:Llu2;

    packed-switch p1, :pswitch_data_aa

    invoke-virtual {p0}, Llu2;->I0()Lmu2;

    move-result-object p1

    iget-object p0, p0, Llu2;->z:Lw3g;

    if-nez p0, :cond_12

    move-object p0, v1

    :cond_12
    iget-object v0, p1, Lmu2;->c:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    iget-object p1, p1, Lmu2;->f:La4g;

    if-eqz p1, :cond_19

    move-object v1, p1

    :cond_19
    invoke-virtual {v1, p0}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->G(Lw3g;Ljava/lang/String;)V

    return-void

    :pswitch_21
    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->h:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_3d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    :cond_3d
    return-void

    :pswitch_3e
    invoke-virtual {p0}, Llu2;->I0()Lmu2;

    move-result-object p1

    iget-object v2, p0, Llu2;->z:Lw3g;

    if-nez v2, :cond_47

    move-object v2, v1

    :cond_47
    iget-object p1, p1, Lmu2;->f:La4g;

    if-eqz p1, :cond_4c

    move-object v1, p1

    :cond_4c
    invoke-virtual {v1, v2}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    :cond_5d
    return-void

    :pswitch_5e
    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getInputType()I

    move-result p1

    const/16 v2, 0x90

    and-int/2addr p1, v2

    if-ne p1, v2, :cond_71

    invoke-virtual {p0}, Llu2;->J0()V

    goto :goto_a1

    :cond_71
    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Llu2;->I0()Lmu2;

    move-result-object v2

    iget-object v3, p0, Llu2;->z:Lw3g;

    if-nez v3, :cond_80

    move-object v3, v1

    :cond_80
    iget-object v2, v2, Lmu2;->f:La4g;

    if-eqz v2, :cond_85

    move-object v1, v2

    :cond_85
    invoke-virtual {v1, v3}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p1

    iget-object p1, p1, Ltn9;->e:Lcom/opera/android/custom_views/StylingImageButton;

    const v1, 0x7f080624

    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    invoke-virtual {p0}, Llu2;->H0()Ltn9;

    move-result-object p0

    iget-object p0, p0, Ltn9;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p0, v0}, Lc5g;->a(Landroid/widget/TextView;Z)V

    :goto_a1
    return-void

    :pswitch_a2
    invoke-virtual {p0}, Llu2;->K0()V

    return-void

    :pswitch_a6
    invoke-virtual {p0}, Llu2;->K0()V

    return-void

    :pswitch_data_aa
    .packed-switch 0x0
        :pswitch_a6
        :pswitch_a2
        :pswitch_5e
        :pswitch_3e
        :pswitch_21
    .end packed-switch
.end method
