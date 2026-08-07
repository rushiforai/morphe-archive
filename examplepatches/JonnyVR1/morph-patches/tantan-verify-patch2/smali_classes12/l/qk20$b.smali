.class Ll/qk20$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk80;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qk20;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;ZZLl/jfm;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/jfm;

.field final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/jfm;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qk20$b;->a:Ll/jfm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qk20$b;->b:Ljava/lang/String;

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
    iget-object p0, p0, Ll/qk20$b;->a:Ll/jfm;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/jfm;->b(Ljava/lang/String;Ljava/lang/String;)V

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
    .locals 5

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
    const-string v2, "error"

    .line 8
    .line 9
    const-string v3, "errMsg"

    .line 10
    .line 11
    const-string v4, "status"

    .line 12
    .line 13
    filled-new-array {v4, v2, v3, p2}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "ocrSmartDeviceHttp"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/qk20$b;->a:Ll/jfm;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p0, p1, p2}, Ll/jfm;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public onSuccess(ILjava/lang/String;)V
    .locals 5

    .line 1
    const/16 p1, 0x3e9

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p2, :cond_6

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/qk20$b;->a:Ll/jfm;

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    const-string p1, "onSuccesss the identityOcrCallback is null"

    .line 22
    .line 23
    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 31
    .line 32
    const-string v2, "success"

    .line 33
    .line 34
    const-string v3, "content"

    .line 35
    .line 36
    const-string v4, "status"

    .line 37
    .line 38
    filled-new-array {v4, v2, v3, p2}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "ocrSmartDeviceHttp"

    .line 43
    .line 44
    invoke-virtual {p1, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-class p1, Lcom/idv/identity/platform/model/ZimResBase;

    .line 48
    .line 49
    invoke-static {p2, p1}, Ll/ac00;->g(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/idv/identity/platform/model/ZimResBase;

    .line 54
    .line 55
    if-eqz p1, :cond_5

    .line 56
    .line 57
    iget v0, p1, Lcom/idv/identity/platform/model/ZimResBase;->Code:I

    .line 58
    .line 59
    const/16 v1, 0x3f1

    .line 60
    .line 61
    if-ne v1, v0, :cond_2

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-direct {p0, p1, p2}, Ll/qk20$b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const-string p0, "the time is invalid"

    .line 71
    .line 72
    invoke-static {p0}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    invoke-virtual {p1}, Lcom/idv/identity/platform/model/ZimResBase;->isSuccess()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_4

    .line 81
    .line 82
    iget-object p1, p1, Lcom/idv/identity/platform/model/ZimResBase;->ResultObject:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object p2, p0, Ll/qk20$b;->b:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p1, p2}, Lcom/idv/identity/util/IdentityUtils;->sd([BLjava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    if-eqz p1, :cond_3

    .line 95
    .line 96
    iget-object p0, p0, Ll/qk20$b;->a:Ll/jfm;

    .line 97
    .line 98
    invoke-interface {p0, p1}, Ll/jfm;->onSuccess(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    const/16 p1, 0x7d1

    .line 103
    .line 104
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string p1, "\u89e3\u5bc6\u5931\u8d25"

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_4
    iget p2, p1, Lcom/idv/identity/platform/model/ZimResBase;->Code:I

    .line 112
    .line 113
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object p1, p1, Lcom/idv/identity/platform/model/ZimResBase;->Message:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_5
    const-string p1, " Json parse  error  :resContent +"

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const-string p1, "UNKNOW_ERROR"

    .line 130
    .line 131
    :goto_0
    invoke-direct {p0, v0, p1}, Ll/qk20$b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_6
    :goto_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const-string p2, "resContent is null"

    .line 140
    .line 141
    invoke-direct {p0, p1, p2}, Ll/qk20$b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    const-string p0, "the response content is null"

    .line 145
    .line 146
    invoke-static {p0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method
