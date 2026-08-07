.class public final Ll/huv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/s9t0;

.field public final b:Ll/xvw0;

.field public final c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/s9t0;Ll/xvw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/huv0;->a:Ll/s9t0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/huv0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/huv0;->c:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/iuv0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/huv0;->a:Ll/s9t0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/huv0;->c:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/s9t0;->p(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/iuv0;

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-direct/range {v1 .. v6}, Ll/iuv0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    .line 19
    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    iget-object v0, p0, Ll/huv0;->a:Ll/s9t0;

    .line 23
    .line 24
    iget-object v1, p0, Ll/huv0;->c:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/s9t0;->d(Landroid/content/Context;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, ""

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    move-object v3, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    move-object v3, v0

    .line 37
    :goto_0
    iget-object v0, p0, Ll/huv0;->a:Ll/s9t0;

    .line 38
    .line 39
    iget-object v2, p0, Ll/huv0;->c:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ll/s9t0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    move-object v4, v1

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object v4, v0

    .line 50
    :goto_1
    iget-object v0, p0, Ll/huv0;->a:Ll/s9t0;

    .line 51
    .line 52
    iget-object v2, p0, Ll/huv0;->c:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ll/s9t0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    move-object v5, v1

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    move-object v5, v0

    .line 63
    :goto_2
    iget-object v0, p0, Ll/huv0;->a:Ll/s9t0;

    .line 64
    .line 65
    iget-object p0, p0, Ll/huv0;->c:Landroid/content/Context;

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ll/s9t0;->p(Landroid/content/Context;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    const/4 v0, 0x0

    .line 72
    const/4 v2, 0x1

    .line 73
    if-eq v2, p0, :cond_4

    .line 74
    .line 75
    move-object p0, v0

    .line 76
    goto :goto_3

    .line 77
    :cond_4
    const-string p0, "fa"

    .line 78
    .line 79
    :goto_3
    const-string v2, "TIME_OUT"

    .line 80
    .line 81
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_5

    .line 86
    .line 87
    sget-object v0, Ll/sgs0;->f0:Ll/dgs0;

    .line 88
    .line 89
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Ljava/lang/Long;

    .line 98
    .line 99
    :cond_5
    move-object v7, v0

    .line 100
    if-nez p0, :cond_6

    .line 101
    .line 102
    move-object v6, v1

    .line 103
    goto :goto_4

    .line 104
    :cond_6
    move-object v6, p0

    .line 105
    :goto_4
    new-instance v2, Ll/iuv0;

    .line 106
    .line 107
    invoke-direct/range {v2 .. v7}, Ll/iuv0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    .line 108
    .line 109
    .line 110
    return-object v2
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x22

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/guv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/guv0;-><init>(Ll/huv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/huv0;->b:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
