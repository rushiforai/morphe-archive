.class public final synthetic Ld0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf0i;


# direct methods
.method public synthetic constructor <init>(Lf0i;B)V
    .registers 3

    iput-byte p2, p0, Ld0i;->a:B

    iput-object p1, p0, Ld0i;->b:Lf0i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Ld0i;->a:B

    iget-object p0, p0, Ld0i;->b:Lf0i;

    packed-switch p1, :pswitch_data_a0

    new-instance p1, Lpjg;

    const/16 v0, 0x16

    invoke-direct {p1, p0, v0}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-boolean v0, p0, Lo1e;->e:Z

    if-nez v0, :cond_24

    iget-object v0, p0, Lo1e;->d:Landroid/app/ProgressDialog;

    if-nez v0, :cond_21

    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lo1e;->d:Landroid/app/ProgressDialog;

    :cond_21
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    :cond_24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->U:Ldxk;

    if-nez v0, :cond_2f

    const/4 v0, 0x0

    :cond_2f
    new-instance v1, Lhu5;

    const/16 v2, 0x17

    invoke-direct {v1, p0, p1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lisd;

    invoke-static {}, LJ/N;->MfdQn0dE()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    new-instance v2, Leof;

    const/16 v3, 0x1a

    invoke-direct {v2, v0, v1, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, p1, v2}, Lisd;-><init>(Ljava/lang/String;Leof;)V

    return-void

    :pswitch_4c
    invoke-virtual {p0}, Luim;->h0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    if-eqz p1, :cond_8d

    iget-object v0, p0, Lf0i;->f:Ldb;

    invoke-virtual {v0}, Ldb;->b()Ljh0;

    move-result-object v0

    sget-object v1, Ljh0;->e:Ljh0;

    if-ne v0, v1, :cond_66

    const-string v0, "facebook"

    invoke-virtual {p0, p1, v0}, Lf0i;->p0(Landroidx/fragment/app/w;Ljava/lang/String;)Z

    move-result p0

    goto :goto_88

    :cond_66
    sget-object v1, Ljh0;->f:Ljh0;

    if-ne v0, v1, :cond_71

    const-string v0, "google"

    invoke-virtual {p0, p1, v0}, Lf0i;->p0(Landroidx/fragment/app/w;Ljava/lang/String;)Z

    move-result p0

    goto :goto_88

    :cond_71
    sget-object v1, Ljh0;->g:Ljh0;

    if-ne v0, v1, :cond_7c

    const-string v0, "twitter"

    invoke-virtual {p0, p1, v0}, Lf0i;->p0(Landroidx/fragment/app/w;Ljava/lang/String;)Z

    move-result p0

    goto :goto_88

    :cond_7c
    sget-object v1, Ljh0;->h:Ljh0;

    if-ne v0, v1, :cond_87

    const-string v0, "vk"

    invoke-virtual {p0, p1, v0}, Lf0i;->p0(Landroidx/fragment/app/w;Ljava/lang/String;)Z

    move-result p0

    goto :goto_88

    :cond_87
    const/4 p0, 0x0

    :goto_88
    if-nez p0, :cond_8d

    invoke-static {p1}, Lxih;->u(Landroidx/fragment/app/w;)V

    :cond_8d
    return-void

    :pswitch_8e
    iget-object p1, p0, Lf0i;->g:Ly83;

    iget-object p1, p1, Ly83;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lo1e;->m0(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_8e
        :pswitch_4c
    .end packed-switch
.end method
