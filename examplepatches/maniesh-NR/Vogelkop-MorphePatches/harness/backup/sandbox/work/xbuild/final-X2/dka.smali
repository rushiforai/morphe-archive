.class public final synthetic Ldka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbqb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgsb;

.field public final synthetic c:Lqq6;


# direct methods
.method public synthetic constructor <init>(Lgsb;Lqq6;B)V
    .registers 4

    iput-byte p3, p0, Ldka;->a:B

    iput-object p1, p0, Ldka;->b:Lgsb;

    iput-object p2, p0, Ldka;->c:Lqq6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final n(Ltw7;)V
    .registers 14

    iget-byte v0, p0, Ldka;->a:B

    const-string v1, "error"

    const-string v2, "message"

    const-string v3, "code"

    const/4 v4, 0x0

    const-string v5, "result"

    const-string v6, "id"

    const-string v7, "2.0"

    const-string v8, "jsonrpc"

    iget-object v9, p0, Ldka;->c:Lqq6;

    iget-object p0, p0, Ldka;->b:Lgsb;

    packed-switch v0, :pswitch_data_8a6

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_26

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_75

    :cond_26
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_72

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_75

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_37
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3e
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_3e} :catch_6d

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_40
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_47
    .catch Lorg/json/JSONException; {:try_start_40 .. :try_end_47} :catch_68

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5c

    :try_start_4f
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_56
    .catch Lorg/json/JSONException; {:try_start_4f .. :try_end_56} :catch_57

    goto :goto_5c

    :catch_57
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_75

    :cond_5c
    :goto_5c
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_75

    :catch_68
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_75

    :catch_6d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_75

    :cond_72
    invoke-static {}, Lh9o;->p()V

    :cond_75
    :goto_75
    return-void

    :pswitch_76
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_84

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_e1

    :cond_84
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_de

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lcla;

    invoke-virtual {p1}, Lcla;->a()Lorb;

    move-result-object p1

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "state"

    invoke-virtual {v0, p1, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_e1

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_a3
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_aa
    .catch Lorg/json/JSONException; {:try_start_a3 .. :try_end_aa} :catch_d9

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_ac
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_b3
    .catch Lorg/json/JSONException; {:try_start_ac .. :try_end_b3} :catch_d4

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c8

    :try_start_bb
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_c2
    .catch Lorg/json/JSONException; {:try_start_bb .. :try_end_c2} :catch_c3

    goto :goto_c8

    :catch_c3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_e1

    :cond_c8
    :goto_c8
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_e1

    :catch_d4
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_e1

    :catch_d9
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_e1

    :cond_de
    invoke-static {}, Lh9o;->p()V

    :cond_e1
    :goto_e1
    return-void

    :pswitch_e2
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_f0

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_15a

    :cond_f0
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_157

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Llia;

    if-eqz p1, :cond_115

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object p1, p1, Llia;->a:Lmia;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-wide v10, p1, Lmia;->a:J

    invoke-virtual {v0, v10, v11, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-object p1, p1, Lmia;->b:Ljava/lang/String;

    invoke-virtual {v0, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_115
    if-eqz p0, :cond_15a

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_11c
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_123
    .catch Lorg/json/JSONException; {:try_start_11c .. :try_end_123} :catch_152

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_125
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_12c
    .catch Lorg/json/JSONException; {:try_start_125 .. :try_end_12c} :catch_14d

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_141

    :try_start_134
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_13b
    .catch Lorg/json/JSONException; {:try_start_134 .. :try_end_13b} :catch_13c

    goto :goto_141

    :catch_13c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_15a

    :cond_141
    :goto_141
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_15a

    :catch_14d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_15a

    :catch_152
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_15a

    :cond_157
    invoke-static {}, Lh9o;->p()V

    :cond_15a
    :goto_15a
    return-void

    :pswitch_15b
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_169

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_1d3

    :cond_169
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_1d0

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lcia;

    if-eqz p1, :cond_18e

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object p1, p1, Lcia;->a:Ldia;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-wide v10, p1, Ldia;->a:J

    invoke-virtual {v0, v10, v11, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-object p1, p1, Ldia;->b:Ljava/lang/String;

    invoke-virtual {v0, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_18e
    if-eqz p0, :cond_1d3

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_195
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_19c
    .catch Lorg/json/JSONException; {:try_start_195 .. :try_end_19c} :catch_1cb

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_19e
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a5
    .catch Lorg/json/JSONException; {:try_start_19e .. :try_end_1a5} :catch_1c6

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1ba

    :try_start_1ad
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1b4
    .catch Lorg/json/JSONException; {:try_start_1ad .. :try_end_1b4} :catch_1b5

    goto :goto_1ba

    :catch_1b5
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1d3

    :cond_1ba
    :goto_1ba
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_1d3

    :catch_1c6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1d3

    :catch_1cb
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1d3

    :cond_1d0
    invoke-static {}, Lh9o;->p()V

    :cond_1d3
    :goto_1d3
    return-void

    :pswitch_1d4
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_1e2

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_24c

    :cond_1e2
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_249

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Leia;

    if-eqz p1, :cond_207

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object p1, p1, Leia;->a:Lfia;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-wide v10, p1, Lfia;->a:J

    invoke-virtual {v0, v10, v11, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-object p1, p1, Lfia;->b:Ljava/lang/String;

    invoke-virtual {v0, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_207
    if-eqz p0, :cond_24c

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_20e
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_215
    .catch Lorg/json/JSONException; {:try_start_20e .. :try_end_215} :catch_244

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_217
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_21e
    .catch Lorg/json/JSONException; {:try_start_217 .. :try_end_21e} :catch_23f

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_233

    :try_start_226
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_22d
    .catch Lorg/json/JSONException; {:try_start_226 .. :try_end_22d} :catch_22e

    goto :goto_233

    :catch_22e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_24c

    :cond_233
    :goto_233
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_24c

    :catch_23f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_24c

    :catch_244
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_24c

    :cond_249
    invoke-static {}, Lh9o;->p()V

    :cond_24c
    :goto_24c
    return-void

    :pswitch_24d
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_25b

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_2ae

    :cond_25b
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_2ab

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v6, p1}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p1

    if-eqz p0, :cond_2ae

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_270
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_277
    .catch Lorg/json/JSONException; {:try_start_270 .. :try_end_277} :catch_2a6

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_279
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_280
    .catch Lorg/json/JSONException; {:try_start_279 .. :try_end_280} :catch_2a1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_295

    :try_start_288
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_28f
    .catch Lorg/json/JSONException; {:try_start_288 .. :try_end_28f} :catch_290

    goto :goto_295

    :catch_290
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2ae

    :cond_295
    :goto_295
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_2ae

    :catch_2a1
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2ae

    :catch_2a6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2ae

    :cond_2ab
    invoke-static {}, Lh9o;->p()V

    :cond_2ae
    :goto_2ae
    return-void

    :pswitch_2af
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_2be

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_349

    :cond_2be
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_346

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lsha;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p1, Lsha;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Lsha;->b:Ljava/lang/String;

    const-string v2, "installationId"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Lsha;->c:Ljava/lang/String;

    const-string v2, "countryCode"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Lsha;->d:Ljava/lang/String;

    const-string v2, "locale"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lsha;->e:Lvha;

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object v2, p1, Lvha;->a:Ljava/lang/String;

    const-string v3, "version"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lvha;->b:Ljava/lang/String;

    const-string v2, "name"

    invoke-virtual {v1, p1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "host"

    invoke-virtual {v0, v1, p1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_349

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_30b
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_312
    .catch Lorg/json/JSONException; {:try_start_30b .. :try_end_312} :catch_341

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_314
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_31b
    .catch Lorg/json/JSONException; {:try_start_314 .. :try_end_31b} :catch_33c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_330

    :try_start_323
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_32a
    .catch Lorg/json/JSONException; {:try_start_323 .. :try_end_32a} :catch_32b

    goto :goto_330

    :catch_32b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_349

    :cond_330
    :goto_330
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_349

    :catch_33c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_349

    :catch_341
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_349

    :cond_346
    invoke-static {}, Lh9o;->p()V

    :cond_349
    :goto_349
    return-void

    :pswitch_34a
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_359

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_3d1

    :cond_359
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_3ce

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lrha;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p1, Lrha;->a:Ljava/lang/String;

    const-string v2, "oscore"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Lrha;->b:Ljava/lang/String;

    const-string v2, "oscoreWss"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p1, Lrha;->c:Ljava/lang/String;

    const-string v2, "ftOscore"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p1, Lrha;->d:Ljava/lang/String;

    const-string v1, "apex"

    invoke-virtual {v0, p1, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "news"

    invoke-virtual {v0, v4, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_3d1

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_393
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_39a
    .catch Lorg/json/JSONException; {:try_start_393 .. :try_end_39a} :catch_3c9

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_39c
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3a3
    .catch Lorg/json/JSONException; {:try_start_39c .. :try_end_3a3} :catch_3c4

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3b8

    :try_start_3ab
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3b2
    .catch Lorg/json/JSONException; {:try_start_3ab .. :try_end_3b2} :catch_3b3

    goto :goto_3b8

    :catch_3b3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_3d1

    :cond_3b8
    :goto_3b8
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_3d1

    :catch_3c4
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_3d1

    :catch_3c9
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_3d1

    :cond_3ce
    invoke-static {}, Lh9o;->p()V

    :cond_3d1
    :goto_3d1
    return-void

    :pswitch_3d2
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_3e0

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_42f

    :cond_3e0
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_42c

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_42f

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_3f1
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3f8
    .catch Lorg/json/JSONException; {:try_start_3f1 .. :try_end_3f8} :catch_427

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_3fa
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_401
    .catch Lorg/json/JSONException; {:try_start_3fa .. :try_end_401} :catch_422

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_416

    :try_start_409
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_410
    .catch Lorg/json/JSONException; {:try_start_409 .. :try_end_410} :catch_411

    goto :goto_416

    :catch_411
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_42f

    :cond_416
    :goto_416
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_42f

    :catch_422
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_42f

    :catch_427
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_42f

    :cond_42c
    invoke-static {}, Lh9o;->p()V

    :cond_42f
    :goto_42f
    return-void

    :pswitch_430
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_43e

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_48d

    :cond_43e
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_48a

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_48d

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_44f
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_456
    .catch Lorg/json/JSONException; {:try_start_44f .. :try_end_456} :catch_485

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_458
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_45f
    .catch Lorg/json/JSONException; {:try_start_458 .. :try_end_45f} :catch_480

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_474

    :try_start_467
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_46e
    .catch Lorg/json/JSONException; {:try_start_467 .. :try_end_46e} :catch_46f

    goto :goto_474

    :catch_46f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_48d

    :cond_474
    :goto_474
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_48d

    :catch_480
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_48d

    :catch_485
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_48d

    :cond_48a
    invoke-static {}, Lh9o;->p()V

    :cond_48d
    :goto_48d
    return-void

    :pswitch_48e
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_49c

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_4eb

    :cond_49c
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_4e8

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_4eb

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_4ad
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4b4
    .catch Lorg/json/JSONException; {:try_start_4ad .. :try_end_4b4} :catch_4e3

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_4b6
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4bd
    .catch Lorg/json/JSONException; {:try_start_4b6 .. :try_end_4bd} :catch_4de

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4d2

    :try_start_4c5
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4cc
    .catch Lorg/json/JSONException; {:try_start_4c5 .. :try_end_4cc} :catch_4cd

    goto :goto_4d2

    :catch_4cd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_4eb

    :cond_4d2
    :goto_4d2
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_4eb

    :catch_4de
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_4eb

    :catch_4e3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_4eb

    :cond_4e8
    invoke-static {}, Lh9o;->p()V

    :cond_4eb
    :goto_4eb
    return-void

    :pswitch_4ec
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_4fa

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_549

    :cond_4fa
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_546

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_549

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_50b
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_512
    .catch Lorg/json/JSONException; {:try_start_50b .. :try_end_512} :catch_541

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_514
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_51b
    .catch Lorg/json/JSONException; {:try_start_514 .. :try_end_51b} :catch_53c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_530

    :try_start_523
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_52a
    .catch Lorg/json/JSONException; {:try_start_523 .. :try_end_52a} :catch_52b

    goto :goto_530

    :catch_52b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_549

    :cond_530
    :goto_530
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_549

    :catch_53c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_549

    :catch_541
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_549

    :cond_546
    invoke-static {}, Lh9o;->p()V

    :cond_549
    :goto_549
    return-void

    :pswitch_54a
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_558

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_5a7

    :cond_558
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_5a4

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_5a7

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_569
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_570
    .catch Lorg/json/JSONException; {:try_start_569 .. :try_end_570} :catch_59f

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_572
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_579
    .catch Lorg/json/JSONException; {:try_start_572 .. :try_end_579} :catch_59a

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_58e

    :try_start_581
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_588
    .catch Lorg/json/JSONException; {:try_start_581 .. :try_end_588} :catch_589

    goto :goto_58e

    :catch_589
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_5a7

    :cond_58e
    :goto_58e
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_5a7

    :catch_59a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_5a7

    :catch_59f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_5a7

    :cond_5a4
    invoke-static {}, Lh9o;->p()V

    :cond_5a7
    :goto_5a7
    return-void

    :pswitch_5a8
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_5b6

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_605

    :cond_5b6
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_602

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_605

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_5c7
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5ce
    .catch Lorg/json/JSONException; {:try_start_5c7 .. :try_end_5ce} :catch_5fd

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_5d0
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5d7
    .catch Lorg/json/JSONException; {:try_start_5d0 .. :try_end_5d7} :catch_5f8

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5ec

    :try_start_5df
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5e6
    .catch Lorg/json/JSONException; {:try_start_5df .. :try_end_5e6} :catch_5e7

    goto :goto_5ec

    :catch_5e7
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_605

    :cond_5ec
    :goto_5ec
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_605

    :catch_5f8
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_605

    :catch_5fd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_605

    :cond_602
    invoke-static {}, Lh9o;->p()V

    :cond_605
    :goto_605
    return-void

    :pswitch_606
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_614

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_663

    :cond_614
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_660

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_663

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_625
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_62c
    .catch Lorg/json/JSONException; {:try_start_625 .. :try_end_62c} :catch_65b

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_62e
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_635
    .catch Lorg/json/JSONException; {:try_start_62e .. :try_end_635} :catch_656

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64a

    :try_start_63d
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_644
    .catch Lorg/json/JSONException; {:try_start_63d .. :try_end_644} :catch_645

    goto :goto_64a

    :catch_645
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_663

    :cond_64a
    :goto_64a
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_663

    :catch_656
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_663

    :catch_65b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_663

    :cond_660
    invoke-static {}, Lh9o;->p()V

    :cond_663
    :goto_663
    return-void

    :pswitch_664
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_672

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_6c1

    :cond_672
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_6be

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_6c1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_683
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_68a
    .catch Lorg/json/JSONException; {:try_start_683 .. :try_end_68a} :catch_6b9

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_68c
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_693
    .catch Lorg/json/JSONException; {:try_start_68c .. :try_end_693} :catch_6b4

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6a8

    :try_start_69b
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6a2
    .catch Lorg/json/JSONException; {:try_start_69b .. :try_end_6a2} :catch_6a3

    goto :goto_6a8

    :catch_6a3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6c1

    :cond_6a8
    :goto_6a8
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_6c1

    :catch_6b4
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6c1

    :catch_6b9
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6c1

    :cond_6be
    invoke-static {}, Lh9o;->p()V

    :cond_6c1
    :goto_6c1
    return-void

    :pswitch_6c2
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_6d0

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_71f

    :cond_6d0
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_71c

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_71f

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_6e1
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6e8
    .catch Lorg/json/JSONException; {:try_start_6e1 .. :try_end_6e8} :catch_717

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_6ea
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6f1
    .catch Lorg/json/JSONException; {:try_start_6ea .. :try_end_6f1} :catch_712

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_706

    :try_start_6f9
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_700
    .catch Lorg/json/JSONException; {:try_start_6f9 .. :try_end_700} :catch_701

    goto :goto_706

    :catch_701
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_71f

    :cond_706
    :goto_706
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_71f

    :catch_712
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_71f

    :catch_717
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_71f

    :cond_71c
    invoke-static {}, Lh9o;->p()V

    :cond_71f
    :goto_71f
    return-void

    :pswitch_720
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_72e

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_77d

    :cond_72e
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_77a

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_77d

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_73f
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_746
    .catch Lorg/json/JSONException; {:try_start_73f .. :try_end_746} :catch_775

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_748
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_74f
    .catch Lorg/json/JSONException; {:try_start_748 .. :try_end_74f} :catch_770

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_764

    :try_start_757
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_75e
    .catch Lorg/json/JSONException; {:try_start_757 .. :try_end_75e} :catch_75f

    goto :goto_764

    :catch_75f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_77d

    :cond_764
    :goto_764
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_77d

    :catch_770
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_77d

    :catch_775
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_77d

    :cond_77a
    invoke-static {}, Lh9o;->p()V

    :cond_77d
    :goto_77d
    return-void

    :pswitch_77e
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_78c

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_7db

    :cond_78c
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_7d8

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_7db

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_79d
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7a4
    .catch Lorg/json/JSONException; {:try_start_79d .. :try_end_7a4} :catch_7d3

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_7a6
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7ad
    .catch Lorg/json/JSONException; {:try_start_7a6 .. :try_end_7ad} :catch_7ce

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7c2

    :try_start_7b5
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7bc
    .catch Lorg/json/JSONException; {:try_start_7b5 .. :try_end_7bc} :catch_7bd

    goto :goto_7c2

    :catch_7bd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_7db

    :cond_7c2
    :goto_7c2
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_7db

    :catch_7ce
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_7db

    :catch_7d3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_7db

    :cond_7d8
    invoke-static {}, Lh9o;->p()V

    :cond_7db
    :goto_7db
    return-void

    :pswitch_7dc
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_7ea

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_839

    :cond_7ea
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_836

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_839

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_7fb
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v8, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_802
    .catch Lorg/json/JSONException; {:try_start_7fb .. :try_end_802} :catch_831

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_804
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_80b
    .catch Lorg/json/JSONException; {:try_start_804 .. :try_end_80b} :catch_82c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_820

    :try_start_813
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_81a
    .catch Lorg/json/JSONException; {:try_start_813 .. :try_end_81a} :catch_81b

    goto :goto_820

    :catch_81b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_839

    :cond_820
    :goto_820
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_839

    :catch_82c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_839

    :catch_831
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_839

    :cond_836
    invoke-static {}, Lh9o;->p()V

    :cond_839
    :goto_839
    return-void

    :pswitch_83a
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_848

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v9}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_8a5

    :cond_848
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_8a2

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lska;

    if-eqz p1, :cond_860

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object p1, p1, Lska;->a:Ljava/lang/String;

    const-string v0, "value"

    invoke-virtual {v4, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_860
    if-eqz p0, :cond_8a5

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_867
    invoke-static {v7}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_86e
    .catch Lorg/json/JSONException; {:try_start_867 .. :try_end_86e} :catch_89d

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_870
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_877
    .catch Lorg/json/JSONException; {:try_start_870 .. :try_end_877} :catch_898

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v4, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_88c

    :try_start_87f
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_886
    .catch Lorg/json/JSONException; {:try_start_87f .. :try_end_886} :catch_887

    goto :goto_88c

    :catch_887
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_8a5

    :cond_88c
    :goto_88c
    iget-object p0, v9, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_8a5

    :catch_898
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_8a5

    :catch_89d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_8a5

    :cond_8a2
    invoke-static {}, Lh9o;->p()V

    :cond_8a5
    :goto_8a5
    return-void

    :pswitch_data_8a6
    .packed-switch 0x0
        :pswitch_83a
        :pswitch_7dc
        :pswitch_77e
        :pswitch_720
        :pswitch_6c2
        :pswitch_664
        :pswitch_606
        :pswitch_5a8
        :pswitch_54a
        :pswitch_4ec
        :pswitch_48e
        :pswitch_430
        :pswitch_3d2
        :pswitch_34a
        :pswitch_2af
        :pswitch_24d
        :pswitch_1d4
        :pswitch_15b
        :pswitch_e2
        :pswitch_76
    .end packed-switch
.end method
