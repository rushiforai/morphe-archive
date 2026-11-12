.class public final synthetic Lfka;
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

    iput-byte p3, p0, Lfka;->a:B

    iput-object p1, p0, Lfka;->b:Lgsb;

    iput-object p2, p0, Lfka;->c:Lzy9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Ltw7;)V
    .registers 6

    instance-of v0, p1, Lrw7;

    iget-object v1, p0, Lfka;->b:Lgsb;

    iget-object p0, p0, Lfka;->c:Lzy9;

    if-eqz v0, :cond_12

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {v1, p1, p0}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    return-void

    :cond_12
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_8a

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_25
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_25

    :cond_35
    new-instance p1, Lorb;

    invoke-direct {p1}, Lorb;-><init>()V

    const-string v2, "shortUrls"

    invoke-virtual {p1, v0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez v1, :cond_42

    return-void

    :cond_42
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    :try_start_4b
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_52
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_52} :catch_85

    const-string v2, "id"

    iget-object v1, v1, Lgsb;->a:Ljava/lang/Object;

    :try_start_56
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5d
    .catch Lorg/json/JSONException; {:try_start_56 .. :try_end_5d} :catch_80

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, v1}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_74

    const-string v1, "result"

    :try_start_67
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6e
    .catch Lorg/json/JSONException; {:try_start_67 .. :try_end_6e} :catch_6f

    goto :goto_74

    :catch_6f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_74
    :goto_74
    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :catch_80
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_85
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_8a
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private final b(Ltw7;)V
    .registers 6

    instance-of v0, p1, Lrw7;

    iget-object v1, p0, Lfka;->b:Lgsb;

    iget-object p0, p0, Lfka;->c:Lzy9;

    if-eqz v0, :cond_12

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {v1, p1, p0}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    return-void

    :cond_12
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_67

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-nez v1, :cond_1f

    return-void

    :cond_1f
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    :try_start_28
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2f
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2f} :catch_62

    const-string v2, "id"

    iget-object v1, v1, Lgsb;->a:Ljava/lang/Object;

    :try_start_33
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3a
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_3a} :catch_5d

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_51

    const-string v1, "result"

    :try_start_44
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4b
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_4b} :catch_4c

    goto :goto_51

    :catch_4c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_51
    :goto_51
    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :catch_5d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_62
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_67
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private final c(Ltw7;)V
    .registers 6

    instance-of v0, p1, Lrw7;

    iget-object v1, p0, Lfka;->b:Lgsb;

    iget-object p0, p0, Lfka;->c:Lzy9;

    if-eqz v0, :cond_12

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {v1, p1, p0}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    return-void

    :cond_12
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_6d

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const-string v0, "key"

    invoke-static {v0, p1}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p1

    if-nez v1, :cond_25

    return-void

    :cond_25
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    :try_start_2e
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_2e .. :try_end_35} :catch_68

    const-string v2, "id"

    iget-object v1, v1, Lgsb;->a:Ljava/lang/Object;

    :try_start_39
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_40} :catch_63

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, v1}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_57

    const-string v1, "result"

    :try_start_4a
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_4a .. :try_end_51} :catch_52

    goto :goto_57

    :catch_52
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_57
    :goto_57
    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :catch_63
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_68
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_6d
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private final d(Ltw7;)V
    .registers 6

    instance-of v0, p1, Lrw7;

    iget-object v1, p0, Lfka;->b:Lgsb;

    iget-object p0, p0, Lfka;->c:Lzy9;

    if-eqz v0, :cond_12

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {v1, p1, p0}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    return-void

    :cond_12
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_67

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lkotlin/Unit;

    if-nez v1, :cond_1f

    return-void

    :cond_1f
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    :try_start_28
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2f
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_2f} :catch_62

    const-string v2, "id"

    iget-object v1, v1, Lgsb;->a:Ljava/lang/Object;

    :try_start_33
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3a
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_3a} :catch_5d

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_51

    const-string v1, "result"

    :try_start_44
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4b
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_4b} :catch_4c

    goto :goto_51

    :catch_4c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_51
    :goto_51
    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :catch_5d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_62
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_67
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private final e(Ltw7;)V
    .registers 6

    instance-of v0, p1, Lrw7;

    iget-object v1, p0, Lfka;->b:Lgsb;

    iget-object p0, p0, Lfka;->c:Lzy9;

    if-eqz v0, :cond_12

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    invoke-static {v1, p1, p0}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    return-void

    :cond_12
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_6b

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljka;

    invoke-interface {p1}, Ljka;->a()Lorb;

    move-result-object p1

    if-nez v1, :cond_23

    return-void

    :cond_23
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "jsonrpc"

    const-string v3, "2.0"

    :try_start_2c
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_33
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_33} :catch_66

    const-string v2, "id"

    iget-object v1, v1, Lgsb;->a:Ljava/lang/Object;

    :try_start_37
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3e
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_3e} :catch_61

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, v1}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "result"

    :try_start_48
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4f
    .catch Lorg/json/JSONException; {:try_start_48 .. :try_end_4f} :catch_50

    goto :goto_55

    :catch_50
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_55
    :goto_55
    iget-object p0, p0, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :catch_61
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :catch_66
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void

    :cond_6b
    invoke-static {}, Lh9o;->p()V

    return-void
