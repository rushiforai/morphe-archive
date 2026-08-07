.class public Lorg/eclipse/jetty/util/security/Credential$MD5;
.super Lorg/eclipse/jetty/util/security/Credential;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/util/security/Credential;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MD5"
.end annotation


# static fields
.field public static final __TYPE:Ljava/lang/String; = "MD5:"

.field private static __md:Ljava/security/MessageDigest; = null

.field public static final __md5Lock:Ljava/lang/Object;

.field private static final serialVersionUID:J = 0x4ccc2c1bfb42a250L


# instance fields
.field private final _digest:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md5Lock:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/security/Credential;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MD5:"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    const/16 v0, 0x10

    .line 18
    .line 19
    invoke-static {p1, v0}, Lorg/eclipse/jetty/util/TypeUtil;->parseBytes(Ljava/lang/String;I)[B

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 24
    .line 25
    return-void
.end method

.method public static digest(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    const-string v0, "MD5:"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    sget-object v2, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md5Lock:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 7
    :try_start_1
    sget-object v3, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    :try_start_2
    const-string v3, "MD5"

    .line 12
    .line 13
    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    sput-object v3, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :catch_0
    move-exception p0

    .line 23
    :try_start_3
    invoke-static {}, Lorg/eclipse/jetty/util/security/Credential;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    monitor-exit v2

    .line 31
    return-object v1

    .line 32
    :cond_0
    :goto_0
    sget-object v3, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/security/MessageDigest;->reset()V

    .line 35
    .line 36
    .line 37
    sget-object v3, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 38
    .line 39
    const-string v4, "ISO-8859-1"

    .line 40
    .line 41
    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v3, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 46
    .line 47
    .line 48
    sget-object p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 55
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const/16 v0, 0x10

    .line 61
    .line 62
    invoke-static {p0, v0}, Lorg/eclipse/jetty/util/TypeUtil;->toString([BI)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 73
    return-object p0

    .line 74
    :catch_1
    move-exception p0

    .line 75
    goto :goto_2

    .line 76
    :goto_1
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 77
    :try_start_6
    throw p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 78
    :goto_2
    invoke-static {}, Lorg/eclipse/jetty/util/security/Credential;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    return-object v1
.end method


# virtual methods
.method public check(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const-string v0, "Can\'t check "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    instance-of v2, p1, [C

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    new-instance v2, Ljava/lang/String;

    .line 9
    .line 10
    check-cast p1, [C

    .line 11
    .line 12
    invoke-direct {v2, p1}, Ljava/lang/String;-><init>([C)V

    .line 13
    .line 14
    .line 15
    move-object p1, v2

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    goto/16 :goto_7

    .line 19
    .line 20
    :cond_0
    :goto_0
    instance-of v2, p1, Lorg/eclipse/jetty/util/security/Password;

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-nez v2, :cond_7

    .line 24
    .line 25
    instance-of v2, p1, Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_1
    instance-of v2, p1, Lorg/eclipse/jetty/util/security/Credential$MD5;

    .line 31
    .line 32
    if-eqz v2, :cond_5

    .line 33
    .line 34
    check-cast p1, Lorg/eclipse/jetty/util/security/Credential$MD5;

    .line 35
    .line 36
    iget-object v0, p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 37
    .line 38
    array-length v0, v0

    .line 39
    iget-object v2, p1, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 40
    .line 41
    array-length v2, v2

    .line 42
    if-eq v0, v2, :cond_2

    .line 43
    .line 44
    return v1

    .line 45
    :cond_2
    move v0, v1

    .line 46
    :goto_1
    iget-object v2, p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 47
    .line 48
    array-length v4, v2

    .line 49
    if-ge v0, v4, :cond_4

    .line 50
    .line 51
    aget-byte v2, v2, v0

    .line 52
    .line 53
    iget-object v4, p1, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 54
    .line 55
    aget-byte v4, v4, v0

    .line 56
    .line 57
    if-eq v2, v4, :cond_3

    .line 58
    .line 59
    return v1

    .line 60
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_4
    return v3

    .line 64
    :cond_5
    instance-of v2, p1, Lorg/eclipse/jetty/util/security/Credential;

    .line 65
    .line 66
    if-eqz v2, :cond_6

    .line 67
    .line 68
    check-cast p1, Lorg/eclipse/jetty/util/security/Credential;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/util/security/Credential;->check(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    return p0

    .line 75
    :cond_6
    invoke-static {}, Lorg/eclipse/jetty/util/security/Credential;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p1, " against MD5"

    .line 92
    .line 93
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    new-array v0, v1, [Ljava/lang/Object;

    .line 101
    .line 102
    invoke-interface {p0, p1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return v1

    .line 106
    :cond_7
    :goto_2
    sget-object v0, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md5Lock:Ljava/lang/Object;

    .line 107
    .line 108
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :try_start_1
    sget-object v2, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 110
    .line 111
    if-nez v2, :cond_8

    .line 112
    .line 113
    const-string v2, "MD5"

    .line 114
    .line 115
    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    sput-object v2, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :catchall_0
    move-exception p0

    .line 123
    goto :goto_6

    .line 124
    :cond_8
    :goto_3
    sget-object v2, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/security/MessageDigest;->reset()V

    .line 127
    .line 128
    .line 129
    sget-object v2, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 130
    .line 131
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    const-string v4, "ISO-8859-1"

    .line 136
    .line 137
    invoke-virtual {p1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {v2, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 142
    .line 143
    .line 144
    sget-object p1, Lorg/eclipse/jetty/util/security/Credential$MD5;->__md:Ljava/security/MessageDigest;

    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    if-eqz p1, :cond_c

    .line 152
    .line 153
    :try_start_2
    array-length v0, p1

    .line 154
    iget-object v2, p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 155
    .line 156
    array-length v2, v2

    .line 157
    if-eq v0, v2, :cond_9

    .line 158
    .line 159
    goto :goto_5

    .line 160
    :cond_9
    move v0, v1

    .line 161
    :goto_4
    array-length v2, p1

    .line 162
    if-ge v0, v2, :cond_b

    .line 163
    .line 164
    aget-byte v2, p1, v0

    .line 165
    .line 166
    iget-object v4, p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 167
    .line 168
    aget-byte v4, v4, v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 169
    .line 170
    if-eq v2, v4, :cond_a

    .line 171
    .line 172
    return v1

    .line 173
    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_b
    return v3

    .line 177
    :cond_c
    :goto_5
    return v1

    .line 178
    :goto_6
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 179
    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 180
    :goto_7
    invoke-static {}, Lorg/eclipse/jetty/util/security/Credential;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    return v1
.end method

.method public getDigest()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/security/Credential$MD5;->_digest:[B

    .line 2
    .line 3
    return-object p0
.end method
