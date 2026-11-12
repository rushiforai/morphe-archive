.class public final synthetic Lxz5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:La06;


# direct methods
.method public synthetic constructor <init>(La06;B)V
    .registers 3

    iput-byte p2, p0, Lxz5;->a:B

    iput-object p1, p0, Lxz5;->b:La06;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lxz5;->a:B

    iget-object p0, p0, Lxz5;->b:La06;

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_6a

    invoke-virtual {p0, v0}, Lk24;->l0(Z)V

    return-void

    :pswitch_c
    invoke-virtual {p0, v0}, La06;->H0(Z)Z

    move-result p1

    if-nez p1, :cond_1a

    iget-object p0, p0, La06;->s:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_68

    :cond_1a
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p1

    iget-object v1, p0, La06;->r:Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lcak;->d:Lavj;

    const/4 p1, 0x1

    invoke-static {p1}, Lavj;->b(I)Z

    move-result p1

    if-nez p1, :cond_46

    move p1, v0

    goto :goto_4a

    :cond_46
    invoke-static {v1}, LJ/N;->MOhWZGtg(Ljava/lang/Object;)Z

    move-result p1

    :goto_4a
    if-nez p1, :cond_65

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance v1, Lyz5;

    invoke-direct {v1, v0, v0, v0}, Lyz5;-><init>(ZZB)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, v1, v0}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {p0}, Lryl;->g0()V

    goto :goto_68

    :cond_65
    invoke-virtual {p0, v0}, La06;->G0(I)V

    :goto_68
    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
