.class public Ll/wq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ktl;


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


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/VerificationToken;)Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerificationToken;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const-string v2, "white"

    .line 19
    .line 20
    const-string v3, "colorMode"

    .line 21
    .line 22
    const-string v4, "option-key-licence"

    .line 23
    .line 24
    const-string v5, "option-key-appid"

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->faceId:Ljava/lang/String;

    .line 31
    .line 32
    const-string v6, "option-key-faceid"

    .line 33
    .line 34
    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->agreementNo:Ljava/lang/String;

    .line 40
    .line 41
    const-string v6, "option-key-agreementno"

    .line 42
    .line 43
    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->appId:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->sign:Ljava/lang/String;

    .line 56
    .line 57
    const-string v5, "option-key-sign"

    .line 58
    .line 59
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->userId:Ljava/lang/String;

    .line 65
    .line 66
    const-string v5, "option-key-userid"

    .line 67
    .line 68
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->nonce:Ljava/lang/String;

    .line 74
    .line 75
    const-string v5, "option-key-nonce"

    .line 76
    .line 77
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    iget-object v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TencentToken;->keyLicence:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    const-string v1, "option-key-appversion"

    .line 88
    .line 89
    const-string v4, "1.0.0"

    .line 90
    .line 91
    invoke-virtual {v0, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/data/TencentToken;->faceId:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    const-string v1, "compareType"

    .line 103
    .line 104
    if-nez p1, :cond_1

    .line 105
    .line 106
    const-string p1, "idCard"

    .line 107
    .line 108
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    const-string p1, "none"

    .line 113
    .line 114
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    :goto_0
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    const-string p1, "videoUpload"

    .line 121
    .line 122
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    const-string p1, "playVoice"

    .line 128
    .line 129
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 130
    .line 131
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    const/4 p1, 0x1

    .line 135
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const-string v1, "uiType"

    .line 140
    .line 141
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    const-string p1, "option-key-language"

    .line 148
    .line 149
    invoke-virtual {p0}, Ll/wq8;->b()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    return-object v0

    .line 157
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProvider()Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-nez p0, :cond_3

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentIntlProviderV2()Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_4

    .line 168
    .line 169
    :cond_3
    const-string p0, "TanTan_TanTan_SDKLicense_2025-03-21 10_41_08.license"

    .line 170
    .line 171
    invoke-virtual {v0, v4, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    const-string p0, "option-key-save-cache"

    .line 175
    .line 176
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 177
    .line 178
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isMoMoProvider()Z

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    if-eqz p0, :cond_5

    .line 189
    .line 190
    const-string p0, "78ea6732be1b0ffa8a1df2a47c08901e"

    .line 191
    .line 192
    invoke-virtual {v0, v5, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_6

    .line 200
    .line 201
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VolcEngineProToken;->stsToken:Ljava/lang/String;

    .line 204
    .line 205
    const-string v1, "option-key-sts-token"

    .line 206
    .line 207
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VolcEngineProToken;->accessKeyId:Ljava/lang/String;

    .line 213
    .line 214
    const-string v1, "option-key-access_id"

    .line 215
    .line 216
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 220
    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VolcEngineProToken;->secretAccessKey:Ljava/lang/String;

    .line 222
    .line 223
    const-string p1, "option-key-secret_key"

    .line 224
    .line 225
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    :cond_6
    :goto_1
    return-object v0
.end method

.method public final b()Ljava/lang/String;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/Locale;->getScript()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, -0x1

    .line 41
    sparse-switch v1, :sswitch_data_0

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :sswitch_0
    const-string v1, "zh"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 v2, 0x4

    .line 55
    goto :goto_0

    .line 56
    :sswitch_1
    const-string v1, "th"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const/4 v2, 0x3

    .line 66
    goto :goto_0

    .line 67
    :sswitch_2
    const-string v1, "ko"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    const/4 v2, 0x2

    .line 77
    goto :goto_0

    .line 78
    :sswitch_3
    const-string v1, "ja"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    const/4 v2, 0x1

    .line 88
    goto :goto_0

    .line 89
    :sswitch_4
    const-string v1, "in"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    const/4 v2, 0x0

    .line 99
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 100
    .line 101
    .line 102
    const-string p0, "WBFaceVerifyLanguage_en"

    .line 103
    .line 104
    return-object p0

    .line 105
    :pswitch_0
    const-string v0, "Hant"

    .line 106
    .line 107
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_5

    .line 112
    .line 113
    const-string p0, "WBFaceVerifyLanguage_zh_hk"

    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_5
    const-string p0, "WBFaceVerifyLanguage_zh_cn"

    .line 117
    .line 118
    return-object p0

    .line 119
    :pswitch_1
    const-string p0, "WBFaceVerifyLanguage_th"

    .line 120
    .line 121
    return-object p0

    .line 122
    :pswitch_2
    const-string p0, "WBFaceVerifyLanguage_ko"

    .line 123
    .line 124
    return-object p0

    .line 125
    :pswitch_3
    const-string p0, "WBFaceVerifyLanguage_ja"

    .line 126
    .line 127
    return-object p0

    .line 128
    :pswitch_4
    const-string p0, "WBFaceVerifyLanguage_id"

    .line 129
    .line 130
    return-object p0

    .line 131
    :sswitch_data_0
    .sparse-switch
        0xd25 -> :sswitch_4
        0xd37 -> :sswitch_3
        0xd64 -> :sswitch_2
        0xe74 -> :sswitch_1
        0xf2e -> :sswitch_0
    .end sparse-switch

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
