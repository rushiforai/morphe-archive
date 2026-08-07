.class public final enum Lcom/tencent/cloud/ai/network/okhttp3/t;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tencent/cloud/ai/network/okhttp3/t;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum b:Lcom/tencent/cloud/ai/network/okhttp3/t;

.field public static final enum c:Lcom/tencent/cloud/ai/network/okhttp3/t;

.field public static final enum d:Lcom/tencent/cloud/ai/network/okhttp3/t;

.field public static final enum e:Lcom/tencent/cloud/ai/network/okhttp3/t;

.field public static final enum f:Lcom/tencent/cloud/ai/network/okhttp3/t;

.field public static final synthetic g:[Lcom/tencent/cloud/ai/network/okhttp3/t;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "TLSv1.3"

    .line 5
    .line 6
    const-string v3, "TLS_1_3"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/t;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/t;->b:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 12
    .line 13
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "TLSv1.2"

    .line 17
    .line 18
    const-string v4, "TLS_1_2"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/t;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/tencent/cloud/ai/network/okhttp3/t;->c:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 24
    .line 25
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "TLSv1.1"

    .line 29
    .line 30
    const-string v5, "TLS_1_1"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/t;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/tencent/cloud/ai/network/okhttp3/t;->d:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 36
    .line 37
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "TLSv1"

    .line 41
    .line 42
    const-string v6, "TLS_1_0"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/tencent/cloud/ai/network/okhttp3/t;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/tencent/cloud/ai/network/okhttp3/t;->e:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 48
    .line 49
    new-instance v4, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const-string v6, "SSLv3"

    .line 53
    .line 54
    const-string v7, "SSL_3_0"

    .line 55
    .line 56
    invoke-direct {v4, v7, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/t;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lcom/tencent/cloud/ai/network/okhttp3/t;->f:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 60
    .line 61
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/t;->g:[Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/t;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/t;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "TLSv1"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x4

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "SSLv3"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x3

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "TLSv1.3"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x2

    .line 45
    goto :goto_0

    .line 46
    :sswitch_3
    const-string v0, "TLSv1.2"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 v1, 0x1

    .line 56
    goto :goto_0

    .line 57
    :sswitch_4
    const-string v0, "TLSv1.1"

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    const/4 v1, 0x0

    .line 67
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 68
    .line 69
    .line 70
    const-string v0, "Unexpected TLS version: "

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x0

    .line 80
    return-object p0

    .line 81
    :pswitch_0
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/t;->e:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_1
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/t;->f:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 85
    .line 86
    return-object p0

    .line 87
    :pswitch_2
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/t;->b:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 88
    .line 89
    return-object p0

    .line 90
    :pswitch_3
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/t;->c:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 91
    .line 92
    return-object p0

    .line 93
    :pswitch_4
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/t;->d:Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 94
    .line 95
    return-object p0

    .line 96
    nop

    .line 97
    :sswitch_data_0
    .sparse-switch
        -0x1dfc3f27 -> :sswitch_4
        -0x1dfc3f26 -> :sswitch_3
        -0x1dfc3f25 -> :sswitch_2
        0x4b88569 -> :sswitch_1
        0x4c38896 -> :sswitch_0
    .end sparse-switch

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/t;
    .locals 1

    .line 1
    const-class v0, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tencent/cloud/ai/network/okhttp3/t;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/t;->g:[Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tencent/cloud/ai/network/okhttp3/t;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tencent/cloud/ai/network/okhttp3/t;

    .line 8
    .line 9
    return-object v0
.end method
