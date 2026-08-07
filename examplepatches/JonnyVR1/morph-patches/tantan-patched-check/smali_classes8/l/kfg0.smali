.class public final Ll/kfg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ltech/sud/gip/core/ISudListenerGetMGList;

.field public final synthetic c:Ll/uyg0;


# direct methods
.method public constructor <init>(Ll/uyg0;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerGetMGList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kfg0;->c:Ll/uyg0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kfg0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/kfg0;->b:Ltech/sud/gip/core/ISudListenerGetMGList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    new-instance v1, Ll/ukg0;

    .line 2
    .line 3
    const-string v0, "getMGList"

    .line 4
    .line 5
    invoke-direct {v1, v0}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v5, Ll/bxg0;

    .line 9
    .line 10
    invoke-direct {v5}, Ll/bxg0;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v5, v1, Ll/ukg0;->n:Ll/bxg0;

    .line 14
    .line 15
    const/4 v8, 0x0

    .line 16
    const/4 v9, 0x0

    .line 17
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "sdk_token"

    .line 23
    .line 24
    iget-object v3, p0, Ll/kfg0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 27
    .line 28
    .line 29
    const-string v2, "platform"

    .line 30
    .line 31
    sget-object v3, Ll/utg0;->a:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v3, 0x2

    .line 34
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v0, p0, Ll/kfg0;->c:Ll/uyg0;

    .line 42
    .line 43
    iget-object v2, v0, Ll/uyg0;->d:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v4, v1, Ll/ukg0;->c:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v6, 0x0

    .line 48
    const/4 v7, 0x0

    .line 49
    invoke-static/range {v2 .. v7}, Ll/uyg0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/bxg0;Ll/bpg0;Ll/neg0;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 53
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-string v3, "ret_code"

    .line 59
    .line 60
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 64
    :try_start_2
    const-string v4, "ret_msg"

    .line 65
    .line 66
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 70
    goto :goto_1

    .line 71
    :catch_0
    move-exception v0

    .line 72
    goto :goto_0

    .line 73
    :catch_1
    move-exception v0

    .line 74
    move v3, v8

    .line 75
    goto :goto_0

    .line 76
    :catch_2
    move-exception v0

    .line 77
    move v3, v8

    .line 78
    move-object v2, v9

    .line 79
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v5, "mgList error :"

    .line 82
    .line 83
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    sget-object v5, Ll/uyg0;->p:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v5, v4}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    const-string v5, "HttpService"

    .line 103
    .line 104
    invoke-static {v5, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    if-nez v3, :cond_0

    .line 108
    .line 109
    invoke-static {v0}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v9

    .line 117
    :cond_0
    :goto_1
    iput v3, v1, Ll/ukg0;->e:I

    .line 118
    .line 119
    if-eqz v9, :cond_1

    .line 120
    .line 121
    iput-object v9, v1, Ll/ukg0;->f:Ljava/lang/String;

    .line 122
    .line 123
    :cond_1
    iget-object v0, v1, Ll/ukg0;->a:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v1}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    new-instance v4, Ll/nog0;

    .line 130
    .line 131
    invoke-direct {v4, v1, v8, v0, v3}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    invoke-static {v4}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ll/kfg0;->c:Ll/uyg0;

    .line 138
    .line 139
    new-instance v1, Ll/rzg0;

    .line 140
    .line 141
    invoke-direct {v1, p0, v3, v2, v9}, Ll/rzg0;-><init>(Ll/kfg0;ILjava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    invoke-static {v1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method
