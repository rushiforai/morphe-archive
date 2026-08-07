.class public final Lokhttp3/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/a$a;
    }
.end annotation


# static fields
.field public static final e:[Ll/w45;

.field public static final f:[Ll/w45;

.field public static final g:Lokhttp3/a;

.field public static final h:Lokhttp3/a;

.field public static final i:Lokhttp3/a;

.field public static final j:Lokhttp3/a;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:[Ljava/lang/String;

.field public final d:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 1
    sget-object v0, Ll/w45;->n1:Ll/w45;

    .line 2
    .line 3
    sget-object v1, Ll/w45;->o1:Ll/w45;

    .line 4
    .line 5
    sget-object v2, Ll/w45;->p1:Ll/w45;

    .line 6
    .line 7
    sget-object v3, Ll/w45;->Z0:Ll/w45;

    .line 8
    .line 9
    sget-object v4, Ll/w45;->d1:Ll/w45;

    .line 10
    .line 11
    sget-object v5, Ll/w45;->a1:Ll/w45;

    .line 12
    .line 13
    sget-object v6, Ll/w45;->e1:Ll/w45;

    .line 14
    .line 15
    sget-object v7, Ll/w45;->k1:Ll/w45;

    .line 16
    .line 17
    sget-object v8, Ll/w45;->j1:Ll/w45;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Ll/w45;

    .line 20
    .line 21
    .line 22
    move-result-object v9

    .line 23
    sput-object v9, Lokhttp3/a;->e:[Ll/w45;

    .line 24
    .line 25
    sget-object v10, Ll/w45;->K0:Ll/w45;

    .line 26
    .line 27
    sget-object v11, Ll/w45;->L0:Ll/w45;

    .line 28
    .line 29
    sget-object v12, Ll/w45;->i0:Ll/w45;

    .line 30
    .line 31
    sget-object v13, Ll/w45;->j0:Ll/w45;

    .line 32
    .line 33
    sget-object v14, Ll/w45;->G:Ll/w45;

    .line 34
    .line 35
    sget-object v15, Ll/w45;->K:Ll/w45;

    .line 36
    .line 37
    sget-object v16, Ll/w45;->k:Ll/w45;

    .line 38
    .line 39
    move-object/from16 v17, v1

    .line 40
    .line 41
    move-object v1, v0

    .line 42
    move-object v0, v9

    .line 43
    move-object v9, v8

    .line 44
    move-object v8, v7

    .line 45
    move-object v7, v6

    .line 46
    move-object v6, v5

    .line 47
    move-object v5, v4

    .line 48
    move-object v4, v3

    .line 49
    move-object v3, v2

    .line 50
    move-object/from16 v2, v17

    .line 51
    .line 52
    filled-new-array/range {v1 .. v16}, [Ll/w45;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sput-object v1, Lokhttp3/a;->f:[Ll/w45;

    .line 57
    .line 58
    new-instance v2, Lokhttp3/a$a;

    .line 59
    .line 60
    const/4 v3, 0x1

    .line 61
    invoke-direct {v2, v3}, Lokhttp3/a$a;-><init>(Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v0}, Lokhttp3/a$a;->c([Ll/w45;)Lokhttp3/a$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget-object v2, Lokhttp3/TlsVersion;->TLS_1_3:Lokhttp3/TlsVersion;

    .line 69
    .line 70
    sget-object v4, Lokhttp3/TlsVersion;->TLS_1_2:Lokhttp3/TlsVersion;

    .line 71
    .line 72
    filled-new-array {v2, v4}, [Lokhttp3/TlsVersion;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-virtual {v0, v5}, Lokhttp3/a$a;->f([Lokhttp3/TlsVersion;)Lokhttp3/a$a;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, v3}, Lokhttp3/a$a;->d(Z)Lokhttp3/a$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Lokhttp3/a$a;->a()Lokhttp3/a;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    sput-object v0, Lokhttp3/a;->g:Lokhttp3/a;

    .line 89
    .line 90
    new-instance v0, Lokhttp3/a$a;

    .line 91
    .line 92
    invoke-direct {v0, v3}, Lokhttp3/a$a;-><init>(Z)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lokhttp3/a$a;->c([Ll/w45;)Lokhttp3/a$a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    filled-new-array {v2, v4}, [Lokhttp3/TlsVersion;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-virtual {v0, v5}, Lokhttp3/a$a;->f([Lokhttp3/TlsVersion;)Lokhttp3/a$a;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, v3}, Lokhttp3/a$a;->d(Z)Lokhttp3/a$a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Lokhttp3/a$a;->a()Lokhttp3/a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Lokhttp3/a;->h:Lokhttp3/a;

    .line 116
    .line 117
    new-instance v0, Lokhttp3/a$a;

    .line 118
    .line 119
    invoke-direct {v0, v3}, Lokhttp3/a$a;-><init>(Z)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Lokhttp3/a$a;->c([Ll/w45;)Lokhttp3/a$a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    sget-object v1, Lokhttp3/TlsVersion;->TLS_1_1:Lokhttp3/TlsVersion;

    .line 127
    .line 128
    sget-object v5, Lokhttp3/TlsVersion;->TLS_1_0:Lokhttp3/TlsVersion;

    .line 129
    .line 130
    filled-new-array {v2, v4, v1, v5}, [Lokhttp3/TlsVersion;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Lokhttp3/a$a;->f([Lokhttp3/TlsVersion;)Lokhttp3/a$a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0, v3}, Lokhttp3/a$a;->d(Z)Lokhttp3/a$a;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Lokhttp3/a$a;->a()Lokhttp3/a;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sput-object v0, Lokhttp3/a;->i:Lokhttp3/a;

    .line 147
    .line 148
    new-instance v0, Lokhttp3/a$a;

    .line 149
    .line 150
    const/4 v1, 0x0

    .line 151
    invoke-direct {v0, v1}, Lokhttp3/a$a;-><init>(Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Lokhttp3/a$a;->a()Lokhttp3/a;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    sput-object v0, Lokhttp3/a;->j:Lokhttp3/a;

    .line 159
    .line 160
    return-void
.end method

.method public constructor <init>(Lokhttp3/a$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p1, Lokhttp3/a$a;->a:Z

    .line 5
    .line 6
    iput-boolean v0, p0, Lokhttp3/a;->a:Z

    .line 7
    .line 8
    iget-object v0, p1, Lokhttp3/a$a;->b:[Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lokhttp3/a$a;->c:[Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 15
    .line 16
    iget-boolean p1, p1, Lokhttp3/a$a;->d:Z

    .line 17
    .line 18
    iput-boolean p1, p0, Lokhttp3/a;->b:Z

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Ljavax/net/ssl/SSLSocket;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lokhttp3/a;->e(Ljavax/net/ssl/SSLSocket;Z)Lokhttp3/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p2, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/w45;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/w45;->c([Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public c(Ljavax/net/ssl/SSLSocket;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lokhttp3/a;->a:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v2, Ll/zlk0;->j:Ljava/util/Comparator;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {v2, v0, v3}, Ll/zlk0;->B(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object p0, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    sget-object v0, Ll/w45;->b:Ljava/util/Comparator;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {v0, p0, p1}, Ll/zlk0;->B(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_2

    .line 39
    .line 40
    return v1

    .line 41
    :cond_2
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lokhttp3/a;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e(Ljavax/net/ssl/SSLSocket;Z)Lokhttp3/a;
    .locals 4

    .line 1
    iget-object v0, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/w45;->b:Ljava/util/Comparator;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1, v2}, Ll/zlk0;->z(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    iget-object v1, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    sget-object v1, Ll/zlk0;->j:Ljava/util/Comparator;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v3, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, v2, v3}, Ll/zlk0;->z(Ljava/util/Comparator;[Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_1
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget-object v2, Ll/w45;->b:Ljava/util/Comparator;

    .line 48
    .line 49
    const-string v3, "TLS_FALLBACK_SCSV"

    .line 50
    .line 51
    invoke-static {v2, p1, v3}, Ll/zlk0;->w(Ljava/util/Comparator;[Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    const/4 p2, -0x1

    .line 58
    if-eq v2, p2, :cond_2

    .line 59
    .line 60
    aget-object p1, p1, v2

    .line 61
    .line 62
    invoke-static {v0, p1}, Ll/zlk0;->i([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :cond_2
    new-instance p1, Lokhttp3/a$a;

    .line 67
    .line 68
    invoke-direct {p1, p0}, Lokhttp3/a$a;-><init>(Lokhttp3/a;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lokhttp3/a$a;->b([Ljava/lang/String;)Lokhttp3/a$a;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, v1}, Lokhttp3/a$a;->e([Ljava/lang/String;)Lokhttp3/a$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lokhttp3/a$a;->a()Lokhttp3/a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lokhttp3/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    if-ne p1, p0, :cond_1

    .line 9
    .line 10
    return v0

    .line 11
    :cond_1
    check-cast p1, Lokhttp3/a;

    .line 12
    .line 13
    iget-boolean v2, p0, Lokhttp3/a;->a:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lokhttp3/a;->a:Z

    .line 16
    .line 17
    if-eq v2, v3, :cond_2

    .line 18
    .line 19
    return v1

    .line 20
    :cond_2
    if-eqz v2, :cond_5

    .line 21
    .line 22
    iget-object v2, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p1, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_3

    .line 31
    .line 32
    return v1

    .line 33
    :cond_3
    iget-object v2, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_4

    .line 42
    .line 43
    return v1

    .line 44
    :cond_4
    iget-boolean p0, p0, Lokhttp3/a;->b:Z

    .line 45
    .line 46
    iget-boolean p1, p1, Lokhttp3/a;->b:Z

    .line 47
    .line 48
    if-eq p0, p1, :cond_5

    .line 49
    .line 50
    return v1

    .line 51
    :cond_5
    return v0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lokhttp3/a;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lokhttp3/TlsVersion;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lokhttp3/TlsVersion;->forJavaNames([Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lokhttp3/a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lokhttp3/a;->c:[Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x20f

    .line 12
    .line 13
    add-int/2addr v1, v0

    .line 14
    mul-int/lit8 v1, v1, 0x1f

    .line 15
    .line 16
    iget-object v0, p0, Lokhttp3/a;->d:[Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/2addr v1, v0

    .line 23
    mul-int/lit8 v1, v1, 0x1f

    .line 24
    .line 25
    iget-boolean p0, p0, Lokhttp3/a;->b:Z

    .line 26
    .line 27
    xor-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    add-int/2addr v1, p0

    .line 30
    return v1

    .line 31
    :cond_0
    const/16 p0, 0x11

    .line 32
    .line 33
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lokhttp3/a;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "ConnectionSpec()"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "ConnectionSpec(cipherSuites="

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lokhttp3/a;->b()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "[all enabled]"

    .line 20
    .line 21
    invoke-static {v1, v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, ", tlsVersions="

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lokhttp3/a;->g()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1, v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v1, ", supportsTlsExtensions="

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-boolean p0, p0, Lokhttp3/a;->b:Z

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, ")"

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method
