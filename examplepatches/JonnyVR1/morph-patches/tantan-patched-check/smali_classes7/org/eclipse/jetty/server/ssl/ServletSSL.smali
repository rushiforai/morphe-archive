.class public Lorg/eclipse/jetty/server/ssl/ServletSSL;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static deduceKeyLength(Ljava/lang/String;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "WITH_AES_256_"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ltz v1, :cond_1

    .line 12
    .line 13
    const/16 p0, 0x100

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    const-string v1, "WITH_RC4_128_"

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/16 v2, 0x80

    .line 23
    .line 24
    if-ltz v1, :cond_2

    .line 25
    .line 26
    return v2

    .line 27
    :cond_2
    const-string v1, "WITH_AES_128_"

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-ltz v1, :cond_3

    .line 34
    .line 35
    return v2

    .line 36
    :cond_3
    const-string v1, "WITH_RC4_40_"

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/16 v3, 0x28

    .line 43
    .line 44
    if-ltz v1, :cond_4

    .line 45
    .line 46
    return v3

    .line 47
    :cond_4
    const-string v1, "WITH_3DES_EDE_CBC_"

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-ltz v1, :cond_5

    .line 54
    .line 55
    const/16 p0, 0xa8

    .line 56
    .line 57
    return p0

    .line 58
    :cond_5
    const-string v1, "WITH_IDEA_CBC_"

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ltz v1, :cond_6

    .line 65
    .line 66
    return v2

    .line 67
    :cond_6
    const-string v1, "WITH_RC2_CBC_40_"

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-ltz v1, :cond_7

    .line 74
    .line 75
    return v3

    .line 76
    :cond_7
    const-string v1, "WITH_DES40_CBC_"

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-ltz v1, :cond_8

    .line 83
    .line 84
    return v3

    .line 85
    :cond_8
    const-string v1, "WITH_DES_CBC_"

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-ltz p0, :cond_9

    .line 92
    .line 93
    const/16 p0, 0x38

    .line 94
    .line 95
    return p0

    .line 96
    :cond_9
    return v0
.end method
