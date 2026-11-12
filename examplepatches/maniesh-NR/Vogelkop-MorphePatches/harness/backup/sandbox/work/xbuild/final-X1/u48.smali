.class public final synthetic Lu48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv48;


# direct methods
.method public synthetic constructor <init>(Lv48;B)V
    .registers 3

    iput-byte p2, p0, Lu48;->a:B

    iput-object p1, p0, Lu48;->b:Lv48;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lu48;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lu48;->b:Lv48;

    packed-switch v0, :pswitch_data_9c

    iget-object p0, p0, Lv48;->b:Luim;

    check-cast p0, Lw48;

    invoke-virtual {p0}, Luim;->h0()V

    return-void

    :pswitch_10
    iget-object p0, p0, Lv48;->b:Luim;

    check-cast p0, Lw48;

    iget-object p1, p0, Lw48;->d:Lvs;

    if-eqz p1, :cond_66

    iget-object p1, p1, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_55

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p1

    iget-object v0, p0, Lw48;->d:Lvs;

    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lcak;->d:Lavj;

    invoke-static {v1}, Lavj;->b(I)Z

    move-result p1

    if-eqz p1, :cond_53

    invoke-static {v0}, LJ/N;->MsAgyd3A(Ljava/lang/Object;)Z

    move-result v1

    :cond_53
    if-nez v1, :cond_66

    :cond_55
    iget-object p1, p0, Lw48;->d:Lvs;

    iget-object p1, p1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    const v0, 0x7f14087f

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_69

    :cond_66
    invoke-virtual {p0}, Luim;->h0()V

    :goto_69
    return-void

    :pswitch_6a
    iget-object p0, p0, Lv48;->b:Luim;

    check-cast p0, Lw48;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MKuJ$OHt()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lxgf;

    invoke-direct {v0, p0}, Lxgf;-><init>(Ljava/lang/String;)V

    iput-boolean v1, v0, Lxgf;->n:Z

    invoke-static {p1, v0}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    return-void

    :pswitch_data_9c
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_10
    .end packed-switch
.end method
