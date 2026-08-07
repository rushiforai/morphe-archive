.class public final Ll/u5x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/oax0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/t5x0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/t5x0;-><init>(Ll/s5x0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/u5x0;->a:Ll/oax0;

    .line 8
    .line 9
    return-void
.end method

.method public static a(Ll/sxw0;)Ll/yax0;
    .locals 9

    .line 1
    new-instance v0, Ll/qax0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qax0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/sxw0;->b()Ll/nax0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ll/qax0;->b(Ll/nax0;)Ll/qax0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/sxw0;->d()Ljava/util/Collection;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz v2, :cond_5

    .line 27
    .line 28
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_0

    .line 43
    .line 44
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Ll/oxw0;

    .line 49
    .line 50
    invoke-virtual {v4}, Ll/oxw0;->h()I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    add-int/lit8 v5, v5, -0x2

    .line 55
    .line 56
    const/4 v6, 0x1

    .line 57
    if-eq v5, v6, :cond_3

    .line 58
    .line 59
    const/4 v6, 0x2

    .line 60
    if-eq v5, v6, :cond_2

    .line 61
    .line 62
    const/4 v6, 0x3

    .line 63
    if-ne v5, v6, :cond_1

    .line 64
    .line 65
    sget-object v5, Ll/zww0;->d:Ll/zww0;

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const-string p0, "Unknown key status"

    .line 69
    .line 70
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-object v3

    .line 74
    :cond_2
    sget-object v5, Ll/zww0;->c:Ll/zww0;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    sget-object v5, Ll/zww0;->b:Ll/zww0;

    .line 78
    .line 79
    :goto_1
    invoke-virtual {v4}, Ll/oxw0;->a()I

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    invoke-virtual {v4}, Ll/oxw0;->f()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    const-string v8, "type.googleapis.com/google.crypto."

    .line 88
    .line 89
    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v8

    .line 93
    if-eqz v8, :cond_4

    .line 94
    .line 95
    const/16 v8, 0x22

    .line 96
    .line 97
    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    :cond_4
    invoke-virtual {v4}, Ll/oxw0;->c()Lcom/google/android/gms/internal/ads/zzgvz;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v4}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-virtual {v0, v5, v6, v7, v4}, Ll/qax0;->a(Ll/zww0;ILjava/lang/String;Ljava/lang/String;)Ll/qax0;

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    invoke-virtual {p0}, Ll/sxw0;->a()Ll/oxw0;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    if-eqz v1, :cond_6

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/sxw0;->a()Ll/oxw0;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ll/oxw0;->a()I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-virtual {v0, p0}, Ll/qax0;->c(I)Ll/qax0;

    .line 128
    .line 129
    .line 130
    :cond_6
    :try_start_0
    invoke-virtual {v0}, Ll/qax0;->d()Ll/yax0;

    .line 131
    .line 132
    .line 133
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    return-object p0

    .line 135
    :catch_0
    move-exception p0

    .line 136
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 137
    .line 138
    .line 139
    return-object v3
.end method
