.class public final Lyse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/fragment/app/Fragment;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/Fragment;B)V
    .registers 3

    iput-byte p2, p0, Lyse;->a:B

    iput-object p1, p0, Lyse;->b:Landroidx/fragment/app/Fragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lyse;->a:B

    const/4 v1, 0x0

    const-string v2, "Local and anonymous classes can not be ViewModels"

    const-string v3, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    iget-object p0, p0, Lyse;->b:Landroidx/fragment/app/Fragment;

    packed-switch v0, :pswitch_data_426

    check-cast p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lrlm;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3a

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_3d

    :cond_3a
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_3d
    return-object v1

    :pswitch_3e
    check-cast p0, Luxk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Ldyk;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6c

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_6f

    :cond_6c
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_6f
    return-object v1

    :pswitch_70
    check-cast p0, Lxrk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lyrk;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9e

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_a1

    :cond_9e
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_a1
    return-object v1

    :pswitch_a2
    check-cast p0, Lqrk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lrrk;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_d3

    :cond_d0
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_d3
    return-object v1

    :pswitch_d4
    check-cast p0, Lv7k;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lc8k;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_102

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_105

    :cond_102
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_105
    return-object v1

    :pswitch_106
    check-cast p0, Lszj;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lwzj;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_134

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_137

    :cond_134
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_137
    return-object v1

    :pswitch_138
    check-cast p0, Lc9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lo9j;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_166

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_169

    :cond_166
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_169
    return-object v1

    :pswitch_16a
    check-cast p0, Lk6j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Ldaj;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_198

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_19b

    :cond_198
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_19b
    return-object v1

    :pswitch_19c
    check-cast p0, Lisi;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lqsi;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1ca

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_1cd

    :cond_1ca
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1cd
    return-object v1

    :pswitch_1ce
    check-cast p0, Ldqi;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lgqi;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1fc

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_1ff

    :cond_1fc
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1ff
    return-object v1

    :pswitch_200
    check-cast p0, Lk4i;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Ll4i;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22e

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_231

    :cond_22e
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_231
    return-object v1

    :pswitch_232
    check-cast p0, Ls3i;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lt3i;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_260

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_263

    :cond_260
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_263
    return-object v1

    :pswitch_264
    check-cast p0, Lazg;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lhzg;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_292

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_295

    :cond_292
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_295
    return-object v1

    :pswitch_296
    check-cast p0, Lxtg;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lvug;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2c4

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_2c7

    :cond_2c4
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_2c7
    return-object v1

    :pswitch_2c8
    check-cast p0, Locg;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lzcg;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2f6

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_2f9

    :cond_2f6
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_2f9
    return-object v1

    :pswitch_2fa
    check-cast p0, Lhcg;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Llcg;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_328

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_32b

    :cond_328
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_32b
    return-object v1

    :pswitch_32c
    check-cast p0, Lf6g;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lm6g;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_35a

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_35d

    :cond_35a
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_35d
    return-object v1

    :pswitch_35e
    check-cast p0, Lt5g;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lt6g;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_38c

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_38f

    :cond_38c
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_38f
    return-object v1

    :pswitch_390
    check-cast p0, Lmhf;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Lnhf;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3be

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_3c1

    :cond_3be
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_3c1
    return-object v1

    :pswitch_3c2
    check-cast p0, La3f;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Ld3f;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3f0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_3f3

    :cond_3f0
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_3f3
    return-object v1

    :pswitch_3f4
    check-cast p0, Lzse;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ln7n;

    invoke-interface {v0}, Ln7n;->j()Lr7n;

    move-result-object v0

    invoke-interface {p0}, Lw7n;->getViewModelStore()Lv7n;

    move-result-object v4

    invoke-static {p0}, Lm5h;->n(Lw7n;)Lg06;

    move-result-object p0

    new-instance v5, Lplk;

    invoke-direct {v5, v4, v0, p0}, Lplk;-><init>(Lv7n;Lr7n;Lg06;)V

    const-class p0, Ldte;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_422

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v1

    goto :goto_425

    :cond_422
    invoke-static {v2}, Lqp2;->o(Ljava/lang/String;)V

    :goto_425
    return-object v1

    :pswitch_data_426
    .packed-switch 0x0
        :pswitch_3f4
        :pswitch_3c2
        :pswitch_390
        :pswitch_35e
        :pswitch_32c
        :pswitch_2fa
        :pswitch_2c8
        :pswitch_296
        :pswitch_264
        :pswitch_232
        :pswitch_200
        :pswitch_1ce
        :pswitch_19c
        :pswitch_16a
        :pswitch_138
        :pswitch_106
        :pswitch_d4
        :pswitch_a2
        :pswitch_70
        :pswitch_3e
    .end packed-switch
.end method
