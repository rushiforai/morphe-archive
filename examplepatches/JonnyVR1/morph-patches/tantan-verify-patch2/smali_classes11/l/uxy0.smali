.class public final Ll/uxy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q0z0;


# instance fields
.field public final a:Ll/ifr0;

.field public b:Ll/per0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:Ll/qer0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ifr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uxy0;->a:Ll/ifr0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uxy0;->b:Ll/per0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, p1, p2, p3, p4}, Ll/per0;->c(JJ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final b(Ll/yfr0;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uxy0;->b:Ll/per0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/uxy0;->c:Ll/qer0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, p0, p1}, Ll/per0;->f(Ll/qer0;Ll/yfr0;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final c(Ll/nyy0;Landroid/net/Uri;Ljava/util/Map;JJLl/ser0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v1, Ll/fer0;

    .line 2
    .line 3
    move-object v2, p1

    .line 4
    move-wide v3, p4

    .line 5
    move-wide v5, p6

    .line 6
    invoke-direct/range {v1 .. v6}, Ll/fer0;-><init>(Ll/nyy0;JJ)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/uxy0;->c:Ll/qer0;

    .line 10
    .line 11
    iget-object p1, p0, Ll/uxy0;->b:Ll/per0;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p0, Ll/uxy0;->a:Ll/ifr0;

    .line 17
    .line 18
    invoke-interface {p1, p2, p3}, Ll/ifr0;->a(Landroid/net/Uri;Ljava/util/Map;)[Ll/per0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    array-length p3, p1

    .line 23
    const/4 p4, 0x0

    .line 24
    const/4 p5, 0x1

    .line 25
    if-ne p3, p5, :cond_1

    .line 26
    .line 27
    aget-object p1, p1, p4

    .line 28
    .line 29
    iput-object p1, p0, Ll/uxy0;->b:Ll/per0;

    .line 30
    .line 31
    goto/16 :goto_7

    .line 32
    .line 33
    :cond_1
    move p6, p4

    .line 34
    :goto_0
    if-ge p6, p3, :cond_7

    .line 35
    .line 36
    aget-object p7, p1, p6

    .line 37
    .line 38
    :try_start_0
    invoke-interface {p7, v1}, Ll/per0;->d(Ll/qer0;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iput-object p7, p0, Ll/uxy0;->b:Ll/per0;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    invoke-static {p5}, Ll/lev0;->f(Z)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 50
    .line 51
    .line 52
    goto :goto_5

    .line 53
    :catchall_0
    move-exception v0

    .line 54
    move-object p1, v0

    .line 55
    goto :goto_3

    .line 56
    :cond_2
    iget-object p7, p0, Ll/uxy0;->b:Ll/per0;

    .line 57
    .line 58
    if-nez p7, :cond_3

    .line 59
    .line 60
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 61
    .line 62
    .line 63
    move-result-wide v5

    .line 64
    cmp-long p7, v5, v3

    .line 65
    .line 66
    if-nez p7, :cond_4

    .line 67
    .line 68
    :cond_3
    :goto_1
    move p7, p5

    .line 69
    goto :goto_2

    .line 70
    :cond_4
    move p7, p4

    .line 71
    :goto_2
    invoke-static {p7}, Ll/lev0;->f(Z)V

    .line 72
    .line 73
    .line 74
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 75
    .line 76
    .line 77
    goto :goto_4

    .line 78
    :goto_3
    iget-object p0, p0, Ll/uxy0;->b:Ll/per0;

    .line 79
    .line 80
    if-nez p0, :cond_5

    .line 81
    .line 82
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 83
    .line 84
    .line 85
    move-result-wide p2

    .line 86
    cmp-long p0, p2, v3

    .line 87
    .line 88
    if-nez p0, :cond_6

    .line 89
    .line 90
    :cond_5
    move p4, p5

    .line 91
    :cond_6
    invoke-static {p4}, Ll/lev0;->f(Z)V

    .line 92
    .line 93
    .line 94
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 95
    .line 96
    .line 97
    throw p1

    .line 98
    :catch_0
    iget-object p7, p0, Ll/uxy0;->b:Ll/per0;

    .line 99
    .line 100
    if-nez p7, :cond_3

    .line 101
    .line 102
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    cmp-long p7, v5, v3

    .line 107
    .line 108
    if-nez p7, :cond_4

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :goto_4
    add-int/lit8 p6, p6, 0x1

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_7
    :goto_5
    iget-object p3, p0, Ll/uxy0;->b:Ll/per0;

    .line 115
    .line 116
    if-nez p3, :cond_a

    .line 117
    .line 118
    new-instance p0, Lcom/google/android/gms/internal/ads/zzwt;

    .line 119
    .line 120
    new-instance p3, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    :goto_6
    array-length p5, p1

    .line 126
    if-ge p4, p5, :cond_9

    .line 127
    .line 128
    aget-object p6, p1, p4

    .line 129
    .line 130
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    .line 132
    .line 133
    move-result-object p6

    .line 134
    invoke-virtual {p6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p6

    .line 138
    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    add-int/lit8 p5, p5, -0x1

    .line 142
    .line 143
    if-ge p4, p5, :cond_8

    .line 144
    .line 145
    const-string p5, ", "

    .line 146
    .line 147
    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    :cond_8
    add-int/lit8 p4, p4, 0x1

    .line 151
    .line 152
    goto :goto_6

    .line 153
    :cond_9
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    new-instance p3, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string p4, "None of the available extractors ("

    .line 160
    .line 161
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string p1, ") could read the stream."

    .line 168
    .line 169
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/ads/zzwt;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 177
    .line 178
    .line 179
    throw p0

    .line 180
    :cond_a
    :goto_7
    iget-object p0, p0, Ll/uxy0;->b:Ll/per0;

    .line 181
    .line 182
    invoke-interface {p0, p8}, Ll/per0;->e(Ll/ser0;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public final zzb()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uxy0;->c:Ll/qer0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/qer0;->zzf()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    return-wide v0
.end method

.method public final zzc()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uxy0;->b:Ll/per0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    instance-of v0, p0, Ll/rlr0;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    check-cast p0, Ll/rlr0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/rlr0;->a()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxy0;->b:Ll/per0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Ll/uxy0;->b:Ll/per0;

    .line 7
    .line 8
    :cond_0
    iput-object v1, p0, Ll/uxy0;->c:Ll/qer0;

    .line 9
    .line 10
    return-void
.end method
