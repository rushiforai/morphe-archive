.class public final Ll/m1x0;
.super Ll/fyw0;
.source "SourceFile"


# instance fields
.field public final a:Ll/r1x0;

.field public final b:Ll/xfx0;

.field public final c:Ll/wfx0;

.field public final d:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ll/r1x0;Ll/xfx0;Ll/wfx0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fyw0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m1x0;->a:Ll/r1x0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/m1x0;->b:Ll/xfx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/m1x0;->c:Ll/wfx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/m1x0;->d:Ljava/lang/Integer;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Ll/q1x0;Ll/xfx0;Ljava/lang/Integer;)Ll/m1x0;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/q1x0;->d:Ll/q1x0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string p1, "For given Variant "

    .line 10
    .line 11
    const-string p2, " the value of idRequirement must be non-null"

    .line 12
    .line 13
    invoke-static {p0, p1, p2}, Ll/l1x0;->a(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_1
    :goto_0
    if-ne p0, v0, :cond_3

    .line 18
    .line 19
    if-nez p2, :cond_2

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_2
    const-string p0, "For given Variant NO_PREFIX the value of idRequirement must be null"

    .line 23
    .line 24
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_3
    :goto_1
    invoke-virtual {p1}, Ll/xfx0;->a()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/16 v3, 0x20

    .line 33
    .line 34
    if-ne v2, v3, :cond_7

    .line 35
    .line 36
    invoke-static {p0}, Ll/r1x0;->c(Ll/q1x0;)Ll/r1x0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v2, Ll/m1x0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/r1x0;->b()Ll/q1x0;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const/4 v4, 0x0

    .line 47
    if-ne v3, v0, :cond_4

    .line 48
    .line 49
    new-array v0, v4, [B

    .line 50
    .line 51
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    goto :goto_2

    .line 56
    :cond_4
    invoke-virtual {p0}, Ll/r1x0;->b()Ll/q1x0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v3, Ll/q1x0;->c:Ll/q1x0;

    .line 61
    .line 62
    const/4 v5, 0x5

    .line 63
    if-ne v0, v3, :cond_5

    .line 64
    .line 65
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    goto :goto_2

    .line 90
    :cond_5
    invoke-virtual {p0}, Ll/r1x0;->b()Ll/q1x0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v3, Ll/q1x0;->b:Ll/q1x0;

    .line 95
    .line 96
    if-ne v0, v3, :cond_6

    .line 97
    .line 98
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const/4 v1, 0x1

    .line 103
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Ll/wfx0;->b([B)Ll/wfx0;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    :goto_2
    invoke-direct {v2, p0, p1, v0, p2}, Ll/m1x0;-><init>(Ll/r1x0;Ll/xfx0;Ll/wfx0;Ljava/lang/Integer;)V

    .line 124
    .line 125
    .line 126
    return-object v2

    .line 127
    :cond_6
    invoke-virtual {p0}, Ll/r1x0;->b()Ll/q1x0;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const-string p1, "Unknown Variant: "

    .line 136
    .line 137
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-object v1

    .line 145
    :cond_7
    new-instance p0, Ljava/security/GeneralSecurityException;

    .line 146
    .line 147
    invoke-virtual {p1}, Ll/xfx0;->a()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    new-instance p2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    const-string v0, "ChaCha20Poly1305 key must be constructed with key of length 32 bytes, not "

    .line 154
    .line 155
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-direct {p0, p1}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    throw p0
.end method


# virtual methods
.method public final b()Ll/r1x0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m1x0;->a:Ll/r1x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/wfx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m1x0;->c:Ll/wfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/xfx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m1x0;->b:Ll/xfx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m1x0;->d:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method
