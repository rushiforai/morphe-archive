.class public final synthetic Lpzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxzg;


# direct methods
.method public synthetic constructor <init>(Lxzg;B)V
    .registers 3

    iput-byte p2, p0, Lpzg;->a:B

    iput-object p1, p0, Lpzg;->b:Lxzg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lpzg;->a:B

    const/4 v0, 0x0

    sget-object v1, Len0;->h:Len0;

    iget-object p0, p0, Lpzg;->b:Lxzg;

    packed-switch p1, :pswitch_data_98

    iget-object p1, p0, Lxzg;->j:Lx5f;

    sget-object v0, Len0;->k:Len0;

    invoke-virtual {p1, v0}, Lx5f;->n0(Len0;)V

    iget-object p1, p0, Lxzg;->g:Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lh3m;->a(Landroid/view/ViewGroup;Ly2m;)V

    iget-object p0, p0, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->i:Landroid/view/View;

    check-cast p0, Landroid/widget/TextSwitcher;

    invoke-virtual {p0}, Landroid/widget/ViewAnimator;->showNext()V

    return-void

    :pswitch_21
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/fragment/app/w;->U()V

    return-void

    :pswitch_29
    iget-object p1, p0, Lxzg;->j:Lx5f;

    invoke-virtual {p1, v1}, Lx5f;->n0(Len0;)V

    iget-object p1, p0, Lxzg;->e:Lp0h;

    iget-object p1, p1, Lp0h;->e:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    iget-object p0, p0, Lxzg;->k:Lgjm;

    new-instance v1, Lc9g;

    invoke-direct {v1, p1}, Lc9g;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_4a
    iget-object p1, p0, Lxzg;->j:Lx5f;

    invoke-virtual {p1, v1}, Lx5f;->n0(Len0;)V

    iget-object p1, p0, Lxzg;->e:Lp0h;

    iget-object p1, p1, Lp0h;->e:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    iget-object p0, p0, Lxzg;->k:Lgjm;

    new-instance v1, Lc9g;

    invoke-direct {v1, p1}, Lc9g;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_6b
    iget-object p1, p0, Lxzg;->e:Lp0h;

    iget-object p1, p1, Lp0h;->e:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ls9g;->h:Ls9g;

    invoke-virtual {v0, p1}, Ls9g;->c(Ljava/lang/String;)V

    iget-object p1, p0, Lxzg;->l:Lwt3;

    invoke-virtual {p1}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lysj;

    const v0, 0x7f141121

    const/16 v1, 0x9c4

    invoke-static {v0, v1, p1}, Lam2;->i(IILysj;)Lglj;

    move-result-object v0

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    return-void

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_6b
        :pswitch_4a
        :pswitch_29
        :pswitch_21
    .end packed-switch
.end method
