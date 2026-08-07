.class public Ll/lxf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ltl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lxf$l;
    }
.end annotation


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lxf;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ljava/util/HashMap;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/ltl$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lxf;->f(Landroid/content/Context;Ljava/util/HashMap;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/ltl$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Landroid/content/Context;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p3, p2, p4}, Ll/lxf;->o(Landroid/content/Context;Ljava/util/HashMap;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/ltl$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/lxf$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput-object p2, p0, Ll/lxf;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public final d(Ljava/util/HashMap;)Landroid/os/Bundle;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-lez v3, :cond_1

    .line 17
    .line 18
    const-string v3, "option-key-appid"

    .line 19
    .line 20
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    const-string v3, "option-key-faceid"

    .line 25
    .line 26
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const-string v3, "option-key-agreementno"

    .line 31
    .line 32
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    const-string v3, "option-key-appversion"

    .line 37
    .line 38
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    const-string v3, "option-key-userid"

    .line 43
    .line 44
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v10

    .line 48
    const-string v3, "option-key-sign"

    .line 49
    .line 50
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v11

    .line 54
    const-string v3, "option-key-licence"

    .line 55
    .line 56
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v13

    .line 60
    const-string v3, "option-key-nonce"

    .line 61
    .line 62
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v9

    .line 66
    const-string v3, "option-key-language"

    .line 67
    .line 68
    invoke-static {v1, v3}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v3}, Ll/ixf;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    new-instance v4, Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk$InputData;

    .line 77
    .line 78
    sget-object v12, Lcom/tencent/cloud/huiyansdkface/facelight/process/FaceVerifyStatus$Mode;->GRADE:Lcom/tencent/cloud/huiyansdkface/facelight/process/FaceVerifyStatus$Mode;

    .line 79
    .line 80
    invoke-direct/range {v4 .. v13}, Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk$InputData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/cloud/huiyansdkface/facelight/process/FaceVerifyStatus$Mode;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const-string v5, "colorMode"

    .line 84
    .line 85
    invoke-static {v1, v5}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    const-string v7, "customerTipsInLive"

    .line 90
    .line 91
    invoke-static {v1, v7}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v9

    .line 99
    if-eqz v9, :cond_0

    .line 100
    .line 101
    iget-object v9, v0, Ll/lxf;->b:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    if-nez v9, :cond_0

    .line 108
    .line 109
    iget-object v8, v0, Ll/lxf;->b:Ljava/lang/String;

    .line 110
    .line 111
    :cond_0
    const-string v0, "customerTipsInUpload"

    .line 112
    .line 113
    invoke-static {v1, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    const-string v10, "uiType"

    .line 118
    .line 119
    invoke-static {v1, v10}, Ll/ixf;->b(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v11

    .line 123
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 124
    .line 125
    .line 126
    move-result v11

    .line 127
    const-string v12, "compareType"

    .line 128
    .line 129
    invoke-static {v1, v12}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    const-string v14, "videoUpload"

    .line 134
    .line 135
    invoke-static {v1, v14}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 136
    .line 137
    .line 138
    move-result-object v15

    .line 139
    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result v15

    .line 143
    move-object/from16 v16, v3

    .line 144
    .line 145
    const-string v3, "videoCheck"

    .line 146
    .line 147
    invoke-static {v1, v3}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 148
    .line 149
    .line 150
    move-result-object v17

    .line 151
    move-object/from16 p0, v3

    .line 152
    .line 153
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Boolean;->booleanValue()Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    move/from16 v17, v3

    .line 158
    .line 159
    const-string v3, "playVoice"

    .line 160
    .line 161
    invoke-static {v1, v3}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    move/from16 p1, v1

    .line 170
    .line 171
    const-string v1, "inputData"

    .line 172
    .line 173
    invoke-virtual {v2, v1, v4}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v2, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2, v7, v8}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v2, v0, v9}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v2, v10, v11}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v2, v12, v13}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v14, v15}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 192
    .line 193
    .line 194
    move-object/from16 v1, p0

    .line 195
    .line 196
    move/from16 v0, v17

    .line 197
    .line 198
    invoke-virtual {v2, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 199
    .line 200
    .line 201
    move/from16 v0, p1

    .line 202
    .line 203
    invoke-virtual {v2, v3, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 204
    .line 205
    .line 206
    const-string v0, "WBFaceVerifyLanguage"

    .line 207
    .line 208
    move-object/from16 v1, v16

    .line 209
    .line 210
    invoke-virtual {v2, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :cond_1
    return-object v2
.end method

.method public final e(Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "ext_params_key_screen_orientation"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "ext_params_key_use_video"

    .line 13
    .line 14
    invoke-static {p1, v2}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    const-string v4, "ext_params_key_ocr_bottom_button_color"

    .line 19
    .line 20
    invoke-static {p1, v4}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    const-string v6, "ext_params_key_face_progress_color"

    .line 25
    .line 26
    invoke-static {p1, v6}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    if-nez v7, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0, v6, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    :cond_3
    return-object p0
.end method

.method public final f(Landroid/content/Context;Ljava/util/HashMap;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/ltl$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/lxf$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    aget p3, v0, p3

    .line 8
    .line 9
    packed-switch p3, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    :pswitch_0
    return-void

    .line 13
    :pswitch_1
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->i(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_2
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->h(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_3
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->m(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_4
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->l(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_5
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->g(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_6
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->j(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_7
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->k(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final g(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/jxf;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jxf;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/alipay/face/api/ZIMFacade;->install(Landroid/content/Context;)I

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Ll/jxf;->a:Z

    .line 19
    .line 20
    if-eqz p3, :cond_1

    .line 21
    .line 22
    invoke-interface {p3, p0}, Ll/ltl$a;->a(Ll/jxf;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :goto_1
    if-eqz p3, :cond_1

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    iput-boolean p2, p0, Ll/jxf;->a:Z

    .line 30
    .line 31
    iput-object p1, p0, Ll/jxf;->h:Ljava/lang/Throwable;

    .line 32
    .line 33
    invoke-interface {p3, p0}, Ll/ltl$a;->c(Ll/jxf;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final h(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance p2, Ll/jxf;

    .line 2
    .line 3
    invoke-direct {p2}, Ll/jxf;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "identityutils"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/lxf;->n(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "AliyunMNN"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/lxf;->n(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/api/IdentityPlatform;->getInstance()Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->install(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    iput-boolean p0, p2, Ll/jxf;->a:Z

    .line 33
    .line 34
    if-eqz p3, :cond_1

    .line 35
    .line 36
    invoke-interface {p3, p2}, Ll/ltl$a;->a(Ll/jxf;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :goto_1
    if-eqz p3, :cond_1

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-boolean p1, p2, Ll/jxf;->a:Z

    .line 44
    .line 45
    iput-object p0, p2, Ll/jxf;->h:Ljava/lang/Throwable;

    .line 46
    .line 47
    invoke-interface {p3, p2}, Ll/ltl$a;->c(Ll/jxf;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final i(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v1, Ll/jxf;

    .line 2
    .line 3
    invoke-direct {v1}, Ll/jxf;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "option-key-sts-token"

    .line 7
    .line 8
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    const-string v0, "option-key-access_id"

    .line 13
    .line 14
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    const-string v0, "option-key-secret_key"

    .line 19
    .line 20
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    :try_start_0
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    move-object p0, v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    invoke-static {}, Lcom/bytedance/labcv/bytedcertsdk/manager/BytedFaceLiveManager;->getInstance()Lcom/bytedance/labcv/bytedcertsdk/manager/BytedFaceLiveManager;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v7, Ll/lxf$d;

    .line 38
    .line 39
    invoke-direct {v7, p0, v1, p3}, Ll/lxf$d;-><init>(Ll/lxf;Ll/jxf;Ll/ltl$a;)V

    .line 40
    .line 41
    .line 42
    move-object v3, p1

    .line 43
    invoke-virtual/range {v2 .. v7}, Lcom/bytedance/labcv/bytedcertsdk/manager/BytedFaceLiveManager;->setSignAccessKeySecretAccessKey(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/labcv/bytedcertsdk/callback/SDKCallBack$StringResultCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :goto_1
    if-eqz p3, :cond_1

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput-boolean p1, v1, Ll/jxf;->a:Z

    .line 51
    .line 52
    iput-object p0, v1, Ll/jxf;->h:Ljava/lang/Throwable;

    .line 53
    .line 54
    invoke-interface {p3, v1}, Ll/ltl$a;->c(Ll/jxf;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public final j(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "option-key-appid"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 18
    .line 19
    .line 20
    :cond_0
    new-instance v0, Ll/jxf;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/jxf;-><init>()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    invoke-static {}, Lcom/immomo/mncertification/MNFCService;->getInstance()Lcom/immomo/mncertification/MNFCService;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, p1, p2}, Lcom/immomo/mncertification/MNFCService;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/immomo/mncertification/MNFCService;->getInstance()Lcom/immomo/mncertification/MNFCService;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/lxf$f;

    .line 37
    .line 38
    invoke-direct {p2, p0, v0, p3}, Ll/lxf$f;-><init>(Ll/lxf;Ll/jxf;Ll/ltl$a;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p2}, Lcom/immomo/mncertification/MNFCService;->preloadResource(Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catch_0
    move-exception p0

    .line 46
    const/4 p1, 0x0

    .line 47
    iput-boolean p1, v0, Ll/jxf;->a:Z

    .line 48
    .line 49
    iput-object p0, v0, Ll/jxf;->h:Ljava/lang/Throwable;

    .line 50
    .line 51
    if-eqz p3, :cond_1

    .line 52
    .line 53
    invoke-interface {p3, v0}, Ll/ltl$a;->c(Ll/jxf;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final k(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/lxf;->d(Ljava/util/HashMap;)Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk;->getInstance()Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/lxf$c;

    .line 15
    .line 16
    invoke-direct {v1, p0, p3}, Ll/lxf$c;-><init>(Ll/lxf;Ll/ltl$a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1, p2, v1}, Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk;->initSdk(Landroid/content/Context;Landroid/os/Bundle;Lcom/tencent/cloud/huiyansdkface/facelight/api/listeners/WbCloudFaceVerifyLoginListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final l(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    const-string v0, "YTCommonLiveness"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/lxf;->n(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "YTLiveness"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/lxf;->n(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;->init(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const-string p1, "option-key-licence"

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "option-key-save-cache"

    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const-string v1, "colorMode"

    .line 43
    .line 44
    invoke-static {p2, v1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "option_key_show_guide_page"

    .line 49
    .line 50
    invoke-static {p2, v2}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    new-instance v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 59
    .line 60
    invoke-direct {v2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;-><init>()V

    .line 61
    .line 62
    .line 63
    xor-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    iput-boolean v0, v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isDeleteVideoCache:Z

    .line 66
    .line 67
    iput-object p1, v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->authLicense:Ljava/lang/String;

    .line 68
    .line 69
    iput-boolean p2, v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->isShowGuidePage:Z

    .line 70
    .line 71
    const-string p1, "black"

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_0

    .line 78
    .line 79
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Dark:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 80
    .line 81
    iput-object p1, v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 85
    .line 86
    iput-object p1, v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->pageColorStyle:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 87
    .line 88
    :goto_0
    if-eqz p3, :cond_1

    .line 89
    .line 90
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 91
    .line 92
    .line 93
    :cond_1
    new-instance p1, Ll/jxf;

    .line 94
    .line 95
    invoke-direct {p1}, Ll/jxf;-><init>()V

    .line 96
    .line 97
    .line 98
    new-instance p2, Ll/lxf$e;

    .line 99
    .line 100
    invoke-direct {p2, p0, p1, p3}, Ll/lxf$e;-><init>(Ll/lxf;Ll/jxf;Ll/ltl$a;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v2, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;->startGetAuthConfigData(Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanConfigCallback;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method

.method public final m(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$a;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$a;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    const-string v0, "YTCommonLiveness"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/lxf;->n(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "YTLiveness"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/lxf;->n(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;->init(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    const-string p1, "option-key-licence"

    .line 27
    .line 28
    invoke-static {p2, p1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "option-key-save-cache"

    .line 33
    .line 34
    invoke-static {p2, v0}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const-string v1, "colorMode"

    .line 43
    .line 44
    invoke-static {p2, v1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "option_key_show_guide_page"

    .line 49
    .line 50
    invoke-static {p2, v2}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    new-instance v2, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 59
    .line 60
    invoke-direct {v2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v2, p0, Ll/lxf;->c:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 64
    .line 65
    const/4 v3, 0x1

    .line 66
    xor-int/2addr v0, v3

    .line 67
    invoke-virtual {v2, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->setDeleteVideoCache(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/lxf;->c:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->setAuthLicense(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/lxf;->c:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 76
    .line 77
    invoke-virtual {p1, p2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->setShowGuidePage(Z)V

    .line 78
    .line 79
    .line 80
    const-string p1, "black"

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-object p0, p0, Ll/lxf;->c:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 87
    .line 88
    if-eqz p1, :cond_0

    .line 89
    .line 90
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Dark:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->setPageColorStyle(Lcom/tencent/could/huiyansdk/enums/PageColorStyle;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/PageColorStyle;->Light:Lcom/tencent/could/huiyansdk/enums/PageColorStyle;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;->setPageColorStyle(Lcom/tencent/could/huiyansdk/enums/PageColorStyle;)V

    .line 99
    .line 100
    .line 101
    :goto_0
    if-eqz p3, :cond_1

    .line 102
    .line 103
    invoke-interface {p3}, Ll/ltl$a;->b()V

    .line 104
    .line 105
    .line 106
    :cond_1
    new-instance p0, Ll/jxf;

    .line 107
    .line 108
    invoke-direct {p0}, Ll/jxf;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-boolean v3, p0, Ll/jxf;->a:Z

    .line 112
    .line 113
    if-eqz p3, :cond_2

    .line 114
    .line 115
    invoke-interface {p3, p0}, Ll/ltl$a;->a(Ll/jxf;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catchall_0
    return-void
.end method

.method public final o(Landroid/content/Context;Ljava/util/HashMap;Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;Ll/ltl$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/tantanapp/media/ttmediamncertification/FacertificationSDKType;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/lxf$b;->a:[I

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    aget p3, v0, p3

    .line 8
    .line 9
    packed-switch p3, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    :pswitch_0
    return-void

    .line 13
    :pswitch_1
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->r(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_2
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->q(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_3
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->u(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_4
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->t(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_5
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->p(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_6
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->s(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_7
    invoke-virtual {p0, p1, p2, p4}, Ll/lxf;->v(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final p(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "option-key-token"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "option-key-usemsgbox"

    .line 16
    .line 17
    invoke-static {p2, v1}, Ll/ixf;->a(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p0, p2}, Ll/lxf;->e(Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-static {p1}, Lcom/alipay/face/api/ZIMFacadeBuilder;->create(Landroid/content/Context;)Lcom/alipay/face/api/ZIMFacade;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v2, Ll/lxf$j;

    .line 34
    .line 35
    invoke-direct {v2, p0, p3}, Ll/lxf$j;-><init>(Ll/lxf;Ll/ltl$b;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0, v1, p2, v2}, Lcom/alipay/face/api/ZIMFacade;->verify(Ljava/lang/String;ZLjava/util/HashMap;Lcom/alipay/face/api/ZIMCallback;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final q(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const-string p1, "option-key-token"

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Lcom/idv/identity/platform/api/IdentityPlatform;->getInstance()Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance v0, Ll/lxf$k;

    .line 20
    .line 21
    invoke-direct {v0, p0, p3}, Ll/lxf$k;-><init>(Ll/lxf;Ll/ltl$b;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    invoke-virtual {p2, p1, p0, v0}, Lcom/idv/identity/platform/api/IdentityPlatform;->verify(Ljava/lang/String;Ljava/util/Map;Lcom/idv/identity/platform/api/IdentityCallback;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final r(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "option-key-verity-type"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "option-key-bytedance_token"

    .line 16
    .line 17
    invoke-static {p2, v1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    const-string v1, "option-key-client_config"

    .line 22
    .line 23
    invoke-static {p2, v1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    new-instance v4, Lcom/bytedance/labcv/bytedcertsdk/model/CertConfig;

    .line 28
    .line 29
    const-string p2, "identity"

    .line 30
    .line 31
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    const/4 v0, 0x0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-direct {v4, v1, p2, v0}, Lcom/bytedance/labcv/bytedcertsdk/model/CertConfig;-><init>(ZZZ)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/bytedance/labcv/bytedcertsdk/manager/BytedFaceLiveManager;->getInstance()Lcom/bytedance/labcv/bytedcertsdk/manager/BytedFaceLiveManager;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    new-instance v7, Ll/lxf$a;

    .line 45
    .line 46
    invoke-direct {v7, p0, p3}, Ll/lxf$a;-><init>(Ll/lxf;Ll/ltl$b;)V

    .line 47
    .line 48
    .line 49
    move-object v3, p1

    .line 50
    invoke-virtual/range {v2 .. v7}, Lcom/bytedance/labcv/bytedcertsdk/manager/BytedFaceLiveManager;->startFaceCert(Landroid/content/Context;Lcom/bytedance/labcv/bytedcertsdk/model/CertConfig;Ljava/lang/String;Ljava/lang/String;Lcom/bytedance/labcv/bytedcertsdk/callback/SDKCallBack$ResultCallback;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final s(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    instance-of v0, p1, Landroid/app/Activity;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "option-key-mode"

    .line 14
    .line 15
    invoke-static {p2, v0}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "option-key-action-count"

    .line 20
    .line 21
    invoke-static {p2, v2}, Ll/ixf;->b(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    move-object v3, p1

    .line 30
    check-cast v3, Landroid/app/Activity;

    .line 31
    .line 32
    new-instance v4, Ll/lxf$l;

    .line 33
    .line 34
    invoke-direct {v4, p3}, Ll/lxf$l;-><init>(Ll/ltl$b;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p3, v4}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 42
    .line 43
    .line 44
    new-instance p3, Landroid/content/Intent;

    .line 45
    .line 46
    const-class v3, Lcom/tantanapp/media/ttmediamncertification/impl/DummyActivity;

    .line 47
    .line 48
    invoke-direct {p3, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p3, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    const-string p2, "option-key-page-title"

    .line 58
    .line 59
    iget-object p0, p0, Ll/lxf;->b:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p3, p2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    if-eqz p3, :cond_1

    .line 69
    .line 70
    new-instance p0, Ll/kxf;

    .line 71
    .line 72
    invoke-direct {p0}, Ll/kxf;-><init>()V

    .line 73
    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    iput-boolean p1, p0, Ll/kxf;->h:Z

    .line 77
    .line 78
    const-string p1, "Params is null"

    .line 79
    .line 80
    iput-object p1, p0, Ll/kxf;->d:Ljava/lang/String;

    .line 81
    .line 82
    invoke-interface {p3, p0}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public final t(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const-string p1, "option-key-token"

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Ll/kxf;

    .line 16
    .line 17
    invoke-direct {p2}, Ll/kxf;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/lxf$h;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2, p3}, Ll/lxf$h;-><init>(Ll/lxf;Ll/kxf;Ll/ltl$b;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;->startAuthByLightData(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final u(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    const-string p1, "option-key-token"

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/ixf;->d(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Ll/kxf;

    .line 16
    .line 17
    invoke-direct {p2}, Ll/kxf;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/lxf;->c:Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;

    .line 21
    .line 22
    new-instance v1, Ll/lxf$i;

    .line 23
    .line 24
    invoke-direct {v1, p0, p2, p3}, Ll/lxf$i;-><init>(Ll/lxf;Ll/kxf;Ll/ltl$b;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, v0, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApi;->startHuiYanAuth(Ljava/lang/String;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsConfig;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final v(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ltl$b;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk;->getInstance()Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance v0, Ll/lxf$g;

    .line 6
    .line 7
    invoke-direct {v0, p0, p3}, Ll/lxf$g;-><init>(Ll/lxf;Ll/ltl$b;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p1, v0}, Lcom/tencent/cloud/huiyansdkface/facelight/api/WbCloudFaceVerifySdk;->startWbFaceVerifySdk(Landroid/content/Context;Lcom/tencent/cloud/huiyansdkface/facelight/api/listeners/WbCloudFaceVerifyResultListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
