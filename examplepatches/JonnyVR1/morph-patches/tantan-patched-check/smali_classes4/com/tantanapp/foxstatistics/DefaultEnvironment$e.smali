.class public Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/foxstatistics/DefaultEnvironment;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;


# direct methods
.method public constructor <init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

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
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "wfs"

    .line 8
    .line 9
    iget-object v2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 10
    .line 11
    invoke-static {v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Ll/ql20;->d(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "bts"

    .line 33
    .line 34
    invoke-static {}, Ll/l0e;->a()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "gs"

    .line 52
    .line 53
    iget-object v2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 54
    .line 55
    invoke-static {v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v2}, Ll/l0e;->g(Landroid/content/Context;)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "net"

    .line 77
    .line 78
    iget-object v2, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 79
    .line 80
    invoke-static {v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {v2}, Ll/ql20;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v1, "mno"

    .line 98
    .line 99
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;->a:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 100
    .line 101
    invoke-static {p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Ll/ql20;->c(Landroid/content/Context;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :catch_0
    move-exception p0

    .line 114
    invoke-static {p0}, Ll/i6f;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Ll/i4g0;->C(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method
