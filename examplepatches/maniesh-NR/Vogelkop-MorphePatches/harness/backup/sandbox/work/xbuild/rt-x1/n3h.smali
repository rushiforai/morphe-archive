.class public final Ln3h;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# static fields
.field public static final o:J

.field public static final p:J

.field public static final synthetic q:I


# instance fields
.field public final d:Lfrk;

.field public final e:Ljjg;

.field public final f:Ljjg;

.field public final g:Lkw3;

.field public final h:Lyqk;

.field public final i:Lplh;

.field public final j:Lddc;

.field public final k:Ljg8;

.field public final l:Lx5f;

.field public final m:J

.field public n:Lj3h;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x190

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Ln3h;->o:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    const-wide/16 v2, 0x14

    div-long/2addr v0, v2

    sput-wide v0, Ln3h;->p:J

    return-void
.end method

.method public constructor <init>(Lfrk;Le3j;Ldj9;Lyqk;Lplh;Lddc;Ljg8;Lx5f;)V
    .registers 12

    new-instance v0, Ljjg;

    const/4 v1, 0x1

    invoke-direct {v0, p2, v1}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Ljjg;

    const/4 v2, 0x2

    invoke-direct {p2, p3, v2}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance p3, Lkw3;

    const/16 v2, 0x16

    invoke-direct {p3, v2}, Lkw3;-><init>(B)V

    invoke-direct {p0, v1}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p1, p0, Ln3h;->d:Lfrk;

    iput-object v0, p0, Ln3h;->e:Ljjg;

    iput-object p2, p0, Ln3h;->f:Ljjg;

    iput-object p3, p0, Ln3h;->g:Lkw3;

    iput-object p4, p0, Ln3h;->h:Lyqk;

    iput-object p5, p0, Ln3h;->i:Lplh;

    iput-object p6, p0, Ln3h;->j:Lddc;

    iput-object p7, p0, Ln3h;->k:Ljg8;

    iput-object p8, p0, Ln3h;->l:Lx5f;

    sget-wide p1, Ln3h;->o:J

    iput-wide p1, p0, Ln3h;->m:J

    iget-boolean p0, p8, Lx5f;->h:Z

    if-nez p0, :cond_31

    return-void

    :cond_31
    iget-object p0, p8, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    new-instance p2, Lck0;

    invoke-direct {p2, p0, p1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object p0, p2, Lck0;->p:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvo0;

    iget-object p0, p0, Lvo0;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnn0;

    iget-object p0, p0, Lnn0;->a:Lmn0;

    const/4 p2, 0x3

    const-wide/16 p3, 0x14

    invoke-virtual {p0, p2, v1, p3, p4}, Ljf0;->p(IIJ)V

    invoke-virtual {p8, p1}, Lx5f;->U0(Lx56;)V

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 3

    iget-object v0, p0, Ln3h;->n:Lj3h;

    if-eqz v0, :cond_10

    const/4 v1, 0x0

    iput-object v1, v0, Lj3h;->b:Lyv4;

    iget-object v0, v0, Lj3h;->c:Ld3k;

    if-eqz v0, :cond_10

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    iput-object v1, p0, Ln3h;->n:Lj3h;

    :cond_10
    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 8

    if-nez p2, :cond_b

    invoke-virtual {p0}, Ln3h;->cancel()V

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_b
    invoke-static {p1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Ln3h;->n:Lj3h;

    const/4 p3, 0x0

    if-eqz p2, :cond_1b

    iget-object v0, p2, Lj3h;->a:Ljava/lang/String;

    goto :goto_1c

    :cond_1b
    move-object v0, p3

    :goto_1c
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object p0, p2, Lj3h;->d:Ljava/util/List;

    if-eqz p0, :cond_2a

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_2a
    iput-object p4, p2, Lj3h;->b:Lyv4;

    return-void

    :cond_2d
    invoke-virtual {p0}, Ln3h;->cancel()V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    const/4 v0, 0x3

    if-ge p2, v0, :cond_3d

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_3d
    new-instance p2, Lj3h;

    new-instance v1, Lqmb;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, p1, p3, v2}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iget-object v2, p0, Ln3h;->j:Lddc;

    invoke-static {v2, p3, p3, v1, v0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p3

    invoke-direct {p2, p1, p4, p3}, Lj3h;-><init>(Ljava/lang/String;Lyv4;Ld3k;)V

    iput-object p2, p0, Ln3h;->n:Lj3h;

    return-void
.end method

.method public final h(Lorb;)Z
    .registers 5

    const-string v0, "currency"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x1e

    iget-object p0, p0, Ln3h;->l:Lx5f;

    if-nez v0, :cond_19

    const-string p1, "Missing currency field"

    invoke-virtual {p0, v2, p1}, Lx5f;->R(ILjava/lang/String;)V

    return v1

    :cond_19
    :try_start_19
    invoke-static {p1}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_1c} :catch_1e

    const/4 p0, 0x1

    return p0

    :catch_1e
    const-string v0, "Invalid currency code: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lx5f;->R(ILjava/lang/String;)V

    return v1
.end method

.method public final i(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p2, Lk3h;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lk3h;

    iget v1, v0, Lk3h;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lk3h;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lk3h;

    invoke-direct {v0, p0, p2}, Lk3h;-><init>(Ln3h;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lk3h;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lk3h;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_39

    if-eq v2, v4, :cond_32

    if-ne v2, v3, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    move-object v7, p0

    goto :goto_73

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_32
    iget-object p1, v0, Lk3h;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    :cond_37
    move-object v9, p1

    goto :goto_49

    :cond_39
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lk3h;->t:Ljava/lang/String;

    iput v4, v0, Lk3h;->w:I

    iget-object p2, p0, Ln3h;->i:Lplh;

    invoke-static {p2, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_37

    goto :goto_72

    :goto_49
    check-cast p2, Lf3h;

    invoke-virtual {p2}, Lf3h;->d()Z

    move-result p1

    if-eqz p1, :cond_57

    invoke-virtual {p2}, Lf3h;->c()F

    move-result p1

    :goto_55
    move v8, p1

    goto :goto_5b

    :cond_57
    const p1, 0x3f666666    # 0.9f

    goto :goto_55

    :goto_5b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    new-instance v6, Lm3h;

    const/4 v12, 0x0

    move-object v7, p0

    invoke-direct/range {v6 .. v12}, Lm3h;-><init>(Ln3h;FLjava/lang/String;JLmt5;)V

    iput-object v5, v0, Lk3h;->t:Ljava/lang/String;

    iput v3, v0, Lk3h;->w:I

    iget-object p0, v7, Ln3h;->k:Ljg8;

    invoke-static {p0, v6, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_73

    :goto_72
    return-object v1

    :cond_73
    :goto_73
    check-cast p2, Ljava/util/List;

    iget-object p0, v7, Ln3h;->n:Lj3h;

    if-eqz p0, :cond_7e

    iget-object p1, p0, Lj3h;->b:Lyv4;

    iput-object v5, p0, Lj3h;->c:Ld3k;

    goto :goto_7f

    :cond_7e
    move-object p1, v5

    :goto_7f
    if-nez p2, :cond_8b

    iput-object v5, v7, Ln3h;->n:Lj3h;

    if-eqz p1, :cond_96

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {p1, p0}, Lyv4;->d(Ljava/util/List;)V

    goto :goto_96

    :cond_8b
    if-eqz p0, :cond_91

    iput-object p2, p0, Lj3h;->d:Ljava/util/List;

    iput-object v5, p0, Lj3h;->b:Lyv4;

    :cond_91
    if-eqz p1, :cond_96

    invoke-virtual {p1, p2}, Lyv4;->d(Ljava/util/List;)V

    :cond_96
    :goto_96
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final j(Lorb;Ljava/lang/String;)Lcom/opera/android/suggestion/Suggestion;
    .registers 25

    move-object/from16 v0, p1

    const-string v1, "platform_url"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lorb;->a:Lorg/json/JSONObject;

    move-object/from16 v3, p0

    iget-object v3, v3, Ln3h;->h:Lyqk;

    invoke-virtual {v3}, Lyqk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpne;

    iget-object v3, v3, Lpne;->a:Ljava/lang/String;

    invoke-static {v3, v1}, Ldbh;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "platform_favicon"

    if-nez v3, :cond_26

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_26
    move-object v9, v1

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "origin_url"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    new-instance v5, Lc3h;

    const-string v3, "price_value"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    double-to-float v6, v6

    const-string v3, "currency"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v3, "platform_name"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v3, "review_stars"

    const-wide/16 v11, 0x0

    invoke-virtual {v2, v3, v11, v12}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v2

    double-to-float v11, v2

    const-string v2, "product_id"

    invoke-virtual {v0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct/range {v5 .. v13}, Lc3h;-><init>(FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FLjava/lang/String;Ljava/lang/String;)V

    const-string v2, "image_link"

    invoke-virtual {v0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    new-instance v10, Lcom/opera/android/suggestion/Suggestion;

    const/16 v19, 0x0

    const/16 v11, 0x20

    const-string v13, ""

    const/4 v15, 0x0

    const/16 v16, 0x0

    const v17, 0x7ffffffe

    const/16 v20, -0x1

    move-object v12, v1

    move-object/from16 v21, v5

    invoke-direct/range {v10 .. v21}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v10
.end method
