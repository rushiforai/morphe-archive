.class public Ll/d6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/d6j$b;,
        Ll/d6j$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final I:Ll/esf;

.field public static final J:[B

.field public static final K:Lcom/google/android/exoplayer2/k;


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:Z

.field public E:Ll/bsf;

.field public F:[Ll/qfj0;

.field public G:[Ll/qfj0;

.field public H:Z

.field public final a:I

.field public final b:Ll/yej0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/d6j$b;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/ig60;

.field public final f:Ll/ig60;

.field public final g:Ll/ig60;

.field public final h:[B

.field public final i:Ll/ig60;

.field public final j:Ll/h0j0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final k:Ll/d5f;

.field public final l:Ll/ig60;

.field public final m:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ll/f31$a;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ll/d6j$a;",
            ">;"
        }
    .end annotation
.end field

.field public final o:Ll/qfj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:I

.field public q:I

.field public r:J

.field public s:I

.field public t:Ll/ig60;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public u:J

.field public v:I

.field public w:J

.field public x:J

.field public y:J

.field public z:Ll/d6j$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/b6j;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b6j;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/d6j;->I:Ll/esf;

    .line 7
    .line 8
    const/16 v0, 0x10

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/d6j;->J:[B

    .line 16
    .line 17
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v1, "application/x-emsg"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sput-object v0, Ll/d6j;->K:Lcom/google/android/exoplayer2/k;

    .line 33
    .line 34
    return-void

    .line 35
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
    .locals 1

    const/4 v0, 0x0

    .line 119
    invoke-direct {p0, v0}, Ll/d6j;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 115
    invoke-direct {p0, p1, v0}, Ll/d6j;-><init>(ILl/h0j0;)V

    return-void
.end method

.method public constructor <init>(ILl/h0j0;)V
    .locals 2
    .param p2    # Ll/h0j0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 116
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, p1, p2, v0, v1}, Ll/d6j;-><init>(ILl/h0j0;Ll/yej0;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(ILl/h0j0;Ll/yej0;)V
    .locals 1
    .param p2    # Ll/h0j0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/yej0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 117
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0, p1, p2, p3, v0}, Ll/d6j;-><init>(ILl/h0j0;Ll/yej0;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(ILl/h0j0;Ll/yej0;Ljava/util/List;)V
    .locals 6
    .param p2    # Ll/h0j0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/yej0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/h0j0;",
            "Ll/yej0;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 118
    invoke-direct/range {v0 .. v5}, Ll/d6j;-><init>(ILl/h0j0;Ll/yej0;Ljava/util/List;Ll/qfj0;)V

    return-void
.end method

.method public constructor <init>(ILl/h0j0;Ll/yej0;Ljava/util/List;Ll/qfj0;)V
    .locals 0
    .param p2    # Ll/h0j0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/yej0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/qfj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/h0j0;",
            "Ll/yej0;",
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/k;",
            ">;",
            "Ll/qfj0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/d6j;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/d6j;->j:Ll/h0j0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/d6j;->b:Ll/yej0;

    .line 9
    .line 10
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/d6j;->c:Ljava/util/List;

    .line 15
    .line 16
    iput-object p5, p0, Ll/d6j;->o:Ll/qfj0;

    .line 17
    .line 18
    new-instance p1, Ll/d5f;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/d5f;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/d6j;->k:Ll/d5f;

    .line 24
    .line 25
    new-instance p1, Ll/ig60;

    .line 26
    .line 27
    const/16 p2, 0x10

    .line 28
    .line 29
    invoke-direct {p1, p2}, Ll/ig60;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/d6j;->l:Ll/ig60;

    .line 33
    .line 34
    new-instance p1, Ll/ig60;

    .line 35
    .line 36
    sget-object p3, Ll/jb20;->a:[B

    .line 37
    .line 38
    invoke-direct {p1, p3}, Ll/ig60;-><init>([B)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/d6j;->e:Ll/ig60;

    .line 42
    .line 43
    new-instance p1, Ll/ig60;

    .line 44
    .line 45
    const/4 p3, 0x5

    .line 46
    invoke-direct {p1, p3}, Ll/ig60;-><init>(I)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/d6j;->f:Ll/ig60;

    .line 50
    .line 51
    new-instance p1, Ll/ig60;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/d6j;->g:Ll/ig60;

    .line 57
    .line 58
    new-array p1, p2, [B

    .line 59
    .line 60
    iput-object p1, p0, Ll/d6j;->h:[B

    .line 61
    .line 62
    new-instance p2, Ll/ig60;

    .line 63
    .line 64
    invoke-direct {p2, p1}, Ll/ig60;-><init>([B)V

    .line 65
    .line 66
    .line 67
    iput-object p2, p0, Ll/d6j;->i:Ll/ig60;

    .line 68
    .line 69
    new-instance p1, Ljava/util/ArrayDeque;

    .line 70
    .line 71
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 75
    .line 76
    new-instance p1, Ljava/util/ArrayDeque;

    .line 77
    .line 78
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 82
    .line 83
    new-instance p1, Landroid/util/SparseArray;

    .line 84
    .line 85
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 89
    .line 90
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    iput-wide p1, p0, Ll/d6j;->x:J

    .line 96
    .line 97
    iput-wide p1, p0, Ll/d6j;->w:J

    .line 98
    .line 99
    iput-wide p1, p0, Ll/d6j;->y:J

    .line 100
    .line 101
    sget-object p1, Ll/bsf;->i0:Ll/bsf;

    .line 102
    .line 103
    iput-object p1, p0, Ll/d6j;->E:Ll/bsf;

    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    new-array p2, p1, [Ll/qfj0;

    .line 107
    .line 108
    iput-object p2, p0, Ll/d6j;->F:[Ll/qfj0;

    .line 109
    .line 110
    new-array p1, p1, [Ll/qfj0;

    .line 111
    .line 112
    iput-object p1, p0, Ll/d6j;->G:[Ll/qfj0;

    .line 113
    .line 114
    return-void
.end method

.method public static A(Ll/ig60;J)Landroid/util/Pair;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            "J)",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Ll/r45;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ig60;->U(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ll/f31;->c(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x4

    .line 17
    invoke-virtual {v0, v2}, Ll/ig60;->V(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 21
    .line 22
    .line 23
    move-result-wide v7

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 31
    .line 32
    .line 33
    move-result-wide v5

    .line 34
    :goto_0
    add-long v5, p1, v5

    .line 35
    .line 36
    move-wide v9, v5

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {v0}, Ll/ig60;->M()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    invoke-virtual {v0}, Ll/ig60;->M()J

    .line 43
    .line 44
    .line 45
    move-result-wide v5

    .line 46
    goto :goto_0

    .line 47
    :goto_1
    const-wide/32 v5, 0xf4240

    .line 48
    .line 49
    .line 50
    invoke-static/range {v3 .. v8}, Ll/bmk0;->W0(JJJ)J

    .line 51
    .line 52
    .line 53
    move-result-wide v11

    .line 54
    const/4 v1, 0x2

    .line 55
    invoke-virtual {v0, v1}, Ll/ig60;->V(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ll/ig60;->N()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    new-array v13, v1, [I

    .line 63
    .line 64
    new-array v14, v1, [J

    .line 65
    .line 66
    new-array v15, v1, [J

    .line 67
    .line 68
    new-array v5, v1, [J

    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    move-wide/from16 v16, v9

    .line 72
    .line 73
    move-wide/from16 v18, v11

    .line 74
    .line 75
    move v9, v6

    .line 76
    :goto_2
    if-ge v9, v1, :cond_2

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    const/high16 v10, -0x80000000

    .line 83
    .line 84
    and-int/2addr v10, v6

    .line 85
    if-nez v10, :cond_1

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 88
    .line 89
    .line 90
    move-result-wide v20

    .line 91
    const v10, 0x7fffffff

    .line 92
    .line 93
    .line 94
    and-int/2addr v6, v10

    .line 95
    aput v6, v13, v9

    .line 96
    .line 97
    aput-wide v16, v14, v9

    .line 98
    .line 99
    aput-wide v18, v5, v9

    .line 100
    .line 101
    add-long v3, v3, v20

    .line 102
    .line 103
    move-object v10, v5

    .line 104
    const-wide/32 v5, 0xf4240

    .line 105
    .line 106
    .line 107
    invoke-static/range {v3 .. v8}, Ll/bmk0;->W0(JJJ)J

    .line 108
    .line 109
    .line 110
    move-result-wide v18

    .line 111
    aget-wide v5, v10, v9

    .line 112
    .line 113
    sub-long v5, v18, v5

    .line 114
    .line 115
    aput-wide v5, v15, v9

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ll/ig60;->V(I)V

    .line 118
    .line 119
    .line 120
    aget v5, v13, v9

    .line 121
    .line 122
    int-to-long v5, v5

    .line 123
    add-long v16, v16, v5

    .line 124
    .line 125
    add-int/lit8 v9, v9, 0x1

    .line 126
    .line 127
    move-object v5, v10

    .line 128
    goto :goto_2

    .line 129
    :cond_1
    const-string v0, "Unhandled indirect reference"

    .line 130
    .line 131
    const/4 v1, 0x0

    .line 132
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    throw v0

    .line 137
    :cond_2
    move-object v10, v5

    .line 138
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v1, Ll/r45;

    .line 143
    .line 144
    invoke-direct {v1, v13, v14, v15, v10}, Ll/r45;-><init>([I[J[J[J)V

    .line 145
    .line 146
    .line 147
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    return-object v0
.end method

.method public static B(Ll/ig60;)J
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ll/f31;->c(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ig60;->M()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    return-wide v0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    return-wide v0
.end method

.method public static C(Ll/ig60;Landroid/util/SparseArray;Z)Ll/d6j$b;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            "Landroid/util/SparseArray<",
            "Ll/d6j$b;",
            ">;Z)",
            "Ll/d6j$b;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ll/f31;->b(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    check-cast p1, Ll/d6j$b;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    if-nez p1, :cond_1

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :cond_1
    and-int/lit8 p2, v0, 0x1

    .line 38
    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ig60;->M()J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    iget-object p2, p1, Ll/d6j$b;->b:Ll/bfj0;

    .line 46
    .line 47
    iput-wide v1, p2, Ll/bfj0;->c:J

    .line 48
    .line 49
    iput-wide v1, p2, Ll/bfj0;->d:J

    .line 50
    .line 51
    :cond_2
    iget-object p2, p1, Ll/d6j$b;->e:Ll/asd;

    .line 52
    .line 53
    and-int/lit8 v1, v0, 0x2

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/lit8 v1, v1, -0x1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_3
    iget v1, p2, Ll/asd;->a:I

    .line 65
    .line 66
    :goto_2
    and-int/lit8 v2, v0, 0x8

    .line 67
    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    goto :goto_3

    .line 75
    :cond_4
    iget v2, p2, Ll/asd;->b:I

    .line 76
    .line 77
    :goto_3
    and-int/lit8 v3, v0, 0x10

    .line 78
    .line 79
    if-eqz v3, :cond_5

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    goto :goto_4

    .line 86
    :cond_5
    iget v3, p2, Ll/asd;->c:I

    .line 87
    .line 88
    :goto_4
    and-int/lit8 v0, v0, 0x20

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    goto :goto_5

    .line 97
    :cond_6
    iget p0, p2, Ll/asd;->d:I

    .line 98
    .line 99
    :goto_5
    iget-object p2, p1, Ll/d6j$b;->b:Ll/bfj0;

    .line 100
    .line 101
    new-instance v0, Ll/asd;

    .line 102
    .line 103
    invoke-direct {v0, v1, v2, v3, p0}, Ll/asd;-><init>(IIII)V

    .line 104
    .line 105
    .line 106
    iput-object v0, p2, Ll/bfj0;->a:Ll/asd;

    .line 107
    .line 108
    return-object p1
.end method

.method public static D(Ll/f31$a;Landroid/util/SparseArray;ZI[B)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f31$a;",
            "Landroid/util/SparseArray<",
            "Ll/d6j$b;",
            ">;ZI[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const v0, 0x74666864

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/f31$b;

    .line 13
    .line 14
    iget-object v0, v0, Ll/f31$b;->b:Ll/ig60;

    .line 15
    .line 16
    invoke-static {v0, p1, p2}, Ll/d6j;->C(Ll/ig60;Landroid/util/SparseArray;Z)Ll/d6j$b;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_3

    .line 23
    .line 24
    :cond_0
    iget-object p2, p1, Ll/d6j$b;->b:Ll/bfj0;

    .line 25
    .line 26
    iget-wide v0, p2, Ll/bfj0;->q:J

    .line 27
    .line 28
    iget-boolean v2, p2, Ll/bfj0;->r:Z

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/d6j$b;->k()V

    .line 31
    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-static {p1, v3}, Ll/d6j$b;->b(Ll/d6j$b;Z)Z

    .line 35
    .line 36
    .line 37
    const v4, 0x74666474

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v4}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    and-int/lit8 v5, p3, 0x2

    .line 47
    .line 48
    if-nez v5, :cond_1

    .line 49
    .line 50
    iget-object v0, v4, Ll/f31$b;->b:Ll/ig60;

    .line 51
    .line 52
    invoke-static {v0}, Ll/d6j;->B(Ll/ig60;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iput-wide v0, p2, Ll/bfj0;->q:J

    .line 57
    .line 58
    iput-boolean v3, p2, Ll/bfj0;->r:Z

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iput-wide v0, p2, Ll/bfj0;->q:J

    .line 62
    .line 63
    iput-boolean v2, p2, Ll/bfj0;->r:Z

    .line 64
    .line 65
    :goto_0
    invoke-static {p0, p1, p3}, Ll/d6j;->G(Ll/f31$a;Ll/d6j$b;I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p1, Ll/d6j$b;->d:Ll/ufj0;

    .line 69
    .line 70
    iget-object p1, p1, Ll/ufj0;->a:Ll/yej0;

    .line 71
    .line 72
    iget-object p3, p2, Ll/bfj0;->a:Ll/asd;

    .line 73
    .line 74
    invoke-static {p3}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    check-cast p3, Ll/asd;

    .line 79
    .line 80
    iget p3, p3, Ll/asd;->a:I

    .line 81
    .line 82
    invoke-virtual {p1, p3}, Ll/yej0;->a(I)Ll/zej0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const p3, 0x7361697a

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p3}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    if-eqz p3, :cond_2

    .line 94
    .line 95
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/zej0;

    .line 100
    .line 101
    iget-object p3, p3, Ll/f31$b;->b:Ll/ig60;

    .line 102
    .line 103
    invoke-static {v0, p3, p2}, Ll/d6j;->w(Ll/zej0;Ll/ig60;Ll/bfj0;)V

    .line 104
    .line 105
    .line 106
    :cond_2
    const p3, 0x7361696f

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p3}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    if-eqz p3, :cond_3

    .line 114
    .line 115
    iget-object p3, p3, Ll/f31$b;->b:Ll/ig60;

    .line 116
    .line 117
    invoke-static {p3, p2}, Ll/d6j;->v(Ll/ig60;Ll/bfj0;)V

    .line 118
    .line 119
    .line 120
    :cond_3
    const p3, 0x73656e63

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p3}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    if-eqz p3, :cond_4

    .line 128
    .line 129
    iget-object p3, p3, Ll/f31$b;->b:Ll/ig60;

    .line 130
    .line 131
    invoke-static {p3, p2}, Ll/d6j;->z(Ll/ig60;Ll/bfj0;)V

    .line 132
    .line 133
    .line 134
    :cond_4
    if-eqz p1, :cond_5

    .line 135
    .line 136
    iget-object p1, p1, Ll/zej0;->b:Ljava/lang/String;

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_5
    const/4 p1, 0x0

    .line 140
    :goto_1
    invoke-static {p0, p1, p2}, Ll/d6j;->x(Ll/f31$a;Ljava/lang/String;Ll/bfj0;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/f31$a;->c:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    const/4 p3, 0x0

    .line 150
    :goto_2
    if-ge p3, p1, :cond_7

    .line 151
    .line 152
    iget-object v0, p0, Ll/f31$a;->c:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ll/f31$b;

    .line 159
    .line 160
    iget v1, v0, Ll/f31;->a:I

    .line 161
    .line 162
    const v2, 0x75756964

    .line 163
    .line 164
    .line 165
    if-ne v1, v2, :cond_6

    .line 166
    .line 167
    iget-object v0, v0, Ll/f31$b;->b:Ll/ig60;

    .line 168
    .line 169
    invoke-static {v0, p2, p4}, Ll/d6j;->H(Ll/ig60;Ll/bfj0;[B)V

    .line 170
    .line 171
    .line 172
    :cond_6
    add-int/lit8 p3, p3, 0x1

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_7
    :goto_3
    return-void
.end method

.method public static E(Ll/ig60;)Landroid/util/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ig60;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/asd;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/lit8 v1, v1, -0x1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v4, Ll/asd;

    .line 33
    .line 34
    invoke-direct {v4, v1, v2, v3, p0}, Ll/asd;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static F(Ll/d6j$b;IILl/ig60;I)I
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v2, v1}, Ll/ig60;->U(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2}, Ll/ig60;->q()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ll/f31;->b(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iget-object v3, v0, Ll/d6j$b;->d:Ll/ufj0;

    .line 19
    .line 20
    iget-object v3, v3, Ll/ufj0;->a:Ll/yej0;

    .line 21
    .line 22
    iget-object v4, v0, Ll/d6j$b;->b:Ll/bfj0;

    .line 23
    .line 24
    iget-object v5, v4, Ll/bfj0;->a:Ll/asd;

    .line 25
    .line 26
    invoke-static {v5}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    check-cast v5, Ll/asd;

    .line 31
    .line 32
    iget-object v6, v4, Ll/bfj0;->h:[I

    .line 33
    .line 34
    invoke-virtual {v2}, Ll/ig60;->L()I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    aput v7, v6, p1

    .line 39
    .line 40
    iget-object v6, v4, Ll/bfj0;->g:[J

    .line 41
    .line 42
    iget-wide v7, v4, Ll/bfj0;->c:J

    .line 43
    .line 44
    aput-wide v7, v6, p1

    .line 45
    .line 46
    and-int/lit8 v9, v1, 0x1

    .line 47
    .line 48
    if-eqz v9, :cond_0

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/ig60;->q()I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    int-to-long v9, v9

    .line 55
    add-long/2addr v7, v9

    .line 56
    aput-wide v7, v6, p1

    .line 57
    .line 58
    :cond_0
    and-int/lit8 v6, v1, 0x4

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    if-eqz v6, :cond_1

    .line 62
    .line 63
    const/4 v6, 0x1

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    move v6, v7

    .line 66
    :goto_0
    iget v9, v5, Ll/asd;->d:I

    .line 67
    .line 68
    if-eqz v6, :cond_2

    .line 69
    .line 70
    invoke-virtual {v2}, Ll/ig60;->q()I

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    :cond_2
    and-int/lit16 v10, v1, 0x100

    .line 75
    .line 76
    if-eqz v10, :cond_3

    .line 77
    .line 78
    const/4 v10, 0x1

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    move v10, v7

    .line 81
    :goto_1
    and-int/lit16 v11, v1, 0x200

    .line 82
    .line 83
    if-eqz v11, :cond_4

    .line 84
    .line 85
    const/4 v11, 0x1

    .line 86
    goto :goto_2

    .line 87
    :cond_4
    move v11, v7

    .line 88
    :goto_2
    and-int/lit16 v12, v1, 0x400

    .line 89
    .line 90
    if-eqz v12, :cond_5

    .line 91
    .line 92
    const/4 v12, 0x1

    .line 93
    goto :goto_3

    .line 94
    :cond_5
    move v12, v7

    .line 95
    :goto_3
    and-int/lit16 v1, v1, 0x800

    .line 96
    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    const/4 v1, 0x1

    .line 100
    goto :goto_4

    .line 101
    :cond_6
    move v1, v7

    .line 102
    :goto_4
    invoke-static {v3}, Ll/d6j;->l(Ll/yej0;)Z

    .line 103
    .line 104
    .line 105
    move-result v13

    .line 106
    if-eqz v13, :cond_7

    .line 107
    .line 108
    iget-object v13, v3, Ll/yej0;->i:[J

    .line 109
    .line 110
    invoke-static {v13}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v13

    .line 114
    check-cast v13, [J

    .line 115
    .line 116
    aget-wide v14, v13, v7

    .line 117
    .line 118
    goto :goto_5

    .line 119
    :cond_7
    const-wide/16 v14, 0x0

    .line 120
    .line 121
    :goto_5
    iget-object v13, v4, Ll/bfj0;->i:[I

    .line 122
    .line 123
    iget-object v7, v4, Ll/bfj0;->j:[J

    .line 124
    .line 125
    const/16 v16, 0x1

    .line 126
    .line 127
    iget-object v8, v4, Ll/bfj0;->k:[Z

    .line 128
    .line 129
    move/from16 v17, v1

    .line 130
    .line 131
    iget v1, v3, Ll/yej0;->b:I

    .line 132
    .line 133
    const/4 v2, 0x2

    .line 134
    if-ne v1, v2, :cond_8

    .line 135
    .line 136
    and-int/lit8 v1, p2, 0x1

    .line 137
    .line 138
    if-eqz v1, :cond_8

    .line 139
    .line 140
    move/from16 v1, v16

    .line 141
    .line 142
    goto :goto_6

    .line 143
    :cond_8
    const/4 v1, 0x0

    .line 144
    :goto_6
    iget-object v2, v4, Ll/bfj0;->h:[I

    .line 145
    .line 146
    aget v2, v2, p1

    .line 147
    .line 148
    add-int v2, p4, v2

    .line 149
    .line 150
    move/from16 v24, v6

    .line 151
    .line 152
    move-object/from16 v25, v7

    .line 153
    .line 154
    iget-wide v6, v3, Ll/yej0;->c:J

    .line 155
    .line 156
    move-wide/from16 v22, v6

    .line 157
    .line 158
    iget-wide v6, v4, Ll/bfj0;->q:J

    .line 159
    .line 160
    move/from16 v3, p4

    .line 161
    .line 162
    :goto_7
    if-ge v3, v2, :cond_11

    .line 163
    .line 164
    if-eqz v10, :cond_9

    .line 165
    .line 166
    invoke-virtual/range {p3 .. p3}, Ll/ig60;->q()I

    .line 167
    .line 168
    .line 169
    move-result v18

    .line 170
    move/from16 p2, v1

    .line 171
    .line 172
    goto :goto_8

    .line 173
    :cond_9
    move/from16 p2, v1

    .line 174
    .line 175
    iget v1, v5, Ll/asd;->b:I

    .line 176
    .line 177
    move/from16 v18, v1

    .line 178
    .line 179
    :goto_8
    invoke-static/range {v18 .. v18}, Ll/d6j;->d(I)I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v11, :cond_a

    .line 184
    .line 185
    invoke-virtual/range {p3 .. p3}, Ll/ig60;->q()I

    .line 186
    .line 187
    .line 188
    move-result v18

    .line 189
    move/from16 p1, v2

    .line 190
    .line 191
    goto :goto_9

    .line 192
    :cond_a
    move/from16 p1, v2

    .line 193
    .line 194
    iget v2, v5, Ll/asd;->c:I

    .line 195
    .line 196
    move/from16 v18, v2

    .line 197
    .line 198
    :goto_9
    invoke-static/range {v18 .. v18}, Ll/d6j;->d(I)I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    if-eqz v12, :cond_b

    .line 203
    .line 204
    invoke-virtual/range {p3 .. p3}, Ll/ig60;->q()I

    .line 205
    .line 206
    .line 207
    move-result v18

    .line 208
    move/from16 p4, v2

    .line 209
    .line 210
    move/from16 v2, v18

    .line 211
    .line 212
    goto :goto_a

    .line 213
    :cond_b
    if-nez v3, :cond_c

    .line 214
    .line 215
    if-eqz v24, :cond_c

    .line 216
    .line 217
    move/from16 p4, v2

    .line 218
    .line 219
    move v2, v9

    .line 220
    goto :goto_a

    .line 221
    :cond_c
    move/from16 p4, v2

    .line 222
    .line 223
    iget v2, v5, Ll/asd;->d:I

    .line 224
    .line 225
    :goto_a
    if-eqz v17, :cond_d

    .line 226
    .line 227
    invoke-virtual/range {p3 .. p3}, Ll/ig60;->q()I

    .line 228
    .line 229
    .line 230
    move-result v18

    .line 231
    move/from16 v26, v2

    .line 232
    .line 233
    move/from16 v2, v18

    .line 234
    .line 235
    :goto_b
    move/from16 v27, v3

    .line 236
    .line 237
    goto :goto_c

    .line 238
    :cond_d
    move/from16 v26, v2

    .line 239
    .line 240
    const/4 v2, 0x0

    .line 241
    goto :goto_b

    .line 242
    :goto_c
    int-to-long v2, v2

    .line 243
    add-long/2addr v2, v6

    .line 244
    sub-long v18, v2, v14

    .line 245
    .line 246
    const-wide/32 v20, 0xf4240

    .line 247
    .line 248
    .line 249
    invoke-static/range {v18 .. v23}, Ll/bmk0;->W0(JJJ)J

    .line 250
    .line 251
    .line 252
    move-result-wide v2

    .line 253
    aput-wide v2, v25, v27

    .line 254
    .line 255
    move-wide/from16 v18, v2

    .line 256
    .line 257
    iget-boolean v2, v4, Ll/bfj0;->r:Z

    .line 258
    .line 259
    if-nez v2, :cond_e

    .line 260
    .line 261
    iget-object v2, v0, Ll/d6j$b;->d:Ll/ufj0;

    .line 262
    .line 263
    iget-wide v2, v2, Ll/ufj0;->h:J

    .line 264
    .line 265
    add-long v2, v18, v2

    .line 266
    .line 267
    aput-wide v2, v25, v27

    .line 268
    .line 269
    :cond_e
    aput p4, v13, v27

    .line 270
    .line 271
    shr-int/lit8 v2, v26, 0x10

    .line 272
    .line 273
    and-int/lit8 v2, v2, 0x1

    .line 274
    .line 275
    if-nez v2, :cond_10

    .line 276
    .line 277
    if-eqz p2, :cond_f

    .line 278
    .line 279
    if-nez v27, :cond_10

    .line 280
    .line 281
    :cond_f
    move/from16 v2, v16

    .line 282
    .line 283
    goto :goto_d

    .line 284
    :cond_10
    const/4 v2, 0x0

    .line 285
    :goto_d
    aput-boolean v2, v8, v27

    .line 286
    .line 287
    int-to-long v1, v1

    .line 288
    add-long/2addr v6, v1

    .line 289
    add-int/lit8 v3, v27, 0x1

    .line 290
    .line 291
    move/from16 v2, p1

    .line 292
    .line 293
    move/from16 v1, p2

    .line 294
    .line 295
    goto/16 :goto_7

    .line 296
    .line 297
    :cond_11
    move/from16 p1, v2

    .line 298
    .line 299
    iput-wide v6, v4, Ll/bfj0;->q:J

    .line 300
    .line 301
    return p1
.end method

.method public static G(Ll/f31$a;Ll/d6j$b;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f31$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    move v3, v2

    .line 10
    move v4, v3

    .line 11
    :goto_0
    const v5, 0x7472756e

    .line 12
    .line 13
    .line 14
    if-ge v2, v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v6

    .line 20
    check-cast v6, Ll/f31$b;

    .line 21
    .line 22
    iget v7, v6, Ll/f31;->a:I

    .line 23
    .line 24
    if-ne v7, v5, :cond_0

    .line 25
    .line 26
    iget-object v5, v6, Ll/f31$b;->b:Ll/ig60;

    .line 27
    .line 28
    const/16 v6, 0xc

    .line 29
    .line 30
    invoke-virtual {v5, v6}, Ll/ig60;->U(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v5}, Ll/ig60;->L()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-lez v5, :cond_0

    .line 38
    .line 39
    add-int/2addr v4, v5

    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iput v1, p1, Ll/d6j$b;->h:I

    .line 46
    .line 47
    iput v1, p1, Ll/d6j$b;->g:I

    .line 48
    .line 49
    iput v1, p1, Ll/d6j$b;->f:I

    .line 50
    .line 51
    iget-object v2, p1, Ll/d6j$b;->b:Ll/bfj0;

    .line 52
    .line 53
    invoke-virtual {v2, v3, v4}, Ll/bfj0;->e(II)V

    .line 54
    .line 55
    .line 56
    move v2, v1

    .line 57
    move v3, v2

    .line 58
    :goto_1
    if-ge v1, v0, :cond_3

    .line 59
    .line 60
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Ll/f31$b;

    .line 65
    .line 66
    iget v6, v4, Ll/f31;->a:I

    .line 67
    .line 68
    if-ne v6, v5, :cond_2

    .line 69
    .line 70
    add-int/lit8 v6, v2, 0x1

    .line 71
    .line 72
    iget-object v4, v4, Ll/f31$b;->b:Ll/ig60;

    .line 73
    .line 74
    invoke-static {p1, v2, p2, v4, v3}, Ll/d6j;->F(Ll/d6j$b;IILl/ig60;I)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    move v3, v2

    .line 79
    move v2, v6

    .line 80
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    return-void
.end method

.method public static H(Ll/ig60;Ll/bfj0;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/16 v1, 0x10

    .line 8
    .line 9
    invoke-virtual {p0, p2, v0, v1}, Ll/ig60;->l([BII)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/d6j;->J:[B

    .line 13
    .line 14
    invoke-static {p2, v0}, Ljava/util/Arrays;->equals([B[B)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {p0, v1, p1}, Ll/d6j;->y(Ll/ig60;ILl/bfj0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private I(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/f31$a;

    .line 16
    .line 17
    iget-wide v0, v0, Ll/f31$a;->b:J

    .line 18
    .line 19
    cmp-long v0, v0, p1

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/f31$a;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/d6j;->n(Ll/f31$a;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-direct {p0}, Ll/d6j;->e()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private J(Ll/asf;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/d6j;->s:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p1, v0, v2, v1, v3}, Ll/asf;->b([BIIZ)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return v2

    .line 22
    :cond_0
    iput v1, p0, Ll/d6j;->s:I

    .line 23
    .line 24
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ll/ig60;->U(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    iput-wide v4, p0, Ll/d6j;->r:J

    .line 36
    .line 37
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Ll/d6j;->q:I

    .line 44
    .line 45
    :cond_1
    iget-wide v4, p0, Ll/d6j;->r:J

    .line 46
    .line 47
    const-wide/16 v6, 0x1

    .line 48
    .line 49
    cmp-long v0, v4, v6

    .line 50
    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {p1, v0, v1, v1}, Ll/asf;->readFully([BII)V

    .line 60
    .line 61
    .line 62
    iget v0, p0, Ll/d6j;->s:I

    .line 63
    .line 64
    add-int/2addr v0, v1

    .line 65
    iput v0, p0, Ll/d6j;->s:I

    .line 66
    .line 67
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/ig60;->M()J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    iput-wide v4, p0, Ll/d6j;->r:J

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    const-wide/16 v6, 0x0

    .line 77
    .line 78
    cmp-long v0, v4, v6

    .line 79
    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 83
    .line 84
    .line 85
    move-result-wide v4

    .line 86
    const-wide/16 v6, -0x1

    .line 87
    .line 88
    cmp-long v0, v4, v6

    .line 89
    .line 90
    if-nez v0, :cond_3

    .line 91
    .line 92
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_3

    .line 99
    .line 100
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ll/f31$a;

    .line 107
    .line 108
    iget-wide v4, v0, Ll/f31$a;->b:J

    .line 109
    .line 110
    :cond_3
    cmp-long v0, v4, v6

    .line 111
    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 115
    .line 116
    .line 117
    move-result-wide v6

    .line 118
    sub-long/2addr v4, v6

    .line 119
    iget v0, p0, Ll/d6j;->s:I

    .line 120
    .line 121
    int-to-long v6, v0

    .line 122
    add-long/2addr v4, v6

    .line 123
    iput-wide v4, p0, Ll/d6j;->r:J

    .line 124
    .line 125
    :cond_4
    :goto_0
    iget-wide v4, p0, Ll/d6j;->r:J

    .line 126
    .line 127
    iget v0, p0, Ll/d6j;->s:I

    .line 128
    .line 129
    int-to-long v6, v0

    .line 130
    cmp-long v0, v4, v6

    .line 131
    .line 132
    if-ltz v0, :cond_f

    .line 133
    .line 134
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 135
    .line 136
    .line 137
    move-result-wide v4

    .line 138
    iget v0, p0, Ll/d6j;->s:I

    .line 139
    .line 140
    int-to-long v6, v0

    .line 141
    sub-long/2addr v4, v6

    .line 142
    iget v0, p0, Ll/d6j;->q:I

    .line 143
    .line 144
    const v6, 0x6d646174

    .line 145
    .line 146
    .line 147
    const v7, 0x6d6f6f66

    .line 148
    .line 149
    .line 150
    if-eq v0, v7, :cond_5

    .line 151
    .line 152
    if-ne v0, v6, :cond_6

    .line 153
    .line 154
    :cond_5
    iget-boolean v0, p0, Ll/d6j;->H:Z

    .line 155
    .line 156
    if-nez v0, :cond_6

    .line 157
    .line 158
    iget-object v0, p0, Ll/d6j;->E:Ll/bsf;

    .line 159
    .line 160
    new-instance v8, Ll/mke0$b;

    .line 161
    .line 162
    iget-wide v9, p0, Ll/d6j;->x:J

    .line 163
    .line 164
    invoke-direct {v8, v9, v10, v4, v5}, Ll/mke0$b;-><init>(JJ)V

    .line 165
    .line 166
    .line 167
    invoke-interface {v0, v8}, Ll/bsf;->k(Ll/mke0;)V

    .line 168
    .line 169
    .line 170
    iput-boolean v3, p0, Ll/d6j;->H:Z

    .line 171
    .line 172
    :cond_6
    iget v0, p0, Ll/d6j;->q:I

    .line 173
    .line 174
    if-ne v0, v7, :cond_7

    .line 175
    .line 176
    iget-object v0, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 177
    .line 178
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    move v7, v2

    .line 183
    :goto_1
    if-ge v7, v0, :cond_7

    .line 184
    .line 185
    iget-object v8, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 186
    .line 187
    invoke-virtual {v8, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v8

    .line 191
    check-cast v8, Ll/d6j$b;

    .line 192
    .line 193
    iget-object v8, v8, Ll/d6j$b;->b:Ll/bfj0;

    .line 194
    .line 195
    iput-wide v4, v8, Ll/bfj0;->b:J

    .line 196
    .line 197
    iput-wide v4, v8, Ll/bfj0;->d:J

    .line 198
    .line 199
    iput-wide v4, v8, Ll/bfj0;->c:J

    .line 200
    .line 201
    add-int/lit8 v7, v7, 0x1

    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_7
    iget v0, p0, Ll/d6j;->q:I

    .line 205
    .line 206
    const/4 v7, 0x0

    .line 207
    if-ne v0, v6, :cond_8

    .line 208
    .line 209
    iput-object v7, p0, Ll/d6j;->z:Ll/d6j$b;

    .line 210
    .line 211
    iget-wide v0, p0, Ll/d6j;->r:J

    .line 212
    .line 213
    add-long/2addr v4, v0

    .line 214
    iput-wide v4, p0, Ll/d6j;->u:J

    .line 215
    .line 216
    const/4 p1, 0x2

    .line 217
    iput p1, p0, Ll/d6j;->p:I

    .line 218
    .line 219
    return v3

    .line 220
    :cond_8
    invoke-static {v0}, Ll/d6j;->N(I)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_a

    .line 225
    .line 226
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 227
    .line 228
    .line 229
    move-result-wide v0

    .line 230
    iget-wide v4, p0, Ll/d6j;->r:J

    .line 231
    .line 232
    add-long/2addr v0, v4

    .line 233
    const-wide/16 v4, 0x8

    .line 234
    .line 235
    sub-long/2addr v0, v4

    .line 236
    iget-object p1, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 237
    .line 238
    new-instance v2, Ll/f31$a;

    .line 239
    .line 240
    iget v4, p0, Ll/d6j;->q:I

    .line 241
    .line 242
    invoke-direct {v2, v4, v0, v1}, Ll/f31$a;-><init>(IJ)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p1, v2}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    iget-wide v4, p0, Ll/d6j;->r:J

    .line 249
    .line 250
    iget p1, p0, Ll/d6j;->s:I

    .line 251
    .line 252
    int-to-long v6, p1

    .line 253
    cmp-long p1, v4, v6

    .line 254
    .line 255
    if-nez p1, :cond_9

    .line 256
    .line 257
    invoke-direct {p0, v0, v1}, Ll/d6j;->I(J)V

    .line 258
    .line 259
    .line 260
    goto :goto_2

    .line 261
    :cond_9
    invoke-direct {p0}, Ll/d6j;->e()V

    .line 262
    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_a
    iget p1, p0, Ll/d6j;->q:I

    .line 266
    .line 267
    invoke-static {p1}, Ll/d6j;->O(I)Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    const-wide/32 v4, 0x7fffffff

    .line 272
    .line 273
    .line 274
    if-eqz p1, :cond_d

    .line 275
    .line 276
    iget p1, p0, Ll/d6j;->s:I

    .line 277
    .line 278
    if-ne p1, v1, :cond_c

    .line 279
    .line 280
    iget-wide v6, p0, Ll/d6j;->r:J

    .line 281
    .line 282
    cmp-long p1, v6, v4

    .line 283
    .line 284
    if-gtz p1, :cond_b

    .line 285
    .line 286
    new-instance p1, Ll/ig60;

    .line 287
    .line 288
    iget-wide v4, p0, Ll/d6j;->r:J

    .line 289
    .line 290
    long-to-int v0, v4

    .line 291
    invoke-direct {p1, v0}, Ll/ig60;-><init>(I)V

    .line 292
    .line 293
    .line 294
    iget-object v0, p0, Ll/d6j;->l:Ll/ig60;

    .line 295
    .line 296
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 301
    .line 302
    .line 303
    move-result-object v4

    .line 304
    invoke-static {v0, v2, v4, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 305
    .line 306
    .line 307
    iput-object p1, p0, Ll/d6j;->t:Ll/ig60;

    .line 308
    .line 309
    iput v3, p0, Ll/d6j;->p:I

    .line 310
    .line 311
    goto :goto_2

    .line 312
    :cond_b
    const-string p0, "Leaf atom with length > 2147483647 (unsupported)."

    .line 313
    .line 314
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    throw p0

    .line 319
    :cond_c
    const-string p0, "Leaf atom defines extended atom size (unsupported)."

    .line 320
    .line 321
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    throw p0

    .line 326
    :cond_d
    iget-wide v0, p0, Ll/d6j;->r:J

    .line 327
    .line 328
    cmp-long p1, v0, v4

    .line 329
    .line 330
    if-gtz p1, :cond_e

    .line 331
    .line 332
    iput-object v7, p0, Ll/d6j;->t:Ll/ig60;

    .line 333
    .line 334
    iput v3, p0, Ll/d6j;->p:I

    .line 335
    .line 336
    :goto_2
    return v3

    .line 337
    :cond_e
    const-string p0, "Skipping atom with length > 2147483647 (unsupported)."

    .line 338
    .line 339
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    throw p0

    .line 344
    :cond_f
    const-string p0, "Atom size less than header length (unsupported)."

    .line 345
    .line 346
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    throw p0
.end method

.method private static N(I)Z
    .locals 1

    .line 1
    const v0, 0x6d6f6f76

    .line 2
    .line 3
    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const v0, 0x7472616b

    .line 7
    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const v0, 0x6d646961

    .line 12
    .line 13
    .line 14
    if-eq p0, v0, :cond_1

    .line 15
    .line 16
    const v0, 0x6d696e66

    .line 17
    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const v0, 0x7374626c

    .line 22
    .line 23
    .line 24
    if-eq p0, v0, :cond_1

    .line 25
    .line 26
    const v0, 0x6d6f6f66

    .line 27
    .line 28
    .line 29
    if-eq p0, v0, :cond_1

    .line 30
    .line 31
    const v0, 0x74726166

    .line 32
    .line 33
    .line 34
    if-eq p0, v0, :cond_1

    .line 35
    .line 36
    const v0, 0x6d766578

    .line 37
    .line 38
    .line 39
    if-eq p0, v0, :cond_1

    .line 40
    .line 41
    const v0, 0x65647473

    .line 42
    .line 43
    .line 44
    if-ne p0, v0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0

    .line 49
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 50
    return p0
.end method

.method private static O(I)Z
    .locals 1

    .line 1
    const v0, 0x68646c72    # 4.3148E24f

    .line 2
    .line 3
    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const v0, 0x6d646864

    .line 7
    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const v0, 0x6d766864

    .line 12
    .line 13
    .line 14
    if-eq p0, v0, :cond_1

    .line 15
    .line 16
    const v0, 0x73696478

    .line 17
    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const v0, 0x73747364

    .line 22
    .line 23
    .line 24
    if-eq p0, v0, :cond_1

    .line 25
    .line 26
    const v0, 0x73747473

    .line 27
    .line 28
    .line 29
    if-eq p0, v0, :cond_1

    .line 30
    .line 31
    const v0, 0x63747473

    .line 32
    .line 33
    .line 34
    if-eq p0, v0, :cond_1

    .line 35
    .line 36
    const v0, 0x73747363

    .line 37
    .line 38
    .line 39
    if-eq p0, v0, :cond_1

    .line 40
    .line 41
    const v0, 0x7374737a

    .line 42
    .line 43
    .line 44
    if-eq p0, v0, :cond_1

    .line 45
    .line 46
    const v0, 0x73747a32

    .line 47
    .line 48
    .line 49
    if-eq p0, v0, :cond_1

    .line 50
    .line 51
    const v0, 0x7374636f

    .line 52
    .line 53
    .line 54
    if-eq p0, v0, :cond_1

    .line 55
    .line 56
    const v0, 0x636f3634

    .line 57
    .line 58
    .line 59
    if-eq p0, v0, :cond_1

    .line 60
    .line 61
    const v0, 0x73747373

    .line 62
    .line 63
    .line 64
    if-eq p0, v0, :cond_1

    .line 65
    .line 66
    const v0, 0x74666474

    .line 67
    .line 68
    .line 69
    if-eq p0, v0, :cond_1

    .line 70
    .line 71
    const v0, 0x74666864

    .line 72
    .line 73
    .line 74
    if-eq p0, v0, :cond_1

    .line 75
    .line 76
    const v0, 0x746b6864

    .line 77
    .line 78
    .line 79
    if-eq p0, v0, :cond_1

    .line 80
    .line 81
    const v0, 0x74726578

    .line 82
    .line 83
    .line 84
    if-eq p0, v0, :cond_1

    .line 85
    .line 86
    const v0, 0x7472756e

    .line 87
    .line 88
    .line 89
    if-eq p0, v0, :cond_1

    .line 90
    .line 91
    const v0, 0x70737368    # 3.013775E29f

    .line 92
    .line 93
    .line 94
    if-eq p0, v0, :cond_1

    .line 95
    .line 96
    const v0, 0x7361697a

    .line 97
    .line 98
    .line 99
    if-eq p0, v0, :cond_1

    .line 100
    .line 101
    const v0, 0x7361696f

    .line 102
    .line 103
    .line 104
    if-eq p0, v0, :cond_1

    .line 105
    .line 106
    const v0, 0x73656e63

    .line 107
    .line 108
    .line 109
    if-eq p0, v0, :cond_1

    .line 110
    .line 111
    const v0, 0x75756964

    .line 112
    .line 113
    .line 114
    if-eq p0, v0, :cond_1

    .line 115
    .line 116
    const v0, 0x73626770

    .line 117
    .line 118
    .line 119
    if-eq p0, v0, :cond_1

    .line 120
    .line 121
    const v0, 0x73677064

    .line 122
    .line 123
    .line 124
    if-eq p0, v0, :cond_1

    .line 125
    .line 126
    const v0, 0x656c7374

    .line 127
    .line 128
    .line 129
    if-eq p0, v0, :cond_1

    .line 130
    .line 131
    const v0, 0x6d656864

    .line 132
    .line 133
    .line 134
    if-eq p0, v0, :cond_1

    .line 135
    .line 136
    const v0, 0x656d7367

    .line 137
    .line 138
    .line 139
    if-ne p0, v0, :cond_0

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_0
    const/4 p0, 0x0

    .line 143
    return p0

    .line 144
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 145
    return p0
.end method

.method public static synthetic c()[Ll/zrf;
    .locals 3

    .line 1
    new-instance v0, Ll/d6j;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d6j;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v1, v1, [Ll/zrf;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput-object v0, v1, v2

    .line 11
    .line 12
    return-object v1
.end method

.method public static d(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
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
    invoke-static {p0, v0}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    throw p0
.end method

.method private e()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/d6j;->p:I

    .line 3
    .line 4
    iput v0, p0, Ll/d6j;->s:I

    .line 5
    .line 6
    return-void
.end method

.method public static i(Ljava/util/List;)Lcom/google/android/exoplayer2/drm/DrmInitData;
    .locals 8
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/f31$b;",
            ">;)",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;"
        }
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
    move-object v3, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_3

    .line 9
    .line 10
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    check-cast v4, Ll/f31$b;

    .line 15
    .line 16
    iget v5, v4, Ll/f31;->a:I

    .line 17
    .line 18
    const v6, 0x70737368    # 3.013775E29f

    .line 19
    .line 20
    .line 21
    if-ne v5, v6, :cond_2

    .line 22
    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    new-instance v3, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v4, v4, Ll/f31$b;->b:Ll/ig60;

    .line 31
    .line 32
    invoke-virtual {v4}, Ll/ig60;->e()[B

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-static {v4}, Ll/t7b0;->f([B)Ljava/util/UUID;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    if-nez v5, :cond_1

    .line 41
    .line 42
    const-string v4, "FragmentedMp4Extractor"

    .line 43
    .line 44
    const-string v5, "Skipped pssh atom (failed to extract uuid)"

    .line 45
    .line 46
    invoke-static {v4, v5}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    new-instance v6, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    .line 51
    .line 52
    const-string v7, "video/mp4"

    .line 53
    .line 54
    invoke-direct {v6, v5, v7, v4}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;-><init>(Ljava/util/UUID;Ljava/lang/String;[B)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    if-nez v3, :cond_4

    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_4
    new-instance p0, Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 67
    .line 68
    invoke-direct {p0, v3}, Lcom/google/android/exoplayer2/drm/DrmInitData;-><init>(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    return-object p0
.end method

.method public static j(Landroid/util/SparseArray;)Ll/d6j$b;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ll/d6j$b;",
            ">;)",
            "Ll/d6j$b;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-wide v2, 0x7fffffffffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    :goto_0
    if-ge v4, v0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    check-cast v5, Ll/d6j$b;

    .line 19
    .line 20
    invoke-static {v5}, Ll/d6j$b;->a(Ll/d6j$b;)Z

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    if-nez v6, :cond_0

    .line 25
    .line 26
    iget v6, v5, Ll/d6j$b;->f:I

    .line 27
    .line 28
    iget-object v7, v5, Ll/d6j$b;->d:Ll/ufj0;

    .line 29
    .line 30
    iget v7, v7, Ll/ufj0;->b:I

    .line 31
    .line 32
    if-eq v6, v7, :cond_2

    .line 33
    .line 34
    :cond_0
    invoke-static {v5}, Ll/d6j$b;->a(Ll/d6j$b;)Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-eqz v6, :cond_1

    .line 39
    .line 40
    iget v6, v5, Ll/d6j$b;->h:I

    .line 41
    .line 42
    iget-object v7, v5, Ll/d6j$b;->b:Ll/bfj0;

    .line 43
    .line 44
    iget v7, v7, Ll/bfj0;->e:I

    .line 45
    .line 46
    if-ne v6, v7, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    invoke-virtual {v5}, Ll/d6j$b;->d()J

    .line 50
    .line 51
    .line 52
    move-result-wide v6

    .line 53
    cmp-long v8, v6, v2

    .line 54
    .line 55
    if-gez v8, :cond_2

    .line 56
    .line 57
    move-object v1, v5

    .line 58
    move-wide v2, v6

    .line 59
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    return-object v1
.end method

.method public static l(Ll/yej0;)Z
    .locals 14

    .line 1
    iget-object v0, p0, Ll/yej0;->h:[J

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    array-length v2, v0

    .line 7
    const/4 v3, 0x1

    .line 8
    if-ne v2, v3, :cond_2

    .line 9
    .line 10
    iget-object v2, p0, Ll/yej0;->i:[J

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    aget-wide v4, v0, v1

    .line 16
    .line 17
    const-wide/16 v6, 0x0

    .line 18
    .line 19
    cmp-long v0, v4, v6

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v3

    .line 24
    :cond_1
    aget-wide v6, v2, v1

    .line 25
    .line 26
    add-long v8, v4, v6

    .line 27
    .line 28
    const-wide/32 v10, 0xf4240

    .line 29
    .line 30
    .line 31
    iget-wide v12, p0, Ll/yej0;->d:J

    .line 32
    .line 33
    invoke-static/range {v8 .. v13}, Ll/bmk0;->W0(JJJ)J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    iget-wide v6, p0, Ll/yej0;->e:J

    .line 38
    .line 39
    cmp-long p0, v4, v6

    .line 40
    .line 41
    if-ltz p0, :cond_2

    .line 42
    .line 43
    return v3

    .line 44
    :cond_2
    :goto_0
    return v1
.end method

.method public static t(Ll/ig60;)J
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {v0}, Ll/f31;->c(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    return-wide v0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->M()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    return-wide v0
.end method

.method public static u(Ll/f31$a;Landroid/util/SparseArray;ZI[B)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f31$a;",
            "Landroid/util/SparseArray<",
            "Ll/d6j$b;",
            ">;ZI[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/f31$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Ll/f31$a;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/f31$a;

    .line 17
    .line 18
    iget v3, v2, Ll/f31;->a:I

    .line 19
    .line 20
    const v4, 0x74726166

    .line 21
    .line 22
    .line 23
    if-ne v3, v4, :cond_0

    .line 24
    .line 25
    invoke-static {v2, p1, p2, p3, p4}, Ll/d6j;->D(Ll/f31$a;Landroid/util/SparseArray;ZI[B)V

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public static v(Ll/ig60;Ll/bfj0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ll/f31;->b(I)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x1

    .line 15
    and-int/2addr v2, v3

    .line 16
    if-ne v2, v3, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/ig60;->L()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-ne v0, v3, :cond_2

    .line 26
    .line 27
    invoke-static {v1}, Ll/f31;->c(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-wide v1, p1, Ll/bfj0;->d:J

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ig60;->J()J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p0}, Ll/ig60;->M()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    :goto_0
    add-long/2addr v1, v3

    .line 45
    iput-wide v1, p1, Ll/bfj0;->d:J

    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p1, "Unexpected saio entry count: "

    .line 51
    .line 52
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 p1, 0x0

    .line 63
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    throw p0
.end method

.method public static w(Ll/zej0;Ll/ig60;Ll/bfj0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/zej0;->d:I

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ig60;->q()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v1}, Ll/f31;->b(I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    and-int/2addr v1, v2

    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ll/ig60;->V(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1}, Ll/ig60;->L()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget v3, p2, Ll/bfj0;->f:I

    .line 32
    .line 33
    if-gt v1, v3, :cond_6

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p2, Ll/bfj0;->m:[Z

    .line 39
    .line 40
    move v4, v3

    .line 41
    move v5, v4

    .line 42
    :goto_0
    if-ge v4, v1, :cond_4

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    add-int/2addr v5, v6

    .line 49
    if-le v6, p0, :cond_1

    .line 50
    .line 51
    move v6, v2

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v6, v3

    .line 54
    :goto_1
    aput-boolean v6, v0, v4

    .line 55
    .line 56
    add-int/lit8 v4, v4, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    if-le v0, p0, :cond_3

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    move v2, v3

    .line 63
    :goto_2
    mul-int v5, v0, v1

    .line 64
    .line 65
    iget-object p0, p2, Ll/bfj0;->m:[Z

    .line 66
    .line 67
    invoke-static {p0, v3, v1, v2}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object p0, p2, Ll/bfj0;->m:[Z

    .line 71
    .line 72
    iget p1, p2, Ll/bfj0;->f:I

    .line 73
    .line 74
    invoke-static {p0, v1, p1, v3}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 75
    .line 76
    .line 77
    if-lez v5, :cond_5

    .line 78
    .line 79
    invoke-virtual {p2, v5}, Ll/bfj0;->d(I)V

    .line 80
    .line 81
    .line 82
    :cond_5
    return-void

    .line 83
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string p1, "Saiz sample count "

    .line 86
    .line 87
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, " is greater than fragment sample count"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget p1, p2, Ll/bfj0;->f:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const/4 p1, 0x0

    .line 108
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    throw p0
.end method

.method public static x(Ll/f31$a;Ljava/lang/String;Ll/bfj0;)V
    .locals 17
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    move-object v5, v2

    .line 8
    move-object v6, v5

    .line 9
    move v4, v3

    .line 10
    :goto_0
    iget-object v7, v0, Ll/f31$a;->c:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v7

    .line 16
    if-ge v4, v7, :cond_2

    .line 17
    .line 18
    iget-object v7, v0, Ll/f31$a;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    check-cast v7, Ll/f31$b;

    .line 25
    .line 26
    iget-object v8, v7, Ll/f31$b;->b:Ll/ig60;

    .line 27
    .line 28
    iget v7, v7, Ll/f31;->a:I

    .line 29
    .line 30
    const v9, 0x73626770

    .line 31
    .line 32
    .line 33
    const v10, 0x73656967

    .line 34
    .line 35
    .line 36
    const/16 v11, 0xc

    .line 37
    .line 38
    if-ne v7, v9, :cond_0

    .line 39
    .line 40
    invoke-virtual {v8, v11}, Ll/ig60;->U(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v8}, Ll/ig60;->q()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-ne v7, v10, :cond_1

    .line 48
    .line 49
    move-object v5, v8

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    const v9, 0x73677064

    .line 52
    .line 53
    .line 54
    if-ne v7, v9, :cond_1

    .line 55
    .line 56
    invoke-virtual {v8, v11}, Ll/ig60;->U(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v8}, Ll/ig60;->q()I

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-ne v7, v10, :cond_1

    .line 64
    .line 65
    move-object v6, v8

    .line 66
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    if-eqz v5, :cond_d

    .line 70
    .line 71
    if-nez v6, :cond_3

    .line 72
    .line 73
    goto/16 :goto_4

    .line 74
    .line 75
    :cond_3
    const/16 v0, 0x8

    .line 76
    .line 77
    invoke-virtual {v5, v0}, Ll/ig60;->U(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v5}, Ll/ig60;->q()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-static {v4}, Ll/f31;->c(I)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    const/4 v7, 0x4

    .line 89
    invoke-virtual {v5, v7}, Ll/ig60;->V(I)V

    .line 90
    .line 91
    .line 92
    const/4 v8, 0x1

    .line 93
    if-ne v4, v8, :cond_4

    .line 94
    .line 95
    invoke-virtual {v5, v7}, Ll/ig60;->V(I)V

    .line 96
    .line 97
    .line 98
    :cond_4
    invoke-virtual {v5}, Ll/ig60;->q()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    if-ne v4, v8, :cond_c

    .line 103
    .line 104
    invoke-virtual {v6, v0}, Ll/ig60;->U(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v6}, Ll/ig60;->q()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-static {v0}, Ll/f31;->c(I)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-virtual {v6, v7}, Ll/ig60;->V(I)V

    .line 116
    .line 117
    .line 118
    if-ne v0, v8, :cond_6

    .line 119
    .line 120
    invoke-virtual {v6}, Ll/ig60;->J()J

    .line 121
    .line 122
    .line 123
    move-result-wide v4

    .line 124
    const-wide/16 v9, 0x0

    .line 125
    .line 126
    cmp-long v0, v4, v9

    .line 127
    .line 128
    if-eqz v0, :cond_5

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_5
    const-string v0, "Variable length description in sgpd found (unsupported)"

    .line 132
    .line 133
    invoke-static {v0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    throw v0

    .line 138
    :cond_6
    const/4 v4, 0x2

    .line 139
    if-lt v0, v4, :cond_7

    .line 140
    .line 141
    invoke-virtual {v6, v7}, Ll/ig60;->V(I)V

    .line 142
    .line 143
    .line 144
    :cond_7
    :goto_2
    invoke-virtual {v6}, Ll/ig60;->J()J

    .line 145
    .line 146
    .line 147
    move-result-wide v4

    .line 148
    const-wide/16 v9, 0x1

    .line 149
    .line 150
    cmp-long v0, v4, v9

    .line 151
    .line 152
    if-nez v0, :cond_b

    .line 153
    .line 154
    invoke-virtual {v6, v8}, Ll/ig60;->V(I)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    and-int/lit16 v4, v0, 0xf0

    .line 162
    .line 163
    shr-int/lit8 v14, v4, 0x4

    .line 164
    .line 165
    and-int/lit8 v15, v0, 0xf

    .line 166
    .line 167
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-ne v0, v8, :cond_8

    .line 172
    .line 173
    move v10, v8

    .line 174
    goto :goto_3

    .line 175
    :cond_8
    move v10, v3

    .line 176
    :goto_3
    if-nez v10, :cond_9

    .line 177
    .line 178
    goto :goto_4

    .line 179
    :cond_9
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 180
    .line 181
    .line 182
    move-result v12

    .line 183
    const/16 v0, 0x10

    .line 184
    .line 185
    new-array v13, v0, [B

    .line 186
    .line 187
    invoke-virtual {v6, v13, v3, v0}, Ll/ig60;->l([BII)V

    .line 188
    .line 189
    .line 190
    if-nez v12, :cond_a

    .line 191
    .line 192
    invoke-virtual {v6}, Ll/ig60;->H()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    new-array v2, v0, [B

    .line 197
    .line 198
    invoke-virtual {v6, v2, v3, v0}, Ll/ig60;->l([BII)V

    .line 199
    .line 200
    .line 201
    :cond_a
    move-object/from16 v16, v2

    .line 202
    .line 203
    iput-boolean v8, v1, Ll/bfj0;->l:Z

    .line 204
    .line 205
    new-instance v9, Ll/zej0;

    .line 206
    .line 207
    move-object/from16 v11, p1

    .line 208
    .line 209
    invoke-direct/range {v9 .. v16}, Ll/zej0;-><init>(ZLjava/lang/String;I[BII[B)V

    .line 210
    .line 211
    .line 212
    iput-object v9, v1, Ll/bfj0;->n:Ll/zej0;

    .line 213
    .line 214
    return-void

    .line 215
    :cond_b
    const-string v0, "Entry count in sgpd != 1 (unsupported)."

    .line 216
    .line 217
    invoke-static {v0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    throw v0

    .line 222
    :cond_c
    const-string v0, "Entry count in sbgp != 1 (unsupported)."

    .line 223
    .line 224
    invoke-static {v0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    throw v0

    .line 229
    :cond_d
    :goto_4
    return-void
.end method

.method public static y(Ll/ig60;ILl/bfj0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    add-int/lit8 p1, p1, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ig60;->U(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-static {p1}, Ll/f31;->b(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    and-int/lit8 v0, p1, 0x1

    .line 15
    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    and-int/lit8 p1, p1, 0x2

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move p1, v0

    .line 26
    :goto_0
    invoke-virtual {p0}, Ll/ig60;->L()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    iget-object p0, p2, Ll/bfj0;->m:[Z

    .line 33
    .line 34
    iget p1, p2, Ll/bfj0;->f:I

    .line 35
    .line 36
    invoke-static {p0, v0, p1, v0}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget v2, p2, Ll/bfj0;->f:I

    .line 41
    .line 42
    if-ne v1, v2, :cond_2

    .line 43
    .line 44
    iget-object v2, p2, Ll/bfj0;->m:[Z

    .line 45
    .line 46
    invoke-static {v2, v0, v1, p1}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ig60;->a()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p2, p1}, Ll/bfj0;->d(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p0}, Ll/bfj0;->b(Ll/ig60;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p1, "Senc sample count "

    .line 63
    .line 64
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p1, " is different from fragment sample count"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget p1, p2, Ll/bfj0;->f:I

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const/4 p1, 0x0

    .line 85
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    throw p0

    .line 90
    :cond_3
    const-string p0, "Overriding TrackEncryptionBox parameters is unsupported."

    .line 91
    .line 92
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    throw p0
.end method

.method public static z(Ll/ig60;Ll/bfj0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0, p1}, Ll/d6j;->y(Ll/ig60;ILl/bfj0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final K(Ll/asf;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/d6j;->r:J

    .line 2
    .line 3
    long-to-int v0, v0

    .line 4
    iget v1, p0, Ll/d6j;->s:I

    .line 5
    .line 6
    sub-int/2addr v0, v1

    .line 7
    iget-object v1, p0, Ll/d6j;->t:Ll/ig60;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/ig60;->e()[B

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/16 v3, 0x8

    .line 16
    .line 17
    invoke-interface {p1, v2, v3, v0}, Ll/asf;->readFully([BII)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/f31$b;

    .line 21
    .line 22
    iget v2, p0, Ll/d6j;->q:I

    .line 23
    .line 24
    invoke-direct {v0, v2, v1}, Ll/f31$b;-><init>(ILl/ig60;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    invoke-virtual {p0, v0, v1, v2}, Ll/d6j;->p(Ll/f31$b;J)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    invoke-direct {p0, v0, v1}, Ll/d6j;->I(J)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final L(Ll/asf;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const-wide v2, 0x7fffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    move-object v5, v1

    .line 15
    :goto_0
    if-ge v4, v0, :cond_1

    .line 16
    .line 17
    iget-object v6, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 18
    .line 19
    invoke-virtual {v6, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    check-cast v6, Ll/d6j$b;

    .line 24
    .line 25
    iget-object v6, v6, Ll/d6j$b;->b:Ll/bfj0;

    .line 26
    .line 27
    iget-boolean v7, v6, Ll/bfj0;->p:Z

    .line 28
    .line 29
    if-eqz v7, :cond_0

    .line 30
    .line 31
    iget-wide v6, v6, Ll/bfj0;->d:J

    .line 32
    .line 33
    cmp-long v8, v6, v2

    .line 34
    .line 35
    if-gez v8, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 38
    .line 39
    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    move-object v5, v2

    .line 44
    check-cast v5, Ll/d6j$b;

    .line 45
    .line 46
    move-wide v2, v6

    .line 47
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    if-nez v5, :cond_2

    .line 51
    .line 52
    const/4 p1, 0x3

    .line 53
    iput p1, p0, Ll/d6j;->p:I

    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 57
    .line 58
    .line 59
    move-result-wide v6

    .line 60
    sub-long/2addr v2, v6

    .line 61
    long-to-int p0, v2

    .line 62
    if-ltz p0, :cond_3

    .line 63
    .line 64
    invoke-interface {p1, p0}, Ll/asf;->o(I)V

    .line 65
    .line 66
    .line 67
    iget-object p0, v5, Ll/d6j$b;->b:Ll/bfj0;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/bfj0;->a(Ll/asf;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    const-string p0, "Offset to encryption data was negative."

    .line 74
    .line 75
    invoke-static {p0, v1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    throw p0
.end method

.method public final M(Ll/asf;)Z
    .locals 17
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
    iget-object v2, v0, Ll/d6j;->z:Ll/d6j$b;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    if-nez v2, :cond_3

    .line 10
    .line 11
    iget-object v2, v0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-static {v2}, Ll/d6j;->j(Landroid/util/SparseArray;)Ll/d6j$b;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    iget-wide v5, v0, Ll/d6j;->u:J

    .line 20
    .line 21
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 22
    .line 23
    .line 24
    move-result-wide v7

    .line 25
    sub-long/2addr v5, v7

    .line 26
    long-to-int v2, v5

    .line 27
    if-ltz v2, :cond_0

    .line 28
    .line 29
    invoke-interface {v1, v2}, Ll/asf;->o(I)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v0}, Ll/d6j;->e()V

    .line 33
    .line 34
    .line 35
    return v4

    .line 36
    :cond_0
    const-string v0, "Offset to end of mdat was negative."

    .line 37
    .line 38
    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    throw v0

    .line 43
    :cond_1
    invoke-virtual {v2}, Ll/d6j$b;->d()J

    .line 44
    .line 45
    .line 46
    move-result-wide v5

    .line 47
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 48
    .line 49
    .line 50
    move-result-wide v7

    .line 51
    sub-long/2addr v5, v7

    .line 52
    long-to-int v5, v5

    .line 53
    if-gez v5, :cond_2

    .line 54
    .line 55
    const-string v5, "FragmentedMp4Extractor"

    .line 56
    .line 57
    const-string v6, "Ignoring negative offset to sample data."

    .line 58
    .line 59
    invoke-static {v5, v6}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    move v5, v4

    .line 63
    :cond_2
    invoke-interface {v1, v5}, Ll/asf;->o(I)V

    .line 64
    .line 65
    .line 66
    iput-object v2, v0, Ll/d6j;->z:Ll/d6j$b;

    .line 67
    .line 68
    :cond_3
    iget v5, v0, Ll/d6j;->p:I

    .line 69
    .line 70
    const/4 v6, 0x3

    .line 71
    const/4 v7, 0x4

    .line 72
    const/4 v8, 0x1

    .line 73
    if-ne v5, v6, :cond_8

    .line 74
    .line 75
    invoke-virtual {v2}, Ll/d6j$b;->f()I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    iput v5, v0, Ll/d6j;->A:I

    .line 80
    .line 81
    iget v9, v2, Ll/d6j$b;->f:I

    .line 82
    .line 83
    iget v10, v2, Ll/d6j$b;->i:I

    .line 84
    .line 85
    if-ge v9, v10, :cond_5

    .line 86
    .line 87
    invoke-interface {v1, v5}, Ll/asf;->o(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2}, Ll/d6j$b;->m()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2}, Ll/d6j$b;->h()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_4

    .line 98
    .line 99
    iput-object v3, v0, Ll/d6j;->z:Ll/d6j$b;

    .line 100
    .line 101
    :cond_4
    iput v6, v0, Ll/d6j;->p:I

    .line 102
    .line 103
    return v8

    .line 104
    :cond_5
    iget-object v9, v2, Ll/d6j$b;->d:Ll/ufj0;

    .line 105
    .line 106
    iget-object v9, v9, Ll/ufj0;->a:Ll/yej0;

    .line 107
    .line 108
    iget v9, v9, Ll/yej0;->g:I

    .line 109
    .line 110
    if-ne v9, v8, :cond_6

    .line 111
    .line 112
    const/16 v9, 0x8

    .line 113
    .line 114
    sub-int/2addr v5, v9

    .line 115
    iput v5, v0, Ll/d6j;->A:I

    .line 116
    .line 117
    invoke-interface {v1, v9}, Ll/asf;->o(I)V

    .line 118
    .line 119
    .line 120
    :cond_6
    iget-object v5, v2, Ll/d6j$b;->d:Ll/ufj0;

    .line 121
    .line 122
    iget-object v5, v5, Ll/ufj0;->a:Ll/yej0;

    .line 123
    .line 124
    iget-object v5, v5, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 125
    .line 126
    iget-object v5, v5, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 127
    .line 128
    const-string v9, "audio/ac4"

    .line 129
    .line 130
    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    iget v9, v0, Ll/d6j;->A:I

    .line 135
    .line 136
    if-eqz v5, :cond_7

    .line 137
    .line 138
    const/4 v5, 0x7

    .line 139
    invoke-virtual {v2, v9, v5}, Ll/d6j$b;->i(II)I

    .line 140
    .line 141
    .line 142
    move-result v9

    .line 143
    iput v9, v0, Ll/d6j;->B:I

    .line 144
    .line 145
    iget v9, v0, Ll/d6j;->A:I

    .line 146
    .line 147
    iget-object v10, v0, Ll/d6j;->i:Ll/ig60;

    .line 148
    .line 149
    invoke-static {v9, v10}, Ll/d9;->a(ILl/ig60;)V

    .line 150
    .line 151
    .line 152
    iget-object v9, v2, Ll/d6j$b;->a:Ll/qfj0;

    .line 153
    .line 154
    iget-object v10, v0, Ll/d6j;->i:Ll/ig60;

    .line 155
    .line 156
    invoke-interface {v9, v10, v5}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 157
    .line 158
    .line 159
    iget v9, v0, Ll/d6j;->B:I

    .line 160
    .line 161
    add-int/2addr v9, v5

    .line 162
    iput v9, v0, Ll/d6j;->B:I

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_7
    invoke-virtual {v2, v9, v4}, Ll/d6j$b;->i(II)I

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    iput v5, v0, Ll/d6j;->B:I

    .line 170
    .line 171
    :goto_0
    iget v5, v0, Ll/d6j;->A:I

    .line 172
    .line 173
    iget v9, v0, Ll/d6j;->B:I

    .line 174
    .line 175
    add-int/2addr v5, v9

    .line 176
    iput v5, v0, Ll/d6j;->A:I

    .line 177
    .line 178
    iput v7, v0, Ll/d6j;->p:I

    .line 179
    .line 180
    iput v4, v0, Ll/d6j;->C:I

    .line 181
    .line 182
    :cond_8
    iget-object v5, v2, Ll/d6j$b;->d:Ll/ufj0;

    .line 183
    .line 184
    iget-object v5, v5, Ll/ufj0;->a:Ll/yej0;

    .line 185
    .line 186
    iget-object v9, v2, Ll/d6j$b;->a:Ll/qfj0;

    .line 187
    .line 188
    invoke-virtual {v2}, Ll/d6j$b;->e()J

    .line 189
    .line 190
    .line 191
    move-result-wide v10

    .line 192
    iget-object v12, v0, Ll/d6j;->j:Ll/h0j0;

    .line 193
    .line 194
    if-eqz v12, :cond_9

    .line 195
    .line 196
    invoke-virtual {v12, v10, v11}, Ll/h0j0;->a(J)J

    .line 197
    .line 198
    .line 199
    move-result-wide v10

    .line 200
    :cond_9
    iget v12, v5, Ll/yej0;->j:I

    .line 201
    .line 202
    if-eqz v12, :cond_f

    .line 203
    .line 204
    iget-object v12, v0, Ll/d6j;->f:Ll/ig60;

    .line 205
    .line 206
    invoke-virtual {v12}, Ll/ig60;->e()[B

    .line 207
    .line 208
    .line 209
    move-result-object v12

    .line 210
    aput-byte v4, v12, v4

    .line 211
    .line 212
    aput-byte v4, v12, v8

    .line 213
    .line 214
    const/4 v13, 0x2

    .line 215
    aput-byte v4, v12, v13

    .line 216
    .line 217
    iget v13, v5, Ll/yej0;->j:I

    .line 218
    .line 219
    add-int/lit8 v14, v13, 0x1

    .line 220
    .line 221
    rsub-int/lit8 v13, v13, 0x4

    .line 222
    .line 223
    :goto_1
    iget v15, v0, Ll/d6j;->B:I

    .line 224
    .line 225
    iget v6, v0, Ll/d6j;->A:I

    .line 226
    .line 227
    if-ge v15, v6, :cond_e

    .line 228
    .line 229
    iget v6, v0, Ll/d6j;->C:I

    .line 230
    .line 231
    if-nez v6, :cond_c

    .line 232
    .line 233
    invoke-interface {v1, v12, v13, v14}, Ll/asf;->readFully([BII)V

    .line 234
    .line 235
    .line 236
    iget-object v6, v0, Ll/d6j;->f:Ll/ig60;

    .line 237
    .line 238
    invoke-virtual {v6, v4}, Ll/ig60;->U(I)V

    .line 239
    .line 240
    .line 241
    iget-object v6, v0, Ll/d6j;->f:Ll/ig60;

    .line 242
    .line 243
    invoke-virtual {v6}, Ll/ig60;->q()I

    .line 244
    .line 245
    .line 246
    move-result v6

    .line 247
    if-lt v6, v8, :cond_b

    .line 248
    .line 249
    add-int/lit8 v6, v6, -0x1

    .line 250
    .line 251
    iput v6, v0, Ll/d6j;->C:I

    .line 252
    .line 253
    iget-object v6, v0, Ll/d6j;->e:Ll/ig60;

    .line 254
    .line 255
    invoke-virtual {v6, v4}, Ll/ig60;->U(I)V

    .line 256
    .line 257
    .line 258
    iget-object v6, v0, Ll/d6j;->e:Ll/ig60;

    .line 259
    .line 260
    invoke-interface {v9, v6, v7}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 261
    .line 262
    .line 263
    iget-object v6, v0, Ll/d6j;->f:Ll/ig60;

    .line 264
    .line 265
    invoke-interface {v9, v6, v8}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 266
    .line 267
    .line 268
    iget-object v6, v0, Ll/d6j;->G:[Ll/qfj0;

    .line 269
    .line 270
    array-length v6, v6

    .line 271
    if-lez v6, :cond_a

    .line 272
    .line 273
    iget-object v6, v5, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 274
    .line 275
    iget-object v6, v6, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 276
    .line 277
    aget-byte v15, v12, v7

    .line 278
    .line 279
    invoke-static {v6, v15}, Ll/jb20;->g(Ljava/lang/String;B)Z

    .line 280
    .line 281
    .line 282
    move-result v6

    .line 283
    if-eqz v6, :cond_a

    .line 284
    .line 285
    move v6, v8

    .line 286
    goto :goto_2

    .line 287
    :cond_a
    move v6, v4

    .line 288
    :goto_2
    iput-boolean v6, v0, Ll/d6j;->D:Z

    .line 289
    .line 290
    iget v6, v0, Ll/d6j;->B:I

    .line 291
    .line 292
    add-int/lit8 v6, v6, 0x5

    .line 293
    .line 294
    iput v6, v0, Ll/d6j;->B:I

    .line 295
    .line 296
    iget v6, v0, Ll/d6j;->A:I

    .line 297
    .line 298
    add-int/2addr v6, v13

    .line 299
    iput v6, v0, Ll/d6j;->A:I

    .line 300
    .line 301
    const/4 v6, 0x3

    .line 302
    goto :goto_1

    .line 303
    :cond_b
    const-string v0, "Invalid NAL length"

    .line 304
    .line 305
    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    throw v0

    .line 310
    :cond_c
    iget-boolean v15, v0, Ll/d6j;->D:Z

    .line 311
    .line 312
    if-eqz v15, :cond_d

    .line 313
    .line 314
    iget-object v15, v0, Ll/d6j;->g:Ll/ig60;

    .line 315
    .line 316
    invoke-virtual {v15, v6}, Ll/ig60;->Q(I)V

    .line 317
    .line 318
    .line 319
    iget-object v6, v0, Ll/d6j;->g:Ll/ig60;

    .line 320
    .line 321
    invoke-virtual {v6}, Ll/ig60;->e()[B

    .line 322
    .line 323
    .line 324
    move-result-object v6

    .line 325
    iget v15, v0, Ll/d6j;->C:I

    .line 326
    .line 327
    invoke-interface {v1, v6, v4, v15}, Ll/asf;->readFully([BII)V

    .line 328
    .line 329
    .line 330
    iget-object v6, v0, Ll/d6j;->g:Ll/ig60;

    .line 331
    .line 332
    iget v15, v0, Ll/d6j;->C:I

    .line 333
    .line 334
    invoke-interface {v9, v6, v15}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 335
    .line 336
    .line 337
    iget v6, v0, Ll/d6j;->C:I

    .line 338
    .line 339
    iget-object v15, v0, Ll/d6j;->g:Ll/ig60;

    .line 340
    .line 341
    invoke-virtual {v15}, Ll/ig60;->e()[B

    .line 342
    .line 343
    .line 344
    move-result-object v15

    .line 345
    iget-object v7, v0, Ll/d6j;->g:Ll/ig60;

    .line 346
    .line 347
    invoke-virtual {v7}, Ll/ig60;->g()I

    .line 348
    .line 349
    .line 350
    move-result v7

    .line 351
    invoke-static {v15, v7}, Ll/jb20;->q([BI)I

    .line 352
    .line 353
    .line 354
    move-result v7

    .line 355
    iget-object v15, v0, Ll/d6j;->g:Ll/ig60;

    .line 356
    .line 357
    move/from16 v16, v8

    .line 358
    .line 359
    iget-object v8, v5, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 360
    .line 361
    iget-object v8, v8, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 362
    .line 363
    const-string v3, "video/hevc"

    .line 364
    .line 365
    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    invoke-virtual {v15, v3}, Ll/ig60;->U(I)V

    .line 370
    .line 371
    .line 372
    iget-object v3, v0, Ll/d6j;->g:Ll/ig60;

    .line 373
    .line 374
    invoke-virtual {v3, v7}, Ll/ig60;->T(I)V

    .line 375
    .line 376
    .line 377
    iget-object v3, v0, Ll/d6j;->g:Ll/ig60;

    .line 378
    .line 379
    iget-object v7, v0, Ll/d6j;->G:[Ll/qfj0;

    .line 380
    .line 381
    invoke-static {v10, v11, v3, v7}, Ll/mo4;->a(JLl/ig60;[Ll/qfj0;)V

    .line 382
    .line 383
    .line 384
    goto :goto_3

    .line 385
    :cond_d
    move/from16 v16, v8

    .line 386
    .line 387
    invoke-interface {v9, v1, v6, v4}, Ll/qfj0;->e(Ll/e6c;IZ)I

    .line 388
    .line 389
    .line 390
    move-result v6

    .line 391
    :goto_3
    iget v3, v0, Ll/d6j;->B:I

    .line 392
    .line 393
    add-int/2addr v3, v6

    .line 394
    iput v3, v0, Ll/d6j;->B:I

    .line 395
    .line 396
    iget v3, v0, Ll/d6j;->C:I

    .line 397
    .line 398
    sub-int/2addr v3, v6

    .line 399
    iput v3, v0, Ll/d6j;->C:I

    .line 400
    .line 401
    move/from16 v8, v16

    .line 402
    .line 403
    const/4 v3, 0x0

    .line 404
    const/4 v6, 0x3

    .line 405
    const/4 v7, 0x4

    .line 406
    goto/16 :goto_1

    .line 407
    .line 408
    :cond_e
    move/from16 v16, v8

    .line 409
    .line 410
    goto :goto_5

    .line 411
    :cond_f
    move/from16 v16, v8

    .line 412
    .line 413
    :goto_4
    iget v3, v0, Ll/d6j;->B:I

    .line 414
    .line 415
    iget v5, v0, Ll/d6j;->A:I

    .line 416
    .line 417
    if-ge v3, v5, :cond_10

    .line 418
    .line 419
    sub-int/2addr v5, v3

    .line 420
    invoke-interface {v9, v1, v5, v4}, Ll/qfj0;->e(Ll/e6c;IZ)I

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    iget v5, v0, Ll/d6j;->B:I

    .line 425
    .line 426
    add-int/2addr v5, v3

    .line 427
    iput v5, v0, Ll/d6j;->B:I

    .line 428
    .line 429
    goto :goto_4

    .line 430
    :cond_10
    :goto_5
    invoke-virtual {v2}, Ll/d6j$b;->c()I

    .line 431
    .line 432
    .line 433
    move-result v12

    .line 434
    invoke-virtual {v2}, Ll/d6j$b;->g()Ll/zej0;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    if-eqz v1, :cond_11

    .line 439
    .line 440
    iget-object v1, v1, Ll/zej0;->c:Ll/qfj0$a;

    .line 441
    .line 442
    move-object v15, v1

    .line 443
    goto :goto_6

    .line 444
    :cond_11
    const/4 v15, 0x0

    .line 445
    :goto_6
    iget v13, v0, Ll/d6j;->A:I

    .line 446
    .line 447
    const/4 v14, 0x0

    .line 448
    invoke-interface/range {v9 .. v15}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0, v10, v11}, Ll/d6j;->s(J)V

    .line 452
    .line 453
    .line 454
    invoke-virtual {v2}, Ll/d6j$b;->h()Z

    .line 455
    .line 456
    .line 457
    move-result v1

    .line 458
    if-nez v1, :cond_12

    .line 459
    .line 460
    const/4 v1, 0x0

    .line 461
    iput-object v1, v0, Ll/d6j;->z:Ll/d6j$b;

    .line 462
    .line 463
    :cond_12
    const/4 v1, 0x3

    .line 464
    iput v1, v0, Ll/d6j;->p:I

    .line 465
    .line 466
    return v16
.end method

.method public a(JJ)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/d6j;->d:Landroid/util/SparseArray;

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
    iget-object v1, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/d6j$b;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/d6j$b;->k()V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p1, p0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    .line 28
    .line 29
    .line 30
    iput p2, p0, Ll/d6j;->v:I

    .line 31
    .line 32
    iput-wide p3, p0, Ll/d6j;->w:J

    .line 33
    .line 34
    iget-object p1, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Ll/d6j;->e()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public b(Ll/bsf;)V
    .locals 12

    .line 1
    iput-object p1, p0, Ll/d6j;->E:Ll/bsf;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/d6j;->e()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/d6j;->k()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/d6j;->b:Ll/yej0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/d6j$b;

    .line 14
    .line 15
    iget v0, v0, Ll/yej0;->b:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-interface {p1, v2, v0}, Ll/bsf;->b(II)Ll/qfj0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v3, Ll/ufj0;

    .line 23
    .line 24
    iget-object v4, p0, Ll/d6j;->b:Ll/yej0;

    .line 25
    .line 26
    new-array v5, v2, [J

    .line 27
    .line 28
    new-array v6, v2, [I

    .line 29
    .line 30
    new-array v8, v2, [J

    .line 31
    .line 32
    new-array v9, v2, [I

    .line 33
    .line 34
    const-wide/16 v10, 0x0

    .line 35
    .line 36
    const/4 v7, 0x0

    .line 37
    invoke-direct/range {v3 .. v11}, Ll/ufj0;-><init>(Ll/yej0;[J[II[J[IJ)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/asd;

    .line 41
    .line 42
    invoke-direct {v0, v2, v2, v2, v2}, Ll/asd;-><init>(IIII)V

    .line 43
    .line 44
    .line 45
    invoke-direct {v1, p1, v3, v0}, Ll/d6j$b;-><init>(Ll/qfj0;Ll/ufj0;Ll/asd;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 49
    .line 50
    invoke-virtual {p1, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/d6j;->E:Ll/bsf;

    .line 54
    .line 55
    invoke-interface {p0}, Ll/bsf;->l()V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public f(Ll/asf;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/wsf0;->b(Ll/asf;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final g(Landroid/util/SparseArray;I)Ll/asd;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ll/asd;",
            ">;I)",
            "Ll/asd;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p1, p0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/asd;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/asd;

    .line 21
    .line 22
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/asd;

    .line 27
    .line 28
    return-object p0
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    iget p2, p0, Ll/d6j;->p:I

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p2, v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/d6j;->M(Ll/asf;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    invoke-virtual {p0, p1}, Ll/d6j;->L(Ll/asf;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    invoke-virtual {p0, p1}, Ll/d6j;->K(Ll/asf;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_3
    invoke-direct {p0, p1}, Ll/d6j;->J(Ll/asf;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-nez p2, :cond_0

    .line 32
    .line 33
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method public final k()V
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Ll/qfj0;

    .line 3
    .line 4
    iput-object v0, p0, Ll/d6j;->F:[Ll/qfj0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/d6j;->o:Ll/qfj0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    aput-object v1, v0, v2

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v1, v2

    .line 16
    :goto_0
    iget v3, p0, Ll/d6j;->a:I

    .line 17
    .line 18
    and-int/lit8 v3, v3, 0x4

    .line 19
    .line 20
    const/16 v4, 0x64

    .line 21
    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    add-int/lit8 v3, v1, 0x1

    .line 25
    .line 26
    iget-object v5, p0, Ll/d6j;->E:Ll/bsf;

    .line 27
    .line 28
    const/4 v6, 0x5

    .line 29
    invoke-interface {v5, v4, v6}, Ll/bsf;->b(II)Ll/qfj0;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    aput-object v4, v0, v1

    .line 34
    .line 35
    const/16 v4, 0x65

    .line 36
    .line 37
    move v1, v3

    .line 38
    :cond_1
    iget-object v0, p0, Ll/d6j;->F:[Ll/qfj0;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bmk0;->O0([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, [Ll/qfj0;

    .line 45
    .line 46
    iput-object v0, p0, Ll/d6j;->F:[Ll/qfj0;

    .line 47
    .line 48
    array-length v1, v0

    .line 49
    move v3, v2

    .line 50
    :goto_1
    if-ge v3, v1, :cond_2

    .line 51
    .line 52
    aget-object v5, v0, v3

    .line 53
    .line 54
    sget-object v6, Ll/d6j;->K:Lcom/google/android/exoplayer2/k;

    .line 55
    .line 56
    invoke-interface {v5, v6}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-object v0, p0, Ll/d6j;->c:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    new-array v0, v0, [Ll/qfj0;

    .line 69
    .line 70
    iput-object v0, p0, Ll/d6j;->G:[Ll/qfj0;

    .line 71
    .line 72
    :goto_2
    iget-object v0, p0, Ll/d6j;->G:[Ll/qfj0;

    .line 73
    .line 74
    array-length v0, v0

    .line 75
    if-ge v2, v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Ll/d6j;->E:Ll/bsf;

    .line 78
    .line 79
    add-int/lit8 v1, v4, 0x1

    .line 80
    .line 81
    const/4 v3, 0x3

    .line 82
    invoke-interface {v0, v4, v3}, Ll/bsf;->b(II)Ll/qfj0;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v3, p0, Ll/d6j;->c:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    check-cast v3, Lcom/google/android/exoplayer2/k;

    .line 93
    .line 94
    invoke-interface {v0, v3}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Ll/d6j;->G:[Ll/qfj0;

    .line 98
    .line 99
    aput-object v0, v3, v2

    .line 100
    .line 101
    add-int/lit8 v2, v2, 0x1

    .line 102
    .line 103
    move v4, v1

    .line 104
    goto :goto_2

    .line 105
    :cond_3
    return-void
.end method

.method public m(Ll/yej0;)Ll/yej0;
    .locals 0
    .param p1    # Ll/yej0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    return-object p1
.end method

.method public final n(Ll/f31$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/f31;->a:I

    .line 2
    .line 3
    const v1, 0x6d6f6f76

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/d6j;->r(Ll/f31$a;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const v1, 0x6d6f6f66

    .line 13
    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/d6j;->q(Ll/f31$a;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/f31$a;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/f31$a;->d(Ll/f31$a;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public final o(Ll/ig60;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/d6j;->F:[Ll/qfj0;

    .line 6
    .line 7
    array-length v2, v2

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    const/16 v2, 0x8

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ll/ig60;->U(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ll/ig60;->q()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {v2}, Ll/f31;->c(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    if-eq v2, v3, :cond_1

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v1, "Skipping unsupported emsg version: "

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "FragmentedMp4Extractor"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 56
    .line 57
    .line 58
    move-result-wide v10

    .line 59
    invoke-virtual {v1}, Ll/ig60;->M()J

    .line 60
    .line 61
    .line 62
    move-result-wide v6

    .line 63
    const-wide/32 v8, 0xf4240

    .line 64
    .line 65
    .line 66
    invoke-static/range {v6 .. v11}, Ll/bmk0;->W0(JJJ)J

    .line 67
    .line 68
    .line 69
    move-result-wide v12

    .line 70
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 71
    .line 72
    .line 73
    move-result-wide v6

    .line 74
    const-wide/16 v8, 0x3e8

    .line 75
    .line 76
    invoke-static/range {v6 .. v11}, Ll/bmk0;->W0(JJJ)J

    .line 77
    .line 78
    .line 79
    move-result-wide v6

    .line 80
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 81
    .line 82
    .line 83
    move-result-wide v8

    .line 84
    invoke-virtual {v1}, Ll/ig60;->B()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v1}, Ll/ig60;->B()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v10

    .line 98
    invoke-static {v10}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    check-cast v10, Ljava/lang/String;

    .line 103
    .line 104
    move-wide/from16 v18, v6

    .line 105
    .line 106
    move-wide/from16 v20, v8

    .line 107
    .line 108
    move-wide v6, v4

    .line 109
    :goto_0
    move-object/from16 v16, v2

    .line 110
    .line 111
    move-object/from16 v17, v10

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_2
    invoke-virtual {v1}, Ll/ig60;->B()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-static {v2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v1}, Ll/ig60;->B()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-static {v6}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    move-object v10, v6

    .line 133
    check-cast v10, Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 136
    .line 137
    .line 138
    move-result-wide v15

    .line 139
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 140
    .line 141
    .line 142
    move-result-wide v11

    .line 143
    const-wide/32 v13, 0xf4240

    .line 144
    .line 145
    .line 146
    invoke-static/range {v11 .. v16}, Ll/bmk0;->W0(JJJ)J

    .line 147
    .line 148
    .line 149
    move-result-wide v6

    .line 150
    iget-wide v8, v0, Ll/d6j;->y:J

    .line 151
    .line 152
    cmp-long v11, v8, v4

    .line 153
    .line 154
    if-eqz v11, :cond_3

    .line 155
    .line 156
    add-long/2addr v8, v6

    .line 157
    goto :goto_1

    .line 158
    :cond_3
    move-wide v8, v4

    .line 159
    :goto_1
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 160
    .line 161
    .line 162
    move-result-wide v11

    .line 163
    const-wide/16 v13, 0x3e8

    .line 164
    .line 165
    invoke-static/range {v11 .. v16}, Ll/bmk0;->W0(JJJ)J

    .line 166
    .line 167
    .line 168
    move-result-wide v11

    .line 169
    invoke-virtual {v1}, Ll/ig60;->J()J

    .line 170
    .line 171
    .line 172
    move-result-wide v13

    .line 173
    move-wide/from16 v18, v11

    .line 174
    .line 175
    move-wide/from16 v20, v13

    .line 176
    .line 177
    move-wide v12, v8

    .line 178
    goto :goto_0

    .line 179
    :goto_2
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    new-array v2, v2, [B

    .line 184
    .line 185
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 186
    .line 187
    .line 188
    move-result v8

    .line 189
    const/4 v9, 0x0

    .line 190
    invoke-virtual {v1, v2, v9, v8}, Ll/ig60;->l([BII)V

    .line 191
    .line 192
    .line 193
    new-instance v15, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 194
    .line 195
    move-object/from16 v22, v2

    .line 196
    .line 197
    invoke-direct/range {v15 .. v22}, Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;-><init>(Ljava/lang/String;Ljava/lang/String;JJ[B)V

    .line 198
    .line 199
    .line 200
    new-instance v1, Ll/ig60;

    .line 201
    .line 202
    iget-object v2, v0, Ll/d6j;->k:Ll/d5f;

    .line 203
    .line 204
    invoke-virtual {v2, v15}, Ll/d5f;->a(Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)[B

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-direct {v1, v2}, Ll/ig60;-><init>([B)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    iget-object v8, v0, Ll/d6j;->F:[Ll/qfj0;

    .line 216
    .line 217
    array-length v10, v8

    .line 218
    move v11, v9

    .line 219
    :goto_3
    if-ge v11, v10, :cond_4

    .line 220
    .line 221
    aget-object v14, v8, v11

    .line 222
    .line 223
    invoke-virtual {v1, v9}, Ll/ig60;->U(I)V

    .line 224
    .line 225
    .line 226
    invoke-interface {v14, v1, v2}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 227
    .line 228
    .line 229
    add-int/lit8 v11, v11, 0x1

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_4
    cmp-long v1, v12, v4

    .line 233
    .line 234
    iget-object v4, v0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 235
    .line 236
    if-nez v1, :cond_5

    .line 237
    .line 238
    new-instance v1, Ll/d6j$a;

    .line 239
    .line 240
    invoke-direct {v1, v6, v7, v3, v2}, Ll/d6j$a;-><init>(JZI)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v4, v1}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 244
    .line 245
    .line 246
    iget v1, v0, Ll/d6j;->v:I

    .line 247
    .line 248
    add-int/2addr v1, v2

    .line 249
    iput v1, v0, Ll/d6j;->v:I

    .line 250
    .line 251
    return-void

    .line 252
    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-nez v1, :cond_6

    .line 257
    .line 258
    iget-object v1, v0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 259
    .line 260
    new-instance v3, Ll/d6j$a;

    .line 261
    .line 262
    invoke-direct {v3, v12, v13, v9, v2}, Ll/d6j$a;-><init>(JZI)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1, v3}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    iget v1, v0, Ll/d6j;->v:I

    .line 269
    .line 270
    add-int/2addr v1, v2

    .line 271
    iput v1, v0, Ll/d6j;->v:I

    .line 272
    .line 273
    return-void

    .line 274
    :cond_6
    iget-object v1, v0, Ll/d6j;->j:Ll/h0j0;

    .line 275
    .line 276
    if-eqz v1, :cond_7

    .line 277
    .line 278
    invoke-virtual {v1}, Ll/h0j0;->f()Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    if-nez v1, :cond_7

    .line 283
    .line 284
    iget-object v1, v0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 285
    .line 286
    new-instance v3, Ll/d6j$a;

    .line 287
    .line 288
    invoke-direct {v3, v12, v13, v9, v2}, Ll/d6j$a;-><init>(JZI)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1, v3}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 292
    .line 293
    .line 294
    iget v1, v0, Ll/d6j;->v:I

    .line 295
    .line 296
    add-int/2addr v1, v2

    .line 297
    iput v1, v0, Ll/d6j;->v:I

    .line 298
    .line 299
    return-void

    .line 300
    :cond_7
    iget-object v1, v0, Ll/d6j;->j:Ll/h0j0;

    .line 301
    .line 302
    if-eqz v1, :cond_8

    .line 303
    .line 304
    invoke-virtual {v1, v12, v13}, Ll/h0j0;->a(J)J

    .line 305
    .line 306
    .line 307
    move-result-wide v12

    .line 308
    :cond_8
    move-wide v15, v12

    .line 309
    iget-object v0, v0, Ll/d6j;->F:[Ll/qfj0;

    .line 310
    .line 311
    array-length v1, v0

    .line 312
    :goto_4
    if-ge v9, v1, :cond_9

    .line 313
    .line 314
    aget-object v14, v0, v9

    .line 315
    .line 316
    const/16 v19, 0x0

    .line 317
    .line 318
    const/16 v20, 0x0

    .line 319
    .line 320
    const/16 v17, 0x1

    .line 321
    .line 322
    move/from16 v18, v2

    .line 323
    .line 324
    invoke-interface/range {v14 .. v20}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 325
    .line 326
    .line 327
    add-int/lit8 v9, v9, 0x1

    .line 328
    .line 329
    goto :goto_4

    .line 330
    :cond_9
    :goto_5
    return-void
.end method

.method public final p(Ll/f31$b;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/d6j;->m:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/f31$a;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/f31$a;->e(Ll/f31$b;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget v0, p1, Ll/f31;->a:I

    .line 22
    .line 23
    const v1, 0x73696478

    .line 24
    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    iget-object p1, p1, Ll/f31$b;->b:Ll/ig60;

    .line 29
    .line 30
    invoke-static {p1, p2, p3}, Ll/d6j;->A(Ll/ig60;J)Landroid/util/Pair;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p2, Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide p2

    .line 42
    iput-wide p2, p0, Ll/d6j;->y:J

    .line 43
    .line 44
    iget-object p2, p0, Ll/d6j;->E:Ll/bsf;

    .line 45
    .line 46
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p1, Ll/mke0;

    .line 49
    .line 50
    invoke-interface {p2, p1}, Ll/bsf;->k(Ll/mke0;)V

    .line 51
    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Ll/d6j;->H:Z

    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    const p2, 0x656d7367

    .line 58
    .line 59
    .line 60
    if-ne v0, p2, :cond_2

    .line 61
    .line 62
    iget-object p1, p1, Ll/f31$b;->b:Ll/ig60;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/d6j;->o(Ll/ig60;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public final q(Ll/f31$a;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    iget-object v1, p0, Ll/d6j;->b:Ll/yej0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v1, v2

    .line 11
    :goto_0
    iget v3, p0, Ll/d6j;->a:I

    .line 12
    .line 13
    iget-object v4, p0, Ll/d6j;->h:[B

    .line 14
    .line 15
    invoke-static {p1, v0, v1, v3, v4}, Ll/d6j;->u(Ll/f31$a;Landroid/util/SparseArray;ZI[B)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Ll/f31$a;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p1}, Ll/d6j;->i(Ljava/util/List;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    move v1, v2

    .line 33
    :goto_1
    if-ge v1, v0, :cond_1

    .line 34
    .line 35
    iget-object v3, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ll/d6j$b;

    .line 42
    .line 43
    invoke-virtual {v3, p1}, Ll/d6j$b;->n(Lcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-wide v0, p0, Ll/d6j;->w:J

    .line 50
    .line 51
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    cmp-long p1, v0, v3

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    iget-object p1, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :goto_2
    if-ge v2, p1, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ll/d6j$b;

    .line 75
    .line 76
    iget-wide v5, p0, Ll/d6j;->w:J

    .line 77
    .line 78
    invoke-virtual {v0, v5, v6}, Ll/d6j$b;->l(J)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    iput-wide v3, p0, Ll/d6j;->w:J

    .line 85
    .line 86
    :cond_3
    return-void
.end method

.method public final r(Ll/f31$a;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/d6j;->b:Ll/yej0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    const-string v3, "Unexpected moov box."

    .line 11
    .line 12
    invoke-static {v0, v3}, Ll/w11;->h(ZLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Ll/f31$a;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/d6j;->i(Ljava/util/List;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    const v0, 0x6d766578

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/f31$a;

    .line 33
    .line 34
    new-instance v11, Landroid/util/SparseArray;

    .line 35
    .line 36
    invoke-direct {v11}, Landroid/util/SparseArray;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v3, v0, Ll/f31$a;->c:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    move-wide v5, v4

    .line 51
    move v4, v1

    .line 52
    :goto_1
    if-ge v4, v3, :cond_3

    .line 53
    .line 54
    iget-object v8, v0, Ll/f31$a;->c:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    check-cast v8, Ll/f31$b;

    .line 61
    .line 62
    iget v9, v8, Ll/f31;->a:I

    .line 63
    .line 64
    const v10, 0x74726578

    .line 65
    .line 66
    .line 67
    if-ne v9, v10, :cond_1

    .line 68
    .line 69
    iget-object v8, v8, Ll/f31$b;->b:Ll/ig60;

    .line 70
    .line 71
    invoke-static {v8}, Ll/d6j;->E(Ll/ig60;)Landroid/util/Pair;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    iget-object v9, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v9, Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    iget-object v8, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v8, Ll/asd;

    .line 86
    .line 87
    invoke-virtual {v11, v9, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_1
    const v10, 0x6d656864

    .line 92
    .line 93
    .line 94
    if-ne v9, v10, :cond_2

    .line 95
    .line 96
    iget-object v5, v8, Ll/f31$b;->b:Ll/ig60;

    .line 97
    .line 98
    invoke-static {v5}, Ll/d6j;->t(Ll/ig60;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v5

    .line 102
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    new-instance v4, Ll/ilj;

    .line 106
    .line 107
    invoke-direct {v4}, Ll/ilj;-><init>()V

    .line 108
    .line 109
    .line 110
    iget v0, p0, Ll/d6j;->a:I

    .line 111
    .line 112
    and-int/lit8 v0, v0, 0x10

    .line 113
    .line 114
    if-eqz v0, :cond_4

    .line 115
    .line 116
    move v8, v2

    .line 117
    goto :goto_3

    .line 118
    :cond_4
    move v8, v1

    .line 119
    :goto_3
    new-instance v10, Ll/c6j;

    .line 120
    .line 121
    invoke-direct {v10, p0}, Ll/c6j;-><init>(Ll/d6j;)V

    .line 122
    .line 123
    .line 124
    const/4 v9, 0x0

    .line 125
    move-object v3, p1

    .line 126
    invoke-static/range {v3 .. v10}, Ll/g31;->B(Ll/f31$a;Ll/ilj;JLcom/google/android/exoplayer2/drm/DrmInitData;ZZLl/adj;)Ljava/util/List;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iget-object v3, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 135
    .line 136
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-nez v3, :cond_6

    .line 141
    .line 142
    :goto_4
    if-ge v1, v0, :cond_5

    .line 143
    .line 144
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, Ll/ufj0;

    .line 149
    .line 150
    iget-object v3, v2, Ll/ufj0;->a:Ll/yej0;

    .line 151
    .line 152
    new-instance v4, Ll/d6j$b;

    .line 153
    .line 154
    iget-object v5, p0, Ll/d6j;->E:Ll/bsf;

    .line 155
    .line 156
    iget v6, v3, Ll/yej0;->b:I

    .line 157
    .line 158
    invoke-interface {v5, v1, v6}, Ll/bsf;->b(II)Ll/qfj0;

    .line 159
    .line 160
    .line 161
    move-result-object v5

    .line 162
    iget v6, v3, Ll/yej0;->a:I

    .line 163
    .line 164
    invoke-virtual {p0, v11, v6}, Ll/d6j;->g(Landroid/util/SparseArray;I)Ll/asd;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    invoke-direct {v4, v5, v2, v6}, Ll/d6j$b;-><init>(Ll/qfj0;Ll/ufj0;Ll/asd;)V

    .line 169
    .line 170
    .line 171
    iget-object v2, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 172
    .line 173
    iget v5, v3, Ll/yej0;->a:I

    .line 174
    .line 175
    invoke-virtual {v2, v5, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    iget-wide v4, p0, Ll/d6j;->x:J

    .line 179
    .line 180
    iget-wide v2, v3, Ll/yej0;->e:J

    .line 181
    .line 182
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 183
    .line 184
    .line 185
    move-result-wide v2

    .line 186
    iput-wide v2, p0, Ll/d6j;->x:J

    .line 187
    .line 188
    add-int/lit8 v1, v1, 0x1

    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_5
    iget-object p0, p0, Ll/d6j;->E:Ll/bsf;

    .line 192
    .line 193
    invoke-interface {p0}, Ll/bsf;->l()V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_6
    iget-object v3, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 198
    .line 199
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    if-ne v3, v0, :cond_7

    .line 204
    .line 205
    goto :goto_5

    .line 206
    :cond_7
    move v2, v1

    .line 207
    :goto_5
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 208
    .line 209
    .line 210
    :goto_6
    if-ge v1, v0, :cond_8

    .line 211
    .line 212
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    check-cast v2, Ll/ufj0;

    .line 217
    .line 218
    iget-object v3, v2, Ll/ufj0;->a:Ll/yej0;

    .line 219
    .line 220
    iget-object v4, p0, Ll/d6j;->d:Landroid/util/SparseArray;

    .line 221
    .line 222
    iget v5, v3, Ll/yej0;->a:I

    .line 223
    .line 224
    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    check-cast v4, Ll/d6j$b;

    .line 229
    .line 230
    iget v3, v3, Ll/yej0;->a:I

    .line 231
    .line 232
    invoke-virtual {p0, v11, v3}, Ll/d6j;->g(Landroid/util/SparseArray;I)Ll/asd;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    invoke-virtual {v4, v2, v3}, Ll/d6j$b;->j(Ll/ufj0;Ll/asd;)V

    .line 237
    .line 238
    .line 239
    add-int/lit8 v1, v1, 0x1

    .line 240
    .line 241
    goto :goto_6

    .line 242
    :cond_8
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public final s(J)V
    .locals 11

    .line 1
    :cond_0
    iget-object v0, p0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/d6j;->n:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/d6j$a;

    .line 16
    .line 17
    iget v1, p0, Ll/d6j;->v:I

    .line 18
    .line 19
    iget v2, v0, Ll/d6j$a;->c:I

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    iput v1, p0, Ll/d6j;->v:I

    .line 23
    .line 24
    iget-wide v1, v0, Ll/d6j$a;->a:J

    .line 25
    .line 26
    iget-boolean v3, v0, Ll/d6j$a;->b:Z

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    add-long/2addr v1, p1

    .line 31
    :cond_1
    iget-object v3, p0, Ll/d6j;->j:Ll/h0j0;

    .line 32
    .line 33
    if-eqz v3, :cond_2

    .line 34
    .line 35
    invoke-virtual {v3, v1, v2}, Ll/h0j0;->a(J)J

    .line 36
    .line 37
    .line 38
    move-result-wide v1

    .line 39
    :cond_2
    move-wide v4, v1

    .line 40
    iget-object v1, p0, Ll/d6j;->F:[Ll/qfj0;

    .line 41
    .line 42
    array-length v2, v1

    .line 43
    const/4 v3, 0x0

    .line 44
    move v10, v3

    .line 45
    :goto_0
    if-ge v10, v2, :cond_0

    .line 46
    .line 47
    aget-object v3, v1, v10

    .line 48
    .line 49
    iget v7, v0, Ll/d6j$a;->c:I

    .line 50
    .line 51
    iget v8, p0, Ll/d6j;->v:I

    .line 52
    .line 53
    const/4 v9, 0x0

    .line 54
    const/4 v6, 0x1

    .line 55
    invoke-interface/range {v3 .. v9}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v10, v10, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    return-void
.end method
