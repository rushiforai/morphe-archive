.class public Ll/hyn0;
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

.method public static a(ILjava/lang/String;Z)Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    const-string v1, "allow"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    invoke-virtual {v0}, Ll/j6t;->n()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sget-object v2, Ll/tbs;->f:Ll/j6t;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/j6t;->q()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sget-object v3, Ll/tbs;->f:Ll/j6t;

    .line 19
    .line 20
    invoke-virtual {v3}, Ll/j6t;->l()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const v5, 0x186a1

    .line 29
    .line 30
    .line 31
    if-nez v4, :cond_2

    .line 32
    .line 33
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    if-ne v5, p0, :cond_2

    .line 40
    .line 41
    if-nez p2, :cond_1

    .line 42
    .line 43
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/j6t;->c()V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-object v1

    .line 49
    :cond_2
    const p1, 0x186ab

    .line 50
    .line 51
    .line 52
    const-string v3, "intercept"

    .line 53
    .line 54
    const/4 v4, 0x3

    .line 55
    if-ne p1, p0, :cond_5

    .line 56
    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    invoke-static {v4}, Ll/wft;->b(I)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_3

    .line 64
    .line 65
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->A0:I

    .line 66
    .line 67
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->o0:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 74
    .line 75
    .line 76
    :goto_0
    return-object v3

    .line 77
    :cond_4
    return-object v1

    .line 78
    :cond_5
    const p1, 0x186ae

    .line 79
    .line 80
    .line 81
    if-ne p1, p0, :cond_7

    .line 82
    .line 83
    if-eqz v0, :cond_6

    .line 84
    .line 85
    const-string p0, "mute"

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_6
    return-object v1

    .line 89
    :cond_7
    if-eqz v0, :cond_d

    .line 90
    .line 91
    if-eqz v2, :cond_c

    .line 92
    .line 93
    if-eq p0, v5, :cond_9

    .line 94
    .line 95
    if-nez p2, :cond_b

    .line 96
    .line 97
    invoke-static {v4}, Ll/wft;->b(I)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_8

    .line 102
    .line 103
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->A0:I

    .line 104
    .line 105
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_8
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->o0:I

    .line 110
    .line 111
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_9
    if-nez p2, :cond_b

    .line 116
    .line 117
    invoke-static {v4}, Ll/wft;->b(I)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_a

    .line 122
    .line 123
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->z0:I

    .line 124
    .line 125
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_a
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->n0:I

    .line 130
    .line 131
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 132
    .line 133
    .line 134
    :cond_b
    :goto_1
    return-object v3

    .line 135
    :cond_c
    if-nez p2, :cond_d

    .line 136
    .line 137
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/j6t;->d()V

    .line 140
    .line 141
    .line 142
    :cond_d
    return-object v1
.end method

.method public static b(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/hyn0;->d(IZ)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static c(ILjava/lang/String;Z)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0, p1, p2}, Ll/hyn0;->a(ILjava/lang/String;Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "handleSceneAction:action:"

    .line 8
    .line 9
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, ",status:"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p2, "VoiceLiveFloatWindowProcessor"

    .line 28
    .line 29
    invoke-static {p2, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object p1
.end method

.method public static d(IZ)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, v0, p1}, Ll/hyn0;->a(ILjava/lang/String;Z)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "handleSceneAction:action:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, ",status:"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "VoiceLiveFloatWindowProcessor"

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object p1
.end method
