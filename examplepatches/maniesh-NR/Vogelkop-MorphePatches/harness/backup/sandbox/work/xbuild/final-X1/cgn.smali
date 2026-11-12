.class public final Lcgn;
.super Le93;
.source "SourceFile"

# interfaces
.implements Lb0i;
.implements Lon9;


# instance fields
.field public final A:Ltvg;

.field public final B:Lhxk;

.field public final C:Lx5f;

.field public final D:Lghf;

.field public final E:Lyug;

.field public final F:Lpfn;

.field public final G:Lsa2;

.field public final H:Lsa2;

.field public final I:Lua7;

.field public final J:Lrn9;

.field public K:Landroid/widget/ImageView;

.field public L:Lcom/opera/android/settings/BigSwitchButton;

.field public M:Z

.field public N:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public O:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public P:Lcom/opera/android/custom_views/VpnProBanner;

.field public Q:Lcom/opera/android/custom_views/VpnProBanner;

.field public R:Ljava/lang/Class;

.field public final r:Ladn;

.field public final s:Lggn;

.field public final t:Lrn9;

.field public final u:Ljava/util/ArrayList;

.field public final v:Lydn;

.field public final w:Lktg;

.field public final x:Lz77;

.field public final y:Lxt8;

.field public final z:Lc0i;


# direct methods
.method public constructor <init>(Lgjm;Lydn;Lxb;Lslk;Lz77;Lxt8;Lktg;Ltvg;Lyug;Lghf;Lhxk;Lpfn;Lggn;Lx5f;)V
    .registers 17

    const/4 v0, 0x2

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f141408

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f10003d

    iput v1, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Ladn;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ladn;-><init>(Lndc;B)V

    iput-object v0, p0, Lcgn;->r:Ladn;

    new-instance v0, Lrn9;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lrn9;-><init>(Lk24;B)V

    iput-object v0, p0, Lcgn;->t:Lrn9;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcgn;->u:Ljava/util/ArrayList;

    new-instance v0, Lsa2;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lsa2;-><init>(B)V

    iput-object v0, p0, Lcgn;->G:Lsa2;

    new-instance v0, Lsa2;

    invoke-direct {v0, v1}, Lsa2;-><init>(B)V

    iput-object v0, p0, Lcgn;->H:Lsa2;

    new-instance v0, Lrn9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p0, v1}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lcgn;->J:Lrn9;

    iput-object p2, p0, Lcgn;->v:Lydn;

    iput-object p5, p0, Lcgn;->x:Lz77;

    iput-object p8, p0, Lcgn;->A:Ltvg;

    iput-object p11, p0, Lcgn;->B:Lhxk;

    move-object/from16 p2, p14

    iput-object p2, p0, Lcgn;->C:Lx5f;

    new-instance p2, Lc0i;

    invoke-direct {p2, p0, p3, p4, p0}, Lc0i;-><init>(Lltl;Lxb;Lslk;Lb0i;)V

    iput-object p2, p0, Lcgn;->z:Lc0i;

    iput-object p6, p0, Lcgn;->y:Lxt8;

    iput-object p7, p0, Lcgn;->w:Lktg;

    iput-object p9, p0, Lcgn;->E:Lyug;

    iput-object p10, p0, Lcgn;->D:Lghf;

    iput-object p12, p0, Lcgn;->F:Lpfn;

    iput-object p13, p0, Lcgn;->s:Lggn;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lcgn;->I:Lua7;

    return-void
.end method


# virtual methods
.method public final H()Lqe6;
    .registers 1

    iget-object p0, p0, Lltl;->j:Lqe6;

    return-object p0
.end method

