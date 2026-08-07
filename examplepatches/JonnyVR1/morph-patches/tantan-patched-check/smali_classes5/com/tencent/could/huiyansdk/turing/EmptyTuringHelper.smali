.class public Lcom/tencent/could/huiyansdk/turing/EmptyTuringHelper;
.super Lcom/tencent/could/huiyansdk/turing/b;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/turing/b;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lcom/tencent/could/aicamare/CameraHolder;Ljava/lang/String;)I
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/b;->a:Lcom/tencent/could/huiyansdk/turing/c;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    if-eqz p0, :cond_6

    .line 5
    .line 6
    check-cast p0, Lcom/tencent/could/huiyansdk/turing/d;

    .line 7
    .line 8
    sget-object p2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 9
    .line 10
    const-string p3, "return code: 0, bytes is null"

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const-string v1, "TuringSdkHelper"

    .line 14
    .line 15
    invoke-virtual {p2, v0, v1, p3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/turing/d;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 19
    .line 20
    invoke-virtual {p3}, Lcom/tencent/could/huiyansdk/turing/f;->d()V

    .line 21
    .line 22
    .line 23
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/turing/d;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 24
    .line 25
    invoke-static {p3, p1}, Lcom/tencent/could/huiyansdk/turing/f;->a(Lcom/tencent/could/huiyansdk/turing/f;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/turing/d;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 29
    .line 30
    iget-object v2, p3, Lcom/tencent/could/huiyansdk/turing/f;->f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    .line 31
    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    invoke-static {p3}, Lcom/tencent/could/huiyansdk/turing/f;->a(Lcom/tencent/could/huiyansdk/turing/f;)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    sget-object p3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 39
    .line 40
    iget-object p3, p3, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    const-string v3, "GetTuringTokenUseTime"

    .line 46
    .line 47
    const-string v4, ""

    .line 48
    .line 49
    invoke-interface {p3, v3, v2, p1, v4}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onOperateTimeEvent(Ljava/lang/String;IZLjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    const/4 p3, 0x0

    .line 53
    invoke-static {p3, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/turing/d;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/tencent/could/huiyansdk/turing/f;->f:Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;

    .line 60
    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    invoke-virtual {v4, v3}, Lcom/tencent/could/huiyansdk/entity/TuringResultCacheEntity;->setTuringResultDate(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const-string v4, "turing result cache is not null"

    .line 67
    .line 68
    invoke-virtual {p2, v0, v1, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v4, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v5, "turing result data: "

    .line 74
    .line 75
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {p2, v0, v1, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    const-string v0, "turing result cache is null"

    .line 94
    .line 95
    invoke-virtual {p2, v2, v1, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/turing/d;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 99
    .line 100
    iget-boolean v0, v0, Lcom/tencent/could/huiyansdk/turing/f;->k:Z

    .line 101
    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    const-string p0, "on get device token has timeout!"

    .line 105
    .line 106
    invoke-virtual {p2, v2, v1, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    sget-object p2, Lcom/tencent/could/huiyansdk/common/a$a;->a:Lcom/tencent/could/huiyansdk/common/a;

    .line 111
    .line 112
    iget-boolean p2, p2, Lcom/tencent/could/huiyansdk/common/a;->d:Z

    .line 113
    .line 114
    if-eqz p2, :cond_5

    .line 115
    .line 116
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-nez p2, :cond_5

    .line 121
    .line 122
    sget-object p2, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 123
    .line 124
    iget-object p2, p2, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 125
    .line 126
    if-eqz p2, :cond_4

    .line 127
    .line 128
    invoke-interface {p2, v3}, Lcom/tencent/could/huiyansdk/api/b;->onTuringFaceDataSuccess(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_4
    sget-object p2, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 132
    .line 133
    sget-object v0, Lcom/tencent/could/huiyansdk/enums/AuthState;->START_GET_LIVE_TYPE:Lcom/tencent/could/huiyansdk/enums/AuthState;

    .line 134
    .line 135
    invoke-virtual {p2, v0, p3}, Lcom/tencent/could/huiyansdk/manager/b;->a(Lcom/tencent/could/huiyansdk/enums/AuthState;Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    :cond_5
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/turing/d;->a:Lcom/tencent/could/huiyansdk/turing/f;

    .line 139
    .line 140
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/turing/f;->a(Lcom/tencent/could/huiyansdk/turing/f;)V

    .line 141
    .line 142
    .line 143
    :cond_6
    :goto_1
    return p1
.end method
