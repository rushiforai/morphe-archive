.class public final Ll/xmr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final F:Ll/ifr0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final G:[B

.field public static final H:Ll/sqr0;


# instance fields
.field public A:Z

.field public B:Ll/ser0;

.field public C:[Ll/sgr0;

.field public D:[Ll/sgr0;

.field public E:Z

.field public final a:Ll/vor0;

.field public final b:Ljava/util/List;

.field public final c:Landroid/util/SparseArray;

.field public final d:Ll/bgw0;

.field public final e:Ll/bgw0;

.field public final f:Ll/bgw0;

.field public final g:[B

.field public final h:Ll/bgw0;

.field public final i:Ll/wir0;

.field public final j:Ll/bgw0;

.field public final k:Ljava/util/ArrayDeque;

.field public final l:Ljava/util/ArrayDeque;

.field public m:I

.field public n:I

.field public o:J

.field public p:I

.field public q:Ll/bgw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public r:J

.field public s:I

.field public t:J

.field public u:J

.field public v:J

.field public w:Ll/wmr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Ll/jmr0;->b:Ll/jmr0;

    .line 2
    .line 3
    sput-object v0, Ll/xmr0;->F:Ll/ifr0;

    .line 4
    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    sput-object v0, Ll/xmr0;->G:[B

    .line 13
    .line 14
    new-instance v0, Ll/znr0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "application/x-emsg"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Ll/xmr0;->H:Ll/sqr0;

    .line 29
    .line 30
    return-void

    .line 31
    :array_0
    .array-data 1
        -0x5et
        0x39t
        0x4ft
        0x52t
        0x5at
        -0x65t
        0x4ft
        0x14t
        -0x5et
        0x44t
        0x6ct
        0x42t
        0x7ct
        0x64t
        -0x73t
        -0xct
    .end array-data
.end method

.method public constructor <init>()V
    .locals 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 109
    sget-object v1, Ll/vor0;->a:Ll/vor0;

    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    move-result-object v5

    const/4 v6, 0x0

    const/16 v2, 0x20

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    .line 110
    invoke-direct/range {v0 .. v6}, Ll/xmr0;-><init>(Ll/vor0;ILl/nnw0;Ll/hnr0;Ljava/util/List;Ll/sgr0;)V

    return-void
.end method

.method public constructor <init>(Ll/vor0;ILl/nnw0;Ll/hnr0;Ljava/util/List;Ll/sgr0;)V
    .locals 0
    .param p3    # Ll/nnw0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/hnr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/sgr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xmr0;->a:Ll/vor0;

    .line 5
    .line 6
    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/xmr0;->b:Ljava/util/List;

    .line 11
    .line 12
    new-instance p1, Ll/wir0;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/wir0;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/xmr0;->i:Ll/wir0;

    .line 18
    .line 19
    new-instance p1, Ll/bgw0;

    .line 20
    .line 21
    const/16 p2, 0x10

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ll/bgw0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/xmr0;->j:Ll/bgw0;

    .line 27
    .line 28
    new-instance p1, Ll/bgw0;

    .line 29
    .line 30
    sget-object p3, Ll/w3x0;->a:[B

    .line 31
    .line 32
    invoke-direct {p1, p3}, Ll/bgw0;-><init>([B)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/xmr0;->d:Ll/bgw0;

    .line 36
    .line 37
    new-instance p1, Ll/bgw0;

    .line 38
    .line 39
    const/4 p3, 0x5

    .line 40
    invoke-direct {p1, p3}, Ll/bgw0;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/xmr0;->e:Ll/bgw0;

    .line 44
    .line 45
    new-instance p1, Ll/bgw0;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/xmr0;->f:Ll/bgw0;

    .line 51
    .line 52
    new-array p1, p2, [B

    .line 53
    .line 54
    iput-object p1, p0, Ll/xmr0;->g:[B

    .line 55
    .line 56
    new-instance p2, Ll/bgw0;

    .line 57
    .line 58
    invoke-direct {p2, p1}, Ll/bgw0;-><init>([B)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Ll/xmr0;->h:Ll/bgw0;

    .line 62
    .line 63
    new-instance p1, Ljava/util/ArrayDeque;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 69
    .line 70
    new-instance p1, Ljava/util/ArrayDeque;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Ll/xmr0;->l:Ljava/util/ArrayDeque;

    .line 76
    .line 77
    new-instance p1, Landroid/util/SparseArray;

    .line 78
    .line 79
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 83
    .line 84
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    iput-wide p1, p0, Ll/xmr0;->u:J

    .line 90
    .line 91
    iput-wide p1, p0, Ll/xmr0;->t:J

    .line 92
    .line 93
    iput-wide p1, p0, Ll/xmr0;->v:J

    .line 94
    .line 95
    sget-object p1, Ll/ser0;->v0:Ll/ser0;

    .line 96
    .line 97
    iput-object p1, p0, Ll/xmr0;->B:Ll/ser0;

    .line 98
    .line 99
    const/4 p1, 0x0

    .line 100
    new-array p2, p1, [Ll/sgr0;

    .line 101
    .line 102
    iput-object p2, p0, Ll/xmr0;->C:[Ll/sgr0;

    .line 103
    .line 104
    new-array p1, p1, [Ll/sgr0;

    .line 105
    .line 106
    iput-object p1, p0, Ll/xmr0;->D:[Ll/sgr0;

    .line 107
    .line 108
    return-void
.end method

.method public static a(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    if-ltz p0, :cond_0

    .line 2
    .line 3
    return p0

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "Unexpected negative value: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    throw p0
.end method

.method public static b(Ljava/util/List;)Lcom/google/android/gms/internal/ads/zzae;
    .locals 14
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v1

    .line 8
    move-object v4, v2

    .line 9
    :goto_0
    if-ge v3, v0, :cond_a

    .line 10
    .line 11
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    check-cast v5, Ll/ylr0;

    .line 16
    .line 17
    iget v6, v5, Ll/zlr0;->a:I

    .line 18
    .line 19
    const v7, 0x70737368    # 3.013775E29f

    .line 20
    .line 21
    .line 22
    if-ne v6, v7, :cond_9

    .line 23
    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    new-instance v4, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v5, v5, Ll/ylr0;->b:Ll/bgw0;

    .line 32
    .line 33
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    new-instance v6, Ll/bgw0;

    .line 38
    .line 39
    invoke-direct {v6, v5}, Ll/bgw0;-><init>([B)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v6}, Ll/bgw0;->t()I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    const/16 v9, 0x20

    .line 47
    .line 48
    if-ge v8, v9, :cond_1

    .line 49
    .line 50
    :goto_1
    move-object v6, v2

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    invoke-virtual {v6, v1}, Ll/bgw0;->k(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6}, Ll/bgw0;->v()I

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    invoke-virtual {v6}, Ll/bgw0;->q()I

    .line 60
    .line 61
    .line 62
    move-result v9

    .line 63
    add-int/lit8 v9, v9, 0x4

    .line 64
    .line 65
    if-eq v8, v9, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-virtual {v6}, Ll/bgw0;->v()I

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    if-eq v8, v7, :cond_3

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    invoke-virtual {v6}, Ll/bgw0;->v()I

    .line 76
    .line 77
    .line 78
    move-result v7

    .line 79
    invoke-static {v7}, Ll/zlr0;->a(I)I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    const/4 v8, 0x1

    .line 84
    if-le v7, v8, :cond_4

    .line 85
    .line 86
    new-instance v6, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v8, "Unsupported pssh version: "

    .line 89
    .line 90
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    const-string v7, "PsshAtomUtil"

    .line 101
    .line 102
    invoke-static {v7, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    new-instance v9, Ljava/util/UUID;

    .line 107
    .line 108
    invoke-virtual {v6}, Ll/bgw0;->I()J

    .line 109
    .line 110
    .line 111
    move-result-wide v10

    .line 112
    invoke-virtual {v6}, Ll/bgw0;->I()J

    .line 113
    .line 114
    .line 115
    move-result-wide v12

    .line 116
    invoke-direct {v9, v10, v11, v12, v13}, Ljava/util/UUID;-><init>(JJ)V

    .line 117
    .line 118
    .line 119
    if-ne v7, v8, :cond_5

    .line 120
    .line 121
    invoke-virtual {v6}, Ll/bgw0;->E()I

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    mul-int/lit8 v8, v8, 0x10

    .line 126
    .line 127
    invoke-virtual {v6, v8}, Ll/bgw0;->l(I)V

    .line 128
    .line 129
    .line 130
    :cond_5
    invoke-virtual {v6}, Ll/bgw0;->E()I

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    invoke-virtual {v6}, Ll/bgw0;->q()I

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    if-eq v8, v10, :cond_6

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_6
    new-array v10, v8, [B

    .line 142
    .line 143
    invoke-virtual {v6, v10, v1, v8}, Ll/bgw0;->g([BII)V

    .line 144
    .line 145
    .line 146
    new-instance v6, Ll/dnr0;

    .line 147
    .line 148
    invoke-direct {v6, v9, v7, v10}, Ll/dnr0;-><init>(Ljava/util/UUID;I[B)V

    .line 149
    .line 150
    .line 151
    :goto_2
    if-nez v6, :cond_7

    .line 152
    .line 153
    move-object v6, v2

    .line 154
    goto :goto_3

    .line 155
    :cond_7
    invoke-static {v6}, Ll/dnr0;->a(Ll/dnr0;)Ljava/util/UUID;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    :goto_3
    if-nez v6, :cond_8

    .line 160
    .line 161
    const-string v5, "FragmentedMp4Extractor"

    .line 162
    .line 163
    const-string v6, "Skipped pssh atom (failed to extract uuid)"

    .line 164
    .line 165
    invoke-static {v5, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_8
    new-instance v7, Lcom/google/android/gms/internal/ads/zzad;

    .line 170
    .line 171
    const-string v8, "video/mp4"

    .line 172
    .line 173
    invoke-direct {v7, v6, v2, v8, v5}, Lcom/google/android/gms/internal/ads/zzad;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;[B)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    :cond_9
    :goto_4
    add-int/lit8 v3, v3, 0x1

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_a
    if-nez v4, :cond_b

    .line 184
    .line 185
    return-object v2

    .line 186
    :cond_b
    new-instance p0, Lcom/google/android/gms/internal/ads/zzae;

    .line 187
    .line 188
    invoke-direct {p0, v4}, Lcom/google/android/gms/internal/ads/zzae;-><init>(Ljava/util/List;)V

    .line 189
    .line 190
    .line 191
    return-object p0
.end method

.method public static h(Ll/bgw0;ILl/jnr0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    add-int/lit8 p1, p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bgw0;->k(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bgw0;->v()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    and-int/lit8 v0, p1, 0x1

    .line 11
    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    and-int/lit8 p1, p1, 0x2

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p1, v0

    .line 22
    :goto_0
    invoke-virtual {p0}, Ll/bgw0;->E()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget-object p0, p2, Ll/jnr0;->l:[Z

    .line 29
    .line 30
    iget p1, p2, Ll/jnr0;->e:I

    .line 31
    .line 32
    invoke-static {p0, v0, p1, v0}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget v2, p2, Ll/jnr0;->e:I

    .line 37
    .line 38
    if-ne v1, v2, :cond_2

    .line 39
    .line 40
    iget-object v2, p2, Ll/jnr0;->l:[Z

    .line 41
    .line 42
    invoke-static {v2, v0, v1, p1}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/bgw0;->q()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    invoke-virtual {p2, p1}, Ll/jnr0;->a(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p2, Ll/jnr0;->n:Ll/bgw0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-virtual {p0, v1, v0, p1}, Ll/bgw0;->g([BII)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p2, Ll/jnr0;->n:Ll/bgw0;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/bgw0;->k(I)V

    .line 68
    .line 69
    .line 70
    iput-boolean v0, p2, Ll/jnr0;->o:Z

    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string p1, "Senc sample count "

    .line 76
    .line 77
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p1, " is different from fragment sample count"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const/4 p1, 0x0

    .line 96
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    throw p0

    .line 101
    :cond_3
    const-string p0, "Overriding TrackEncryptionBox parameters is unsupported."

    .line 102
    .line 103
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    throw p0
.end method

.method public static final j(Landroid/util/SparseArray;I)Ll/imr0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/imr0;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/imr0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    return-object p0
.end method


# virtual methods
.method public final c(JJ)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, 0x0

    .line 8
    move v0, p2

    .line 9
    :goto_0
    if-ge v0, p1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/wmr0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wmr0;->i()V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p0, Ll/xmr0;->l:Ljava/util/ArrayDeque;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    .line 28
    .line 29
    .line 30
    iput p2, p0, Ll/xmr0;->s:I

    .line 31
    .line 32
    iput-wide p3, p0, Ll/xmr0;->t:J

    .line 33
    .line 34
    iget-object p1, p0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xmr0;->g()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/gnr0;->a(Ll/qer0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 5

    .line 1
    iput-object p1, p0, Ll/xmr0;->B:Ll/ser0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xmr0;->g()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x2

    .line 7
    new-array p1, p1, [Ll/sgr0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/xmr0;->C:[Ll/sgr0;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p1, v0}, Ll/mpw0;->l([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, [Ll/sgr0;

    .line 17
    .line 18
    iput-object p1, p0, Ll/xmr0;->C:[Ll/sgr0;

    .line 19
    .line 20
    array-length v1, p1

    .line 21
    move v2, v0

    .line 22
    :goto_0
    if-ge v2, v1, :cond_0

    .line 23
    .line 24
    aget-object v3, p1, v2

    .line 25
    .line 26
    sget-object v4, Ll/xmr0;->H:Ll/sqr0;

    .line 27
    .line 28
    invoke-interface {v3, v4}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p1, p0, Ll/xmr0;->b:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    new-array p1, p1, [Ll/sgr0;

    .line 41
    .line 42
    iput-object p1, p0, Ll/xmr0;->D:[Ll/sgr0;

    .line 43
    .line 44
    const/16 p1, 0x64

    .line 45
    .line 46
    :goto_1
    iget-object v1, p0, Ll/xmr0;->D:[Ll/sgr0;

    .line 47
    .line 48
    array-length v1, v1

    .line 49
    if-ge v0, v1, :cond_1

    .line 50
    .line 51
    iget-object v1, p0, Ll/xmr0;->B:Ll/ser0;

    .line 52
    .line 53
    add-int/lit8 v2, p1, 0x1

    .line 54
    .line 55
    const/4 v3, 0x3

    .line 56
    invoke-interface {v1, p1, v3}, Ll/ser0;->i(II)Ll/sgr0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v1, p0, Ll/xmr0;->b:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ll/sqr0;

    .line 67
    .line 68
    invoke-interface {p1, v1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Ll/xmr0;->D:[Ll/sgr0;

    .line 72
    .line 73
    aput-object p1, v1, v0

    .line 74
    .line 75
    add-int/lit8 v0, v0, 0x1

    .line 76
    .line 77
    move p1, v2

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 34
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
    :goto_0
    iget v2, v0, Ll/xmr0;->m:I

    .line 6
    .line 7
    const v3, 0x656d7367

    .line 8
    .line 9
    .line 10
    const v4, 0x73696478

    .line 11
    .line 12
    .line 13
    const/4 v5, 0x2

    .line 14
    const/4 v7, 0x0

    .line 15
    const/4 v8, 0x1

    .line 16
    const/4 v9, 0x0

    .line 17
    if-eqz v2, :cond_30

    .line 18
    .line 19
    const-string v10, "FragmentedMp4Extractor"

    .line 20
    .line 21
    if-eq v2, v8, :cond_22

    .line 22
    .line 23
    const-wide v3, 0x7fffffffffffffffL

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    const/4 v12, 0x3

    .line 29
    if-eq v2, v5, :cond_1d

    .line 30
    .line 31
    iget-object v2, v0, Ll/xmr0;->w:Ll/wmr0;

    .line 32
    .line 33
    if-nez v2, :cond_7

    .line 34
    .line 35
    iget-object v2, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 38
    .line 39
    .line 40
    move-result v13

    .line 41
    move-wide v14, v3

    .line 42
    move-object v3, v7

    .line 43
    move v4, v9

    .line 44
    :goto_1
    if-ge v4, v13, :cond_3

    .line 45
    .line 46
    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v16

    .line 50
    move/from16 p2, v5

    .line 51
    .line 52
    move-object/from16 v5, v16

    .line 53
    .line 54
    check-cast v5, Ll/wmr0;

    .line 55
    .line 56
    invoke-static {v5}, Ll/wmr0;->j(Ll/wmr0;)Z

    .line 57
    .line 58
    .line 59
    move-result v16

    .line 60
    if-nez v16, :cond_0

    .line 61
    .line 62
    iget v11, v5, Ll/wmr0;->f:I

    .line 63
    .line 64
    iget-object v6, v5, Ll/wmr0;->d:Ll/knr0;

    .line 65
    .line 66
    iget v6, v6, Ll/knr0;->b:I

    .line 67
    .line 68
    if-eq v11, v6, :cond_2

    .line 69
    .line 70
    :cond_0
    invoke-static {v5}, Ll/wmr0;->j(Ll/wmr0;)Z

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    if-eqz v6, :cond_1

    .line 75
    .line 76
    iget v6, v5, Ll/wmr0;->h:I

    .line 77
    .line 78
    iget-object v11, v5, Ll/wmr0;->b:Ll/jnr0;

    .line 79
    .line 80
    iget v11, v11, Ll/jnr0;->d:I

    .line 81
    .line 82
    if-ne v6, v11, :cond_1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_1
    invoke-virtual {v5}, Ll/wmr0;->d()J

    .line 86
    .line 87
    .line 88
    move-result-wide v18

    .line 89
    cmp-long v6, v18, v14

    .line 90
    .line 91
    if-gez v6, :cond_2

    .line 92
    .line 93
    move-object v3, v5

    .line 94
    move-wide/from16 v14, v18

    .line 95
    .line 96
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 97
    .line 98
    move/from16 v5, p2

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_3
    move/from16 p2, v5

    .line 102
    .line 103
    if-nez v3, :cond_5

    .line 104
    .line 105
    iget-wide v2, v0, Ll/xmr0;->r:J

    .line 106
    .line 107
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 108
    .line 109
    .line 110
    move-result-wide v4

    .line 111
    sub-long/2addr v2, v4

    .line 112
    long-to-int v2, v2

    .line 113
    if-ltz v2, :cond_4

    .line 114
    .line 115
    move-object v3, v1

    .line 116
    check-cast v3, Ll/fer0;

    .line 117
    .line 118
    invoke-virtual {v3, v2, v9}, Ll/fer0;->k(IZ)Z

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ll/xmr0;->g()V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_4
    const-string v0, "Offset to end of mdat was negative."

    .line 126
    .line 127
    invoke-static {v0, v7}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    throw v0

    .line 132
    :cond_5
    invoke-virtual {v3}, Ll/wmr0;->d()J

    .line 133
    .line 134
    .line 135
    move-result-wide v4

    .line 136
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 137
    .line 138
    .line 139
    move-result-wide v13

    .line 140
    sub-long/2addr v4, v13

    .line 141
    long-to-int v2, v4

    .line 142
    if-gez v2, :cond_6

    .line 143
    .line 144
    const-string v2, "Ignoring negative offset to sample data."

    .line 145
    .line 146
    invoke-static {v10, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    move v2, v9

    .line 150
    :cond_6
    move-object v4, v1

    .line 151
    check-cast v4, Ll/fer0;

    .line 152
    .line 153
    invoke-virtual {v4, v2, v9}, Ll/fer0;->k(IZ)Z

    .line 154
    .line 155
    .line 156
    iput-object v3, v0, Ll/xmr0;->w:Ll/wmr0;

    .line 157
    .line 158
    move-object v2, v3

    .line 159
    goto :goto_3

    .line 160
    :cond_7
    move/from16 p2, v5

    .line 161
    .line 162
    :goto_3
    iget v3, v0, Ll/xmr0;->m:I

    .line 163
    .line 164
    const/4 v4, 0x6

    .line 165
    if-ne v3, v12, :cond_f

    .line 166
    .line 167
    invoke-virtual {v2}, Ll/wmr0;->b()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    iput v3, v0, Ll/xmr0;->x:I

    .line 172
    .line 173
    iget v5, v2, Ll/wmr0;->f:I

    .line 174
    .line 175
    iget v6, v2, Ll/wmr0;->i:I

    .line 176
    .line 177
    if-ge v5, v6, :cond_c

    .line 178
    .line 179
    check-cast v1, Ll/fer0;

    .line 180
    .line 181
    invoke-virtual {v1, v3, v9}, Ll/fer0;->k(IZ)Z

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ll/wmr0;->f()Ll/inr0;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    if-nez v1, :cond_8

    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_8
    iget-object v3, v2, Ll/wmr0;->b:Ll/jnr0;

    .line 192
    .line 193
    iget-object v3, v3, Ll/jnr0;->n:Ll/bgw0;

    .line 194
    .line 195
    iget v1, v1, Ll/inr0;->d:I

    .line 196
    .line 197
    if-eqz v1, :cond_9

    .line 198
    .line 199
    invoke-virtual {v3, v1}, Ll/bgw0;->l(I)V

    .line 200
    .line 201
    .line 202
    :cond_9
    iget-object v1, v2, Ll/wmr0;->b:Ll/jnr0;

    .line 203
    .line 204
    iget v5, v2, Ll/wmr0;->f:I

    .line 205
    .line 206
    invoke-virtual {v1, v5}, Ll/jnr0;->b(I)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-eqz v1, :cond_a

    .line 211
    .line 212
    invoke-virtual {v3}, Ll/bgw0;->F()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    mul-int/2addr v1, v4

    .line 217
    invoke-virtual {v3, v1}, Ll/bgw0;->l(I)V

    .line 218
    .line 219
    .line 220
    :cond_a
    :goto_4
    invoke-virtual {v2}, Ll/wmr0;->k()Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_b

    .line 225
    .line 226
    iput-object v7, v0, Ll/xmr0;->w:Ll/wmr0;

    .line 227
    .line 228
    :cond_b
    move v1, v12

    .line 229
    goto/16 :goto_f

    .line 230
    .line 231
    :cond_c
    iget-object v5, v2, Ll/wmr0;->d:Ll/knr0;

    .line 232
    .line 233
    iget-object v5, v5, Ll/knr0;->a:Ll/hnr0;

    .line 234
    .line 235
    iget v5, v5, Ll/hnr0;->g:I

    .line 236
    .line 237
    if-ne v5, v8, :cond_d

    .line 238
    .line 239
    add-int/lit8 v3, v3, -0x8

    .line 240
    .line 241
    iput v3, v0, Ll/xmr0;->x:I

    .line 242
    .line 243
    move-object v3, v1

    .line 244
    check-cast v3, Ll/fer0;

    .line 245
    .line 246
    const/16 v5, 0x8

    .line 247
    .line 248
    invoke-virtual {v3, v5, v9}, Ll/fer0;->k(IZ)Z

    .line 249
    .line 250
    .line 251
    :cond_d
    iget-object v3, v2, Ll/wmr0;->d:Ll/knr0;

    .line 252
    .line 253
    iget-object v3, v3, Ll/knr0;->a:Ll/hnr0;

    .line 254
    .line 255
    iget-object v3, v3, Ll/hnr0;->f:Ll/sqr0;

    .line 256
    .line 257
    const-string v5, "audio/ac4"

    .line 258
    .line 259
    iget-object v3, v3, Ll/sqr0;->l:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    iget v5, v0, Ll/xmr0;->x:I

    .line 266
    .line 267
    if-eqz v3, :cond_e

    .line 268
    .line 269
    const/4 v3, 0x7

    .line 270
    invoke-virtual {v2, v5, v3}, Ll/wmr0;->c(II)I

    .line 271
    .line 272
    .line 273
    move-result v5

    .line 274
    iput v5, v0, Ll/xmr0;->y:I

    .line 275
    .line 276
    iget v5, v0, Ll/xmr0;->x:I

    .line 277
    .line 278
    iget-object v6, v0, Ll/xmr0;->h:Ll/bgw0;

    .line 279
    .line 280
    invoke-static {v5, v6}, Ll/idr0;->b(ILl/bgw0;)V

    .line 281
    .line 282
    .line 283
    iget-object v5, v2, Ll/wmr0;->a:Ll/sgr0;

    .line 284
    .line 285
    iget-object v6, v0, Ll/xmr0;->h:Ll/bgw0;

    .line 286
    .line 287
    invoke-interface {v5, v6, v3}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 288
    .line 289
    .line 290
    iget v5, v0, Ll/xmr0;->y:I

    .line 291
    .line 292
    add-int/2addr v5, v3

    .line 293
    iput v5, v0, Ll/xmr0;->y:I

    .line 294
    .line 295
    goto :goto_5

    .line 296
    :cond_e
    invoke-virtual {v2, v5, v9}, Ll/wmr0;->c(II)I

    .line 297
    .line 298
    .line 299
    move-result v5

    .line 300
    iput v5, v0, Ll/xmr0;->y:I

    .line 301
    .line 302
    :goto_5
    iget v3, v0, Ll/xmr0;->x:I

    .line 303
    .line 304
    add-int/2addr v3, v5

    .line 305
    iput v3, v0, Ll/xmr0;->x:I

    .line 306
    .line 307
    const/4 v3, 0x4

    .line 308
    iput v3, v0, Ll/xmr0;->m:I

    .line 309
    .line 310
    iput v9, v0, Ll/xmr0;->z:I

    .line 311
    .line 312
    :cond_f
    iget-object v3, v2, Ll/wmr0;->d:Ll/knr0;

    .line 313
    .line 314
    iget-object v3, v3, Ll/knr0;->a:Ll/hnr0;

    .line 315
    .line 316
    iget-object v5, v2, Ll/wmr0;->a:Ll/sgr0;

    .line 317
    .line 318
    invoke-virtual {v2}, Ll/wmr0;->e()J

    .line 319
    .line 320
    .line 321
    move-result-wide v10

    .line 322
    iget v6, v3, Ll/hnr0;->j:I

    .line 323
    .line 324
    if-nez v6, :cond_10

    .line 325
    .line 326
    :goto_6
    iget v3, v0, Ll/xmr0;->y:I

    .line 327
    .line 328
    iget v4, v0, Ll/xmr0;->x:I

    .line 329
    .line 330
    if-ge v3, v4, :cond_17

    .line 331
    .line 332
    sub-int/2addr v4, v3

    .line 333
    invoke-interface {v5, v1, v4, v9}, Ll/sgr0;->e(Ll/nyy0;IZ)I

    .line 334
    .line 335
    .line 336
    move-result v3

    .line 337
    iget v4, v0, Ll/xmr0;->y:I

    .line 338
    .line 339
    add-int/2addr v4, v3

    .line 340
    iput v4, v0, Ll/xmr0;->y:I

    .line 341
    .line 342
    goto :goto_6

    .line 343
    :cond_10
    iget-object v13, v0, Ll/xmr0;->e:Ll/bgw0;

    .line 344
    .line 345
    invoke-virtual {v13}, Ll/bgw0;->m()[B

    .line 346
    .line 347
    .line 348
    move-result-object v13

    .line 349
    aput-byte v9, v13, v9

    .line 350
    .line 351
    aput-byte v9, v13, v8

    .line 352
    .line 353
    aput-byte v9, v13, p2

    .line 354
    .line 355
    add-int/lit8 v14, v6, 0x1

    .line 356
    .line 357
    const/16 v16, 0x4

    .line 358
    .line 359
    rsub-int/lit8 v6, v6, 0x4

    .line 360
    .line 361
    :goto_7
    iget v15, v0, Ll/xmr0;->y:I

    .line 362
    .line 363
    iget v12, v0, Ll/xmr0;->x:I

    .line 364
    .line 365
    if-ge v15, v12, :cond_17

    .line 366
    .line 367
    iget v12, v0, Ll/xmr0;->z:I

    .line 368
    .line 369
    const-string v15, "video/hevc"

    .line 370
    .line 371
    if-nez v12, :cond_15

    .line 372
    .line 373
    move-object v12, v1

    .line 374
    check-cast v12, Ll/fer0;

    .line 375
    .line 376
    invoke-virtual {v12, v13, v6, v14, v9}, Ll/fer0;->b([BIIZ)Z

    .line 377
    .line 378
    .line 379
    iget-object v12, v0, Ll/xmr0;->e:Ll/bgw0;

    .line 380
    .line 381
    invoke-virtual {v12, v9}, Ll/bgw0;->k(I)V

    .line 382
    .line 383
    .line 384
    iget-object v12, v0, Ll/xmr0;->e:Ll/bgw0;

    .line 385
    .line 386
    invoke-virtual {v12}, Ll/bgw0;->v()I

    .line 387
    .line 388
    .line 389
    move-result v12

    .line 390
    if-lez v12, :cond_14

    .line 391
    .line 392
    add-int/lit8 v12, v12, -0x1

    .line 393
    .line 394
    iput v12, v0, Ll/xmr0;->z:I

    .line 395
    .line 396
    iget-object v12, v0, Ll/xmr0;->d:Ll/bgw0;

    .line 397
    .line 398
    invoke-virtual {v12, v9}, Ll/bgw0;->k(I)V

    .line 399
    .line 400
    .line 401
    iget-object v12, v0, Ll/xmr0;->d:Ll/bgw0;

    .line 402
    .line 403
    const/4 v9, 0x4

    .line 404
    invoke-interface {v5, v12, v9}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 405
    .line 406
    .line 407
    iget-object v12, v0, Ll/xmr0;->e:Ll/bgw0;

    .line 408
    .line 409
    invoke-interface {v5, v12, v8}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 410
    .line 411
    .line 412
    iget-object v12, v0, Ll/xmr0;->D:[Ll/sgr0;

    .line 413
    .line 414
    array-length v12, v12

    .line 415
    if-lez v12, :cond_13

    .line 416
    .line 417
    iget-object v12, v3, Ll/hnr0;->f:Ll/sqr0;

    .line 418
    .line 419
    iget-object v12, v12, Ll/sqr0;->l:Ljava/lang/String;

    .line 420
    .line 421
    aget-byte v17, v13, v9

    .line 422
    .line 423
    sget-object v9, Ll/w3x0;->a:[B

    .line 424
    .line 425
    const-string v9, "video/avc"

    .line 426
    .line 427
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    move-result v9

    .line 431
    if-eqz v9, :cond_12

    .line 432
    .line 433
    and-int/lit8 v9, v17, 0x1f

    .line 434
    .line 435
    if-eq v9, v4, :cond_11

    .line 436
    .line 437
    goto :goto_9

    .line 438
    :cond_11
    :goto_8
    move v9, v8

    .line 439
    goto :goto_a

    .line 440
    :cond_12
    :goto_9
    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 441
    .line 442
    .line 443
    move-result v9

    .line 444
    if-eqz v9, :cond_13

    .line 445
    .line 446
    and-int/lit8 v9, v17, 0x7e

    .line 447
    .line 448
    shr-int/2addr v9, v8

    .line 449
    const/16 v12, 0x27

    .line 450
    .line 451
    if-ne v9, v12, :cond_13

    .line 452
    .line 453
    goto :goto_8

    .line 454
    :cond_13
    const/4 v9, 0x0

    .line 455
    :goto_a
    iput-boolean v9, v0, Ll/xmr0;->A:Z

    .line 456
    .line 457
    iget v9, v0, Ll/xmr0;->y:I

    .line 458
    .line 459
    add-int/lit8 v9, v9, 0x5

    .line 460
    .line 461
    iput v9, v0, Ll/xmr0;->y:I

    .line 462
    .line 463
    iget v9, v0, Ll/xmr0;->x:I

    .line 464
    .line 465
    add-int/2addr v9, v6

    .line 466
    iput v9, v0, Ll/xmr0;->x:I

    .line 467
    .line 468
    :goto_b
    const/4 v9, 0x0

    .line 469
    const/4 v12, 0x3

    .line 470
    goto :goto_7

    .line 471
    :cond_14
    const-string v0, "Invalid NAL length"

    .line 472
    .line 473
    invoke-static {v0, v7}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 474
    .line 475
    .line 476
    move-result-object v0

    .line 477
    throw v0

    .line 478
    :cond_15
    iget-boolean v9, v0, Ll/xmr0;->A:Z

    .line 479
    .line 480
    if-eqz v9, :cond_16

    .line 481
    .line 482
    iget-object v9, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 483
    .line 484
    invoke-virtual {v9, v12}, Ll/bgw0;->h(I)V

    .line 485
    .line 486
    .line 487
    iget-object v9, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 488
    .line 489
    invoke-virtual {v9}, Ll/bgw0;->m()[B

    .line 490
    .line 491
    .line 492
    move-result-object v9

    .line 493
    iget v12, v0, Ll/xmr0;->z:I

    .line 494
    .line 495
    move-object v4, v1

    .line 496
    check-cast v4, Ll/fer0;

    .line 497
    .line 498
    const/4 v8, 0x0

    .line 499
    invoke-virtual {v4, v9, v8, v12, v8}, Ll/fer0;->b([BIIZ)Z

    .line 500
    .line 501
    .line 502
    iget-object v4, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 503
    .line 504
    iget v8, v0, Ll/xmr0;->z:I

    .line 505
    .line 506
    invoke-interface {v5, v4, v8}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 507
    .line 508
    .line 509
    iget v4, v0, Ll/xmr0;->z:I

    .line 510
    .line 511
    iget-object v8, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 512
    .line 513
    invoke-virtual {v8}, Ll/bgw0;->m()[B

    .line 514
    .line 515
    .line 516
    move-result-object v9

    .line 517
    invoke-virtual {v8}, Ll/bgw0;->t()I

    .line 518
    .line 519
    .line 520
    move-result v8

    .line 521
    invoke-static {v9, v8}, Ll/w3x0;->b([BI)I

    .line 522
    .line 523
    .line 524
    move-result v8

    .line 525
    iget-object v9, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 526
    .line 527
    iget-object v12, v3, Ll/hnr0;->f:Ll/sqr0;

    .line 528
    .line 529
    iget-object v12, v12, Ll/sqr0;->l:Ljava/lang/String;

    .line 530
    .line 531
    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result v12

    .line 535
    invoke-virtual {v9, v12}, Ll/bgw0;->k(I)V

    .line 536
    .line 537
    .line 538
    iget-object v9, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 539
    .line 540
    invoke-virtual {v9, v8}, Ll/bgw0;->j(I)V

    .line 541
    .line 542
    .line 543
    iget-object v8, v0, Ll/xmr0;->f:Ll/bgw0;

    .line 544
    .line 545
    iget-object v9, v0, Ll/xmr0;->D:[Ll/sgr0;

    .line 546
    .line 547
    invoke-static {v10, v11, v8, v9}, Ll/cer0;->a(JLl/bgw0;[Ll/sgr0;)V

    .line 548
    .line 549
    .line 550
    goto :goto_c

    .line 551
    :cond_16
    const/4 v8, 0x0

    .line 552
    invoke-interface {v5, v1, v12, v8}, Ll/sgr0;->e(Ll/nyy0;IZ)I

    .line 553
    .line 554
    .line 555
    move-result v4

    .line 556
    :goto_c
    iget v8, v0, Ll/xmr0;->y:I

    .line 557
    .line 558
    add-int/2addr v8, v4

    .line 559
    iput v8, v0, Ll/xmr0;->y:I

    .line 560
    .line 561
    iget v8, v0, Ll/xmr0;->z:I

    .line 562
    .line 563
    sub-int/2addr v8, v4

    .line 564
    iput v8, v0, Ll/xmr0;->z:I

    .line 565
    .line 566
    const/4 v4, 0x6

    .line 567
    const/4 v8, 0x1

    .line 568
    goto :goto_b

    .line 569
    :cond_17
    invoke-virtual {v2}, Ll/wmr0;->a()I

    .line 570
    .line 571
    .line 572
    move-result v20

    .line 573
    invoke-virtual {v2}, Ll/wmr0;->f()Ll/inr0;

    .line 574
    .line 575
    .line 576
    move-result-object v1

    .line 577
    if-eqz v1, :cond_18

    .line 578
    .line 579
    iget-object v1, v1, Ll/inr0;->c:Ll/ggr0;

    .line 580
    .line 581
    move-object/from16 v23, v1

    .line 582
    .line 583
    goto :goto_d

    .line 584
    :cond_18
    move-object/from16 v23, v7

    .line 585
    .line 586
    :goto_d
    iget v1, v0, Ll/xmr0;->x:I

    .line 587
    .line 588
    const/16 v22, 0x0

    .line 589
    .line 590
    move/from16 v21, v1

    .line 591
    .line 592
    move-object/from16 v17, v5

    .line 593
    .line 594
    move-wide/from16 v18, v10

    .line 595
    .line 596
    invoke-interface/range {v17 .. v23}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 597
    .line 598
    .line 599
    :cond_19
    iget-object v1, v0, Ll/xmr0;->l:Ljava/util/ArrayDeque;

    .line 600
    .line 601
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 602
    .line 603
    .line 604
    move-result v1

    .line 605
    if-nez v1, :cond_1b

    .line 606
    .line 607
    iget-object v1, v0, Ll/xmr0;->l:Ljava/util/ArrayDeque;

    .line 608
    .line 609
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    .line 610
    .line 611
    .line 612
    move-result-object v1

    .line 613
    check-cast v1, Ll/vmr0;

    .line 614
    .line 615
    iget v3, v0, Ll/xmr0;->s:I

    .line 616
    .line 617
    iget v4, v1, Ll/vmr0;->c:I

    .line 618
    .line 619
    sub-int/2addr v3, v4

    .line 620
    iput v3, v0, Ll/xmr0;->s:I

    .line 621
    .line 622
    iget-wide v3, v1, Ll/vmr0;->a:J

    .line 623
    .line 624
    iget-boolean v5, v1, Ll/vmr0;->b:Z

    .line 625
    .line 626
    if-eqz v5, :cond_1a

    .line 627
    .line 628
    add-long v3, v3, v18

    .line 629
    .line 630
    :cond_1a
    move-wide v9, v3

    .line 631
    iget-object v3, v0, Ll/xmr0;->C:[Ll/sgr0;

    .line 632
    .line 633
    array-length v4, v3

    .line 634
    const/4 v5, 0x0

    .line 635
    :goto_e
    if-ge v5, v4, :cond_19

    .line 636
    .line 637
    aget-object v8, v3, v5

    .line 638
    .line 639
    iget v12, v1, Ll/vmr0;->c:I

    .line 640
    .line 641
    iget v13, v0, Ll/xmr0;->s:I

    .line 642
    .line 643
    const/4 v14, 0x0

    .line 644
    const/4 v11, 0x1

    .line 645
    invoke-interface/range {v8 .. v14}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 646
    .line 647
    .line 648
    add-int/lit8 v5, v5, 0x1

    .line 649
    .line 650
    goto :goto_e

    .line 651
    :cond_1b
    invoke-virtual {v2}, Ll/wmr0;->k()Z

    .line 652
    .line 653
    .line 654
    move-result v1

    .line 655
    if-nez v1, :cond_1c

    .line 656
    .line 657
    iput-object v7, v0, Ll/xmr0;->w:Ll/wmr0;

    .line 658
    .line 659
    :cond_1c
    const/4 v1, 0x3

    .line 660
    :goto_f
    iput v1, v0, Ll/xmr0;->m:I

    .line 661
    .line 662
    const/16 v24, 0x0

    .line 663
    .line 664
    return v24

    .line 665
    :cond_1d
    iget-object v2, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 666
    .line 667
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 668
    .line 669
    .line 670
    move-result v2

    .line 671
    move-object v6, v7

    .line 672
    const/4 v5, 0x0

    .line 673
    :goto_10
    if-ge v5, v2, :cond_1f

    .line 674
    .line 675
    iget-object v8, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 676
    .line 677
    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 678
    .line 679
    .line 680
    move-result-object v8

    .line 681
    check-cast v8, Ll/wmr0;

    .line 682
    .line 683
    iget-object v8, v8, Ll/wmr0;->b:Ll/jnr0;

    .line 684
    .line 685
    iget-boolean v9, v8, Ll/jnr0;->o:Z

    .line 686
    .line 687
    if-eqz v9, :cond_1e

    .line 688
    .line 689
    iget-wide v8, v8, Ll/jnr0;->c:J

    .line 690
    .line 691
    cmp-long v10, v8, v3

    .line 692
    .line 693
    if-gez v10, :cond_1e

    .line 694
    .line 695
    iget-object v3, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 696
    .line 697
    invoke-virtual {v3, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v3

    .line 701
    move-object v6, v3

    .line 702
    check-cast v6, Ll/wmr0;

    .line 703
    .line 704
    move-wide v3, v8

    .line 705
    :cond_1e
    add-int/lit8 v5, v5, 0x1

    .line 706
    .line 707
    goto :goto_10

    .line 708
    :cond_1f
    if-nez v6, :cond_20

    .line 709
    .line 710
    const/4 v2, 0x3

    .line 711
    iput v2, v0, Ll/xmr0;->m:I

    .line 712
    .line 713
    goto/16 :goto_0

    .line 714
    .line 715
    :cond_20
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 716
    .line 717
    .line 718
    move-result-wide v8

    .line 719
    sub-long/2addr v3, v8

    .line 720
    long-to-int v2, v3

    .line 721
    if-ltz v2, :cond_21

    .line 722
    .line 723
    move-object v3, v1

    .line 724
    check-cast v3, Ll/fer0;

    .line 725
    .line 726
    const/4 v8, 0x0

    .line 727
    invoke-virtual {v3, v2, v8}, Ll/fer0;->k(IZ)Z

    .line 728
    .line 729
    .line 730
    iget-object v2, v6, Ll/wmr0;->b:Ll/jnr0;

    .line 731
    .line 732
    iget-object v4, v2, Ll/jnr0;->n:Ll/bgw0;

    .line 733
    .line 734
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 735
    .line 736
    .line 737
    move-result-object v5

    .line 738
    invoke-virtual {v4}, Ll/bgw0;->t()I

    .line 739
    .line 740
    .line 741
    move-result v4

    .line 742
    invoke-virtual {v3, v5, v8, v4, v8}, Ll/fer0;->b([BIIZ)Z

    .line 743
    .line 744
    .line 745
    iget-object v3, v2, Ll/jnr0;->n:Ll/bgw0;

    .line 746
    .line 747
    invoke-virtual {v3, v8}, Ll/bgw0;->k(I)V

    .line 748
    .line 749
    .line 750
    iput-boolean v8, v2, Ll/jnr0;->o:Z

    .line 751
    .line 752
    goto/16 :goto_0

    .line 753
    .line 754
    :cond_21
    const-string v0, "Offset to encryption data was negative."

    .line 755
    .line 756
    invoke-static {v0, v7}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 757
    .line 758
    .line 759
    move-result-object v0

    .line 760
    throw v0

    .line 761
    :cond_22
    move/from16 p2, v5

    .line 762
    .line 763
    iget-wide v5, v0, Ll/xmr0;->o:J

    .line 764
    .line 765
    long-to-int v2, v5

    .line 766
    iget v5, v0, Ll/xmr0;->p:I

    .line 767
    .line 768
    sub-int/2addr v2, v5

    .line 769
    iget-object v5, v0, Ll/xmr0;->q:Ll/bgw0;

    .line 770
    .line 771
    if-eqz v5, :cond_2e

    .line 772
    .line 773
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 774
    .line 775
    .line 776
    move-result-object v6

    .line 777
    move-object v8, v1

    .line 778
    check-cast v8, Ll/fer0;

    .line 779
    .line 780
    const/16 v9, 0x8

    .line 781
    .line 782
    const/4 v11, 0x0

    .line 783
    invoke-virtual {v8, v6, v9, v2, v11}, Ll/fer0;->b([BIIZ)Z

    .line 784
    .line 785
    .line 786
    new-instance v2, Ll/ylr0;

    .line 787
    .line 788
    iget v6, v0, Ll/xmr0;->n:I

    .line 789
    .line 790
    invoke-direct {v2, v6, v5}, Ll/ylr0;-><init>(ILl/bgw0;)V

    .line 791
    .line 792
    .line 793
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 794
    .line 795
    .line 796
    move-result-wide v5

    .line 797
    iget-object v8, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 798
    .line 799
    invoke-virtual {v8}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 800
    .line 801
    .line 802
    move-result v8

    .line 803
    if-nez v8, :cond_23

    .line 804
    .line 805
    iget-object v3, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 806
    .line 807
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 808
    .line 809
    .line 810
    move-result-object v3

    .line 811
    check-cast v3, Ll/xlr0;

    .line 812
    .line 813
    invoke-virtual {v3, v2}, Ll/xlr0;->f(Ll/ylr0;)V

    .line 814
    .line 815
    .line 816
    goto/16 :goto_18

    .line 817
    .line 818
    :cond_23
    iget v8, v2, Ll/zlr0;->a:I

    .line 819
    .line 820
    if-ne v8, v4, :cond_27

    .line 821
    .line 822
    iget-object v2, v2, Ll/ylr0;->b:Ll/bgw0;

    .line 823
    .line 824
    const/16 v9, 0x8

    .line 825
    .line 826
    invoke-virtual {v2, v9}, Ll/bgw0;->k(I)V

    .line 827
    .line 828
    .line 829
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 830
    .line 831
    .line 832
    move-result v3

    .line 833
    invoke-static {v3}, Ll/zlr0;->a(I)I

    .line 834
    .line 835
    .line 836
    move-result v3

    .line 837
    const/4 v9, 0x4

    .line 838
    invoke-virtual {v2, v9}, Ll/bgw0;->l(I)V

    .line 839
    .line 840
    .line 841
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 842
    .line 843
    .line 844
    move-result-wide v29

    .line 845
    if-nez v3, :cond_24

    .line 846
    .line 847
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 848
    .line 849
    .line 850
    move-result-wide v3

    .line 851
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 852
    .line 853
    .line 854
    move-result-wide v8

    .line 855
    :goto_11
    add-long/2addr v5, v8

    .line 856
    move-wide/from16 v25, v3

    .line 857
    .line 858
    goto :goto_12

    .line 859
    :cond_24
    invoke-virtual {v2}, Ll/bgw0;->K()J

    .line 860
    .line 861
    .line 862
    move-result-wide v3

    .line 863
    invoke-virtual {v2}, Ll/bgw0;->K()J

    .line 864
    .line 865
    .line 866
    move-result-wide v8

    .line 867
    goto :goto_11

    .line 868
    :goto_12
    const-wide/32 v27, 0xf4240

    .line 869
    .line 870
    .line 871
    sget-object v31, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 872
    .line 873
    invoke-static/range {v25 .. v31}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 874
    .line 875
    .line 876
    move-result-wide v3

    .line 877
    move/from16 v8, p2

    .line 878
    .line 879
    invoke-virtual {v2, v8}, Ll/bgw0;->l(I)V

    .line 880
    .line 881
    .line 882
    invoke-virtual {v2}, Ll/bgw0;->F()I

    .line 883
    .line 884
    .line 885
    move-result v8

    .line 886
    new-array v9, v8, [I

    .line 887
    .line 888
    new-array v10, v8, [J

    .line 889
    .line 890
    new-array v11, v8, [J

    .line 891
    .line 892
    new-array v12, v8, [J

    .line 893
    .line 894
    move-wide v14, v3

    .line 895
    const/4 v13, 0x0

    .line 896
    :goto_13
    if-ge v13, v8, :cond_26

    .line 897
    .line 898
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 899
    .line 900
    .line 901
    move-result v17

    .line 902
    const/high16 v19, -0x80000000

    .line 903
    .line 904
    and-int v19, v17, v19

    .line 905
    .line 906
    if-nez v19, :cond_25

    .line 907
    .line 908
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 909
    .line 910
    .line 911
    move-result-wide v19

    .line 912
    const v21, 0x7fffffff

    .line 913
    .line 914
    .line 915
    and-int v17, v17, v21

    .line 916
    .line 917
    aput v17, v9, v13

    .line 918
    .line 919
    aput-wide v5, v10, v13

    .line 920
    .line 921
    aput-wide v14, v12, v13

    .line 922
    .line 923
    add-long v25, v25, v19

    .line 924
    .line 925
    const-wide/32 v27, 0xf4240

    .line 926
    .line 927
    .line 928
    sget-object v31, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 929
    .line 930
    invoke-static/range {v25 .. v31}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 931
    .line 932
    .line 933
    move-result-wide v14

    .line 934
    aget-wide v19, v12, v13

    .line 935
    .line 936
    sub-long v19, v14, v19

    .line 937
    .line 938
    aput-wide v19, v11, v13

    .line 939
    .line 940
    const/4 v7, 0x4

    .line 941
    invoke-virtual {v2, v7}, Ll/bgw0;->l(I)V

    .line 942
    .line 943
    .line 944
    aget v7, v9, v13

    .line 945
    .line 946
    move-object/from16 v17, v2

    .line 947
    .line 948
    move-wide/from16 v20, v3

    .line 949
    .line 950
    int-to-long v2, v7

    .line 951
    add-long/2addr v5, v2

    .line 952
    add-int/lit8 v13, v13, 0x1

    .line 953
    .line 954
    move-object/from16 v2, v17

    .line 955
    .line 956
    move-wide/from16 v3, v20

    .line 957
    .line 958
    const/4 v7, 0x0

    .line 959
    goto :goto_13

    .line 960
    :cond_25
    const-string v0, "Unhandled indirect reference"

    .line 961
    .line 962
    const/4 v1, 0x0

    .line 963
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 964
    .line 965
    .line 966
    move-result-object v0

    .line 967
    throw v0

    .line 968
    :cond_26
    move-wide/from16 v20, v3

    .line 969
    .line 970
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 971
    .line 972
    .line 973
    move-result-object v2

    .line 974
    new-instance v3, Ll/der0;

    .line 975
    .line 976
    invoke-direct {v3, v9, v10, v11, v12}, Ll/der0;-><init>([I[J[J[J)V

    .line 977
    .line 978
    .line 979
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 980
    .line 981
    .line 982
    move-result-object v2

    .line 983
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 984
    .line 985
    check-cast v3, Ljava/lang/Long;

    .line 986
    .line 987
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 988
    .line 989
    .line 990
    move-result-wide v3

    .line 991
    iput-wide v3, v0, Ll/xmr0;->v:J

    .line 992
    .line 993
    iget-object v3, v0, Ll/xmr0;->B:Ll/ser0;

    .line 994
    .line 995
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 996
    .line 997
    check-cast v2, Ll/bgr0;

    .line 998
    .line 999
    invoke-interface {v3, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 1000
    .line 1001
    .line 1002
    const/4 v2, 0x1

    .line 1003
    iput-boolean v2, v0, Ll/xmr0;->E:Z

    .line 1004
    .line 1005
    goto/16 :goto_18

    .line 1006
    .line 1007
    :cond_27
    if-ne v8, v3, :cond_2f

    .line 1008
    .line 1009
    iget-object v2, v2, Ll/ylr0;->b:Ll/bgw0;

    .line 1010
    .line 1011
    iget-object v3, v0, Ll/xmr0;->C:[Ll/sgr0;

    .line 1012
    .line 1013
    array-length v3, v3

    .line 1014
    if-eqz v3, :cond_2f

    .line 1015
    .line 1016
    const/16 v9, 0x8

    .line 1017
    .line 1018
    invoke-virtual {v2, v9}, Ll/bgw0;->k(I)V

    .line 1019
    .line 1020
    .line 1021
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 1022
    .line 1023
    .line 1024
    move-result v3

    .line 1025
    invoke-static {v3}, Ll/zlr0;->a(I)I

    .line 1026
    .line 1027
    .line 1028
    move-result v3

    .line 1029
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 1030
    .line 1031
    .line 1032
    .line 1033
    .line 1034
    if-eqz v3, :cond_29

    .line 1035
    .line 1036
    const/4 v6, 0x1

    .line 1037
    if-eq v3, v6, :cond_28

    .line 1038
    .line 1039
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1040
    .line 1041
    const-string v4, "Skipping unsupported emsg version: "

    .line 1042
    .line 1043
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1044
    .line 1045
    .line 1046
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1047
    .line 1048
    .line 1049
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1050
    .line 1051
    .line 1052
    move-result-object v2

    .line 1053
    invoke-static {v10, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    .line 1055
    .line 1056
    goto/16 :goto_18

    .line 1057
    .line 1058
    :cond_28
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1059
    .line 1060
    .line 1061
    move-result-wide v15

    .line 1062
    invoke-virtual {v2}, Ll/bgw0;->K()J

    .line 1063
    .line 1064
    .line 1065
    move-result-wide v11

    .line 1066
    sget-object v17, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1067
    .line 1068
    const-wide/32 v13, 0xf4240

    .line 1069
    .line 1070
    .line 1071
    invoke-static/range {v11 .. v17}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1072
    .line 1073
    .line 1074
    move-result-wide v6

    .line 1075
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1076
    .line 1077
    .line 1078
    move-result-wide v11

    .line 1079
    const-wide/16 v13, 0x3e8

    .line 1080
    .line 1081
    invoke-static/range {v11 .. v17}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1082
    .line 1083
    .line 1084
    move-result-wide v8

    .line 1085
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1086
    .line 1087
    .line 1088
    move-result-wide v10

    .line 1089
    const/4 v3, 0x0

    .line 1090
    invoke-virtual {v2, v3}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v12

    .line 1094
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1095
    .line 1096
    .line 1097
    invoke-virtual {v2, v3}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v13

    .line 1101
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1102
    .line 1103
    .line 1104
    move-wide v15, v10

    .line 1105
    move-object v11, v12

    .line 1106
    move-object v12, v13

    .line 1107
    move-wide v13, v8

    .line 1108
    move-wide v8, v4

    .line 1109
    goto :goto_15

    .line 1110
    :cond_29
    const/4 v3, 0x0

    .line 1111
    invoke-virtual {v2, v3}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 1112
    .line 1113
    .line 1114
    move-result-object v12

    .line 1115
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1116
    .line 1117
    .line 1118
    invoke-virtual {v2, v3}, Ll/bgw0;->M(C)Ljava/lang/String;

    .line 1119
    .line 1120
    .line 1121
    move-result-object v13

    .line 1122
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1123
    .line 1124
    .line 1125
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1126
    .line 1127
    .line 1128
    move-result-wide v29

    .line 1129
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1130
    .line 1131
    .line 1132
    move-result-wide v25

    .line 1133
    sget-object v31, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 1134
    .line 1135
    const-wide/32 v27, 0xf4240

    .line 1136
    .line 1137
    .line 1138
    invoke-static/range {v25 .. v31}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1139
    .line 1140
    .line 1141
    move-result-wide v6

    .line 1142
    iget-wide v8, v0, Ll/xmr0;->v:J

    .line 1143
    .line 1144
    cmp-long v3, v8, v4

    .line 1145
    .line 1146
    if-eqz v3, :cond_2a

    .line 1147
    .line 1148
    add-long/2addr v8, v6

    .line 1149
    goto :goto_14

    .line 1150
    :cond_2a
    move-wide v8, v4

    .line 1151
    :goto_14
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1152
    .line 1153
    .line 1154
    move-result-wide v25

    .line 1155
    const-wide/16 v27, 0x3e8

    .line 1156
    .line 1157
    invoke-static/range {v25 .. v31}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 1158
    .line 1159
    .line 1160
    move-result-wide v10

    .line 1161
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1162
    .line 1163
    .line 1164
    move-result-wide v14

    .line 1165
    move-wide/from16 v32, v8

    .line 1166
    .line 1167
    move-wide v8, v6

    .line 1168
    move-wide/from16 v6, v32

    .line 1169
    .line 1170
    move-wide v15, v14

    .line 1171
    move-wide/from16 v32, v10

    .line 1172
    .line 1173
    move-object v11, v12

    .line 1174
    move-object v12, v13

    .line 1175
    move-wide/from16 v13, v32

    .line 1176
    .line 1177
    :goto_15
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 1178
    .line 1179
    .line 1180
    move-result v3

    .line 1181
    new-array v3, v3, [B

    .line 1182
    .line 1183
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 1184
    .line 1185
    .line 1186
    move-result v10

    .line 1187
    move-wide/from16 v19, v4

    .line 1188
    .line 1189
    const/4 v4, 0x0

    .line 1190
    invoke-virtual {v2, v3, v4, v10}, Ll/bgw0;->g([BII)V

    .line 1191
    .line 1192
    .line 1193
    new-instance v10, Lcom/google/android/gms/internal/ads/zzaft;

    .line 1194
    .line 1195
    move-object/from16 v17, v3

    .line 1196
    .line 1197
    invoke-direct/range {v10 .. v17}, Lcom/google/android/gms/internal/ads/zzaft;-><init>(Ljava/lang/String;Ljava/lang/String;JJ[B)V

    .line 1198
    .line 1199
    .line 1200
    iget-object v2, v0, Ll/xmr0;->i:Ll/wir0;

    .line 1201
    .line 1202
    new-instance v3, Ll/bgw0;

    .line 1203
    .line 1204
    invoke-virtual {v2, v10}, Ll/wir0;->a(Lcom/google/android/gms/internal/ads/zzaft;)[B

    .line 1205
    .line 1206
    .line 1207
    move-result-object v2

    .line 1208
    invoke-direct {v3, v2}, Ll/bgw0;-><init>([B)V

    .line 1209
    .line 1210
    .line 1211
    invoke-virtual {v3}, Ll/bgw0;->q()I

    .line 1212
    .line 1213
    .line 1214
    move-result v2

    .line 1215
    iget-object v4, v0, Ll/xmr0;->C:[Ll/sgr0;

    .line 1216
    .line 1217
    array-length v5, v4

    .line 1218
    const/4 v10, 0x0

    .line 1219
    :goto_16
    if-ge v10, v5, :cond_2b

    .line 1220
    .line 1221
    aget-object v11, v4, v10

    .line 1222
    .line 1223
    const/4 v12, 0x0

    .line 1224
    invoke-virtual {v3, v12}, Ll/bgw0;->k(I)V

    .line 1225
    .line 1226
    .line 1227
    invoke-interface {v11, v3, v2}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 1228
    .line 1229
    .line 1230
    add-int/lit8 v10, v10, 0x1

    .line 1231
    .line 1232
    goto :goto_16

    .line 1233
    :cond_2b
    cmp-long v3, v6, v19

    .line 1234
    .line 1235
    iget-object v4, v0, Ll/xmr0;->l:Ljava/util/ArrayDeque;

    .line 1236
    .line 1237
    if-nez v3, :cond_2c

    .line 1238
    .line 1239
    new-instance v3, Ll/vmr0;

    .line 1240
    .line 1241
    const/4 v6, 0x1

    .line 1242
    invoke-direct {v3, v8, v9, v6, v2}, Ll/vmr0;-><init>(JZI)V

    .line 1243
    .line 1244
    .line 1245
    invoke-virtual {v4, v3}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 1246
    .line 1247
    .line 1248
    iget v3, v0, Ll/xmr0;->s:I

    .line 1249
    .line 1250
    add-int/2addr v3, v2

    .line 1251
    iput v3, v0, Ll/xmr0;->s:I

    .line 1252
    .line 1253
    goto :goto_18

    .line 1254
    :cond_2c
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 1255
    .line 1256
    .line 1257
    move-result v3

    .line 1258
    if-nez v3, :cond_2d

    .line 1259
    .line 1260
    iget-object v3, v0, Ll/xmr0;->l:Ljava/util/ArrayDeque;

    .line 1261
    .line 1262
    new-instance v4, Ll/vmr0;

    .line 1263
    .line 1264
    const/4 v8, 0x0

    .line 1265
    invoke-direct {v4, v6, v7, v8, v2}, Ll/vmr0;-><init>(JZI)V

    .line 1266
    .line 1267
    .line 1268
    invoke-virtual {v3, v4}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 1269
    .line 1270
    .line 1271
    iget v3, v0, Ll/xmr0;->s:I

    .line 1272
    .line 1273
    add-int/2addr v3, v2

    .line 1274
    iput v3, v0, Ll/xmr0;->s:I

    .line 1275
    .line 1276
    goto :goto_18

    .line 1277
    :cond_2d
    iget-object v3, v0, Ll/xmr0;->C:[Ll/sgr0;

    .line 1278
    .line 1279
    array-length v4, v3

    .line 1280
    const/4 v9, 0x0

    .line 1281
    :goto_17
    if-ge v9, v4, :cond_2f

    .line 1282
    .line 1283
    aget-object v25, v3, v9

    .line 1284
    .line 1285
    const/16 v30, 0x0

    .line 1286
    .line 1287
    const/16 v31, 0x0

    .line 1288
    .line 1289
    const/16 v28, 0x1

    .line 1290
    .line 1291
    move/from16 v29, v2

    .line 1292
    .line 1293
    move-wide/from16 v26, v6

    .line 1294
    .line 1295
    invoke-interface/range {v25 .. v31}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 1296
    .line 1297
    .line 1298
    add-int/lit8 v9, v9, 0x1

    .line 1299
    .line 1300
    goto :goto_17

    .line 1301
    :cond_2e
    move-object v3, v1

    .line 1302
    check-cast v3, Ll/fer0;

    .line 1303
    .line 1304
    const/4 v8, 0x0

    .line 1305
    invoke-virtual {v3, v2, v8}, Ll/fer0;->k(IZ)Z

    .line 1306
    .line 1307
    .line 1308
    :cond_2f
    :goto_18
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 1309
    .line 1310
    .line 1311
    move-result-wide v2

    .line 1312
    invoke-virtual {v0, v2, v3}, Ll/xmr0;->i(J)V

    .line 1313
    .line 1314
    .line 1315
    goto/16 :goto_0

    .line 1316
    .line 1317
    :cond_30
    move v8, v9

    .line 1318
    iget v2, v0, Ll/xmr0;->p:I

    .line 1319
    .line 1320
    if-nez v2, :cond_32

    .line 1321
    .line 1322
    iget-object v2, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1323
    .line 1324
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 1325
    .line 1326
    .line 1327
    move-result-object v2

    .line 1328
    const/4 v6, 0x1

    .line 1329
    const/16 v9, 0x8

    .line 1330
    .line 1331
    invoke-interface {v1, v2, v8, v9, v6}, Ll/qer0;->b([BIIZ)Z

    .line 1332
    .line 1333
    .line 1334
    move-result v2

    .line 1335
    if-nez v2, :cond_31

    .line 1336
    .line 1337
    const/4 v0, -0x1

    .line 1338
    return v0

    .line 1339
    :cond_31
    iput v9, v0, Ll/xmr0;->p:I

    .line 1340
    .line 1341
    iget-object v2, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1342
    .line 1343
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 1344
    .line 1345
    .line 1346
    iget-object v2, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1347
    .line 1348
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 1349
    .line 1350
    .line 1351
    move-result-wide v5

    .line 1352
    iput-wide v5, v0, Ll/xmr0;->o:J

    .line 1353
    .line 1354
    iget-object v2, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1355
    .line 1356
    invoke-virtual {v2}, Ll/bgw0;->v()I

    .line 1357
    .line 1358
    .line 1359
    move-result v2

    .line 1360
    iput v2, v0, Ll/xmr0;->n:I

    .line 1361
    .line 1362
    :cond_32
    iget-wide v5, v0, Ll/xmr0;->o:J

    .line 1363
    .line 1364
    const-wide/16 v7, 0x1

    .line 1365
    .line 1366
    cmp-long v2, v5, v7

    .line 1367
    .line 1368
    if-nez v2, :cond_33

    .line 1369
    .line 1370
    iget-object v2, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1371
    .line 1372
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 1373
    .line 1374
    .line 1375
    move-result-object v2

    .line 1376
    move-object v5, v1

    .line 1377
    check-cast v5, Ll/fer0;

    .line 1378
    .line 1379
    const/4 v8, 0x0

    .line 1380
    const/16 v9, 0x8

    .line 1381
    .line 1382
    invoke-virtual {v5, v2, v9, v9, v8}, Ll/fer0;->b([BIIZ)Z

    .line 1383
    .line 1384
    .line 1385
    iget v2, v0, Ll/xmr0;->p:I

    .line 1386
    .line 1387
    add-int/2addr v2, v9

    .line 1388
    iput v2, v0, Ll/xmr0;->p:I

    .line 1389
    .line 1390
    iget-object v2, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1391
    .line 1392
    invoke-virtual {v2}, Ll/bgw0;->K()J

    .line 1393
    .line 1394
    .line 1395
    move-result-wide v5

    .line 1396
    iput-wide v5, v0, Ll/xmr0;->o:J

    .line 1397
    .line 1398
    goto :goto_1a

    .line 1399
    :cond_33
    const-wide/16 v7, 0x0

    .line 1400
    .line 1401
    cmp-long v2, v5, v7

    .line 1402
    .line 1403
    if-nez v2, :cond_36

    .line 1404
    .line 1405
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 1406
    .line 1407
    .line 1408
    move-result-wide v5

    .line 1409
    const-wide/16 v7, -0x1

    .line 1410
    .line 1411
    cmp-long v2, v5, v7

    .line 1412
    .line 1413
    if-nez v2, :cond_35

    .line 1414
    .line 1415
    iget-object v2, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 1416
    .line 1417
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 1418
    .line 1419
    .line 1420
    move-result v2

    .line 1421
    if-nez v2, :cond_34

    .line 1422
    .line 1423
    iget-object v2, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 1424
    .line 1425
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 1426
    .line 1427
    .line 1428
    move-result-object v2

    .line 1429
    check-cast v2, Ll/xlr0;

    .line 1430
    .line 1431
    iget-wide v5, v2, Ll/xlr0;->b:J

    .line 1432
    .line 1433
    goto :goto_19

    .line 1434
    :cond_34
    move-wide v5, v7

    .line 1435
    :cond_35
    :goto_19
    cmp-long v2, v5, v7

    .line 1436
    .line 1437
    if-eqz v2, :cond_36

    .line 1438
    .line 1439
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 1440
    .line 1441
    .line 1442
    move-result-wide v7

    .line 1443
    sub-long/2addr v5, v7

    .line 1444
    iget v2, v0, Ll/xmr0;->p:I

    .line 1445
    .line 1446
    int-to-long v7, v2

    .line 1447
    add-long/2addr v5, v7

    .line 1448
    iput-wide v5, v0, Ll/xmr0;->o:J

    .line 1449
    .line 1450
    :cond_36
    :goto_1a
    iget-wide v5, v0, Ll/xmr0;->o:J

    .line 1451
    .line 1452
    iget v2, v0, Ll/xmr0;->p:I

    .line 1453
    .line 1454
    int-to-long v7, v2

    .line 1455
    cmp-long v2, v5, v7

    .line 1456
    .line 1457
    if-ltz v2, :cond_43

    .line 1458
    .line 1459
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 1460
    .line 1461
    .line 1462
    move-result-wide v5

    .line 1463
    sub-long/2addr v5, v7

    .line 1464
    iget v2, v0, Ll/xmr0;->n:I

    .line 1465
    .line 1466
    const v7, 0x6d646174

    .line 1467
    .line 1468
    .line 1469
    const v8, 0x6d6f6f66

    .line 1470
    .line 1471
    .line 1472
    if-eq v2, v8, :cond_37

    .line 1473
    .line 1474
    if-ne v2, v7, :cond_38

    .line 1475
    .line 1476
    :cond_37
    iget-boolean v2, v0, Ll/xmr0;->E:Z

    .line 1477
    .line 1478
    if-nez v2, :cond_38

    .line 1479
    .line 1480
    iget-object v2, v0, Ll/xmr0;->B:Ll/ser0;

    .line 1481
    .line 1482
    new-instance v9, Ll/agr0;

    .line 1483
    .line 1484
    iget-wide v10, v0, Ll/xmr0;->u:J

    .line 1485
    .line 1486
    invoke-direct {v9, v10, v11, v5, v6}, Ll/agr0;-><init>(JJ)V

    .line 1487
    .line 1488
    .line 1489
    invoke-interface {v2, v9}, Ll/ser0;->j(Ll/bgr0;)V

    .line 1490
    .line 1491
    .line 1492
    const/4 v2, 0x1

    .line 1493
    iput-boolean v2, v0, Ll/xmr0;->E:Z

    .line 1494
    .line 1495
    :cond_38
    iget v2, v0, Ll/xmr0;->n:I

    .line 1496
    .line 1497
    if-ne v2, v8, :cond_39

    .line 1498
    .line 1499
    iget-object v2, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 1500
    .line 1501
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 1502
    .line 1503
    .line 1504
    move-result v2

    .line 1505
    const/4 v9, 0x0

    .line 1506
    :goto_1b
    if-ge v9, v2, :cond_39

    .line 1507
    .line 1508
    iget-object v10, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 1509
    .line 1510
    invoke-virtual {v10, v9}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1511
    .line 1512
    .line 1513
    move-result-object v10

    .line 1514
    check-cast v10, Ll/wmr0;

    .line 1515
    .line 1516
    iget-object v10, v10, Ll/wmr0;->b:Ll/jnr0;

    .line 1517
    .line 1518
    iput-wide v5, v10, Ll/jnr0;->c:J

    .line 1519
    .line 1520
    iput-wide v5, v10, Ll/jnr0;->b:J

    .line 1521
    .line 1522
    add-int/lit8 v9, v9, 0x1

    .line 1523
    .line 1524
    goto :goto_1b

    .line 1525
    :cond_39
    iget v2, v0, Ll/xmr0;->n:I

    .line 1526
    .line 1527
    if-ne v2, v7, :cond_3a

    .line 1528
    .line 1529
    const/4 v7, 0x0

    .line 1530
    iput-object v7, v0, Ll/xmr0;->w:Ll/wmr0;

    .line 1531
    .line 1532
    iget-wide v2, v0, Ll/xmr0;->o:J

    .line 1533
    .line 1534
    add-long/2addr v5, v2

    .line 1535
    iput-wide v5, v0, Ll/xmr0;->r:J

    .line 1536
    .line 1537
    const/4 v8, 0x2

    .line 1538
    iput v8, v0, Ll/xmr0;->m:I

    .line 1539
    .line 1540
    goto/16 :goto_0

    .line 1541
    .line 1542
    :cond_3a
    const v5, 0x6d6f6f76

    .line 1543
    .line 1544
    .line 1545
    if-eq v2, v5, :cond_41

    .line 1546
    .line 1547
    const v5, 0x7472616b

    .line 1548
    .line 1549
    .line 1550
    if-eq v2, v5, :cond_41

    .line 1551
    .line 1552
    const v5, 0x6d646961

    .line 1553
    .line 1554
    .line 1555
    if-eq v2, v5, :cond_41

    .line 1556
    .line 1557
    const v5, 0x6d696e66

    .line 1558
    .line 1559
    .line 1560
    if-eq v2, v5, :cond_41

    .line 1561
    .line 1562
    const v5, 0x7374626c

    .line 1563
    .line 1564
    .line 1565
    if-eq v2, v5, :cond_41

    .line 1566
    .line 1567
    if-eq v2, v8, :cond_41

    .line 1568
    .line 1569
    const v5, 0x74726166

    .line 1570
    .line 1571
    .line 1572
    if-eq v2, v5, :cond_41

    .line 1573
    .line 1574
    const v5, 0x6d766578

    .line 1575
    .line 1576
    .line 1577
    if-eq v2, v5, :cond_41

    .line 1578
    .line 1579
    const v5, 0x65647473

    .line 1580
    .line 1581
    .line 1582
    if-ne v2, v5, :cond_3b

    .line 1583
    .line 1584
    goto/16 :goto_1d

    .line 1585
    .line 1586
    :cond_3b
    const v5, 0x68646c72    # 4.3148E24f

    .line 1587
    .line 1588
    .line 1589
    const-wide/32 v6, 0x7fffffff

    .line 1590
    .line 1591
    .line 1592
    if-eq v2, v5, :cond_3e

    .line 1593
    .line 1594
    const v5, 0x6d646864

    .line 1595
    .line 1596
    .line 1597
    if-eq v2, v5, :cond_3e

    .line 1598
    .line 1599
    const v5, 0x6d766864

    .line 1600
    .line 1601
    .line 1602
    if-eq v2, v5, :cond_3e

    .line 1603
    .line 1604
    if-eq v2, v4, :cond_3e

    .line 1605
    .line 1606
    const v4, 0x73747364

    .line 1607
    .line 1608
    .line 1609
    if-eq v2, v4, :cond_3e

    .line 1610
    .line 1611
    const v4, 0x73747473

    .line 1612
    .line 1613
    .line 1614
    if-eq v2, v4, :cond_3e

    .line 1615
    .line 1616
    const v4, 0x63747473

    .line 1617
    .line 1618
    .line 1619
    if-eq v2, v4, :cond_3e

    .line 1620
    .line 1621
    const v4, 0x73747363

    .line 1622
    .line 1623
    .line 1624
    if-eq v2, v4, :cond_3e

    .line 1625
    .line 1626
    const v4, 0x7374737a

    .line 1627
    .line 1628
    .line 1629
    if-eq v2, v4, :cond_3e

    .line 1630
    .line 1631
    const v4, 0x73747a32

    .line 1632
    .line 1633
    .line 1634
    if-eq v2, v4, :cond_3e

    .line 1635
    .line 1636
    const v4, 0x7374636f

    .line 1637
    .line 1638
    .line 1639
    if-eq v2, v4, :cond_3e

    .line 1640
    .line 1641
    const v4, 0x636f3634

    .line 1642
    .line 1643
    .line 1644
    if-eq v2, v4, :cond_3e

    .line 1645
    .line 1646
    const v4, 0x73747373

    .line 1647
    .line 1648
    .line 1649
    if-eq v2, v4, :cond_3e

    .line 1650
    .line 1651
    const v4, 0x74666474

    .line 1652
    .line 1653
    .line 1654
    if-eq v2, v4, :cond_3e

    .line 1655
    .line 1656
    const v4, 0x74666864

    .line 1657
    .line 1658
    .line 1659
    if-eq v2, v4, :cond_3e

    .line 1660
    .line 1661
    const v4, 0x746b6864

    .line 1662
    .line 1663
    .line 1664
    if-eq v2, v4, :cond_3e

    .line 1665
    .line 1666
    const v4, 0x74726578

    .line 1667
    .line 1668
    .line 1669
    if-eq v2, v4, :cond_3e

    .line 1670
    .line 1671
    const v4, 0x7472756e

    .line 1672
    .line 1673
    .line 1674
    if-eq v2, v4, :cond_3e

    .line 1675
    .line 1676
    const v4, 0x70737368    # 3.013775E29f

    .line 1677
    .line 1678
    .line 1679
    if-eq v2, v4, :cond_3e

    .line 1680
    .line 1681
    const v4, 0x7361697a

    .line 1682
    .line 1683
    .line 1684
    if-eq v2, v4, :cond_3e

    .line 1685
    .line 1686
    const v4, 0x7361696f

    .line 1687
    .line 1688
    .line 1689
    if-eq v2, v4, :cond_3e

    .line 1690
    .line 1691
    const v4, 0x73656e63

    .line 1692
    .line 1693
    .line 1694
    if-eq v2, v4, :cond_3e

    .line 1695
    .line 1696
    const v4, 0x75756964

    .line 1697
    .line 1698
    .line 1699
    if-eq v2, v4, :cond_3e

    .line 1700
    .line 1701
    const v4, 0x73626770

    .line 1702
    .line 1703
    .line 1704
    if-eq v2, v4, :cond_3e

    .line 1705
    .line 1706
    const v4, 0x73677064

    .line 1707
    .line 1708
    .line 1709
    if-eq v2, v4, :cond_3e

    .line 1710
    .line 1711
    const v4, 0x656c7374

    .line 1712
    .line 1713
    .line 1714
    if-eq v2, v4, :cond_3e

    .line 1715
    .line 1716
    const v4, 0x6d656864

    .line 1717
    .line 1718
    .line 1719
    if-eq v2, v4, :cond_3e

    .line 1720
    .line 1721
    if-ne v2, v3, :cond_3c

    .line 1722
    .line 1723
    goto :goto_1c

    .line 1724
    :cond_3c
    iget-wide v2, v0, Ll/xmr0;->o:J

    .line 1725
    .line 1726
    cmp-long v2, v2, v6

    .line 1727
    .line 1728
    if-gtz v2, :cond_3d

    .line 1729
    .line 1730
    const/4 v7, 0x0

    .line 1731
    iput-object v7, v0, Ll/xmr0;->q:Ll/bgw0;

    .line 1732
    .line 1733
    const/4 v6, 0x1

    .line 1734
    iput v6, v0, Ll/xmr0;->m:I

    .line 1735
    .line 1736
    goto/16 :goto_0

    .line 1737
    .line 1738
    :cond_3d
    const-string v0, "Skipping atom with length > 2147483647 (unsupported)."

    .line 1739
    .line 1740
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1741
    .line 1742
    .line 1743
    move-result-object v0

    .line 1744
    throw v0

    .line 1745
    :cond_3e
    :goto_1c
    iget v2, v0, Ll/xmr0;->p:I

    .line 1746
    .line 1747
    const/16 v9, 0x8

    .line 1748
    .line 1749
    if-ne v2, v9, :cond_40

    .line 1750
    .line 1751
    iget-wide v2, v0, Ll/xmr0;->o:J

    .line 1752
    .line 1753
    cmp-long v2, v2, v6

    .line 1754
    .line 1755
    if-gtz v2, :cond_3f

    .line 1756
    .line 1757
    new-instance v2, Ll/bgw0;

    .line 1758
    .line 1759
    iget-wide v3, v0, Ll/xmr0;->o:J

    .line 1760
    .line 1761
    long-to-int v3, v3

    .line 1762
    invoke-direct {v2, v3}, Ll/bgw0;-><init>(I)V

    .line 1763
    .line 1764
    .line 1765
    iget-object v3, v0, Ll/xmr0;->j:Ll/bgw0;

    .line 1766
    .line 1767
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 1768
    .line 1769
    .line 1770
    move-result-object v3

    .line 1771
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 1772
    .line 1773
    .line 1774
    move-result-object v4

    .line 1775
    const/4 v8, 0x0

    .line 1776
    invoke-static {v3, v8, v4, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1777
    .line 1778
    .line 1779
    iput-object v2, v0, Ll/xmr0;->q:Ll/bgw0;

    .line 1780
    .line 1781
    const/4 v6, 0x1

    .line 1782
    iput v6, v0, Ll/xmr0;->m:I

    .line 1783
    .line 1784
    goto/16 :goto_0

    .line 1785
    .line 1786
    :cond_3f
    const-string v0, "Leaf atom with length > 2147483647 (unsupported)."

    .line 1787
    .line 1788
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1789
    .line 1790
    .line 1791
    move-result-object v0

    .line 1792
    throw v0

    .line 1793
    :cond_40
    const-string v0, "Leaf atom defines extended atom size (unsupported)."

    .line 1794
    .line 1795
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1796
    .line 1797
    .line 1798
    move-result-object v0

    .line 1799
    throw v0

    .line 1800
    :cond_41
    :goto_1d
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 1801
    .line 1802
    .line 1803
    move-result-wide v3

    .line 1804
    iget-wide v5, v0, Ll/xmr0;->o:J

    .line 1805
    .line 1806
    add-long/2addr v3, v5

    .line 1807
    iget-object v5, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 1808
    .line 1809
    new-instance v6, Ll/xlr0;

    .line 1810
    .line 1811
    const-wide/16 v7, -0x8

    .line 1812
    .line 1813
    add-long/2addr v3, v7

    .line 1814
    invoke-direct {v6, v2, v3, v4}, Ll/xlr0;-><init>(IJ)V

    .line 1815
    .line 1816
    .line 1817
    invoke-virtual {v5, v6}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 1818
    .line 1819
    .line 1820
    iget-wide v5, v0, Ll/xmr0;->o:J

    .line 1821
    .line 1822
    iget v2, v0, Ll/xmr0;->p:I

    .line 1823
    .line 1824
    int-to-long v7, v2

    .line 1825
    cmp-long v2, v5, v7

    .line 1826
    .line 1827
    if-nez v2, :cond_42

    .line 1828
    .line 1829
    invoke-virtual {v0, v3, v4}, Ll/xmr0;->i(J)V

    .line 1830
    .line 1831
    .line 1832
    goto/16 :goto_0

    .line 1833
    .line 1834
    :cond_42
    invoke-virtual {v0}, Ll/xmr0;->g()V

    .line 1835
    .line 1836
    .line 1837
    goto/16 :goto_0

    .line 1838
    .line 1839
    :cond_43
    const-string v0, "Atom size less than header length (unsupported)."

    .line 1840
    .line 1841
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1842
    .line 1843
    .line 1844
    move-result-object v0

    .line 1845
    throw v0
.end method

.method public final g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/xmr0;->m:I

    .line 3
    .line 4
    iput v0, p0, Ll/xmr0;->p:I

    .line 5
    .line 6
    return-void
.end method

.method public final i(J)V
    .locals 48
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    :cond_0
    :goto_0
    iget-object v1, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_4e

    .line 10
    .line 11
    iget-object v1, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/xlr0;

    .line 18
    .line 19
    iget-wide v1, v1, Ll/xlr0;->b:J

    .line 20
    .line 21
    cmp-long v1, v1, p1

    .line 22
    .line 23
    if-nez v1, :cond_4e

    .line 24
    .line 25
    iget-object v1, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v2, v1

    .line 32
    check-cast v2, Ll/xlr0;

    .line 33
    .line 34
    iget v1, v2, Ll/zlr0;->a:I

    .line 35
    .line 36
    const v3, 0x6d6f6f76

    .line 37
    .line 38
    .line 39
    const/16 v6, 0xc

    .line 40
    .line 41
    const/16 v7, 0x8

    .line 42
    .line 43
    if-ne v1, v3, :cond_8

    .line 44
    .line 45
    iget-object v1, v2, Ll/xlr0;->c:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1}, Ll/xmr0;->b(Ljava/util/List;)Lcom/google/android/gms/internal/ads/zzae;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const v3, 0x6d766578

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ll/xlr0;->c(I)Ll/xlr0;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    new-instance v12, Landroid/util/SparseArray;

    .line 62
    .line 63
    invoke-direct {v12}, Landroid/util/SparseArray;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object v8, v3, Ll/xlr0;->c:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    const/4 v9, 0x0

    .line 78
    :goto_1
    if-ge v9, v8, :cond_4

    .line 79
    .line 80
    iget-object v13, v3, Ll/xlr0;->c:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v13, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v13

    .line 86
    check-cast v13, Ll/ylr0;

    .line 87
    .line 88
    iget v14, v13, Ll/zlr0;->a:I

    .line 89
    .line 90
    const v15, 0x74726578

    .line 91
    .line 92
    .line 93
    if-ne v14, v15, :cond_1

    .line 94
    .line 95
    iget-object v13, v13, Ll/ylr0;->b:Ll/bgw0;

    .line 96
    .line 97
    invoke-virtual {v13, v6}, Ll/bgw0;->k(I)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v13}, Ll/bgw0;->v()I

    .line 101
    .line 102
    .line 103
    move-result v14

    .line 104
    invoke-virtual {v13}, Ll/bgw0;->v()I

    .line 105
    .line 106
    .line 107
    move-result v15

    .line 108
    add-int/lit8 v15, v15, -0x1

    .line 109
    .line 110
    invoke-virtual {v13}, Ll/bgw0;->v()I

    .line 111
    .line 112
    .line 113
    move-result v10

    .line 114
    invoke-virtual {v13}, Ll/bgw0;->v()I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    invoke-virtual {v13}, Ll/bgw0;->v()I

    .line 119
    .line 120
    .line 121
    move-result v13

    .line 122
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v14

    .line 126
    new-instance v11, Ll/imr0;

    .line 127
    .line 128
    invoke-direct {v11, v15, v10, v6, v13}, Ll/imr0;-><init>(IIII)V

    .line 129
    .line 130
    .line 131
    invoke-static {v14, v11}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    iget-object v10, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast v10, Ljava/lang/Integer;

    .line 138
    .line 139
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 140
    .line 141
    .line 142
    move-result v10

    .line 143
    iget-object v6, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v6, Ll/imr0;

    .line 146
    .line 147
    invoke-virtual {v12, v10, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_1
    const v6, 0x6d656864

    .line 152
    .line 153
    .line 154
    if-ne v14, v6, :cond_3

    .line 155
    .line 156
    iget-object v4, v13, Ll/ylr0;->b:Ll/bgw0;

    .line 157
    .line 158
    invoke-virtual {v4, v7}, Ll/bgw0;->k(I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4}, Ll/bgw0;->v()I

    .line 162
    .line 163
    .line 164
    move-result v5

    .line 165
    invoke-static {v5}, Ll/zlr0;->a(I)I

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    if-nez v5, :cond_2

    .line 170
    .line 171
    invoke-virtual {v4}, Ll/bgw0;->J()J

    .line 172
    .line 173
    .line 174
    move-result-wide v4

    .line 175
    goto :goto_2

    .line 176
    :cond_2
    invoke-virtual {v4}, Ll/bgw0;->K()J

    .line 177
    .line 178
    .line 179
    move-result-wide v4

    .line 180
    :cond_3
    :goto_2
    add-int/lit8 v9, v9, 0x1

    .line 181
    .line 182
    const/16 v6, 0xc

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_4
    new-instance v3, Ll/rfr0;

    .line 186
    .line 187
    invoke-direct {v3}, Ll/rfr0;-><init>()V

    .line 188
    .line 189
    .line 190
    new-instance v9, Ll/kmr0;

    .line 191
    .line 192
    invoke-direct {v9, v0}, Ll/kmr0;-><init>(Ll/xmr0;)V

    .line 193
    .line 194
    .line 195
    const/4 v7, 0x0

    .line 196
    const/4 v8, 0x0

    .line 197
    move-object v6, v1

    .line 198
    invoke-static/range {v2 .. v9}, Ll/hmr0;->d(Ll/xlr0;Ll/rfr0;JLcom/google/android/gms/internal/ads/zzae;ZZLl/eow0;)Ljava/util/List;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    iget-object v3, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 207
    .line 208
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-nez v3, :cond_6

    .line 213
    .line 214
    const/4 v10, 0x0

    .line 215
    :goto_3
    if-ge v10, v2, :cond_5

    .line 216
    .line 217
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Ll/knr0;

    .line 222
    .line 223
    iget-object v4, v3, Ll/knr0;->a:Ll/hnr0;

    .line 224
    .line 225
    new-instance v5, Ll/wmr0;

    .line 226
    .line 227
    iget-object v6, v0, Ll/xmr0;->B:Ll/ser0;

    .line 228
    .line 229
    iget v7, v4, Ll/hnr0;->b:I

    .line 230
    .line 231
    invoke-interface {v6, v10, v7}, Ll/ser0;->i(II)Ll/sgr0;

    .line 232
    .line 233
    .line 234
    move-result-object v6

    .line 235
    iget v7, v4, Ll/hnr0;->a:I

    .line 236
    .line 237
    invoke-static {v12, v7}, Ll/xmr0;->j(Landroid/util/SparseArray;I)Ll/imr0;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    invoke-direct {v5, v6, v3, v7}, Ll/wmr0;-><init>(Ll/sgr0;Ll/knr0;Ll/imr0;)V

    .line 242
    .line 243
    .line 244
    iget-object v3, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 245
    .line 246
    iget v6, v4, Ll/hnr0;->a:I

    .line 247
    .line 248
    invoke-virtual {v3, v6, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 249
    .line 250
    .line 251
    iget-wide v5, v0, Ll/xmr0;->u:J

    .line 252
    .line 253
    iget-wide v3, v4, Ll/hnr0;->e:J

    .line 254
    .line 255
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 256
    .line 257
    .line 258
    move-result-wide v3

    .line 259
    iput-wide v3, v0, Ll/xmr0;->u:J

    .line 260
    .line 261
    add-int/lit8 v10, v10, 0x1

    .line 262
    .line 263
    goto :goto_3

    .line 264
    :cond_5
    iget-object v1, v0, Ll/xmr0;->B:Ll/ser0;

    .line 265
    .line 266
    invoke-interface {v1}, Ll/ser0;->c()V

    .line 267
    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :cond_6
    iget-object v3, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 272
    .line 273
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    if-ne v3, v2, :cond_7

    .line 278
    .line 279
    const/4 v11, 0x1

    .line 280
    goto :goto_4

    .line 281
    :cond_7
    const/4 v11, 0x0

    .line 282
    :goto_4
    invoke-static {v11}, Ll/lev0;->f(Z)V

    .line 283
    .line 284
    .line 285
    const/4 v10, 0x0

    .line 286
    :goto_5
    if-ge v10, v2, :cond_0

    .line 287
    .line 288
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    check-cast v3, Ll/knr0;

    .line 293
    .line 294
    iget-object v4, v3, Ll/knr0;->a:Ll/hnr0;

    .line 295
    .line 296
    iget-object v5, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 297
    .line 298
    iget v6, v4, Ll/hnr0;->a:I

    .line 299
    .line 300
    invoke-virtual {v5, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v5

    .line 304
    check-cast v5, Ll/wmr0;

    .line 305
    .line 306
    iget v4, v4, Ll/hnr0;->a:I

    .line 307
    .line 308
    invoke-static {v12, v4}, Ll/xmr0;->j(Landroid/util/SparseArray;I)Ll/imr0;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    invoke-virtual {v5, v3, v4}, Ll/wmr0;->h(Ll/knr0;Ll/imr0;)V

    .line 313
    .line 314
    .line 315
    add-int/lit8 v10, v10, 0x1

    .line 316
    .line 317
    goto :goto_5

    .line 318
    :cond_8
    const v3, 0x6d6f6f66

    .line 319
    .line 320
    .line 321
    if-ne v1, v3, :cond_4d

    .line 322
    .line 323
    iget-object v1, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 324
    .line 325
    iget-object v3, v0, Ll/xmr0;->g:[B

    .line 326
    .line 327
    iget-object v6, v2, Ll/xlr0;->d:Ljava/util/List;

    .line 328
    .line 329
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 330
    .line 331
    .line 332
    move-result v6

    .line 333
    const/4 v8, 0x0

    .line 334
    :goto_6
    if-ge v8, v6, :cond_47

    .line 335
    .line 336
    iget-object v10, v2, Ll/xlr0;->d:Ljava/util/List;

    .line 337
    .line 338
    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v10

    .line 342
    check-cast v10, Ll/xlr0;

    .line 343
    .line 344
    iget v11, v10, Ll/zlr0;->a:I

    .line 345
    .line 346
    const v12, 0x74726166

    .line 347
    .line 348
    .line 349
    if-ne v11, v12, :cond_46

    .line 350
    .line 351
    const v11, 0x74666864

    .line 352
    .line 353
    .line 354
    invoke-virtual {v10, v11}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 355
    .line 356
    .line 357
    move-result-object v11

    .line 358
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 359
    .line 360
    .line 361
    iget-object v11, v11, Ll/ylr0;->b:Ll/bgw0;

    .line 362
    .line 363
    invoke-virtual {v11, v7}, Ll/bgw0;->k(I)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v11}, Ll/bgw0;->v()I

    .line 367
    .line 368
    .line 369
    move-result v12

    .line 370
    invoke-virtual {v11}, Ll/bgw0;->v()I

    .line 371
    .line 372
    .line 373
    move-result v13

    .line 374
    invoke-virtual {v1, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v13

    .line 378
    check-cast v13, Ll/wmr0;

    .line 379
    .line 380
    if-nez v13, :cond_9

    .line 381
    .line 382
    const/4 v13, 0x0

    .line 383
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    goto :goto_c

    .line 389
    :cond_9
    and-int/lit8 v14, v12, 0x1

    .line 390
    .line 391
    if-eqz v14, :cond_a

    .line 392
    .line 393
    invoke-virtual {v11}, Ll/bgw0;->K()J

    .line 394
    .line 395
    .line 396
    move-result-wide v14

    .line 397
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    iget-object v4, v13, Ll/wmr0;->b:Ll/jnr0;

    .line 403
    .line 404
    iput-wide v14, v4, Ll/jnr0;->b:J

    .line 405
    .line 406
    iput-wide v14, v4, Ll/jnr0;->c:J

    .line 407
    .line 408
    goto :goto_7

    .line 409
    :cond_a
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    :goto_7
    iget-object v4, v13, Ll/wmr0;->e:Ll/imr0;

    .line 415
    .line 416
    and-int/lit8 v5, v12, 0x2

    .line 417
    .line 418
    if-eqz v5, :cond_b

    .line 419
    .line 420
    invoke-virtual {v11}, Ll/bgw0;->v()I

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    add-int/lit8 v5, v5, -0x1

    .line 425
    .line 426
    goto :goto_8

    .line 427
    :cond_b
    iget v5, v4, Ll/imr0;->a:I

    .line 428
    .line 429
    :goto_8
    and-int/lit8 v14, v12, 0x8

    .line 430
    .line 431
    if-eqz v14, :cond_c

    .line 432
    .line 433
    invoke-virtual {v11}, Ll/bgw0;->v()I

    .line 434
    .line 435
    .line 436
    move-result v14

    .line 437
    goto :goto_9

    .line 438
    :cond_c
    iget v14, v4, Ll/imr0;->b:I

    .line 439
    .line 440
    :goto_9
    and-int/lit8 v15, v12, 0x10

    .line 441
    .line 442
    if-eqz v15, :cond_d

    .line 443
    .line 444
    invoke-virtual {v11}, Ll/bgw0;->v()I

    .line 445
    .line 446
    .line 447
    move-result v15

    .line 448
    goto :goto_a

    .line 449
    :cond_d
    iget v15, v4, Ll/imr0;->c:I

    .line 450
    .line 451
    :goto_a
    and-int/lit8 v12, v12, 0x20

    .line 452
    .line 453
    if-eqz v12, :cond_e

    .line 454
    .line 455
    invoke-virtual {v11}, Ll/bgw0;->v()I

    .line 456
    .line 457
    .line 458
    move-result v4

    .line 459
    goto :goto_b

    .line 460
    :cond_e
    iget v4, v4, Ll/imr0;->d:I

    .line 461
    .line 462
    :goto_b
    iget-object v11, v13, Ll/wmr0;->b:Ll/jnr0;

    .line 463
    .line 464
    new-instance v12, Ll/imr0;

    .line 465
    .line 466
    invoke-direct {v12, v5, v14, v15, v4}, Ll/imr0;-><init>(IIII)V

    .line 467
    .line 468
    .line 469
    iput-object v12, v11, Ll/jnr0;->a:Ll/imr0;

    .line 470
    .line 471
    :goto_c
    if-nez v13, :cond_f

    .line 472
    .line 473
    move-object/from16 v19, v1

    .line 474
    .line 475
    move/from16 v25, v6

    .line 476
    .line 477
    move v9, v7

    .line 478
    move/from16 v27, v8

    .line 479
    .line 480
    const/4 v8, 0x0

    .line 481
    const/16 v11, 0xc

    .line 482
    .line 483
    const/4 v14, 0x1

    .line 484
    goto/16 :goto_2b

    .line 485
    .line 486
    :cond_f
    iget-object v4, v13, Ll/wmr0;->b:Ll/jnr0;

    .line 487
    .line 488
    iget-wide v11, v4, Ll/jnr0;->p:J

    .line 489
    .line 490
    iget-boolean v5, v4, Ll/jnr0;->q:Z

    .line 491
    .line 492
    invoke-virtual {v13}, Ll/wmr0;->i()V

    .line 493
    .line 494
    .line 495
    const/4 v14, 0x1

    .line 496
    invoke-static {v13, v14}, Ll/wmr0;->g(Ll/wmr0;Z)V

    .line 497
    .line 498
    .line 499
    const v15, 0x74666474

    .line 500
    .line 501
    .line 502
    invoke-virtual {v10, v15}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 503
    .line 504
    .line 505
    move-result-object v15

    .line 506
    if-eqz v15, :cond_11

    .line 507
    .line 508
    iget-object v5, v15, Ll/ylr0;->b:Ll/bgw0;

    .line 509
    .line 510
    invoke-virtual {v5, v7}, Ll/bgw0;->k(I)V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v5}, Ll/bgw0;->v()I

    .line 514
    .line 515
    .line 516
    move-result v11

    .line 517
    invoke-static {v11}, Ll/zlr0;->a(I)I

    .line 518
    .line 519
    .line 520
    move-result v11

    .line 521
    if-ne v11, v14, :cond_10

    .line 522
    .line 523
    invoke-virtual {v5}, Ll/bgw0;->K()J

    .line 524
    .line 525
    .line 526
    move-result-wide v11

    .line 527
    goto :goto_d

    .line 528
    :cond_10
    invoke-virtual {v5}, Ll/bgw0;->J()J

    .line 529
    .line 530
    .line 531
    move-result-wide v11

    .line 532
    :goto_d
    iput-wide v11, v4, Ll/jnr0;->p:J

    .line 533
    .line 534
    iput-boolean v14, v4, Ll/jnr0;->q:Z

    .line 535
    .line 536
    goto :goto_e

    .line 537
    :cond_11
    iput-wide v11, v4, Ll/jnr0;->p:J

    .line 538
    .line 539
    iput-boolean v5, v4, Ll/jnr0;->q:Z

    .line 540
    .line 541
    :goto_e
    iget-object v5, v10, Ll/xlr0;->c:Ljava/util/List;

    .line 542
    .line 543
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 544
    .line 545
    .line 546
    move-result v11

    .line 547
    const/4 v12, 0x0

    .line 548
    const/4 v14, 0x0

    .line 549
    const/4 v15, 0x0

    .line 550
    :goto_f
    const v9, 0x7472756e

    .line 551
    .line 552
    .line 553
    if-ge v12, v11, :cond_13

    .line 554
    .line 555
    invoke-interface {v5, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 556
    .line 557
    .line 558
    move-result-object v19

    .line 559
    move-object/from16 v7, v19

    .line 560
    .line 561
    check-cast v7, Ll/ylr0;

    .line 562
    .line 563
    move-object/from16 v19, v1

    .line 564
    .line 565
    iget v1, v7, Ll/zlr0;->a:I

    .line 566
    .line 567
    if-ne v1, v9, :cond_12

    .line 568
    .line 569
    iget-object v1, v7, Ll/ylr0;->b:Ll/bgw0;

    .line 570
    .line 571
    const/16 v7, 0xc

    .line 572
    .line 573
    invoke-virtual {v1, v7}, Ll/bgw0;->k(I)V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v1}, Ll/bgw0;->E()I

    .line 577
    .line 578
    .line 579
    move-result v1

    .line 580
    if-lez v1, :cond_12

    .line 581
    .line 582
    add-int/2addr v15, v1

    .line 583
    add-int/lit8 v14, v14, 0x1

    .line 584
    .line 585
    :cond_12
    add-int/lit8 v12, v12, 0x1

    .line 586
    .line 587
    move-object/from16 v1, v19

    .line 588
    .line 589
    const/16 v7, 0x8

    .line 590
    .line 591
    goto :goto_f

    .line 592
    :cond_13
    move-object/from16 v19, v1

    .line 593
    .line 594
    const/4 v1, 0x0

    .line 595
    iput v1, v13, Ll/wmr0;->h:I

    .line 596
    .line 597
    iput v1, v13, Ll/wmr0;->g:I

    .line 598
    .line 599
    iput v1, v13, Ll/wmr0;->f:I

    .line 600
    .line 601
    iget-object v1, v13, Ll/wmr0;->b:Ll/jnr0;

    .line 602
    .line 603
    iput v14, v1, Ll/jnr0;->d:I

    .line 604
    .line 605
    iput v15, v1, Ll/jnr0;->e:I

    .line 606
    .line 607
    iget-object v7, v1, Ll/jnr0;->g:[I

    .line 608
    .line 609
    array-length v7, v7

    .line 610
    if-ge v7, v14, :cond_14

    .line 611
    .line 612
    new-array v7, v14, [J

    .line 613
    .line 614
    iput-object v7, v1, Ll/jnr0;->f:[J

    .line 615
    .line 616
    new-array v7, v14, [I

    .line 617
    .line 618
    iput-object v7, v1, Ll/jnr0;->g:[I

    .line 619
    .line 620
    :cond_14
    iget-object v7, v1, Ll/jnr0;->h:[I

    .line 621
    .line 622
    array-length v7, v7

    .line 623
    if-ge v7, v15, :cond_15

    .line 624
    .line 625
    mul-int/lit8 v15, v15, 0x7d

    .line 626
    .line 627
    div-int/lit8 v15, v15, 0x64

    .line 628
    .line 629
    new-array v7, v15, [I

    .line 630
    .line 631
    iput-object v7, v1, Ll/jnr0;->h:[I

    .line 632
    .line 633
    new-array v7, v15, [J

    .line 634
    .line 635
    iput-object v7, v1, Ll/jnr0;->i:[J

    .line 636
    .line 637
    new-array v7, v15, [Z

    .line 638
    .line 639
    iput-object v7, v1, Ll/jnr0;->j:[Z

    .line 640
    .line 641
    new-array v7, v15, [Z

    .line 642
    .line 643
    iput-object v7, v1, Ll/jnr0;->l:[Z

    .line 644
    .line 645
    :cond_15
    const/4 v1, 0x0

    .line 646
    const/4 v7, 0x0

    .line 647
    const/4 v12, 0x0

    .line 648
    :goto_10
    const-wide/16 v20, 0x0

    .line 649
    .line 650
    if-ge v1, v11, :cond_28

    .line 651
    .line 652
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 653
    .line 654
    .line 655
    move-result-object v15

    .line 656
    check-cast v15, Ll/ylr0;

    .line 657
    .line 658
    const/16 v22, 0x10

    .line 659
    .line 660
    iget v14, v15, Ll/zlr0;->a:I

    .line 661
    .line 662
    if-ne v14, v9, :cond_27

    .line 663
    .line 664
    add-int/lit8 v14, v7, 0x1

    .line 665
    .line 666
    iget-object v15, v15, Ll/ylr0;->b:Ll/bgw0;

    .line 667
    .line 668
    const/16 v9, 0x8

    .line 669
    .line 670
    invoke-virtual {v15, v9}, Ll/bgw0;->k(I)V

    .line 671
    .line 672
    .line 673
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 674
    .line 675
    .line 676
    move-result v9

    .line 677
    move/from16 v23, v1

    .line 678
    .line 679
    iget-object v1, v13, Ll/wmr0;->d:Ll/knr0;

    .line 680
    .line 681
    iget-object v1, v1, Ll/knr0;->a:Ll/hnr0;

    .line 682
    .line 683
    move-object/from16 v24, v5

    .line 684
    .line 685
    iget-object v5, v13, Ll/wmr0;->b:Ll/jnr0;

    .line 686
    .line 687
    move/from16 v25, v6

    .line 688
    .line 689
    iget-object v6, v5, Ll/jnr0;->a:Ll/imr0;

    .line 690
    .line 691
    sget v26, Ll/mpw0;->a:I

    .line 692
    .line 693
    move/from16 v26, v7

    .line 694
    .line 695
    iget-object v7, v5, Ll/jnr0;->g:[I

    .line 696
    .line 697
    invoke-virtual {v15}, Ll/bgw0;->E()I

    .line 698
    .line 699
    .line 700
    move-result v27

    .line 701
    aput v27, v7, v26

    .line 702
    .line 703
    iget-object v7, v5, Ll/jnr0;->f:[J

    .line 704
    .line 705
    move-object/from16 v28, v7

    .line 706
    .line 707
    move/from16 v27, v8

    .line 708
    .line 709
    iget-wide v7, v5, Ll/jnr0;->b:J

    .line 710
    .line 711
    aput-wide v7, v28, v26

    .line 712
    .line 713
    and-int/lit8 v29, v9, 0x1

    .line 714
    .line 715
    if-eqz v29, :cond_16

    .line 716
    .line 717
    move-wide/from16 v29, v7

    .line 718
    .line 719
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 720
    .line 721
    .line 722
    move-result v7

    .line 723
    int-to-long v7, v7

    .line 724
    add-long v7, v29, v7

    .line 725
    .line 726
    aput-wide v7, v28, v26

    .line 727
    .line 728
    :cond_16
    and-int/lit8 v7, v9, 0x4

    .line 729
    .line 730
    if-eqz v7, :cond_17

    .line 731
    .line 732
    const/4 v7, 0x1

    .line 733
    goto :goto_11

    .line 734
    :cond_17
    const/4 v7, 0x0

    .line 735
    :goto_11
    iget v8, v6, Ll/imr0;->d:I

    .line 736
    .line 737
    if-eqz v7, :cond_18

    .line 738
    .line 739
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 740
    .line 741
    .line 742
    move-result v8

    .line 743
    :cond_18
    move/from16 v28, v7

    .line 744
    .line 745
    and-int/lit16 v7, v9, 0x100

    .line 746
    .line 747
    move/from16 v29, v7

    .line 748
    .line 749
    and-int/lit16 v7, v9, 0x200

    .line 750
    .line 751
    move/from16 v30, v7

    .line 752
    .line 753
    and-int/lit16 v7, v9, 0x400

    .line 754
    .line 755
    and-int/lit16 v9, v9, 0x800

    .line 756
    .line 757
    move/from16 v31, v7

    .line 758
    .line 759
    iget-object v7, v1, Ll/hnr0;->h:[J

    .line 760
    .line 761
    if-eqz v7, :cond_1c

    .line 762
    .line 763
    move/from16 v32, v8

    .line 764
    .line 765
    array-length v8, v7

    .line 766
    move-object/from16 v33, v7

    .line 767
    .line 768
    const/4 v7, 0x1

    .line 769
    if-ne v8, v7, :cond_1d

    .line 770
    .line 771
    iget-object v7, v1, Ll/hnr0;->i:[J

    .line 772
    .line 773
    if-nez v7, :cond_19

    .line 774
    .line 775
    goto :goto_13

    .line 776
    :cond_19
    const/16 v16, 0x0

    .line 777
    .line 778
    aget-wide v34, v33, v16

    .line 779
    .line 780
    cmp-long v8, v34, v20

    .line 781
    .line 782
    if-nez v8, :cond_1a

    .line 783
    .line 784
    goto :goto_12

    .line 785
    :cond_1a
    aget-wide v36, v7, v16

    .line 786
    .line 787
    add-long v38, v34, v36

    .line 788
    .line 789
    iget-wide v7, v1, Ll/hnr0;->d:J

    .line 790
    .line 791
    sget-object v44, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 792
    .line 793
    const-wide/32 v40, 0xf4240

    .line 794
    .line 795
    .line 796
    move-wide/from16 v42, v7

    .line 797
    .line 798
    invoke-static/range {v38 .. v44}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 799
    .line 800
    .line 801
    move-result-wide v7

    .line 802
    move-wide/from16 v33, v7

    .line 803
    .line 804
    iget-wide v7, v1, Ll/hnr0;->e:J

    .line 805
    .line 806
    cmp-long v7, v33, v7

    .line 807
    .line 808
    if-gez v7, :cond_1b

    .line 809
    .line 810
    goto :goto_13

    .line 811
    :cond_1b
    :goto_12
    iget-object v7, v1, Ll/hnr0;->i:[J

    .line 812
    .line 813
    const/16 v16, 0x0

    .line 814
    .line 815
    aget-wide v20, v7, v16

    .line 816
    .line 817
    goto :goto_13

    .line 818
    :cond_1c
    move/from16 v32, v8

    .line 819
    .line 820
    :cond_1d
    :goto_13
    iget-object v7, v5, Ll/jnr0;->h:[I

    .line 821
    .line 822
    iget-object v8, v5, Ll/jnr0;->i:[J

    .line 823
    .line 824
    move-object/from16 v33, v7

    .line 825
    .line 826
    iget-object v7, v5, Ll/jnr0;->j:[Z

    .line 827
    .line 828
    move-object/from16 v34, v7

    .line 829
    .line 830
    iget-object v7, v5, Ll/jnr0;->g:[I

    .line 831
    .line 832
    aget v7, v7, v26

    .line 833
    .line 834
    add-int/2addr v7, v12

    .line 835
    move-object/from16 v43, v8

    .line 836
    .line 837
    move/from16 v42, v9

    .line 838
    .line 839
    iget-wide v8, v1, Ll/hnr0;->c:J

    .line 840
    .line 841
    move-wide/from16 v39, v8

    .line 842
    .line 843
    iget-wide v8, v5, Ll/jnr0;->p:J

    .line 844
    .line 845
    :goto_14
    if-ge v12, v7, :cond_26

    .line 846
    .line 847
    if-eqz v29, :cond_1e

    .line 848
    .line 849
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 850
    .line 851
    .line 852
    move-result v1

    .line 853
    goto :goto_15

    .line 854
    :cond_1e
    iget v1, v6, Ll/imr0;->b:I

    .line 855
    .line 856
    :goto_15
    invoke-static {v1}, Ll/xmr0;->a(I)I

    .line 857
    .line 858
    .line 859
    if-eqz v30, :cond_1f

    .line 860
    .line 861
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 862
    .line 863
    .line 864
    move-result v26

    .line 865
    move/from16 v47, v26

    .line 866
    .line 867
    move/from16 v26, v7

    .line 868
    .line 869
    move/from16 v7, v47

    .line 870
    .line 871
    goto :goto_16

    .line 872
    :cond_1f
    move/from16 v26, v7

    .line 873
    .line 874
    iget v7, v6, Ll/imr0;->c:I

    .line 875
    .line 876
    :goto_16
    invoke-static {v7}, Ll/xmr0;->a(I)I

    .line 877
    .line 878
    .line 879
    if-eqz v31, :cond_20

    .line 880
    .line 881
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 882
    .line 883
    .line 884
    move-result v35

    .line 885
    move/from16 v44, v7

    .line 886
    .line 887
    move/from16 v7, v35

    .line 888
    .line 889
    goto :goto_17

    .line 890
    :cond_20
    if-nez v12, :cond_22

    .line 891
    .line 892
    if-eqz v28, :cond_21

    .line 893
    .line 894
    move/from16 v44, v7

    .line 895
    .line 896
    move/from16 v7, v32

    .line 897
    .line 898
    const/4 v12, 0x0

    .line 899
    goto :goto_17

    .line 900
    :cond_21
    const/4 v12, 0x0

    .line 901
    :cond_22
    move/from16 v44, v7

    .line 902
    .line 903
    iget v7, v6, Ll/imr0;->d:I

    .line 904
    .line 905
    :goto_17
    if-eqz v42, :cond_23

    .line 906
    .line 907
    invoke-virtual {v15}, Ll/bgw0;->v()I

    .line 908
    .line 909
    .line 910
    move-result v35

    .line 911
    move-object/from16 v45, v6

    .line 912
    .line 913
    move/from16 v6, v35

    .line 914
    .line 915
    :goto_18
    move/from16 v46, v7

    .line 916
    .line 917
    goto :goto_19

    .line 918
    :cond_23
    move-object/from16 v45, v6

    .line 919
    .line 920
    const/4 v6, 0x0

    .line 921
    goto :goto_18

    .line 922
    :goto_19
    int-to-long v6, v6

    .line 923
    add-long/2addr v6, v8

    .line 924
    sub-long v35, v6, v20

    .line 925
    .line 926
    const-wide/32 v37, 0xf4240

    .line 927
    .line 928
    .line 929
    sget-object v41, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 930
    .line 931
    invoke-static/range {v35 .. v41}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 932
    .line 933
    .line 934
    move-result-wide v6

    .line 935
    aput-wide v6, v43, v12

    .line 936
    .line 937
    move-wide/from16 v35, v6

    .line 938
    .line 939
    iget-boolean v6, v5, Ll/jnr0;->q:Z

    .line 940
    .line 941
    if-nez v6, :cond_24

    .line 942
    .line 943
    iget-object v6, v13, Ll/wmr0;->d:Ll/knr0;

    .line 944
    .line 945
    iget-wide v6, v6, Ll/knr0;->h:J

    .line 946
    .line 947
    add-long v6, v35, v6

    .line 948
    .line 949
    aput-wide v6, v43, v12

    .line 950
    .line 951
    :cond_24
    aput v44, v33, v12

    .line 952
    .line 953
    shr-int/lit8 v6, v46, 0x10

    .line 954
    .line 955
    const/4 v7, 0x1

    .line 956
    and-int/2addr v6, v7

    .line 957
    xor-int/2addr v6, v7

    .line 958
    if-eq v7, v6, :cond_25

    .line 959
    .line 960
    const/4 v6, 0x0

    .line 961
    goto :goto_1a

    .line 962
    :cond_25
    const/4 v6, 0x1

    .line 963
    :goto_1a
    aput-boolean v6, v34, v12

    .line 964
    .line 965
    int-to-long v6, v1

    .line 966
    add-long/2addr v8, v6

    .line 967
    add-int/lit8 v12, v12, 0x1

    .line 968
    .line 969
    move/from16 v7, v26

    .line 970
    .line 971
    move-object/from16 v6, v45

    .line 972
    .line 973
    goto/16 :goto_14

    .line 974
    .line 975
    :cond_26
    move/from16 v26, v7

    .line 976
    .line 977
    iput-wide v8, v5, Ll/jnr0;->p:J

    .line 978
    .line 979
    move v7, v14

    .line 980
    move/from16 v12, v26

    .line 981
    .line 982
    goto :goto_1b

    .line 983
    :cond_27
    move/from16 v23, v1

    .line 984
    .line 985
    move-object/from16 v24, v5

    .line 986
    .line 987
    move/from16 v25, v6

    .line 988
    .line 989
    move/from16 v26, v7

    .line 990
    .line 991
    move/from16 v27, v8

    .line 992
    .line 993
    :goto_1b
    add-int/lit8 v1, v23, 0x1

    .line 994
    .line 995
    move-object/from16 v5, v24

    .line 996
    .line 997
    move/from16 v6, v25

    .line 998
    .line 999
    move/from16 v8, v27

    .line 1000
    .line 1001
    const v9, 0x7472756e

    .line 1002
    .line 1003
    .line 1004
    goto/16 :goto_10

    .line 1005
    .line 1006
    :cond_28
    move/from16 v25, v6

    .line 1007
    .line 1008
    move/from16 v27, v8

    .line 1009
    .line 1010
    const/16 v22, 0x10

    .line 1011
    .line 1012
    iget-object v1, v13, Ll/wmr0;->d:Ll/knr0;

    .line 1013
    .line 1014
    iget-object v1, v1, Ll/knr0;->a:Ll/hnr0;

    .line 1015
    .line 1016
    iget-object v5, v4, Ll/jnr0;->a:Ll/imr0;

    .line 1017
    .line 1018
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1019
    .line 1020
    .line 1021
    iget v5, v5, Ll/imr0;->a:I

    .line 1022
    .line 1023
    invoke-virtual {v1, v5}, Ll/hnr0;->a(I)Ll/inr0;

    .line 1024
    .line 1025
    .line 1026
    move-result-object v1

    .line 1027
    const v5, 0x7361697a

    .line 1028
    .line 1029
    .line 1030
    invoke-virtual {v10, v5}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 1031
    .line 1032
    .line 1033
    move-result-object v5

    .line 1034
    if-eqz v5, :cond_2f

    .line 1035
    .line 1036
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1037
    .line 1038
    .line 1039
    iget-object v5, v5, Ll/ylr0;->b:Ll/bgw0;

    .line 1040
    .line 1041
    const/16 v9, 0x8

    .line 1042
    .line 1043
    invoke-virtual {v5, v9}, Ll/bgw0;->k(I)V

    .line 1044
    .line 1045
    .line 1046
    invoke-virtual {v5}, Ll/bgw0;->v()I

    .line 1047
    .line 1048
    .line 1049
    move-result v6

    .line 1050
    const/4 v7, 0x1

    .line 1051
    and-int/2addr v6, v7

    .line 1052
    if-ne v6, v7, :cond_29

    .line 1053
    .line 1054
    invoke-virtual {v5, v9}, Ll/bgw0;->l(I)V

    .line 1055
    .line 1056
    .line 1057
    :cond_29
    invoke-virtual {v5}, Ll/bgw0;->B()I

    .line 1058
    .line 1059
    .line 1060
    move-result v6

    .line 1061
    invoke-virtual {v5}, Ll/bgw0;->E()I

    .line 1062
    .line 1063
    .line 1064
    move-result v7

    .line 1065
    iget v8, v4, Ll/jnr0;->e:I

    .line 1066
    .line 1067
    if-gt v7, v8, :cond_2e

    .line 1068
    .line 1069
    iget v8, v1, Ll/inr0;->d:I

    .line 1070
    .line 1071
    if-nez v6, :cond_2c

    .line 1072
    .line 1073
    iget-object v6, v4, Ll/jnr0;->l:[Z

    .line 1074
    .line 1075
    const/4 v9, 0x0

    .line 1076
    const/4 v11, 0x0

    .line 1077
    :goto_1c
    if-ge v9, v7, :cond_2b

    .line 1078
    .line 1079
    invoke-virtual {v5}, Ll/bgw0;->B()I

    .line 1080
    .line 1081
    .line 1082
    move-result v12

    .line 1083
    add-int/2addr v11, v12

    .line 1084
    if-le v12, v8, :cond_2a

    .line 1085
    .line 1086
    const/4 v12, 0x1

    .line 1087
    goto :goto_1d

    .line 1088
    :cond_2a
    const/4 v12, 0x0

    .line 1089
    :goto_1d
    aput-boolean v12, v6, v9

    .line 1090
    .line 1091
    add-int/lit8 v9, v9, 0x1

    .line 1092
    .line 1093
    goto :goto_1c

    .line 1094
    :cond_2b
    const/4 v8, 0x0

    .line 1095
    goto :goto_1f

    .line 1096
    :cond_2c
    if-le v6, v8, :cond_2d

    .line 1097
    .line 1098
    const/4 v5, 0x1

    .line 1099
    goto :goto_1e

    .line 1100
    :cond_2d
    const/4 v5, 0x0

    .line 1101
    :goto_1e
    mul-int v11, v6, v7

    .line 1102
    .line 1103
    iget-object v6, v4, Ll/jnr0;->l:[Z

    .line 1104
    .line 1105
    const/4 v8, 0x0

    .line 1106
    invoke-static {v6, v8, v7, v5}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 1107
    .line 1108
    .line 1109
    :goto_1f
    iget-object v5, v4, Ll/jnr0;->l:[Z

    .line 1110
    .line 1111
    iget v6, v4, Ll/jnr0;->e:I

    .line 1112
    .line 1113
    invoke-static {v5, v7, v6, v8}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 1114
    .line 1115
    .line 1116
    if-lez v11, :cond_2f

    .line 1117
    .line 1118
    invoke-virtual {v4, v11}, Ll/jnr0;->a(I)V

    .line 1119
    .line 1120
    .line 1121
    goto :goto_20

    .line 1122
    :cond_2e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1123
    .line 1124
    const-string v1, "Saiz sample count "

    .line 1125
    .line 1126
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1127
    .line 1128
    .line 1129
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1130
    .line 1131
    .line 1132
    const-string v1, " is greater than fragment sample count"

    .line 1133
    .line 1134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1135
    .line 1136
    .line 1137
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1138
    .line 1139
    .line 1140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1141
    .line 1142
    .line 1143
    move-result-object v0

    .line 1144
    const/4 v1, 0x0

    .line 1145
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v0

    .line 1149
    throw v0

    .line 1150
    :cond_2f
    :goto_20
    const v5, 0x7361696f

    .line 1151
    .line 1152
    .line 1153
    invoke-virtual {v10, v5}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 1154
    .line 1155
    .line 1156
    move-result-object v5

    .line 1157
    if-eqz v5, :cond_32

    .line 1158
    .line 1159
    iget-object v5, v5, Ll/ylr0;->b:Ll/bgw0;

    .line 1160
    .line 1161
    const/16 v9, 0x8

    .line 1162
    .line 1163
    invoke-virtual {v5, v9}, Ll/bgw0;->k(I)V

    .line 1164
    .line 1165
    .line 1166
    invoke-virtual {v5}, Ll/bgw0;->v()I

    .line 1167
    .line 1168
    .line 1169
    move-result v6

    .line 1170
    and-int/lit8 v7, v6, 0x1

    .line 1171
    .line 1172
    const/4 v14, 0x1

    .line 1173
    if-ne v7, v14, :cond_30

    .line 1174
    .line 1175
    invoke-virtual {v5, v9}, Ll/bgw0;->l(I)V

    .line 1176
    .line 1177
    .line 1178
    :cond_30
    invoke-virtual {v5}, Ll/bgw0;->E()I

    .line 1179
    .line 1180
    .line 1181
    move-result v7

    .line 1182
    if-ne v7, v14, :cond_33

    .line 1183
    .line 1184
    invoke-static {v6}, Ll/zlr0;->a(I)I

    .line 1185
    .line 1186
    .line 1187
    move-result v6

    .line 1188
    iget-wide v7, v4, Ll/jnr0;->c:J

    .line 1189
    .line 1190
    if-nez v6, :cond_31

    .line 1191
    .line 1192
    invoke-virtual {v5}, Ll/bgw0;->J()J

    .line 1193
    .line 1194
    .line 1195
    move-result-wide v5

    .line 1196
    goto :goto_21

    .line 1197
    :cond_31
    invoke-virtual {v5}, Ll/bgw0;->K()J

    .line 1198
    .line 1199
    .line 1200
    move-result-wide v5

    .line 1201
    :goto_21
    add-long/2addr v7, v5

    .line 1202
    iput-wide v7, v4, Ll/jnr0;->c:J

    .line 1203
    .line 1204
    :cond_32
    const/4 v5, 0x0

    .line 1205
    goto :goto_22

    .line 1206
    :cond_33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1207
    .line 1208
    const-string v1, "Unexpected saio entry count: "

    .line 1209
    .line 1210
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1211
    .line 1212
    .line 1213
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1214
    .line 1215
    .line 1216
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1217
    .line 1218
    .line 1219
    move-result-object v0

    .line 1220
    const/4 v5, 0x0

    .line 1221
    invoke-static {v0, v5}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1222
    .line 1223
    .line 1224
    move-result-object v0

    .line 1225
    throw v0

    .line 1226
    :goto_22
    const v6, 0x73656e63

    .line 1227
    .line 1228
    .line 1229
    invoke-virtual {v10, v6}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 1230
    .line 1231
    .line 1232
    move-result-object v6

    .line 1233
    if-eqz v6, :cond_34

    .line 1234
    .line 1235
    iget-object v6, v6, Ll/ylr0;->b:Ll/bgw0;

    .line 1236
    .line 1237
    const/4 v8, 0x0

    .line 1238
    invoke-static {v6, v8, v4}, Ll/xmr0;->h(Ll/bgw0;ILl/jnr0;)V

    .line 1239
    .line 1240
    .line 1241
    :cond_34
    if-eqz v1, :cond_35

    .line 1242
    .line 1243
    iget-object v1, v1, Ll/inr0;->b:Ljava/lang/String;

    .line 1244
    .line 1245
    move-object/from16 v30, v1

    .line 1246
    .line 1247
    goto :goto_23

    .line 1248
    :cond_35
    move-object/from16 v30, v5

    .line 1249
    .line 1250
    :goto_23
    move-object v1, v5

    .line 1251
    move-object v6, v1

    .line 1252
    const/4 v7, 0x0

    .line 1253
    :goto_24
    iget-object v8, v10, Ll/xlr0;->c:Ljava/util/List;

    .line 1254
    .line 1255
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 1256
    .line 1257
    .line 1258
    move-result v8

    .line 1259
    if-ge v7, v8, :cond_38

    .line 1260
    .line 1261
    iget-object v8, v10, Ll/xlr0;->c:Ljava/util/List;

    .line 1262
    .line 1263
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1264
    .line 1265
    .line 1266
    move-result-object v8

    .line 1267
    check-cast v8, Ll/ylr0;

    .line 1268
    .line 1269
    iget-object v9, v8, Ll/ylr0;->b:Ll/bgw0;

    .line 1270
    .line 1271
    iget v8, v8, Ll/zlr0;->a:I

    .line 1272
    .line 1273
    const v11, 0x73626770

    .line 1274
    .line 1275
    .line 1276
    const v12, 0x73656967

    .line 1277
    .line 1278
    .line 1279
    if-ne v8, v11, :cond_36

    .line 1280
    .line 1281
    const/16 v11, 0xc

    .line 1282
    .line 1283
    invoke-virtual {v9, v11}, Ll/bgw0;->k(I)V

    .line 1284
    .line 1285
    .line 1286
    invoke-virtual {v9}, Ll/bgw0;->v()I

    .line 1287
    .line 1288
    .line 1289
    move-result v8

    .line 1290
    if-ne v8, v12, :cond_37

    .line 1291
    .line 1292
    move-object v1, v9

    .line 1293
    goto :goto_25

    .line 1294
    :cond_36
    const/16 v11, 0xc

    .line 1295
    .line 1296
    const v13, 0x73677064

    .line 1297
    .line 1298
    .line 1299
    if-ne v8, v13, :cond_37

    .line 1300
    .line 1301
    invoke-virtual {v9, v11}, Ll/bgw0;->k(I)V

    .line 1302
    .line 1303
    .line 1304
    invoke-virtual {v9}, Ll/bgw0;->v()I

    .line 1305
    .line 1306
    .line 1307
    move-result v8

    .line 1308
    if-ne v8, v12, :cond_37

    .line 1309
    .line 1310
    move-object v6, v9

    .line 1311
    :cond_37
    :goto_25
    add-int/lit8 v7, v7, 0x1

    .line 1312
    .line 1313
    goto :goto_24

    .line 1314
    :cond_38
    const/16 v11, 0xc

    .line 1315
    .line 1316
    if-eqz v1, :cond_39

    .line 1317
    .line 1318
    if-nez v6, :cond_3a

    .line 1319
    .line 1320
    :cond_39
    const/4 v14, 0x1

    .line 1321
    goto/16 :goto_28

    .line 1322
    .line 1323
    :cond_3a
    const/16 v9, 0x8

    .line 1324
    .line 1325
    invoke-virtual {v1, v9}, Ll/bgw0;->k(I)V

    .line 1326
    .line 1327
    .line 1328
    invoke-virtual {v1}, Ll/bgw0;->v()I

    .line 1329
    .line 1330
    .line 1331
    move-result v7

    .line 1332
    invoke-static {v7}, Ll/zlr0;->a(I)I

    .line 1333
    .line 1334
    .line 1335
    move-result v7

    .line 1336
    const/4 v8, 0x4

    .line 1337
    invoke-virtual {v1, v8}, Ll/bgw0;->l(I)V

    .line 1338
    .line 1339
    .line 1340
    const/4 v14, 0x1

    .line 1341
    if-ne v7, v14, :cond_3b

    .line 1342
    .line 1343
    invoke-virtual {v1, v8}, Ll/bgw0;->l(I)V

    .line 1344
    .line 1345
    .line 1346
    :cond_3b
    invoke-virtual {v1}, Ll/bgw0;->v()I

    .line 1347
    .line 1348
    .line 1349
    move-result v1

    .line 1350
    if-ne v1, v14, :cond_41

    .line 1351
    .line 1352
    invoke-virtual {v6, v9}, Ll/bgw0;->k(I)V

    .line 1353
    .line 1354
    .line 1355
    invoke-virtual {v6}, Ll/bgw0;->v()I

    .line 1356
    .line 1357
    .line 1358
    move-result v1

    .line 1359
    invoke-static {v1}, Ll/zlr0;->a(I)I

    .line 1360
    .line 1361
    .line 1362
    move-result v1

    .line 1363
    invoke-virtual {v6, v8}, Ll/bgw0;->l(I)V

    .line 1364
    .line 1365
    .line 1366
    if-ne v1, v14, :cond_3d

    .line 1367
    .line 1368
    invoke-virtual {v6}, Ll/bgw0;->J()J

    .line 1369
    .line 1370
    .line 1371
    move-result-wide v12

    .line 1372
    cmp-long v1, v12, v20

    .line 1373
    .line 1374
    if-eqz v1, :cond_3c

    .line 1375
    .line 1376
    goto :goto_26

    .line 1377
    :cond_3c
    const-string v0, "Variable length description in sgpd found (unsupported)"

    .line 1378
    .line 1379
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1380
    .line 1381
    .line 1382
    move-result-object v0

    .line 1383
    throw v0

    .line 1384
    :cond_3d
    const/4 v7, 0x2

    .line 1385
    if-lt v1, v7, :cond_3e

    .line 1386
    .line 1387
    invoke-virtual {v6, v8}, Ll/bgw0;->l(I)V

    .line 1388
    .line 1389
    .line 1390
    :cond_3e
    :goto_26
    invoke-virtual {v6}, Ll/bgw0;->J()J

    .line 1391
    .line 1392
    .line 1393
    move-result-wide v12

    .line 1394
    const-wide/16 v14, 0x1

    .line 1395
    .line 1396
    cmp-long v1, v12, v14

    .line 1397
    .line 1398
    if-nez v1, :cond_40

    .line 1399
    .line 1400
    const/4 v14, 0x1

    .line 1401
    invoke-virtual {v6, v14}, Ll/bgw0;->l(I)V

    .line 1402
    .line 1403
    .line 1404
    invoke-virtual {v6}, Ll/bgw0;->B()I

    .line 1405
    .line 1406
    .line 1407
    move-result v1

    .line 1408
    and-int/lit16 v7, v1, 0xf0

    .line 1409
    .line 1410
    shr-int/lit8 v33, v7, 0x4

    .line 1411
    .line 1412
    and-int/lit8 v34, v1, 0xf

    .line 1413
    .line 1414
    invoke-virtual {v6}, Ll/bgw0;->B()I

    .line 1415
    .line 1416
    .line 1417
    move-result v1

    .line 1418
    if-ne v1, v14, :cond_42

    .line 1419
    .line 1420
    invoke-virtual {v6}, Ll/bgw0;->B()I

    .line 1421
    .line 1422
    .line 1423
    move-result v31

    .line 1424
    move/from16 v1, v22

    .line 1425
    .line 1426
    new-array v7, v1, [B

    .line 1427
    .line 1428
    const/4 v8, 0x0

    .line 1429
    invoke-virtual {v6, v7, v8, v1}, Ll/bgw0;->g([BII)V

    .line 1430
    .line 1431
    .line 1432
    if-nez v31, :cond_3f

    .line 1433
    .line 1434
    invoke-virtual {v6}, Ll/bgw0;->B()I

    .line 1435
    .line 1436
    .line 1437
    move-result v1

    .line 1438
    new-array v9, v1, [B

    .line 1439
    .line 1440
    invoke-virtual {v6, v9, v8, v1}, Ll/bgw0;->g([BII)V

    .line 1441
    .line 1442
    .line 1443
    move-object/from16 v35, v9

    .line 1444
    .line 1445
    goto :goto_27

    .line 1446
    :cond_3f
    move-object/from16 v35, v5

    .line 1447
    .line 1448
    :goto_27
    iput-boolean v14, v4, Ll/jnr0;->k:Z

    .line 1449
    .line 1450
    new-instance v28, Ll/inr0;

    .line 1451
    .line 1452
    const/16 v29, 0x1

    .line 1453
    .line 1454
    move-object/from16 v32, v7

    .line 1455
    .line 1456
    invoke-direct/range {v28 .. v35}, Ll/inr0;-><init>(ZLjava/lang/String;I[BII[B)V

    .line 1457
    .line 1458
    .line 1459
    move-object/from16 v1, v28

    .line 1460
    .line 1461
    iput-object v1, v4, Ll/jnr0;->m:Ll/inr0;

    .line 1462
    .line 1463
    goto :goto_28

    .line 1464
    :cond_40
    const-string v0, "Entry count in sgpd != 1 (unsupported)."

    .line 1465
    .line 1466
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1467
    .line 1468
    .line 1469
    move-result-object v0

    .line 1470
    throw v0

    .line 1471
    :cond_41
    const-string v0, "Entry count in sbgp != 1 (unsupported)."

    .line 1472
    .line 1473
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1474
    .line 1475
    .line 1476
    move-result-object v0

    .line 1477
    throw v0

    .line 1478
    :cond_42
    :goto_28
    iget-object v1, v10, Ll/xlr0;->c:Ljava/util/List;

    .line 1479
    .line 1480
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 1481
    .line 1482
    .line 1483
    move-result v1

    .line 1484
    const/4 v5, 0x0

    .line 1485
    :goto_29
    if-ge v5, v1, :cond_45

    .line 1486
    .line 1487
    iget-object v6, v10, Ll/xlr0;->c:Ljava/util/List;

    .line 1488
    .line 1489
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1490
    .line 1491
    .line 1492
    move-result-object v6

    .line 1493
    check-cast v6, Ll/ylr0;

    .line 1494
    .line 1495
    iget v7, v6, Ll/zlr0;->a:I

    .line 1496
    .line 1497
    const v8, 0x75756964

    .line 1498
    .line 1499
    .line 1500
    if-ne v7, v8, :cond_43

    .line 1501
    .line 1502
    iget-object v6, v6, Ll/ylr0;->b:Ll/bgw0;

    .line 1503
    .line 1504
    const/16 v9, 0x8

    .line 1505
    .line 1506
    invoke-virtual {v6, v9}, Ll/bgw0;->k(I)V

    .line 1507
    .line 1508
    .line 1509
    const/16 v7, 0x10

    .line 1510
    .line 1511
    const/4 v8, 0x0

    .line 1512
    invoke-virtual {v6, v3, v8, v7}, Ll/bgw0;->g([BII)V

    .line 1513
    .line 1514
    .line 1515
    sget-object v12, Ll/xmr0;->G:[B

    .line 1516
    .line 1517
    invoke-static {v3, v12}, Ljava/util/Arrays;->equals([B[B)Z

    .line 1518
    .line 1519
    .line 1520
    move-result v12

    .line 1521
    if-eqz v12, :cond_44

    .line 1522
    .line 1523
    invoke-static {v6, v7, v4}, Ll/xmr0;->h(Ll/bgw0;ILl/jnr0;)V

    .line 1524
    .line 1525
    .line 1526
    goto :goto_2a

    .line 1527
    :cond_43
    const/16 v7, 0x10

    .line 1528
    .line 1529
    const/4 v8, 0x0

    .line 1530
    const/16 v9, 0x8

    .line 1531
    .line 1532
    :cond_44
    :goto_2a
    add-int/lit8 v5, v5, 0x1

    .line 1533
    .line 1534
    goto :goto_29

    .line 1535
    :cond_45
    const/4 v8, 0x0

    .line 1536
    const/16 v9, 0x8

    .line 1537
    .line 1538
    goto :goto_2b

    .line 1539
    :cond_46
    move-object/from16 v19, v1

    .line 1540
    .line 1541
    move/from16 v25, v6

    .line 1542
    .line 1543
    move v9, v7

    .line 1544
    move/from16 v27, v8

    .line 1545
    .line 1546
    const/4 v8, 0x0

    .line 1547
    const/16 v11, 0xc

    .line 1548
    .line 1549
    const/4 v14, 0x1

    .line 1550
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 1551
    .line 1552
    .line 1553
    .line 1554
    .line 1555
    :goto_2b
    add-int/lit8 v1, v27, 0x1

    .line 1556
    .line 1557
    move v8, v1

    .line 1558
    move v7, v9

    .line 1559
    move-object/from16 v1, v19

    .line 1560
    .line 1561
    move/from16 v6, v25

    .line 1562
    .line 1563
    goto/16 :goto_6

    .line 1564
    .line 1565
    :cond_47
    const/4 v5, 0x0

    .line 1566
    const/4 v8, 0x0

    .line 1567
    const-wide v17, -0x7fffffffffffffffL    # -4.9E-324

    .line 1568
    .line 1569
    .line 1570
    .line 1571
    .line 1572
    iget-object v1, v2, Ll/xlr0;->c:Ljava/util/List;

    .line 1573
    .line 1574
    invoke-static {v1}, Ll/xmr0;->b(Ljava/util/List;)Lcom/google/android/gms/internal/ads/zzae;

    .line 1575
    .line 1576
    .line 1577
    move-result-object v1

    .line 1578
    if-eqz v1, :cond_49

    .line 1579
    .line 1580
    iget-object v2, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 1581
    .line 1582
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 1583
    .line 1584
    .line 1585
    move-result v2

    .line 1586
    move v3, v8

    .line 1587
    :goto_2c
    if-ge v3, v2, :cond_49

    .line 1588
    .line 1589
    iget-object v4, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 1590
    .line 1591
    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1592
    .line 1593
    .line 1594
    move-result-object v4

    .line 1595
    check-cast v4, Ll/wmr0;

    .line 1596
    .line 1597
    iget-object v6, v4, Ll/wmr0;->d:Ll/knr0;

    .line 1598
    .line 1599
    iget-object v6, v6, Ll/knr0;->a:Ll/hnr0;

    .line 1600
    .line 1601
    iget-object v7, v4, Ll/wmr0;->b:Ll/jnr0;

    .line 1602
    .line 1603
    iget-object v7, v7, Ll/jnr0;->a:Ll/imr0;

    .line 1604
    .line 1605
    sget v9, Ll/mpw0;->a:I

    .line 1606
    .line 1607
    iget v7, v7, Ll/imr0;->a:I

    .line 1608
    .line 1609
    invoke-virtual {v6, v7}, Ll/hnr0;->a(I)Ll/inr0;

    .line 1610
    .line 1611
    .line 1612
    move-result-object v6

    .line 1613
    if-eqz v6, :cond_48

    .line 1614
    .line 1615
    iget-object v6, v6, Ll/inr0;->b:Ljava/lang/String;

    .line 1616
    .line 1617
    goto :goto_2d

    .line 1618
    :cond_48
    move-object v6, v5

    .line 1619
    :goto_2d
    invoke-virtual {v1, v6}, Lcom/google/android/gms/internal/ads/zzae;->b(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzae;

    .line 1620
    .line 1621
    .line 1622
    move-result-object v6

    .line 1623
    iget-object v7, v4, Ll/wmr0;->d:Ll/knr0;

    .line 1624
    .line 1625
    iget-object v7, v7, Ll/knr0;->a:Ll/hnr0;

    .line 1626
    .line 1627
    iget-object v7, v7, Ll/hnr0;->f:Ll/sqr0;

    .line 1628
    .line 1629
    invoke-virtual {v7}, Ll/sqr0;->b()Ll/znr0;

    .line 1630
    .line 1631
    .line 1632
    move-result-object v7

    .line 1633
    invoke-virtual {v7, v6}, Ll/znr0;->e(Lcom/google/android/gms/internal/ads/zzae;)Ll/znr0;

    .line 1634
    .line 1635
    .line 1636
    invoke-virtual {v7}, Ll/znr0;->D()Ll/sqr0;

    .line 1637
    .line 1638
    .line 1639
    move-result-object v6

    .line 1640
    iget-object v4, v4, Ll/wmr0;->a:Ll/sgr0;

    .line 1641
    .line 1642
    invoke-interface {v4, v6}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 1643
    .line 1644
    .line 1645
    add-int/lit8 v3, v3, 0x1

    .line 1646
    .line 1647
    goto :goto_2c

    .line 1648
    :cond_49
    iget-wide v1, v0, Ll/xmr0;->t:J

    .line 1649
    .line 1650
    cmp-long v1, v1, v17

    .line 1651
    .line 1652
    if-eqz v1, :cond_0

    .line 1653
    .line 1654
    iget-object v1, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 1655
    .line 1656
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 1657
    .line 1658
    .line 1659
    move-result v1

    .line 1660
    move v10, v8

    .line 1661
    :goto_2e
    if-ge v10, v1, :cond_4c

    .line 1662
    .line 1663
    iget-object v2, v0, Ll/xmr0;->c:Landroid/util/SparseArray;

    .line 1664
    .line 1665
    invoke-virtual {v2, v10}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 1666
    .line 1667
    .line 1668
    move-result-object v2

    .line 1669
    check-cast v2, Ll/wmr0;

    .line 1670
    .line 1671
    iget-wide v3, v0, Ll/xmr0;->t:J

    .line 1672
    .line 1673
    iget v5, v2, Ll/wmr0;->f:I

    .line 1674
    .line 1675
    :goto_2f
    iget-object v6, v2, Ll/wmr0;->b:Ll/jnr0;

    .line 1676
    .line 1677
    iget v7, v6, Ll/jnr0;->e:I

    .line 1678
    .line 1679
    if-ge v5, v7, :cond_4b

    .line 1680
    .line 1681
    iget-object v7, v6, Ll/jnr0;->i:[J

    .line 1682
    .line 1683
    aget-wide v8, v7, v5

    .line 1684
    .line 1685
    cmp-long v7, v8, v3

    .line 1686
    .line 1687
    if-gtz v7, :cond_4b

    .line 1688
    .line 1689
    iget-object v6, v6, Ll/jnr0;->j:[Z

    .line 1690
    .line 1691
    aget-boolean v6, v6, v5

    .line 1692
    .line 1693
    if-eqz v6, :cond_4a

    .line 1694
    .line 1695
    iput v5, v2, Ll/wmr0;->i:I

    .line 1696
    .line 1697
    :cond_4a
    add-int/lit8 v5, v5, 0x1

    .line 1698
    .line 1699
    goto :goto_2f

    .line 1700
    :cond_4b
    add-int/lit8 v10, v10, 0x1

    .line 1701
    .line 1702
    goto :goto_2e

    .line 1703
    :cond_4c
    move-wide/from16 v2, v17

    .line 1704
    .line 1705
    iput-wide v2, v0, Ll/xmr0;->t:J

    .line 1706
    .line 1707
    goto/16 :goto_0

    .line 1708
    .line 1709
    :cond_4d
    iget-object v1, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 1710
    .line 1711
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 1712
    .line 1713
    .line 1714
    move-result v1

    .line 1715
    if-nez v1, :cond_0

    .line 1716
    .line 1717
    iget-object v1, v0, Ll/xmr0;->k:Ljava/util/ArrayDeque;

    .line 1718
    .line 1719
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 1720
    .line 1721
    .line 1722
    move-result-object v1

    .line 1723
    check-cast v1, Ll/xlr0;

    .line 1724
    .line 1725
    invoke-virtual {v1, v2}, Ll/xlr0;->e(Ll/xlr0;)V

    .line 1726
    .line 1727
    .line 1728
    goto/16 :goto_0

    .line 1729
    .line 1730
    :cond_4e
    invoke-virtual {v0}, Ll/xmr0;->g()V

    .line 1731
    .line 1732
    .line 1733
    return-void
.end method
