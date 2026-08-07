.class public final Ll/n5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public i:Ljava/util/List;

.field public final j:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILandroid/content/Context;)V
    .locals 0

    .line 1
    const-string p3, "tk45mDotIpTZidmNYxxiIBsjVftw/e0h3Unlwpf2Me4="

    .line 2
    .line 3
    const/16 p6, 0x1f

    .line 4
    .line 5
    const-string p2, "0gWjYXznHW/Eye6gdpKNKYjX/XLpx1vdgxUIuTN4hh6FwE+EupqjErYFsUwwKenZ"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/n5s0;->i:Ljava/util/List;

    .line 12
    .line 13
    iput-object p7, p0, Ll/n5s0;->j:Landroid/content/Context;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ll/fzr0;->Q(J)Ll/fzr0;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/fzr0;->M(J)Ll/fzr0;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/n5s0;->j:Landroid/content/Context;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/x5s0;->b:Ll/b4s0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/b4s0;->b()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    iget-object v1, p0, Ll/n5s0;->i:Ljava/util/List;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ljava/util/List;

    .line 39
    .line 40
    iput-object v0, p0, Ll/n5s0;->i:Ljava/util/List;

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/n5s0;->i:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v1, 0x2

    .line 51
    if-ne v0, v1, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 54
    .line 55
    monitor-enter v0

    .line 56
    :try_start_0
    iget-object v1, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 57
    .line 58
    iget-object v2, p0, Ll/n5s0;->i:Ljava/util/List;

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ljava/lang/Long;

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 68
    .line 69
    .line 70
    move-result-wide v2

    .line 71
    invoke-virtual {v1, v2, v3}, Ll/fzr0;->Q(J)Ll/fzr0;

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 75
    .line 76
    iget-object p0, p0, Ll/n5s0;->i:Ljava/util/List;

    .line 77
    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Ljava/lang/Long;

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 86
    .line 87
    .line 88
    move-result-wide v2

    .line 89
    invoke-virtual {v1, v2, v3}, Ll/fzr0;->M(J)Ll/fzr0;

    .line 90
    .line 91
    .line 92
    monitor-exit v0

    .line 93
    return-void

    .line 94
    :catchall_0
    move-exception p0

    .line 95
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    throw p0

    .line 97
    :cond_2
    return-void
.end method
