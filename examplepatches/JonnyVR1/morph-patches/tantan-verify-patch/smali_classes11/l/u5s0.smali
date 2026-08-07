.class public final Ll/u5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILandroid/view/View;)V
    .locals 0

    .line 1
    const-string p3, "eISRjanjhAfdgJ9+lE3tGViJFRMvsuX1oVbmo+9k2XU="

    .line 2
    .line 3
    const/16 p6, 0x39

    .line 4
    .line 5
    const-string p2, "a1Na7bntM+sktGxZBhUnqailj8ITQ7piLQZ5OyqVU2HU4R0rOCZ63N/fUHG081A+"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/u5s0;->i:Landroid/view/View;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u5s0;->i:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Ll/sgs0;->k3:Ll/dgs0;

    .line 6
    .line 7
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    sget-object v1, Ll/sgs0;->ua:Ll/dgs0;

    .line 18
    .line 19
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Boolean;

    .line 28
    .line 29
    iget-object v2, p0, Ll/x5s0;->b:Ll/b4s0;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/b4s0;->b()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 44
    .line 45
    iget-object v4, p0, Ll/u5s0;->i:Landroid/view/View;

    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    filled-new-array {v4, v2, v0, v1}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v3, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ljava/lang/String;

    .line 57
    .line 58
    new-instance v3, Ll/f4s0;

    .line 59
    .line 60
    invoke-direct {v3, v2}, Ll/f4s0;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/google/android/gms/internal/ads/m;->L()Ll/d0s0;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v4, v3, Ll/f4s0;->a:Ljava/lang/Long;

    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    invoke-virtual {v2, v4, v5}, Ll/d0s0;->r(J)Ll/d0s0;

    .line 74
    .line 75
    .line 76
    iget-object v4, v3, Ll/f4s0;->b:Ljava/lang/Long;

    .line 77
    .line 78
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    invoke-virtual {v2, v4, v5}, Ll/d0s0;->t(J)Ll/d0s0;

    .line 83
    .line 84
    .line 85
    iget-object v4, v3, Ll/f4s0;->c:Ljava/lang/Long;

    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    invoke-virtual {v2, v4, v5}, Ll/d0s0;->u(J)Ll/d0s0;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_0

    .line 99
    .line 100
    iget-object v1, v3, Ll/f4s0;->e:Ljava/lang/Long;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 103
    .line 104
    .line 105
    move-result-wide v4

    .line 106
    invoke-virtual {v2, v4, v5}, Ll/d0s0;->s(J)Ll/d0s0;

    .line 107
    .line 108
    .line 109
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_1

    .line 114
    .line 115
    iget-object v0, v3, Ll/f4s0;->d:Ljava/lang/Long;

    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    invoke-virtual {v2, v0, v1}, Ll/d0s0;->q(J)Ll/d0s0;

    .line 122
    .line 123
    .line 124
    :cond_1
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 125
    .line 126
    invoke-virtual {v2}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/google/android/gms/internal/ads/m;

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Ll/fzr0;->S(Lcom/google/android/gms/internal/ads/m;)Ll/fzr0;

    .line 133
    .line 134
    .line 135
    :cond_2
    return-void
.end method
