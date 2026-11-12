.class public Lpwl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/security/PublicKey;

.field public final g:Ljava/util/Date;

.field public final h:Lu1b;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/util/Date;Lu1b;)V
    .registers 9

    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    iput-object p1, p0, Lpwl;->a:Ljava/lang/String;

    .line 296
    iput-object p2, p0, Lpwl;->b:Ljava/lang/String;

    .line 297
    iput-object p3, p0, Lpwl;->c:Ljava/lang/String;

    .line 298
    iput-object p4, p0, Lpwl;->d:Ljava/lang/String;

    .line 299
    iput-object p5, p0, Lpwl;->e:Ljava/lang/String;

    .line 300
    iput-object p6, p0, Lpwl;->f:Ljava/security/PublicKey;

    .line 301
    iput-object p7, p0, Lpwl;->g:Ljava/util/Date;

    .line 302
    iput-object p8, p0, Lpwl;->h:Lu1b;

    return-void
.end method

.method public constructor <init>(Lorb;B)V
    .registers 30

    move-object/from16 v0, p1

    const-string v1, "Badly formatted public_key"

    const/4 v2, 0x4

    const-string v3, "last_seen"

    const-string v4, "public_key"

    const-string v5, "kind"

    const-string v6, "name"

    const-string v7, "id"

    const/4 v9, 0x0

    packed-switch p2, :pswitch_data_126

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v7, "group_id"

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v6, "client_version"

    const-string v7, ""

    invoke-virtual {v0, v6, v7}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget v5, Lle9;->g:I

    const-string v5, "-----BEGIN "

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_46

    const-string v5, "-----"

    const/16 v6, 0xb

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_4a

    :cond_46
    const/4 v4, 0x0

    const/16 v16, 0x0

    goto :goto_61

    :cond_4a
    add-int/lit8 v10, v5, 0x5

    const/16 v16, 0x0

    const-string v8, "-----END "

    invoke-virtual {v4, v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    if-ne v8, v6, :cond_59

    move-object/from16 v4, v16

    goto :goto_61

    :cond_59
    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    :goto_61
    if-nez v4, :cond_66

    move-object/from16 v4, v16

    goto :goto_6a

    :cond_66
    invoke-static {v4}, Lp36;->c([B)Ljava/security/PublicKey;

    move-result-object v4

    :goto_6a
    if-eqz v4, :cond_b2

    invoke-virtual {v0, v3, v7}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_70
    invoke-static {v1}, Lyjb;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1
    :try_end_74
    .catch Ljava/text/ParseException; {:try_start_70 .. :try_end_74} :catch_77

    :goto_74
    move-object/from16 v17, v1

    goto :goto_7d

    :catch_77
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    goto :goto_74

    :goto_7d
    const-string v1, "client_capabilities"

    invoke-virtual {v0, v1}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v0

    if-nez v0, :cond_90

    sget v0, Lu1b;->c:I

    sget-object v0, Ljsh;->j:Ljsh;

    :goto_89
    move-object/from16 v10, p0

    move-object/from16 v18, v0

    move-object/from16 v16, v4

    goto :goto_ae

    :cond_90
    sget v1, Lu1b;->c:I

    new-instance v1, Lt1b;

    invoke-direct {v1, v2}, Lv0b;-><init>(I)V

    :goto_97
    iget-object v2, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v9, v2, :cond_a9

    invoke-virtual {v0, v9}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lt1b;->g(Ljava/lang/Object;)Lt1b;

    add-int/lit8 v9, v9, 0x1

    goto :goto_97

    :cond_a9
    invoke-virtual {v1}, Lt1b;->j()Lu1b;

    move-result-object v0

    goto :goto_89

    :goto_ae
    invoke-direct/range {v10 .. v18}, Lpwl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/util/Date;Lu1b;)V

    return-void

    :cond_b2
    invoke-static {v1}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    throw v16

    :pswitch_b6
    const/16 v16, 0x0

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v7, "group"

    invoke-virtual {v0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v6, "version"

    invoke-virtual {v0, v6}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v0, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    invoke-static {v4}, Lp36;->c([B)Ljava/security/PublicKey;

    move-result-object v24

    if-eqz v24, :cond_122

    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, v0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v6, v3, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-direct {v1, v3, v4}, Ljava/util/Date;-><init>(J)V

    const-string v3, "capabilities"

    invoke-virtual {v0, v3}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v0

    if-nez v0, :cond_100

    sget v0, Lu1b;->c:I

    sget-object v0, Ljsh;->j:Ljsh;

    :goto_f9
    move-object/from16 v18, p0

    move-object/from16 v26, v0

    move-object/from16 v25, v1

    goto :goto_11e

    :cond_100
    sget v3, Lu1b;->c:I

    new-instance v3, Lt1b;

    invoke-direct {v3, v2}, Lv0b;-><init>(I)V

    :goto_107
    iget-object v2, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v9, v2, :cond_119

    invoke-virtual {v0, v9}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lt1b;->g(Ljava/lang/Object;)Lt1b;

    add-int/lit8 v9, v9, 0x1

    goto :goto_107

    :cond_119
    invoke-virtual {v3}, Lt1b;->j()Lu1b;

    move-result-object v0

    goto :goto_f9

    :goto_11e
    invoke-direct/range {v18 .. v26}, Lpwl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/util/Date;Lu1b;)V

    return-void

    :cond_122
    invoke-static {v1}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    throw v16

    :pswitch_data_126
    .packed-switch 0x1
        :pswitch_b6
    .end packed-switch
.end method
