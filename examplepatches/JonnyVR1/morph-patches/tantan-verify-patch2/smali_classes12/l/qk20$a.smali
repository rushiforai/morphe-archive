.class Ll/qk20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qk20;->f(Ljava/lang/String;Ljava/lang/String;ZLl/kpq0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/kpq0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/kpq0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qk20$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qk20$a;->b:Ll/kpq0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk20$a;->b:Ll/kpq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/kpq0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "the zimInitCallback is null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onError(ILjava/lang/String;)V
    .locals 13

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/afm;->n0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v10

    .line 29
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/afm;->m0()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v12

    .line 37
    const-string v3, "status"

    .line 38
    .line 39
    const-string v4, "error"

    .line 40
    .line 41
    const-string v5, "code"

    .line 42
    .line 43
    const-string v7, "errMsg"

    .line 44
    .line 45
    const-string v9, "url"

    .line 46
    .line 47
    const-string v11, "host"

    .line 48
    .line 49
    move-object v8, p2

    .line 50
    filled-new-array/range {v3 .. v12}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-string v3, "initSmartDeviceHttp"

    .line 55
    .line 56
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object v0, Ll/dfm;->o:Ljava/lang/String;

    .line 60
    .line 61
    invoke-direct {p0, v0, p2}, Ll/qk20$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onSuccess(ILjava/lang/String;)V
    .locals 6

    .line 1
    const-string p1, "initSmartDevice"

    .line 2
    .line 3
    if-eqz p2, :cond_8

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_KEY_NODE:Lcom/idv/identity/platform/log/RecordLevel;

    .line 18
    .line 19
    const-string v2, "success"

    .line 20
    .line 21
    const-string v3, "content"

    .line 22
    .line 23
    const-string v4, "status"

    .line 24
    .line 25
    filled-new-array {v4, v2, v3, p2}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "initSmartDeviceHttp"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-class v0, Lcom/idv/identity/platform/model/ZimResBase;

    .line 35
    .line 36
    invoke-static {p2, v0}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/idv/identity/platform/model/ZimResBase;

    .line 41
    .line 42
    if-eqz v0, :cond_7

    .line 43
    .line 44
    const/16 v1, 0x3f1

    .line 45
    .line 46
    iget v2, v0, Lcom/idv/identity/platform/model/ZimResBase;->Code:I

    .line 47
    .line 48
    if-ne v1, v2, :cond_1

    .line 49
    .line 50
    sget-object v0, Ll/dfm;->F:Ljava/lang/String;

    .line 51
    .line 52
    invoke-direct {p0, v0, p2}, Ll/qk20$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const-string p0, "time invalid"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimResBase;->isSuccess()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const-string p2, "INIT_RESPONSE_ERROR"

    .line 66
    .line 67
    if-eqz p1, :cond_6

    .line 68
    .line 69
    iget-object p1, v0, Lcom/idv/identity/platform/model/ZimResBase;->ResultObject:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Ll/qk20$a;->a:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p1, v0}, Lcom/idv/identity/util/IdentityUtils;->sd([BLjava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    if-eqz p1, :cond_5

    .line 82
    .line 83
    const-class v0, Lcom/idv/identity/platform/model/ZimInitContent;

    .line 84
    .line 85
    invoke-static {p1, v0}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/idv/identity/platform/model/ZimInitContent;

    .line 90
    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimInitContent;->isInitSuccess()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    invoke-static {v0}, Ll/qk20;->d(Lcom/idv/identity/platform/model/ZimInitContent;)Lcom/idv/identity/platform/config/OSSConfig;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object p0, p0, Ll/qk20$a;->b:Ll/kpq0;

    .line 104
    .line 105
    if-eqz p0, :cond_2

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimInitContent;->getProtocol()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimInitContent;->getNowDate()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimInitContent;->getExtProtocol()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {p0, p2, p1, v1, v0}, Ll/kpq0;->b(Ljava/lang/String;Lcom/idv/identity/platform/config/OSSConfig;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return-void

    .line 123
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string v1, "bizCode:"

    .line 126
    .line 127
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimInitContent;->getBizCode()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, " "

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/idv/identity/platform/model/ZimInitContent;->getBizMessage()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    goto :goto_0

    .line 154
    :cond_4
    const-string p2, "INIT_CONTENT_FORMAT_ERROR  content:"

    .line 155
    .line 156
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    const-string p2, "INIT_CONTENT_FORMAT_ERROR"

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_5
    const-string p1, "INIT_CONTENT_DECRYPT_ERROR"

    .line 164
    .line 165
    const-string p2, "init_content_decrypt_error"

    .line 166
    .line 167
    move-object v5, p2

    .line 168
    move-object p2, p1

    .line 169
    move-object p1, v5

    .line 170
    goto :goto_0

    .line 171
    :cond_6
    iget-object p1, v0, Lcom/idv/identity/platform/model/ZimResBase;->Message:Ljava/lang/String;

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_7
    const-string p1, "zimInitGwResponse format error ,the zimInitGwResponse:"

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    const-string p2, "INIT_RESPONSE_FORMAT_ERROR"

    .line 184
    .line 185
    const-string p1, "zimInitGwResponse format error"

    .line 186
    .line 187
    :goto_0
    invoke-direct {p0, p2, p1}, Ll/qk20$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_8
    :goto_1
    sget-object p2, Ll/dfm;->J:Ljava/lang/String;

    .line 192
    .line 193
    const-string v0, "resContent is null"

    .line 194
    .line 195
    invoke-direct {p0, p2, v0}, Ll/qk20$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-static {p1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    return-void
.end method
