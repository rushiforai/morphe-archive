.class public final Ll/s2x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/t2x0;

.field public c:Ll/gyw0;


# direct methods
.method public synthetic constructor <init>(Ll/r2x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/gyw0;)Ll/s2x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s2x0;->c:Ll/gyw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/t2x0;)Ll/s2x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s2x0;->b:Ll/t2x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Ll/s2x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s2x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/v2x0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/s2x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_a

    .line 5
    .line 6
    iget-object v0, p0, Ll/s2x0;->b:Ll/t2x0;

    .line 7
    .line 8
    if-eqz v0, :cond_9

    .line 9
    .line 10
    iget-object v2, p0, Ll/s2x0;->c:Ll/gyw0;

    .line 11
    .line 12
    if-eqz v2, :cond_8

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/lxw0;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-nez v3, :cond_7

    .line 19
    .line 20
    sget-object v3, Ll/t2x0;->b:Ll/t2x0;

    .line 21
    .line 22
    if-eq v0, v3, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    instance-of v3, v2, Ll/o0x0;

    .line 26
    .line 27
    if-nez v3, :cond_6

    .line 28
    .line 29
    :goto_0
    sget-object v3, Ll/t2x0;->d:Ll/t2x0;

    .line 30
    .line 31
    if-eq v0, v3, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    instance-of v3, v2, Ll/r1x0;

    .line 35
    .line 36
    if-nez v3, :cond_6

    .line 37
    .line 38
    :goto_1
    sget-object v3, Ll/t2x0;->c:Ll/t2x0;

    .line 39
    .line 40
    if-eq v0, v3, :cond_2

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    instance-of v3, v2, Ll/o3x0;

    .line 44
    .line 45
    if-nez v3, :cond_6

    .line 46
    .line 47
    :goto_2
    sget-object v3, Ll/t2x0;->e:Ll/t2x0;

    .line 48
    .line 49
    if-eq v0, v3, :cond_3

    .line 50
    .line 51
    goto :goto_3

    .line 52
    :cond_3
    instance-of v3, v2, Ll/xyw0;

    .line 53
    .line 54
    if-nez v3, :cond_6

    .line 55
    .line 56
    :goto_3
    sget-object v3, Ll/t2x0;->f:Ll/t2x0;

    .line 57
    .line 58
    if-eq v0, v3, :cond_4

    .line 59
    .line 60
    goto :goto_4

    .line 61
    :cond_4
    instance-of v3, v2, Ll/rzw0;

    .line 62
    .line 63
    if-nez v3, :cond_6

    .line 64
    .line 65
    :goto_4
    sget-object v3, Ll/t2x0;->g:Ll/t2x0;

    .line 66
    .line 67
    if-ne v0, v3, :cond_5

    .line 68
    .line 69
    instance-of v0, v2, Ll/b1x0;

    .line 70
    .line 71
    if-eqz v0, :cond_5

    .line 72
    .line 73
    goto :goto_5

    .line 74
    :cond_5
    new-instance v0, Ljava/security/GeneralSecurityException;

    .line 75
    .line 76
    iget-object v1, p0, Ll/s2x0;->b:Ll/t2x0;

    .line 77
    .line 78
    invoke-virtual {v1}, Ll/t2x0;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget-object p0, p0, Ll/s2x0;->c:Ll/gyw0;

    .line 83
    .line 84
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance v2, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    const-string v3, "Cannot use parsing strategy "

    .line 91
    .line 92
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v1, " when new keys are picked according to "

    .line 99
    .line 100
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string p0, "."

    .line 107
    .line 108
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-direct {v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    throw v0

    .line 119
    :cond_6
    :goto_5
    new-instance v0, Ll/v2x0;

    .line 120
    .line 121
    iget-object v2, p0, Ll/s2x0;->a:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v3, p0, Ll/s2x0;->b:Ll/t2x0;

    .line 124
    .line 125
    iget-object p0, p0, Ll/s2x0;->c:Ll/gyw0;

    .line 126
    .line 127
    invoke-direct {v0, v2, v3, p0, v1}, Ll/v2x0;-><init>(Ljava/lang/String;Ll/t2x0;Ll/gyw0;Ll/u2x0;)V

    .line 128
    .line 129
    .line 130
    return-object v0

    .line 131
    :cond_7
    const-string p0, "dekParametersForNewKeys must note have ID Requirements"

    .line 132
    .line 133
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-object v1

    .line 137
    :cond_8
    const-string p0, "dekParametersForNewKeys must be set"

    .line 138
    .line 139
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-object v1

    .line 143
    :cond_9
    const-string p0, "dekParsingStrategy must be set"

    .line 144
    .line 145
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-object v1

    .line 149
    :cond_a
    const-string p0, "kekUri must be set"

    .line 150
    .line 151
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-object v1
.end method
