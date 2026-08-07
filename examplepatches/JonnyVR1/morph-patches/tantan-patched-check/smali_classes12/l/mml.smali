.class public Ll/mml;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mml;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mml;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/ag60;Ll/bej0;)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iget-object v2, p0, Ll/mml;->a:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/mml;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v2, p0, p1, p2}, Ll/col;->a(Ljava/lang/String;Ljava/lang/String;Ll/ag60;Ll/bej0;)Ll/i5d0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/i5d0;->k()Ll/k5d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ll/i5d0;->k()Ll/k5d0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/k5d0;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget-object v3, Lcom/immomo/utils/tools/TraceData$LogNode;->NETWORK_REQUEST_EXCEPTION:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 44
    .line 45
    new-instance v4, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const/16 v5, 0xa

    .line 51
    .line 52
    new-array v5, v5, [B

    .line 53
    .line 54
    fill-array-data v5, :array_0

    .line 55
    .line 56
    .line 57
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const/4 v4, 0x0

    .line 76
    new-array v4, v4, [Ljava/lang/Object;

    .line 77
    .line 78
    invoke-static {v3, p1, p0, v4}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p2, v2, p0}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_0
    if-eqz v1, :cond_1

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/i5d0;->k()Ll/k5d0;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/k5d0;->close()V

    .line 92
    .line 93
    .line 94
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :array_0
    .array-data 1
        0x75t
        0x1et
        0x52t
        0x52t
        0x11t
        0x12t
        0x59t
        0x9t
        0x5ft
        0xdt
    .end array-data
.end method
