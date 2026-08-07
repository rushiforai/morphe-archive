.class public final Lcom/vivo/push/util/k;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Landroid/graphics/Bitmap;",
        ">;>;"
    }
.end annotation


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/vivo/push/model/InsideNotificationItem;

.field private c:J

.field private d:Z

.field private e:I

.field private f:Lcom/vivo/push/d/r$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vivo/push/model/InsideNotificationItem;JZLcom/vivo/push/d/r$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/vivo/push/util/k;->e:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/vivo/push/util/k;->a:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/vivo/push/util/k;->b:Lcom/vivo/push/model/InsideNotificationItem;

    .line 10
    .line 11
    iput-wide p3, p0, Lcom/vivo/push/util/k;->c:J

    .line 12
    .line 13
    iput-boolean p5, p0, Lcom/vivo/push/util/k;->d:Z

    .line 14
    .line 15
    iput-object p6, p0, Lcom/vivo/push/util/k;->f:Lcom/vivo/push/d/r$a;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Lcom/vivo/push/util/k;)Lcom/vivo/push/model/InsideNotificationItem;
    .locals 0

    .line 176
    iget-object p0, p0, Lcom/vivo/push/util/k;->b:Lcom/vivo/push/model/InsideNotificationItem;

    return-object p0
.end method

.method private varargs a([Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/vivo/push/util/k;->b:Lcom/vivo/push/model/InsideNotificationItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/vivo/push/model/InsideNotificationItem;->getNotifyDisplayStatus()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/vivo/push/util/k;->e:I

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/vivo/push/util/k;->d:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const-string v1, "ImageDownTask"

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const-string p0, "bitmap is not display by forbid net"

    .line 17
    .line 18
    invoke-static {v1, p0}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    move v3, v2

    .line 29
    :goto_0
    const/4 v4, 0x2

    .line 30
    if-ge v3, v4, :cond_7

    .line 31
    .line 32
    aget-object v4, p1, v3

    .line 33
    .line 34
    new-instance v5, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v6, "imgUrl="

    .line 37
    .line 38
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v6, " i="

    .line 45
    .line 46
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-static {v1, v5}, Lcom/vivo/push/util/p;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    if-nez v5, :cond_5

    .line 64
    .line 65
    :try_start_0
    new-instance v5, Ljava/net/URL;

    .line 66
    .line 67
    invoke-direct {v5, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ljava/net/HttpURLConnection;

    .line 75
    .line 76
    const/16 v5, 0x7530

    .line 77
    .line 78
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 79
    .line 80
    .line 81
    const/4 v5, 0x1

    .line 82
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v2}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    const-string v6, "code="

    .line 96
    .line 97
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-static {v1, v6}, Lcom/vivo/push/util/p;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    const/16 v6, 0xc8

    .line 109
    .line 110
    if-ne v5, v6, :cond_1

    .line 111
    .line 112
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 113
    .line 114
    .line 115
    move-result-object v4
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 116
    :try_start_1
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 117
    .line 118
    .line 119
    move-result-object v5
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    goto :goto_1

    .line 121
    :catchall_0
    move-exception p0

    .line 122
    move-object v0, v4

    .line 123
    goto :goto_5

    .line 124
    :catchall_1
    move-exception p0

    .line 125
    goto :goto_5

    .line 126
    :cond_1
    move-object v4, v0

    .line 127
    move-object v5, v4

    .line 128
    :goto_1
    if-eqz v4, :cond_3

    .line 129
    .line 130
    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    .line 131
    .line 132
    .line 133
    goto :goto_4

    .line 134
    :catch_0
    move-object v4, v0

    .line 135
    :catch_1
    :try_start_3
    const-string v5, "IOException"

    .line 136
    .line 137
    invoke-static {v1, v5}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 138
    .line 139
    .line 140
    if-eqz v4, :cond_2

    .line 141
    .line 142
    :goto_2
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :catch_2
    move-object v4, v0

    .line 147
    :catch_3
    :try_start_5
    const-string v5, "MalformedURLException"

    .line 148
    .line 149
    invoke-static {v1, v5}, Lcom/vivo/push/util/p;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 150
    .line 151
    .line 152
    if-eqz v4, :cond_2

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :catch_4
    :cond_2
    :goto_3
    move-object v5, v0

    .line 156
    :catch_5
    :cond_3
    :goto_4
    invoke-interface {p0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    goto :goto_6

    .line 160
    :goto_5
    if-eqz v0, :cond_4

    .line 161
    .line 162
    :try_start_6
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 163
    .line 164
    .line 165
    :catch_6
    :cond_4
    throw p0

    .line 166
    :cond_5
    if-nez v3, :cond_6

    .line 167
    .line 168
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    :cond_6
    :goto_6
    add-int/lit8 v3, v3, 0x1

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_7
    return-object p0
.end method

.method public static synthetic b(Lcom/vivo/push/util/k;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/vivo/push/util/k;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c(Lcom/vivo/push/util/k;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/util/k;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/vivo/push/util/k;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/vivo/push/util/k;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/vivo/push/util/k;)Lcom/vivo/push/d/r$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/vivo/push/util/k;->f:Lcom/vivo/push/d/r$a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/vivo/push/util/k;->a([Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "ImageDownTask"

    .line 7
    .line 8
    const-string v1, "onPostExecute"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/vivo/push/util/p;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/vivo/push/util/l;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Lcom/vivo/push/util/l;-><init>(Lcom/vivo/push/util/k;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Lcom/vivo/push/m;->c(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
