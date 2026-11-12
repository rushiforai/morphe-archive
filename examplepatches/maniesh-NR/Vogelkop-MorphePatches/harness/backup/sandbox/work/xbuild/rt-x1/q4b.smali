.class public final synthetic Lq4b;
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

    iput-byte p2, p0, Lq4b;->a:B

    iput-object p1, p0, Lq4b;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lq4b;->a:B

    const-string v1, "input_method"

    const/4 v2, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object p0, p0, Lq4b;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_352

    check-cast p0, Lw6e;

    iget-object p0, p0, Lw6e;->e:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    check-cast p0, Lq6e;

    iget-object p0, p0, Lq6e;->c:Lwzg;

    return-object p0

    :pswitch_1c
    check-cast p0, Lj3i;

    invoke-virtual {p0}, Lj3i;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    return-object p0

    :pswitch_25
    check-cast p0, Lv5e;

    iget-object p0, p0, Lv5e;->b:Landroid/content/Context;

    const-string v0, "com.android.vending"

    invoke-static {p0}, Lr9n;->l(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_38
    check-cast p0, Lv1e;

    :try_start_3a
    sget-object v0, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lv1e;->l:Lkotlinx/serialization/json/b;

    if-eqz p0, :cond_6a

    invoke-static {p0}, Lqqb;->h(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/c;

    move-result-object p0

    const-string v0, "midnightShift"

    invoke-virtual {p0, v0}, Lkotlinx/serialization/json/c;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/json/b;

    if-eqz p0, :cond_6a

    invoke-static {p0}, Lqqb;->i(Lkotlinx/serialization/json/b;)Lkotlinx/serialization/json/d;

    move-result-object p0

    invoke-static {p0}, Lqqb;->f(Lkotlinx/serialization/json/d;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_6a

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-ltz v0, :cond_63

    const/16 v1, 0x18

    if-ge v0, v1, :cond_63

    move-object v4, p0

    :cond_63
    if-eqz v4, :cond_6a

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_6b

    :cond_6a
    move p0, v2

    :goto_6b
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_6f
    .catchall {:try_start_3a .. :try_end_6f} :catchall_70

    goto :goto_7a

    :catchall_70
    move-exception v0

    move-object p0, v0

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_7a
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_84

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    :cond_84
    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_8f
    check-cast p0, Ld0e;

    invoke-virtual {p0}, Ld0e;->X()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_97
    check-cast p0, Lacd;

    iget-object v0, p0, Lacd;->s:Lq0g;

    invoke-virtual {v0}, Lq0g;->h()I

    move-result v1

    iget-object v2, p0, Lacd;->t:Lq0g;

    invoke-virtual {v2}, Lq0g;->h()I

    move-result v2

    if-le v1, v2, :cond_c0

    iget-object v1, p0, Lacd;->y:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lybd;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lq0g;->h()I

    move-result v0

    invoke-virtual {p0}, Lacd;->T0()I

    move-result p0

    add-int/2addr p0, v0

    int-to-float p0, p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    :cond_c0
    return-object v4

    :pswitch_c1
    move-object v7, p0

    check-cast v7, Li8d;

    invoke-virtual {v7}, Li8d;->o0()La9d;

    move-result-object p0

    new-instance v5, Lci7;

    const/4 v11, 0x0

    const/16 v12, 0x1c

    const/4 v6, 0x1

    const-class v8, Li8d;

    const-string v9, "launchIntent"

    const-string v10, "launchIntent(Landroid/content/Intent;)V"

    invoke-direct/range {v5 .. v12}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v0, p0, La9d;->h:Lorm;

    sget-object v1, Lvt0;->f:Lvt0;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v1}, Lx5f;->Q0(Lvt0;)V

    invoke-virtual {p0}, La9d;->Q()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.opera.browser.beta"

    invoke-static {p0, v0}, Lp12;->g(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v5, p0}, Lci7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f0
    check-cast p0, Ldka;

    new-instance v0, Lsw7;

    invoke-direct {v0, v4}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Ldka;->n(Ltw7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_fd
    check-cast p0, Ldka;

    new-instance v0, Lsw7;

    invoke-direct {v0, v4}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Ldka;->n(Ltw7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10a
    check-cast p0, Lpqc;

    iget-object p0, p0, Lpqc;->c:Let3;

    iget-object p0, p0, Let3;->b:Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->W:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsnc;

    iget-object p0, p0, Lsnc;->l:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrnc;

    return-object p0

    :pswitch_123
    check-cast p0, Laqc;

    iget-object v0, p0, Laqc;->a:Lcq6;

    iget-object v1, v0, Lcq6;->g:Lrlh;

    new-instance v6, Lcw;

    const/16 v7, 0xb

    invoke-direct {v6, v1, p0, v7}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v6}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lvp6;

    const/4 v7, 0x2

    invoke-direct {v6, v0, v4, v7}, Lvp6;-><init>(Lcq6;Lmt5;B)V

    new-instance v8, Lz99;

    invoke-direct {v8, v1, v6, v7}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    new-instance v6, Lxd6;

    invoke-direct {v6, v8, v7}, Lxd6;-><init>(Ljava/lang/Object;B)V

    invoke-static {v6}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v6

    new-instance v8, Lzp6;

    invoke-direct {v8, v5, v4, v0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v6, v8}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object v6

    new-instance v8, Lwp6;

    invoke-direct {v8, v0, v4, v2}, Lwp6;-><init>(Lcq6;Lmt5;B)V

    new-instance v2, Lz99;

    invoke-direct {v2, v8, v6}, Lz99;-><init>(Lkotlin/jvm/functions/Function2;Lf99;)V

    new-instance v6, Lwp6;

    const/4 v8, 0x5

    invoke-direct {v6, v0, v4, v8}, Lwp6;-><init>(Lcq6;Lmt5;B)V

    new-instance v8, Lz99;

    invoke-direct {v8, v2, v6, v7}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    new-instance v2, Luk3;

    invoke-direct {v2, v3, v4, v0}, Luk3;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v0, Lx99;

    invoke-direct {v0, v8, v2, v5}, Lx99;-><init>(Lf99;Lcr9;B)V

    new-instance v2, Luk3;

    const/4 v3, 0x3

    invoke-direct {v2, v3, v4, v3}, Luk3;-><init>(ILmt5;B)V

    new-instance v3, Lya9;

    invoke-direct {v3, v1, v0, v2, v5}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    new-instance v1, Lfb9;

    const/16 v2, 0xc

    invoke-direct {v1, v2, v4, p0}, Lfb9;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance p0, Lz99;

    invoke-direct {p0, v0, v1, v7}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    return-object p0

    :pswitch_18f
    check-cast p0, Lqkc;

    iget-object p0, p0, Lqkc;->n:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move-object v0, v4

    :goto_19a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1be

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v5, 0x1

    if-ltz v5, :cond_1ba

    check-cast v1, Lllc;

    instance-of v3, v1, Lhlc;

    if-nez v3, :cond_1c6

    if-nez v0, :cond_1b8

    instance-of v1, v1, Ljlc;

    if-eqz v1, :cond_1b8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_1b8
    move v5, v2

    goto :goto_19a

    :cond_1ba
    invoke-static {}, Lj95;->n()V

    throw v4

    :cond_1be
    if-eqz v0, :cond_1c5

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_1c6

    :cond_1c5
    const/4 v5, -0x1

    :cond_1c6
    :goto_1c6
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_1cb
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ly83;

    iget-object p0, p0, Ly83;->h:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f04035e

    invoke-static {v0, p0, v5}, Lf03;->w(ILandroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_1e6
    check-cast p0, Ltkc;

    iget-object p0, p0, Ltkc;->i:Ldqc;

    iget-object p0, p0, Ldqc;->d:Ljs6;

    iput-boolean v3, p0, Ljs6;->b:Z

    iget-object v0, p0, Ljs6;->i:Ljava/lang/Object;

    check-cast v0, Ltn;

    iget-object v1, p0, Ljs6;->c:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    new-instance v2, Lhs6;

    invoke-direct {v2, p0, v5}, Lhs6;-><init>(Ljs6;B)V

    sget-object p0, Lhqc;->b:Lhqc;

    invoke-virtual {v0, v1, p0, v2}, Ltn;->D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_203
    check-cast p0, Lcom/opera/android/live_score/LiveCommentaryService;

    const v0, 0x7f0807e1

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_21a

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-static {p0, v0, v1}, Lz5i;->x(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v4

    :cond_21a
    return-object v4

    :pswitch_21b
    check-cast p0, Lsdc;

    iget-object p0, p0, Lsdc;->a:Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lhu3;

    iget-boolean v0, p0, Lhu3;->b:Z

    if-nez v0, :cond_235

    iget-boolean v0, p0, Lhu3;->c:Z

    if-eqz v0, :cond_230

    const-string v0, "ManagedValuesStore tried to enter composition twice. Did you attempt to install the same store multiple times or into two compositions?"

    invoke-static {v0}, Lcpg;->a(Ljava/lang/String;)V

    :cond_230
    invoke-virtual {p0}, Lhu3;->a()V

    iput-boolean v3, p0, Lhu3;->c:Z

    :cond_235
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_238
    check-cast p0, Ltb1;

    const-string v0, "mailto:sw-help@opera.com"

    invoke-virtual {p0, v0}, Ltb1;->a(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_242
    check-cast p0, Lhbc;

    new-instance v0, Landroid/view/inputmethod/BaseInputConnection;

    iget-object p0, p0, Lhbc;->a:Landroid/view/View;

    invoke-direct {v0, p0, v5}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    return-object v0

    :pswitch_24c
    check-cast p0, Ls3c;

    iget-object v0, p0, Ls3c;->g:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_263

    iget-object p0, p0, Ls3c;->c:Lfi5;

    if-eqz p0, :cond_263

    invoke-virtual {p0}, Lfi5;->l()V

    :cond_263
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_266
    check-cast p0, Lm3c;

    iget-object p0, p0, Lm3c;->G:Lq3c;

    iget-object v0, p0, Lq3c;->p:Lsfd;

    iput-boolean v3, v0, Lsfd;->z:Z

    iget-object p0, p0, Lq3c;->q:Lu1d;

    if-eqz p0, :cond_274

    iput-boolean v3, p0, Lu1d;->t:Z

    :cond_274
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_277
    check-cast p0, Lpna;

    new-instance v0, Lgyb;

    invoke-direct {v0, p0}, Lgyb;-><init>(Lpna;)V

    return-object v0

    :pswitch_27f
    check-cast p0, Laam;

    iget-object p0, p0, Laam;->a:Ls15;

    invoke-interface {p0}, Loxb;->findJavaDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object p0

    return-object p0

    :pswitch_288
    check-cast p0, Lpjb;

    iget-object p0, p0, Lpjb;->a:Ly5i;

    invoke-virtual {p0}, Ly5i;->n()Z

    move-result v0

    if-eqz v0, :cond_299

    invoke-virtual {p0}, Ly5i;->r()Z

    move-result p0

    if-nez p0, :cond_299

    move v3, v5

    :cond_299
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_29e
    check-cast p0, Li9c;

    iget-object p0, p0, Li9c;->d:Ljava/lang/Object;

    check-cast p0, Lkw3;

    invoke-virtual {p0}, Lkw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0

    :pswitch_2ab
    check-cast p0, Ltab;

    new-instance v0, Lsab;

    invoke-direct {v0, p0}, Lsab;-><init>(Ltab;)V

    return-object v0

    :pswitch_2b3
    check-cast p0, Lz8b;

    iget-object p0, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    return-object p0

    :pswitch_2c4
    check-cast p0, Lua7;

    iget-object p0, p0, Lua7;->b:Ljava/lang/Object;

    check-cast p0, Lv31;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    return-object p0

    :pswitch_2d5
    check-cast p0, Lnx5;

    invoke-interface {p0}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    invoke-static {p0}, Lmfh;->p(Lkotlin/coroutines/CoroutineContext;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_2e4
    check-cast p0, Ls4b;

    iget-object v0, p0, Ls4b;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d021b

    invoke-virtual {v1, v2, v0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a04e0

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_33f

    const v1, 0x7f0a0514

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_33f

    const v1, 0x7f0a0806

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_33f

    const v1, 0x7f0a0807

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_33f

    move-object v6, v0

    check-cast v6, Landroid/widget/RelativeLayout;

    new-instance v5, La7n;

    iget-object v0, p0, Ls4b;->h:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Lpde;

    iget-object v0, p0, Ls4b;->g:Ljava/lang/Object;

    move-object v10, v0

    check-cast v10, Lgjm;

    iget-object p0, p0, Ls4b;->i:Lk6k;

    check-cast p0, Lo4b;

    iget-object v11, p0, Lk6k;->c:Lpde;

    invoke-direct/range {v5 .. v11}, La7n;-><init>(Landroid/view/ViewGroup;Landroid/widget/TextView;Landroid/widget/TextView;Lpde;Lgjm;Lpde;)V

    move-object v4, v5

    goto :goto_350

    :cond_33f
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_350
    return-object v4

    nop

    :pswitch_data_352
    .packed-switch 0x0
        :pswitch_2e4
        :pswitch_2d5
        :pswitch_2c4
        :pswitch_2b3
        :pswitch_2ab
        :pswitch_29e
        :pswitch_288
        :pswitch_27f
        :pswitch_277
        :pswitch_266
        :pswitch_24c
        :pswitch_242
        :pswitch_238
        :pswitch_21b
        :pswitch_203
        :pswitch_1e6
        :pswitch_1cb
        :pswitch_18f
        :pswitch_123
        :pswitch_10a
        :pswitch_fd
        :pswitch_f0
        :pswitch_c1
        :pswitch_97
        :pswitch_8f
        :pswitch_38
        :pswitch_25
        :pswitch_1c
        :pswitch_17
    .end packed-switch
.end method
