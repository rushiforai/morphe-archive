.class public final Ll/tht0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fex0;


# instance fields
.field public final a:Ll/fex0;

.field public final b:J

.field public final c:Ll/fex0;

.field public d:J

.field public e:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ll/fex0;ILl/fex0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tht0;->a:Ll/fex0;

    .line 5
    .line 6
    int-to-long p1, p2

    .line 7
    iput-wide p1, p0, Ll/tht0;->b:J

    .line 8
    .line 9
    iput-object p3, p0, Ll/tht0;->c:Ll/fex0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/tht0;->d:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/tht0;->b:J

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-gez v4, :cond_0

    .line 8
    .line 9
    int-to-long v4, p3

    .line 10
    sub-long/2addr v2, v0

    .line 11
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    long-to-int v0, v0

    .line 16
    iget-object v1, p0, Ll/tht0;->a:Ll/fex0;

    .line 17
    .line 18
    invoke-interface {v1, p1, p2, v0}, Ll/nyy0;->a([BII)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-wide v1, p0, Ll/tht0;->d:J

    .line 23
    .line 24
    int-to-long v3, v0

    .line 25
    add-long/2addr v1, v3

    .line 26
    iput-wide v1, p0, Ll/tht0;->d:J

    .line 27
    .line 28
    move-wide v6, v1

    .line 29
    move v2, v0

    .line 30
    move-wide v0, v6

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v2, 0x0

    .line 33
    :goto_0
    iget-wide v3, p0, Ll/tht0;->b:J

    .line 34
    .line 35
    cmp-long v0, v0, v3

    .line 36
    .line 37
    if-ltz v0, :cond_1

    .line 38
    .line 39
    sub-int/2addr p3, v2

    .line 40
    iget-object v0, p0, Ll/tht0;->c:Ll/fex0;

    .line 41
    .line 42
    add-int/2addr p2, v2

    .line 43
    invoke-interface {v0, p1, p2, p3}, Ll/nyy0;->a([BII)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/2addr v2, p1

    .line 48
    iget-wide p2, p0, Ll/tht0;->d:J

    .line 49
    .line 50
    int-to-long v0, p1

    .line 51
    add-long/2addr p2, v0

    .line 52
    iput-wide p2, p0, Ll/tht0;->d:J

    .line 53
    .line 54
    :cond_1
    return v2
.end method

.method public final e(Ll/akx0;)J
    .locals 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/akx0;->a:Landroid/net/Uri;

    .line 6
    .line 7
    iput-object v2, v0, Ll/tht0;->e:Landroid/net/Uri;

    .line 8
    .line 9
    iget-wide v2, v0, Ll/tht0;->b:J

    .line 10
    .line 11
    iget-wide v7, v1, Ll/akx0;->f:J

    .line 12
    .line 13
    cmp-long v4, v7, v2

    .line 14
    .line 15
    const/4 v15, 0x0

    .line 16
    const-wide/16 v16, -0x1

    .line 17
    .line 18
    if-ltz v4, :cond_0

    .line 19
    .line 20
    move-object v4, v15

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-wide v4, v1, Ll/akx0;->g:J

    .line 23
    .line 24
    sub-long/2addr v2, v7

    .line 25
    cmp-long v6, v4, v16

    .line 26
    .line 27
    if-eqz v6, :cond_1

    .line 28
    .line 29
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    :cond_1
    move-wide v11, v2

    .line 34
    new-instance v4, Ll/akx0;

    .line 35
    .line 36
    iget-object v5, v1, Ll/akx0;->a:Landroid/net/Uri;

    .line 37
    .line 38
    const/4 v13, 0x0

    .line 39
    const/4 v14, 0x0

    .line 40
    const/4 v6, 0x0

    .line 41
    move-wide v9, v7

    .line 42
    invoke-direct/range {v4 .. v14}, Ll/akx0;-><init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget-wide v2, v1, Ll/akx0;->g:J

    .line 46
    .line 47
    cmp-long v5, v2, v16

    .line 48
    .line 49
    if-eqz v5, :cond_2

    .line 50
    .line 51
    iget-wide v5, v1, Ll/akx0;->f:J

    .line 52
    .line 53
    add-long/2addr v5, v2

    .line 54
    iget-wide v2, v0, Ll/tht0;->b:J

    .line 55
    .line 56
    cmp-long v2, v5, v2

    .line 57
    .line 58
    if-gtz v2, :cond_2

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    iget-wide v2, v0, Ll/tht0;->b:J

    .line 62
    .line 63
    iget-wide v5, v1, Ll/akx0;->f:J

    .line 64
    .line 65
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 66
    .line 67
    .line 68
    move-result-wide v21

    .line 69
    iget-wide v2, v1, Ll/akx0;->g:J

    .line 70
    .line 71
    cmp-long v5, v2, v16

    .line 72
    .line 73
    if-eqz v5, :cond_3

    .line 74
    .line 75
    iget-wide v5, v1, Ll/akx0;->f:J

    .line 76
    .line 77
    add-long/2addr v5, v2

    .line 78
    iget-wide v7, v0, Ll/tht0;->b:J

    .line 79
    .line 80
    sub-long/2addr v5, v7

    .line 81
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    move-wide/from16 v25, v2

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    move-wide/from16 v25, v16

    .line 89
    .line 90
    :goto_1
    new-instance v18, Ll/akx0;

    .line 91
    .line 92
    iget-object v2, v1, Ll/akx0;->a:Landroid/net/Uri;

    .line 93
    .line 94
    const/16 v27, 0x0

    .line 95
    .line 96
    const/16 v28, 0x0

    .line 97
    .line 98
    const/16 v20, 0x0

    .line 99
    .line 100
    move-wide/from16 v23, v21

    .line 101
    .line 102
    move-object/from16 v19, v2

    .line 103
    .line 104
    invoke-direct/range {v18 .. v28}, Ll/akx0;-><init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    move-object/from16 v15, v18

    .line 108
    .line 109
    :goto_2
    const-wide/16 v2, 0x0

    .line 110
    .line 111
    if-eqz v4, :cond_4

    .line 112
    .line 113
    iget-object v5, v0, Ll/tht0;->a:Ll/fex0;

    .line 114
    .line 115
    invoke-interface {v5, v4}, Ll/fex0;->e(Ll/akx0;)J

    .line 116
    .line 117
    .line 118
    move-result-wide v4

    .line 119
    goto :goto_3

    .line 120
    :cond_4
    move-wide v4, v2

    .line 121
    :goto_3
    if-eqz v15, :cond_5

    .line 122
    .line 123
    iget-object v2, v0, Ll/tht0;->c:Ll/fex0;

    .line 124
    .line 125
    invoke-interface {v2, v15}, Ll/fex0;->e(Ll/akx0;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v2

    .line 129
    :cond_5
    iget-wide v6, v1, Ll/akx0;->f:J

    .line 130
    .line 131
    iput-wide v6, v0, Ll/tht0;->d:J

    .line 132
    .line 133
    cmp-long v0, v4, v16

    .line 134
    .line 135
    if-eqz v0, :cond_7

    .line 136
    .line 137
    cmp-long v0, v2, v16

    .line 138
    .line 139
    if-nez v0, :cond_6

    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_6
    add-long/2addr v4, v2

    .line 143
    return-wide v4

    .line 144
    :cond_7
    :goto_4
    return-wide v16
.end method

.method public final f(Ll/btx0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tht0;->e:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tht0;->a:Ll/fex0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/fex0;->zzd()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/tht0;->c:Ll/fex0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/fex0;->zzd()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final zze()Ljava/util/Map;
    .locals 0

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgad;->zzd()Lcom/google/android/gms/internal/ads/zzgad;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
