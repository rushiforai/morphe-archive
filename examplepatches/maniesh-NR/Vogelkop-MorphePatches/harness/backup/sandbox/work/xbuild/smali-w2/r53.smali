.class public final synthetic Lr53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly53;


# direct methods
.method public synthetic constructor <init>(Ly53;B)V
    .registers 3

    iput-byte p2, p0, Lr53;->a:B

    iput-object p1, p0, Lr53;->b:Ly53;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lr53;->a:B

    const-class v1, Ld8j;

    const-class v2, Luxk;

    const-class v3, Ljt2;

    const/4 v4, 0x0

    iget-object p0, p0, Lr53;->b:Ly53;

    packed-switch v0, :pswitch_data_1de

    iget-object v0, p0, Ly53;->c:Lor2;

    iget-object v1, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lei;

    iget-object v1, v1, Lei;->h:Landroid/view/View;

    check-cast v1, Lcom/opera/android/widget/MenuSettingsListItem;

    iget-object v2, p0, Ly53;->b:Lh73;

    iget-object v3, v2, Lh73;->c:Lrs2;

    iget v3, v3, Lrs2;->f:I

    invoke-virtual {p0, v1, v3}, Ly53;->U(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lei;

    iget-object v1, v0, Lei;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/widget/MenuSettingsListItem;

    iget-object v2, v2, Lh73;->c:Lrs2;

    iget v3, v2, Lrs2;->h:I

    invoke-virtual {p0, v1, v3}, Ly53;->U(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/MenuSettingsListItem;

    iget v1, v2, Lrs2;->g:I

    invoke-virtual {p0, v0, v1}, Ly53;->U(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    return-void

    :pswitch_3a
    sget-object v0, Lmh0;->C:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    invoke-virtual {p0, v2}, Lf7d;->a(Ljava/lang/Class;)V

    return-void

    :pswitch_47
    sget-object v0, Lmh0;->u:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v3}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    check-cast p0, Lot2;

    invoke-virtual {p0}, Lot2;->d()V

    return-void

    :pswitch_60
    sget-object v0, Lmh0;->t:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v3}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    new-array v0, v4, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, v0}, Lot2;->b([I)V

    return-void

    :pswitch_7b
    sget-object v0, Lmh0;->r:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    new-array v0, v4, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, v0}, Lg8j;->b([I)V

    return-void

    :pswitch_96
    sget-object v0, Lmh0;->s:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v3}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    new-array v0, v4, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, v0}, Lot2;->a([I)V

    return-void

    :pswitch_b1
    iget-object v0, p0, Ly53;->c:Lor2;

    iget-boolean p0, p0, Ly53;->o:Z

    if-nez p0, :cond_f8

    iget-object p0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object v0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    const/4 v1, 0x1

    if-eqz v0, :cond_cb

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_cb
    iget-object v0, p0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    if-eqz v0, :cond_da

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_da
    iget-object v0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    if-eqz v0, :cond_e9

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_e9
    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object p0, p0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    if-eqz p0, :cond_f8

    iget-object p0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_f8
    return-void

    :pswitch_f9
    sget-object v0, Lmh0;->l:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lexe;

    invoke-direct {v0}, Lexe;-><init>()V

    iget-object p0, p0, Lf7d;->b:Lgjm;

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_110
    sget-object v0, Lmh0;->q:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lqk;

    invoke-direct {v0}, Lqk;-><init>()V

    iget-object p0, p0, Lf7d;->b:Lgjm;

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_127
    sget-object v0, Lmh0;->v:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    const-class v0, Ltc6;

    invoke-virtual {p0, v0}, Lf7d;->a(Ljava/lang/Class;)V

    return-void

    :pswitch_136
    sget-object v0, Lmh0;->D:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance v0, Lvfn;

    invoke-direct {v0}, Lvfn;-><init>()V

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_14a
    sget-object v0, Lmh0;->h:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lth8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_15f
    sget-object v0, Lmh0;->p:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    new-instance v0, Le6j;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_17f
    sget-object v0, Lmh0;->B:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    invoke-virtual {p0, v2}, Lf7d;->a(Ljava/lang/Class;)V

    return-void

    :pswitch_18c
    iget-object v0, p0, Ly53;->b:Lh73;

    iget-object v1, v0, Lh73;->m:Lxb;

    iget-object v1, v1, Lxb;->e:Ljze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldpf;

    new-instance v2, Lole;

    invoke-direct {v2, p0}, Lole;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ldpf;->a(Lhpf;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object v0, p0, Lf7d;->g:Ldb;

    iget-object v1, p0, Lf7d;->f:Lxb;

    iget-object v2, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Lxb;->e:Ljze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldpf;

    new-instance v3, Lz8b;

    invoke-direct {v3, v2, v0}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Ldpf;->a(Lhpf;)V

    iget-object v0, p0, Lf7d;->h:Ljtg;

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_1c9

    iget-object p0, p0, Lf7d;->i:Lslk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lslk;->b(Ljava/lang/Runnable;)V

    :cond_1c9
    return-void

    :pswitch_1ca
    sget-object v0, Lmh0;->A:Lmh0;

    invoke-virtual {p0, v0}, Ly53;->T(Lmh0;)V

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance v0, Lvfn;

    invoke-direct {v0}, Lvfn;-><init>()V

    invoke-virtual {p0, v0, v4}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_1de
    .packed-switch 0x0
        :pswitch_1ca
        :pswitch_18c
        :pswitch_17f
        :pswitch_15f
        :pswitch_14a
        :pswitch_136
        :pswitch_127
        :pswitch_110
        :pswitch_f9
        :pswitch_b1
        :pswitch_96
        :pswitch_7b
        :pswitch_60
        :pswitch_47
        :pswitch_3a
    .end packed-switch
.end method
