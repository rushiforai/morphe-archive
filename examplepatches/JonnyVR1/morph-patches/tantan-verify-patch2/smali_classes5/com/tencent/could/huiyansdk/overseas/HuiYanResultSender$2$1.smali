.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/component/common/ai/net/IJsonDataListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->onSuccess([BLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

.field public final synthetic val$gson:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;Lcom/google/gson/Gson;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->val$gson:Lcom/google/gson/Gson;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 2
    .line 3
    const-string v1, "GetCompareResultUseTime"

    .line 4
    .line 5
    const/4 v6, 0x2

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {v0, v1, v6, v2, p1}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v3, -0x1

    .line 11
    .line 12
    const-string v1, "Compare"

    .line 13
    .line 14
    move-object v5, p1

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IJLjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "DO_COMPARE network error: "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "HuiYanResultSender"

    .line 35
    .line 36
    invoke-virtual {p1, v6, v1, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 42
    .line 43
    sget v0, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_network_connect_error:I

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/16 v1, 0xd2

    .line 50
    .line 51
    invoke-static {p1, v1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$500(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 14

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "HuiYanResultSender"

    .line 5
    .line 6
    const-string v3, "DO_COMPARE onSuccess"

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v4, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 12
    .line 13
    const-string v3, "GetCompareResultUseTime"

    .line 14
    .line 15
    const/4 v5, 0x2

    .line 16
    const/4 v6, 0x0

    .line 17
    const-string v7, ""

    .line 18
    .line 19
    invoke-virtual {v4, v3, v5, v6, v7}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->val$gson:Lcom/google/gson/Gson;

    .line 23
    .line 24
    const-class v7, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;

    .line 25
    .line 26
    invoke-virtual {v3, p1, v7}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;

    .line 31
    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    const-string v1, "osAuthLiveness is null"

    .line 35
    .line 36
    invoke-virtual {v0, v5, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "osAuthLiveness is null: "

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v9

    .line 53
    const/4 v6, 0x1

    .line 54
    const-wide/16 v7, -0x1

    .line 55
    .line 56
    const-string v5, "Compare"

    .line 57
    .line 58
    invoke-virtual/range {v4 .. v9}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IJLjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 64
    .line 65
    sget v0, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_network_connect_error:I

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v1, 0xd2

    .line 72
    .line 73
    invoke-static {p1, v1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$500(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 79
    .line 80
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;->getCode()I

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    if-eqz v5, :cond_1

    .line 89
    .line 90
    new-instance p1, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v0, "osAuthLiveness is code: "

    .line 93
    .line 94
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;->getCode()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v9

    .line 108
    const/4 v6, 0x1

    .line 109
    const-wide/16 v7, -0x1

    .line 110
    .line 111
    const-string v5, "Compare"

    .line 112
    .line 113
    invoke-virtual/range {v4 .. v9}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IJLjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 119
    .line 120
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;->getCode()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    sget v0, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_start_check_error_code_default:I

    .line 125
    .line 126
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {p0, p1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$500(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;ILjava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_1
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 135
    .line 136
    iget-object v5, v5, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 137
    .line 138
    invoke-static {v5}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$600(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    if-eqz v5, :cond_2

    .line 143
    .line 144
    new-instance v5, Lcom/tencent/could/huiyansdk/entity/ResultData;

    .line 145
    .line 146
    invoke-direct {v5}, Lcom/tencent/could/huiyansdk/entity/ResultData;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v5, p1}, Lcom/tencent/could/huiyansdk/entity/ResultData;->setResponse(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 155
    .line 156
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$600(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-interface {p1, v5}, Lcom/tencent/could/huiyansdk/api/HuiYanResultDataCallBack;->onSuccessResultData(Lcom/tencent/could/huiyansdk/entity/ResultData;)V

    .line 161
    .line 162
    .line 163
    :cond_2
    invoke-virtual {v3}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness;->getData()Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLiveness$Data;->getResultCode()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    const-string v3, "0"

    .line 172
    .line 173
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-eqz v3, :cond_5

    .line 178
    .line 179
    new-instance p1, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthResult;

    .line 180
    .line 181
    invoke-direct {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthResult;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getInstance()Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsApiImp;->getCurrentToken()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p1, v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthResult;->setToken(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$700(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    if-eqz v0, :cond_3

    .line 204
    .line 205
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 206
    .line 207
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 208
    .line 209
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$700(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-interface {v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;->onSuccess(Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthResult;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 217
    .line 218
    iget-object p1, p1, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 219
    .line 220
    const/4 v0, 0x0

    .line 221
    invoke-static {p1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$702(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;)Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;

    .line 222
    .line 223
    .line 224
    :cond_3
    iget-object v7, v4, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 225
    .line 226
    if-eqz v7, :cond_4

    .line 227
    .line 228
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 229
    .line 230
    .line 231
    move-result-wide v12

    .line 232
    const-string v8, "Compare"

    .line 233
    .line 234
    const/4 v9, 0x1

    .line 235
    const-wide/16 v10, 0x1

    .line 236
    .line 237
    invoke-virtual/range {v7 .. v13}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 238
    .line 239
    .line 240
    :cond_4
    const-string p1, "Success"

    .line 241
    .line 242
    invoke-virtual {v4, v6, p1}, Lcom/tencent/could/huiyansdk/operate/a;->a(ILjava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v4}, Lcom/tencent/could/huiyansdk/operate/a;->b()V

    .line 246
    .line 247
    .line 248
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 249
    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    if-nez v3, :cond_6

    .line 257
    .line 258
    new-instance v3, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    const-string v5, "DO_COMPARE network error resultCode:"

    .line 261
    .line 262
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    new-instance v0, Ljava/lang/StringBuilder;

    .line 276
    .line 277
    const-string v1, "resultCode:"

    .line 278
    .line 279
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v9

    .line 289
    const/4 v6, 0x1

    .line 290
    const-wide/16 v7, -0x1

    .line 291
    .line 292
    const-string v5, "Compare"

    .line 293
    .line 294
    invoke-virtual/range {v4 .. v9}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IJLjava/lang/String;)V

    .line 295
    .line 296
    .line 297
    :cond_6
    const-string v0, "1001"

    .line 298
    .line 299
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-nez v0, :cond_8

    .line 304
    .line 305
    const-string v0, "1004"

    .line 306
    .line 307
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_7

    .line 312
    .line 313
    goto :goto_0

    .line 314
    :cond_7
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 315
    .line 316
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 317
    .line 318
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 323
    .line 324
    .line 325
    move-result p1

    .line 326
    sget v1, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_start_check_error_code_default:I

    .line 327
    .line 328
    invoke-static {v1}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-static {v0, p1, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$500(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;ILjava/lang/String;)V

    .line 333
    .line 334
    .line 335
    goto :goto_1

    .line 336
    :cond_8
    :goto_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 337
    .line 338
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 339
    .line 340
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 345
    .line 346
    .line 347
    move-result p1

    .line 348
    sget v1, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_start_check_error_code_1001_1004:I

    .line 349
    .line 350
    invoke-static {v1}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-static {v0, p1, v1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$500(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;ILjava/lang/String;)V

    .line 355
    .line 356
    .line 357
    :goto_1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2$1;->this$1:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;

    .line 358
    .line 359
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$2;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 360
    .line 361
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$300(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;)V

    .line 362
    .line 363
    .line 364
    return-void
.end method
