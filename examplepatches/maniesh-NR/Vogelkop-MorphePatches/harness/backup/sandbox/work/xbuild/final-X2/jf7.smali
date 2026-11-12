.class public final synthetic Ljf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Ljf7;->a:B

    iput-object p1, p0, Ljf7;->b:Ljava/lang/Object;

    iput-object p2, p0, Ljf7;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Ljf7;->a:B

    sget-object v3, Lijm;->b:Lijm;

    const/4 v4, -0x1

    sget-object v5, Lhjm;->a:Lhjm;

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    iget-object v10, v0, Ljf7;->c:Ljava/lang/Object;

    iget-object v0, v0, Ljf7;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_3f8

    check-cast v0, Lkwf;

    check-cast v10, Lwcj;

    invoke-virtual {v0}, Lo73;->b()Z

    iget-object v0, v0, Lkwf;->l:Lnwf;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lwp3;

    invoke-direct {v1, v0, v10, v8}, Lwp3;-><init>(Lt0h;Ljava/lang/Object;B)V

    return-void

    :pswitch_28
    check-cast v0, Ltn;

    check-cast v10, Llrf;

    iget-object v0, v0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lyrf;

    invoke-virtual {v0, v10}, Lyrf;->e(Llrf;)Z

    move-result v1

    if-nez v1, :cond_39

    invoke-virtual {v0, v10}, Lyrf;->f(Llrf;)V

    :cond_39
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_3d
    check-cast v0, Ldnf;

    check-cast v10, Lgtj;

    iget-object v1, v0, Ldnf;->f:Lhp2;

    invoke-virtual {v1}, Lhp2;->a()Z

    move-result v1

    if-nez v1, :cond_4f

    invoke-virtual {v0}, Ldnf;->g()V

    invoke-virtual {v10}, Lgtj;->a()V

    :cond_4f
    return-void

    :pswitch_50
    check-cast v0, Lhv3;

    check-cast v10, Lbbf;

    invoke-virtual {v0}, Lhv3;->m()V

    iget-object v0, v10, Lbbf;->a:Labf;

    invoke-interface {v0}, Labf;->dismiss()V

    return-void

    :pswitch_5d
    check-cast v0, Ljve;

    check-cast v10, Lnb8;

    iget-object v1, v0, Ljve;->h:Luqe;

    iget-object v2, v10, Lnb8;->i:Ljava/lang/String;

    iget-object v3, v10, Lnb8;->h:Ljava/lang/String;

    iget-object v1, v1, Luqe;->h:Luy8;

    iget-object v4, v1, Luy8;->F:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_91

    iget-object v1, v1, Luy8;->K:Ly0f;

    iget-object v1, v1, Ly0f;->a:Lx5f;

    iget-boolean v4, v1, Lx5f;->h:Z

    if-eqz v4, :cond_91

    iget-object v4, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v7, Lck0;

    invoke-direct {v7, v4, v5}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v4, Lj5f;

    sget-object v10, Lod0;->b:Lod0;

    invoke-direct {v4, v2, v10, v6}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v7, v4}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v1, v5}, Lx5f;->U0(Lx56;)V

    :cond_91
    invoke-static {v3}, Lwqm;->v(Ljava/lang/String;)Z

    move-result v1

    sget-object v2, Llqm;->C:Llqm;

    if-eqz v1, :cond_a3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v0, v0, Ljve;->l:Landroid/content/Context;

    invoke-static {v1, v2, v8, v0}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    goto :goto_c3

    :cond_a3
    new-instance v1, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v4, "newsevent"

    invoke-direct {v1, v4, v3}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcve;->g0()Lfve;

    move-result-object v0

    iget-object v0, v0, Lj82;->c:Loqe;

    iget-object v0, v0, Loqe;->b:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v1}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2, v9}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    invoke-virtual {v0, v8}, Lvx3;->a(Z)V

    invoke-static {v0}, Lam2;->v(Lvx3;)V

    :goto_c3
    return-void

    :pswitch_c4
    check-cast v0, Le0e;

    check-cast v10, Ls2;

    iget-object v1, v0, Le0e;->m:Lzzd;

    if-eqz v1, :cond_cf

    invoke-virtual {v10, v1, v0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_cf
    return-void

    :pswitch_d0
    check-cast v0, Ld0e;

    check-cast v10, Ls2;

    iget-object v1, v0, Ld0e;->l:Lyzd;

    if-eqz v1, :cond_db

    invoke-virtual {v10, v1, v0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_db
    return-void

    :pswitch_dc
    check-cast v0, Lua7;

    check-cast v10, Lcwd;

    iget-object v0, v0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Ldwd;

    iget-object v1, v10, Lcwd;->c:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_ed
    check-cast v0, Lgtd;

    check-cast v10, Lexd;

    iget-object v0, v0, Lgtd;->c:Landroid/view/View$OnClickListener;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    invoke-virtual {v10, v5}, Llz3;->b(Lhjm;)Z

    return-void

    :pswitch_fa
    check-cast v0, Lgnd;

    check-cast v10, Lcod;

    iget-object v1, v0, Lgnd;->f:Lqt5;

    iget-object v1, v1, Lqt5;->h:Ljava/lang/Object;

    check-cast v1, Lhnd;

    iput-object v10, v1, Lhnd;->o:Lcod;

    invoke-virtual {v10, v8}, Lcod;->l(Z)V

    iget-object v1, v0, Lgnd;->c:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, v0, Lgnd;->d:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_115
    check-cast v0, Lcmd;

    check-cast v10, Lyzb;

    iget-object v0, v0, Lcmd;->e:Lqjd;

    iget-object v1, v10, Lyzb;->b:Ljava/lang/Object;

    check-cast v1, Lzld;

    iget-object v2, v1, Lzld;->b:Lxbf;

    iget-object v2, v2, Lxbf;->c:Ljava/lang/Object;

    check-cast v2, Lode;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgig;

    invoke-interface {v3}, Lgig;->g()Lqjd;

    move-result-object v3

    invoke-virtual {v0, v3}, Lqjd;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13b

    iget-object v0, v1, Lzld;->e:Lmig;

    invoke-virtual {v0}, Lmig;->e()Z

    goto :goto_158

    :cond_13b
    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgig;

    invoke-interface {v3}, Lgig;->isPlayingAd()Z

    move-result v3

    if-nez v3, :cond_158

    iget-object v1, v1, Lzld;->g:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-eq v0, v4, :cond_158

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    invoke-interface {v1, v0}, Lgig;->seekToDefaultPosition(I)V

    :cond_158
    :goto_158
    return-void

    :pswitch_159
    check-cast v0, Lgvc;

    check-cast v10, Lfvc;

    iget-object v1, v10, Lfvc;->c:Lbre;

    if-eqz v1, :cond_189

    iget-object v0, v0, Lgvc;->a:Lbvc;

    iget-object v0, v0, Lbvc;->a:Ldvc;

    iget-object v2, v0, Ldvc;->s:Lyqa;

    iget-object v3, v2, Lyqa;->b:Ljava/lang/Object;

    check-cast v3, Lx77;

    if-eqz v3, :cond_186

    iget-object v3, v3, Lx77;->d:Ljava/lang/Object;

    check-cast v3, Lbre;

    invoke-virtual {v1, v3}, Lbre;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_186

    iget-object v3, v2, Lyqa;->b:Ljava/lang/Object;

    check-cast v3, Lx77;

    iput-object v1, v3, Lx77;->d:Ljava/lang/Object;

    iget-object v2, v2, Lyqa;->c:Ljava/lang/Object;

    check-cast v2, Livc;

    if-eqz v2, :cond_186

    invoke-interface {v2, v1}, Livc;->b(Lbre;)V

    :cond_186
    invoke-virtual {v0}, Lryl;->g0()V

    :cond_189
    return-void

    :pswitch_18a
    check-cast v0, Ls6h;

    check-cast v10, Llrc;

    invoke-virtual {v0}, Ls6h;->I()Z

    move-result v0

    if-eqz v0, :cond_19c

    iget-object v0, v10, Llrc;->C:Lvl6;

    if-eqz v0, :cond_199

    move-object v7, v0

    :cond_199
    invoke-virtual {v7}, Lvl6;->S()Z

    :cond_19c
    return-void

    :pswitch_19d
    check-cast v0, Lci7;

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v0, v10}, Lci7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1a5
    check-cast v0, Lqkc;

    check-cast v10, Lzmc;

    iget-object v0, v0, Lqkc;->b:Ljs6;

    invoke-virtual {v0, v10}, Ljs6;->b(Lzmc;)V

    return-void

    :pswitch_1af
    check-cast v0, Lbg7;

    check-cast v10, Lz4m;

    iget-object v1, v0, Lbg7;->e:Ljava/lang/Object;

    check-cast v1, Lbz0;

    if-eqz v1, :cond_1dc

    iget-object v1, v0, Lbg7;->d:Ljava/lang/Object;

    check-cast v1, Lge5;

    iget-object v2, v1, Lge5;->b:Ljava/lang/Object;

    check-cast v2, Lf1c;

    iget-object v1, v1, Lge5;->c:Ljava/lang/Object;

    check-cast v1, Lz4m;

    if-eq v10, v1, :cond_1d5

    iget-object v1, v2, Lf1c;->x:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "translation_source"

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    invoke-virtual {v1, v3, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_1d5
    iget-object v0, v0, Lbg7;->e:Ljava/lang/Object;

    check-cast v0, Lbz0;

    invoke-virtual {v0}, Lzp1;->dismiss()V

    :cond_1dc
    return-void

    :pswitch_1dd
    check-cast v0, Lb1c;

    check-cast v10, La1c;

    iget-object v0, v0, Lb1c;->e:Lf1c;

    iget-object v1, v10, La1c;->a:Li0c;

    iget-object v2, v0, Lf1c;->B:Lcr2;

    iget-object v2, v2, Lcr2;->g:Landroid/view/ViewGroup;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v2

    new-instance v4, Ld1c;

    iget-object v5, v1, Li0c;->a:Lszb;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lszb;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    iget v6, v1, Li0c;->b:I

    new-instance v7, Lz0c;

    invoke-direct {v7, v0, v1, v9}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v4, v5, v6, v7}, Ld1c;-><init>(Ljava/lang/String;ILz0c;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v4, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_210
    check-cast v0, Lywa;

    check-cast v10, Lnsl;

    sget-object v1, Lywa;->g:[Lxtb;

    invoke-virtual {v0}, Lywa;->g0()Llxa;

    move-result-object v0

    iget-object v1, v0, Llxa;->n:Lnak;

    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v10, :cond_223

    move-object v10, v7

    :cond_223
    iget-object v1, v0, Llxa;->n:Lnak;

    invoke-virtual {v1, v10}, Lnak;->j(Ljava/lang/Object;)V

    if-eqz v10, :cond_232

    sget-object v1, Ljxa;->a:[I

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v4, v1, v2

    :cond_232
    if-eq v4, v8, :cond_23f

    if-ne v4, v6, :cond_248

    new-instance v1, Lhxa;

    invoke-direct {v1, v7}, Lhxa;-><init>(Landroid/graphics/PointF;)V

    invoke-virtual {v0, v1}, Lx7n;->f(Ljava/lang/Object;)V

    goto :goto_248

    :cond_23f
    new-instance v1, Ldxa;

    const/4 v2, 0x3

    invoke-direct {v1, v7, v2}, Ldxa;-><init>(Landroid/graphics/PointF;I)V

    invoke-virtual {v0, v1}, Lx7n;->f(Ljava/lang/Object;)V

    :cond_248
    :goto_248
    return-void

    :pswitch_249
    check-cast v0, Lsba;

    check-cast v10, Lqba;

    iput-boolean v8, v0, Lsba;->g:Z

    invoke-virtual {v0, v5}, Llz3;->b(Lhjm;)Z

    iget-object v0, v10, Lqba;->h:Loc;

    iget-object v0, v0, Loc;->b:Landroid/view/View$OnClickListener;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    return-void

    :pswitch_25a
    check-cast v0, Lqb9;

    check-cast v10, Lib9;

    iget-object v0, v0, Lqb9;->m:Lfge;

    iget-object v1, v0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->d:Lnej;

    new-instance v2, Lzfe;

    invoke-direct {v2, v0, v10, v9}, Lzfe;-><init>(Lltl;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_275
    check-cast v0, Lpz7;

    check-cast v10, Lhy7;

    iget-object v0, v0, Lpz7;->c:Ljava/lang/String;

    if-eqz v0, :cond_2b2

    iget-object v1, v10, Lhy7;->a:Lywa;

    if-eqz v1, :cond_2b2

    invoke-virtual {v10}, Luq3;->dismiss()V

    iget-object v1, v10, Lhy7;->a:Lywa;

    invoke-virtual {v1}, Lywa;->h0()Lora;

    move-result-object v2

    iget-object v2, v2, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    iget-object v1, v1, Lywa;->b:Landroid/graphics/PointF;

    if-nez v1, :cond_29c

    sget-object v1, Lba3;->i:Ly55;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/graphics/PointF;

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-direct {v1, v3, v3}, Landroid/graphics/PointF;-><init>(FF)V

    :cond_29c
    new-instance v3, Lox7;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-direct {v3, v0, v1, v4, v5}, Lox7;-><init>(Ljava/lang/String;Landroid/graphics/PointF;FF)V

    iget-object v0, v2, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-virtual {v0, v3}, Ldya;->b(Lfya;)V

    invoke-virtual {v2, v3}, Lcom/opera/hype/image/editor/EditImage;->e(Lba3;)Lbfl;

    move-result-object v0

    if-eqz v0, :cond_2b2

    invoke-virtual {v2, v0, v9}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    :cond_2b2
    return-void

    :pswitch_2b3
    check-cast v0, Lmz7;

    check-cast v10, Landroid/view/View;

    check-cast v1, Landroidx/emoji2/emojipicker/EmojiView;

    iget-object v1, v1, Landroidx/emoji2/emojipicker/EmojiView;->d:Ljava/lang/CharSequence;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lmz7;->d:Liy7;

    invoke-virtual {v2, v0, v1}, Liy7;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v0, Lmz7;->c:Liy7;

    invoke-static {v1}, Lmz7;->U(Ljava/lang/String;)Lnz7;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Liy7;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v0, Lmz7;->b:Ld7h;

    iget-object v3, v0, Lmz7;->g:Lnz7;

    if-nez v3, :cond_2d4

    move-object v3, v7

    :cond_2d4
    iget-object v3, v3, Lnz7;->b:Ljava/util/List;

    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, v2, Ld7h;->c:Ljava/lang/Object;

    check-cast v4, Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f0

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f3

    :cond_2f0
    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2f3
    iget-object v1, v2, Ld7h;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Ljava/lang/Iterable;

    const/16 v16, 0x0

    const/16 v17, 0x3e

    const-string v12, "|"

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static/range {v11 .. v17}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "pref_key_sticky_variant"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object v0, v0, Lmz7;->h:Lua7;

    if-eqz v0, :cond_31d

    move-object v7, v0

    :cond_31d
    iget-object v0, v7, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_32a

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_32a
    const/16 v0, 0x80

    invoke-virtual {v10, v0}, Landroid/view/View;->sendAccessibilityEvent(I)V

    return-void

    :pswitch_330
    check-cast v0, Lly7;

    check-cast v10, Landroidx/appcompat/widget/AppCompatImageView;

    iget-boolean v1, v0, Lly7;->h:Z

    xor-int/2addr v1, v8

    iput-boolean v1, v0, Lly7;->h:Z

    invoke-virtual {v0}, Lly7;->H0()V

    iget-object v1, v0, Lly7;->f:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Lly7;->n0()I

    move-result v2

    sub-int/2addr v2, v8

    invoke-virtual {v1, v8, v2}, Landroid/view/ViewGroup;->removeViews(II)V

    invoke-virtual {v0}, Ln1;->K()V

    iget-object v0, v0, Lly7;->c:Landroid/content/Context;

    const v1, 0x7f140677

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/view/View;->announceForAccessibility(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_356
    check-cast v0, Lg77;

    check-cast v10, Lo0a;

    iget-object v0, v0, Lg77;->a:Ljava/lang/Object;

    check-cast v0, Lm0a;

    iget-object v1, v0, Lm0a;->d:Ljava/util/Set;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    invoke-interface {v1, v10}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37c

    iput-object v1, v0, Lm0a;->d:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_379

    iget-object v1, v0, Lm0a;->a:Ltah;

    invoke-virtual {v1}, Ltah;->k()V

    :cond_379
    invoke-virtual {v0}, Lm0a;->b()V

    :cond_37c
    return-void

    :pswitch_37d
    check-cast v0, Lua7;

    check-cast v10, Lmu7;

    iget-object v1, v10, Lmu7;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lua7;->L(Ljava/lang/String;)V

    return-void

    :pswitch_387
    check-cast v0, Lju7;

    check-cast v10, Lfu7;

    iget-object v0, v0, Lju7;->c:Lx77;

    iget-object v1, v10, Lfu7;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lx77;->m(Ljava/lang/String;)V

    return-void

    :pswitch_393
    check-cast v0, Lx77;

    check-cast v10, Leu7;

    iget-object v1, v10, Leu7;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lx77;->m(Ljava/lang/String;)V

    return-void

    :pswitch_39d
    check-cast v0, Lq2;

    check-cast v10, Lwt7;

    invoke-virtual {v0}, Lq2;->invoke()Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lz5i;->r0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3b6

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lz5i;->v0(Landroid/content/Context;)V

    goto :goto_3bf

    :cond_3b6
    new-instance v0, Lxw;

    const/4 v2, 0x6

    invoke-direct {v0, v2, v1, v10, v9}, Lxw;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, v1}, Lo73;->p(Landroid/view/View;)V

    :goto_3bf
    return-void

    :pswitch_3c0
    check-cast v0, Lcom/opera/hype/image/editor/EditImage;

    check-cast v10, Lba3;

    iget-object v1, v0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-static {v1, v10}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3d2

    iget-object v1, v0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    invoke-virtual {v1, v10}, Ldya;->c(Lfya;)V

    goto :goto_3d5

    :cond_3d2
    invoke-virtual {v0, v10}, Lcom/opera/hype/image/editor/EditImage;->h(Lba3;)V

    :goto_3d5
    iget-object v0, v0, Lcom/opera/hype/image/editor/EditImage;->e:Lywl;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x3

    const/4 v6, 0x0

    move-wide v3, v1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lywl;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    return-void

    :pswitch_3ee
    check-cast v0, Lcom/opera/android/BrowserActivity;

    check-cast v10, Lre7;

    const/16 v1, 0x1003

    invoke-virtual {v0, v10, v1}, Lcom/opera/android/BrowserActivity;->u1(Lre7;I)V

    return-void

    :pswitch_data_3f8
    .packed-switch 0x0
        :pswitch_3ee
        :pswitch_3c0
        :pswitch_39d
        :pswitch_393
        :pswitch_387
        :pswitch_37d
        :pswitch_356
        :pswitch_330
        :pswitch_2b3
        :pswitch_275
        :pswitch_25a
        :pswitch_249
        :pswitch_210
        :pswitch_1dd
        :pswitch_1af
        :pswitch_1a5
        :pswitch_19d
        :pswitch_18a
        :pswitch_159
        :pswitch_115
        :pswitch_fa
        :pswitch_ed
        :pswitch_dc
        :pswitch_d0
        :pswitch_c4
        :pswitch_5d
        :pswitch_50
        :pswitch_3d
        :pswitch_28
    .end packed-switch
.end method
