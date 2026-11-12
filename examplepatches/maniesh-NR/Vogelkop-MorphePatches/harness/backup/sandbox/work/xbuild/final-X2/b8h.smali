.class public abstract Lb8h;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Ljava/lang/Throwable;)Lcm;
    .registers 6

    instance-of v0, p0, Lvjo;

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eqz v0, :cond_80

    move-object v0, p0

    check-cast v0, Lvjo;

    iget v0, v0, Lvjo;->a:I

    const/16 v3, 0x3e9

    if-eq v0, v3, :cond_71

    const/16 v3, 0x3ea

    if-eq v0, v3, :cond_71

    const/16 v3, 0x232e

    if-eq v0, v3, :cond_71

    if-eq v0, v2, :cond_80

    if-eqz v0, :cond_69

    const/4 v3, 0x1

    if-eq v0, v3, :cond_5a

    const/4 v4, 0x2

    if-eq v0, v4, :cond_5a

    packed-switch v0, :pswitch_data_8e

    packed-switch v0, :pswitch_data_a0

    packed-switch v0, :pswitch_data_ae

    packed-switch v0, :pswitch_data_bc

    goto :goto_80

    :pswitch_2e
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_38

    const-string p0, "Illegal call to SDK API."

    :cond_38
    invoke-direct {v0, v3, p0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object v0

    :pswitch_3c
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_46

    const-string p0, "No suitable ad."

    :cond_46
    const/4 v2, 0x5

    invoke-direct {v0, v2, p0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object v0

    :pswitch_4b
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_55

    const-string p0, "Network error!"

    :cond_55
    const/4 v2, 0x4

    invoke-direct {v0, v2, p0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object v0

    :cond_5a
    :pswitch_5a
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_64

    const-string p0, "Sdk initialization error."

    :cond_64
    const/4 v2, 0x6

    invoke-direct {v0, v2, p0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object v0

    :cond_69
    new-instance p0, Lcm;

    const-string v0, "Should not happen!"

    invoke-direct {p0, v2, v0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object p0

    :cond_71
    :pswitch_71
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_7b

    const-string p0, "Assets error!"

    :cond_7b
    const/4 v2, 0x3

    invoke-direct {v0, v2, p0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object v0

    :cond_80
    :goto_80
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lcm;

    if-nez p0, :cond_8a

    const-string p0, "Unknown error!"

    :cond_8a
    invoke-direct {v0, v2, p0, v1}, Lcm;-><init>(ILjava/lang/String;B)V

    return-object v0

    :pswitch_data_8e
    .packed-switch 0x64
        :pswitch_4b
        :pswitch_3c
        :pswitch_2e
        :pswitch_5a
        :pswitch_2e
        :pswitch_4b
        :pswitch_4b
    .end packed-switch

    :pswitch_data_a0
    .packed-switch 0x2328
        :pswitch_71
        :pswitch_71
        :pswitch_71
        :pswitch_71
        :pswitch_71
    .end packed-switch

    :pswitch_data_ae
    .packed-switch 0x2330
        :pswitch_71
        :pswitch_71
        :pswitch_71
        :pswitch_71
        :pswitch_71
    .end packed-switch

    :pswitch_data_bc
    .packed-switch 0x238c
        :pswitch_4b
        :pswitch_3c
        :pswitch_71
        :pswitch_3c
    .end packed-switch
.end method

.method public static b(Z)Ln63;
    .registers 3

    if-eqz p0, :cond_11

    sget-object p0, Ln63;->b:Lk63;

    iget-object v0, p0, Lm63;->e:Ljava/lang/Character;

    if-nez v0, :cond_9

    return-object p0

    :cond_9
    iget-object v0, p0, Lm63;->d:Li63;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lm63;->h(Li63;Ljava/lang/Character;)Ln63;

    move-result-object p0

    return-object p0

    :cond_11
    sget-object p0, Ln63;->a:Lk63;

    return-object p0
.end method

.method public static c(Ljava/lang/String;Z)[B
    .registers 3

    invoke-static {p1}, Lb8h;->b(Z)Ln63;

    move-result-object p1

    invoke-virtual {p1, p0}, Ln63;->a(Ljava/lang/String;)[B

    move-result-object p1

    array-length v0, p1

    if-nez v0, :cond_1c

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1c

    const-string p1, "Unable to decode "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1c
    return-object p1
.end method

.method public static final d(Lekc;)Lh42;
    .registers 5

    new-instance v0, Llqh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Llqh;->a:Z

    invoke-virtual {p0}, Lekc;->i()Z

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v1, 0x0

    iput-boolean v1, v0, Llqh;->a:Z

    new-instance v1, Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lh42;-><init>(Ljava/lang/Object;)V

    goto :goto_20

    :cond_1b
    new-instance v1, Lh42;

    invoke-direct {v1}, Lh42;-><init>()V

    :goto_20
    new-instance v2, Lgil;

    const/4 v3, 0x7

    invoke-direct {v2, v1, v0, v3}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lt7d;

    const/16 v3, 0x1a

    invoke-direct {v0, v2, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p0, v0}, Lh42;->s(Lekc;Lf7f;)V

    return-object v1
.end method

.method public static final e(Landroid/view/View;)Lrki;
    .registers 4

    :goto_0
    const/4 v0, 0x0

    if-eqz p0, :cond_22

    const v1, 0x7f0a0c9c

    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lrki;

    if-eqz v2, :cond_11

    check-cast v1, Lrki;

    goto :goto_12

    :cond_11
    move-object v1, v0

    :goto_12
    if-eqz v1, :cond_15

    return-object v1

    :cond_15
    invoke-static {p0}, Ly7h;->h(Landroid/view/View;)Landroid/view/ViewParent;

    move-result-object p0

    instance-of v1, p0, Landroid/view/View;

    if-eqz v1, :cond_20

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_20
    move-object p0, v0

    goto :goto_0

    :cond_22
    return-object v0
.end method

.method public static g(Ljava/net/URI;)Lcm;
    .registers 5

    const/4 v0, 0x0

    const/4 v1, -0x1

    :try_start_2
    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4} :catch_44

    :try_start_4
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object p0

    const/4 v3, 0x0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/net/Proxy;
    :try_end_13
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_13} :catch_14
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_13} :catch_44

    move-object v2, p0

    :catch_14
    if-eqz v2, :cond_44

    :try_start_16
    invoke-virtual {v2}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object p0

    sget-object v3, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne p0, v3, :cond_44

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object p0

    instance-of p0, p0, Ljava/net/InetSocketAddress;

    if-eqz p0, :cond_44

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object p0

    check-cast p0, Ljava/net/InetSocketAddress;

    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    goto :goto_3f

    :cond_37
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_3f} :catch_44

    :goto_3f
    :try_start_3f
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result p0
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_43} :catch_45

    goto :goto_46

    :catch_44
    :cond_44
    move-object v2, v0

    :catch_45
    move p0, v1

    :goto_46
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_58

    if-eq p0, v1, :cond_50

    if-nez p0, :cond_52

    :cond_50
    const/16 p0, 0x50

    :cond_52
    new-instance v0, Lcm;

    const/4 v1, 0x7

    invoke-direct {v0, v2, p0, v1}, Lcm;-><init>(Ljava/lang/String;IB)V

    :cond_58
    return-object v0
.end method

.method public static h(Landroid/view/View;)Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    instance-of v0, p0, Lqv5;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    check-cast p0, Lqv5;

    goto :goto_d

    :cond_c
    move-object p0, v1

    :goto_d
    if-eqz p0, :cond_1c

    iget-object p0, p0, Lqv5;->a:Lnv5;

    instance-of v0, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    if-eqz v0, :cond_18

    check-cast p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    goto :goto_19

    :cond_18
    move-object p0, v1

    :goto_19
    if-eqz p0, :cond_1c

    return-object p0

    :cond_1c
    return-object v1
.end method

.method public static i(ILjava/math/BigInteger;)[B
    .registers 5

    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    if-ge p0, v0, :cond_10

    new-array v0, p0, [B

    array-length v2, p1

    sub-int/2addr v2, p0

    invoke-static {p1, v2, v0, v1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0

    :cond_10
    array-length v0, p1

    if-le p0, v0, :cond_1c

    new-array v0, p0, [B

    array-length v2, p1

    sub-int/2addr p0, v2

    array-length v2, p1

    invoke-static {p1, v1, v0, p0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0

    :cond_1c
    return-object p1
.end method

.method public static final j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;
    .registers 5

    invoke-virtual {p0}, Lekc;->i()Z

    move-result v0

    if-eqz v0, :cond_14

    new-instance v0, Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Lh42;-><init>(Ljava/lang/Object;)V

    goto :goto_19

    :cond_14
    new-instance v0, Lh42;

    invoke-direct {v0}, Lh42;-><init>()V

    :goto_19
    new-instance v1, Lgil;

    const/16 v2, 0x8

    invoke-direct {v1, v0, p1, v2}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lt7d;

    const/16 v2, 0x1a

    invoke-direct {p1, v1, v2}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, p0, p1}, Lh42;->s(Lekc;Lf7f;)V

    return-object v0
.end method

.method public static k(Lmil;Lcy;Lnjl;Lb2c;Ldjl;ZLi9f;)V
    .registers 12

    if-eqz p5, :cond_a6

    iget-wide v0, p0, Lmil;->b:J

    invoke-static {v0, v1}, Lxjl;->e(J)I

    move-result p0

    invoke-interface {p6, p0}, Li9f;->i(I)I

    move-result p0

    sget-object p5, Lwgl;->a:Ljava/lang/String;

    iget-object p5, p2, Lnjl;->a:Lmjl;

    iget-object p5, p5, Lmjl;->a:Lsf1;

    iget-object p5, p5, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p5

    const-wide v0, 0xffffffffL

    if-ge p0, p5, :cond_24

    invoke-virtual {p2, p0}, Lnjl;->b(I)Lvoh;

    move-result-object p0

    goto :goto_49

    :cond_24
    if-eqz p0, :cond_2d

    add-int/lit8 p0, p0, -0x1

    invoke-virtual {p2, p0}, Lnjl;->b(I)Lvoh;

    move-result-object p0

    goto :goto_49

    :cond_2d
    iget-object p0, p1, Lcy;->c:Ljava/lang/Object;

    check-cast p0, Likl;

    iget-object p2, p1, Lcy;->d:Ljava/lang/Object;

    check-cast p2, Ln27;

    iget-object p1, p1, Lcy;->e:Ljava/lang/Object;

    check-cast p1, Lmh9;

    invoke-static {p0, p2, p1}, Lwgl;->a(Likl;Ln27;Lmh9;)J

    move-result-wide p0

    new-instance p2, Lvoh;

    and-long/2addr p0, v0

    long-to-int p0, p0

    int-to-float p0, p0

    const/4 p1, 0x0

    const/high16 p5, 0x3f800000    # 1.0f

    invoke-direct {p2, p1, p1, p5, p0}, Lvoh;-><init>(FFFF)V

    move-object p0, p2

    :goto_49
    iget p1, p0, Lvoh;->b:F

    iget p2, p0, Lvoh;->a:F

    invoke-static {p2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p5

    int-to-long p5, p5

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v2

    int-to-long v2, v2

    const/16 v4, 0x20

    shl-long/2addr p5, v4

    and-long/2addr v2, v0

    or-long/2addr p5, v2

    invoke-interface {p3, p5, p6}, Lb2c;->U(J)J

    move-result-wide p5

    shr-long v2, p5, v4

    long-to-int p3, v2

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    and-long/2addr p5, v0

    long-to-int p5, p5

    invoke-static {p5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p5

    invoke-static {p3}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p3

    int-to-long v2, p3

    invoke-static {p5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p3

    int-to-long p5, p3

    shl-long/2addr v2, v4

    and-long/2addr p5, v0

    or-long/2addr v2, p5

    iget p3, p0, Lvoh;->c:F

    sub-float/2addr p3, p2

    iget p0, p0, Lvoh;->d:F

    sub-float/2addr p0, p1

    invoke-static {p3}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long p5, p0

    shl-long/2addr p1, v4

    and-long/2addr p5, v0

    or-long/2addr p1, p5

    invoke-static {v2, v3, p1, p2}, Lbwg;->a(JJ)Lvoh;

    move-result-object p0

    iget-object p1, p4, Ldjl;->a:Lajl;

    iget-object p1, p1, Lajl;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldjl;

    invoke-static {p1, p4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a6

    iget-object p1, p4, Ldjl;->b:Lchg;

    invoke-interface {p1, p0}, Lchg;->g(Lvoh;)V

    :cond_a6
    return-void
.end method

.method public static l(Ljava/lang/String;)Ls6h;
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_11

    new-instance p0, Ls6h;

    sget-object v0, Lh1b;->b:La1b;

    sget-object v0, Lcsh;->e:Lcsh;

    invoke-direct {p0, v0, v0, v1}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    return-object p0

    :cond_11
    new-instance v0, Lorb;

    invoke-direct {v0, p0}, Lorb;-><init>(Ljava/lang/String;)V

    const-string p0, "active"

    invoke-static {v0, p0}, Lqyn;->J(Lorb;Ljava/lang/String;)Lcsh;

    move-result-object p0

    const-string v2, "expired"

    invoke-static {v0, v2}, Lqyn;->J(Lorb;Ljava/lang/String;)Lcsh;

    move-result-object v0

    new-instance v2, Ls6h;

    invoke-direct {v2, p0, v0, v1}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_27} :catch_28

    return-object v2

    :catch_28
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final m(Landroid/content/Context;Lcom/opera/api/Callback;)V
    .registers 6

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-static {p0}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    new-instance v2, Lqj2;

    const/16 v3, 0xd

    invoke-direct {v2, p1, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    check-cast v1, Lhjf;

    invoke-virtual {v1, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V
    :try_end_23
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_23} :catch_24

    return-void

    :catch_24
    new-instance p1, Laz0;

    invoke-direct {p1, p0}, Laz0;-><init>(Landroid/content/Context;)V

    const p0, 0x7f140774

    invoke-virtual {p1, p0}, Laz0;->a(I)V

    const p0, 0x7f140bbb

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Laz0;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Laz0;

    move-result-object p0

    invoke-virtual {p0}, Laz0;->c()Lbz0;

    return-void
.end method

.method public static n(Lcom/opera/android/OperaApplication;)V
    .registers 7

    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {p0, v1, v2, v3}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v1

    if-eqz v1, :cond_1c

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->splitNames:[Ljava/lang/String;

    if-eqz v1, :cond_1c

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    :cond_1c
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->K()Lr0k;

    move-result-object p0

    invoke-interface {p0}, Lr0k;->h()Ljava/util/Set;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v1, v0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Ljava/util/TreeSet;->isEmpty()Z

    move-result p0

    const/16 v2, 0x2e

    const-string v3, ","

    const-string v4, "<none>"

    const/16 v5, 0x24

    if-eqz p0, :cond_3f

    move-object p0, v4

    goto :goto_47

    :cond_3f
    invoke-static {v3, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    :goto_47
    invoke-static {v5, p0}, Lks3;->I(ILjava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/TreeSet;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_58

    invoke-static {v3, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    :cond_58
    const/16 p0, 0x20

    invoke-static {p0, v4}, Lks3;->I(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3

    instance-of v0, p0, Lmxh;

    if-eqz v0, :cond_9

    check-cast p0, Lmxh;

    iget-object p0, p0, Lmxh;->a:Landroid/graphics/drawable/Drawable;

    return-object p0

    :cond_9
    instance-of v0, p0, Llxh;

    if-eqz v0, :cond_16

    check-cast p0, Llxh;

    iget p0, p0, Llxh;->a:I

    invoke-static {p0, p1}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_16
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method
