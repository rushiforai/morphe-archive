.class public Lcom/tencent/could/huiyansdk/utils/k$a;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/utils/k;->a(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/utils/k;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/utils/k;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/utils/k$a;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 9

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/k$a;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/utils/k;->c:Z

    .line 8
    .line 9
    if-nez p0, :cond_5

    .line 10
    .line 11
    check-cast v0, Lcom/tencent/could/huiyansdk/fragments/c;

    .line 12
    .line 13
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 16
    .line 17
    .line 18
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLongCheck()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const-string v3, "AuthLocalFail"

    .line 29
    .line 30
    const-string v4, "AuthingFragment"

    .line 31
    .line 32
    const/4 v5, 0x2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    iget-object v2, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 36
    .line 37
    iget-boolean v2, v2, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->o:Z

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget-object v2, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 42
    .line 43
    iget-boolean v2, v2, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->n:Z

    .line 44
    .line 45
    if-nez v2, :cond_2

    .line 46
    .line 47
    const/16 v2, 0x11f

    .line 48
    .line 49
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 50
    .line 51
    .line 52
    sget-object v2, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/tencent/could/huiyansdk/common/a;->b:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    iget-object v7, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 61
    .line 62
    if-eqz v6, :cond_0

    .line 63
    .line 64
    sget v2, Lcom/tencent/could/huiyansdk/R$string;->txy_bot_out_time:I

    .line 65
    .line 66
    invoke-virtual {v7, v2}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    sget v8, Lcom/tencent/could/huiyansdk/R$string;->txy_bot_out_time:I

    .line 80
    .line 81
    invoke-virtual {v7, v8}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v7, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 89
    .line 90
    sget v8, Lcom/tencent/could/huiyansdk/R$string;->txy_comma:I

    .line 91
    .line 92
    invoke-virtual {v7, v8}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :goto_0
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 110
    .line 111
    const-string v6, "long check time out!"

    .line 112
    .line 113
    invoke-virtual {v2, v5, v4, v6}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v4, "timeout code: "

    .line 119
    .line 120
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 135
    .line 136
    if-eqz v1, :cond_1

    .line 137
    .line 138
    const-string v4, "BOTCheckStage"

    .line 139
    .line 140
    invoke-interface {v1, v4, v3, v2}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_1
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 144
    .line 145
    invoke-virtual {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_2
    iget-object v2, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 150
    .line 151
    iget-boolean v2, v2, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->m:Z

    .line 152
    .line 153
    if-eqz v2, :cond_3

    .line 154
    .line 155
    const/16 v2, 0xde

    .line 156
    .line 157
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 158
    .line 159
    .line 160
    iget-object v2, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 161
    .line 162
    sget v6, Lcom/tencent/could/huiyansdk/R$string;->txy_local_check_out_time:I

    .line 163
    .line 164
    invoke-virtual {v2, v6}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 172
    .line 173
    const-string v6, "action time out!"

    .line 174
    .line 175
    invoke-virtual {v2, v5, v4, v6}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_3
    const/16 v2, 0xdf

    .line 180
    .line 181
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 182
    .line 183
    .line 184
    iget-object v2, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 185
    .line 186
    sget v6, Lcom/tencent/could/huiyansdk/R$string;->txy_prepare_out_time:I

    .line 187
    .line 188
    invoke-virtual {v2, v6}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->getResString(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {p0, v2}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 196
    .line 197
    const-string v6, "prepare time out!"

    .line 198
    .line 199
    invoke-virtual {v2, v5, v4, v6}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    const-string v4, "timeOut code: "

    .line 205
    .line 206
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 221
    .line 222
    if-eqz v1, :cond_4

    .line 223
    .line 224
    const-string v4, "AuthCheckStage"

    .line 225
    .line 226
    invoke-interface {v1, v4, v3, v2}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_4
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/c;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 230
    .line 231
    invoke-virtual {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Ljava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    :cond_5
    return-void
.end method

.method public onTick(J)V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "on tick: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    const-string v3, "TimeOutHelper"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v0, 0x3e8

    .line 24
    .line 25
    add-long/2addr p1, v0

    .line 26
    div-long/2addr p1, v0

    .line 27
    long-to-int p1, p1

    .line 28
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/k$a;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/utils/k;->b:Lcom/tencent/could/huiyansdk/callback/c;

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/utils/k;->c:Z

    .line 35
    .line 36
    if-nez p0, :cond_0

    .line 37
    .line 38
    check-cast p2, Lcom/tencent/could/huiyansdk/fragments/c;

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Lcom/tencent/could/huiyansdk/fragments/c;->a(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
