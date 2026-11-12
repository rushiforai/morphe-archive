.class public final synthetic Lgka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbqb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgsb;

.field public final synthetic c:Lzy9;


# direct methods
.method public synthetic constructor <init>(Lgsb;Lzy9;B)V
    .registers 4

    iput-byte p3, p0, Lgka;->a:B

    iput-object p1, p0, Lgka;->b:Lgsb;

    iput-object p2, p0, Lgka;->c:Lzy9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final n(Ltw7;)V
    .registers 10

    iget-byte v0, p0, Lgka;->a:B

    const/4 v1, 0x0

    const-string v2, "result"

    const-string v3, "id"

    const-string v4, "2.0"

    const-string v5, "jsonrpc"

    iget-object v6, p0, Lgka;->c:Lzy9;

    iget-object p0, p0, Lgka;->b:Lgsb;

    packed-switch v0, :pswitch_data_40a

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_20

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_6f

    :cond_20
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_6c

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_6f

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_31
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_38
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_38} :catch_67

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_3a
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_3a .. :try_end_41} :catch_62

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    :try_start_49
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_50
    .catch Lorg/json/JSONException; {:try_start_49 .. :try_end_50} :catch_51

    goto :goto_56

    :catch_51
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6f

    :cond_56
    :goto_56
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_6f

    :catch_62
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6f

    :catch_67
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6f

    :cond_6c
    invoke-static {}, Lh9o;->p()V

    :cond_6f
    :goto_6f
    return-void

    :pswitch_70
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_7e

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_cd

    :cond_7e
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_ca

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_cd

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_8f
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_96
    .catch Lorg/json/JSONException; {:try_start_8f .. :try_end_96} :catch_c5

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_98
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9f
    .catch Lorg/json/JSONException; {:try_start_98 .. :try_end_9f} :catch_c0

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b4

    :try_start_a7
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_ae
    .catch Lorg/json/JSONException; {:try_start_a7 .. :try_end_ae} :catch_af

    goto :goto_b4

    :catch_af
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cd

    :cond_b4
    :goto_b4
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_cd

    :catch_c0
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cd

    :catch_c5
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cd

    :cond_ca
    invoke-static {}, Lh9o;->p()V

    :cond_cd
    :goto_cd
    return-void

    :pswitch_ce
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_dc

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_12b

    :cond_dc
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_128

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_12b

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_ed
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_f4
    .catch Lorg/json/JSONException; {:try_start_ed .. :try_end_f4} :catch_123

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_f6
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_fd
    .catch Lorg/json/JSONException; {:try_start_f6 .. :try_end_fd} :catch_11e

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_112

    :try_start_105
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_10c
    .catch Lorg/json/JSONException; {:try_start_105 .. :try_end_10c} :catch_10d

    goto :goto_112

    :catch_10d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_12b

    :cond_112
    :goto_112
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_12b

    :catch_11e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_12b

    :catch_123
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_12b

    :cond_128
    invoke-static {}, Lh9o;->p()V

    :cond_12b
    :goto_12b
    return-void

    :pswitch_12c
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_13a

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_18d

    :cond_13a
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_18a

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lzja;

    invoke-interface {p1}, Lzja;->a()Lorb;

    move-result-object p1

    if-eqz p0, :cond_18d

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_14f
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_156
    .catch Lorg/json/JSONException; {:try_start_14f .. :try_end_156} :catch_185

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_158
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_15f
    .catch Lorg/json/JSONException; {:try_start_158 .. :try_end_15f} :catch_180

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_174

    :try_start_167
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_16e
    .catch Lorg/json/JSONException; {:try_start_167 .. :try_end_16e} :catch_16f

    goto :goto_174

    :catch_16f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_18d

    :cond_174
    :goto_174
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_18d

    :catch_180
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_18d

    :catch_185
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_18d

    :cond_18a
    invoke-static {}, Lh9o;->p()V

    :cond_18d
    :goto_18d
    return-void

    :pswitch_18e
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_19d

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_21b

    :cond_19d
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_218

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Loja;

    iget-byte v0, p1, Loja;->a:B

    packed-switch v0, :pswitch_data_420

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object p1, p1, Loja;->b:Ljava/lang/Object;

    check-cast p1, Lpja;

    sget-object v7, Lpja;->b:Lpja;

    if-eq p1, v7, :cond_1c2

    iget-object p1, p1, Lpja;->a:Ljava/lang/String;

    const-string v1, "error"

    invoke-virtual {v0, p1, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, v0

    goto :goto_1d6

    :cond_1c2
    const-string p1, "Undefined"

    invoke-static {p1}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    goto :goto_1d6

    :pswitch_1c8
    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p1, p1, Loja;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const-string v0, "accessToken"

    invoke-virtual {v1, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_1d6
    if-eqz p0, :cond_21b

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_1dd
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1e4
    .catch Lorg/json/JSONException; {:try_start_1dd .. :try_end_1e4} :catch_213

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_1e6
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1ed
    .catch Lorg/json/JSONException; {:try_start_1e6 .. :try_end_1ed} :catch_20e

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v1, p0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_202

    :try_start_1f5
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1fc
    .catch Lorg/json/JSONException; {:try_start_1f5 .. :try_end_1fc} :catch_1fd

    goto :goto_202

    :catch_1fd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_21b

    :cond_202
    :goto_202
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_21b

    :catch_20e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_21b

    :catch_213
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_21b

    :cond_218
    invoke-static {}, Lh9o;->p()V

    :cond_21b
    :goto_21b
    return-void

    :pswitch_21c
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_22a

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_27f

    :cond_22a
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_27c

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lvja;

    if-eqz p1, :cond_23a

    invoke-interface {p1}, Lvja;->a()Lorb;

    move-result-object v1

    :cond_23a
    if-eqz p0, :cond_27f

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_241
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_248
    .catch Lorg/json/JSONException; {:try_start_241 .. :try_end_248} :catch_277

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_24a
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_251
    .catch Lorg/json/JSONException; {:try_start_24a .. :try_end_251} :catch_272

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_266

    :try_start_259
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_260
    .catch Lorg/json/JSONException; {:try_start_259 .. :try_end_260} :catch_261

    goto :goto_266

    :catch_261
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_27f

    :cond_266
    :goto_266
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_27f

    :catch_272
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_27f

    :catch_277
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_27f

    :cond_27c
    invoke-static {}, Lh9o;->p()V

    :cond_27f
    :goto_27f
    return-void

    :pswitch_280
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_28e

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_2dd

    :cond_28e
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_2da

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_2dd

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_29f
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2a6
    .catch Lorg/json/JSONException; {:try_start_29f .. :try_end_2a6} :catch_2d5

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_2a8
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2af
    .catch Lorg/json/JSONException; {:try_start_2a8 .. :try_end_2af} :catch_2d0

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c4

    :try_start_2b7
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2be
    .catch Lorg/json/JSONException; {:try_start_2b7 .. :try_end_2be} :catch_2bf

    goto :goto_2c4

    :catch_2bf
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2dd

    :cond_2c4
    :goto_2c4
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_2dd

    :catch_2d0
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2dd

    :catch_2d5
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2dd

    :cond_2da
    invoke-static {}, Lh9o;->p()V

    :cond_2dd
    :goto_2dd
    return-void

    :pswitch_2de
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_2ec

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_33b

    :cond_2ec
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_338

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_33b

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_2fd
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_304
    .catch Lorg/json/JSONException; {:try_start_2fd .. :try_end_304} :catch_333

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_306
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_30d
    .catch Lorg/json/JSONException; {:try_start_306 .. :try_end_30d} :catch_32e

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_322

    :try_start_315
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_31c
    .catch Lorg/json/JSONException; {:try_start_315 .. :try_end_31c} :catch_31d

    goto :goto_322

    :catch_31d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_33b

    :cond_322
    :goto_322
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_33b

    :catch_32e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_33b

    :catch_333
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_33b

    :cond_338
    invoke-static {}, Lh9o;->p()V

    :cond_33b
    :goto_33b
    return-void

    :pswitch_33c
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_34a

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_399

    :cond_34a
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_396

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-eqz p0, :cond_399

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_35b
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_362
    .catch Lorg/json/JSONException; {:try_start_35b .. :try_end_362} :catch_391

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_364
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_36b
    .catch Lorg/json/JSONException; {:try_start_364 .. :try_end_36b} :catch_38c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_380

    :try_start_373
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_37a
    .catch Lorg/json/JSONException; {:try_start_373 .. :try_end_37a} :catch_37b

    goto :goto_380

    :catch_37b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_399

    :cond_380
    :goto_380
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_399

    :catch_38c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_399

    :catch_391
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_399

    :cond_396
    invoke-static {}, Lh9o;->p()V

    :cond_399
    :goto_399
    return-void

    :pswitch_39a
    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_3a8

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {p0, p1, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_409

    :cond_3a8
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_406

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Laka;

    if-eqz p1, :cond_3c4

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p1, p1, Laka;->a:Lsfb;

    invoke-virtual {p1}, Lsfb;->a()Lorb;

    move-result-object p1

    const-string v0, "chat"

    invoke-virtual {v1, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3c4
    if-eqz p0, :cond_409

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_3cb
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3d2
    .catch Lorg/json/JSONException; {:try_start_3cb .. :try_end_3d2} :catch_401

    iget-object p0, p0, Lgsb;->a:Ljava/lang/Object;

    :try_start_3d4
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3db
    .catch Lorg/json/JSONException; {:try_start_3d4 .. :try_end_3db} :catch_3fc

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3f0

    :try_start_3e3
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3ea
    .catch Lorg/json/JSONException; {:try_start_3e3 .. :try_end_3ea} :catch_3eb

    goto :goto_3f0

    :catch_3eb
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_409

    :cond_3f0
    :goto_3f0
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_409

    :catch_3fc
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_409

    :catch_401
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_409

    :cond_406
    invoke-static {}, Lh9o;->p()V

    :cond_409
    :goto_409
    return-void

    :pswitch_data_40a
    .packed-switch 0x0
        :pswitch_39a
        :pswitch_33c
        :pswitch_2de
        :pswitch_280
        :pswitch_21c
        :pswitch_18e
        :pswitch_12c
        :pswitch_ce
        :pswitch_70
    .end packed-switch

    :pswitch_data_420
    .packed-switch 0x0
        :pswitch_1c8
    .end packed-switch
.end method
