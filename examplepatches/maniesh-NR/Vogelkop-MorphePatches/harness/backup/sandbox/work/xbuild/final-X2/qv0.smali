.class public final synthetic Lqv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lqv0;->a:B

    iput-wide p1, p0, Lqv0;->b:J

    iput-object p3, p0, Lqv0;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;JB)V
    .registers 5

    .line 10
    iput-byte p4, p0, Lqv0;->a:B

    iput-object p1, p0, Lqv0;->c:Ljava/lang/Object;

    iput-wide p2, p0, Lqv0;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqv0;->a:B

    const/4 v2, 0x1

    iget-wide v3, v0, Lqv0;->b:J

    iget-object v5, v0, Lqv0;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_13e

    check-cast v5, Liak;

    move-object/from16 v6, p1

    check-cast v6, Lmk7;

    invoke-interface {v5}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v1, v2, v3}, Ldjh;->b(FFF)F

    move-result v11

    const/16 v12, 0x76

    iget-wide v7, v0, Lqv0;->b:J

    const-wide/16 v9, 0x0

    invoke-static/range {v6 .. v12}, Lmk7;->z0(Lmk7;JJFI)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2f
    check-cast v5, Lwlc;

    move-object/from16 v0, p1

    check-cast v0, Lmt5;

    invoke-static {v5, v3, v4, v0}, Lwlc;->c(Lwlc;JLmt5;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_3a
    check-cast v5, Loi9;

    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "UPDATE football_events SET source = ? WHERE oscoreId = ?"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_46
    iget-short v0, v5, Loi9;->a:S

    int-to-long v5, v0

    invoke-virtual {v1, v2, v5, v6}, Lwsk;->T0(IJ)V

    const/4 v0, 0x2

    invoke-virtual {v1, v0, v3, v4}, Lwsk;->T0(IJ)V

    invoke-virtual {v1}, Lwsk;->n()Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_55
    .catchall {:try_start_46 .. :try_end_55} :catchall_59

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v0

    :catchall_59
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_5e
    check-cast v5, Lrv0;

    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "SELECT * from chat_message WHERE chat = ? ORDER BY id ASC"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_6a
    invoke-virtual {v1, v2, v3, v4}, Lwsk;->T0(IJ)V

    const-string v0, "id"

    invoke-static {v1, v0}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v0

    const-string v2, "chat"

    invoke-static {v1, v2}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v2

    const-string v3, "source"

    invoke-static {v1, v3}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v3

    const-string v4, "content"

    invoke-static {v1, v4}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v4

    const-string v6, "created"

    invoke-static {v1, v6}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v6

    const-string v7, "urls"

    invoke-static {v1, v7}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v7

    const-string v8, "name"

    invoke-static {v1, v8}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v8

    const-string v9, "messageId"

    invoke-static {v1, v9}, Lhyg;->f(Lwsk;Ljava/lang/String;)I

    move-result v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    :goto_a2
    invoke-virtual {v1}, Lwsk;->n()Z

    move-result v11

    if-eqz v11, :cond_135

    invoke-virtual {v1, v0}, Lwsk;->getLong(I)J

    move-result-wide v13

    invoke-virtual {v1, v2}, Lwsk;->getLong(I)J

    move-result-wide v15

    invoke-virtual {v1, v3}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v11}, Lrv0;->a(Ljava/lang/String;)Llu4;

    move-result-object v17

    invoke-virtual {v1, v4}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v1, v6}, Lwsk;->getLong(I)J

    move-result-wide v19

    invoke-virtual {v1, v7}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    move/from16 p0, v0

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/16 v21, 0x0

    move/from16 p1, v2

    move/from16 v2, v21

    :goto_dd
    if-ge v2, v0, :cond_105

    move/from16 v21, v0

    invoke-virtual {v12, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    move/from16 v24, v3

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v0, v3, :cond_f9

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    move/from16 v0, v21

    move/from16 v3, v24

    goto :goto_dd

    :cond_f9
    new-instance v0, Lorg/json/JSONException;

    const-string v3, " is null"

    invoke-static {v2, v3}, Lu35;->g(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_105
    move/from16 v24, v3

    invoke-virtual {v1, v8}, Lwsk;->isNull(I)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_111

    move-object/from16 v22, v2

    goto :goto_117

    :cond_111
    invoke-virtual {v1, v8}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v22, v0

    :goto_117
    invoke-virtual {v1, v9}, Lwsk;->isNull(I)Z

    move-result v0

    if-nez v0, :cond_121

    invoke-virtual {v1, v9}, Lwsk;->l(I)Ljava/lang/String;

    move-result-object v2

    :cond_121
    move-object/from16 v23, v2

    new-instance v12, Lnu4;

    move-object/from16 v21, v11

    invoke-direct/range {v12 .. v23}, Lnu4;-><init>(JJLlu4;Ljava/lang/String;JLjava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_12d
    .catchall {:try_start_6a .. :try_end_12d} :catchall_139

    move/from16 v0, p0

    move/from16 v2, p1

    move/from16 v3, v24

    goto/16 :goto_a2

    :cond_135
    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    return-object v10

    :catchall_139
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_3a
        :pswitch_2f
    .end packed-switch
.end method
