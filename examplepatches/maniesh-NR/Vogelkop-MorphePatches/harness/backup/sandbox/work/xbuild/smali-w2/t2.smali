.class public final Lt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lt2;->a:B

    iput-object p1, p0, Lt2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lt2;->a:B

    const-string v1, "Local and anonymous classes can not be ViewModels"

    const-string v2, "androidx.lifecycle.ViewModelProvider.DefaultKey:"

    const/4 v3, 0x0

    iget-object p0, p0, Lt2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_642

    check-cast p0, Lrse;

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

    const-class p0, Lsse;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3a

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_3d

    :cond_3a
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_3d
    return-object v3

    :pswitch_3e
    check-cast p0, Lcrd;

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

    const-class p0, Lfrd;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6c

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_6f

    :cond_6c
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_6f
    return-object v3

    :pswitch_70
    check-cast p0, Li8d;

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

    const-class p0, La9d;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9e

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_a1

    :cond_9e
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_a1
    return-object v3

    :pswitch_a2
    check-cast p0, Lg3b;

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

    const-class p0, Lh3b;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_d3

    :cond_d0
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_d3
    return-object v3

    :pswitch_d4
    check-cast p0, Lo2b;

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

    const-class p0, Lq2b;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_102

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_105

    :cond_102
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_105
    return-object v3

    :pswitch_106
    check-cast p0, Le2b;

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

    const-class p0, Lh2b;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_134

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_137

    :cond_134
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_137
    return-object v3

    :pswitch_138
    check-cast p0, Ldda;

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

    const-class p0, Lcom/opera/android/history/f;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_166

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_169

    :cond_166
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_169
    return-object v3

    :pswitch_16a
    check-cast p0, Lcaa;

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

    const-class p0, Leaa;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_198

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_19b

    :cond_198
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_19b
    return-object v3

    :pswitch_19c
    check-cast p0, Lfw9;

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

    const-class p0, Liw9;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1ca

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_1cd

    :cond_1ca
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1cd
    return-object v3

    :pswitch_1ce
    check-cast p0, Lyt9;

    iget-object p0, p0, Lyt9;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-instance v1, Lsee;

    invoke-direct {v1, v0}, Lsee;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    move v4, v2

    :goto_1e1
    if-ge v4, v0, :cond_23f

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrub;

    iget-object v6, v5, Lrub;->b:Ljava/lang/Object;

    iget v7, v5, Lrub;->a:I

    if-eqz v6, :cond_1fb

    new-instance v6, Lyob;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v8, v5, Lrub;->b:Ljava/lang/Object;

    invoke-direct {v6, v7, v8}, Lyob;-><init>(Ljava/lang/Integer;Ljava/lang/Object;)V

    goto :goto_1ff

    :cond_1fb
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :goto_1ff
    invoke-virtual {v1, v6}, Lsee;->f(Ljava/lang/Object;)I

    move-result v7

    if-gez v7, :cond_207

    const/4 v8, 0x1

    goto :goto_208

    :cond_207
    move v8, v2

    :goto_208
    if-eqz v8, :cond_20c

    move-object v9, v3

    goto :goto_210

    :cond_20c
    iget-object v9, v1, Lsee;->c:[Ljava/lang/Object;

    aget-object v9, v9, v7

    :goto_210
    if-eqz v9, :cond_22c

    instance-of v10, v9, Ldee;

    if-eqz v10, :cond_21d

    check-cast v9, Ldee;

    invoke-virtual {v9, v5}, Ldee;->a(Ljava/lang/Object;)V

    move-object v5, v9

    goto :goto_22c

    :cond_21d
    sget-object v10, Lp6f;->a:[Ljava/lang/Object;

    new-instance v10, Ldee;

    const/4 v11, 0x2

    invoke-direct {v10, v11}, Ldee;-><init>(I)V

    invoke-virtual {v10, v9}, Ldee;->a(Ljava/lang/Object;)V

    invoke-virtual {v10, v5}, Ldee;->a(Ljava/lang/Object;)V

    move-object v5, v10

    :cond_22c
    :goto_22c
    if-eqz v8, :cond_238

    not-int v7, v7

    iget-object v8, v1, Lsee;->b:[Ljava/lang/Object;

    aput-object v6, v8, v7

    iget-object v6, v1, Lsee;->c:[Ljava/lang/Object;

    aput-object v5, v6, v7

    goto :goto_23c

    :cond_238
    iget-object v6, v1, Lsee;->c:[Ljava/lang/Object;

    aput-object v5, v6, v7

    :goto_23c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e1

    :cond_23f
    new-instance p0, Ljce;

    invoke-direct {p0, v1}, Ljce;-><init>(Lsee;)V

    return-object p0

    :pswitch_245
    check-cast p0, Lc29;

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

    const-class p0, Le29;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_273

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_276

    :cond_273
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_276
    return-object v3

    :pswitch_277
    check-cast p0, Lamj;

    iget-object v0, p0, Lamj;->k:Lrul;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    if-eqz v0, :cond_29f

    invoke-interface {v0}, Lrul;->getState()Ltul;

    move-result-object v0

    if-eqz v0, :cond_29f

    iget v3, v0, Ltul;->a:F

    cmpg-float v4, v3, v2

    if-eqz v4, :cond_29f

    iget-object v4, v0, Ltul;->b:Lp0g;

    invoke-virtual {v4}, Lp0g;->h()F

    move-result v4

    sub-float/2addr v3, v4

    iget v4, v0, Ltul;->a:F

    invoke-static {v3, v4, v2}, Ldjh;->b(FFF)F

    move-result v3

    iget v0, v0, Ltul;->a:F

    div-float/2addr v3, v0

    sub-float v0, v1, v3

    goto :goto_2a0

    :cond_29f
    move v0, v2

    :goto_2a0
    iget-object p0, p0, Lamj;->j:Lnul;

    const v3, 0x3c23d70a    # 0.01f

    cmpl-float v0, v0, v3

    if-gtz v0, :cond_2aa

    move v1, v2

    :cond_2aa
    iget-wide v2, p0, Lnul;->a:J

    iget-wide v4, p0, Lnul;->b:J

    sget-object p0, Lwq7;->b:Lu36;

    invoke-virtual {p0, v1}, Lu36;->c(F)F

    move-result p0

    invoke-static {v2, v3, v4, v5, p0}, Lcs5;->e0(JJF)J

    move-result-wide v0

    new-instance p0, Lu95;

    invoke-direct {p0, v0, v1}, Lu95;-><init>(J)V

    return-object p0

    :pswitch_2be
    check-cast p0, Lzk4;

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

    const-class p0, Ldl4;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2ec

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_2ef

    :cond_2ec
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_2ef
    return-object v3

    :pswitch_2f0
    check-cast p0, Lgy3;

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

    const-class p0, Loy3;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_31e

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_321

    :cond_31e
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_321
    return-object v3

    :pswitch_322
    check-cast p0, Lwo3;

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

    const-class p0, Lyo3;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_350

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_353

    :cond_350
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_353
    return-object v3

    :pswitch_354
    check-cast p0, Llu2;

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

    const-class p0, Lmu2;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_382

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_385

    :cond_382
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_385
    return-object v3

    :pswitch_386
    check-cast p0, Leu2;

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

    const-class p0, Lhu2;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3b4

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_3b7

    :cond_3b4
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_3b7
    return-object v3

    :pswitch_3b8
    check-cast p0, Lqt2;

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

    const-class p0, Lst2;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3e6

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_3e9

    :cond_3e6
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_3e9
    return-object v3

    :pswitch_3ea
    check-cast p0, Lxq2;

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

    const-class p0, Lbr2;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_418

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_41b

    :cond_418
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_41b
    return-object v3

    :pswitch_41c
    check-cast p0, Lkc2;

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

    const-class p0, Lqc2;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_44a

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_44d

    :cond_44a
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_44d
    return-object v3

    :pswitch_44e
    check-cast p0, Lpu1;

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

    const-class p0, Ldv1;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_47c

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_47f

    :cond_47c
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_47f
    return-object v3

    :pswitch_480
    check-cast p0, Lts1;

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

    const-class p0, Lat1;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4ae

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_4b1

    :cond_4ae
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_4b1
    return-object v3

    :pswitch_4b2
    check-cast p0, Lgs1;

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

    const-class p0, Lms1;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4e0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_4e3

    :cond_4e0
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_4e3
    return-object v3

    :pswitch_4e4
    check-cast p0, Luw;

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

    const-class p0, Lcx;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_512

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_515

    :cond_512
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_515
    return-object v3

    :pswitch_516
    check-cast p0, Lru;

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

    const-class p0, Lxu;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_544

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_547

    :cond_544
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_547
    return-object v3

    :pswitch_548
    check-cast p0, Lct;

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

    const-class p0, Lju;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_576

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_579

    :cond_576
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_579
    return-object v3

    :pswitch_57a
    check-cast p0, Lss;

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

    const-class p0, Lxs;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5a8

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_5ab

    :cond_5a8
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_5ab
    return-object v3

    :pswitch_5ac
    check-cast p0, Llk;

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

    const-class p0, Lpk;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5da

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_5dd

    :cond_5da
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_5dd
    return-object v3

    :pswitch_5de
    check-cast p0, Lp9;

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

    const-class p0, Lt9;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_60c

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_60f

    :cond_60c
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_60f
    return-object v3

    :pswitch_610
    check-cast p0, Lu2;

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

    const-class p0, Ld3;

    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p0

    invoke-virtual {p0}, Ls15;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_63e

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, p0, v0}, Lplk;->n(Ls15;Ljava/lang/String;)Ll7n;

    move-result-object v3

    goto :goto_641

    :cond_63e
    invoke-static {v1}, Lqp2;->o(Ljava/lang/String;)V

    :goto_641
    return-object v3

    :pswitch_data_642
    .packed-switch 0x0
        :pswitch_610
        :pswitch_5de
        :pswitch_5ac
        :pswitch_57a
        :pswitch_548
        :pswitch_516
        :pswitch_4e4
        :pswitch_4b2
        :pswitch_480
        :pswitch_44e
        :pswitch_41c
        :pswitch_3ea
        :pswitch_3b8
        :pswitch_386
        :pswitch_354
        :pswitch_322
        :pswitch_2f0
        :pswitch_2be
        :pswitch_277
        :pswitch_245
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
