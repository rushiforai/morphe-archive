.class Ll/bje$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bje;->i(Ll/bje$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/bje;


# direct methods
.method public constructor <init>(Ll/bje;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bje$a;->a:Ll/bje;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bje$a;->a:Ll/bje;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bje;->a(Ll/bje;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/bje$a;->a:Ll/bje;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p0, v0, v1}, Ll/bje;->b(Ll/bje;ZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :try_start_0
    const-string v2, "lclclc ------\nlclclc -----"

    .line 20
    .line 21
    const-string v3, "config\u8bf7\u6c42"

    .line 22
    .line 23
    new-array v4, v0, [Ljava/lang/Object;

    .line 24
    .line 25
    invoke-static {v2, v3, v4}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ll/bje$a;->a:Ll/bje;

    .line 29
    .line 30
    invoke-static {v2}, Ll/bje;->c(Ll/bje;)Z

    .line 31
    .line 32
    .line 33
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    iget-object v3, p0, Ll/bje$a;->a:Ll/bje;

    .line 35
    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    :try_start_1
    const-string v2, "\u8bf7\u6c42\u8fc7\u4e8e\u9891\u7e41"

    .line 39
    .line 40
    invoke-static {v3, v0, v2}, Ll/bje;->b(Ll/bje;ZLjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception v2

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-static {v3}, Ll/bje;->d(Ll/bje;)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Ll/bje$a;->a:Ll/bje;

    .line 55
    .line 56
    invoke-static {v3}, Ll/bje;->d(Ll/bje;)Ljava/util/Map;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-interface {v3}, Ljava/util/Map;->size()I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    new-array v3, v3, [Ll/aje;

    .line 65
    .line 66
    invoke-interface {v2, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, [Ll/aje;

    .line 71
    .line 72
    invoke-static {v2}, Ll/cje;->f([Ll/aje;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-static {v2}, Ll/l3d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iget-object v3, p0, Ll/bje$a;->a:Ll/bje;

    .line 81
    .line 82
    new-instance v4, Lorg/json/JSONObject;

    .line 83
    .line 84
    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v4}, Ll/bje;->g(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :goto_0
    const-string v3, "SDKResource"

    .line 92
    .line 93
    invoke-static {v3, v2}, Lcom/immomo/resdownloader/log/MLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v3, "\u62c9\u53d6\u914d\u7f6e\u5b8c\u6210\uff0c\u7ed3\u679c\uff1a"

    .line 99
    .line 100
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v3, p0, Ll/bje$a;->a:Ll/bje;

    .line 104
    .line 105
    invoke-static {v3}, Ll/bje;->a(Ll/bje;)Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    new-array v0, v0, [Ljava/lang/Object;

    .line 117
    .line 118
    const-string v3, "lclcl_"

    .line 119
    .line 120
    invoke-static {v3, v2, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/bje$a;->a:Ll/bje;

    .line 124
    .line 125
    invoke-static {v0}, Ll/bje;->a(Ll/bje;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    iget-object p0, p0, Ll/bje$a;->a:Ll/bje;

    .line 130
    .line 131
    invoke-static {p0}, Ll/bje;->a(Ll/bje;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_2

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_2
    const-string v1, "\u62c9\u53d6\u914d\u7f6e\u5931\u8d25"

    .line 139
    .line 140
    :goto_2
    invoke-static {v0, v2, v1}, Ll/bje;->b(Ll/bje;ZLjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method
