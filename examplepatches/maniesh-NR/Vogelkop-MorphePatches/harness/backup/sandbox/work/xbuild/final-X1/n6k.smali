.class public final synthetic Ln6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lijc;Ls6k;)V
    .registers 3

    const/4 p2, 0x0

    iput-byte p2, p0, Ln6k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln6k;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Ln6k;->a:B

    iput-object p1, p0, Ln6k;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Ln6k;->a:B

    sget-object v2, Lp9k;->a:Lp9k;

    sget-object v3, Ls9k;->a:Ls9k;

    sget-object v4, Lr9k;->a:Lr9k;

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    iget-object v0, v0, Ln6k;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_6fa

    check-cast v0, Ltdl;

    move-object/from16 v1, p1

    check-cast v1, Lwa1;

    iget-wide v2, v0, Ltdl;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Lwa1;->x(ILjava/lang/Long;)V

    iget-object v2, v0, Ltdl;->b:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Ltdl;->c:Ljava/lang/String;

    invoke-interface {v1, v7, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-object v2, v0, Ltdl;->d:Ljava/lang/String;

    invoke-interface {v1, v6, v2}, Lwa1;->w(ILjava/lang/String;)V

    iget-wide v2, v0, Ltdl;->e:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v5, v0}, Lwa1;->x(ILjava/lang/Long;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3f
    check-cast v0, Lgal;

    move-object/from16 v1, p1

    check-cast v1, Lpg;

    invoke-virtual {v0}, Lgal;->e()V

    invoke-virtual {v0}, Lgal;->d()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4e
    check-cast v0, Lt9l;

    move-object/from16 v1, p1

    check-cast v1, Lpg;

    invoke-virtual {v0}, Lt9l;->f()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5a
    check-cast v0, Lt8l;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Float;

    iget-object v1, v0, Lt8l;->c:Lpde;

    invoke-virtual {v0}, Lt8l;->a()Lq8l;

    move-result-object v0

    invoke-static {v1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6c
    check-cast v0, Ltmi;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v2, v1, Lt0i;->a:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7a
    check-cast v0, Ld7k;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_87

    move-object v10, v1

    :cond_87
    invoke-virtual {v0, v10}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8d
    check-cast v0, Ld7k;

    move-object/from16 v1, p1

    check-cast v1, Lt0i;

    iget-object v1, v1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v1, Lq0i;

    if-nez v2, :cond_9a

    move-object v10, v1

    :cond_9a
    invoke-virtual {v0, v10}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a0
    check-cast v0, Lyhe;

    move-object/from16 v1, p1

    check-cast v1, Landroidx/recyclerview/widget/i;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_e6

    instance-of v2, v1, Lh5l;

    if-eqz v2, :cond_d2

    new-instance v10, Lszd;

    move-object v2, v1

    check-cast v2, Lh5l;

    invoke-virtual {v2}, Lh5l;->X()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb2l;

    if-eqz v2, :cond_ca

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getId()I

    move-result v3

    :cond_ca
    invoke-virtual {v0, v1}, Lyhe;->o(Landroidx/recyclerview/widget/i;)F

    move-result v0

    invoke-direct {v10, v3, v0}, Lszd;-><init>(IF)V

    goto :goto_e6

    :cond_d2
    instance-of v2, v1, Lh85;

    if-eqz v2, :cond_e6

    move-object v2, v1

    check-cast v2, Lh85;

    iget-object v2, v2, Lh85;->i:Lg2l;

    iget v2, v2, Lg2l;->b:I

    new-instance v10, Lrzd;

    invoke-virtual {v0, v1}, Lyhe;->o(Landroidx/recyclerview/widget/i;)F

    move-result v0

    invoke-direct {v10, v2, v0}, Lrzd;-><init>(IF)V

    :cond_e6
    :goto_e6
    return-object v10

    :pswitch_e7
    check-cast v0, La5l;

    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    invoke-virtual {v0}, La5l;->a()Le58;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-wide v10, La5l;->k:J

    invoke-static {v10, v11}, Lpn7;->f(J)J

    move-result-wide v10

    sub-long/2addr v2, v10

    iget-object v1, v1, Le58;->a:Ly5i;

    new-instance v4, Lx41;

    invoke-direct {v4, v2, v3, v5}, Lx41;-><init>(JB)V

    invoke-static {v1, v9, v8, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0}, La5l;->a()Le58;

    move-result-object v0

    iget-object v2, v0, Le58;->a:Ly5i;

    new-instance v3, Lry7;

    invoke-direct {v3, v0, v1, v7}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v8, v9, v3}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_11a
    check-cast v0, Lvvf;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_126
    check-cast v0, Lhda;

    move-object/from16 v1, p1

    check-cast v1, Lz4l;

    iget v2, v1, Lz4l;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v1, v1, Lz4l;->b:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lhda;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_13e
    check-cast v0, Lcom/opera/android/custom_views/TabCountButton;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    sget v2, Lcom/opera/android/custom_views/TabCountButton;->l:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-object v10

    :pswitch_14e
    check-cast v0, Luxk;

    move-object/from16 v1, p1

    check-cast v1, Lcyk;

    sget-object v2, Luxk;->w:[Lxtb;

    sget-object v2, Layk;->a:Layk;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const v3, 0x7f08042e

    if-eqz v2, :cond_169

    iget-object v0, v0, Luxk;->v:Landroid/widget/ImageView;

    if-eqz v0, :cond_19a

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_19a

    :cond_169
    instance-of v2, v1, Lbyk;

    if-eqz v2, :cond_19d

    check-cast v1, Lbyk;

    iget-object v2, v1, Lbyk;->a:Ljava/lang/String;

    iget-object v1, v1, Lbyk;->c:Landroid/graphics/drawable/Drawable;

    iget-object v4, v0, Luxk;->v:Landroid/widget/ImageView;

    if-eqz v1, :cond_17d

    if-eqz v4, :cond_182

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_182

    :cond_17d
    if-eqz v4, :cond_182

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_182
    :goto_182
    if-eqz v2, :cond_19a

    invoke-virtual {v0}, Luxk;->H0()Lwm9;

    move-result-object v1

    iget-object v1, v1, Lwm9;->i:Llwk;

    iget-object v1, v1, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    const v3, 0x7f141217

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a(Ljava/lang/String;)V

    :cond_19a
    :goto_19a
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1a0

    :cond_19d
    invoke-static {}, Lh9o;->p()V

    :goto_1a0
    return-object v10

    :pswitch_1a1
    check-cast v0, Lqwk;

    move-object/from16 v1, p1

    check-cast v1, Lswk;

    iget-object v1, v0, Lqwk;->i:Lzwk;

    iget-object v2, v0, Lqwk;->j:Lswk;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->f()Z

    move-result v1

    if-eqz v1, :cond_1c9

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "passphrase.dismiss.time"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v3, "passphrase.dismiss.count"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1c9
    iget-object v0, v0, Lqwk;->n:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "password.first.show"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1ec

    invoke-virtual {v2}, Lswk;->a()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v4, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1ec
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ef
    check-cast v0, Lkotlin/jvm/functions/Function2;

    sget-object v1, La26;->e:Lj8m;

    move-object/from16 v2, p1

    check-cast v2, Lve1;

    iget-object v3, v2, Lve1;->e:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    iget-object v1, v1, Lj8m;->b:Lkotlin/jvm/functions/Function1;

    iget-object v2, v2, Lve1;->f:Lif1;

    invoke-interface {v1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_20b
    check-cast v0, Lyrk;

    move-object/from16 v1, p1

    check-cast v1, Lpkj;

    sget-object v2, Lpkj;->a:Lpkj;

    if-ne v1, v2, :cond_224

    iget-object v1, v0, Lyrk;->c:Lojn;

    invoke-virtual {v1}, Lojn;->a()V

    iget-object v0, v0, Lyrk;->b:Lgjm;

    new-instance v1, Lwrk;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1}, Lgjm;->b(Ln37;)Z

    :cond_224
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_227
    check-cast v0, Lrrk;

    move-object/from16 v1, p1

    check-cast v1, Lsrk;

    sget-object v2, Lsrk;->a:Lsrk;

    if-ne v1, v2, :cond_240

    iget-object v1, v0, Lrrk;->c:Lojn;

    invoke-virtual {v1}, Lojn;->a()V

    iget-object v0, v0, Lrrk;->b:Lgjm;

    new-instance v1, Lwrk;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1}, Lgjm;->b(Ln37;)Z

    :cond_240
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_243
    check-cast v0, Lc1f;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lc1f;->e:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_255

    const/16 v8, 0x8

    :cond_255
    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_25b
    check-cast v0, Lslk;

    move-object/from16 v1, p1

    check-cast v1, Lh0d;

    iget-boolean v1, v0, Lslk;->l:Z

    iput-boolean v9, v0, Lslk;->l:Z

    if-eqz v1, :cond_2ac

    iget-object v1, v0, Lslk;->b:Ltmk;

    iget-object v1, v1, Ltmk;->a:Lmcj;

    iget-object v2, v1, Lmcj;->a:Ljava/lang/Object;

    check-cast v2, Lb59;

    const-wide/16 v3, -0x1

    invoke-virtual {v1, v3, v4}, Lmcj;->p(J)V

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "last_response"

    invoke-interface {v5, v6, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "info_data"

    invoke-interface {v2, v3, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_29b

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2a0

    :cond_29b
    const-string v2, ""

    invoke-virtual {v1, v2}, Lmcj;->n(Ljava/lang/String;)V

    :cond_2a0
    invoke-virtual {v1, v8}, Lmcj;->o(Z)V

    iget-object v1, v0, Lslk;->k:Ld3k;

    if-eqz v1, :cond_2ac

    invoke-virtual {v1, v10}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    iput-object v10, v0, Lslk;->k:Ld3k;

    :cond_2ac
    iget-object v0, v0, Lslk;->a:Lm59;

    iget-object v1, v0, Lm59;->e:Ljava/lang/Object;

    check-cast v1, Loml;

    if-eqz v1, :cond_2b9

    invoke-virtual {v1, v8}, Loml;->cancel(Z)Z

    iput-object v10, v0, Lm59;->e:Ljava/lang/Object;

    :cond_2b9
    invoke-virtual {v0}, Lm59;->i()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2bf
    check-cast v0, Lev7;

    move-object/from16 v1, p1

    check-cast v1, Lsck;

    iget-object v2, v0, Lev7;->f:Ljava/lang/Object;

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v1, Lsck;->b:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4ff

    iget-object v4, v0, Lev7;->g:Ljava/lang/Object;

    check-cast v4, Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leyj;

    iget-object v4, v4, Leyj;->i:Lj7h;

    instance-of v5, v4, Lwxj;

    sget-object v11, Lyxj;->b:Lyxj;

    if-nez v5, :cond_305

    instance-of v5, v4, Lxxj;

    if-eqz v5, :cond_2fb

    invoke-virtual {v2}, Landroid/view/View;->getLayoutDirection()I

    move-result v4

    if-ne v4, v9, :cond_2f6

    iget v3, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    if-le v3, v2, :cond_4ff

    goto :goto_305

    :cond_2f6
    iget v2, v3, Landroid/graphics/Rect;->left:I

    if-gez v2, :cond_4ff

    goto :goto_305

    :cond_2fb
    invoke-static {v4, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_508

    iget v2, v3, Landroid/graphics/Rect;->top:I

    if-gez v2, :cond_4ff

    :cond_305
    :goto_305
    iget-object v2, v0, Lev7;->o:Ljava/lang/Object;

    check-cast v2, Lwck;

    iget-object v3, v0, Lev7;->l:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashMap;

    iget v4, v1, Lsck;->a:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Luck;

    if-nez v5, :cond_3da

    iget-object v5, v0, Lev7;->h:Ljava/lang/Object;

    check-cast v5, Lpde;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb3c;

    iget-object v12, v0, Lev7;->m:Ljava/lang/Object;

    check-cast v12, Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_331

    move-object v12, v10

    goto :goto_335

    :cond_331
    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v12

    :goto_335
    check-cast v12, Luck;

    if-eqz v12, :cond_33c

    :goto_339
    move-object v5, v12

    goto/16 :goto_3bc

    :cond_33c
    new-instance v12, Luck;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v13

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_37b

    if-eq v5, v9, :cond_37b

    if-eq v5, v7, :cond_37b

    if-ne v5, v6, :cond_376

    invoke-static {v13, v2}, Lq5g;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lq5g;

    move-result-object v5

    new-instance v13, Ln4l;

    iget-object v6, v5, Lq5g;->b:Landroid/view/ViewGroup;

    move-object v14, v6

    check-cast v14, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v6, v5, Lq5g;->c:Ljava/lang/Object;

    move-object v15, v6

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v5, v5, Lq5g;->d:Ljava/lang/Object;

    move-object/from16 v17, v5

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/16 v20, 0x0

    sget-object v21, Ll08;->a:Ll08;

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-direct/range {v13 .. v21}, Ln4l;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Ljava/util/List;)V

    goto :goto_3b7

    :cond_376
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_50b

    :cond_37b
    const v5, 0x7f0d03fa

    invoke-virtual {v13, v5, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    invoke-static {v5}, Lpt1;->c(Landroid/view/View;)Lpt1;

    move-result-object v5

    new-instance v13, Ln4l;

    iget-object v6, v5, Lpt1;->d:Ljava/lang/Object;

    move-object v14, v6

    check-cast v14, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v6, v5, Lpt1;->f:Ljava/lang/Object;

    move-object v15, v6

    check-cast v15, Landroid/widget/TextView;

    iget-object v6, v5, Lpt1;->b:Landroid/view/View;

    check-cast v6, Landroid/widget/TextView;

    iget-object v7, v5, Lpt1;->c:Landroid/view/View;

    move-object/from16 v18, v7

    check-cast v18, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v7, v5, Lpt1;->e:Ljava/lang/Object;

    move-object/from16 v19, v7

    check-cast v19, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v5, v5, Lpt1;->g:Landroid/view/View;

    move-object/from16 v20, v5

    check-cast v20, Lcom/opera/android/custom_views/StylingImageButton;

    filled-new-array {v6, v15}, [Landroid/widget/TextView;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v21

    move-object/from16 v16, v15

    move-object/from16 v17, v6

    invoke-direct/range {v13 .. v21}, Ln4l;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Ljava/util/List;)V

    :goto_3b7
    invoke-direct {v12, v0, v13}, Luck;-><init>(Lev7;Ln4l;)V

    goto/16 :goto_339

    :goto_3bc
    iput-object v1, v5, Luck;->b:Lsck;

    iget-object v0, v5, Luck;->c:Ld5a;

    iget v1, v0, Ld5a;->a:I

    if-eq v4, v1, :cond_3c9

    iput v4, v0, Ld5a;->a:I

    invoke-virtual {v0}, Ld5a;->b()V

    :cond_3c9
    invoke-virtual {v5}, Luck;->a()V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v3, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v5, Luck;->a:Ln4l;

    iget-object v0, v0, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_3da
    iget-object v0, v5, Luck;->a:Ln4l;

    iget-object v0, v0, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lvck;

    iget-object v2, v5, Luck;->d:Lev7;

    iget-object v3, v2, Lev7;->g:Ljava/lang/Object;

    check-cast v3, Lpde;

    iget-object v4, v2, Lev7;->f:Ljava/lang/Object;

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leyj;

    iget-object v3, v3, Leyj;->i:Lj7h;

    invoke-virtual {v3}, Lj7h;->h()Lixh;

    move-result-object v6

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v6, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v6

    instance-of v7, v3, Lwxj;

    if-eqz v7, :cond_42c

    iget-object v12, v5, Luck;->b:Lsck;

    iget-object v12, v12, Lsck;->b:Landroid/graphics/Rect;

    iget v13, v12, Landroid/graphics/Rect;->left:I

    if-gez v13, :cond_40f

    move v13, v8

    :cond_40f
    iget v12, v12, Landroid/graphics/Rect;->right:I

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v14

    if-le v12, v14, :cond_418

    move v12, v14

    :cond_418
    sub-int/2addr v12, v13

    move-object v13, v3

    check-cast v13, Lwxj;

    iget v13, v13, Lwxj;->b:I

    if-ge v12, v13, :cond_421

    move v12, v13

    :cond_421
    iget-object v13, v5, Luck;->b:Lsck;

    iget-object v13, v13, Lsck;->b:Landroid/graphics/Rect;

    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v13

    if-le v13, v12, :cond_44a

    goto :goto_44b

    :cond_42c
    instance-of v12, v3, Lxxj;

    if-eqz v12, :cond_436

    move-object v12, v3

    check-cast v12, Lxxj;

    iget v12, v12, Lxxj;->c:I

    goto :goto_44b

    :cond_436
    invoke-virtual {v3, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4fb

    iget-object v12, v5, Luck;->b:Lsck;

    iget-object v12, v12, Lsck;->b:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v12

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v13

    if-le v12, v13, :cond_44b

    :cond_44a
    move v12, v13

    :cond_44b
    :goto_44b
    if-eqz v7, :cond_450

    iget v7, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_462

    :cond_450
    instance-of v7, v3, Lxxj;

    if-eqz v7, :cond_45a

    move-object v7, v3

    check-cast v7, Lxxj;

    iget v7, v7, Lxxj;->d:I

    goto :goto_462

    :cond_45a
    invoke-virtual {v3, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4f7

    iget v7, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    :goto_462
    invoke-virtual {v4}, Landroid/view/View;->getLayoutDirection()I

    move-result v10

    iget-object v11, v5, Luck;->b:Lsck;

    if-ne v10, v9, :cond_470

    iget-object v9, v11, Lsck;->b:Landroid/graphics/Rect;

    iget v10, v9, Landroid/graphics/Rect;->right:I

    sub-int/2addr v10, v12

    goto :goto_474

    :cond_470
    iget-object v9, v11, Lsck;->b:Landroid/graphics/Rect;

    iget v10, v9, Landroid/graphics/Rect;->left:I

    :goto_474
    iget v9, v9, Landroid/graphics/Rect;->right:I

    sub-int/2addr v9, v12

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v11

    sub-int/2addr v11, v12

    iget-object v13, v5, Luck;->b:Lsck;

    iget-object v13, v13, Lsck;->b:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->left:I

    invoke-static {v11, v13}, Ljava/lang/Math;->max(II)I

    move-result v11

    if-ge v9, v11, :cond_491

    invoke-static {v10, v9, v11}, Ldjh;->c(III)I

    move-result v9

    goto :goto_492

    :cond_491
    move v9, v8

    :goto_492
    iget-object v10, v5, Luck;->b:Lsck;

    iget-object v10, v10, Lsck;->b:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v10, v7

    sub-int/2addr v10, v6

    invoke-static {v8, v10}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    sub-int/2addr v4, v7

    iget-object v10, v5, Luck;->b:Lsck;

    iget-object v10, v10, Lsck;->b:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    if-ge v6, v4, :cond_4ba

    iget-object v10, v5, Luck;->b:Lsck;

    iget-object v10, v10, Lsck;->b:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->top:I

    invoke-static {v10, v6, v4}, Ldjh;->c(III)I

    move-result v4

    goto :goto_4bb

    :cond_4ba
    move v4, v8

    :goto_4bb
    iget v6, v1, Lvck;->a:I

    sub-int v6, v9, v6

    iget v10, v1, Lvck;->b:I

    sub-int v10, v4, v10

    if-nez v6, :cond_4cf

    if-nez v10, :cond_4cf

    iget v6, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v12, v6, :cond_4cf

    iget v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v7, v6, :cond_4da

    :cond_4cf
    iput v9, v1, Lvck;->a:I

    iput v4, v1, Lvck;->b:I

    iput v12, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v7, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4da
    invoke-virtual {v3}, Lj7h;->g()Z

    move-result v1

    iget-object v3, v5, Luck;->b:Lsck;

    if-eqz v1, :cond_4f1

    iget v1, v3, Lsck;->c:F

    iget-object v2, v2, Lev7;->i:Ljava/lang/Object;

    check-cast v2, Lxh7;

    invoke-virtual {v2}, Lxh7;->b()F

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, v2

    mul-float/2addr v3, v1

    goto :goto_4f3

    :cond_4f1
    iget v3, v3, Lsck;->c:F

    :goto_4f3
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    goto :goto_503

    :cond_4f7
    invoke-static {}, Lh9o;->p()V

    goto :goto_50b

    :cond_4fb
    invoke-static {}, Lh9o;->p()V

    goto :goto_50b

    :cond_4ff
    invoke-virtual {v0, v1}, Lev7;->i(Lsck;)V

    move v8, v9

    :goto_503
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    goto :goto_50b

    :cond_508
    invoke-static {}, Lh9o;->p()V

    :goto_50b
    return-object v10

    :pswitch_50c
    check-cast v0, Lo9k;

    move-object/from16 v1, p1

    check-cast v1, Lt9k;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_542

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_522

    invoke-virtual {v0}, Lo9k;->i0()V

    goto :goto_542

    :cond_522
    instance-of v3, v1, Lq9k;

    if-eqz v3, :cond_538

    check-cast v1, Lq9k;

    iget v1, v1, Lq9k;->a:I

    iget-boolean v2, v0, Lo9k;->m:Z

    if-nez v2, :cond_542

    iput-boolean v9, v0, Lo9k;->m:Z

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-static {v0, v1}, Lkfo;->d0(Landroid/app/Activity;I)V

    goto :goto_542

    :cond_538
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_542

    invoke-static {}, Lh9o;->p()V

    goto :goto_544

    :cond_542
    :goto_542
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_544
    return-object v10

    :pswitch_545
    check-cast v0, Lm9k;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lm9k;->e:Ljze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_59d

    iget-object v2, v0, Lm9k;->c:Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    instance-of v3, v2, Ljava/util/Collection;

    if-eqz v3, :cond_56d

    move-object v3, v2

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_58e

    :cond_56d
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_571
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_58e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lk9k;

    invoke-interface {v3}, Lk9k;->a()Lize;

    move-result-object v3

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_571

    goto :goto_59d

    :cond_58e
    sget-object v2, Ll9k;->b:Ll9k;

    iget-object v3, v0, Lm9k;->d:Ll9k;

    sget-object v4, Ll9k;->a:Ll9k;

    if-ne v3, v4, :cond_598

    iput-object v2, v0, Lm9k;->d:Ll9k;

    :cond_598
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljze;->r(Ljava/lang/Object;)V

    :cond_59d
    :goto_59d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5a0
    check-cast v0, Lj9k;

    move-object/from16 v1, p1

    check-cast v1, Lak5;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_5b6

    if-eq v1, v9, :cond_5b9

    if-eq v1, v7, :cond_5b9

    if-eq v1, v6, :cond_5b9

    invoke-static {}, Lh9o;->p()V

    goto :goto_5bb

    :cond_5b6
    invoke-virtual {v0}, Lj9k;->c()V

    :cond_5b9
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5bb
    return-object v10

    :pswitch_5bc
    check-cast v0, Ly8k;

    move-object/from16 v1, p1

    check-cast v1, Lt9k;

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5ee

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5ee

    instance-of v3, v1, Lq9k;

    if-eqz v3, :cond_5e4

    check-cast v1, Lq9k;

    iget v1, v1, Lq9k;->a:I

    iget-boolean v2, v0, Ly8k;->e:Z

    if-nez v2, :cond_5ee

    iput-boolean v9, v0, Ly8k;->e:Z

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-static {v0, v1}, Lkfo;->d0(Landroid/app/Activity;I)V

    goto :goto_5ee

    :cond_5e4
    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5ee

    invoke-static {}, Lh9o;->p()V

    goto :goto_5f0

    :cond_5ee
    :goto_5ee
    sget-object v10, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5f0
    return-object v10

    :pswitch_5f1
    check-cast v0, Lu8k;

    move-object/from16 v1, p1

    check-cast v1, Lt8k;

    iget-object v0, v0, Lu8k;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "speed_dial.shape"

    invoke-virtual {v0, v9, v2}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    const-string v2, "enable_search_shortcuts"

    iget-boolean v1, v1, Lt8k;->f:Z

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->R(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_60b
    check-cast v0, Lk8k;

    move-object/from16 v1, p1

    check-cast v1, Lkl5;

    invoke-virtual {v0}, Lu5k;->A()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_617
    check-cast v0, Lc8k;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    if-eqz v1, :cond_63a

    iget-object v0, v0, Lc8k;->f:Lxln;

    sget-object v2, Lwln;->b:Lwln;

    iget-object v0, v0, Lxln;->b:Lgjm;

    new-instance v3, Ldmn;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v9, Lcmn;

    const/4 v12, 0x0

    const/4 v13, 0x5

    const/4 v10, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v9 .. v14}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-direct {v3, v2, v9}, Ldmn;-><init>(Lwln;Lcmn;)V

    invoke-virtual {v0, v3, v8}, Lgjm;->e(Ln37;Z)V

    :cond_63a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_63d
    check-cast v0, Lx7k;

    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    sget-object v2, Lw7k;->a:[Lw7k;

    const v2, 0x7f0a0a1b

    const v3, 0x7f0a0ccf

    filled-new-array {v2, v3}, [I

    move-result-object v4

    const/4 v5, 0x0

    const/16 v6, 0x30

    const/4 v2, 0x1

    const v3, 0x7f14145c

    invoke-static/range {v1 .. v6}, Ln6j;->d(Ln6j;II[ILjava/util/List;I)V

    iget-object v2, v0, Lx7k;->f:Lqte;

    iget-char v2, v2, Lv6j;->a:C

    invoke-virtual {v1, v2}, Ln6j;->a(I)V

    const/4 v6, 0x0

    const/16 v7, 0x30

    const/4 v2, 0x3

    const v3, 0x7f140fd2

    const v4, 0x7f0a0a01

    const v5, 0x7f08056a

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x4

    const v3, 0x7f140f0c

    const v4, 0x7f0a09c0

    const v5, 0x7f080550

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x5

    const v3, 0x7f140946

    const v4, 0x7f0a09d7

    const v5, 0x7f08057d

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0xb

    const v3, 0x7f1404cf

    const v4, 0x7f0a09b4

    const v5, 0x7f080502

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0xd

    const v3, 0x7f14110f

    const v4, 0x7f0a09f0

    const v5, 0x7f0804eb

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0xe

    const v3, 0x7f140f02

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    iget-object v0, v0, Lx7k;->g:Lqte;

    iget-char v0, v0, Lv6j;->a:C

    invoke-virtual {v1, v0}, Ln6j;->a(I)V

    const/16 v2, 0x8

    const v3, 0x7f141107

    const v4, 0x7f0a09b6

    const v5, 0x7f08061c

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0x9

    const v3, 0x7f141042

    const v4, 0x7f0a09e4

    const v5, 0x7f0804d3

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0xa

    const v3, 0x7f141463

    const v4, 0x7f0a0a1d

    const v5, 0x7f080638

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6e2
    check-cast v0, Lr6k;

    move-object/from16 v1, p1

    check-cast v1, Lv6k;

    invoke-virtual {v0, v1}, Lr6k;->b0(Lv6k;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6ee
    check-cast v0, Lijc;

    move-object/from16 v1, p1

    check-cast v1, Lv6k;

    invoke-virtual {v0}, Lijc;->h()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_6fa
    .packed-switch 0x0
        :pswitch_6ee
        :pswitch_6e2
        :pswitch_63d
        :pswitch_617
        :pswitch_60b
        :pswitch_5f1
        :pswitch_5bc
        :pswitch_5a0
        :pswitch_545
        :pswitch_50c
        :pswitch_2bf
        :pswitch_25b
        :pswitch_243
        :pswitch_227
        :pswitch_20b
        :pswitch_1ef
        :pswitch_1a1
        :pswitch_14e
        :pswitch_13e
        :pswitch_126
        :pswitch_11a
        :pswitch_e7
        :pswitch_a0
        :pswitch_8d
        :pswitch_7a
        :pswitch_6c
        :pswitch_5a
        :pswitch_4e
        :pswitch_3f
    .end packed-switch
.end method