.method public final I0(I)Ljava/lang/String;
    .registers 6

    const v0, 0x7f141371

    const-string v1, "\n\n"

    if-eqz p1, :cond_66

    const/4 v2, 0x1

    const v3, 0x7f141391

    if-eq p1, v2, :cond_31

    const/4 v0, 0x2

    if-eq p1, v0, :cond_13

    const-string p0, ""

    return-object p0

    :cond_13
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v0, 0x7f141393

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_31
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v2, 0x7f141392

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v2, 0x7f141396

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_66
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f141390

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final J(I)V
    .registers 6

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    sget-object v0, Lijm;->b:Lijm;

    iget-object v1, p0, Lcgn;->x:Lz77;

    if-eqz p1, :cond_1c

    const/4 p0, 0x1

    if-eq p1, p0, :cond_e

    return-void

    :cond_e
    new-instance p0, Lyz5;

    const/4 p1, 0x0

    const/4 v2, 0x6

    invoke-direct {p0, p1, p1, v2}, Lyz5;-><init>(ZZB)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_1c
    new-instance p1, La0i;

    new-instance v2, Ly1n;

    const/16 v3, 0x10

    invoke-direct {v2, p0, v3}, Ly1n;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-direct {p1, p0, v2}, La0i;-><init>(Lpjg;Ly1n;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final J0(Luvg;I)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_1a

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1a

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1a

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1a

    const/4 v0, 0x4

    if-eq p1, v0, :cond_16

    const/4 v0, 0x5

    if-eq p1, v0, :cond_1a

    goto :goto_24

    :cond_16
    invoke-virtual {p0}, Lcgn;->L0()V

    return-void

    :cond_1a
    iget-object p1, p0, Lcgn;->v:Lydn;

    invoke-virtual {p1}, Lydn;->p()Lwdn;

    move-result-object p1

    iget-boolean p1, p1, Lwdn;->e:Z

    if-nez p1, :cond_25

    :goto_24
    return-void

    :cond_25
    iget-object p0, p0, Lcgn;->E:Lyug;

    invoke-virtual {p0, p2}, Lyug;->a(I)V

    return-void
.end method

.method public final K0()V
    .registers 3

    iget-object p0, p0, Lcgn;->v:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_d

    const-string p0, "https://support-vpn-pro.opera.com/"

    goto :goto_f

    :cond_d
    const-string p0, "https://help.opera.com/mobile/vpn/"

    :goto_f
    sget-object v0, Llqm;->u:Llqm;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 v0, 0x3

    iput v0, p0, Lvx3;->b:I

    const/4 v0, 0x1

    invoke-static {p0, v0, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void
.end method

.method public final L0()V
    .registers 10

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x0

    const/4 v3, 0x4

    const-class v4, Li8d;

    invoke-direct {v2, v1, v4, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final M0()V
    .registers 8

    iget-boolean v0, p0, Lcgn;->M:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object v3, p0, Lcgn;->v:Lydn;

    if-eqz v0, :cond_33

    iget-object v0, v3, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-virtual {v3}, Lydn;->q()I

    move-result v0

    if-ne v0, v1, :cond_33

    iput-boolean v2, p0, Lcgn;->M:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ldx3;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    new-instance v4, Lw0a;

    const/4 v5, 0x5

    invoke-direct {v4, v5}, Lw0a;-><init>(B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lijm;->b:Lijm;

    invoke-virtual {v0, v4, v5}, Lr22;->b(Ljjm;Lijm;)V

    :cond_33
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    const v4, 0x7f0a0cb6

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v4, v3, Lydn;->d:Lvdn;

    iget-object v5, v3, Lydn;->c:Lgfn;

    invoke-virtual {v4}, Lvdn;->b()Z

    move-result v4

    invoke-virtual {v0, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance v4, Lxfn;

    const/4 v6, 0x1

    invoke-direct {v4, p0, v6}, Lxfn;-><init>(Lcgn;B)V

    iput-object v4, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    const v4, 0x7f0a0caf

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    const-string v6, "compression"

    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_82

    iget-object v4, v3, Lydn;->d:Lvdn;

    iget-boolean v4, v4, Lvdn;->a:Z

    if-nez v4, :cond_82

    invoke-interface {v5}, Lgfn;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_84

    :cond_82
    const/16 v2, 0x8

    :cond_84
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    const v2, 0x7f0a0cad

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v2, v3, Lydn;->B:Z

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v2, Lxfn;

    invoke-direct {v2, p0, v1}, Lxfn;-><init>(Lcgn;B)V

    iput-object v2, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    invoke-virtual {p0}, Lcgn;->O0()V

    invoke-interface {v5}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_b0

    const v0, 0x7f0400d5

    const v1, 0x7f0400d6

    goto :goto_b6

    :cond_b0
    const v0, 0x7f0400d7

    const v1, 0x7f0400d9

    :goto_b6
    iget-object v2, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    iput v0, v2, Lcom/opera/android/settings/BigSwitchButton;->d:I

    invoke-virtual {v2}, Lcom/opera/android/settings/BigSwitchButton;->e()V

    iget-object v0, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    iput v1, v0, Lcom/opera/android/settings/BigSwitchButton;->e:I

    invoke-virtual {v0}, Lcom/opera/android/settings/BigSwitchButton;->e()V

    invoke-virtual {p0}, Lcgn;->N0()V

    return-void
.end method

.method public final N0()V
    .registers 4

    iget-object v0, p0, Lcgn;->v:Lydn;

    invoke-virtual {v0}, Lydn;->q()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_19

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_15

    const v0, 0x7f040a7a

    goto :goto_1c

    :cond_15
    const v0, 0x7f040a72

    goto :goto_1c

    :cond_19
    const v0, 0x7f040a73

    :goto_1c
    iget-object p0, p0, Lcgn;->K:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0600a7

    invoke-static {v0, v1, v2}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final O0()V
    .registers 9

    iget-object v0, p0, Lcgn;->v:Lydn;

    invoke-virtual {v0}, Lydn;->q()I

    move-result v1

    iget-object v2, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    invoke-static {v1}, Lvep;->A(I)I

    move-result v3

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const v7, 0x7f1413fe

    if-eqz v3, :cond_36

    if-eq v3, v6, :cond_2d

    if-eq v3, v5, :cond_24

    if-ne v3, v4, :cond_20

    new-instance v3, Lrxh;

    invoke-direct {v3, v7}, Lrxh;-><init>(I)V

    goto :goto_4e

    :cond_20
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_24
    new-instance v3, Lrxh;

    const v7, 0x7f14117e

    invoke-direct {v3, v7}, Lrxh;-><init>(I)V

    goto :goto_4e

    :cond_2d
    new-instance v3, Lrxh;

    const v7, 0x7f1413ff

    invoke-direct {v3, v7}, Lrxh;-><init>(I)V

    goto :goto_4e

    :cond_36
    iget-object v3, v0, Lydn;->f:Lqq8;

    invoke-virtual {v3}, Lqq8;->g()Z

    move-result v3

    if-eqz v3, :cond_49

    iget-object v3, v0, Lydn;->f:Lqq8;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v3, v7}, Lqq8;->f(Landroid/content/Context;)Lsxh;

    move-result-object v3

    goto :goto_4e

    :cond_49
    new-instance v3, Lrxh;

    invoke-direct {v3, v7}, Lrxh;-><init>(I)V

    :goto_4e
    invoke-virtual {v2, v3}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    iget-object v2, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    invoke-static {v1}, Lvep;->A(I)I

    move-result v3

    if-eqz v3, :cond_99

    if-eq v3, v6, :cond_83

    if-eq v3, v5, :cond_6c

    if-ne v3, v4, :cond_68

    new-instance v0, Lrxh;

    const v3, 0x7f141403

    invoke-direct {v0, v3}, Lrxh;-><init>(I)V

    goto :goto_a1

    :cond_68
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_6c
    iget-object v0, v0, Lydn;->e:Lsgi;

    iget-boolean v0, v0, Lsgi;->d:Z

    if-eqz v0, :cond_7b

    new-instance v0, Lrxh;

    const v3, 0x7f141404

    invoke-direct {v0, v3}, Lrxh;-><init>(I)V

    goto :goto_a1

    :cond_7b
    new-instance v0, Lqxh;

    const-string v3, ""

    invoke-direct {v0, v3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_a1

    :cond_83
    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_8f

    const v0, 0x7f141401

    goto :goto_92

    :cond_8f
    const v0, 0x7f141400

    :goto_92
    new-instance v3, Lrxh;

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    move-object v0, v3

    goto :goto_a1

    :cond_99
    new-instance v0, Lrxh;

    const v3, 0x7f140691

    invoke-direct {v0, v3}, Lrxh;-><init>(I)V

    :goto_a1
    invoke-virtual {v2, v0}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    iget-object p0, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    invoke-static {v1}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_ba

    if-eq v0, v6, :cond_bb

    if-eq v0, v5, :cond_b8

    if-ne v0, v4, :cond_b4

    move v4, v5

    goto :goto_bb

    :cond_b4
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_b8
    move v4, v6

    goto :goto_bb

    :cond_ba
    const/4 v4, 0x0

    :cond_bb
    :goto_bb
    invoke-virtual {p0, v4}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    return-void
.end method

.method public final a()Loba;
    .registers 1

    iget-object p0, p0, Lcgn;->I:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lvfn;

    iget-object p0, p0, Lvfn;->b:Loba;

    return-object p0
.end method

.method public final m()V
    .registers 1

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcgn;->v:Lydn;

    invoke-virtual {p1}, Lydn;->s()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    new-instance v0, Lwfn;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lwfn;-><init>(Lcgn;B)V

    iget-object v2, p0, Lcgn;->t:Lrn9;

    iput-object p1, v2, Lrn9;->d:Ljava/lang/Object;

    iget-object v3, v2, Lrn9;->c:Ljava/lang/Object;

    check-cast v3, Lltl;

    new-instance v4, Lmgf;

    const/16 v5, 0x11

    invoke-direct {v4, v2, v0, v5}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string v0, "SyncAuthPortalFragment_request"

    invoke-virtual {p1, v0, v3, v4}, Landroidx/fragment/app/w;->i0(Ljava/lang/String;Lndc;Lmm9;)V

    iget-object p1, p0, Lcgn;->F:Lpfn;

    invoke-virtual {p1}, Lpfn;->S()V

    iget-object v0, p1, Lpfn;->g:Lru9;

    iget-object v2, p1, Lpfn;->l:Lofn;

    invoke-virtual {v0, v2}, Lru9;->a(Ln1;)V

    iget-object v2, p1, Lpfn;->m:Lofn;

    invoke-virtual {v0, v2}, Lru9;->a(Ln1;)V

    iget-object v0, p1, Lpfn;->f:Lfmk;

    iget-object v0, v0, Lfmk;->c:Lode;

    new-instance v2, Lkfn;

    invoke-direct {v2, p1, v1}, Lkfn;-><init>(Lpfn;B)V

    new-instance v1, Lt7d;

    const/16 v3, 0x1b

    invoke-direct {v1, v2, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p0, v1}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p1, Lpfn;->e:Lslk;

    iget-object v0, v0, Lslk;->i:Lkze;

    new-instance v1, Lkfn;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lkfn;-><init>(Lpfn;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, v1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p0, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p1, Lpfn;->k:Lode;

    new-instance v1, Lkfn;

    const/4 v2, 0x2

    invoke-direct {v1, p1, v2}, Lkfn;-><init>(Lpfn;B)V

    new-instance p1, Lt7d;

    invoke-direct {p1, v1, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p0, p1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 6

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lcgn;->u:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v1, :cond_1a

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lb87;

    sget-object v4, Lhjm;->b:Lhjm;

    invoke-interface {v3, v4}, Ljjm;->finish(Lhjm;)V

    goto :goto_a

    :cond_1a
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p0, p0, Lcgn;->F:Lpfn;

    iget-object v0, p0, Lpfn;->g:Lru9;

    iget-object v1, p0, Lpfn;->l:Lofn;

    invoke-virtual {v0, v1}, Lru9;->d(Ln1;)V

    iget-object v1, p0, Lpfn;->m:Lofn;

    invoke-virtual {v0, v1}, Lru9;->d(Ln1;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lpfn;->o:Lamk;

    iget-object v1, p0, Lpfn;->p:Llh4;

    iput-object v0, v1, Llh4;->b:Lcom/opera/api/Callback;

    iput-object v0, p0, Lpfn;->q:Luah;

    iput-object v0, p0, Lpfn;->r:Lwvg;

    invoke-virtual {p0, v0}, Lpfn;->R(Lnfn;)V

    iget-object p0, p0, Lpfn;->n:Lmfn;

    invoke-virtual {p0}, Lmfn;->a()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lcgn;->v:Lydn;

    iget-object v1, p0, Lcgn;->r:Ladn;

    invoke-virtual {v0, v1}, Lydn;->A(Ltdn;)V

    iget-object v0, p0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    const/4 v1, 0x0

    if-eqz v0, :cond_1c

    iget-object v2, p0, Lltl;->g:Lwjj;

    if-eqz v2, :cond_1a

    iget-object v2, v2, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, Lcan;

    invoke-virtual {v2, v0}, Lcan;->a(Landroid/view/View;)V

    :cond_1a
    iput-object v1, p0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    :cond_1c
    iget-object v0, p0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    if-nez v0, :cond_21

    return-void

    :cond_21
    iget-object v2, p0, Lltl;->g:Lwjj;

    if-eqz v2, :cond_2c

    iget-object v2, v2, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, Lcan;

    invoke-virtual {v2, v0}, Lcan;->a(Landroid/view/View;)V

    :cond_2c
    iput-object v1, p0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0594

    if-ne p1, v0, :cond_c

    invoke-virtual {p0}, Lcgn;->K0()V

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final onStart()V
    .registers 16

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-object v0, p0, Lcgn;->I:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lvfn;

    iget v1, v1, Lvfn;->a:I

    iget-object v2, p0, Lcgn;->y:Lxt8;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_25

    iget-object v1, p0, Lcgn;->G:Lsa2;

    invoke-virtual {v1}, Lsa2;->e()Z

    move-result v1

    if-eqz v1, :cond_25

    iget-object v1, p0, Lcgn;->v:Lydn;

    iget-object v5, v1, Lydn;->c:Lgfn;

    invoke-interface {v5}, Lgfn;->isEnabled()Z

    move-result v5

    if-nez v5, :cond_f5

    :cond_25
    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lvfn;

    iget v1, v1, Lvfn;->a:I

    const/4 v5, 0x2

    if-ne v1, v5, :cond_a9

    iget-object v1, p0, Lcgn;->H:Lsa2;

    invoke-virtual {v1}, Lsa2;->e()Z

    move-result v1

    if-eqz v1, :cond_a9

    iget-object v1, v2, Lxt8;->a:Lrb;

    iget-object v1, v1, Lrb;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v6, "vpn"

    const-string v7, "settings_fragment_shown_"

    invoke-virtual {v7, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sget-object v6, Lijm;->b:Lijm;

    iget-object v7, p0, Lcgn;->x:Lz77;

    if-nez v1, :cond_73

    new-instance v8, Lvp9;

    const v13, 0x7f141389

    const v14, 0x7f0402b9

    const v9, 0x7f0804c3

    const v10, 0x7f0402d7

    const v11, 0x7f14138a

    const v12, 0x7f141388

    invoke-direct/range {v8 .. v14}, Lvp9;-><init>(IIIIII)V

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7, v8, v6}, Lr22;->b(Ljjm;Lijm;)V

    goto/16 :goto_f8

    :cond_73
    iget-object v1, p0, Lcgn;->A:Ltvg;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsvg;

    invoke-virtual {v1, v5}, Lsvg;->a(I)Z

    move-result v1

    if-eqz v1, :cond_a9

    iget-object v1, p0, Lcgn;->w:Lktg;

    iget-object v5, v1, Lktg;->b:Lkze;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_a9

    iget-object v1, v1, Lktg;->a:Lydn;

    invoke-virtual {v1}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->e:Z

    if-eqz v1, :cond_a9

    new-instance v0, Lwen;

    iget-object p0, p0, Lcgn;->E:Lyug;

    invoke-direct {v0, p0, v3}, Lwen;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7, v0, v6}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_f8

    :cond_a9
    iget-object v1, p0, Lcgn;->D:Lghf;

    iget-object v5, v1, Lghf;->b:Ljava/lang/Object;

    check-cast v5, Lru9;

    iget-object v5, v5, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "premium.opera_account_promotion.dialog_shown"

    invoke-interface {v5, v6, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_f8

    iget-object v5, v1, Lghf;->d:Ljava/lang/Object;

    check-cast v5, Lydn;

    iget-object v5, v5, Lydn;->c:Lgfn;

    invoke-interface {v5}, Lgfn;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_f8

    iget-object v5, v1, Lghf;->c:Ljava/lang/Object;

    check-cast v5, Lxb;

    iget-object v5, v5, Lxb;->d:Lkze;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lipf;

    instance-of v5, v5, Lgpf;

    if-eqz v5, :cond_f8

    iget-object v1, v1, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Lru9;

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v5, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v5, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    new-instance v1, Lfhf;

    invoke-direct {v1}, Lfhf;-><init>()V

    new-instance v4, Lzfn;

    invoke-direct {v4, p0, v3}, Lzfn;-><init>(Lcgn;B)V

    invoke-virtual {v0, v1, v4}, Lua7;->E(Lr37;Lf7f;)V

    goto :goto_f8

    :cond_f5
    invoke-virtual {v1, v4}, Lydn;->C(Z)V

    :cond_f8
    :goto_f8
    invoke-virtual {v2, v3}, Lxt8;->S(I)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0a0640

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcgn;->K:Landroid/widget/ImageView;

    new-instance v0, Lsvk;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    const p2, 0x7f0a061e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/vpn/LocationButton;

    new-instance v0, Lbpd;

    invoke-direct {v0, p2}, Lbpd;-><init>(Lcom/opera/android/vpn/LocationButton;)V

    new-instance v0, Lyfn;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0a0158

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/settings/BigSwitchButton;

    iput-object p2, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    new-instance v0, Lyfn;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcgn;->v:Lydn;

    iget-object v0, p0, Lcgn;->r:Ladn;

    invoke-virtual {p2, v0}, Lydn;->b(Ltdn;)V

    invoke-virtual {p0}, Lcgn;->M0()V

    iget-object p2, p0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {p2}, Lcom/opera/android/settings/BigSwitchButton;->jumpDrawablesToCurrentState()V

    const p2, 0x7f0a0908

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    new-instance p2, Landroid/animation/LayoutTransition;

    invoke-direct {p2}, Landroid/animation/LayoutTransition;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    iget-object p2, p0, Lcgn;->s:Lggn;

    iget-object p2, p2, Lggn;->k:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lekc;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    new-instance v1, Lzfn;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lzfn;-><init>(Lcgn;B)V

    const/4 p0, 0x0

    invoke-static {p2, v0, p1, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final q()V
    .registers 1

    iget-object p0, p0, Lcgn;->t:Lrn9;

    invoke-virtual {p0}, Lrn9;->I()V

    return-void
.end method
