.class public final synthetic Lcka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbqb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgsb;

.field public final synthetic c:Lisd;


# direct methods
.method public synthetic constructor <init>(Lgsb;Lisd;B)V
    .registers 4

    iput-byte p3, p0, Lcka;->a:B

    iput-object p1, p0, Lcka;->b:Lgsb;

    iput-object p2, p0, Lcka;->c:Lisd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final n(Ltw7;)V
    .registers 11

    iget-byte v0, p0, Lcka;->a:B

    const-string v1, "result"

    const-string v2, "id"

    const-string v3, "2.0"

    const-string v4, "jsonrpc"

    iget-object v5, p0, Lcka;->c:Lisd;

    iget-object p0, p0, Lcka;->b:Lgsb;

    packed-switch v0, :pswitch_data_36a

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_1f

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_6e

    :cond_1f
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_6b

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_6e

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_30
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_37
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_37} :catch_66

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_39
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_40} :catch_61

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    :try_start_48
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4f
    .catch Lorg/json/JSONException; {:try_start_48 .. :try_end_4f} :catch_50

    goto :goto_55

    :catch_50
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6e

    :cond_55
    :goto_55
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_6e

    :catch_61
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6e

    :catch_66
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6e

    :cond_6b
    invoke-static {}, Lh9o;->p()V

    :cond_6e
    :goto_6e
    return-void

    :pswitch_6f
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_7d

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_cc

    :cond_7d
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_c9

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_cc

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_8e
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_95
    .catch Lorg/json/JSONException; {:try_start_8e .. :try_end_95} :catch_c4

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_97
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9e
    .catch Lorg/json/JSONException; {:try_start_97 .. :try_end_9e} :catch_bf

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b3

    :try_start_a6
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_ad
    .catch Lorg/json/JSONException; {:try_start_a6 .. :try_end_ad} :catch_ae

    goto :goto_b3

    :catch_ae
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cc

    :cond_b3
    :goto_b3
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_cc

    :catch_bf
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cc

    :catch_c4
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cc

    :cond_c9
    invoke-static {}, Lh9o;->p()V

    :cond_cc
    :goto_cc
    return-void

    :pswitch_cd
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_db

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_147

    :cond_db
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_144

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lxka;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v6, p1, Lxka;->a:Ljava/lang/String;

    const-string v7, "token"

    invoke-virtual {v0, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, p1, Lxka;->b:Ljava/lang/String;

    const-string v7, "deviceId"

    invoke-virtual {v0, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lxka;->c:Ljava/lang/String;

    const-string v6, "homeCountryIso2"

    invoke-virtual {v0, p1, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_147

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_109
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_110
    .catch Lorg/json/JSONException; {:try_start_109 .. :try_end_110} :catch_13f

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_112
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_119
    .catch Lorg/json/JSONException; {:try_start_112 .. :try_end_119} :catch_13a

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12e

    :try_start_121
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_128
    .catch Lorg/json/JSONException; {:try_start_121 .. :try_end_128} :catch_129

    goto :goto_12e

    :catch_129
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_147

    :cond_12e
    :goto_12e
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_147

    :catch_13a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_147

    :catch_13f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_147

    :cond_144
    invoke-static {}, Lh9o;->p()V

    :cond_147
    :goto_147
    return-void

    :pswitch_148
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_156

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_1a5

    :cond_156
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_1a2

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_1a5

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_167
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_16e
    .catch Lorg/json/JSONException; {:try_start_167 .. :try_end_16e} :catch_19d

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_170
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_177
    .catch Lorg/json/JSONException; {:try_start_170 .. :try_end_177} :catch_198

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18c

    :try_start_17f
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_186
    .catch Lorg/json/JSONException; {:try_start_17f .. :try_end_186} :catch_187

    goto :goto_18c

    :catch_187
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1a5

    :cond_18c
    :goto_18c
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_1a5

    :catch_198
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1a5

    :catch_19d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1a5

    :cond_1a2
    invoke-static {}, Lh9o;->p()V

    :cond_1a5
    :goto_1a5
    return-void

    :pswitch_1a6
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_1b4

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_203

    :cond_1b4
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_200

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_203

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_1c5
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1cc
    .catch Lorg/json/JSONException; {:try_start_1c5 .. :try_end_1cc} :catch_1fb

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_1ce
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1d5
    .catch Lorg/json/JSONException; {:try_start_1ce .. :try_end_1d5} :catch_1f6

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1ea

    :try_start_1dd
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1e4
    .catch Lorg/json/JSONException; {:try_start_1dd .. :try_end_1e4} :catch_1e5

    goto :goto_1ea

    :catch_1e5
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_203

    :cond_1ea
    :goto_1ea
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_203

    :catch_1f6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_203

    :catch_1fb
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_203

    :cond_200
    invoke-static {}, Lh9o;->p()V

    :cond_203
    :goto_203
    return-void

    :pswitch_204
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_213

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_29e

    :cond_213
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_29b

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lvka;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v6, p1, Lvka;->a:Ljava/lang/String;

    invoke-virtual {v0, v6, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, p1, Lvka;->b:Ljava/lang/String;

    const-string v7, "installationId"

    invoke-virtual {v0, v6, v7}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, p1, Lvka;->c:Ljava/lang/String;

    const-string v7, "countryCode"

    invoke-virtual {v0, v6, v7}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, p1, Lvka;->d:Ljava/lang/String;

    const-string v7, "locale"

    invoke-virtual {v0, v6, v7}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lvka;->e:Lwka;

    new-instance v6, Lorb;

    invoke-direct {v6}, Lorb;-><init>()V

    iget-object v7, p1, Lwka;->a:Ljava/lang/String;

    const-string v8, "version"

    invoke-virtual {v6, v7, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lwka;->b:Ljava/lang/String;

    const-string v7, "name"

    invoke-virtual {v6, p1, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "host"

    invoke-virtual {v0, v6, p1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_29e

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_260
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_267
    .catch Lorg/json/JSONException; {:try_start_260 .. :try_end_267} :catch_296

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_269
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_270
    .catch Lorg/json/JSONException; {:try_start_269 .. :try_end_270} :catch_291

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_285

    :try_start_278
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_27f
    .catch Lorg/json/JSONException; {:try_start_278 .. :try_end_27f} :catch_280

    goto :goto_285

    :catch_280
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_29e

    :cond_285
    :goto_285
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_29e

    :catch_291
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_29e

    :catch_296
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_29e

    :cond_29b
    invoke-static {}, Lh9o;->p()V

    :cond_29e
    :goto_29e
    return-void

    :pswitch_29f
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_2ad

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_2fc

    :cond_2ad
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_2f9

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_2fc

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_2be
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2c5
    .catch Lorg/json/JSONException; {:try_start_2be .. :try_end_2c5} :catch_2f4

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_2c7
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2ce
    .catch Lorg/json/JSONException; {:try_start_2c7 .. :try_end_2ce} :catch_2ef

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e3

    :try_start_2d6
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2dd
    .catch Lorg/json/JSONException; {:try_start_2d6 .. :try_end_2dd} :catch_2de

    goto :goto_2e3

    :catch_2de
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2fc

    :cond_2e3
    :goto_2e3
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_2fc

    :catch_2ef
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2fc

    :catch_2f4
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2fc

    :cond_2f9
    invoke-static {}, Lh9o;->p()V

    :cond_2fc
    :goto_2fc
    return-void

    :pswitch_2fd
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_30b

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v5}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_368

    :cond_30b
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_365

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lbla;

    invoke-virtual {p1}, Lbla;->a()Lorb;

    move-result-object p1

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v6, "state"

    invoke-virtual {v0, p1, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_368

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_32a
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_331
    .catch Lorg/json/JSONException; {:try_start_32a .. :try_end_331} :catch_360

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_333
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_33a
    .catch Lorg/json/JSONException; {:try_start_333 .. :try_end_33a} :catch_35b

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34f

    :try_start_342
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_349
    .catch Lorg/json/JSONException; {:try_start_342 .. :try_end_349} :catch_34a

    goto :goto_34f

    :catch_34a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_368

    :cond_34f
    :goto_34f
    iget-object p0, v5, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_368

    :catch_35b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_368

    :catch_360
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_368

    :cond_365
    invoke-static {}, Lh9o;->p()V

    :cond_368
    :goto_368
    return-void

    nop

    :pswitch_data_36a
    .packed-switch 0x0
        :pswitch_2fd
        :pswitch_29f
        :pswitch_204
        :pswitch_1a6
        :pswitch_148
        :pswitch_cd
        :pswitch_6f
    .end packed-switch
.end method
