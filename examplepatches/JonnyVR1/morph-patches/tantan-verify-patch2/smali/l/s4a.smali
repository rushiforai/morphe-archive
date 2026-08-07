.class public Ll/s4a;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ljava/util/List;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/hk50;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/byd0;

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    const-string v5, "notification_home_dialog_show_time"

    .line 15
    .line 16
    invoke-direct {v1, v5, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 17
    .line 18
    .line 19
    new-instance v5, Ll/vxd0;

    .line 20
    .line 21
    const-string v6, "notification_home_dialog_show_cnt"

    .line 22
    .line 23
    const/4 v7, 0x0

    .line 24
    invoke-direct {v5, v6, v7}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    new-instance v6, Ll/hk50;

    .line 28
    .line 29
    sget-object v8, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_prompt_notification_auth_popup_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 30
    .line 31
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    check-cast v5, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/lang/Long;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 52
    .line 53
    .line 54
    move-result-wide v9

    .line 55
    invoke-direct {v6, v8, v5, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    new-instance v1, Ll/byd0;

    .line 62
    .line 63
    const-string v5, "lost_location_notify_dlg"

    .line 64
    .line 65
    invoke-direct {v1, v5, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 66
    .line 67
    .line 68
    new-instance v5, Ll/hk50;

    .line 69
    .line 70
    sget-object v6, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_positioning_authority_open_guide_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 71
    .line 72
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    check-cast v8, Ljava/lang/Long;

    .line 81
    .line 82
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 83
    .line 84
    .line 85
    move-result-wide v8

    .line 86
    cmp-long v8, v8, v2

    .line 87
    .line 88
    const/4 v9, 0x1

    .line 89
    if-lez v8, :cond_0

    .line 90
    .line 91
    move v8, v9

    .line 92
    goto :goto_0

    .line 93
    :cond_0
    move v8, v7

    .line 94
    :goto_0
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Ljava/lang/Long;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v10

    .line 104
    invoke-direct {v5, v6, v8, v10, v11}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    new-instance v1, Ll/vxd0;

    .line 111
    .line 112
    const-string v5, "has_pic_verification_intro_show_count"

    .line 113
    .line 114
    const/4 v6, 0x3

    .line 115
    invoke-direct {v1, v5, v6}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    new-instance v5, Ll/byd0;

    .line 119
    .line 120
    const-string v8, "last_pic_verification_guide_shown_time"

    .line 121
    .line 122
    invoke-direct {v5, v8, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 123
    .line 124
    .line 125
    new-instance v8, Ll/hk50;

    .line 126
    .line 127
    sget-object v10, Lcom/p1/mobile/putong/core/oms/OmsDialog;->real_person_guide:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 128
    .line 129
    invoke-virtual {v10}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    check-cast v1, Ljava/lang/Integer;

    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    sub-int/2addr v6, v1

    .line 144
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    check-cast v5, Ljava/lang/Long;

    .line 153
    .line 154
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 155
    .line 156
    .line 157
    move-result-wide v5

    .line 158
    invoke-direct {v8, v10, v1, v5, v6}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 159
    .line 160
    .line 161
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    new-instance v1, Ll/byd0;

    .line 165
    .line 166
    const-string v5, "LastShowAPPStoreGuideDlgTime"

    .line 167
    .line 168
    invoke-direct {v1, v5, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 169
    .line 170
    .line 171
    new-instance v5, Ll/vxd0;

    .line 172
    .line 173
    const-string v6, "AppStoreGuideDlgShowCount"

    .line 174
    .line 175
    invoke-direct {v5, v6, v7}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 176
    .line 177
    .line 178
    new-instance v6, Ll/hk50;

    .line 179
    .line 180
    sget-object v8, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 181
    .line 182
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v10

    .line 190
    check-cast v10, Ljava/lang/Long;

    .line 191
    .line 192
    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    .line 193
    .line 194
    .line 195
    move-result-wide v10

    .line 196
    cmp-long v10, v10, v2

    .line 197
    .line 198
    if-lez v10, :cond_1

    .line 199
    .line 200
    move v10, v9

    .line 201
    goto :goto_1

    .line 202
    :cond_1
    move v10, v7

    .line 203
    :goto_1
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v11

    .line 207
    check-cast v11, Ljava/lang/Long;

    .line 208
    .line 209
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    .line 210
    .line 211
    .line 212
    move-result-wide v11

    .line 213
    invoke-direct {v6, v8, v10, v11, v12}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 214
    .line 215
    .line 216
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    new-instance v6, Ll/hk50;

    .line 220
    .line 221
    sget-object v8, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup_store:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 222
    .line 223
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v8

    .line 227
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    check-cast v5, Ljava/lang/Integer;

    .line 232
    .line 233
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 234
    .line 235
    .line 236
    move-result v5

    .line 237
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    check-cast v1, Ljava/lang/Long;

    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 244
    .line 245
    .line 246
    move-result-wide v10

    .line 247
    invoke-direct {v6, v8, v5, v10, v11}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 248
    .line 249
    .line 250
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    new-instance v1, Ll/hk50;

    .line 254
    .line 255
    sget-object v5, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_vip_upgrade_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 256
    .line 257
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 262
    .line 263
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 264
    .line 265
    iget-object v6, v6, Ll/dkb;->h0:Ll/jxd0;

    .line 266
    .line 267
    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v6

    .line 271
    check-cast v6, Ljava/lang/Boolean;

    .line 272
    .line 273
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 274
    .line 275
    .line 276
    move-result v6

    .line 277
    invoke-direct {v1, v5, v6, v2, v3}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 278
    .line 279
    .line 280
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    new-instance v1, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 284
    .line 285
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DialogShowInfo;-><init>()V

    .line 286
    .line 287
    .line 288
    new-instance v1, Ll/byd0;

    .line 289
    .line 290
    const-string v5, "rate_popup_last_shown_new"

    .line 291
    .line 292
    invoke-direct {v1, v5, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 293
    .line 294
    .line 295
    new-instance v4, Ll/hk50;

    .line 296
    .line 297
    sget-object v5, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_intl_5star_dialog_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 298
    .line 299
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v5

    .line 303
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v6

    .line 307
    check-cast v6, Ljava/lang/Long;

    .line 308
    .line 309
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 310
    .line 311
    .line 312
    move-result-wide v10

    .line 313
    cmp-long v2, v10, v2

    .line 314
    .line 315
    if-lez v2, :cond_2

    .line 316
    .line 317
    move v7, v9

    .line 318
    :cond_2
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    check-cast v1, Ljava/lang/Long;

    .line 323
    .line 324
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 325
    .line 326
    .line 327
    move-result-wide v1

    .line 328
    invoke-direct {v4, v5, v7, v1, v2}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 329
    .line 330
    .line 331
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    return-object v0
.end method

.method public static b()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/hk50;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/hk50;

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_vip_expired:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {}, Ll/i7d0;->b()Ll/i7d0;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Ll/i7d0;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const-wide/16 v4, 0x0

    .line 23
    .line 24
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    invoke-direct {v1, v2, v3, v4, v5}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/hk50;

    .line 35
    .line 36
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_purchase_guide_page:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v3, v3, Ll/tqi;->f:Ll/byd0;

    .line 47
    .line 48
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ljava/lang/Long;

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v7

    .line 58
    cmp-long v3, v7, v4

    .line 59
    .line 60
    const/4 v7, 0x1

    .line 61
    const/4 v8, 0x0

    .line 62
    if-lez v3, :cond_0

    .line 63
    .line 64
    move v3, v7

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    move v3, v8

    .line 67
    :goto_0
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    iget-object v9, v9, Ll/tqi;->f:Ll/byd0;

    .line 72
    .line 73
    invoke-virtual {v9}, Ll/azd0;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    check-cast v9, Ljava/lang/Long;

    .line 78
    .line 79
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v9

    .line 83
    invoke-direct {v1, v2, v3, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 84
    .line 85
    .line 86
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    new-instance v1, Ll/hk50;

    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_purchase_expire_page:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    iget-object v3, v3, Ll/tqi;->g:Ll/byd0;

    .line 102
    .line 103
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Ljava/lang/Long;

    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 110
    .line 111
    .line 112
    move-result-wide v9

    .line 113
    cmp-long v3, v9, v4

    .line 114
    .line 115
    if-lez v3, :cond_1

    .line 116
    .line 117
    move v3, v7

    .line 118
    goto :goto_1

    .line 119
    :cond_1
    move v3, v8

    .line 120
    :goto_1
    invoke-static {}, Ll/tqi;->a()Ll/tqi;

    .line 121
    .line 122
    .line 123
    move-result-object v9

    .line 124
    iget-object v9, v9, Ll/tqi;->g:Ll/byd0;

    .line 125
    .line 126
    invoke-virtual {v9}, Ll/azd0;->get()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    check-cast v9, Ljava/lang/Long;

    .line 131
    .line 132
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 133
    .line 134
    .line 135
    move-result-wide v9

    .line 136
    invoke-direct {v1, v2, v3, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 137
    .line 138
    .line 139
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-instance v1, Ll/jxd0;

    .line 143
    .line 144
    new-instance v2, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    const-string v3, "special_like_dlg_"

    .line 147
    .line 148
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 167
    .line 168
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 169
    .line 170
    .line 171
    new-instance v2, Ll/hk50;

    .line 172
    .line 173
    sget-object v9, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_dislike_who_liked_me_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 174
    .line 175
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    check-cast v1, Ljava/lang/Boolean;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-direct {v2, v9, v1, v4, v5}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 190
    .line 191
    .line 192
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    new-instance v1, Ll/jxd0;

    .line 196
    .line 197
    new-instance v2, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v9, "has_shown_crop_picture_guide_dlg_"

    .line 200
    .line 201
    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 205
    .line 206
    .line 207
    move-result-object v9

    .line 208
    invoke-interface {v9}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-direct {v1, v2, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 220
    .line 221
    .line 222
    new-instance v2, Ll/hk50;

    .line 223
    .line 224
    sget-object v3, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_profile_picture_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 225
    .line 226
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    check-cast v1, Ljava/lang/Boolean;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    invoke-direct {v2, v3, v1, v4, v5}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 241
    .line 242
    .line 243
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 247
    .line 248
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 249
    .line 250
    iget-object v1, v1, Ll/dkb;->R0:Ll/byd0;

    .line 251
    .line 252
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    check-cast v1, Ljava/lang/Long;

    .line 257
    .line 258
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 259
    .line 260
    .line 261
    move-result-wide v1

    .line 262
    new-instance v3, Ll/hk50;

    .line 263
    .line 264
    sget-object v9, Lcom/p1/mobile/putong/core/oms/OmsDialog;->alert_cheat_risk_alarm_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 265
    .line 266
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v9

    .line 270
    cmp-long v10, v1, v4

    .line 271
    .line 272
    if-lez v10, :cond_2

    .line 273
    .line 274
    move v10, v7

    .line 275
    goto :goto_2

    .line 276
    :cond_2
    move v10, v8

    .line 277
    :goto_2
    invoke-direct {v3, v9, v10, v1, v2}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 278
    .line 279
    .line 280
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    .line 282
    .line 283
    new-instance v1, Ll/hk50;

    .line 284
    .line 285
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->alert_cheat_tips_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 286
    .line 287
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 292
    .line 293
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 294
    .line 295
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/g;->z0:Ll/vxd0;

    .line 296
    .line 297
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    check-cast v3, Ljava/lang/Integer;

    .line 302
    .line 303
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 308
    .line 309
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 310
    .line 311
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/g;->n0:Ll/byd0;

    .line 312
    .line 313
    invoke-virtual {v9}, Ll/azd0;->get()Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object v9

    .line 317
    check-cast v9, Ljava/lang/Long;

    .line 318
    .line 319
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 320
    .line 321
    .line 322
    move-result-wide v9

    .line 323
    invoke-direct {v1, v2, v3, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 324
    .line 325
    .line 326
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    invoke-static {}, Ll/du80;->g()Ll/du80;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    iget-object v1, v1, Ll/du80;->d:Ll/jxd0;

    .line 334
    .line 335
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    check-cast v1, Ljava/lang/Boolean;

    .line 340
    .line 341
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    new-instance v2, Ll/hk50;

    .line 346
    .line 347
    sget-object v3, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_choose_sale_expire:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 348
    .line 349
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    invoke-direct {v2, v3, v1, v4, v5}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 354
    .line 355
    .line 356
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    new-instance v1, Ll/hk50;

    .line 360
    .line 361
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_no_match_svip:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 362
    .line 363
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 368
    .line 369
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 370
    .line 371
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->D0:Ll/vxd0;

    .line 372
    .line 373
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    check-cast v3, Ljava/lang/Integer;

    .line 378
    .line 379
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 380
    .line 381
    .line 382
    move-result v3

    .line 383
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 384
    .line 385
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 386
    .line 387
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E0:Ll/byd0;

    .line 388
    .line 389
    invoke-virtual {v9}, Ll/azd0;->get()Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v9

    .line 393
    check-cast v9, Ljava/lang/Long;

    .line 394
    .line 395
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 396
    .line 397
    .line 398
    move-result-wide v9

    .line 399
    invoke-direct {v1, v2, v3, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 400
    .line 401
    .line 402
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    new-instance v1, Ll/hk50;

    .line 406
    .line 407
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->see_guide:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 408
    .line 409
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 414
    .line 415
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 416
    .line 417
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->D0:Ll/vxd0;

    .line 418
    .line 419
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    move-result-object v3

    .line 423
    check-cast v3, Ljava/lang/Integer;

    .line 424
    .line 425
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 426
    .line 427
    .line 428
    move-result v3

    .line 429
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 430
    .line 431
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 432
    .line 433
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E0:Ll/byd0;

    .line 434
    .line 435
    invoke-virtual {v9}, Ll/azd0;->get()Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v9

    .line 439
    check-cast v9, Ljava/lang/Long;

    .line 440
    .line 441
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 442
    .line 443
    .line 444
    move-result-wide v9

    .line 445
    invoke-direct {v1, v2, v3, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 446
    .line 447
    .line 448
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 449
    .line 450
    .line 451
    new-instance v1, Ll/vxd0;

    .line 452
    .line 453
    new-instance v2, Ljava/lang/StringBuilder;

    .line 454
    .line 455
    const-string v3, "picAndAvatarVerSwipeNotifyCount"

    .line 456
    .line 457
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 458
    .line 459
    .line 460
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 461
    .line 462
    .line 463
    move-result-object v3

    .line 464
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v3

    .line 468
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    invoke-direct {v1, v2, v8}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 476
    .line 477
    .line 478
    new-instance v2, Ll/byd0;

    .line 479
    .line 480
    new-instance v3, Ljava/lang/StringBuilder;

    .line 481
    .line 482
    const-string v9, "lastPicAndAvatarVerShowTime"

    .line 483
    .line 484
    invoke-direct {v3, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 488
    .line 489
    .line 490
    move-result-object v9

    .line 491
    invoke-interface {v9}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v9

    .line 495
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 496
    .line 497
    .line 498
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v3

    .line 502
    invoke-direct {v2, v3, v6}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 503
    .line 504
    .line 505
    new-instance v3, Ll/hk50;

    .line 506
    .line 507
    sget-object v9, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_merge_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 508
    .line 509
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v9

    .line 513
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    check-cast v1, Ljava/lang/Integer;

    .line 518
    .line 519
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 520
    .line 521
    .line 522
    move-result v1

    .line 523
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object v2

    .line 527
    check-cast v2, Ljava/lang/Long;

    .line 528
    .line 529
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 530
    .line 531
    .line 532
    move-result-wide v10

    .line 533
    invoke-direct {v3, v9, v1, v10, v11}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 534
    .line 535
    .line 536
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    new-instance v1, Ll/byd0;

    .line 540
    .line 541
    new-instance v2, Ljava/lang/StringBuilder;

    .line 542
    .line 543
    const-string v3, "vip_upgrade_svip_purchase_dialog_shown_timestamp_"

    .line 544
    .line 545
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 549
    .line 550
    .line 551
    move-result-object v3

    .line 552
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v3

    .line 556
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v2

    .line 563
    invoke-direct {v1, v2, v6}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 564
    .line 565
    .line 566
    new-instance v2, Ll/hk50;

    .line 567
    .line 568
    sget-object v3, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_purchase_page:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 569
    .line 570
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v3

    .line 574
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 575
    .line 576
    .line 577
    move-result-object v6

    .line 578
    check-cast v6, Ljava/lang/Long;

    .line 579
    .line 580
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 581
    .line 582
    .line 583
    move-result-wide v9

    .line 584
    cmp-long v6, v9, v4

    .line 585
    .line 586
    if-lez v6, :cond_3

    .line 587
    .line 588
    move v6, v7

    .line 589
    goto :goto_3

    .line 590
    :cond_3
    move v6, v8

    .line 591
    :goto_3
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v1

    .line 595
    check-cast v1, Ljava/lang/Long;

    .line 596
    .line 597
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 598
    .line 599
    .line 600
    move-result-wide v9

    .line 601
    invoke-direct {v2, v3, v6, v9, v10}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 602
    .line 603
    .line 604
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 605
    .line 606
    .line 607
    new-instance v1, Ll/hk50;

    .line 608
    .line 609
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_new_users_see_purchase_guide_see_view:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 610
    .line 611
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v2

    .line 615
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->h:Ll/vwa;

    .line 616
    .line 617
    iget-object v3, v3, Ll/vwa;->a:Ll/jxd0;

    .line 618
    .line 619
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 620
    .line 621
    .line 622
    move-result-object v3

    .line 623
    check-cast v3, Ljava/lang/Boolean;

    .line 624
    .line 625
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 626
    .line 627
    .line 628
    move-result v3

    .line 629
    invoke-direct {v1, v2, v3, v4, v5}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 630
    .line 631
    .line 632
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 633
    .line 634
    .line 635
    new-instance v1, Ll/hk50;

    .line 636
    .line 637
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_offline_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 638
    .line 639
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 640
    .line 641
    .line 642
    move-result-object v2

    .line 643
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 644
    .line 645
    .line 646
    move-result-object v3

    .line 647
    iget-object v3, v3, Ll/j7d0;->d:Ll/byd0;

    .line 648
    .line 649
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    move-result-object v3

    .line 653
    check-cast v3, Ljava/lang/Long;

    .line 654
    .line 655
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 656
    .line 657
    .line 658
    move-result-wide v9

    .line 659
    cmp-long v3, v9, v4

    .line 660
    .line 661
    if-lez v3, :cond_4

    .line 662
    .line 663
    goto :goto_4

    .line 664
    :cond_4
    move v7, v8

    .line 665
    :goto_4
    invoke-static {}, Ll/j7d0;->c0()Ll/j7d0;

    .line 666
    .line 667
    .line 668
    move-result-object v3

    .line 669
    iget-object v3, v3, Ll/j7d0;->d:Ll/byd0;

    .line 670
    .line 671
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 672
    .line 673
    .line 674
    move-result-object v3

    .line 675
    check-cast v3, Ljava/lang/Long;

    .line 676
    .line 677
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 678
    .line 679
    .line 680
    move-result-wide v3

    .line 681
    invoke-direct {v1, v2, v7, v3, v4}, Ll/hk50;-><init>(Ljava/lang/String;IJ)V

    .line 682
    .line 683
    .line 684
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    return-object v0
.end method
