.class public final synthetic Lj3i;
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

    iput-byte p2, p0, Lj3i;->a:B

    iput-object p1, p0, Lj3i;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lj3i;->a:B

    const-string v1, "https"

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object p0, p0, Lj3i;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28c

    check-cast p0, Lvmj;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iget-object p0, p0, Lvmj;->c:Loa5;

    iget p0, p0, Loa5;->b:I

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    return-object v0

    :pswitch_1b
    check-cast p0, Lkw3;

    invoke-virtual {p0}, Lkw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :pswitch_24
    check-cast p0, Lt1;

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_39

    const-string p0, "composer-cms.opera-api.com"

    :cond_39
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :pswitch_42
    check-cast p0, Lt1;

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lt1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_57

    const-string p0, "composer.opera-api.com"

    :cond_57
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :pswitch_60
    check-cast p0, Lpej;

    iget-object p0, p0, Lpej;->c:Lh49;

    return-object p0

    :pswitch_65
    check-cast p0, Lsc;

    invoke-virtual {p0}, Lsc;->j()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lsc;->a:Ljava/lang/Object;

    check-cast p0, Ly5i;

    invoke-virtual {p0}, Ly5i;->a()V

    invoke-virtual {p0}, Ly5i;->b()V

    invoke-virtual {p0}, Ly5i;->i()Lqsk;

    move-result-object p0

    invoke-interface {p0}, Lqsk;->getWritableDatabase()Lto9;

    move-result-object p0

    invoke-virtual {p0, v0}, Lto9;->l(Ljava/lang/String;)Lap9;

    move-result-object p0

    return-object p0

    :pswitch_82
    check-cast p0, Lgcj;

    sget-object v0, Lgcj;->y:Landroid/graphics/Bitmap$CompressFormat;

    iget-object p0, p0, Lgcj;->v:Lysj;

    const v0, 0x7f14085a

    const/16 v1, 0x9c4

    invoke-static {v0, v1, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object v0

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_99
    check-cast p0, Liaj;

    iget-object v0, p0, Liaj;->c:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbpj;

    iget-wide v1, v1, Lbpj;->a:J

    const-wide v5, 0x7fc000007fc00000L    # 2.247117487993712E307

    cmp-long v1, v1, v5

    if-eqz v1, :cond_ca

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbpj;

    iget-wide v1, v1, Lbpj;->a:J

    invoke-static {v1, v2}, Lbpj;->e(J)Z

    move-result v1

    if-nez v1, :cond_ca

    iget-object p0, p0, Liaj;->a:Lhaj;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbpj;

    iget-wide v0, v0, Lbpj;->a:J

    invoke-virtual {p0, v0, v1}, Lhaj;->b(J)Landroid/graphics/Shader;

    move-result-object v4

    :cond_ca
    return-object v4

    :pswitch_cb
    check-cast p0, Lami;

    iget-object p0, p0, Lami;->d:Ljava/lang/Object;

    check-cast p0, Lh42;

    invoke-static {p0}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p0

    return-object p0

    :pswitch_d6
    check-cast p0, Lcom/opera/android/settings/settings_search/database/SettingsSearchDatabase_Impl;

    new-instance v0, Lpmh;

    invoke-direct {v0, p0}, Lpmh;-><init>(Ly5i;)V

    return-object v0

    :pswitch_de
    check-cast p0, Lb8j;

    iget-object p0, p0, Lb8j;->f:Landroid/content/Context;

    const-string v0, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-static {p0, v0}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_ed
    check-cast p0, Lk6j;

    sget-object v0, Lk6j;->x:[Lxtb;

    new-instance v0, Lj6j;

    invoke-direct {v0, p0}, Lj6j;-><init>(Lk6j;)V

    return-object v0

    :pswitch_f7
    check-cast p0, Ld2j;

    iget-object v0, p0, Ld2j;->k:[Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-static {p0, v0}, Lqbe;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;[Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    :pswitch_103
    return-object p0

    :pswitch_104
    check-cast p0, Liak;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly8f;

    iget-wide v0, p0, Ly8f;->a:J

    return-object p0

    :pswitch_10f
    check-cast p0, Lesi;

    iget-object p0, p0, Lesi;->a:Ljava/lang/String;

    const-string v0, "http://"

    invoke-static {p0, v0, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_234

    const-string v0, "https://"

    invoke-static {p0, v0, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_233

    goto/16 :goto_234

    :pswitch_125
    check-cast p0, Lhh4;

    invoke-interface {p0}, Lhh4;->cancel()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12d
    check-cast p0, Lzg;

    invoke-virtual {p0}, Lzg;->l()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_135
    check-cast p0, Lshf;

    iget-object p0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Lbr6;

    iget-object p0, p0, Lbr6;->c:Ljava/lang/Object;

    check-cast p0, Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    return-object p0

    :pswitch_146
    check-cast p0, Lzoi;

    sget-object v0, Lbvf;->a:Lyi5;

    invoke-static {p0, v0}, Lz4o;->N(Lhi5;Lg7h;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lw51;

    iput-object v0, p0, Lzoi;->A:Lw51;

    if-eqz v0, :cond_162

    new-instance v5, Lv51;

    iget-object v6, v0, Lw51;->a:Landroid/content/Context;

    iget-object v7, v0, Lw51;->b:Ln27;

    iget-wide v8, v0, Lw51;->c:J

    iget-object v10, v0, Lw51;->d:Lzvf;

    invoke-direct/range {v5 .. v10}, Lv51;-><init>(Landroid/content/Context;Ln27;JLzvf;)V

    move-object v4, v5

    :cond_162
    iput-object v4, p0, Lzoi;->B:Lv51;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_167
    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16e
    check-cast p0, Lrki;

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Luoh;

    invoke-direct {v1, p0, v3}, Luoh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17f
    check-cast p0, Lw7n;

    invoke-static {p0}, Lkki;->c(Lw7n;)Lmki;

    move-result-object p0

    return-object p0

    :pswitch_186
    check-cast p0, Lyji;

    iget-object p0, p0, Lyji;->c:Lqki;

    if-eqz p0, :cond_1a7

    sget-object v0, Ln08;->a:Ln08;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-array v0, v3, [Lkotlin/Pair;

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlin/Pair;

    invoke-static {v0}, Lic4;->m([Lkotlin/Pair;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqki;->b(Landroid/os/Bundle;)V

    invoke-virtual {v0}, Landroid/os/BaseBundle;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1a7

    move-object v4, v0

    :cond_1a7
    return-object v4

    :pswitch_1a8
    check-cast p0, Lrji;

    iget-object v0, p0, Lrji;->a:Lc67;

    iget-object v1, p0, Lrji;->d:Ljava/lang/Object;

    if-eqz v1, :cond_1b7

    iget-object v0, v0, Lc67;->a:Lkotlin/jvm/functions/Function2;

    invoke-interface {v0, p0, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_1bc

    :cond_1b7
    const-string p0, "Value should be initialized"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1bc
    return-object v4

    :pswitch_1bd
    check-cast p0, Ljvg;

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/ClassLoader;

    const-string v0, "androidx.window.extensions.layout.FoldingFeature"

    invoke-virtual {p0, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v0, "getBounds"

    invoke-virtual {p0, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const-string v1, "getType"

    invoke-virtual {p0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const-string v5, "getState"

    invoke-virtual {p0, v5, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const-class v4, Landroid/graphics/Rect;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    invoke-interface {v4}, Ln15;->a()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_233

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_233

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    invoke-interface {v4}, Ln15;->a()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_233

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v1

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v1

    if-eqz v1, :cond_233

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-interface {v0}, Ln15;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_233

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result p0

    invoke-static {p0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result p0

    if-nez p0, :cond_234

    :cond_233
    move v2, v3

    :cond_234
    :goto_234
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_239
    check-cast p0, Ljava/util/concurrent/Callable;

    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_240
    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_248
    check-cast p0, Lv3e;

    iget-object p0, p0, Lv3e;->b:Lyl6;

    if-eqz p0, :cond_252

    invoke-virtual {p0}, Lyl6;->g()Z

    move-result v3

    :cond_252
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_257
    check-cast p0, Lk3i;

    sget-object v0, Lm18;->a:Lm18;

    iget-object v1, p0, Lk3i;->a:Liv1;

    invoke-virtual {v1}, Liv1;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lf99;

    invoke-static {v1}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v1

    iget-object p0, p0, Lk3i;->b:Liv1;

    invoke-virtual {p0}, Liv1;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    new-instance v2, Lu4h;

    const/16 v3, 0x12

    invoke-direct {v2, v3}, Lu4h;-><init>(B)V

    const-string v3, "enable_rewards"

    invoke-static {p0, v3, v2}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p0

    new-instance v2, Lrag;

    const/16 v3, 0x16

    invoke-direct {v2, v3}, Lrag;-><init>(B)V

    invoke-static {v0, v1, p0, v2}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object p0

    invoke-static {p0}, Lxf8;->B(Likc;)Ltsd;

    move-result-object p0

    return-object p0

    :pswitch_data_28c
    .packed-switch 0x0
        :pswitch_257
        :pswitch_248
        :pswitch_240
        :pswitch_239
        :pswitch_1bd
        :pswitch_1a8
        :pswitch_186
        :pswitch_17f
        :pswitch_16e
        :pswitch_167
        :pswitch_146
        :pswitch_135
        :pswitch_12d
        :pswitch_125
        :pswitch_10f
        :pswitch_104
        :pswitch_103
        :pswitch_f7
        :pswitch_ed
        :pswitch_de
        :pswitch_d6
        :pswitch_cb
        :pswitch_99
        :pswitch_82
        :pswitch_65
        :pswitch_60
        :pswitch_42
        :pswitch_24
        :pswitch_1b
    .end packed-switch
.end method
