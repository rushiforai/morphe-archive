.class public final Ll/xug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/uyg0;


# direct methods
.method public constructor <init>(Ll/uyg0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xug0;->f:Ll/uyg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xug0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/xug0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/xug0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-boolean p5, p0, Ll/xug0;->d:Z

    .line 10
    .line 11
    iput-object p6, p0, Ll/xug0;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 30

    move-object/from16 v1, p0

    .line 1
    const-string v0, "load_tip_fail_upgrade"

    const-string v2, "sdk_rtss_cfg"

    const-string v3, "auth_mg_info_url"

    const-string v4, "report_url"

    const-string v5, "online_route"

    const-string v6, "app_online_route_cfg"

    const-string v7, "url"

    const-string v8, "app_key"

    const-string v9, "app_id"

    const-string v10, "url_x86_64"

    const-string v11, "url_x86"

    const-string v12, "url_armeabi_v7a"

    const-string v13, "url_arm64_v8a"

    const-string v14, "desc"

    const-string v15, "key"

    move-object/from16 v16, v0

    const-string v0, "sdk_min"

    move-object/from16 v17, v2

    const-string v2, "sign"

    move-object/from16 v18, v3

    const-string v3, "version"

    move-object/from16 v19, v4

    new-instance v4, Ll/i0h0;

    invoke-direct {v4}, Ll/i0h0;-><init>()V

    move-object/from16 v20, v5

    .line 2
    new-instance v5, Ll/ukg0;

    move-object/from16 v21, v6

    const-string v6, "getSDKToken"

    invoke-direct {v5, v6}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 3
    new-instance v6, Ll/bxg0;

    invoke-direct {v6}, Ll/bxg0;-><init>()V

    .line 4
    iput-object v6, v5, Ll/ukg0;->n:Ll/bxg0;

    move-object/from16 v25, v6

    .line 5
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v28, v10

    .line 6
    iget-object v10, v1, Ll/xug0;->a:Ljava/lang/String;

    invoke-virtual {v6, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 7
    iget-object v10, v1, Ll/xug0;->b:Ljava/lang/String;

    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 8
    const-string v10, "bundle_id"

    move-object/from16 v29, v8

    iget-object v8, v1, Ll/xug0;->c:Ljava/lang/String;

    invoke-virtual {v6, v10, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    const-string v8, "platform"

    sget-object v10, Ll/utg0;->a:Ljava/lang/String;

    const/4 v10, 0x2

    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 10
    const-string v8, "is_test_env"

    iget-boolean v10, v1, Ll/xug0;->d:Z

    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 11
    const-string v8, "sdk_version"

    const-string v10, "1.6.7.1286"

    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 12
    const-string v8, "unity_dynamic_lib_type"

    const-string v10, "ilruntime-2022.3.62f2c1-1.0.7"

    invoke-virtual {v6, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v23

    .line 14
    iget-object v6, v1, Ll/xug0;->f:Ll/uyg0;

    iget-object v8, v1, Ll/xug0;->e:Ljava/lang/String;

    .line 15
    iget-object v10, v5, Ll/ukg0;->c:Ljava/lang/String;

    .line 16
    iget-object v6, v6, Ll/uyg0;->m:Ll/bpg0;

    const/16 v27, 0x0

    move-object/from16 v26, v6

    move-object/from16 v22, v8

    move-object/from16 v24, v10

    invoke-static/range {v22 .. v27}, Ll/uyg0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    move-result-object v6

    .line 17
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 18
    const-string v6, "ret_code"

    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v4, Ll/i0h0;->a:I

    .line 19
    const-string v6, "ret_msg"

    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Ll/i0h0;->b:Ljava/lang/String;

    .line 20
    const-string v6, "data"

    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 21
    new-instance v8, Ll/gvg0;

    invoke-direct {v8}, Ll/gvg0;-><init>()V

    iput-object v8, v4, Ll/i0h0;->c:Ll/gvg0;

    .line 22
    const-string v10, "sdk_token"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Ll/gvg0;->a:Ljava/lang/String;

    .line 23
    const-string v8, "sdk_rt_cfg"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 24
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    invoke-virtual {v8, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    iget-object v8, v4, Ll/i0h0;->c:Ll/gvg0;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    const-string v8, "sdk_sud_cfg"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 32
    new-instance v10, Ll/vyg0;

    invoke-direct {v10}, Ll/vyg0;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v22, v5

    .line 33
    :try_start_1
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v10, Ll/vyg0;->a:Ljava/lang/String;

    .line 34
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    invoke-virtual {v8, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v10, Ll/vyg0;->b:Ljava/lang/String;

    .line 37
    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v10, Ll/vyg0;->c:Ljava/lang/String;

    .line 38
    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v5, v28

    .line 40
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    iget-object v8, v4, Ll/i0h0;->c:Ll/gvg0;

    iput-object v10, v8, Ll/gvg0;->b:Ll/vyg0;

    .line 43
    const-string v8, "sdk_et_cfg"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 44
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    invoke-virtual {v8, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    iget-object v8, v4, Ll/i0h0;->c:Ll/gvg0;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    const-string v8, "sdk_unity_cfg"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 55
    new-instance v10, Ll/vyg0;

    invoke-direct {v10}, Ll/vyg0;-><init>()V

    .line 56
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v10, Ll/vyg0;->a:Ljava/lang/String;

    .line 57
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    invoke-virtual {v8, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v10, Ll/vyg0;->b:Ljava/lang/String;

    .line 60
    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v10, Ll/vyg0;->c:Ljava/lang/String;

    .line 61
    invoke-virtual {v8, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    iget-object v0, v4, Ll/i0h0;->c:Ll/gvg0;

    iput-object v10, v0, Ll/gvg0;->c:Ll/vyg0;

    .line 66
    const-string v0, "mg_api_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 67
    new-instance v2, Ll/a0h0;

    invoke-direct {v2}, Ll/a0h0;-><init>()V

    .line 68
    const-string v3, "app_server_info_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/a0h0;->b:Ljava/lang/String;

    .line 69
    const-string v3, "game_login_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/a0h0;->a:Ljava/lang/String;

    .line 70
    iget-object v3, v4, Ll/i0h0;->c:Ll/gvg0;

    iput-object v2, v3, Ll/gvg0;->f:Ll/a0h0;

    .line 71
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Ll/gvg0;->h:Ljava/lang/String;

    .line 72
    new-instance v0, Ll/ctg0;

    invoke-direct {v0}, Ll/ctg0;-><init>()V

    move-object/from16 v2, v21

    .line 73
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 74
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v3, v20

    .line 75
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 76
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v0, Ll/ctg0;->a:Z

    goto :goto_0

    :catch_0
    move-exception v0

    goto/16 :goto_4

    .line 77
    :cond_0
    :goto_0
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iput-object v0, v2, Ll/gvg0;->g:Ll/ctg0;

    .line 78
    const-string v0, "sdk_api_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 79
    new-instance v2, Ll/rhg0;

    invoke-direct {v2}, Ll/rhg0;-><init>()V

    .line 80
    const-string v3, "mg_list_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/rhg0;->a:Ljava/lang/String;

    .line 81
    const-string v3, "mg_info_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/rhg0;->b:Ljava/lang/String;

    move-object/from16 v3, v19

    .line 82
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 83
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/rhg0;->c:Ljava/lang/String;

    :cond_1
    move-object/from16 v3, v18

    .line 84
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 85
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/rhg0;->d:Ljava/lang/String;

    .line 86
    :cond_2
    const-string v3, "upload_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/rhg0;->e:Ljava/lang/String;

    .line 87
    iget-object v3, v4, Ll/i0h0;->c:Ll/gvg0;

    iput-object v2, v3, Ll/gvg0;->d:Ll/rhg0;

    .line 88
    iget-object v3, v1, Ll/xug0;->f:Ll/uyg0;

    const-string v5, "gate_token_url"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Ll/uyg0;->f:Ljava/lang/String;

    .line 89
    const-string v3, "gate_ws_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Ll/rhg0;->f:Ljava/lang/String;

    .line 90
    new-instance v0, Ll/svg0;

    invoke-direct {v0}, Ll/svg0;-><init>()V

    move-object/from16 v2, v17

    .line 91
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    const/4 v5, 0x0

    if-nez v3, :cond_8

    .line 92
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 93
    const-string v3, "microsoft_rtss_cfg"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v8, "asr_number_language_list"

    const-string v10, "asr_text_language_list"

    if-eqz v3, :cond_3

    .line 94
    :try_start_2
    new-instance v11, Ll/vpg0;

    invoke-direct {v11}, Ll/vpg0;-><init>()V

    .line 95
    const-string v12, "speech_subscription_key"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Ll/vpg0;->a:Ljava/lang/String;

    .line 96
    const-string v12, "speech_region"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Ll/vpg0;->b:Ljava/lang/String;

    .line 97
    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    iput-object v12, v11, Ll/vpg0;->c:Lorg/json/JSONArray;

    .line 98
    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    iput-object v3, v11, Ll/vpg0;->d:Lorg/json/JSONArray;

    .line 99
    iput-object v11, v0, Ll/svg0;->a:Ll/vpg0;

    .line 100
    :cond_3
    const-string v3, "asr_load_list"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 101
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, v0, Ll/svg0;->b:Ljava/util/ArrayList;

    move v11, v5

    .line 102
    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v11, v12, :cond_4

    .line 103
    invoke-virtual {v3, v11}, Lorg/json/JSONArray;->getInt(I)I

    move-result v12

    .line 104
    iget-object v13, v0, Ll/svg0;->b:Ljava/util/ArrayList;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v13, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 105
    :cond_4
    const-string v3, "tcc_rtss_cfg"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 106
    new-instance v3, Ltech/sud/gip/core/TccRtssCfg;

    invoke-direct {v3}, Ltech/sud/gip/core/TccRtssCfg;-><init>()V

    .line 107
    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v3, Ltech/sud/gip/core/TccRtssCfg;->app_id:I

    .line 108
    const-string v9, "secret_id"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v3, Ltech/sud/gip/core/TccRtssCfg;->secret_id:Ljava/lang/String;

    .line 109
    const-string v9, "secret_key"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v3, Ltech/sud/gip/core/TccRtssCfg;->secret_key:Ljava/lang/String;

    .line 110
    const-string v9, "hotword_list"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v3, Ltech/sud/gip/core/TccRtssCfg;->hotword_list:Ljava/lang/String;

    .line 111
    const-string v9, "hotword_id"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v3, Ltech/sud/gip/core/TccRtssCfg;->hotword_id:Ljava/lang/String;

    .line 112
    const-string v9, "engine_model_type"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_6

    .line 113
    invoke-virtual {v9}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v11

    if-nez v11, :cond_5

    goto :goto_3

    .line 114
    :cond_5
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 115
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 116
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 117
    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_6
    :goto_3
    const/4 v12, 0x0

    .line 118
    :cond_7
    iput-object v12, v3, Ltech/sud/gip/core/TccRtssCfg;->engine_model_type:Ljava/util/Map;

    .line 119
    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    iput-object v9, v3, Ltech/sud/gip/core/TccRtssCfg;->asr_text_language_list:Lorg/json/JSONArray;

    .line 120
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    iput-object v2, v3, Ltech/sud/gip/core/TccRtssCfg;->asr_number_language_list:Lorg/json/JSONArray;

    .line 121
    iput-object v3, v0, Ll/svg0;->c:Ltech/sud/gip/core/TccRtssCfg;

    .line 122
    :cond_8
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iput-object v0, v2, Ll/gvg0;->e:Ll/svg0;

    .line 123
    const-string v0, "sdk_localization_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 124
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    new-instance v3, Ll/smg0;

    invoke-direct {v3}, Ll/smg0;-><init>()V

    iput-object v3, v2, Ll/gvg0;->i:Ll/smg0;

    .line 125
    const-string v2, "load_tip_loading"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    move-result-object v2

    iput-object v2, v3, Ll/smg0;->a:LD/Sudif;

    .line 126
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->i:Ll/smg0;

    const-string v3, "load_tip_fail"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    move-result-object v3

    iput-object v3, v2, Ll/smg0;->b:LD/Sudif;

    move-object/from16 v2, v16

    .line 127
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 128
    iget-object v3, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v3, v3, Ll/gvg0;->i:Ll/smg0;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    move-result-object v2

    iput-object v2, v3, Ll/smg0;->c:LD/Sudif;

    .line 129
    :cond_9
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->i:Ll/smg0;

    const-string v3, "load_reload"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    move-result-object v3

    iput-object v3, v2, Ll/smg0;->d:LD/Sudif;

    .line 130
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->i:Ll/smg0;

    const-string v3, "load_tip_timeout"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    move-result-object v3

    iput-object v3, v2, Ll/smg0;->e:LD/Sudif;

    .line 131
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->i:Ll/smg0;

    const-string v3, "load_tip_continue_wait"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Ll/uyg0;->a(Lorg/json/JSONObject;)LD/Sudif;

    move-result-object v0

    iput-object v0, v2, Ll/smg0;->f:LD/Sudif;

    .line 132
    iget-object v0, v4, Ll/i0h0;->c:Ll/gvg0;

    const-string v2, "load_mg_pkg_time_out"

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Ll/gvg0;->j:I

    .line 133
    iget-object v0, v4, Ll/i0h0;->c:Ll/gvg0;

    const-string v2, "unity_multi_process"

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v0, Ll/gvg0;->k:Z

    .line 134
    const-string v0, "console_log_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 135
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    new-instance v3, Ll/rng0;

    invoke-direct {v3}, Ll/rng0;-><init>()V

    iput-object v3, v2, Ll/gvg0;->l:Ll/rng0;

    .line 136
    const-string v2, "is_open"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, v3, Ll/rng0;->a:Z

    .line 137
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->l:Ll/rng0;

    const-string v3, "max_size"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, v2, Ll/rng0;->b:J

    .line 138
    :cond_a
    const-string v0, "model_api_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 139
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    new-instance v3, Ll/tfg0;

    invoke-direct {v3}, Ll/tfg0;-><init>()V

    iput-object v3, v2, Ll/gvg0;->m:Ll/tfg0;

    .line 140
    const-string v2, "ip_interaction_url"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Ll/tfg0;->a:Ljava/lang/String;

    .line 141
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->m:Ll/tfg0;

    const-string v3, "ip_interaction_sse_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/tfg0;->b:Ljava/lang/String;

    .line 142
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->m:Ll/tfg0;

    const-string v3, "model_config_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ll/tfg0;->c:Ljava/lang/String;

    .line 143
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->m:Ll/tfg0;

    const-string v3, "room_message_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Ll/tfg0;->d:Ljava/lang/String;

    .line 144
    :cond_b
    const-string v0, "large_model_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 145
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    new-instance v3, Ll/jxg0;

    invoke-direct {v3}, Ll/jxg0;-><init>()V

    iput-object v3, v2, Ll/gvg0;->n:Ll/jxg0;

    .line 146
    const-string v2, "enable"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 147
    const-string v2, "volc"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 148
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    new-instance v3, Ltech/sud/gip/core/model/VolcCfg;

    invoke-direct {v3}, Ltech/sud/gip/core/model/VolcCfg;-><init>()V

    iput-object v3, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    .line 149
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ltech/sud/gip/core/model/VolcCfg;->url:Ljava/lang/String;

    .line 150
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    const-string v3, "async_url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ltech/sud/gip/core/model/VolcCfg;->async_url:Ljava/lang/String;

    .line 151
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    move-object/from16 v3, v29

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ltech/sud/gip/core/model/VolcCfg;->app_key:Ljava/lang/String;

    .line 152
    const-string v2, "access_key"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 153
    iget-object v3, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v3, v3, Ll/gvg0;->n:Ll/jxg0;

    iget-object v3, v3, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    invoke-static {v2}, Ll/lwg0;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Ltech/sud/gip/core/model/VolcCfg;->access_key:Ljava/lang/String;

    .line 154
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    const-string v3, "resource_id"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ltech/sud/gip/core/model/VolcCfg;->resource_id:Ljava/lang/String;

    .line 155
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    const-string v3, "model_name"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Ltech/sud/gip/core/model/VolcCfg;->model_name:Ljava/lang/String;

    .line 156
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    const-string v3, "languages"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    iput-object v3, v2, Ltech/sud/gip/core/model/VolcCfg;->languages:Lorg/json/JSONArray;

    .line 157
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v2, v2, Ll/gvg0;->n:Ll/jxg0;

    iget-object v2, v2, Ll/jxg0;->a:Ltech/sud/gip/core/model/VolcCfg;

    const-string v3, "request_config"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, v2, Ltech/sud/gip/core/model/VolcCfg;->request_config:Lorg/json/JSONObject;

    .line 158
    :cond_c
    const-string v0, "report_api_cfg"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 159
    iget-object v2, v4, Ll/i0h0;->c:Ll/gvg0;

    new-instance v3, Ll/ogg0;

    invoke-direct {v3}, Ll/ogg0;-><init>()V

    iput-object v3, v2, Ll/gvg0;->p:Ll/ogg0;

    .line 160
    const-string v2, "report_llm_asr_url"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v3, Ll/ogg0;->a:Ljava/lang/String;

    .line 161
    :cond_d
    iget-object v0, v4, Ll/i0h0;->c:Ll/gvg0;

    const-string v2, "log_id"

    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Ll/gvg0;->o:Ljava/lang/String;

    .line 162
    iget-object v0, v4, Ll/i0h0;->c:Ll/gvg0;

    iget-object v0, v0, Ll/gvg0;->o:Ljava/lang/String;

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v5, v0}, Ll/tug0;->b(JILjava/lang/String;)V

    .line 163
    invoke-static {}, Ll/tug0;->a()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-object/from16 v5, v22

    goto :goto_6

    :catch_1
    move-exception v0

    move-object/from16 v22, v5

    .line 164
    :goto_4
    iget v2, v4, Ll/i0h0;->a:I

    const-string v3, "sdkToken error :"

    if-nez v2, :cond_e

    .line 165
    invoke-static {v0}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    move-result v2

    iput v2, v4, Ll/i0h0;->a:I

    .line 166
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Ll/i0h0;->b:Ljava/lang/String;

    goto :goto_5

    .line 167
    :cond_e
    sget-object v2, Ll/uyg0;->p:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v4, Ll/i0h0;->b:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v4, Ll/i0h0;->a:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    :goto_5
    iget v2, v4, Ll/i0h0;->a:I

    move-object/from16 v5, v22

    .line 169
    iput v2, v5, Ll/ukg0;->e:I

    .line 170
    iget-object v2, v4, Ll/i0h0;->b:Ljava/lang/String;

    if-eqz v2, :cond_f

    .line 171
    iput-object v2, v5, Ll/ukg0;->f:Ljava/lang/String;

    .line 172
    :cond_f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 173
    sget-object v2, Ll/uyg0;->p:Ljava/lang/String;

    invoke-static {v2, v0}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    const-string v2, "HttpService"

    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 175
    :goto_6
    new-instance v0, Ll/zog0;

    invoke-direct {v0, v1, v4, v5}, Ll/zog0;-><init>(Ll/xug0;Ll/i0h0;Ll/ukg0;)V

    .line 176
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    return-void
.end method
