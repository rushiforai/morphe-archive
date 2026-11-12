.class public final synthetic Lp02;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;

.field public final synthetic b:Lwth;

.field public final synthetic c:J

.field public final synthetic d:Ljava/util/ArrayList;

.field public final synthetic e:I

.field public final synthetic f:I


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Lwth;JLjava/util/ArrayList;II)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp02;->a:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Lp02;->b:Lwth;

    iput-wide p3, p0, Lp02;->c:J

    iput-object p5, p0, Lp02;->d:Ljava/util/ArrayList;

    iput p6, p0, Lp02;->e:I

    iput p7, p0, Lp02;->f:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ltw7;

    instance-of v2, v1, Lrw7;

    const/4 v3, 0x0

    iget-object v5, v0, Lp02;->a:Lkotlin/jvm/functions/Function1;

    if-eqz v2, :cond_18

    check-cast v1, Lrw7;

    iget-object v0, v1, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    invoke-interface {v5, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_ae

    :cond_18
    instance-of v2, v1, Lsw7;

    if-eqz v2, :cond_b1

    check-cast v1, Lsw7;

    iget-object v1, v1, Lsw7;->a:Ljava/lang/Object;

    check-cast v1, Ltfb;

    if-eqz v1, :cond_80

    instance-of v2, v1, Lqgb;

    if-eqz v2, :cond_31

    check-cast v1, Lqgb;

    iget-object v0, v1, Lqgb;->b:Ljava/lang/String;

    invoke-interface {v5, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_ae

    :cond_31
    instance-of v2, v1, Lpfb;

    if-eqz v2, :cond_80

    :try_start_35
    check-cast v1, Lpfb;

    iget-object v1, v1, Lpfb;->b:Ljava/lang/String;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "type"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_78

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "user-chat-item"

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_80

    const-string v1, "data"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "message"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_70

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ae

    :cond_70
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "message is null"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_78
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "type is null"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_80
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_80} :catch_80

    :catch_80
    :cond_80
    iget v1, v0, Lp02;->e:I

    iget v11, v0, Lp02;->f:I

    add-int v10, v1, v11

    if-ltz v10, :cond_ab

    iget-object v9, v0, Lp02;->d:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v10, v1, :cond_ab

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v15

    new-instance v17, Lp02;

    iget-object v6, v0, Lp02;->b:Lwth;

    iget-wide v7, v0, Lp02;->c:J

    move-object/from16 v4, v17

    invoke-direct/range {v4 .. v11}, Lp02;-><init>(Lkotlin/jvm/functions/Function1;Lwth;JLjava/util/ArrayList;II)V

    move-object v12, v6

    move-wide v13, v7

    invoke-virtual/range {v12 .. v17}, Lwth;->z(JJLkotlin/jvm/functions/Function1;)V

    goto :goto_ae

    :cond_ab
    invoke-interface {v5, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_ae
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_b1
    invoke-static {}, Lh9o;->p()V

    return-object v3
.end method
