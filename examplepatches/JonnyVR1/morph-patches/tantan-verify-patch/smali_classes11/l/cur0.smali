.class public final Ll/cur0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final r:Ll/ifr0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ll/bgw0;

.field public final c:Landroid/util/SparseIntArray;

.field public final d:Ll/fur0;

.field public final e:Ll/vor0;

.field public final f:Landroid/util/SparseArray;

.field public final g:Landroid/util/SparseBooleanArray;

.field public final h:Landroid/util/SparseBooleanArray;

.field public final i:Ll/ytr0;

.field public j:Ll/xtr0;

.field public k:Ll/ser0;

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:I

.field public q:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/ztr0;->b:Ll/ztr0;

    .line 2
    .line 3
    sput-object v0, Ll/cur0;->r:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p0, 0x0

    .line 121
    throw p0
.end method

.method public constructor <init>(IILl/vor0;Ll/nnw0;Ll/fur0;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p5, p0, Ll/cur0;->d:Ll/fur0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/cur0;->e:Ll/vor0;

    .line 7
    .line 8
    invoke-static {p4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/cur0;->a:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ll/bgw0;

    .line 15
    .line 16
    const/16 p2, 0x24b8

    .line 17
    .line 18
    new-array p2, p2, [B

    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-direct {p1, p2, p3}, Ll/bgw0;-><init>([BI)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/cur0;->b:Ll/bgw0;

    .line 25
    .line 26
    new-instance p1, Landroid/util/SparseBooleanArray;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/cur0;->g:Landroid/util/SparseBooleanArray;

    .line 32
    .line 33
    new-instance p2, Landroid/util/SparseBooleanArray;

    .line 34
    .line 35
    invoke-direct {p2}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p2, p0, Ll/cur0;->h:Landroid/util/SparseBooleanArray;

    .line 39
    .line 40
    new-instance p2, Landroid/util/SparseArray;

    .line 41
    .line 42
    invoke-direct {p2}, Landroid/util/SparseArray;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p2, p0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 46
    .line 47
    new-instance p4, Landroid/util/SparseIntArray;

    .line 48
    .line 49
    invoke-direct {p4}, Landroid/util/SparseIntArray;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object p4, p0, Ll/cur0;->c:Landroid/util/SparseIntArray;

    .line 53
    .line 54
    new-instance p4, Ll/ytr0;

    .line 55
    .line 56
    const p5, 0x1b8a0

    .line 57
    .line 58
    .line 59
    invoke-direct {p4, p5}, Ll/ytr0;-><init>(I)V

    .line 60
    .line 61
    .line 62
    iput-object p4, p0, Ll/cur0;->i:Ll/ytr0;

    .line 63
    .line 64
    sget-object p4, Ll/ser0;->v0:Ll/ser0;

    .line 65
    .line 66
    iput-object p4, p0, Ll/cur0;->k:Ll/ser0;

    .line 67
    .line 68
    const/4 p4, -0x1

    .line 69
    iput p4, p0, Ll/cur0;->q:I

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->clear()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/util/SparseArray;->clear()V

    .line 75
    .line 76
    .line 77
    new-instance p1, Landroid/util/SparseArray;

    .line 78
    .line 79
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    move p4, p3

    .line 87
    :goto_0
    iget-object p5, p0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 88
    .line 89
    if-ge p4, p2, :cond_0

    .line 90
    .line 91
    invoke-virtual {p1, p4}, Landroid/util/SparseArray;->keyAt(I)I

    .line 92
    .line 93
    .line 94
    move-result p6

    .line 95
    invoke-virtual {p1, p4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/hur0;

    .line 100
    .line 101
    invoke-virtual {p5, p6, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    add-int/lit8 p4, p4, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    new-instance p1, Ll/jtr0;

    .line 108
    .line 109
    new-instance p2, Ll/aur0;

    .line 110
    .line 111
    invoke-direct {p2, p0}, Ll/aur0;-><init>(Ll/cur0;)V

    .line 112
    .line 113
    .line 114
    invoke-direct {p1, p2}, Ll/jtr0;-><init>(Ll/itr0;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p5, p3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static bridge synthetic a(Ll/cur0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/cur0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic b(Ll/cur0;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/cur0;)Landroid/util/SparseBooleanArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cur0;->g:Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic h(Ll/cur0;)Landroid/util/SparseBooleanArray;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cur0;->h:Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic i(Ll/cur0;)Ll/ser0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cur0;->k:Ll/ser0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic j(Ll/cur0;)Ll/fur0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cur0;->d:Ll/fur0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic k(Ll/cur0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cur0;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic l(Ll/cur0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cur0;->q:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic m(Ll/cur0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cur0;->l:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic n(Ll/cur0;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/cur0;->m:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/cur0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

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
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    if-ge v0, p1, :cond_2

    .line 12
    .line 13
    iget-object v3, p0, Ll/cur0;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Ll/nnw0;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/nnw0;->f()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    cmp-long v4, v4, v6

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/nnw0;->d()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    cmp-long v6, v4, v6

    .line 39
    .line 40
    if-eqz v6, :cond_1

    .line 41
    .line 42
    cmp-long v1, v4, v1

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    cmp-long v1, v4, p3

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    :cond_0
    invoke-virtual {v3, p3, p4}, Ll/nnw0;->i(J)V

    .line 51
    .line 52
    .line 53
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    cmp-long p1, p3, v1

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    iget-object p1, p0, Ll/cur0;->j:Ll/xtr0;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    invoke-virtual {p1, p3, p4}, Ll/ber0;->d(J)V

    .line 65
    .line 66
    .line 67
    :cond_3
    iget-object p1, p0, Ll/cur0;->b:Ll/bgw0;

    .line 68
    .line 69
    invoke-virtual {p1, p2}, Ll/bgw0;->h(I)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/cur0;->c:Landroid/util/SparseIntArray;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/util/SparseIntArray;->clear()V

    .line 75
    .line 76
    .line 77
    move p1, p2

    .line 78
    :goto_1
    iget-object p3, p0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 79
    .line 80
    invoke-virtual {p3}, Landroid/util/SparseArray;->size()I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    if-ge p1, p3, :cond_4

    .line 85
    .line 86
    iget-object p3, p0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 87
    .line 88
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    check-cast p3, Ll/hur0;

    .line 93
    .line 94
    invoke-interface {p3}, Ll/hur0;->zzc()V

    .line 95
    .line 96
    .line 97
    add-int/lit8 p1, p1, 0x1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    iput p2, p0, Ll/cur0;->p:I

    .line 101
    .line 102
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cur0;->b:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p1, Ll/fer0;

    .line 8
    .line 9
    const/16 v0, 0x3ac

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, p0, v1, v0, v1}, Ll/fer0;->c([BIIZ)Z

    .line 13
    .line 14
    .line 15
    move v0, v1

    .line 16
    :goto_0
    const/16 v2, 0xbc

    .line 17
    .line 18
    if-ge v0, v2, :cond_2

    .line 19
    .line 20
    move v2, v1

    .line 21
    :goto_1
    const/4 v3, 0x5

    .line 22
    if-ge v2, v3, :cond_1

    .line 23
    .line 24
    mul-int/lit16 v3, v2, 0xbc

    .line 25
    .line 26
    add-int/2addr v3, v0

    .line 27
    aget-byte v3, p0, v3

    .line 28
    .line 29
    const/16 v4, 0x47

    .line 30
    .line 31
    if-eq v3, v4, :cond_0

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p1, v0, v1}, Ll/fer0;->k(IZ)Z

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_2
    return v1
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cur0;->k:Ll/ser0;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 19
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
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 8
    .line 9
    .line 10
    move-result-wide v7

    .line 11
    iget-boolean v3, v0, Ll/cur0;->m:Z

    .line 12
    .line 13
    const-wide/16 v11, -0x1

    .line 14
    .line 15
    const/4 v13, 0x1

    .line 16
    const/4 v14, 0x0

    .line 17
    if-eqz v3, :cond_7

    .line 18
    .line 19
    cmp-long v3, v7, v11

    .line 20
    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    iget-object v3, v0, Ll/cur0;->i:Ll/ytr0;

    .line 24
    .line 25
    invoke-virtual {v3}, Ll/ytr0;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget v0, v0, Ll/cur0;->q:I

    .line 33
    .line 34
    invoke-virtual {v3, v1, v2, v0}, Ll/ytr0;->a(Ll/qer0;Ll/yfr0;I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    return v0

    .line 39
    :cond_1
    :goto_0
    iget-boolean v3, v0, Ll/cur0;->n:Z

    .line 40
    .line 41
    const-wide/16 v4, 0x0

    .line 42
    .line 43
    if-nez v3, :cond_3

    .line 44
    .line 45
    iput-boolean v13, v0, Ll/cur0;->n:Z

    .line 46
    .line 47
    iget-object v3, v0, Ll/cur0;->i:Ll/ytr0;

    .line 48
    .line 49
    invoke-virtual {v3}, Ll/ytr0;->b()J

    .line 50
    .line 51
    .line 52
    move-result-wide v9

    .line 53
    const-wide v15, -0x7fffffffffffffffL    # -4.9E-324

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    cmp-long v6, v9, v15

    .line 59
    .line 60
    if-eqz v6, :cond_2

    .line 61
    .line 62
    move-object v6, v3

    .line 63
    new-instance v3, Ll/xtr0;

    .line 64
    .line 65
    move-wide v9, v4

    .line 66
    invoke-virtual {v6}, Ll/ytr0;->c()Ll/nnw0;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v6}, Ll/ytr0;->b()J

    .line 71
    .line 72
    .line 73
    move-result-wide v5

    .line 74
    move-wide v15, v9

    .line 75
    iget v9, v0, Ll/cur0;->q:I

    .line 76
    .line 77
    const v10, 0x1b8a0

    .line 78
    .line 79
    .line 80
    move-wide/from16 v17, v11

    .line 81
    .line 82
    move-wide v11, v15

    .line 83
    invoke-direct/range {v3 .. v10}, Ll/xtr0;-><init>(Ll/nnw0;JJII)V

    .line 84
    .line 85
    .line 86
    iput-object v3, v0, Ll/cur0;->j:Ll/xtr0;

    .line 87
    .line 88
    iget-object v4, v0, Ll/cur0;->k:Ll/ser0;

    .line 89
    .line 90
    invoke-virtual {v3}, Ll/ber0;->b()Ll/bgr0;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-interface {v4, v3}, Ll/ser0;->j(Ll/bgr0;)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    move-object v6, v3

    .line 99
    move-wide/from16 v17, v11

    .line 100
    .line 101
    move-wide v11, v4

    .line 102
    iget-object v3, v0, Ll/cur0;->k:Ll/ser0;

    .line 103
    .line 104
    new-instance v4, Ll/agr0;

    .line 105
    .line 106
    invoke-virtual {v6}, Ll/ytr0;->b()J

    .line 107
    .line 108
    .line 109
    move-result-wide v5

    .line 110
    invoke-direct {v4, v5, v6, v11, v12}, Ll/agr0;-><init>(JJ)V

    .line 111
    .line 112
    .line 113
    invoke-interface {v3, v4}, Ll/ser0;->j(Ll/bgr0;)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    move-wide/from16 v17, v11

    .line 118
    .line 119
    move-wide v11, v4

    .line 120
    :goto_1
    iget-boolean v3, v0, Ll/cur0;->o:Z

    .line 121
    .line 122
    if-eqz v3, :cond_5

    .line 123
    .line 124
    iput-boolean v14, v0, Ll/cur0;->o:Z

    .line 125
    .line 126
    invoke-virtual {v0, v11, v12, v11, v12}, Ll/cur0;->c(JJ)V

    .line 127
    .line 128
    .line 129
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 130
    .line 131
    .line 132
    move-result-wide v3

    .line 133
    cmp-long v3, v3, v11

    .line 134
    .line 135
    if-nez v3, :cond_4

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_4
    iput-wide v11, v2, Ll/yfr0;->a:J

    .line 139
    .line 140
    return v13

    .line 141
    :cond_5
    :goto_2
    iget-object v3, v0, Ll/cur0;->j:Ll/xtr0;

    .line 142
    .line 143
    if-eqz v3, :cond_8

    .line 144
    .line 145
    invoke-virtual {v3}, Ll/ber0;->e()Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-nez v4, :cond_6

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_6
    invoke-virtual {v3, v1, v2}, Ll/ber0;->a(Ll/qer0;Ll/yfr0;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    return v0

    .line 157
    :cond_7
    move-wide/from16 v17, v11

    .line 158
    .line 159
    :cond_8
    :goto_3
    iget-object v2, v0, Ll/cur0;->b:Ll/bgw0;

    .line 160
    .line 161
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    invoke-virtual {v2}, Ll/bgw0;->s()I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    rsub-int v4, v4, 0x24b8

    .line 170
    .line 171
    const/16 v5, 0xbc

    .line 172
    .line 173
    if-lt v4, v5, :cond_9

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_9
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    if-lez v4, :cond_a

    .line 181
    .line 182
    invoke-virtual {v2}, Ll/bgw0;->s()I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    invoke-static {v3, v2, v3, v14, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 187
    .line 188
    .line 189
    :cond_a
    iget-object v2, v0, Ll/cur0;->b:Ll/bgw0;

    .line 190
    .line 191
    invoke-virtual {v2, v3, v4}, Ll/bgw0;->i([BI)V

    .line 192
    .line 193
    .line 194
    :goto_4
    iget-object v2, v0, Ll/cur0;->b:Ll/bgw0;

    .line 195
    .line 196
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    const/4 v6, -0x1

    .line 201
    if-ge v4, v5, :cond_e

    .line 202
    .line 203
    invoke-virtual {v2}, Ll/bgw0;->t()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    rsub-int v4, v2, 0x24b8

    .line 208
    .line 209
    invoke-interface {v1, v3, v2, v4}, Ll/qer0;->a([BII)I

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    if-ne v4, v6, :cond_d

    .line 214
    .line 215
    :goto_5
    iget-object v1, v0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 216
    .line 217
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-ge v14, v1, :cond_c

    .line 222
    .line 223
    iget-object v1, v0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 224
    .line 225
    invoke-virtual {v1, v14}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    check-cast v1, Ll/hur0;

    .line 230
    .line 231
    instance-of v2, v1, Ll/atr0;

    .line 232
    .line 233
    if-eqz v2, :cond_b

    .line 234
    .line 235
    new-instance v2, Ll/bgw0;

    .line 236
    .line 237
    invoke-direct {v2}, Ll/bgw0;-><init>()V

    .line 238
    .line 239
    .line 240
    invoke-interface {v1, v2, v13}, Ll/hur0;->b(Ll/bgw0;I)V

    .line 241
    .line 242
    .line 243
    :cond_b
    add-int/lit8 v14, v14, 0x1

    .line 244
    .line 245
    goto :goto_5

    .line 246
    :cond_c
    return v6

    .line 247
    :cond_d
    iget-object v6, v0, Ll/cur0;->b:Ll/bgw0;

    .line 248
    .line 249
    add-int/2addr v2, v4

    .line 250
    invoke-virtual {v6, v2}, Ll/bgw0;->j(I)V

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_e
    invoke-virtual {v2}, Ll/bgw0;->s()I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    invoke-virtual {v2}, Ll/bgw0;->t()I

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-static {v2, v1, v3}, Ll/iur0;->a([BII)I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    iget-object v4, v0, Ll/cur0;->b:Ll/bgw0;

    .line 271
    .line 272
    invoke-virtual {v4, v2}, Ll/bgw0;->k(I)V

    .line 273
    .line 274
    .line 275
    add-int/lit16 v4, v2, 0xbc

    .line 276
    .line 277
    if-le v4, v3, :cond_f

    .line 278
    .line 279
    iget v3, v0, Ll/cur0;->p:I

    .line 280
    .line 281
    sub-int/2addr v2, v1

    .line 282
    add-int/2addr v3, v2

    .line 283
    iput v3, v0, Ll/cur0;->p:I

    .line 284
    .line 285
    goto :goto_6

    .line 286
    :cond_f
    iput v14, v0, Ll/cur0;->p:I

    .line 287
    .line 288
    :goto_6
    iget-object v1, v0, Ll/cur0;->b:Ll/bgw0;

    .line 289
    .line 290
    invoke-virtual {v1}, Ll/bgw0;->t()I

    .line 291
    .line 292
    .line 293
    move-result v2

    .line 294
    if-le v4, v2, :cond_10

    .line 295
    .line 296
    return v14

    .line 297
    :cond_10
    invoke-virtual {v1}, Ll/bgw0;->v()I

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    const/high16 v3, 0x800000

    .line 302
    .line 303
    and-int/2addr v3, v1

    .line 304
    if-eqz v3, :cond_11

    .line 305
    .line 306
    iget-object v0, v0, Ll/cur0;->b:Ll/bgw0;

    .line 307
    .line 308
    invoke-virtual {v0, v4}, Ll/bgw0;->k(I)V

    .line 309
    .line 310
    .line 311
    return v14

    .line 312
    :cond_11
    const/high16 v3, 0x400000

    .line 313
    .line 314
    and-int/2addr v3, v1

    .line 315
    if-eqz v3, :cond_12

    .line 316
    .line 317
    move v3, v13

    .line 318
    goto :goto_7

    .line 319
    :cond_12
    move v3, v14

    .line 320
    :goto_7
    shr-int/lit8 v5, v1, 0x8

    .line 321
    .line 322
    and-int/lit8 v9, v1, 0x20

    .line 323
    .line 324
    and-int/lit8 v10, v1, 0x10

    .line 325
    .line 326
    and-int/lit16 v5, v5, 0x1fff

    .line 327
    .line 328
    if-eqz v10, :cond_13

    .line 329
    .line 330
    iget-object v10, v0, Ll/cur0;->f:Landroid/util/SparseArray;

    .line 331
    .line 332
    invoke-virtual {v10, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v10

    .line 336
    check-cast v10, Ll/hur0;

    .line 337
    .line 338
    goto :goto_8

    .line 339
    :cond_13
    const/4 v10, 0x0

    .line 340
    :goto_8
    if-nez v10, :cond_14

    .line 341
    .line 342
    iget-object v0, v0, Ll/cur0;->b:Ll/bgw0;

    .line 343
    .line 344
    invoke-virtual {v0, v4}, Ll/bgw0;->k(I)V

    .line 345
    .line 346
    .line 347
    return v14

    .line 348
    :cond_14
    and-int/lit8 v1, v1, 0xf

    .line 349
    .line 350
    iget-object v11, v0, Ll/cur0;->c:Landroid/util/SparseIntArray;

    .line 351
    .line 352
    add-int/lit8 v12, v1, -0x1

    .line 353
    .line 354
    invoke-virtual {v11, v5, v12}, Landroid/util/SparseIntArray;->get(II)I

    .line 355
    .line 356
    .line 357
    move-result v11

    .line 358
    iget-object v12, v0, Ll/cur0;->c:Landroid/util/SparseIntArray;

    .line 359
    .line 360
    invoke-virtual {v12, v5, v1}, Landroid/util/SparseIntArray;->put(II)V

    .line 361
    .line 362
    .line 363
    if-ne v11, v1, :cond_15

    .line 364
    .line 365
    iget-object v0, v0, Ll/cur0;->b:Ll/bgw0;

    .line 366
    .line 367
    invoke-virtual {v0, v4}, Ll/bgw0;->k(I)V

    .line 368
    .line 369
    .line 370
    return v14

    .line 371
    :cond_15
    add-int/2addr v11, v13

    .line 372
    and-int/lit8 v11, v11, 0xf

    .line 373
    .line 374
    if-eq v1, v11, :cond_16

    .line 375
    .line 376
    invoke-interface {v10}, Ll/hur0;->zzc()V

    .line 377
    .line 378
    .line 379
    :cond_16
    if-eqz v9, :cond_18

    .line 380
    .line 381
    iget-object v1, v0, Ll/cur0;->b:Ll/bgw0;

    .line 382
    .line 383
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 384
    .line 385
    .line 386
    move-result v9

    .line 387
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    and-int/lit8 v1, v1, 0x40

    .line 392
    .line 393
    if-eqz v1, :cond_17

    .line 394
    .line 395
    const/4 v1, 0x2

    .line 396
    goto :goto_9

    .line 397
    :cond_17
    move v1, v14

    .line 398
    :goto_9
    or-int/2addr v3, v1

    .line 399
    iget-object v1, v0, Ll/cur0;->b:Ll/bgw0;

    .line 400
    .line 401
    add-int/2addr v9, v6

    .line 402
    invoke-virtual {v1, v9}, Ll/bgw0;->l(I)V

    .line 403
    .line 404
    .line 405
    :cond_18
    iget-boolean v1, v0, Ll/cur0;->m:Z

    .line 406
    .line 407
    if-nez v1, :cond_19

    .line 408
    .line 409
    iget-object v6, v0, Ll/cur0;->h:Landroid/util/SparseBooleanArray;

    .line 410
    .line 411
    invoke-virtual {v6, v5, v14}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    .line 412
    .line 413
    .line 414
    move-result v5

    .line 415
    if-nez v5, :cond_1a

    .line 416
    .line 417
    :cond_19
    iget-object v5, v0, Ll/cur0;->b:Ll/bgw0;

    .line 418
    .line 419
    invoke-virtual {v5, v4}, Ll/bgw0;->j(I)V

    .line 420
    .line 421
    .line 422
    iget-object v5, v0, Ll/cur0;->b:Ll/bgw0;

    .line 423
    .line 424
    invoke-interface {v10, v5, v3}, Ll/hur0;->b(Ll/bgw0;I)V

    .line 425
    .line 426
    .line 427
    iget-object v3, v0, Ll/cur0;->b:Ll/bgw0;

    .line 428
    .line 429
    invoke-virtual {v3, v2}, Ll/bgw0;->j(I)V

    .line 430
    .line 431
    .line 432
    if-nez v1, :cond_1b

    .line 433
    .line 434
    :cond_1a
    iget-boolean v1, v0, Ll/cur0;->m:Z

    .line 435
    .line 436
    if-eqz v1, :cond_1b

    .line 437
    .line 438
    cmp-long v1, v7, v17

    .line 439
    .line 440
    if-eqz v1, :cond_1b

    .line 441
    .line 442
    iput-boolean v13, v0, Ll/cur0;->o:Z

    .line 443
    .line 444
    :cond_1b
    iget-object v0, v0, Ll/cur0;->b:Ll/bgw0;

    .line 445
    .line 446
    invoke-virtual {v0, v4}, Ll/bgw0;->k(I)V

    .line 447
    .line 448
    .line 449
    return v14
.end method
