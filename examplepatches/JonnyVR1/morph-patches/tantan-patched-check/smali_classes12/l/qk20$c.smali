.class Ll/qk20$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qk20;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLl/lfm;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/lfm;

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/lfm;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qk20$c;->a:Ll/lfm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qk20$c;->b:Ljava/lang/String;

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
    iget-object p0, p0, Ll/qk20$c;->a:Ll/lfm;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/lfm;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "the identityOcrCallback is null"

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
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "http response onError  code: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " errMsg"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TAG"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 33
    .line 34
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ll/afm;->n0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    sget-object v8, Ll/xk80;->b:Ljava/lang/String;

    .line 43
    .line 44
    const-string v9, "errorMsg"

    .line 45
    .line 46
    const-string v3, "status"

    .line 47
    .line 48
    const-string v4, "fail"

    .line 49
    .line 50
    const-string v5, "url"

    .line 51
    .line 52
    const-string v7, "host"

    .line 53
    .line 54
    move-object v10, p2

    .line 55
    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string v2, "VALIDATION_RESPONSE"

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/qk20$c;->a:Ll/lfm;

    .line 65
    .line 66
    if-eqz p0, :cond_0

    .line 67
    .line 68
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p0, p1, v10}, Ll/lfm;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public onSuccess(ILjava/lang/String;)V
    .locals 6

    .line 1
    const/16 p1, 0x3ed

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p2, :cond_7

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_0
    const-string v1, "http response  onSuccess body: "

    .line 22
    .line 23
    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "TAG"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 37
    .line 38
    const-string v3, "status"

    .line 39
    .line 40
    const-string v4, "success"

    .line 41
    .line 42
    const-string v5, "content"

    .line 43
    .line 44
    filled-new-array {v3, v4, v5, p2}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v4, "VALIDATION_RESPONSE"

    .line 49
    .line 50
    invoke-virtual {v1, v2, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-class v1, Lcom/idv/identity/platform/model/ZimResBase;

    .line 54
    .line 55
    invoke-static {p2, v1}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/idv/identity/platform/model/ZimResBase;

    .line 60
    .line 61
    if-eqz v1, :cond_6

    .line 62
    .line 63
    iget p1, v1, Lcom/idv/identity/platform/model/ZimResBase;->Code:I

    .line 64
    .line 65
    const/16 v0, 0x3f1

    .line 66
    .line 67
    if-ne v0, p1, :cond_1

    .line 68
    .line 69
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-direct {p0, p1, p2}, Ll/qk20$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    invoke-virtual {v1}, Lcom/idv/identity/platform/model/ZimResBase;->isSuccess()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_5

    .line 82
    .line 83
    iget-object p1, p0, Ll/qk20$c;->a:Ll/lfm;

    .line 84
    .line 85
    if-eqz p1, :cond_5

    .line 86
    .line 87
    iget-object p1, v1, Lcom/idv/identity/platform/model/ZimResBase;->ResultObject:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p2, p0, Ll/qk20$c;->b:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p1, p2}, Lcom/idv/identity/util/IdentityUtils;->sd([BLjava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    const-string v0, "finalResult"

    .line 104
    .line 105
    filled-new-array {v5, p1}, [Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {p2, v2, v0, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    const/16 p2, 0x7d1

    .line 113
    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    const-class v0, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;

    .line 117
    .line 118
    invoke-static {p1, v0}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;

    .line 123
    .line 124
    if-eqz p1, :cond_2

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->isOCRVerifySuccess()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_2

    .line 131
    .line 132
    iget-object p0, p0, Ll/qk20$c;->a:Ll/lfm;

    .line 133
    .line 134
    invoke-interface {p0}, Ll/lfm;->onSuccess()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_2
    if-eqz p1, :cond_3

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->getBizCode()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/IdentityOcrVerifyContent;->getBizMessage()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    goto :goto_0

    .line 149
    :cond_3
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    const-string p1, "\u5185\u5bb9\u683c\u5f0f\u6709\u8bef"

    .line 154
    .line 155
    :goto_0
    move-object v0, p2

    .line 156
    goto :goto_1

    .line 157
    :cond_4
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const-string p2, "\u89e3\u5bc6\u5931\u8d25"

    .line 162
    .line 163
    move-object v0, p1

    .line 164
    move-object p1, p2

    .line 165
    goto :goto_1

    .line 166
    :cond_5
    iget p1, v1, Lcom/idv/identity/platform/model/ZimResBase;->Code:I

    .line 167
    .line 168
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iget-object p1, v1, Lcom/idv/identity/platform/model/ZimResBase;->Message:Ljava/lang/String;

    .line 173
    .line 174
    :cond_6
    :goto_1
    invoke-direct {p0, v0, p1}, Ll/qk20$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_7
    :goto_2
    iget-object p0, p0, Ll/qk20$c;->a:Ll/lfm;

    .line 179
    .line 180
    if-eqz p0, :cond_8

    .line 181
    .line 182
    invoke-interface {p0, v0, p1}, Ll/lfm;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_8
    return-void
.end method
