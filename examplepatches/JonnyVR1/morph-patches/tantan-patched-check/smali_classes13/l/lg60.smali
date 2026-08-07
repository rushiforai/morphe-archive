.class public Ll/lg60;
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

.method public static a(II)I
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "parseErrorCode what\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "\uff1bextra\uff1a"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    const/16 v0, 0x1100

    .line 27
    .line 28
    if-eq p0, v0, :cond_b

    .line 29
    .line 30
    const/16 v0, 0x1101

    .line 31
    .line 32
    if-eq p0, v0, :cond_b

    .line 33
    .line 34
    const/16 v0, 0x2100

    .line 35
    .line 36
    if-eq p0, v0, :cond_b

    .line 37
    .line 38
    const/16 v0, 0x2101

    .line 39
    .line 40
    if-ne p0, v0, :cond_0

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    and-int/lit16 v0, p0, 0x101

    .line 44
    .line 45
    const/16 v1, 0x101

    .line 46
    .line 47
    if-ne v0, v1, :cond_5

    .line 48
    .line 49
    const/16 v0, 0x3101

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    if-ne p0, v0, :cond_4

    .line 53
    .line 54
    if-ne p1, v1, :cond_1

    .line 55
    .line 56
    const/16 p0, 0xb

    .line 57
    .line 58
    return p0

    .line 59
    :cond_1
    const/16 p0, 0xc

    .line 60
    .line 61
    if-eq p1, p0, :cond_3

    .line 62
    .line 63
    const/16 v0, 0xd

    .line 64
    .line 65
    if-ne p1, v0, :cond_2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    const/16 p0, 0xe

    .line 69
    .line 70
    if-ne p1, p0, :cond_4

    .line 71
    .line 72
    :cond_3
    :goto_0
    return p0

    .line 73
    :cond_4
    return v1

    .line 74
    :cond_5
    const/16 v0, 0x4100

    .line 75
    .line 76
    if-ne v0, p0, :cond_6

    .line 77
    .line 78
    const/4 p0, 0x2

    .line 79
    return p0

    .line 80
    :cond_6
    const v0, 0x9100

    .line 81
    .line 82
    .line 83
    if-ne v0, p0, :cond_7

    .line 84
    .line 85
    const/4 p0, 0x3

    .line 86
    return p0

    .line 87
    :cond_7
    const/16 v0, 0x5100

    .line 88
    .line 89
    if-ne v0, p0, :cond_9

    .line 90
    .line 91
    if-nez p1, :cond_8

    .line 92
    .line 93
    const/4 p0, 0x5

    .line 94
    return p0

    .line 95
    :cond_8
    const/4 p0, 0x4

    .line 96
    return p0

    .line 97
    :cond_9
    const/16 v0, 0x11a5

    .line 98
    .line 99
    if-ne v0, p0, :cond_a

    .line 100
    .line 101
    const/16 p0, 0xfa0

    .line 102
    .line 103
    if-le p1, p0, :cond_a

    .line 104
    .line 105
    new-instance p0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v0, "parseErrorCode: quic error:extra="

    .line 108
    .line 109
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string v0, "quicsdk"

    .line 120
    .line 121
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    return p1

    .line 125
    :cond_a
    const/4 p0, 0x0

    .line 126
    return p0

    .line 127
    :cond_b
    :goto_1
    return p1
.end method
