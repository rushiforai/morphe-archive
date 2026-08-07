.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/Response;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/Response;Lcom/tencent/cloud/ai/network/okhttp3/Request;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eq v0, v1, :cond_2

    .line 9
    .line 10
    const/16 v1, 0x19a

    .line 11
    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/16 v1, 0x19e

    .line 15
    .line 16
    if-eq v0, v1, :cond_2

    .line 17
    .line 18
    const/16 v1, 0x1f5

    .line 19
    .line 20
    if-eq v0, v1, :cond_2

    .line 21
    .line 22
    const/16 v1, 0xcb

    .line 23
    .line 24
    if-eq v0, v1, :cond_2

    .line 25
    .line 26
    const/16 v1, 0xcc

    .line 27
    .line 28
    if-eq v0, v1, :cond_2

    .line 29
    .line 30
    const/16 v1, 0x133

    .line 31
    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    const/16 v1, 0x134

    .line 35
    .line 36
    if-eq v0, v1, :cond_2

    .line 37
    .line 38
    const/16 v1, 0x194

    .line 39
    .line 40
    if-eq v0, v1, :cond_2

    .line 41
    .line 42
    const/16 v1, 0x195

    .line 43
    .line 44
    if-eq v0, v1, :cond_2

    .line 45
    .line 46
    packed-switch v0, :pswitch_data_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    :pswitch_0
    const-string v0, "Expires"

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    .line 63
    .line 64
    const/4 v1, -0x1

    .line 65
    if-ne v0, v1, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/d;->f:Z

    .line 72
    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/d;->e:Z

    .line 80
    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    :goto_0
    return v2

    .line 85
    :cond_2
    :goto_1
    :pswitch_1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->b:Z

    .line 90
    .line 91
    if-nez p0, :cond_3

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/d;->b:Z

    .line 98
    .line 99
    if-nez p0, :cond_3

    .line 100
    .line 101
    const/4 p0, 0x1

    .line 102
    return p0

    .line 103
    :cond_3
    return v2

    .line 104
    nop

    .line 105
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
