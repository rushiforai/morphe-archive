.class public final Lhr5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkr5;
.implements Lcom/leanplum/DeeplinkIntentCustomizer;
.implements Lnwh;
.implements Lu38;
.implements Lwn8;
.implements Lfx8;
.implements Lpsk;
.implements Lfoa;
.implements Lkod;
.implements Lpqk;
.implements Len8;
.implements Lpoi;


# static fields
.field public static a:La36;


# direct methods
.method public static j(Ljava/lang/String;)Ly9c;
    .registers 2

    if-eqz p0, :cond_54

    invoke-static {p0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_54

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_58

    goto :goto_4f

    :sswitch_10
    const-string v0, "Weather alert"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4f

    sget-object p0, Ly9c;->f:Ly9c;

    return-object p0

    :sswitch_1b
    const-string v0, "Weather forecast"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4f

    sget-object p0, Ly9c;->c:Ly9c;

    return-object p0

    :sswitch_26
    const-string v0, "eSIM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4f

    sget-object p0, Ly9c;->g:Ly9c;

    return-object p0

    :sswitch_31
    const-string v0, "Product and service news"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4f

    sget-object p0, Ly9c;->b:Ly9c;

    return-object p0

    :sswitch_3c
    const-string v0, "Livescore"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4f

    sget-object p0, Ly9c;->d:Ly9c;

    return-object p0

    :sswitch_47
    const-string v0, "Rewards"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_51

    :cond_4f
    :goto_4f
    const/4 p0, 0x0

    return-object p0

    :cond_51
    sget-object p0, Ly9c;->e:Ly9c;

    return-object p0

    :cond_54
    sget-object p0, Ly9c;->b:Ly9c;

    return-object p0

    nop

    :sswitch_data_58
    .sparse-switch
        -0x5b2cd0fc -> :sswitch_47
        -0x4b579efa -> :sswitch_3c
        -0x36f463c8 -> :sswitch_31
        0x2f2a32 -> :sswitch_26
        0x100568c7 -> :sswitch_1b
        0x35db3e10 -> :sswitch_10
    .end sparse-switch
.end method

.method public static l(Landroid/content/Context;)I
    .registers 3

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result v0

    if-eqz v0, :cond_12

    sget-boolean v0, Lcom/opera/android/browser/chromium/ChromiumTurboTesterDelegate;->a:Z

    if-eqz v0, :cond_12

    const v0, 0x7f060f7a

    invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0

    :cond_12
    const v0, 0x7f040a1b

    const v1, 0x7f0602c4

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method


# virtual methods
.method public final b(Lev4;)Lqsk;
    .registers 8

    new-instance v0, Lyo9;

    iget-object p0, p1, Lev4;->d:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    iget-object p0, p1, Lev4;->e:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljava/lang/String;

    iget-object p0, p1, Lev4;->f:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Le04;

    iget-boolean v4, p1, Lev4;->b:Z

    iget-boolean v5, p1, Lev4;->c:Z

    invoke-direct/range {v0 .. v5}, Lyo9;-><init>(Landroid/content/Context;Ljava/lang/String;Le04;ZZ)V

    return-object v0
.end method

.method public final customize(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/Intent;
    .registers 4

    new-instance p0, Lwgf;

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_a

    sget-object p2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    :cond_a
    sget-object v0, Llqm;->i:Llqm;

    invoke-direct {p0, p2, v0}, Lwgf;-><init>(Landroid/net/Uri;Llqm;)V

    const-string p2, "com.opera.android.action.OPEN_URL"

    invoke-virtual {p0, p1, p2}, Ls0f;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public final d(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;
    .registers 3

    if-nez p2, :cond_7

    invoke-static {p1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object p0

    return-object p0

    :cond_7
    invoke-static {p1, p2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljava/security/Signature;

    move-result-object p0

    return-object p0
.end method

.method public final e(Lpna;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Ltqa;

    iget-object p0, p1, Lpna;->d:Lmpa;

    sget-object v0, Lmpa;->m:Lc30;

    new-instance v1, Lsqa;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p1, v2}, Lsqa;-><init>(Ltqa;Lpna;Lmt5;)V

    invoke-virtual {p0, v0, v1}, Lcfg;->f(Lc30;Lcr9;)V

    return-void
.end method

.method public final endTracks()V
    .registers 1

    return-void
.end method

.method public final f()Ljava/lang/Object;
    .registers 1

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method public final g(JJ)J
    .registers 7

    invoke-static {p1, p2, p3, p4}, Li41;->n(JJ)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long p3, p0

    const/16 p0, 0x20

    shl-long/2addr p1, p0

    const-wide v0, 0xffffffffL

    and-long/2addr p3, v0

    or-long/2addr p1, p3

    return-wide p1
.end method

.method public final getKey()Ljf2;
    .registers 1

    sget-object p0, Ltqa;->c:Ljf2;

    return-object p0
.end method

.method public final h(Ltwi;)V
    .registers 2

    return-void
.end method

.method public final i(I)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final k(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .registers 2

    new-instance p0, La36;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ltqa;

    invoke-direct {p0}, Ltqa;-><init>()V

    return-object p0
.end method

.method public final m(Lm0f;Landroid/content/Context;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p3, Lu3i;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lu3i;

    iget v1, v0, Lu3i;->x:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lu3i;->x:I

    goto :goto_18

    :cond_13
    new-instance v0, Lu3i;

    invoke-direct {v0, p0, p3}, Lu3i;-><init>(Lhr5;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lu3i;->v:Ljava/lang/Object;

    sget-object p3, Lpx5;->a:Lpx5;

    iget v1, v0, Lu3i;->x:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_32

    if-ne v1, v3, :cond_2c

    iget-object p1, v0, Lu3i;->u:Landroid/net/Uri;

    iget-object p2, v0, Lu3i;->t:Landroid/content/Context;

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5d

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_32
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    if-nez p1, :cond_3a

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_3a
    iget-object p0, p1, Lm0f;->b:Ljava/lang/String;

    if-eqz p0, :cond_84

    invoke-static {p0}, Lddh;->y(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_84

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwqm;->s(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_74

    sget-object p0, Llk6;->a:Llk6;

    iput-object p2, v0, Lu3i;->t:Landroid/content/Context;

    iput-object p1, v0, Lu3i;->u:Landroid/net/Uri;

    iput v3, v0, Lu3i;->x:I

    invoke-virtual {p0, p1, p2, v0}, Llk6;->d(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;

    move-result-object p0

    if-ne p0, p3, :cond_5d

    return-object p3

    :cond_5d
    :goto_5d
    check-cast p0, Ljk6;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_74

    if-eq p0, v3, :cond_71

    const/4 p1, 0x2

    if-eq p0, p1, :cond_71

    const/4 p1, 0x3

    if-eq p0, p1, :cond_71

    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_71
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_74
    sget-object p0, Llk6;->a:Llk6;

    sget-object p0, Lik6;->b:Lik6;

    const/4 p3, 0x0

    sget-object v0, Llqm;->i:Llqm;

    invoke-static {p3, p0, v0, p2, p1}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_84
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final onScrollLimit(IIIZ)V
    .registers 5

    return-void
.end method

.method public final onScrollProgress(IIII)V
    .registers 5

    return-void
.end method

.method public final track(II)Lhyl;
    .registers 3

    new-instance p0, Ls97;

    invoke-direct {p0}, Ls97;-><init>()V

    return-object p0
.end method
