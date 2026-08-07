.class public Lcom/appsflyer/deeplink/DeepLink;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final getMediationNetwork:Lorg/json/JSONObject;


# direct methods
.method private constructor <init>(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 5
    .line 6
    return-void
.end method

.method public static AFAdRevenueData(Ljava/util/Map;)Lcom/appsflyer/deeplink/DeepLink;
    .locals 99
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/appsflyer/deeplink/DeepLink;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v97, "af_web_id"

    .line 6
    .line 7
    const-string v98, "af_deeplink"

    .line 8
    .line 9
    const-string v1, "install_time"

    .line 10
    .line 11
    const-string v2, "pid"

    .line 12
    .line 13
    const-string v3, "c"

    .line 14
    .line 15
    const-string v4, "af_prt"

    .line 16
    .line 17
    const-string v5, "af_mp"

    .line 18
    .line 19
    const-string v6, "clickid"

    .line 20
    .line 21
    const-string v7, "af_siteid"

    .line 22
    .line 23
    const-string v8, "af_sub_siteid"

    .line 24
    .line 25
    const-string v9, "af_click_lookback"

    .line 26
    .line 27
    const-string v10, "af_viewthrough_lookback"

    .line 28
    .line 29
    const-string v11, "af_keywords"

    .line 30
    .line 31
    const-string v12, "af_cost_model"

    .line 32
    .line 33
    const-string v13, "af_cost_currency"

    .line 34
    .line 35
    const-string v14, "af_cost_value"

    .line 36
    .line 37
    const-string v15, "af_r"

    .line 38
    .line 39
    const-string v16, "af_web_dp"

    .line 40
    .line 41
    const-string v17, "af_force_deeplink"

    .line 42
    .line 43
    const-string v18, "af_ref"

    .line 44
    .line 45
    const-string v19, "is_incentivized"

    .line 46
    .line 47
    const-string v20, "af_param_forwarding"

    .line 48
    .line 49
    const-string v21, "is_retargeting"

    .line 50
    .line 51
    const-string v22, "af_reengagement_window"

    .line 52
    .line 53
    const-string v23, "is_branded_link"

    .line 54
    .line 55
    const-string v24, "is_universal_link"

    .line 56
    .line 57
    const-string v25, "af_generated_clk"

    .line 58
    .line 59
    const-string v26, "transaction_id"

    .line 60
    .line 61
    const-string v27, "af_fp_lookback_window"

    .line 62
    .line 63
    const-string v28, "af_vt_fp_lookback_window"

    .line 64
    .line 65
    const-string v29, "af_fp_priority"

    .line 66
    .line 67
    const-string v30, "af_generate_clk"

    .line 68
    .line 69
    const-string v31, "af_inactivity_window"

    .line 70
    .line 71
    const-string v32, "af_ol_red"

    .line 72
    .line 73
    const-string v33, "af_attr"

    .line 74
    .line 75
    const-string v34, "af_ol_lp"

    .line 76
    .line 77
    const-string v35, "af_blank_red"

    .line 78
    .line 79
    const-string v36, "af_source"

    .line 80
    .line 81
    const-string v37, "af_lp_src"

    .line 82
    .line 83
    const-string v38, "af_src_browser"

    .line 84
    .line 85
    const-string v39, "af_tranid"

    .line 86
    .line 87
    const-string v40, "af_wrt_clk"

    .line 88
    .line 89
    const-string v41, "af_ua"

    .line 90
    .line 91
    const-string v42, "af_ip"

    .line 92
    .line 93
    const-string v43, "af_lang"

    .line 94
    .line 95
    const-string v44, "advertising_id"

    .line 96
    .line 97
    const-string v45, "sha1_advertising_id"

    .line 98
    .line 99
    const-string v46, "md5_advertising_id"

    .line 100
    .line 101
    const-string v47, "android_id"

    .line 102
    .line 103
    const-string v48, "sha1_android_id"

    .line 104
    .line 105
    const-string v49, "md5_android_id"

    .line 106
    .line 107
    const-string v50, "imei"

    .line 108
    .line 109
    const-string v51, "sha1_imei"

    .line 110
    .line 111
    const-string v52, "md5_imei"

    .line 112
    .line 113
    const-string v53, "oaid"

    .line 114
    .line 115
    const-string v54, "sha1_oaid"

    .line 116
    .line 117
    const-string v55, "md5_oaid"

    .line 118
    .line 119
    const-string v56, "af_android_url"

    .line 120
    .line 121
    const-string v57, "sha1_el"

    .line 122
    .line 123
    const-string v58, "fire_advertising_id"

    .line 124
    .line 125
    const-string v59, "sha1_fire_advertising_id"

    .line 126
    .line 127
    const-string v60, "idfa"

    .line 128
    .line 129
    const-string v61, "md5_idfa"

    .line 130
    .line 131
    const-string v62, "af_ios_url"

    .line 132
    .line 133
    const-string v63, "af_ios_fallback"

    .line 134
    .line 135
    const-string v64, "sha1_idfa"

    .line 136
    .line 137
    const-string v65, "mac"

    .line 138
    .line 139
    const-string v66, "sha1_mac"

    .line 140
    .line 141
    const-string v67, "af_banner"

    .line 142
    .line 143
    const-string v68, "af_slk_web_endpoint"

    .line 144
    .line 145
    const-string v69, "af_chrome_lp"

    .line 146
    .line 147
    const-string v70, "af_android_custom_url"

    .line 148
    .line 149
    const-string v71, "af_ios_custom_url"

    .line 150
    .line 151
    const-string v72, "af_enc_data"

    .line 152
    .line 153
    const-string v73, "engmnt_source"

    .line 154
    .line 155
    const-string v74, "redirect_response_data"

    .line 156
    .line 157
    const-string v75, "shortlink"

    .line 158
    .line 159
    const-string v76, "advertiserId"

    .line 160
    .line 161
    const-string v77, "sha1_advertiserId"

    .line 162
    .line 163
    const-string v78, "advertiser_id"

    .line 164
    .line 165
    const-string v79, "sha1_advertiser_id"

    .line 166
    .line 167
    const-string v80, "muid"

    .line 168
    .line 169
    const-string v81, "idfv"

    .line 170
    .line 171
    const-string v82, "md5_idfv"

    .line 172
    .line 173
    const-string v83, "sha1_idfv"

    .line 174
    .line 175
    const-string v84, "af_installpostback"

    .line 176
    .line 177
    const-string v85, "http_referrer"

    .line 178
    .line 179
    const-string v86, "af_model"

    .line 180
    .line 181
    const-string v87, "af_os"

    .line 182
    .line 183
    const-string v88, "md5_advertiserId"

    .line 184
    .line 185
    const-string v89, "af_video_total_length"

    .line 186
    .line 187
    const-string v90, "af_video_played_length"

    .line 188
    .line 189
    const-string v91, "af_playable_played_length"

    .line 190
    .line 191
    const-string v92, "af_ad_time_viewed"

    .line 192
    .line 193
    const-string v93, "af_ad_displayed_percent"

    .line 194
    .line 195
    const-string v94, "af_audio_total_length"

    .line 196
    .line 197
    const-string v95, "af_audio_played_length"

    .line 198
    .line 199
    const-string v96, "af_status"

    .line 200
    .line 201
    filled-new-array/range {v1 .. v98}, [Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-interface {v0, v1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 210
    .line 211
    .line 212
    new-instance v1, Ljava/util/HashMap;

    .line 213
    .line 214
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_0

    .line 226
    .line 227
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    check-cast v2, Ljava/lang/String;

    .line 232
    .line 233
    move-object/from16 v3, p0

    .line 234
    .line 235
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    check-cast v4, Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v1, v2, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 246
    .line 247
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 248
    .line 249
    .line 250
    invoke-static {v0}, Lcom/appsflyer/deeplink/DeepLink;->AFAdRevenueData(Lorg/json/JSONObject;)Lcom/appsflyer/deeplink/DeepLink;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    return-object v0
.end method

.method public static AFAdRevenueData(Lorg/json/JSONObject;)Lcom/appsflyer/deeplink/DeepLink;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 255
    const-string v0, "custom_params"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 256
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 257
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 258
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 259
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 260
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 261
    :cond_0
    new-instance v0, Lcom/appsflyer/deeplink/DeepLink;

    invoke-direct {v0, p0}, Lcom/appsflyer/deeplink/DeepLink;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method


# virtual methods
.method public getAfSub1()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "af_sub1"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getAfSub2()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "af_sub2"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getAfSub3()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "af_sub3"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getAfSub4()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "af_sub4"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getAfSub5()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "af_sub5"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getCampaign()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "campaign"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getCampaignId()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "campaign_id"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getClickEvent()Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public getClickHttpReferrer()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "click_http_referrer"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getDeepLinkValue()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "deep_link_value"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getMatchType()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "match_type"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getMediaSource()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "media_source"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public getStringValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object p1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-ne p0, p1, :cond_0

    .line 11
    .line 12
    move-object p0, v0

    .line 13
    :cond_0
    if-nez p0, :cond_1

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public isDeferred()Ljava/lang/Boolean;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "is_deferred"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    check-cast p0, Ljava/lang/Boolean;

    .line 15
    .line 16
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/deeplink/DeepLink;->getMediationNetwork:Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
