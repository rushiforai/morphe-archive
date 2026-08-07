.class Lcom/p1/mobile/account_core/network/ExceptionChecker;
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

.method public static check(Ll/i5d0;)Ljava/lang/Exception;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v1, v0, 0x64

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/16 v1, 0x1ad

    .line 13
    .line 14
    if-ne v0, v1, :cond_2

    .line 15
    .line 16
    const-string v0, "X-RateLimit-Reset"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v1, 0xa

    .line 29
    .line 30
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    new-instance v1, Lcom/p1/mobile/account_core/exception/TooManyRequests;

    .line 35
    .line 36
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/account_core/exception/TooManyRequests;-><init>(Ll/i5d0;I)V

    .line 37
    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_1
    new-instance v0, Lcom/p1/mobile/account_core/exception/TooManyRequests;

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/account_core/exception/TooManyRequests;-><init>(Ll/i5d0;I)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_2
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    :try_start_0
    invoke-virtual {p0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Lcom/google/gson/Gson;

    .line 56
    .line 57
    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 58
    .line 59
    .line 60
    const-class v3, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    .line 61
    .line 62
    invoke-virtual {v2, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;

    .line 67
    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    new-instance v2, Lcom/p1/mobile/account_core/exception/AccountException;

    .line 75
    .line 76
    invoke-direct {v2, v1}, Lcom/p1/mobile/account_core/exception/AccountException;-><init>(Lcom/p1/mobile/account_core/reponse_data/Meta;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-object v2

    .line 80
    :catch_0
    :try_start_1
    invoke-virtual {p0}, Ll/k5d0;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 81
    .line 82
    .line 83
    :catch_1
    :cond_3
    new-instance p0, Ljava/lang/Exception;

    .line 84
    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v2, "code: "

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-object p0
.end method
