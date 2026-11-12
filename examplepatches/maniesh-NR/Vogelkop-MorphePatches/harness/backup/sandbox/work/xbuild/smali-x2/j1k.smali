.class public final synthetic Lj1k;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lj1k;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lj1k;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_334

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lnjm;

    invoke-virtual {p0}, Lnjm;->a()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_15
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lkfm;

    iget-object v0, p0, Lkfm;->a:Landroid/content/Context;

    iget-object v1, p0, Lkfm;->f:Ljava/lang/String;

    iget-object p0, p0, Lkfm;->j:Lvzk;

    iget-object p0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast p0, Lne5;

    iget-object p0, p0, Lne5;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    :try_start_27
    const-string v2, "clipboard"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    invoke-static {p0, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    :try_end_36
    .catchall {:try_start_27 .. :try_end_36} :catchall_36

    :catchall_36
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_39
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lifm;

    iget-object p0, p0, Lifm;->u:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0, v2, v1, v1}, Lcom/google/android/material/appbar/AppBarLayout;->k(ZZZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lpem;

    iget-object v0, p0, Lpem;->a:Lbz0;

    if-eqz v0, :cond_66

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_66

    invoke-static {v0}, Lcs5;->Q(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_66

    iget-object v0, p0, Lpem;->a:Lbz0;

    if-eqz v0, :cond_66

    invoke-virtual {v0}, Lzp1;->dismiss()V

    :cond_66
    iput-object v3, p0, Lpem;->a:Lbz0;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfdm;

    iget-object v0, p0, Lfdm;->a:Lbz0;

    if-eqz v0, :cond_86

    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_86

    invoke-static {v0}, Lcs5;->Q(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_86

    iget-object v0, p0, Lfdm;->a:Lbz0;

    if-eqz v0, :cond_86

    invoke-virtual {v0}, Lzp1;->dismiss()V

    :cond_86
    iput-object v3, p0, Lfdm;->a:Lbz0;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lv9l;

    iget-object v0, p0, Lv9l;->v:Lr9l;

    if-eqz v0, :cond_a7

    iget-object v0, p0, Lv9l;->t:Lx77;

    iget-object v1, v0, Lx77;->c:Ljava/lang/Object;

    check-cast v1, Lgm8;

    invoke-interface {v1}, Lgm8;->e()V

    iget-object v1, v0, Lx77;->d:Ljava/lang/Object;

    check-cast v1, Leq6;

    if-eqz v1, :cond_a5

    invoke-virtual {v1}, Leq6;->K()V

    :cond_a5
    iput-object v3, v0, Lx77;->d:Ljava/lang/Object;

    :cond_a7
    iput-object v3, p0, Lv9l;->v:Lr9l;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ac
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Lr9l;->k()Z

    move-result v0

    iget-object p0, p0, Lr9l;->q:Lebl;

    if-eqz v0, :cond_bf

    iget-object p0, p0, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_c5

    :cond_bf
    iget-object p0, p0, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    :goto_c5
    return-object p0

    :pswitch_c6
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lr9l;->F:Ljava/util/LinkedHashMap;

    sget-object v0, Lp6l;->b:Lp6l;

    iget-object v1, p0, Lr9l;->c:Lk6l;

    sget-object v2, Lr9l;->F:Ljava/util/LinkedHashMap;

    new-instance v4, Lk9l;

    iget v1, v1, Lk6l;->y:I

    invoke-direct {v4, v3, v1}, Lk9l;-><init>(Ljava/lang/String;I)V

    invoke-interface {v2, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lr9l;->w:Ls9i;

    invoke-virtual {p0}, Ls9i;->h0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e7
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lj9l;->d:Lj9l;

    iput-object v0, p0, Lr9l;->o:Lj9l;

    iget-object v0, p0, Lr9l;->e:Landroid/view/ViewGroup;

    iget-object p0, p0, Lr9l;->p:Li03;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_fc
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lr9l;

    invoke-virtual {p0}, Lr9l;->k()Z

    move-result v0

    iget-object p0, p0, Lr9l;->q:Lebl;

    if-eqz v0, :cond_10f

    iget-object p0, p0, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_115

    :cond_10f
    iget-object p0, p0, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    :goto_115
    return-object p0

    :pswitch_116
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object v0, p0, Lr9l;->i:Lgb3;

    invoke-virtual {v0}, Lgb3;->invoke()Ljava/lang/Object;

    iget-object v0, p0, Lr9l;->q:Lebl;

    iget-object v0, v0, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    new-instance v1, Lqlk;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, v2}, Lqlk;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_132
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lg4l;

    iget-object p0, p0, Lg4l;->h:Ltn;

    iget-boolean v0, p0, Ltn;->a:Z

    if-eqz v0, :cond_147

    iput-boolean v2, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast p0, Lwci;

    sget-object v0, Lrjf;->b:Lrjf;

    invoke-virtual {p0, v0}, Lwci;->o(Lrjf;)V

    :cond_147
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object p0, p0, Lz5l;->z:Lzc3;

    invoke-virtual {p0}, Lzc3;->y()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_159

    invoke-virtual {p0, v0, v1}, Lzc3;->z(Landroid/view/View;Z)V

    :cond_159
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_15c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object v0, p0, Lz5l;->B:Lev7;

    invoke-virtual {v0}, Lev7;->j()V

    iget-object p0, p0, Lz5l;->m:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object v0, p0, Lz5l;->B:Lev7;

    invoke-virtual {v0}, Lev7;->j()V

    iget-object p0, p0, Lz5l;->m:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object v0, p0, Lz5l;->B:Lev7;

    invoke-virtual {v0}, Lev7;->j()V

    iget-object p0, p0, Lz5l;->m:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18f
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object v0, p0, Lz5l;->B:Lev7;

    invoke-virtual {v0}, Lev7;->j()V

    iget-object p0, p0, Lz5l;->m:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a0
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lg4l;

    iget-object v0, p0, Lg4l;->a:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqyi;

    sget-object v2, Loyi;->a:Loyi;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c6

    iget-object v0, p0, Lg4l;->j:Ljava/util/ArrayList;

    sget-object v2, Lf4l;->c:Lf4l;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c1

    iput-boolean v1, p0, Lg4l;->p:Z

    goto :goto_1c6

    :cond_1c1
    iget-object p0, p0, Lg4l;->h:Ltn;

    invoke-virtual {p0}, Ltn;->C()V

    :cond_1c6
    :goto_1c6
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c9
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lc4l;

    iget-object p0, p0, Lc4l;->a:Lnw3;

    iget-object p0, p0, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v2, "tab_gallery.tabui2_bubble_tour_shown"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1e8
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqwk;

    iget-object v0, p0, Lqwk;->j:Lswk;

    invoke-virtual {v0}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "password.promote"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lu5k;->A()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_204
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqwk;

    iget-object v0, p0, Lqwk;->m:Lft3;

    iget-object v3, p0, Lqwk;->i:Lzwk;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lcak;->d:Lavj;

    invoke-static {v1}, Lavj;->b(I)Z

    move-result v3

    if-nez v3, :cond_219

    move v3, v2

    goto :goto_21d

    :cond_219
    invoke-static {}, LJ/N;->MhJnoDjg()I

    move-result v3

    :goto_21d
    const/4 v4, 0x6

    if-eq v3, v4, :cond_224

    invoke-virtual {p0, v1}, Lqwk;->D(Z)V

    goto :goto_28f

    :cond_224
    invoke-static {}, Lzwk;->h()Z

    move-result v3

    sget-object v4, Lijm;->b:Lijm;

    if-eqz v3, :cond_246

    iget-object v0, v0, Lft3;->b:Lqim;

    iget-object v0, v0, Lqim;->c:Lz77;

    new-instance v1, Lpwk;

    invoke-direct {v1, p0, v2}, Lpwk;-><init>(Lqwk;B)V

    new-instance p0, Lw48;

    invoke-direct {p0}, Lw48;-><init>()V

    new-instance v3, Lt48;

    invoke-direct {v3, p0, v1, v2}, Lt48;-><init>(Luim;Ljava/lang/Runnable;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v3, v4}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_28f

    :cond_246
    iget-object v2, p0, Lqwk;->k:Let3;

    iget-object v2, v2, Let3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v2

    invoke-virtual {v2}, Ldb;->b()Ljh0;

    move-result-object v2

    sget-object v3, Ljh0;->d:Ljh0;

    if-eq v2, v3, :cond_274

    invoke-static {}, Lzwk;->g()Z

    move-result v2

    if-nez v2, :cond_274

    new-instance v0, La06;

    invoke-direct {v0}, La06;-><init>()V

    new-instance v2, Lpwk;

    invoke-direct {v2, p0, v1}, Lpwk;-><init>(Lqwk;B)V

    iput-object v2, v0, La06;->u:Ljava/lang/Runnable;

    const/16 v1, 0x1003

    invoke-static {v0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object p0, p0, Lqwk;->f:Landroid/content/Context;

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_28f

    :cond_274
    iget-object v0, v0, Lft3;->b:Lqim;

    iget-object v0, v0, Lqim;->c:Lz77;

    new-instance v1, Ltu;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Ltu;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Ll18;

    invoke-direct {p0}, Ll18;-><init>()V

    new-instance v2, Lk18;

    invoke-direct {v2, p0, v1, p0}, Lk18;-><init>(Ll18;Ltu;Ll18;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v2, v4}, Lr22;->b(Ljjm;Lijm;)V

    :goto_28f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_292
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqwk;

    invoke-virtual {p0}, Lqwk;->E()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqwk;

    iget-object v0, p0, Lqwk;->m:Lft3;

    iget-object v0, v0, Lft3;->b:Lqim;

    iget-object v0, v0, Lqim;->c:Lz77;

    iget-object v1, p0, Lqwk;->k:Let3;

    iget-object v1, v1, Let3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    iget-object p0, p0, Lqwk;->i:Lzwk;

    invoke-static {v0, v1, p0, v3, v3}, Lxih;->x(Lz77;Ldb;Lzwk;Ljava/lang/Runnable;Ll31;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b6
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqwk;

    invoke-virtual {p0}, Lqwk;->E()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c0
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqwk;

    iget-object v0, p0, Lqwk;->m:Lft3;

    iget-object v0, v0, Lft3;->b:Lqim;

    iget-object v0, v0, Lqim;->c:Lz77;

    iget-object v1, p0, Lqwk;->k:Let3;

    iget-object v1, v1, Let3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    iget-object p0, p0, Lqwk;->i:Lzwk;

    invoke-static {v0, v1, p0, v3, v3}, Lxih;->x(Lz77;Ldb;Lzwk;Ljava/lang/Runnable;Ll31;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2da
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lmrk;

    invoke-virtual {p0}, Lmrk;->d()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2e7
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lfbf;

    iget-object p0, p0, Lfbf;->a:Lgbf;

    iget-object p0, p0, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lupm;->h()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2f9
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    check-cast p0, Lg1k;

    iget-object p0, p0, Lg1k;->h:Lnak;

    invoke-virtual {p0, v3}, Lnak;->j(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_307
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    check-cast p0, Lg1k;

    iget-object v0, p0, Lg1k;->h:Lnak;

    invoke-virtual {v0, v3}, Lnak;->j(Ljava/lang/Object;)V

    iget-object p0, p0, Lg1k;->c:Lc1k;

    iget-object p0, p0, Lc1k;->a:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31c
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    check-cast p0, Lg1k;

    iget-object p0, p0, Lg1k;->i:Lnak;

    :cond_324
    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lfum;

    invoke-virtual {p0, v0, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_324

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_334
    .packed-switch 0x0
        :pswitch_31c
        :pswitch_307
        :pswitch_2f9
        :pswitch_2e7
        :pswitch_2da
        :pswitch_2c0
        :pswitch_2b6
        :pswitch_29c
        :pswitch_292
        :pswitch_204
        :pswitch_1e8
        :pswitch_1c9
        :pswitch_1a0
        :pswitch_18f
        :pswitch_17e
        :pswitch_16d
        :pswitch_15c
        :pswitch_14a
        :pswitch_132
        :pswitch_116
        :pswitch_fc
        :pswitch_e7
        :pswitch_c6
        :pswitch_ac
        :pswitch_8b
        :pswitch_6b
        :pswitch_4b
        :pswitch_39
        :pswitch_15
    .end packed-switch
.end method
