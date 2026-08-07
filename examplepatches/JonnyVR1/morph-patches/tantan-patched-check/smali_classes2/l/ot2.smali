.class public Ll/ot2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lj20;


# instance fields
.field protected final a:Ll/nnl;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private final b:Ll/mm2;

.field protected final c:Ll/vq3;


# direct methods
.method public constructor <init>(Ll/mm2;)V
    .locals 2

    .line 1
    new-instance v0, Ll/vq3;

    .line 2
    .line 3
    const/16 v1, 0x1000

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/vq3;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Ll/ot2;-><init>(Ll/mm2;Ll/vq3;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ll/mm2;Ll/vq3;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Ll/ot2;->b:Ll/mm2;

    .line 14
    iput-object p1, p0, Ll/ot2;->a:Ll/nnl;

    .line 15
    iput-object p2, p0, Ll/ot2;->c:Ll/vq3;

    return-void
.end method


# virtual methods
.method public a(Lcom/android/volley/Request;)Ll/cl20;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)",
            "Ll/cl20;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v3

    .line 5
    :goto_0
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/a$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/xml;->c(Lcom/android/volley/a$a;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Ll/ot2;->b:Ll/mm2;

    .line 15
    .line 16
    invoke-virtual {v2, p1, v0}, Ll/mm2;->a(Lcom/android/volley/Request;Ljava/util/Map;)Ll/bnl;

    .line 17
    .line 18
    .line 19
    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 20
    :try_start_1
    invoke-virtual {v2}, Ll/bnl;->d()I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    invoke-virtual {v2}, Ll/bnl;->c()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v11

    .line 28
    const/16 v0, 0x130

    .line 29
    .line 30
    if-ne v6, v0, :cond_0

    .line 31
    .line 32
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 33
    .line 34
    .line 35
    move-result-wide v5

    .line 36
    sub-long/2addr v5, v3

    .line 37
    invoke-static {p1, v5, v6, v11}, Ll/sl20;->b(Lcom/android/volley/Request;JLjava/util/List;)Ll/cl20;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    move-object v6, v1

    .line 44
    move-object v5, v2

    .line 45
    move-object v1, p1

    .line 46
    :goto_1
    move-object v2, v0

    .line 47
    goto :goto_4

    .line 48
    :cond_0
    invoke-virtual {v2}, Ll/bnl;->a()Ljava/io/InputStream;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/bnl;->b()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    iget-object v7, p0, Ll/ot2;->c:Ll/vq3;

    .line 59
    .line 60
    invoke-static {v0, v5, v7}, Ll/sl20;->c(Ljava/io/InputStream;ILl/vq3;)[B

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :goto_2
    move-object v7, v0

    .line 65
    goto :goto_3

    .line 66
    :cond_1
    const/4 v0, 0x0

    .line 67
    new-array v0, v0, [B
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :goto_3
    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    sub-long/2addr v0, v3

    .line 75
    invoke-static {v0, v1, p1, v7, v6}, Ll/sl20;->d(JLcom/android/volley/Request;[BI)V

    .line 76
    .line 77
    .line 78
    const/16 v0, 0xc8

    .line 79
    .line 80
    if-lt v6, v0, :cond_2

    .line 81
    .line 82
    const/16 v0, 0x12b

    .line 83
    .line 84
    if-gt v6, v0, :cond_2

    .line 85
    .line 86
    new-instance v5, Ll/cl20;

    .line 87
    .line 88
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 89
    .line 90
    .line 91
    move-result-wide v0

    .line 92
    sub-long v9, v0, v3

    .line 93
    .line 94
    const/4 v8, 0x0

    .line 95
    invoke-direct/range {v5 .. v11}, Ll/cl20;-><init>(I[BZJLjava/util/List;)V

    .line 96
    .line 97
    .line 98
    return-object v5

    .line 99
    :catch_1
    move-exception v0

    .line 100
    move-object v1, p1

    .line 101
    move-object v5, v2

    .line 102
    move-object v6, v7

    .line 103
    goto :goto_1

    .line 104
    :cond_2
    new-instance v0, Ljava/io/IOException;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    .line 107
    .line 108
    .line 109
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 110
    :catch_2
    move-exception v0

    .line 111
    move-object v2, v0

    .line 112
    move-object v5, v1

    .line 113
    move-object v6, v5

    .line 114
    move-object v1, p1

    .line 115
    :goto_4
    invoke-static/range {v1 .. v6}, Ll/sl20;->e(Lcom/android/volley/Request;Ljava/io/IOException;JLl/bnl;[B)Ll/sl20$b;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {v1, p1}, Ll/sl20;->a(Lcom/android/volley/Request;Ll/sl20$b;)V

    .line 120
    .line 121
    .line 122
    move-object p1, v1

    .line 123
    goto :goto_0
.end method
