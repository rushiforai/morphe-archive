.class public final Ll/txu0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Landroid/os/Bundle;

.field public final synthetic i:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/txu0;->e:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/txu0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 6
    .line 7
    iput-object p5, p0, Ll/txu0;->h:Landroid/os/Bundle;

    .line 8
    .line 9
    iput-object p1, p0, Ll/txu0;->i:Ll/zyu0;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 15

    .line 1
    const-string v0, "com.google.android.gms.measurement.dynamite"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    :try_start_0
    iget-object v3, p0, Ll/txu0;->i:Ll/zyu0;

    .line 6
    .line 7
    iget-object v4, p0, Ll/txu0;->e:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v5, p0, Ll/txu0;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v3, v4, v5}, Ll/zyu0;->D(Ll/zyu0;Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    iget-object v3, p0, Ll/txu0;->f:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v4, p0, Ll/txu0;->e:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v5, p0, Ll/txu0;->i:Ll/zyu0;

    .line 22
    .line 23
    invoke-static {v5}, Ll/zyu0;->E(Ll/zyu0;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    move-object v12, v3

    .line 28
    move-object v11, v4

    .line 29
    move-object v10, v5

    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception v0

    .line 32
    goto :goto_3

    .line 33
    :cond_0
    const/4 v3, 0x0

    .line 34
    move-object v10, v3

    .line 35
    move-object v11, v10

    .line 36
    move-object v12, v11

    .line 37
    :goto_0
    iget-object v3, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 38
    .line 39
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Ll/txu0;->i:Ll/zyu0;

    .line 43
    .line 44
    iget-object v4, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 45
    .line 46
    invoke-virtual {v3, v4, v2}, Ll/zyu0;->g(Landroid/content/Context;Z)Ll/pgu0;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-static {v3, v4}, Ll/zyu0;->y(Ll/zyu0;Ll/pgu0;)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Ll/txu0;->i:Ll/zyu0;

    .line 54
    .line 55
    invoke-static {v3}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    if-nez v3, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Ll/txu0;->i:Ll/zyu0;

    .line 62
    .line 63
    invoke-static {v0}, Ll/zyu0;->E(Ll/zyu0;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iget-object v3, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 68
    .line 69
    invoke-static {v3, v0}, Lcom/google/android/gms/dynamite/DynamiteModule;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    iget-object v4, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 74
    .line 75
    invoke-static {v4, v0}, Lcom/google/android/gms/dynamite/DynamiteModule;->c(Landroid/content/Context;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-ge v0, v3, :cond_2

    .line 84
    .line 85
    move v9, v2

    .line 86
    :goto_1
    move v0, v4

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    move v9, v1

    .line 89
    goto :goto_1

    .line 90
    :goto_2
    new-instance v4, Lcom/google/android/gms/internal/measurement/zzdw;

    .line 91
    .line 92
    int-to-long v7, v0

    .line 93
    iget-object v13, p0, Ll/txu0;->h:Landroid/os/Bundle;

    .line 94
    .line 95
    iget-object v0, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 96
    .line 97
    invoke-static {v0}, Ll/dsx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v14

    .line 101
    const-wide/32 v5, 0x19e10

    .line 102
    .line 103
    .line 104
    invoke-direct/range {v4 .. v14}, Lcom/google/android/gms/internal/measurement/zzdw;-><init>(JJZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/txu0;->i:Ll/zyu0;

    .line 108
    .line 109
    invoke-static {v0}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ll/pgu0;

    .line 118
    .line 119
    iget-object v3, p0, Ll/txu0;->g:Landroid/content/Context;

    .line 120
    .line 121
    invoke-static {v3}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget-wide v5, p0, Ll/zyu0$a;->a:J

    .line 126
    .line 127
    invoke-interface {v0, v3, v4, v5, v6}, Ll/pgu0;->initialize(Ll/p1m;Lcom/google/android/gms/internal/measurement/zzdw;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :goto_3
    iget-object p0, p0, Ll/txu0;->i:Ll/zyu0;

    .line 132
    .line 133
    invoke-static {p0, v0, v2, v1}, Ll/zyu0;->x(Ll/zyu0;Ljava/lang/Exception;ZZ)V

    .line 134
    .line 135
    .line 136
    return-void
.end method
