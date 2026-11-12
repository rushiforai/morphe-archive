.class public final Lpy9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:J


# instance fields
.field public final a:Lmcj;

.field public final b:Lshf;

.field public final c:Lxbf;

.field public final d:Lnv1;

.field public final e:Ljtg;

.field public final f:Lkze;

.field public final g:Lkze;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x6

    sget-object v1, Lun7;->g:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lpy9;->h:J

    return-void
.end method

.method public constructor <init>(Lmcj;Lshf;Lxbf;Lnv1;Ljtg;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpy9;->a:Lmcj;

    iput-object p2, p0, Lpy9;->b:Lshf;

    iput-object p3, p0, Lpy9;->c:Lxbf;

    iput-object p4, p0, Lpy9;->d:Lnv1;

    iput-object p5, p0, Lpy9;->e:Ljtg;

    new-instance p2, Lkze;

    sget-object p3, Lwvg;->k:Lwvg;

    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lpy9;->f:Lkze;

    new-instance p2, Lkze;

    new-instance p3, Lqtg;

    const/4 p4, -0x1

    const/16 p5, 0x1e

    invoke-direct {p3, p4, p5}, Lqtg;-><init>(II)V

    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lpy9;->g:Lkze;

    new-instance p2, Lld9;

    const/16 p3, 0xa

    invoke-direct {p2, p0, p3}, Lld9;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lmcj;->b:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-virtual {p0, p2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a()Lwvg;
    .registers 13

    iget-object p0, p0, Lpy9;->a:Lmcj;

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "giveaway_subscription"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_35

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_35

    :try_start_1b
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "free_trial"

    new-instance v2, Lorb;

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-direct {v2, p0}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v2}, Lz4o;->j0(Lorb;)Li7b;

    move-result-object p0

    new-instance v0, Lly9;

    invoke-direct {v0, p0}, Lly9;-><init>(Li7b;)V
    :try_end_34
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_34} :catch_35

    goto :goto_36

    :catch_35
    :cond_35
    move-object v0, v1

    :goto_36
    if-eqz v0, :cond_3a

    iget-object v1, v0, Lly9;->a:Li7b;

    :cond_3a
    move-object v2, v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    invoke-static/range {v2 .. v11}, Lxvg;->x(Li7b;JZJJZZ)Lwvg;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lh0d;Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 11

    iget-object v0, p0, Lpy9;->d:Lnv1;

    invoke-virtual {v0}, Lnv1;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_59

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_59

    sget-object v0, Lh0d;->c:Lh0d;

    if-ne p1, v0, :cond_24

    new-instance v1, Lxx1;

    const/4 v6, 0x3

    move-object v3, p0

    move-object v5, p2

    move-object v2, p3

    invoke-direct/range {v1 .. v6}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;B)V

    iget-object p0, v3, Lpy9;->c:Lxbf;

    invoke-virtual {p0, v1}, Lxbf;->A(Lcom/opera/api/Callback;)V

    return-void

    :cond_24
    move-object v3, p0

    move-object v5, p2

    move-object v2, p3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    iget-object p2, v3, Lpy9;->a:Lmcj;

    iget-object p2, p2, Lmcj;->a:Ljava/lang/Object;

    check-cast p2, Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "last_eligibility_check"

    invoke-interface {p2, p3, p0, p1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance p0, Lmy9;

    const/4 p1, 0x0

    invoke-direct {p0, v3, v5, v2, p1}, Lmy9;-><init>(Lpy9;Ljava/lang/String;Lcom/opera/api/Callback;B)V

    iget-object p1, v3, Lpy9;->b:Lshf;

    iget-object p2, p1, Lshf;->a:Ljava/lang/Object;

    check-cast p2, Lwth;

    new-instance p3, Lxx1;

    invoke-direct {p3, v4, v5, p1, p0}, Lxx1;-><init>(Ljava/lang/String;Ljava/lang/String;Lshf;Lmy9;)V

    invoke-virtual {p2, p3}, Lwth;->w(Lcom/opera/api/Callback;)V

    return-void

    :cond_59
    move-object v2, p3

    sget-object p0, Liy9;->a:Liy9;

    invoke-interface {v2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p1, Loy9;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Loy9;

    iget v1, v0, Loy9;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Loy9;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Loy9;

    invoke-direct {v0, p0, p1}, Loy9;-><init>(Lpy9;Lnt5;)V

    :goto_18
    iget-object p1, v0, Loy9;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Loy9;->w:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_38

    if-eq v2, v4, :cond_31

    if-ne v2, v3, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p1

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v5

    :cond_31
    iget-object v2, v0, Loy9;->t:Lwvg;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :cond_36
    move-object v10, v2

    goto :goto_55

    :cond_38
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lpy9;->a()Lwvg;

    move-result-object v2

    invoke-virtual {v2}, Lwvg;->a()Z

    move-result p1

    if-nez p1, :cond_48

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_48
    iput-object v2, v0, Loy9;->t:Lwvg;

    iput v4, v0, Loy9;->w:I

    iget-object p1, p0, Lpy9;->c:Lxbf;

    invoke-static {p1, v0}, Lw0h;->d(Lxbf;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_36

    goto :goto_80

    :goto_55
    move-object v8, p1

    check-cast v8, Ljava/lang/String;

    if-nez v8, :cond_5d

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_5d
    iget-object p1, p0, Lpy9;->d:Lnv1;

    invoke-virtual {p1}, Lnv1;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v9, p1

    check-cast v9, Ljava/lang/String;

    if-nez v9, :cond_6b

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_6b
    sget-object p1, Ldze;->b:Ldze;

    new-instance v6, Ls71;

    const/4 v11, 0x0

    const/16 v12, 0x12

    move-object v7, p0

    invoke-direct/range {v6 .. v12}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v5, v0, Loy9;->t:Lwvg;

    iput v3, v0, Loy9;->w:I

    invoke-static {p1, v6, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_81

    :goto_80
    return-object v1

    :cond_81
    return-object p0
.end method

.method public final d(Ljava/lang/String;Ldy9;Lcom/opera/api/Callback;)V
    .registers 12

    instance-of v0, p2, Lay9;

    sget-object v1, Lhy9;->a:Lhy9;

    sget-object v2, Lgy9;->a:Lgy9;

    sget-object v3, Ley9;->a:Ley9;

    sget-object v4, Ljy9;->a:Ljy9;

    sget-object v5, Liy9;->a:Liy9;

    if-eqz v0, :cond_26

    check-cast p2, Lay9;

    iget p2, p2, Lay9;->a:I

    const/16 v0, 0x199

    if-ne p2, v0, :cond_18

    move-object v0, v3

    goto :goto_60

    :cond_18
    const/16 v0, 0x1ad

    if-eq p2, v0, :cond_24

    const/16 v0, 0x1f4

    if-gt v0, p2, :cond_47

    const/16 v0, 0x258

    if-ge p2, v0, :cond_47

    :cond_24
    move-object v0, v4

    goto :goto_60

    :cond_26
    instance-of v0, p2, Lzx9;

    if-eqz v0, :cond_3f

    check-cast p2, Lzx9;

    iget-object p2, p2, Lzx9;->a:Ljava/lang/Exception;

    :goto_2e
    if-eqz p2, :cond_47

    instance-of v0, p2, Ljava/net/SocketException;

    if-nez v0, :cond_38

    instance-of v0, p2, Ljava/net/UnknownHostException;

    if-eqz v0, :cond_3a

    :cond_38
    move-object v0, v2

    goto :goto_60

    :cond_3a
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    goto :goto_2e

    :cond_3f
    sget-object v0, Lby9;->a:Lby9;

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    :cond_47
    move-object v0, v5

    goto :goto_60

    :cond_49
    instance-of v0, p2, Lcy9;

    if-eqz v0, :cond_c5

    check-cast p2, Lcy9;

    iget-boolean v0, p2, Lcy9;->a:Z

    if-eqz v0, :cond_5f

    new-instance v0, Lfy9;

    iget-object v6, p2, Lcy9;->b:Ljava/lang/String;

    iget-object v7, p2, Lcy9;->c:Ljava/lang/String;

    iget p2, p2, Lcy9;->d:I

    invoke-direct {v0, v6, v7, p2}, Lfy9;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_60

    :cond_5f
    move-object v0, v1

    :goto_60
    instance-of p2, v0, Lfy9;

    const-string v6, "DEFAULT"

    iget-object v7, p0, Lpy9;->a:Lmcj;

    if-eqz p2, :cond_92

    invoke-static {p1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c1

    const/4 p1, 0x1

    invoke-virtual {v7, p1}, Lmcj;->l(I)V

    move-object p1, v0

    check-cast p1, Lfy9;

    iget p1, p1, Lfy9;->c:I

    iget-object p2, v7, Lmcj;->a:Ljava/lang/Object;

    check-cast p2, Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string v1, "giveaway_duration"

    invoke-interface {p2, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lpy9;->f()Lqtg;

    goto :goto_c1

    :cond_92
    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_b4

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_b4

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c1

    invoke-virtual {v0, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c1

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c1

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_b4
    invoke-static {p1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c1

    const/4 p1, 0x2

    invoke-virtual {v7, p1}, Lmcj;->l(I)V

    invoke-virtual {p0}, Lpy9;->f()Lqtg;

    :cond_c1
    :goto_c1
    invoke-interface {p3, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_c5
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final e(ZLu3k;Lz3k;Ls2g;)V
    .registers 12

    sget-object v0, Le4k;->a:Le4k;

    iget-object v1, p0, Lpy9;->a:Lmcj;

    if-eqz p1, :cond_2f

    instance-of p1, p3, Ly3k;

    if-eqz p1, :cond_2f

    :try_start_a
    move-object p1, p3

    check-cast p1, Ly3k;

    iget-object p1, p1, Ly3k;->a:Ljava/lang/String;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "free_trial"

    new-instance v3, Lorb;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {v3, p1}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v3}, Lz4o;->j0(Lorb;)Li7b;
    :try_end_22
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_22} :catch_2b

    move-object p1, p3

    check-cast p1, Ly3k;

    iget-object p1, p1, Ly3k;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lmcj;->m(Ljava/lang/String;)V

    goto :goto_2f

    :catch_2b
    invoke-virtual {p4, v0}, Ls2g;->run(Ljava/lang/Object;)V

    return-void

    :cond_2f
    :goto_2f
    instance-of p1, p3, Lv3k;

    sget-object v2, Lf4k;->a:Lf4k;

    sget-object v3, Lc4k;->a:Lc4k;

    sget-object v4, La4k;->a:La4k;

    sget-object v5, Lg4k;->a:Lg4k;

    if-eqz p1, :cond_a7

    check-cast p3, Lv3k;

    iget p1, p3, Lv3k;->a:I

    const/16 v6, 0x193

    if-ne p1, v6, :cond_93

    iget-object p1, p3, Lv3k;->c:Lyx9;

    if-eqz p1, :cond_4a

    iget-object p1, p1, Lyx9;->a:Ljava/lang/String;

    goto :goto_4b

    :cond_4a
    const/4 p1, 0x0

    :goto_4b
    if-eqz p1, :cond_c8

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p3

    sparse-switch p3, :sswitch_data_116

    goto/16 :goto_c8

    :sswitch_56
    const-string p3, "missing integrity verdicts"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_8d

    goto/16 :goto_c8

    :sswitch_60
    const-string p3, "unknown package name"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_8d

    goto/16 :goto_c8

    :sswitch_6a
    const-string p3, "missing sha256 digest for package"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_c8

    goto :goto_8d

    :sswitch_73
    const-string p3, "device integrity failed"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_8d

    goto :goto_c8

    :sswitch_7c
    const-string p3, "package certificate sha256 digest invalid"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_8d

    goto :goto_c8

    :sswitch_85
    const-string p3, "app integrity failed"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_c8

    :cond_8d
    :goto_8d
    new-instance p3, Ld4k;

    invoke-direct {p3, p1}, Ld4k;-><init>(Ljava/lang/String;)V

    goto :goto_cf

    :cond_93
    const/16 p3, 0x199

    if-ne p1, p3, :cond_99

    move-object p3, v4

    goto :goto_cf

    :cond_99
    const/16 p3, 0x1ad

    if-eq p1, p3, :cond_a5

    const/16 p3, 0x1f4

    if-gt p3, p1, :cond_c8

    const/16 p3, 0x258

    if-ge p1, p3, :cond_c8

    :cond_a5
    move-object p3, v5

    goto :goto_cf

    :cond_a7
    instance-of p1, p3, Lw3k;

    if-eqz p1, :cond_c0

    check-cast p3, Lw3k;

    iget-object p1, p3, Lw3k;->a:Ljava/io/IOException;

    :goto_af
    if-eqz p1, :cond_c8

    instance-of p3, p1, Ljava/net/SocketException;

    if-nez p3, :cond_b9

    instance-of p3, p1, Ljava/net/UnknownHostException;

    if-eqz p3, :cond_bb

    :cond_b9
    move-object p3, v3

    goto :goto_cf

    :cond_bb
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    goto :goto_af

    :cond_c0
    sget-object p1, Lx3k;->a:Lx3k;

    invoke-static {p3, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_ca

    :cond_c8
    :goto_c8
    move-object p3, v0

    goto :goto_cf

    :cond_ca
    instance-of p1, p3, Ly3k;

    if-eqz p1, :cond_112

    move-object p3, v2

    :goto_cf
    invoke-virtual {p3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_fd

    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_fd

    sget-object p0, Lb4k;->a:Lb4k;

    invoke-virtual {p3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10e

    invoke-virtual {p3, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10e

    instance-of p0, p3, Ld4k;

    if-nez p0, :cond_10e

    invoke-virtual {p3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10e

    invoke-virtual {p3, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_fd
    iget-object p1, p2, Lu3k;->b:Ljava/lang/String;

    const-string p2, "DEFAULT"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10e

    const/4 p1, 0x2

    invoke-virtual {v1, p1}, Lmcj;->l(I)V

    invoke-virtual {p0}, Lpy9;->f()Lqtg;

    :cond_10e
    invoke-virtual {p4, p3}, Ls2g;->run(Ljava/lang/Object;)V

    return-void

    :cond_112
    invoke-static {}, Lh9o;->p()V

    return-void

    :sswitch_data_116
    .sparse-switch
        -0x6788b771 -> :sswitch_85
        -0x463fd86f -> :sswitch_7c
        -0x31c20b06 -> :sswitch_73
        -0x2ee6fc0e -> :sswitch_6a
        0xbb3de3b -> :sswitch_60
        0x38fe3a27 -> :sswitch_56
    .end sparse-switch
.end method

.method public final f()Lqtg;
    .registers 6

    iget-object v0, p0, Lpy9;->a:Lmcj;

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    iget-object v1, p0, Lpy9;->e:Ljtg;

    invoke-virtual {v1}, Ljtg;->c()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_11

    const/4 v1, 0x2

    goto :goto_1d

    :cond_11
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v3, "giveaway_eligibility"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    :goto_1d
    new-instance v3, Lqtg;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v4, "giveaway_duration"

    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-direct {v3, v1, v0}, Lqtg;-><init>(II)V

    iget-object p0, p0, Lpy9;->g:Lkze;

    invoke-static {p0, v3}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-object v3
.end method
