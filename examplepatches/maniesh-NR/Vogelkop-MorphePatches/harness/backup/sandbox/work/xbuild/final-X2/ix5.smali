.class public final Lix5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/coroutines/g;
.implements Lv1g;
.implements Lu38;
.implements Let8;
.implements Ln19;
.implements Lcs9;
.implements Lo9d;
.implements Lpsm;
.implements Llse;
.implements Lgm;
.implements Llo7;
.implements Ldxg;
.implements Lf06;


# static fields
.field public static b:Lix5;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lix5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lfxg;Li06;)V
    .registers 3

    const/16 p1, 0x19

    iput-byte p1, p0, Lix5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static k(Ljava/lang/String;Lki9;I)Landroid/graphics/Typeface;
    .registers 5

    if-nez p2, :cond_15

    sget-object v0, Lki9;->e:Lki9;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    if-eqz p0, :cond_12

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_15

    :cond_12
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    return-object p0

    :cond_15
    if-nez p2, :cond_2a

    sget-object v0, Lki9;->h:Lki9;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    if-eqz p0, :cond_27

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2a

    :cond_27
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    return-object p0

    :cond_2a
    const/4 v0, 0x0

    if-nez p0, :cond_30

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_34

    :cond_30
    invoke-static {p0, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    :goto_34
    iget p1, p1, Lki9;->a:I

    const/4 v1, 0x1

    if-ne p2, v1, :cond_3a

    move v0, v1

    :cond_3a
    invoke-static {p0, p1, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static o(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Lmt7;

    if-eqz v0, :cond_b

    check-cast p0, Lmt7;

    goto :goto_c

    :cond_b
    const/4 p0, 0x0

    :goto_c
    if-nez p0, :cond_f

    return-void

    :cond_f
    iget-object p0, p0, Lmt7;->a:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    return-void
.end method

.method public static p(I)Ly2b;
    .registers 4

    sget-object v0, Ly2b;->g:Lh58;

    invoke-static {v0, v0}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lw4;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {v0}, Lw4;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ly2b;

    iget v2, v1, Ly2b;->a:I

    if-ne v2, p0, :cond_6

    return-object v1

    :cond_17
    const-string p0, "Collection contains no element matching the predicate."

    invoke-static {p0}, Lh9o;->h(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static s(Landroid/view/View;F)V
    .registers 4

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    const/4 v1, 0x0

    if-lez v0, :cond_b

    move v0, v1

    goto :goto_d

    :cond_b
    const/16 v0, 0x8

    :goto_d
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float p1, p1, v0

    if-nez p1, :cond_17

    const/4 v1, 0x1

    :cond_17
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method

.method public static t(Landroid/view/View;Lpt7;Lot7;Z)V
    .registers 5

    iget-object v0, p1, Lpt7;->a:Lot7;

    if-ne v0, p2, :cond_6

    const/4 p2, 0x1

    goto :goto_7

    :cond_6
    const/4 p2, 0x0

    :goto_7
    if-eqz p2, :cond_e

    iget-boolean p1, p1, Lpt7;->b:Z

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    :cond_e
    invoke-static {p0, p2, p3}, Lix5;->w(Landroid/view/View;ZZ)V

    return-void
.end method

.method public static u(Landroid/view/View;Lst7;Lrt7;)V
    .registers 5

    sget v0, Lwt7;->o:I

    iget-object p1, p1, Lst7;->a:Lrt7;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, p2, :cond_a

    move p1, v0

    goto :goto_b

    :cond_a
    move p1, v1

    :goto_b
    if-eqz p1, :cond_10

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    :cond_10
    invoke-static {p0, p1, v1}, Lix5;->w(Landroid/view/View;ZZ)V

    return-void
.end method

.method public static w(Landroid/view/View;ZZ)V
    .registers 10

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    if-eqz p1, :cond_9

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :goto_a
    cmpg-float v2, v0, v1

    if-nez v2, :cond_2d

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p1, Lmt7;

    const/4 v0, 0x0

    if-eqz p2, :cond_1a

    check-cast p1, Lmt7;

    goto :goto_1b

    :cond_1a
    move-object p1, v0

    :goto_1b
    if-nez p1, :cond_1e

    return-void

    :cond_1e
    iget-object p1, p1, Lmt7;->a:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void

    :cond_2d
    invoke-static {p0}, Lix5;->o(Landroid/view/View;)V

    new-instance v2, Lmt7;

    const/4 v3, 0x2

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v0, v3, v4

    const/4 v0, 0x1

    aput v1, v3, v0

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-direct {v2, v0}, Lmt7;-><init>(Landroid/animation/ValueAnimator;)V

    sget-wide v5, Lwt7;->m:J

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    if-nez p1, :cond_5b

    if-eqz p2, :cond_5b

    sget-wide p1, Lwt7;->n:J

    invoke-static {p1, p2}, Lpn7;->f(J)J

    move-result-wide p1

    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    invoke-virtual {p0, v4}, Landroid/view/View;->setClickable(Z)V

    :cond_5b
    new-instance p1, Llt7;

    invoke-direct {p1, p0, v4}, Llt7;-><init>(Landroid/view/View;B)V

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p1, Lnt7;

    invoke-direct {p1, p0, v1, v4}, Lnt7;-><init>(Landroid/view/View;FB)V

    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method


# virtual methods
.method public final A(Lorg/json/JSONObject;)Ljava/lang/Object;
    .registers 13

    const-string p0, "news_device_id"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "news_feed_host"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lhse;

    invoke-direct {v1, p0, v0}, Lhse;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "events"

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 p1, 0x0

    :goto_18
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge p1, v0, :cond_57

    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "origin"

    const-string v3, "firebase"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "news_entry_id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "rule_id"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "action_type"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "ts"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v9

    new-instance v4, Lgse;

    invoke-direct/range {v4 .. v10}, Lgse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    iget-object v0, v1, Lhse;->c:Lnse;

    iget-object v2, v0, Lnse;->b:Ljava/io/Serializable;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lnse;->a()V

    add-int/lit8 p1, p1, 0x1

    goto :goto_18

    :cond_57
    return-object v1
.end method

.method public final G(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/io/InputStream;

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    return-void
.end method

.method public final a()Ljava/lang/Class;
    .registers 1

    const-class p0, Ljava/io/InputStream;

    return-object p0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public final c(Ljava/lang/Object;)[Ljava/lang/String;
    .registers 4

    const-string p0, "data"

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_c

    const/4 p0, 0x0

    return-object p0

    :cond_c
    new-instance p1, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v0, 0x0

    :goto_16
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_26

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    :cond_26
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public final d(Ljava/lang/String;Ljava/security/Provider;)Ljava/lang/Object;
    .registers 3

    if-nez p2, :cond_7

    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p0

    return-object p0

    :cond_7
    invoke-static {p1, p2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object p0

    return-object p0
.end method

.method public final e(Landroid/net/Uri;Lld6;)Ljava/lang/Object;
    .registers 3

    new-instance p0, Ljava/io/BufferedReader;

    new-instance p1, Ljava/io/InputStreamReader;

    invoke-direct {p1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ltym;->Q(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public final f(Ljava/util/HashSet;)V
    .registers 2

    return-void
.end method

.method public final g(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 3

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final h(Ljava/util/HashSet;)V
    .registers 2

    return-void
.end method

.method public final i()Lfee;
    .registers 1

    invoke-static {}, Lfee;->k()Lfee;

    move-result-object p0

    return-object p0
.end method

.method public final j(Lu3j;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final l(Ludg;)Ljava/lang/Object;
    .registers 2

    iget p0, p1, Ludg;->J:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final m(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    check-cast p1, Lorg/json/JSONObject;

    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x0

    if-eqz p0, :cond_10

    return-object v0

    :cond_10
    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final n(Ljava/lang/String;)V
    .registers 2

    return-void
.end method

.method public final q(Lcom/opera/api/Callback;)V
    .registers 3

    sget-object p0, Lcak;->d:Lavj;

    new-instance p0, Ln32;

    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Ln32;-><init>(Lcom/opera/api/Callback;B)V

    const/4 p1, 0x1

    invoke-static {p1, p0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method

.method public final r(Ljava/io/File;)Ljava/lang/Object;
    .registers 2

    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Lix5;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    const/16 v0, 0x10

    invoke-static {v0}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    const-class v0, Lrki;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<"

    const-string v2, ">"

    const-string v3, "CreationExtras.Key@"

    invoke-static {v3, p0, v1, v0, v2}, Lsko;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_2e
    .packed-switch 0x1c
        :pswitch_a
    .end packed-switch
.end method

.method public final v()Lqsm;
    .registers 1

    new-instance p0, Liyd;

    invoke-direct {p0}, Liyd;-><init>()V

    return-object p0
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 4

    new-instance p0, Lhwf;

    const/16 v0, 0x11

    const-string v1, "pls"

    invoke-direct {p0, p1, v0, v1}, Lno7;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    return-object p0
.end method

.method public final y(Ljava/lang/Object;)Lorg/json/JSONObject;
    .registers 4

    check-cast p1, Lhse;

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "news_device_id"

    iget-object v1, p1, Lhse;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "news_feed_host"

    iget-object v1, p1, Lhse;->b:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p1, p1, Lhse;->c:Lnse;

    invoke-virtual {p1}, Lnse;->d()Lorg/json/JSONArray;

    move-result-object p1

    const-string v0, "events"

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object p0
.end method
