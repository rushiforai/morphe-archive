.class public final Ll/a0v0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/lzu0;

.field public final b:Ll/xtu0;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/util/List;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field

.field public e:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "lock"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/lzu0;Ll/xtu0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/a0v0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Ll/a0v0;->a:Ll/lzu0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/a0v0;->b:Ll/xtu0;

    .line 14
    .line 15
    new-instance p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/a0v0;->d:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method

.method public static bridge synthetic b(Ll/a0v0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a0v0;->d(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Lorg/json/JSONArray;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/a0v0;->c:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-boolean v2, p0, Ll/a0v0;->e:Z

    .line 10
    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Ll/a0v0;->a:Ll/lzu0;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/lzu0;->t()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Ll/a0v0;->a:Ll/lzu0;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/lzu0;->g()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p0, v2}, Ll/a0v0;->d(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    invoke-virtual {p0}, Ll/a0v0;->c()V

    .line 34
    .line 35
    .line 36
    monitor-exit v1

    .line 37
    return-object v0

    .line 38
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/a0v0;->d:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ll/zzu0;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/zzu0;->a()Lorg/json/JSONObject;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    monitor-exit v1

    .line 65
    return-object v0

    .line 66
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    throw p0
.end method

.method public final c()V
    .locals 1

    .line 1
    new-instance v0, Ll/yzu0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yzu0;-><init>(Ll/a0v0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/a0v0;->a:Ll/lzu0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/lzu0;->s(Ll/lss0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d(Ljava/util/List;)V
    .locals 12

    .line 1
    iget-object v1, p0, Ll/a0v0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/a0v0;->e:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    monitor-exit v1

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    move-object p0, v0

    .line 12
    goto/16 :goto_5

    .line 13
    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v0, :cond_6

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/google/android/gms/internal/ads/zzbpd;

    .line 30
    .line 31
    sget-object v3, Ll/sgs0;->j9:Ll/dgs0;

    .line 32
    .line 33
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_3

    .line 48
    .line 49
    iget-object v3, p0, Ll/a0v0;->b:Ll/xtu0;

    .line 50
    .line 51
    iget-object v4, v0, Lcom/google/android/gms/internal/ads/zzbpd;->zza:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Ll/xtu0;->a(Ljava/lang/String;)Ll/wtu0;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    iget-object v3, v3, Ll/wtu0;->c:Lcom/google/android/gms/internal/ads/zzbvg;

    .line 60
    .line 61
    if-nez v3, :cond_1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbvg;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    :goto_1
    move-object v6, v3

    .line 69
    goto :goto_3

    .line 70
    :cond_2
    :goto_2
    const-string v3, ""

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    const-string v3, ""

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :goto_3
    sget-object v3, Ll/sgs0;->k9:Ll/dgs0;

    .line 77
    .line 78
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    const/4 v4, 0x0

    .line 93
    if-eqz v3, :cond_4

    .line 94
    .line 95
    iget-object v3, p0, Ll/a0v0;->b:Ll/xtu0;

    .line 96
    .line 97
    iget-object v5, v0, Lcom/google/android/gms/internal/ads/zzbpd;->zza:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v3, v5}, Ll/xtu0;->a(Ljava/lang/String;)Ll/wtu0;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    if-nez v3, :cond_5

    .line 104
    .line 105
    :cond_4
    move v11, v4

    .line 106
    goto :goto_4

    .line 107
    :cond_5
    iget-boolean v3, v3, Ll/wtu0;->d:Z

    .line 108
    .line 109
    if-eqz v3, :cond_4

    .line 110
    .line 111
    move v11, v2

    .line 112
    :goto_4
    iget-object v2, p0, Ll/a0v0;->d:Ljava/util/List;

    .line 113
    .line 114
    new-instance v4, Ll/zzu0;

    .line 115
    .line 116
    iget-object v5, v0, Lcom/google/android/gms/internal/ads/zzbpd;->zza:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v3, p0, Ll/a0v0;->b:Ll/xtu0;

    .line 119
    .line 120
    invoke-virtual {v3, v5}, Ll/xtu0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    iget-boolean v8, v0, Lcom/google/android/gms/internal/ads/zzbpd;->zzb:Z

    .line 125
    .line 126
    iget-object v9, v0, Lcom/google/android/gms/internal/ads/zzbpd;->zzd:Ljava/lang/String;

    .line 127
    .line 128
    iget v10, v0, Lcom/google/android/gms/internal/ads/zzbpd;->zzc:I

    .line 129
    .line 130
    invoke-direct/range {v4 .. v11}, Ll/zzu0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)V

    .line 131
    .line 132
    .line 133
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_6
    iput-boolean v2, p0, Ll/a0v0;->e:Z

    .line 138
    .line 139
    monitor-exit v1

    .line 140
    return-void

    .line 141
    :goto_5
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    throw p0
.end method
