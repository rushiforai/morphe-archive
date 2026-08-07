.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->b:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a:Ljava/util/List;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ljavax/net/ssl/SSLSocket;)Lcom/tencent/cloud/ai/network/okhttp3/j;
    .locals 7

    .line 1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->b:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    :goto_0
    const/4 v2, 0x1

    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Lcom/tencent/cloud/ai/network/okhttp3/j;

    .line 19
    .line 20
    invoke-virtual {v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/j;->a(Ljavax/net/ssl/SSLSocket;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    add-int/2addr v0, v2

    .line 27
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->b:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v3, 0x0

    .line 34
    :goto_1
    if-eqz v3, :cond_9

    .line 35
    .line 36
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->b:I

    .line 37
    .line 38
    :goto_2
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v4, 0x0

    .line 45
    if-ge v0, v1, :cond_3

    .line 46
    .line 47
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/j;

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/j;->a(Ljavax/net/ssl/SSLSocket;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move v2, v4

    .line 66
    :goto_3
    iput-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->c:Z

    .line 67
    .line 68
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 69
    .line 70
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->d:Z

    .line 71
    .line 72
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    iget-object v0, v3, Lcom/tencent/cloud/ai/network/okhttp3/j;->c:[Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->b:Ljava/util/Comparator;

    .line 82
    .line 83
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v2, v3, Lcom/tencent/cloud/ai/network/okhttp3/j;->c:[Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    goto :goto_4

    .line 94
    :cond_4
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    :goto_4
    iget-object v1, v3, Lcom/tencent/cloud/ai/network/okhttp3/j;->d:[Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v1, :cond_5

    .line 101
    .line 102
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->i:Ljava/util/Comparator;

    .line 103
    .line 104
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iget-object v5, v3, Lcom/tencent/cloud/ai/network/okhttp3/j;->d:[Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v1, v2, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    goto :goto_5

    .line 115
    :cond_5
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    :goto_5
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    sget-object v5, Lcom/tencent/cloud/ai/network/okhttp3/g;->b:Ljava/util/Comparator;

    .line 124
    .line 125
    const-string v6, "TLS_FALLBACK_SCSV"

    .line 126
    .line 127
    invoke-static {v5, v2, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/Comparator;[Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    if-eqz p0, :cond_6

    .line 132
    .line 133
    const/4 p0, -0x1

    .line 134
    if-eq v5, p0, :cond_6

    .line 135
    .line 136
    aget-object p0, v2, v5

    .line 137
    .line 138
    array-length v2, v0

    .line 139
    add-int/lit8 v5, v2, 0x1

    .line 140
    .line 141
    new-array v5, v5, [Ljava/lang/String;

    .line 142
    .line 143
    array-length v6, v0

    .line 144
    invoke-static {v0, v4, v5, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    .line 146
    .line 147
    aput-object p0, v5, v2

    .line 148
    .line 149
    move-object v0, v5

    .line 150
    :cond_6
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/j$a;

    .line 151
    .line 152
    invoke-direct {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/j$a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/j;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/j$a;->a([Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/j$a;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/j$a;->b([Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/j$a;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/j$a;->b:[Ljava/lang/String;

    .line 164
    .line 165
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/j$a;->c:[Ljava/lang/String;

    .line 166
    .line 167
    if-eqz p0, :cond_7

    .line 168
    .line 169
    invoke-virtual {p1, p0}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    :cond_7
    if-eqz v0, :cond_8

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_8
    return-object v3

    .line 178
    :cond_9
    new-instance v0, Ljava/net/UnknownServiceException;

    .line 179
    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v2, "Unable to find acceptable protocols. isFallback="

    .line 183
    .line 184
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->d:Z

    .line 188
    .line 189
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string v2, ", modes="

    .line 193
    .line 194
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/a;->a:Ljava/util/List;

    .line 198
    .line 199
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    const-string p1, ", supported protocols="

    .line 211
    .line 212
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    invoke-direct {v0, p0}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    throw v0
.end method