.end method


# virtual methods
.method public final n(Ltw7;)V
    .registers 12

    iget-byte v0, p0, Lfka;->a:B

    const/4 v1, 0x0

    const-string v2, "result"

    const-string v3, "id"

    const-string v4, "2.0"

    const-string v5, "jsonrpc"

    iget-object v6, p0, Lfka;->c:Lzy9;

    iget-object v7, p0, Lfka;->b:Lgsb;

    packed-switch v0, :pswitch_data_a52

    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_21

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_99

    :cond_21
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_96

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    new-instance p1, Lvpb;

    invoke-direct {p1}, Lvpb;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_34
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iget-object v8, p1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    goto :goto_34

    :cond_4a
    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    const-string v0, "chats"

    invoke-virtual {p0, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v7, :cond_99

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_5b
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_62
    .catch Lorg/json/JSONException; {:try_start_5b .. :try_end_62} :catch_91

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_64
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6b
    .catch Lorg/json/JSONException; {:try_start_64 .. :try_end_6b} :catch_8c

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, v0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_80

    :try_start_73
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7a
    .catch Lorg/json/JSONException; {:try_start_73 .. :try_end_7a} :catch_7b

    goto :goto_80

    :catch_7b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_99

    :cond_80
    :goto_80
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_99

    :catch_8c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_99

    :catch_91
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_99

    :cond_96
    invoke-static {}, Lh9o;->p()V

    :cond_99
    :goto_99
    return-void

    :pswitch_9a
    invoke-direct {p0, p1}, Lfka;->e(Ltw7;)V

    return-void

    :pswitch_9e
    invoke-direct {p0, p1}, Lfka;->d(Ltw7;)V

    return-void

    :pswitch_a2
    invoke-direct {p0, p1}, Lfka;->c(Ltw7;)V

    return-void

    :pswitch_a6
    invoke-direct {p0, p1}, Lfka;->b(Ltw7;)V

    return-void

    :pswitch_aa
    invoke-direct {p0, p1}, Lfka;->a(Ltw7;)V

    return-void

    :pswitch_ae
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_bc

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_10b

    :cond_bc
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_108

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_10b

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_cd
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_d4
    .catch Lorg/json/JSONException; {:try_start_cd .. :try_end_d4} :catch_103

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_d6
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_dd
    .catch Lorg/json/JSONException; {:try_start_d6 .. :try_end_dd} :catch_fe

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f2

    :try_start_e5
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_ec
    .catch Lorg/json/JSONException; {:try_start_e5 .. :try_end_ec} :catch_ed

    goto :goto_f2

    :catch_ed
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_10b

    :cond_f2
    :goto_f2
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_10b

    :catch_fe
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_10b

    :catch_103
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_10b

    :cond_108
    invoke-static {}, Lh9o;->p()V

    :cond_10b
    :goto_10b
    return-void

    :pswitch_10c
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_11a

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_169

    :cond_11a
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_166

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_169

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_12b
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_132
    .catch Lorg/json/JSONException; {:try_start_12b .. :try_end_132} :catch_161

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_134
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_13b
    .catch Lorg/json/JSONException; {:try_start_134 .. :try_end_13b} :catch_15c

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_150

    :try_start_143
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_14a
    .catch Lorg/json/JSONException; {:try_start_143 .. :try_end_14a} :catch_14b

    goto :goto_150

    :catch_14b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_169

    :cond_150
    :goto_150
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_169

    :catch_15c
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_169

    :catch_161
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_169

    :cond_166
    invoke-static {}, Lh9o;->p()V

    :cond_169
    :goto_169
    return-void

    :pswitch_16a
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_178

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_1d5

    :cond_178
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_1d2

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lela;

    invoke-virtual {p0}, Lela;->a()Lorb;

    move-result-object p0

    new-instance p1, Lorb;

    invoke-direct {p1}, Lorb;-><init>()V

    const-string v0, "state"

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v7, :cond_1d5

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_197
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_19e
    .catch Lorg/json/JSONException; {:try_start_197 .. :try_end_19e} :catch_1cd

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_1a0
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1a7
    .catch Lorg/json/JSONException; {:try_start_1a0 .. :try_end_1a7} :catch_1c8

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, v0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1bc

    :try_start_1af
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1b6
    .catch Lorg/json/JSONException; {:try_start_1af .. :try_end_1b6} :catch_1b7

    goto :goto_1bc

    :catch_1b7
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1d5

    :cond_1bc
    :goto_1bc
    iget-object p1, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lilm;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_1d5

    :catch_1c8
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1d5

    :catch_1cd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_1d5

    :cond_1d2
    invoke-static {}, Lh9o;->p()V

    :cond_1d5
    :goto_1d5
    return-void

    :pswitch_1d6
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_1e4

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_233

    :cond_1e4
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_230

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_233

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_1f5
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1fc
    .catch Lorg/json/JSONException; {:try_start_1f5 .. :try_end_1fc} :catch_22b

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_1fe
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_205
    .catch Lorg/json/JSONException; {:try_start_1fe .. :try_end_205} :catch_226

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21a

    :try_start_20d
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_214
    .catch Lorg/json/JSONException; {:try_start_20d .. :try_end_214} :catch_215

    goto :goto_21a

    :catch_215
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_233

    :cond_21a
    :goto_21a
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_233

    :catch_226
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_233

    :catch_22b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_233

    :cond_230
    invoke-static {}, Lh9o;->p()V

    :cond_233
    :goto_233
    return-void

    :pswitch_234
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_242

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_291

    :cond_242
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_28e

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_291

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_253
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_25a
    .catch Lorg/json/JSONException; {:try_start_253 .. :try_end_25a} :catch_289

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_25c
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_263
    .catch Lorg/json/JSONException; {:try_start_25c .. :try_end_263} :catch_284

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_278

    :try_start_26b
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_272
    .catch Lorg/json/JSONException; {:try_start_26b .. :try_end_272} :catch_273

    goto :goto_278

    :catch_273
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_291

    :cond_278
    :goto_278
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_291

    :catch_284
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_291

    :catch_289
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_291

    :cond_28e
    invoke-static {}, Lh9o;->p()V

    :cond_291
    :goto_291
    return-void

    :pswitch_292
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_2a0

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_2ef

    :cond_2a0
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_2ec

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_2ef

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_2b1
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2b8
    .catch Lorg/json/JSONException; {:try_start_2b1 .. :try_end_2b8} :catch_2e7

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_2ba
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2c1
    .catch Lorg/json/JSONException; {:try_start_2ba .. :try_end_2c1} :catch_2e2

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d6

    :try_start_2c9
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2d0
    .catch Lorg/json/JSONException; {:try_start_2c9 .. :try_end_2d0} :catch_2d1

    goto :goto_2d6

    :catch_2d1
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2ef

    :cond_2d6
    :goto_2d6
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_2ef

    :catch_2e2
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2ef

    :catch_2e7
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_2ef

    :cond_2ec
    invoke-static {}, Lh9o;->p()V

    :cond_2ef
    :goto_2ef
    return-void

    :pswitch_2f0
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_2fe

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_34d

    :cond_2fe
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_34a

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_34d

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_30f
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_316
    .catch Lorg/json/JSONException; {:try_start_30f .. :try_end_316} :catch_345

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_318
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_31f
    .catch Lorg/json/JSONException; {:try_start_318 .. :try_end_31f} :catch_340

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_334

    :try_start_327
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_32e
    .catch Lorg/json/JSONException; {:try_start_327 .. :try_end_32e} :catch_32f

    goto :goto_334

    :catch_32f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_34d

    :cond_334
    :goto_334
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_34d

    :catch_340
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_34d

    :catch_345
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_34d

    :cond_34a
    invoke-static {}, Lh9o;->p()V

    :cond_34d
    :goto_34d
    return-void

    :pswitch_34e
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_35c

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_3ab

    :cond_35c
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_3a8

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_3ab

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_36d
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_374
    .catch Lorg/json/JSONException; {:try_start_36d .. :try_end_374} :catch_3a3

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_376
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_37d
    .catch Lorg/json/JSONException; {:try_start_376 .. :try_end_37d} :catch_39e

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_392

    :try_start_385
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_38c
    .catch Lorg/json/JSONException; {:try_start_385 .. :try_end_38c} :catch_38d

    goto :goto_392

    :catch_38d
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_3ab

    :cond_392
    :goto_392
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_3ab

    :catch_39e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_3ab

    :catch_3a3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_3ab

    :cond_3a8
    invoke-static {}, Lh9o;->p()V

    :cond_3ab
    :goto_3ab
    return-void

    :pswitch_3ac
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_3ba

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_409

    :cond_3ba
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_406

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_409

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_3cb
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3d2
    .catch Lorg/json/JSONException; {:try_start_3cb .. :try_end_3d2} :catch_401

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_3d4
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3db
    .catch Lorg/json/JSONException; {:try_start_3d4 .. :try_end_3db} :catch_3fc

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f0

    :try_start_3e3
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

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

    :pswitch_40a
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_418

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_467

    :cond_418
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_464

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_467

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_429
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_430
    .catch Lorg/json/JSONException; {:try_start_429 .. :try_end_430} :catch_45f

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_432
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_439
    .catch Lorg/json/JSONException; {:try_start_432 .. :try_end_439} :catch_45a

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44e

    :try_start_441
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_448
    .catch Lorg/json/JSONException; {:try_start_441 .. :try_end_448} :catch_449

    goto :goto_44e

    :catch_449
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_467

    :cond_44e
    :goto_44e
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_467

    :catch_45a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_467

    :catch_45f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_467

    :cond_464
    invoke-static {}, Lh9o;->p()V

    :cond_467
    :goto_467
    return-void

    :pswitch_468
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_476

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_4c5

    :cond_476
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_4c2

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_4c5

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_487
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_48e
    .catch Lorg/json/JSONException; {:try_start_487 .. :try_end_48e} :catch_4bd

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_490
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_497
    .catch Lorg/json/JSONException; {:try_start_490 .. :try_end_497} :catch_4b8

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4ac

    :try_start_49f
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4a6
    .catch Lorg/json/JSONException; {:try_start_49f .. :try_end_4a6} :catch_4a7

    goto :goto_4ac

    :catch_4a7
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_4c5

    :cond_4ac
    :goto_4ac
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_4c5

    :catch_4b8
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_4c5

    :catch_4bd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_4c5

    :cond_4c2
    invoke-static {}, Lh9o;->p()V

    :cond_4c5
    :goto_4c5
    return-void

    :pswitch_4c6
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_4d5

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_560

    :cond_4d5
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_55d

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Luha;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lorb;

    invoke-direct {p1}, Lorb;-><init>()V

    iget-object v0, p0, Luha;->a:Ljava/lang/String;

    invoke-virtual {p1, v0, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Luha;->b:Ljava/lang/String;

    const-string v1, "installationId"

    invoke-virtual {p1, v0, v1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Luha;->c:Ljava/lang/String;

    const-string v1, "countryCode"

    invoke-virtual {p1, v0, v1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Luha;->d:Ljava/lang/String;

    const-string v1, "locale"

    invoke-virtual {p1, v0, v1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Luha;->e:Lxha;

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p0, Lxha;->a:Ljava/lang/String;

    const-string v8, "version"

    invoke-virtual {v0, v1, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lxha;->b:Ljava/lang/String;

    const-string v1, "name"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "host"

    invoke-virtual {p1, v0, p0}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v7, :cond_560

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_522
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_529
    .catch Lorg/json/JSONException; {:try_start_522 .. :try_end_529} :catch_558

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_52b
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_532
    .catch Lorg/json/JSONException; {:try_start_52b .. :try_end_532} :catch_553

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p1, v0}, Lorb;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_547

    :try_start_53a
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_541
    .catch Lorg/json/JSONException; {:try_start_53a .. :try_end_541} :catch_542

    goto :goto_547

    :catch_542
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_560

    :cond_547
    :goto_547
    iget-object p1, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lilm;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_560

    :catch_553
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_560

    :catch_558
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_560

    :cond_55d
    invoke-static {}, Lh9o;->p()V

    :cond_560
    :goto_560
    return-void

    :pswitch_561
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_56f

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_5d0

    :cond_56f
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_5cd

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lbka;

    if-eqz p0, :cond_58b

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p0, p0, Lbka;->a:Ltfb;

    invoke-interface {p0}, Ltfb;->a()Lorb;

    move-result-object p0

    const-string p1, "chatItem"

    invoke-virtual {v1, p0, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_58b
    if-eqz v7, :cond_5d0

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_592
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_599
    .catch Lorg/json/JSONException; {:try_start_592 .. :try_end_599} :catch_5c8

    iget-object p1, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_59b
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5a2
    .catch Lorg/json/JSONException; {:try_start_59b .. :try_end_5a2} :catch_5c3

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5b7

    :try_start_5aa
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5b1
    .catch Lorg/json/JSONException; {:try_start_5aa .. :try_end_5b1} :catch_5b2

    goto :goto_5b7

    :catch_5b2
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_5d0

    :cond_5b7
    :goto_5b7
    iget-object p1, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lilm;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_5d0

    :catch_5c3
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_5d0

    :catch_5c8
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_5d0

    :cond_5cd
    invoke-static {}, Lh9o;->p()V

    :cond_5d0
    :goto_5d0
    return-void

    :pswitch_5d1
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_5df

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_62e

    :cond_5df
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_62b

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_62e

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_5f0
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5f7
    .catch Lorg/json/JSONException; {:try_start_5f0 .. :try_end_5f7} :catch_626

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_5f9
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_600
    .catch Lorg/json/JSONException; {:try_start_5f9 .. :try_end_600} :catch_621

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_615

    :try_start_608
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_60f
    .catch Lorg/json/JSONException; {:try_start_608 .. :try_end_60f} :catch_610

    goto :goto_615

    :catch_610
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_62e

    :cond_615
    :goto_615
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_62e

    :catch_621
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_62e

    :catch_626
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_62e

    :cond_62b
    invoke-static {}, Lh9o;->p()V

    :cond_62e
    :goto_62e
    return-void

    :pswitch_62f
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_63d

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_68c

    :cond_63d
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_689

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_68c

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_64e
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_655
    .catch Lorg/json/JSONException; {:try_start_64e .. :try_end_655} :catch_684

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_657
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_65e
    .catch Lorg/json/JSONException; {:try_start_657 .. :try_end_65e} :catch_67f

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_673

    :try_start_666
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_66d
    .catch Lorg/json/JSONException; {:try_start_666 .. :try_end_66d} :catch_66e

    goto :goto_673

    :catch_66e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_68c

    :cond_673
    :goto_673
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_68c

    :catch_67f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_68c

    :catch_684
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_68c

    :cond_689
    invoke-static {}, Lh9o;->p()V

    :cond_68c
    :goto_68c
    return-void

    :pswitch_68d
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_69b

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_6ea

    :cond_69b
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_6e7

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_6ea

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_6ac
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6b3
    .catch Lorg/json/JSONException; {:try_start_6ac .. :try_end_6b3} :catch_6e2

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_6b5
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6bc
    .catch Lorg/json/JSONException; {:try_start_6b5 .. :try_end_6bc} :catch_6dd

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6d1

    :try_start_6c4
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6cb
    .catch Lorg/json/JSONException; {:try_start_6c4 .. :try_end_6cb} :catch_6cc

    goto :goto_6d1

    :catch_6cc
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6ea

    :cond_6d1
    :goto_6d1
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_6ea

    :catch_6dd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6ea

    :catch_6e2
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_6ea

    :cond_6e7
    invoke-static {}, Lh9o;->p()V

    :cond_6ea
    :goto_6ea
    return-void

    :pswitch_6eb
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_6f9

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_748

    :cond_6f9
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_745

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_748

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_70a
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_711
    .catch Lorg/json/JSONException; {:try_start_70a .. :try_end_711} :catch_740

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_713
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_71a
    .catch Lorg/json/JSONException; {:try_start_713 .. :try_end_71a} :catch_73b

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_72f

    :try_start_722
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_729
    .catch Lorg/json/JSONException; {:try_start_722 .. :try_end_729} :catch_72a

    goto :goto_72f

    :catch_72a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_748

    :cond_72f
    :goto_72f
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_748

    :catch_73b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_748

    :catch_740
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_748

    :cond_745
    invoke-static {}, Lh9o;->p()V

    :cond_748
    :goto_748
    return-void

    :pswitch_749
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_758

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto/16 :goto_7ef

    :cond_758
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_7ec

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lyha;

    if-eqz p0, :cond_7aa

    new-instance p1, Lorb;

    invoke-direct {p1}, Lorb;-><init>()V

    iget-object v0, p0, Lyha;->a:Ljava/lang/String;

    const-string v8, "comment"

    invoke-virtual {p1, v0, v8}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lyha;->b:Lehc;

    if-eqz p0, :cond_779

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    :cond_779
    if-eqz v1, :cond_7a4

    if-eqz p0, :cond_7a4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    :goto_782
    move-object v0, p0

    check-cast v0, Lmea;

    invoke-virtual {v0}, Lmea;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7a4

    invoke-virtual {v0}, Lmea;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzha;

    sget-object v8, Lzha;->b:Lzha;

    if-eq v0, v8, :cond_79b

    iget-object v0, v0, Lzha;->a:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_782

    :cond_79b
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "Undefined"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    goto :goto_7ef

    :cond_7a4
    const-string p0, "reason"

    invoke-virtual {p1, v1, p0}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, p1

    :cond_7aa
    if-eqz v7, :cond_7ef

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_7b1
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7b8
    .catch Lorg/json/JSONException; {:try_start_7b1 .. :try_end_7b8} :catch_7e7

    iget-object p1, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_7ba
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7c1
    .catch Lorg/json/JSONException; {:try_start_7ba .. :try_end_7c1} :catch_7e2

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7d6

    :try_start_7c9
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7d0
    .catch Lorg/json/JSONException; {:try_start_7c9 .. :try_end_7d0} :catch_7d1

    goto :goto_7d6

    :catch_7d1
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_7ef

    :cond_7d6
    :goto_7d6
    iget-object p1, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lilm;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_7ef

    :catch_7e2
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_7ef

    :catch_7e7
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_7ef

    :cond_7ec
    invoke-static {}, Lh9o;->p()V

    :cond_7ef
    :goto_7ef
    return-void

    :pswitch_7f0
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_7fe

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_84d

    :cond_7fe
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_84a

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_84d

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_80f
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_816
    .catch Lorg/json/JSONException; {:try_start_80f .. :try_end_816} :catch_845

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_818
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_81f
    .catch Lorg/json/JSONException; {:try_start_818 .. :try_end_81f} :catch_840

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_834

    :try_start_827
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_82e
    .catch Lorg/json/JSONException; {:try_start_827 .. :try_end_82e} :catch_82f

    goto :goto_834

    :catch_82f
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_84d

    :cond_834
    :goto_834
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_84d

    :catch_840
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_84d

    :catch_845
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_84d

    :cond_84a
    invoke-static {}, Lh9o;->p()V

    :cond_84d
    :goto_84d
    return-void

    :pswitch_84e
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_85c

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_8ca

    :cond_85c
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_8c7

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Ljia;

    if-eqz p0, :cond_885

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    const-wide/16 v8, 0x3e7

    const-string p1, "code"

    invoke-virtual {p0, v8, v9, p1}, Lorb;->o(JLjava/lang/String;)V

    const-string p1, ""

    const-string v0, "message"

    invoke-virtual {p0, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "error"

    invoke-virtual {v1, p0, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_885
    if-eqz v7, :cond_8ca

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_88c
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_893
    .catch Lorg/json/JSONException; {:try_start_88c .. :try_end_893} :catch_8c2

    iget-object p1, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_895
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_89c
    .catch Lorg/json/JSONException; {:try_start_895 .. :try_end_89c} :catch_8bd

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8b1

    :try_start_8a4
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8ab
    .catch Lorg/json/JSONException; {:try_start_8a4 .. :try_end_8ab} :catch_8ac

    goto :goto_8b1

    :catch_8ac
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_8ca

    :cond_8b1
    :goto_8b1
    iget-object p1, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lilm;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_8ca

    :catch_8bd
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_8ca

    :catch_8c2
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_8ca

    :cond_8c7
    invoke-static {}, Lh9o;->p()V

    :cond_8ca
    :goto_8ca
    return-void

    :pswitch_8cb
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_8d9

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_928

    :cond_8d9
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_925

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_928

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_8ea
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8f1
    .catch Lorg/json/JSONException; {:try_start_8ea .. :try_end_8f1} :catch_920

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_8f3
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8fa
    .catch Lorg/json/JSONException; {:try_start_8f3 .. :try_end_8fa} :catch_91b

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_90f

    :try_start_902
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_909
    .catch Lorg/json/JSONException; {:try_start_902 .. :try_end_909} :catch_90a

    goto :goto_90f

    :catch_90a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_928

    :cond_90f
    :goto_90f
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_928

    :catch_91b
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_928

    :catch_920
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_928

    :cond_925
    invoke-static {}, Lh9o;->p()V

    :cond_928
    :goto_928
    return-void

    :pswitch_929
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_937

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_986

    :cond_937
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_983

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_986

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_948
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_94f
    .catch Lorg/json/JSONException; {:try_start_948 .. :try_end_94f} :catch_97e

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_951
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_958
    .catch Lorg/json/JSONException; {:try_start_951 .. :try_end_958} :catch_979

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_96d

    :try_start_960
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_967
    .catch Lorg/json/JSONException; {:try_start_960 .. :try_end_967} :catch_968

    goto :goto_96d

    :catch_968
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_986

    :cond_96d
    :goto_96d
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_986

    :catch_979
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_986

    :catch_97e
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_986

    :cond_983
    invoke-static {}, Lh9o;->p()V

    :cond_986
    :goto_986
    return-void

    :pswitch_987
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_995

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_9e4

    :cond_995
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_9e1

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Lkotlin/Unit;

    if-eqz v7, :cond_9e4

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    :try_start_9a6
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9ad
    .catch Lorg/json/JSONException; {:try_start_9a6 .. :try_end_9ad} :catch_9dc

    iget-object v0, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_9af
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9b6
    .catch Lorg/json/JSONException; {:try_start_9af .. :try_end_9b6} :catch_9d7

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9cb

    :try_start_9be
    invoke-static {p0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9c5
    .catch Lorg/json/JSONException; {:try_start_9be .. :try_end_9c5} :catch_9c6

    goto :goto_9cb

    :catch_9c6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_9e4

    :cond_9cb
    :goto_9cb
    iget-object p0, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p0, Lilm;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_9e4

    :catch_9d7
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_9e4

    :catch_9dc
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_9e4

    :cond_9e1
    invoke-static {}, Lh9o;->p()V

    :cond_9e4
    :goto_9e4
    return-void

    :pswitch_9e5
    instance-of p0, p1, Lrw7;

    if-eqz p0, :cond_9f3

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    invoke-static {v7, p0, v6}, Lkfo;->F(Lgsb;Leqb;Lzqb;)V

    goto :goto_a50

    :cond_9f3
    instance-of p0, p1, Lsw7;

    if-eqz p0, :cond_a4d

    check-cast p1, Lsw7;

    iget-object p0, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p0, Ltka;

    if-eqz p0, :cond_a0b

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object p0, p0, Ltka;->a:Ljava/lang/String;

    const-string p1, "value"

    invoke-virtual {v1, p0, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_a0b
    if-eqz v7, :cond_a50

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_a12
    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a19
    .catch Lorg/json/JSONException; {:try_start_a12 .. :try_end_a19} :catch_a48

    iget-object p1, v7, Lgsb;->a:Ljava/lang/Object;

    :try_start_a1b
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a22
    .catch Lorg/json/JSONException; {:try_start_a1b .. :try_end_a22} :catch_a43

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a37

    :try_start_a2a
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a31
    .catch Lorg/json/JSONException; {:try_start_a2a .. :try_end_a31} :catch_a32

    goto :goto_a37

    :catch_a32
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_a50

    :cond_a37
    :goto_a37
    iget-object p1, v6, Lzy9;->a:Ljava/lang/Object;

    check-cast p1, Lilm;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lilm;->run(Ljava/lang/Object;)V

    goto :goto_a50

    :catch_a43
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_a50

    :catch_a48
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_a50

    :cond_a4d
    invoke-static {}, Lh9o;->p()V

    :cond_a50
    :goto_a50
    return-void

    nop

    :pswitch_data_a52
    .packed-switch 0x0
        :pswitch_9e5
        :pswitch_987
        :pswitch_929
        :pswitch_8cb
        :pswitch_84e
        :pswitch_7f0
        :pswitch_749
        :pswitch_6eb
        :pswitch_68d
        :pswitch_62f
        :pswitch_5d1
        :pswitch_561
        :pswitch_4c6
        :pswitch_468
        :pswitch_40a
        :pswitch_3ac
        :pswitch_34e
        :pswitch_2f0
        :pswitch_292
        :pswitch_234
        :pswitch_1d6
        :pswitch_16a
        :pswitch_10c
        :pswitch_ae
        :pswitch_aa
        :pswitch_a6
        :pswitch_a2
        :pswitch_9e
        :pswitch_9a
    .end packed-switch
.end method
