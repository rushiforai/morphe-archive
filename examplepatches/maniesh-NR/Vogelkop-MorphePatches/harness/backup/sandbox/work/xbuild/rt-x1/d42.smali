.class public final synthetic Ld42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo62;


# direct methods
.method public synthetic constructor <init>(Lo62;B)V
    .registers 3

    iput-byte p2, p0, Ld42;->a:B

    iput-object p1, p0, Ld42;->b:Lo62;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Ld42;->a:B

    const-string v2, "message"

    const-string v3, "code"

    const-string v4, "error"

    iget-object v0, v0, Ld42;->b:Lo62;

    packed-switch v1, :pswitch_data_162

    move-object/from16 v1, p1

    check-cast v1, Lorb;

    const-string v5, "result"

    invoke-virtual {v1, v5}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v5, v1, Lorb;->a:Lorg/json/JSONObject;

    const-string v6, "chat"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_106

    invoke-virtual {v1, v6}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    const-string v3, "chatId"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    const-string v3, "title"

    invoke-virtual {v1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v3, "userId"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v3, "position"

    invoke-virtual {v1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lru4;->values()[Lru4;

    move-result-object v9

    array-length v10, v9

    const/4 v12, 0x0

    :goto_48
    if-ge v12, v10, :cond_5d

    aget-object v13, v9, v12

    sget-object v14, Lru4;->b:Lru4;

    if-eq v13, v14, :cond_5a

    iget-object v14, v13, Lru4;->a:Ljava/lang/String;

    invoke-virtual {v3, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5a

    :goto_58
    move-object v9, v13

    goto :goto_60

    :cond_5a
    add-int/lit8 v12, v12, 0x1

    goto :goto_48

    :cond_5d
    sget-object v13, Lru4;->b:Lru4;

    goto :goto_58

    :goto_60
    const-string v3, "state"

    invoke-virtual {v1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lsu4;->values()[Lsu4;

    move-result-object v10

    array-length v12, v10

    const/4 v13, 0x0

    :goto_6c
    if-ge v13, v12, :cond_81

    aget-object v14, v10, v13

    sget-object v15, Lsu4;->b:Lsu4;

    if-eq v14, v15, :cond_7e

    iget-object v15, v14, Lsu4;->a:Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7e

    :goto_7c
    move-object v10, v14

    goto :goto_84

    :cond_7e
    add-int/lit8 v13, v13, 0x1

    goto :goto_6c

    :cond_81
    sget-object v14, Lsu4;->b:Lsu4;

    goto :goto_7c

    :goto_84
    const-string v3, "hasContent"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "isPrivate"

    invoke-virtual {v1, v3}, Lorb;->k(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v12

    const-string v3, "modifiers"

    invoke-virtual {v1, v3}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v3

    if-eqz v3, :cond_9c

    invoke-static {v3}, Lsfe;->I(Lorb;)Lqu4;

    move-result-object v4

    :cond_9c
    move-object v13, v4

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "messages"

    invoke-virtual {v1, v3}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v1

    iget-object v3, v1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/4 v4, 0x0

    :goto_af
    if-ge v4, v3, :cond_f7

    invoke-virtual {v1, v4}, Lvpb;->c(I)Lorb;

    move-result-object v15

    const-string v11, "author"

    invoke-virtual {v15, v11}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object/from16 p1, v1

    invoke-static {}, Lou4;->values()[Lou4;

    move-result-object v1

    move/from16 v16, v2

    array-length v2, v1

    move-object/from16 v17, v1

    const/4 v1, 0x0

    :goto_c7
    if-ge v1, v2, :cond_e0

    move/from16 v18, v1

    aget-object v1, v17, v18

    move/from16 v19, v2

    sget-object v2, Lou4;->b:Lou4;

    if-eq v1, v2, :cond_db

    iget-object v2, v1, Lou4;->a:Ljava/lang/String;

    invoke-virtual {v11, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e2

    :cond_db
    add-int/lit8 v1, v18, 0x1

    move/from16 v2, v19

    goto :goto_c7

    :cond_e0
    sget-object v1, Lou4;->b:Lou4;

    :cond_e2
    const-string v2, "msg"

    invoke-virtual {v15, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v11, Lmu4;

    invoke-direct {v11, v1, v2}, Lmu4;-><init>(Lou4;Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, p1

    move/from16 v2, v16

    goto :goto_af

    :cond_f7
    move/from16 v16, v2

    new-instance v4, Lgu4;

    move/from16 v11, v16

    invoke-direct/range {v4 .. v14}, Lgu4;-><init>(JLjava/lang/String;Ljava/lang/String;Lru4;Lsu4;ZLjava/lang/Boolean;Lqu4;Ljava/util/ArrayList;)V

    new-instance v1, Lv32;

    invoke-direct {v1, v4}, Lv32;-><init>(Lgu4;)V

    goto :goto_123

    :cond_106
    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_11e

    invoke-virtual {v1, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v4, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    new-instance v1, Lw32;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_123

    :cond_11e
    new-instance v1, Ly32;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :goto_123
    new-instance v2, Lsw7;

    invoke-direct {v2, v1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lo62;->n(Ltw7;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_12e
    move-object/from16 v1, p1

    check-cast v1, Lorb;

    new-instance v5, Ld42;

    const/4 v6, 0x1

    invoke-direct {v5, v0, v6}, Ld42;-><init>(Lo62;B)V

    iget-object v6, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_15c

    invoke-virtual {v1, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object v4, v1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcqb;

    invoke-direct {v2, v3, v1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lo62;->n(Ltw7;)V

    goto :goto_15f

    :cond_15c
    invoke-virtual {v5, v1}, Ld42;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_15f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_162
    .packed-switch 0x0
        :pswitch_12e
    .end packed-switch
.end method
