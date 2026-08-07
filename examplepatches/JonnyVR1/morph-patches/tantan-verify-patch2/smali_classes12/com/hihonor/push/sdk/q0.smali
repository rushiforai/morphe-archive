.class public Lcom/hihonor/push/sdk/q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/hihonor/push/sdk/HonorPushDataMsg;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hihonor/push/sdk/q0;->a:Landroid/content/Intent;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "PassByMsgIntentParser"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/hihonor/push/sdk/q0;->a:Landroid/content/Intent;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_3

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    :try_start_0
    const-string v5, "msg_id"

    .line 11
    .line 12
    invoke-virtual {v1, v5, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v1

    .line 18
    const-string v5, "parserMsgId"

    .line 19
    .line 20
    invoke-static {v0, v5, v1}, Lcom/hihonor/push/sdk/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p0, p0, Lcom/hihonor/push/sdk/q0;->a:Landroid/content/Intent;

    .line 24
    .line 25
    :try_start_1
    const-string v1, "msg_content"

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 31
    goto :goto_1

    .line 32
    :catch_1
    move-exception p0

    .line 33
    const-string v1, "parseMsgContent"

    .line 34
    .line 35
    invoke-static {v0, v1, p0}, Lcom/hihonor/push/sdk/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    move-object p0, v2

    .line 39
    :goto_1
    if-eqz p0, :cond_2

    .line 40
    .line 41
    array-length v0, p0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    goto :goto_4

    .line 45
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ljava/util/zip/InflaterInputStream;

    .line 51
    .line 52
    new-instance v1, Ljava/util/zip/Inflater;

    .line 53
    .line 54
    invoke-direct {v1}, Ljava/util/zip/Inflater;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0, v0, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 63
    .line 64
    .line 65
    const/16 v5, 0x100

    .line 66
    .line 67
    :try_start_2
    new-array v5, v5, [B

    .line 68
    .line 69
    :goto_2
    invoke-virtual {p0, v5}, Ljava/io/InputStream;->read([B)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-lez v6, :cond_1

    .line 74
    .line 75
    const/4 v7, 0x0

    .line 76
    invoke-virtual {v1, v5, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :catchall_0
    move-exception v2

    .line 81
    goto :goto_5

    .line 82
    :catch_2
    move-exception v5

    .line 83
    goto :goto_3

    .line 84
    :cond_1
    const-string v5, "UTF-8"

    .line 85
    .line 86
    invoke-virtual {v1, v5}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    invoke-static {v0}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p0}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_6

    .line 100
    :goto_3
    const-string v6, "DeflateUtil"

    .line 101
    .line 102
    const-string v7, "unZipString"

    .line 103
    .line 104
    :try_start_3
    invoke-static {v6, v7, v5}, Lcom/hihonor/push/sdk/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    .line 106
    .line 107
    invoke-static {v0}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p0}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 114
    .line 115
    .line 116
    :cond_2
    :goto_4
    move-object v5, v2

    .line 117
    goto :goto_6

    .line 118
    :goto_5
    invoke-static {v0}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p0}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Lcom/hihonor/push/sdk/b;->a(Ljava/io/Closeable;)V

    .line 125
    .line 126
    .line 127
    throw v2

    .line 128
    :goto_6
    if-eqz v5, :cond_3

    .line 129
    .line 130
    new-instance p0, Lorg/json/JSONObject;

    .line 131
    .line 132
    invoke-direct {p0, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    const-string v0, "data"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_3

    .line 146
    .line 147
    new-instance v2, Lcom/hihonor/push/sdk/HonorPushDataMsg;

    .line 148
    .line 149
    invoke-direct {v2}, Lcom/hihonor/push/sdk/HonorPushDataMsg;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2, v3, v4}, Lcom/hihonor/push/sdk/HonorPushDataMsg;->setMsgId(J)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v2, p0}, Lcom/hihonor/push/sdk/HonorPushDataMsg;->setData(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_3
    return-object v2
.end method
