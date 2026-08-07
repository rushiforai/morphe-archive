.class public final Ll/c710;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zrf;
.implements Ll/mke0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c710$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final y:Ll/esf;


# instance fields
.field public final a:I

.field public final b:Ll/ig60;

.field public final c:Ll/ig60;

.field public final d:Ll/ig60;

.field public final e:Ll/ig60;

.field public final f:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ll/f31$a;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ll/qke0;

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/exoplayer2/metadata/Metadata$Entry;",
            ">;"
        }
    .end annotation
.end field

.field public i:I

.field public j:I

.field public k:J

.field public l:I

.field public m:Ll/ig60;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Ll/bsf;

.field public s:[Ll/c710$a;

.field public t:[[J

.field public u:I

.field public v:J

.field public w:I

.field public x:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/b710;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b710;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c710;->y:Ll/esf;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, v0}, Ll/c710;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/c710;->a:I

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    and-int/2addr p1, v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move p1, v1

    .line 14
    :goto_0
    iput p1, p0, Ll/c710;->i:I

    .line 15
    .line 16
    new-instance p1, Ll/qke0;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/qke0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/c710;->g:Ll/qke0;

    .line 22
    .line 23
    new-instance p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/c710;->h:Ljava/util/List;

    .line 29
    .line 30
    new-instance p1, Ll/ig60;

    .line 31
    .line 32
    const/16 v2, 0x10

    .line 33
    .line 34
    invoke-direct {p1, v2}, Ll/ig60;-><init>(I)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/c710;->e:Ll/ig60;

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayDeque;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 45
    .line 46
    new-instance p1, Ll/ig60;

    .line 47
    .line 48
    sget-object v2, Ll/jb20;->a:[B

    .line 49
    .line 50
    invoke-direct {p1, v2}, Ll/ig60;-><init>([B)V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Ll/c710;->b:Ll/ig60;

    .line 54
    .line 55
    new-instance p1, Ll/ig60;

    .line 56
    .line 57
    invoke-direct {p1, v0}, Ll/ig60;-><init>(I)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Ll/c710;->c:Ll/ig60;

    .line 61
    .line 62
    new-instance p1, Ll/ig60;

    .line 63
    .line 64
    invoke-direct {p1}, Ll/ig60;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Ll/c710;->d:Ll/ig60;

    .line 68
    .line 69
    const/4 p1, -0x1

    .line 70
    iput p1, p0, Ll/c710;->n:I

    .line 71
    .line 72
    sget-object p1, Ll/bsf;->i0:Ll/bsf;

    .line 73
    .line 74
    iput-object p1, p0, Ll/c710;->r:Ll/bsf;

    .line 75
    .line 76
    new-array p1, v1, [Ll/c710$a;

    .line 77
    .line 78
    iput-object p1, p0, Ll/c710;->s:[Ll/c710$a;

    .line 79
    .line 80
    return-void
.end method

.method public static C(I)Z
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
    const v0, 0x65647473

    .line 27
    .line 28
    .line 29
    if-eq p0, v0, :cond_1

    .line 30
    .line 31
    const v0, 0x6d657461

    .line 32
    .line 33
    .line 34
    if-ne p0, v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public static D(I)Z
    .locals 1

    .line 1
    const v0, 0x6d646864

    .line 2
    .line 3
    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const v0, 0x6d766864

    .line 7
    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const v0, 0x68646c72    # 4.3148E24f

    .line 12
    .line 13
    .line 14
    if-eq p0, v0, :cond_1

    .line 15
    .line 16
    const v0, 0x73747364

    .line 17
    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const v0, 0x73747473

    .line 22
    .line 23
    .line 24
    if-eq p0, v0, :cond_1

    .line 25
    .line 26
    const v0, 0x73747373

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
    const v0, 0x656c7374

    .line 37
    .line 38
    .line 39
    if-eq p0, v0, :cond_1

    .line 40
    .line 41
    const v0, 0x73747363

    .line 42
    .line 43
    .line 44
    if-eq p0, v0, :cond_1

    .line 45
    .line 46
    const v0, 0x7374737a

    .line 47
    .line 48
    .line 49
    if-eq p0, v0, :cond_1

    .line 50
    .line 51
    const v0, 0x73747a32

    .line 52
    .line 53
    .line 54
    if-eq p0, v0, :cond_1

    .line 55
    .line 56
    const v0, 0x7374636f

    .line 57
    .line 58
    .line 59
    if-eq p0, v0, :cond_1

    .line 60
    .line 61
    const v0, 0x636f3634

    .line 62
    .line 63
    .line 64
    if-eq p0, v0, :cond_1

    .line 65
    .line 66
    const v0, 0x746b6864

    .line 67
    .line 68
    .line 69
    if-eq p0, v0, :cond_1

    .line 70
    .line 71
    const v0, 0x66747970

    .line 72
    .line 73
    .line 74
    if-eq p0, v0, :cond_1

    .line 75
    .line 76
    const v0, 0x75647461

    .line 77
    .line 78
    .line 79
    if-eq p0, v0, :cond_1

    .line 80
    .line 81
    const v0, 0x6b657973

    .line 82
    .line 83
    .line 84
    if-eq p0, v0, :cond_1

    .line 85
    .line 86
    const v0, 0x696c7374

    .line 87
    .line 88
    .line 89
    if-ne p0, v0, :cond_0

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    const/4 p0, 0x0

    .line 93
    return p0

    .line 94
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 95
    return p0
.end method

.method public static synthetic j(Ll/yej0;)Ll/yej0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k()[Ll/zrf;
    .locals 3

    .line 1
    new-instance v0, Ll/c710;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c710;-><init>()V

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

.method public static l(I)I
    .locals 1

    .line 1
    const v0, 0x68656963

    .line 2
    .line 3
    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const v0, 0x71742020

    .line 7
    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x2

    .line 16
    return p0
.end method

.method public static m([Ll/c710$a;)[[J
    .locals 15

    .line 1
    array-length v0, p0

    .line 2
    new-array v0, v0, [[J

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    new-array v1, v1, [I

    .line 6
    .line 7
    array-length v2, p0

    .line 8
    new-array v2, v2, [J

    .line 9
    .line 10
    array-length v3, p0

    .line 11
    new-array v3, v3, [Z

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    move v5, v4

    .line 15
    :goto_0
    array-length v6, p0

    .line 16
    if-ge v5, v6, :cond_0

    .line 17
    .line 18
    aget-object v6, p0, v5

    .line 19
    .line 20
    iget-object v6, v6, Ll/c710$a;->b:Ll/ufj0;

    .line 21
    .line 22
    iget v6, v6, Ll/ufj0;->b:I

    .line 23
    .line 24
    new-array v6, v6, [J

    .line 25
    .line 26
    aput-object v6, v0, v5

    .line 27
    .line 28
    aget-object v6, p0, v5

    .line 29
    .line 30
    iget-object v6, v6, Ll/c710$a;->b:Ll/ufj0;

    .line 31
    .line 32
    iget-object v6, v6, Ll/ufj0;->f:[J

    .line 33
    .line 34
    aget-wide v7, v6, v4

    .line 35
    .line 36
    aput-wide v7, v2, v5

    .line 37
    .line 38
    add-int/lit8 v5, v5, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-wide/16 v5, 0x0

    .line 42
    .line 43
    move v7, v4

    .line 44
    :goto_1
    array-length v8, p0

    .line 45
    if-ge v7, v8, :cond_4

    .line 46
    .line 47
    const-wide v8, 0x7fffffffffffffffL

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    const/4 v10, -0x1

    .line 53
    move v11, v4

    .line 54
    :goto_2
    array-length v12, p0

    .line 55
    if-ge v11, v12, :cond_2

    .line 56
    .line 57
    aget-boolean v12, v3, v11

    .line 58
    .line 59
    if-nez v12, :cond_1

    .line 60
    .line 61
    aget-wide v12, v2, v11

    .line 62
    .line 63
    cmp-long v14, v12, v8

    .line 64
    .line 65
    if-gtz v14, :cond_1

    .line 66
    .line 67
    move v10, v11

    .line 68
    move-wide v8, v12

    .line 69
    :cond_1
    add-int/lit8 v11, v11, 0x1

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    aget v8, v1, v10

    .line 73
    .line 74
    aget-object v9, v0, v10

    .line 75
    .line 76
    aput-wide v5, v9, v8

    .line 77
    .line 78
    aget-object v11, p0, v10

    .line 79
    .line 80
    iget-object v11, v11, Ll/c710$a;->b:Ll/ufj0;

    .line 81
    .line 82
    iget-object v12, v11, Ll/ufj0;->d:[I

    .line 83
    .line 84
    aget v12, v12, v8

    .line 85
    .line 86
    int-to-long v12, v12

    .line 87
    add-long/2addr v5, v12

    .line 88
    const/4 v12, 0x1

    .line 89
    add-int/2addr v8, v12

    .line 90
    aput v8, v1, v10

    .line 91
    .line 92
    array-length v9, v9

    .line 93
    if-ge v8, v9, :cond_3

    .line 94
    .line 95
    iget-object v9, v11, Ll/ufj0;->f:[J

    .line 96
    .line 97
    aget-wide v8, v9, v8

    .line 98
    .line 99
    aput-wide v8, v2, v10

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    aput-boolean v12, v3, v10

    .line 103
    .line 104
    add-int/lit8 v7, v7, 0x1

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    return-object v0
.end method

.method public static p(Ll/ufj0;J)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ufj0;->a(J)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/ufj0;->b(J)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public static r(Ll/ufj0;JJ)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c710;->p(Ll/ufj0;J)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, -0x1

    .line 6
    if-ne p1, p2, :cond_0

    .line 7
    .line 8
    return-wide p3

    .line 9
    :cond_0
    iget-object p0, p0, Ll/ufj0;->c:[J

    .line 10
    .line 11
    aget-wide p1, p0, p1

    .line 12
    .line 13
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->min(JJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    return-wide p0
.end method

.method public static v(Ll/ig60;)I
    .locals 1

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
    invoke-static {v0}, Ll/c710;->l(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    const/4 v0, 0x4

    .line 18
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/ig60;->a()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-lez v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v0}, Ll/c710;->l(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    return v0

    .line 38
    :cond_2
    const/4 p0, 0x0

    .line 39
    return p0
.end method


# virtual methods
.method public final A(Ll/asf;Ll/ll80;)I
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
    invoke-interface {v1}, Ll/asf;->getPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget v4, v0, Ll/c710;->n:I

    .line 10
    .line 11
    const/4 v5, -0x1

    .line 12
    if-ne v4, v5, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v2, v3}, Ll/c710;->q(J)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    iput v4, v0, Ll/c710;->n:I

    .line 19
    .line 20
    if-ne v4, v5, :cond_0

    .line 21
    .line 22
    return v5

    .line 23
    :cond_0
    iget-object v4, v0, Ll/c710;->s:[Ll/c710$a;

    .line 24
    .line 25
    iget v6, v0, Ll/c710;->n:I

    .line 26
    .line 27
    aget-object v4, v4, v6

    .line 28
    .line 29
    iget-object v6, v4, Ll/c710$a;->c:Ll/qfj0;

    .line 30
    .line 31
    iget v14, v4, Ll/c710$a;->e:I

    .line 32
    .line 33
    iget-object v7, v4, Ll/c710$a;->b:Ll/ufj0;

    .line 34
    .line 35
    iget-object v8, v7, Ll/ufj0;->c:[J

    .line 36
    .line 37
    aget-wide v9, v8, v14

    .line 38
    .line 39
    iget-object v7, v7, Ll/ufj0;->d:[I

    .line 40
    .line 41
    aget v7, v7, v14

    .line 42
    .line 43
    iget-object v8, v4, Ll/c710$a;->d:Ll/ckj0;

    .line 44
    .line 45
    sub-long v2, v9, v2

    .line 46
    .line 47
    iget v11, v0, Ll/c710;->o:I

    .line 48
    .line 49
    int-to-long v11, v11

    .line 50
    add-long/2addr v2, v11

    .line 51
    const-wide/16 v11, 0x0

    .line 52
    .line 53
    cmp-long v11, v2, v11

    .line 54
    .line 55
    const/4 v15, 0x1

    .line 56
    if-ltz v11, :cond_1

    .line 57
    .line 58
    const-wide/32 v11, 0x40000

    .line 59
    .line 60
    .line 61
    cmp-long v11, v2, v11

    .line 62
    .line 63
    if-ltz v11, :cond_2

    .line 64
    .line 65
    :cond_1
    move-object/from16 v0, p2

    .line 66
    .line 67
    goto/16 :goto_4

    .line 68
    .line 69
    :cond_2
    iget-object v9, v4, Ll/c710$a;->a:Ll/yej0;

    .line 70
    .line 71
    iget v9, v9, Ll/yej0;->g:I

    .line 72
    .line 73
    if-ne v9, v15, :cond_3

    .line 74
    .line 75
    const-wide/16 v9, 0x8

    .line 76
    .line 77
    add-long/2addr v2, v9

    .line 78
    add-int/lit8 v7, v7, -0x8

    .line 79
    .line 80
    :cond_3
    long-to-int v2, v2

    .line 81
    invoke-interface {v1, v2}, Ll/asf;->o(I)V

    .line 82
    .line 83
    .line 84
    iget-object v2, v4, Ll/c710$a;->a:Ll/yej0;

    .line 85
    .line 86
    iget v3, v2, Ll/yej0;->j:I

    .line 87
    .line 88
    const/4 v9, 0x0

    .line 89
    const/4 v10, 0x0

    .line 90
    if-eqz v3, :cond_7

    .line 91
    .line 92
    iget-object v2, v0, Ll/c710;->c:Ll/ig60;

    .line 93
    .line 94
    invoke-virtual {v2}, Ll/ig60;->e()[B

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    aput-byte v10, v2, v10

    .line 99
    .line 100
    aput-byte v10, v2, v15

    .line 101
    .line 102
    const/4 v3, 0x2

    .line 103
    aput-byte v10, v2, v3

    .line 104
    .line 105
    iget-object v3, v4, Ll/c710$a;->a:Ll/yej0;

    .line 106
    .line 107
    iget v3, v3, Ll/yej0;->j:I

    .line 108
    .line 109
    rsub-int/lit8 v11, v3, 0x4

    .line 110
    .line 111
    :goto_0
    iget v12, v0, Ll/c710;->p:I

    .line 112
    .line 113
    if-ge v12, v7, :cond_6

    .line 114
    .line 115
    iget v12, v0, Ll/c710;->q:I

    .line 116
    .line 117
    if-nez v12, :cond_5

    .line 118
    .line 119
    invoke-interface {v1, v2, v11, v3}, Ll/asf;->readFully([BII)V

    .line 120
    .line 121
    .line 122
    iget v12, v0, Ll/c710;->o:I

    .line 123
    .line 124
    add-int/2addr v12, v3

    .line 125
    iput v12, v0, Ll/c710;->o:I

    .line 126
    .line 127
    iget-object v12, v0, Ll/c710;->c:Ll/ig60;

    .line 128
    .line 129
    invoke-virtual {v12, v10}, Ll/ig60;->U(I)V

    .line 130
    .line 131
    .line 132
    iget-object v12, v0, Ll/c710;->c:Ll/ig60;

    .line 133
    .line 134
    invoke-virtual {v12}, Ll/ig60;->q()I

    .line 135
    .line 136
    .line 137
    move-result v12

    .line 138
    if-ltz v12, :cond_4

    .line 139
    .line 140
    iput v12, v0, Ll/c710;->q:I

    .line 141
    .line 142
    iget-object v12, v0, Ll/c710;->b:Ll/ig60;

    .line 143
    .line 144
    invoke-virtual {v12, v10}, Ll/ig60;->U(I)V

    .line 145
    .line 146
    .line 147
    iget-object v12, v0, Ll/c710;->b:Ll/ig60;

    .line 148
    .line 149
    const/4 v13, 0x4

    .line 150
    invoke-interface {v6, v12, v13}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 151
    .line 152
    .line 153
    iget v12, v0, Ll/c710;->p:I

    .line 154
    .line 155
    add-int/2addr v12, v13

    .line 156
    iput v12, v0, Ll/c710;->p:I

    .line 157
    .line 158
    add-int/2addr v7, v11

    .line 159
    goto :goto_0

    .line 160
    :cond_4
    const-string v0, "Invalid NAL length"

    .line 161
    .line 162
    invoke-static {v0, v9}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    throw v0

    .line 167
    :cond_5
    invoke-interface {v6, v1, v12, v10}, Ll/qfj0;->e(Ll/e6c;IZ)I

    .line 168
    .line 169
    .line 170
    move-result v12

    .line 171
    iget v13, v0, Ll/c710;->o:I

    .line 172
    .line 173
    add-int/2addr v13, v12

    .line 174
    iput v13, v0, Ll/c710;->o:I

    .line 175
    .line 176
    iget v13, v0, Ll/c710;->p:I

    .line 177
    .line 178
    add-int/2addr v13, v12

    .line 179
    iput v13, v0, Ll/c710;->p:I

    .line 180
    .line 181
    iget v13, v0, Ll/c710;->q:I

    .line 182
    .line 183
    sub-int/2addr v13, v12

    .line 184
    iput v13, v0, Ll/c710;->q:I

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_6
    move v11, v7

    .line 188
    goto :goto_2

    .line 189
    :cond_7
    iget-object v2, v2, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 190
    .line 191
    iget-object v2, v2, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 192
    .line 193
    const-string v3, "audio/ac4"

    .line 194
    .line 195
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    if-eqz v2, :cond_9

    .line 200
    .line 201
    iget v2, v0, Ll/c710;->p:I

    .line 202
    .line 203
    if-nez v2, :cond_8

    .line 204
    .line 205
    iget-object v2, v0, Ll/c710;->d:Ll/ig60;

    .line 206
    .line 207
    invoke-static {v7, v2}, Ll/d9;->a(ILl/ig60;)V

    .line 208
    .line 209
    .line 210
    iget-object v2, v0, Ll/c710;->d:Ll/ig60;

    .line 211
    .line 212
    const/4 v3, 0x7

    .line 213
    invoke-interface {v6, v2, v3}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 214
    .line 215
    .line 216
    iget v2, v0, Ll/c710;->p:I

    .line 217
    .line 218
    add-int/2addr v2, v3

    .line 219
    iput v2, v0, Ll/c710;->p:I

    .line 220
    .line 221
    :cond_8
    add-int/lit8 v7, v7, 0x7

    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_9
    if-eqz v8, :cond_a

    .line 225
    .line 226
    invoke-virtual {v8, v1}, Ll/ckj0;->d(Ll/asf;)V

    .line 227
    .line 228
    .line 229
    :cond_a
    :goto_1
    iget v2, v0, Ll/c710;->p:I

    .line 230
    .line 231
    if-ge v2, v7, :cond_6

    .line 232
    .line 233
    sub-int v2, v7, v2

    .line 234
    .line 235
    invoke-interface {v6, v1, v2, v10}, Ll/qfj0;->e(Ll/e6c;IZ)I

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    iget v3, v0, Ll/c710;->o:I

    .line 240
    .line 241
    add-int/2addr v3, v2

    .line 242
    iput v3, v0, Ll/c710;->o:I

    .line 243
    .line 244
    iget v3, v0, Ll/c710;->p:I

    .line 245
    .line 246
    add-int/2addr v3, v2

    .line 247
    iput v3, v0, Ll/c710;->p:I

    .line 248
    .line 249
    iget v3, v0, Ll/c710;->q:I

    .line 250
    .line 251
    sub-int/2addr v3, v2

    .line 252
    iput v3, v0, Ll/c710;->q:I

    .line 253
    .line 254
    goto :goto_1

    .line 255
    :goto_2
    iget-object v1, v4, Ll/c710$a;->b:Ll/ufj0;

    .line 256
    .line 257
    iget-object v2, v1, Ll/ufj0;->f:[J

    .line 258
    .line 259
    aget-wide v12, v2, v14

    .line 260
    .line 261
    iget-object v1, v1, Ll/ufj0;->g:[I

    .line 262
    .line 263
    aget v1, v1, v14

    .line 264
    .line 265
    if-eqz v8, :cond_b

    .line 266
    .line 267
    move-object v7, v6

    .line 268
    move-object v6, v8

    .line 269
    move-object v2, v9

    .line 270
    move-wide v8, v12

    .line 271
    const/4 v12, 0x0

    .line 272
    const/4 v13, 0x0

    .line 273
    move/from16 v16, v10

    .line 274
    .line 275
    move v10, v1

    .line 276
    move/from16 v1, v16

    .line 277
    .line 278
    invoke-virtual/range {v6 .. v13}, Ll/ckj0;->c(Ll/qfj0;JIIILl/qfj0$a;)V

    .line 279
    .line 280
    .line 281
    add-int/2addr v14, v15

    .line 282
    iget-object v3, v4, Ll/c710$a;->b:Ll/ufj0;

    .line 283
    .line 284
    iget v3, v3, Ll/ufj0;->b:I

    .line 285
    .line 286
    if-ne v14, v3, :cond_c

    .line 287
    .line 288
    invoke-virtual {v6, v7, v2}, Ll/ckj0;->a(Ll/qfj0;Ll/qfj0$a;)V

    .line 289
    .line 290
    .line 291
    goto :goto_3

    .line 292
    :cond_b
    move v2, v1

    .line 293
    move-object v7, v6

    .line 294
    move v1, v10

    .line 295
    move v10, v11

    .line 296
    move-wide v8, v12

    .line 297
    const/4 v11, 0x0

    .line 298
    const/4 v12, 0x0

    .line 299
    move-wide v7, v8

    .line 300
    move v9, v2

    .line 301
    invoke-interface/range {v6 .. v12}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 302
    .line 303
    .line 304
    :cond_c
    :goto_3
    iget v2, v4, Ll/c710$a;->e:I

    .line 305
    .line 306
    add-int/2addr v2, v15

    .line 307
    iput v2, v4, Ll/c710$a;->e:I

    .line 308
    .line 309
    iput v5, v0, Ll/c710;->n:I

    .line 310
    .line 311
    iput v1, v0, Ll/c710;->o:I

    .line 312
    .line 313
    iput v1, v0, Ll/c710;->p:I

    .line 314
    .line 315
    iput v1, v0, Ll/c710;->q:I

    .line 316
    .line 317
    return v1

    .line 318
    :goto_4
    iput-wide v9, v0, Ll/ll80;->a:J

    .line 319
    .line 320
    return v15
.end method

.method public final B(Ll/asf;Ll/ll80;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c710;->g:Ll/qke0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c710;->h:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2, v1}, Ll/qke0;->c(Ll/asf;Ll/ll80;Ljava/util/List;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget-wide v0, p2, Ll/ll80;->a:J

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long p2, v0, v2

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/c710;->n()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return p1
.end method

.method public final E(Ll/c710$a;J)V
    .locals 2

    .line 1
    iget-object p0, p1, Ll/c710$a;->b:Ll/ufj0;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p3}, Ll/ufj0;->a(J)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p2, p3}, Ll/ufj0;->b(J)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    :cond_0
    iput v0, p1, Ll/c710$a;->e:I

    .line 15
    .line 16
    return-void
.end method

.method public a(JJ)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/c710;->l:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Ll/c710;->n:I

    .line 11
    .line 12
    iput v0, p0, Ll/c710;->o:I

    .line 13
    .line 14
    iput v0, p0, Ll/c710;->p:I

    .line 15
    .line 16
    iput v0, p0, Ll/c710;->q:I

    .line 17
    .line 18
    const-wide/16 v1, 0x0

    .line 19
    .line 20
    cmp-long p1, p1, v1

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget p1, p0, Ll/c710;->i:I

    .line 25
    .line 26
    const/4 p2, 0x3

    .line 27
    if-eq p1, p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/c710;->n()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p0, Ll/c710;->g:Ll/qke0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/qke0;->g()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/c710;->h:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p1, p0, Ll/c710;->s:[Ll/c710$a;

    .line 45
    .line 46
    array-length p2, p1

    .line 47
    :goto_0
    if-ge v0, p2, :cond_3

    .line 48
    .line 49
    aget-object v1, p1, v0

    .line 50
    .line 51
    invoke-virtual {p0, v1, p3, p4}, Ll/c710;->E(Ll/c710$a;J)V

    .line 52
    .line 53
    .line 54
    iget-object v1, v1, Ll/c710$a;->d:Ll/ckj0;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/ckj0;->b()V

    .line 59
    .line 60
    .line 61
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    return-void
.end method

.method public b(Ll/bsf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c710;->r:Ll/bsf;

    .line 2
    .line 3
    return-void
.end method

.method public d(J)Ll/mke0$a;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/c710;->o(JI)Ll/mke0$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public f(Ll/asf;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget p0, p0, Ll/c710;->a:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p1, p0}, Ll/wsf0;->d(Ll/asf;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public h(Ll/asf;Ll/ll80;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :cond_0
    iget v0, p0, Ll/c710;->i:I

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/c710;->B(Ll/asf;Ll/ll80;)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/c710;->A(Ll/asf;Ll/ll80;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_3
    invoke-virtual {p0, p1, p2}, Ll/c710;->z(Ll/asf;Ll/ll80;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    return v1

    .line 36
    :cond_4
    invoke-virtual {p0, p1}, Ll/c710;->y(Ll/asf;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    const/4 p0, -0x1

    .line 43
    return p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/c710;->v:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/c710;->i:I

    .line 3
    .line 4
    iput v0, p0, Ll/c710;->l:I

    .line 5
    .line 6
    return-void
.end method

.method public o(JI)Ll/mke0$a;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move/from16 v3, p3

    .line 6
    .line 7
    iget-object v4, v0, Ll/c710;->s:[Ll/c710$a;

    .line 8
    .line 9
    array-length v5, v4

    .line 10
    if-nez v5, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/mke0$a;

    .line 13
    .line 14
    sget-object v1, Ll/oke0;->c:Ll/oke0;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/mke0$a;-><init>(Ll/oke0;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    const/4 v5, -0x1

    .line 21
    if-eq v3, v5, :cond_1

    .line 22
    .line 23
    move v6, v3

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget v6, v0, Ll/c710;->u:I

    .line 26
    .line 27
    :goto_0
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    const-wide/16 v9, -0x1

    .line 33
    .line 34
    if-eq v6, v5, :cond_3

    .line 35
    .line 36
    aget-object v4, v4, v6

    .line 37
    .line 38
    iget-object v4, v4, Ll/c710$a;->b:Ll/ufj0;

    .line 39
    .line 40
    invoke-static {v4, v1, v2}, Ll/c710;->p(Ll/ufj0;J)I

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-ne v6, v5, :cond_2

    .line 45
    .line 46
    new-instance v0, Ll/mke0$a;

    .line 47
    .line 48
    sget-object v1, Ll/oke0;->c:Ll/oke0;

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ll/mke0$a;-><init>(Ll/oke0;)V

    .line 51
    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_2
    iget-object v11, v4, Ll/ufj0;->f:[J

    .line 55
    .line 56
    aget-wide v12, v11, v6

    .line 57
    .line 58
    iget-object v11, v4, Ll/ufj0;->c:[J

    .line 59
    .line 60
    aget-wide v14, v11, v6

    .line 61
    .line 62
    cmp-long v11, v12, v1

    .line 63
    .line 64
    if-gez v11, :cond_4

    .line 65
    .line 66
    iget v11, v4, Ll/ufj0;->b:I

    .line 67
    .line 68
    add-int/lit8 v11, v11, -0x1

    .line 69
    .line 70
    if-ge v6, v11, :cond_4

    .line 71
    .line 72
    invoke-virtual {v4, v1, v2}, Ll/ufj0;->b(J)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eq v1, v5, :cond_4

    .line 77
    .line 78
    if-eq v1, v6, :cond_4

    .line 79
    .line 80
    iget-object v2, v4, Ll/ufj0;->f:[J

    .line 81
    .line 82
    aget-wide v9, v2, v1

    .line 83
    .line 84
    iget-object v2, v4, Ll/ufj0;->c:[J

    .line 85
    .line 86
    aget-wide v1, v2, v1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    const-wide v14, 0x7fffffffffffffffL

    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    move-wide v12, v1

    .line 95
    :cond_4
    move-wide v1, v9

    .line 96
    move-wide v9, v7

    .line 97
    :goto_1
    if-ne v3, v5, :cond_7

    .line 98
    .line 99
    const/4 v3, 0x0

    .line 100
    :goto_2
    iget-object v4, v0, Ll/c710;->s:[Ll/c710$a;

    .line 101
    .line 102
    array-length v5, v4

    .line 103
    if-ge v3, v5, :cond_7

    .line 104
    .line 105
    iget v5, v0, Ll/c710;->u:I

    .line 106
    .line 107
    if-eq v3, v5, :cond_6

    .line 108
    .line 109
    aget-object v4, v4, v3

    .line 110
    .line 111
    iget-object v4, v4, Ll/c710$a;->b:Ll/ufj0;

    .line 112
    .line 113
    invoke-static {v4, v12, v13, v14, v15}, Ll/c710;->r(Ll/ufj0;JJ)J

    .line 114
    .line 115
    .line 116
    move-result-wide v5

    .line 117
    cmp-long v11, v9, v7

    .line 118
    .line 119
    if-eqz v11, :cond_5

    .line 120
    .line 121
    invoke-static {v4, v9, v10, v1, v2}, Ll/c710;->r(Ll/ufj0;JJ)J

    .line 122
    .line 123
    .line 124
    move-result-wide v1

    .line 125
    :cond_5
    move-wide v14, v5

    .line 126
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_7
    new-instance v0, Ll/oke0;

    .line 130
    .line 131
    invoke-direct {v0, v12, v13, v14, v15}, Ll/oke0;-><init>(JJ)V

    .line 132
    .line 133
    .line 134
    cmp-long v3, v9, v7

    .line 135
    .line 136
    if-nez v3, :cond_8

    .line 137
    .line 138
    new-instance v1, Ll/mke0$a;

    .line 139
    .line 140
    invoke-direct {v1, v0}, Ll/mke0$a;-><init>(Ll/oke0;)V

    .line 141
    .line 142
    .line 143
    return-object v1

    .line 144
    :cond_8
    new-instance v3, Ll/oke0;

    .line 145
    .line 146
    invoke-direct {v3, v9, v10, v1, v2}, Ll/oke0;-><init>(JJ)V

    .line 147
    .line 148
    .line 149
    new-instance v1, Ll/mke0$a;

    .line 150
    .line 151
    invoke-direct {v1, v0, v3}, Ll/mke0$a;-><init>(Ll/oke0;Ll/oke0;)V

    .line 152
    .line 153
    .line 154
    return-object v1
.end method

.method public final q(J)I
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v4, -0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    move v6, v4

    .line 6
    move v7, v5

    .line 7
    const-wide v8, 0x7fffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const/4 v10, 0x1

    .line 13
    const-wide v11, 0x7fffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    const/4 v13, 0x1

    .line 19
    const-wide v14, 0x7fffffffffffffffL

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    const-wide v16, 0x7fffffffffffffffL

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v1, v0, Ll/c710;->s:[Ll/c710$a;

    .line 30
    .line 31
    array-length v2, v1

    .line 32
    if-ge v7, v2, :cond_7

    .line 33
    .line 34
    aget-object v1, v1, v7

    .line 35
    .line 36
    iget v2, v1, Ll/c710$a;->e:I

    .line 37
    .line 38
    iget-object v1, v1, Ll/c710$a;->b:Ll/ufj0;

    .line 39
    .line 40
    iget v3, v1, Ll/ufj0;->b:I

    .line 41
    .line 42
    if-ne v2, v3, :cond_0

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_0
    iget-object v1, v1, Ll/ufj0;->c:[J

    .line 46
    .line 47
    aget-wide v18, v1, v2

    .line 48
    .line 49
    iget-object v1, v0, Ll/c710;->t:[[J

    .line 50
    .line 51
    invoke-static {v1}, Ll/bmk0;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, [[J

    .line 56
    .line 57
    aget-object v1, v1, v7

    .line 58
    .line 59
    aget-wide v2, v1, v2

    .line 60
    .line 61
    sub-long v18, v18, p1

    .line 62
    .line 63
    const-wide/16 v20, 0x0

    .line 64
    .line 65
    cmp-long v1, v18, v20

    .line 66
    .line 67
    if-ltz v1, :cond_2

    .line 68
    .line 69
    const-wide/32 v20, 0x40000

    .line 70
    .line 71
    .line 72
    cmp-long v1, v18, v20

    .line 73
    .line 74
    if-ltz v1, :cond_1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move v1, v5

    .line 78
    goto :goto_2

    .line 79
    :cond_2
    :goto_1
    const/4 v1, 0x1

    .line 80
    :goto_2
    if-nez v1, :cond_3

    .line 81
    .line 82
    if-nez v13, :cond_4

    .line 83
    .line 84
    :cond_3
    if-ne v1, v13, :cond_5

    .line 85
    .line 86
    cmp-long v20, v18, v14

    .line 87
    .line 88
    if-gez v20, :cond_5

    .line 89
    .line 90
    :cond_4
    move v13, v1

    .line 91
    move-wide v11, v2

    .line 92
    move v6, v7

    .line 93
    move-wide/from16 v14, v18

    .line 94
    .line 95
    :cond_5
    cmp-long v18, v2, v8

    .line 96
    .line 97
    if-gez v18, :cond_6

    .line 98
    .line 99
    move v10, v1

    .line 100
    move-wide v8, v2

    .line 101
    move v4, v7

    .line 102
    :cond_6
    :goto_3
    add-int/lit8 v7, v7, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    cmp-long v0, v8, v16

    .line 106
    .line 107
    if-eqz v0, :cond_9

    .line 108
    .line 109
    if-eqz v10, :cond_9

    .line 110
    .line 111
    const-wide/32 v0, 0xa00000

    .line 112
    .line 113
    .line 114
    add-long/2addr v8, v0

    .line 115
    cmp-long v0, v11, v8

    .line 116
    .line 117
    if-gez v0, :cond_8

    .line 118
    .line 119
    goto :goto_4

    .line 120
    :cond_8
    return v4

    .line 121
    :cond_9
    :goto_4
    return v6
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public final s(Ll/asf;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c710;->d:Ll/ig60;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ig60;->Q(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/c710;->d:Ll/ig60;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-interface {p1, v0, v2, v1}, Ll/asf;->f([BII)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/c710;->d:Ll/ig60;

    .line 19
    .line 20
    invoke-static {v0}, Ll/g31;->f(Ll/ig60;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/c710;->d:Ll/ig60;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-interface {p1, p0}, Ll/asf;->o(I)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1}, Ll/asf;->h()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final t(J)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/f31$a;

    .line 17
    .line 18
    iget-wide v2, v0, Ll/f31$a;->b:J

    .line 19
    .line 20
    cmp-long v0, v2, p1

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/f31$a;

    .line 31
    .line 32
    iget v2, v0, Ll/f31;->a:I

    .line 33
    .line 34
    const v3, 0x6d6f6f76

    .line 35
    .line 36
    .line 37
    if-ne v2, v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/c710;->w(Ll/f31$a;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 45
    .line 46
    .line 47
    iput v1, p0, Ll/c710;->i:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object v1, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_0

    .line 57
    .line 58
    iget-object v1, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ll/f31$a;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ll/f31$a;->d(Ll/f31$a;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget p1, p0, Ll/c710;->i:I

    .line 71
    .line 72
    if-eq p1, v1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/c710;->n()V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method public final u()V
    .locals 5

    .line 1
    iget v0, p0, Ll/c710;->w:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget v0, p0, Ll/c710;->a:I

    .line 7
    .line 8
    and-int/2addr v0, v1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/c710;->r:Ll/bsf;

    .line 12
    .line 13
    const/4 v1, 0x4

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-interface {v0, v2, v1}, Ll/bsf;->b(II)Ll/qfj0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/c710;->x:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 26
    .line 27
    iget-object v3, p0, Ll/c710;->x:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    new-array v4, v4, [Lcom/google/android/exoplayer2/metadata/Metadata$Entry;

    .line 31
    .line 32
    aput-object v3, v4, v2

    .line 33
    .line 34
    invoke-direct {v1, v4}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>([Lcom/google/android/exoplayer2/metadata/Metadata$Entry;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    new-instance v2, Lcom/google/android/exoplayer2/k$b;

    .line 38
    .line 39
    invoke-direct {v2}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/k$b;->Z(Lcom/google/android/exoplayer2/metadata/Metadata;)Lcom/google/android/exoplayer2/k$b;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v0, v1}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/c710;->r:Ll/bsf;

    .line 54
    .line 55
    invoke-interface {v0}, Ll/bsf;->l()V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/c710;->r:Ll/bsf;

    .line 59
    .line 60
    new-instance v0, Ll/mke0$b;

    .line 61
    .line 62
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    invoke-direct {v0, v1, v2}, Ll/mke0$b;-><init>(J)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p0, v0}, Ll/bsf;->k(Ll/mke0;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public final w(Ll/f31$a;)V
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
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v9, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v2, v0, Ll/c710;->w:I

    .line 11
    .line 12
    const/4 v11, 0x1

    .line 13
    if-ne v2, v11, :cond_0

    .line 14
    .line 15
    move v7, v11

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v7, 0x0

    .line 18
    :goto_0
    new-instance v2, Ll/ilj;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/ilj;-><init>()V

    .line 21
    .line 22
    .line 23
    const v3, 0x75647461

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v3}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    invoke-static {v3}, Ll/g31;->C(Ll/f31$b;)Ll/g31$i;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget-object v4, v3, Ll/g31$i;->a:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 37
    .line 38
    iget-object v5, v3, Ll/g31$i;->b:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 39
    .line 40
    iget-object v3, v3, Ll/g31$i;->c:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 41
    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    invoke-virtual {v2, v4}, Ll/ilj;->c(Lcom/google/android/exoplayer2/metadata/Metadata;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    move-object v13, v3

    .line 48
    move-object v14, v4

    .line 49
    move-object v15, v5

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/4 v13, 0x0

    .line 52
    const/4 v14, 0x0

    .line 53
    const/4 v15, 0x0

    .line 54
    :goto_1
    const v3, 0x6d657461

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v3}, Ll/f31$a;->f(I)Ll/f31$a;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    if-eqz v3, :cond_3

    .line 62
    .line 63
    invoke-static {v3}, Ll/g31;->o(Ll/f31$a;)Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    const/4 v3, 0x0

    .line 69
    :goto_2
    const v4, 0x6d766864

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v4}, Ll/f31$a;->g(I)Ll/f31$b;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-static {v4}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    check-cast v4, Ll/f31$b;

    .line 81
    .line 82
    iget-object v4, v4, Ll/f31$b;->b:Ll/ig60;

    .line 83
    .line 84
    invoke-static {v4}, Ll/g31;->q(Ll/ig60;)Ll/g31$c;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    iget-object v4, v4, Ll/g31$c;->a:Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 89
    .line 90
    iget v5, v0, Ll/c710;->a:I

    .line 91
    .line 92
    and-int/2addr v5, v11

    .line 93
    if-eqz v5, :cond_4

    .line 94
    .line 95
    move v6, v11

    .line 96
    goto :goto_3

    .line 97
    :cond_4
    const/4 v6, 0x0

    .line 98
    :goto_3
    new-instance v8, Ll/a710;

    .line 99
    .line 100
    invoke-direct {v8}, Ll/a710;-><init>()V

    .line 101
    .line 102
    .line 103
    move-object v5, v3

    .line 104
    move-object/from16 v16, v4

    .line 105
    .line 106
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    move-object/from16 v17, v5

    .line 112
    .line 113
    const/4 v5, 0x0

    .line 114
    move-object/from16 v10, v16

    .line 115
    .line 116
    move-object/from16 v12, v17

    .line 117
    .line 118
    invoke-static/range {v1 .. v8}, Ll/g31;->B(Ll/f31$a;Ll/ilj;JLcom/google/android/exoplayer2/drm/DrmInitData;ZZLl/adj;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    const/4 v7, 0x0

    .line 132
    const/4 v8, -0x1

    .line 133
    const-wide v18, -0x7fffffffffffffffL    # -4.9E-324

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    :goto_4
    if-ge v7, v3, :cond_d

    .line 139
    .line 140
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v17

    .line 144
    move-object/from16 v4, v17

    .line 145
    .line 146
    check-cast v4, Ll/ufj0;

    .line 147
    .line 148
    iget v11, v4, Ll/ufj0;->b:I

    .line 149
    .line 150
    if-nez v11, :cond_5

    .line 151
    .line 152
    move-object/from16 v22, v1

    .line 153
    .line 154
    move/from16 v23, v3

    .line 155
    .line 156
    move-wide/from16 v24, v5

    .line 157
    .line 158
    const/4 v3, -0x1

    .line 159
    const/4 v5, 0x1

    .line 160
    goto/16 :goto_b

    .line 161
    .line 162
    :cond_5
    iget-object v11, v4, Ll/ufj0;->a:Ll/yej0;

    .line 163
    .line 164
    move/from16 v21, v8

    .line 165
    .line 166
    move-object/from16 v20, v9

    .line 167
    .line 168
    iget-wide v8, v11, Ll/yej0;->e:J

    .line 169
    .line 170
    cmp-long v22, v8, v18

    .line 171
    .line 172
    if-eqz v22, :cond_6

    .line 173
    .line 174
    goto :goto_5

    .line 175
    :cond_6
    iget-wide v8, v4, Ll/ufj0;->h:J

    .line 176
    .line 177
    :goto_5
    invoke-static {v5, v6, v8, v9}, Ljava/lang/Math;->max(JJ)J

    .line 178
    .line 179
    .line 180
    move-result-wide v5

    .line 181
    move-object/from16 v22, v1

    .line 182
    .line 183
    new-instance v1, Ll/c710$a;

    .line 184
    .line 185
    move/from16 v23, v3

    .line 186
    .line 187
    iget-object v3, v0, Ll/c710;->r:Ll/bsf;

    .line 188
    .line 189
    move-wide/from16 v24, v5

    .line 190
    .line 191
    iget v5, v11, Ll/yej0;->b:I

    .line 192
    .line 193
    invoke-interface {v3, v7, v5}, Ll/bsf;->b(II)Ll/qfj0;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-direct {v1, v11, v4, v3}, Ll/c710$a;-><init>(Ll/yej0;Ll/ufj0;Ll/qfj0;)V

    .line 198
    .line 199
    .line 200
    iget-object v3, v11, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 201
    .line 202
    iget-object v3, v3, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 203
    .line 204
    const-string v5, "audio/true-hd"

    .line 205
    .line 206
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    iget v5, v4, Ll/ufj0;->e:I

    .line 211
    .line 212
    if-eqz v3, :cond_7

    .line 213
    .line 214
    mul-int/lit8 v5, v5, 0x10

    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_7
    add-int/lit8 v5, v5, 0x1e

    .line 218
    .line 219
    :goto_6
    iget-object v3, v11, Ll/yej0;->f:Lcom/google/android/exoplayer2/k;

    .line 220
    .line 221
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/k;->b()Lcom/google/android/exoplayer2/k$b;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer2/k$b;->Y(I)Lcom/google/android/exoplayer2/k$b;

    .line 226
    .line 227
    .line 228
    iget v5, v11, Ll/yej0;->b:I

    .line 229
    .line 230
    const/4 v6, 0x2

    .line 231
    if-ne v5, v6, :cond_8

    .line 232
    .line 233
    const-wide/16 v26, 0x0

    .line 234
    .line 235
    cmp-long v5, v8, v26

    .line 236
    .line 237
    if-lez v5, :cond_8

    .line 238
    .line 239
    iget v4, v4, Ll/ufj0;->b:I

    .line 240
    .line 241
    const/4 v5, 0x1

    .line 242
    if-le v4, v5, :cond_9

    .line 243
    .line 244
    int-to-float v4, v4

    .line 245
    long-to-float v8, v8

    .line 246
    const v9, 0x49742400    # 1000000.0f

    .line 247
    .line 248
    .line 249
    div-float/2addr v8, v9

    .line 250
    div-float/2addr v4, v8

    .line 251
    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/k$b;->R(F)Lcom/google/android/exoplayer2/k$b;

    .line 252
    .line 253
    .line 254
    goto :goto_7

    .line 255
    :cond_8
    const/4 v5, 0x1

    .line 256
    :cond_9
    :goto_7
    iget v4, v11, Ll/yej0;->b:I

    .line 257
    .line 258
    invoke-static {v4, v2, v3}, Ll/ka00;->k(ILl/ilj;Lcom/google/android/exoplayer2/k$b;)V

    .line 259
    .line 260
    .line 261
    iget v4, v11, Ll/yej0;->b:I

    .line 262
    .line 263
    iget-object v8, v0, Ll/c710;->h:Ljava/util/List;

    .line 264
    .line 265
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 266
    .line 267
    .line 268
    move-result v8

    .line 269
    if-eqz v8, :cond_a

    .line 270
    .line 271
    const/4 v8, 0x0

    .line 272
    goto :goto_8

    .line 273
    :cond_a
    new-instance v8, Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 274
    .line 275
    iget-object v9, v0, Ll/c710;->h:Ljava/util/List;

    .line 276
    .line 277
    invoke-direct {v8, v9}, Lcom/google/android/exoplayer2/metadata/Metadata;-><init>(Ljava/util/List;)V

    .line 278
    .line 279
    .line 280
    :goto_8
    filled-new-array {v15, v8, v13, v10}, [Lcom/google/android/exoplayer2/metadata/Metadata;

    .line 281
    .line 282
    .line 283
    move-result-object v8

    .line 284
    invoke-static {v4, v14, v12, v3, v8}, Ll/ka00;->l(ILcom/google/android/exoplayer2/metadata/Metadata;Lcom/google/android/exoplayer2/metadata/Metadata;Lcom/google/android/exoplayer2/k$b;[Lcom/google/android/exoplayer2/metadata/Metadata;)V

    .line 285
    .line 286
    .line 287
    iget-object v4, v1, Ll/c710$a;->c:Ll/qfj0;

    .line 288
    .line 289
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-interface {v4, v3}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 294
    .line 295
    .line 296
    iget v3, v11, Ll/yej0;->b:I

    .line 297
    .line 298
    move/from16 v4, v21

    .line 299
    .line 300
    if-ne v3, v6, :cond_b

    .line 301
    .line 302
    const/4 v3, -0x1

    .line 303
    if-ne v4, v3, :cond_c

    .line 304
    .line 305
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    .line 306
    .line 307
    .line 308
    move-result v8

    .line 309
    :goto_9
    move-object/from16 v9, v20

    .line 310
    .line 311
    goto :goto_a

    .line 312
    :cond_b
    const/4 v3, -0x1

    .line 313
    :cond_c
    move v8, v4

    .line 314
    goto :goto_9

    .line 315
    :goto_a
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    :goto_b
    add-int/lit8 v7, v7, 0x1

    .line 319
    .line 320
    move v11, v5

    .line 321
    move-object/from16 v1, v22

    .line 322
    .line 323
    move/from16 v3, v23

    .line 324
    .line 325
    move-wide/from16 v5, v24

    .line 326
    .line 327
    goto/16 :goto_4

    .line 328
    .line 329
    :cond_d
    move v4, v8

    .line 330
    iput v4, v0, Ll/c710;->u:I

    .line 331
    .line 332
    iput-wide v5, v0, Ll/c710;->v:J

    .line 333
    .line 334
    const/4 v1, 0x0

    .line 335
    new-array v1, v1, [Ll/c710$a;

    .line 336
    .line 337
    invoke-interface {v9, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    check-cast v1, [Ll/c710$a;

    .line 342
    .line 343
    iput-object v1, v0, Ll/c710;->s:[Ll/c710$a;

    .line 344
    .line 345
    invoke-static {v1}, Ll/c710;->m([Ll/c710$a;)[[J

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    iput-object v1, v0, Ll/c710;->t:[[J

    .line 350
    .line 351
    iget-object v1, v0, Ll/c710;->r:Ll/bsf;

    .line 352
    .line 353
    invoke-interface {v1}, Ll/bsf;->l()V

    .line 354
    .line 355
    .line 356
    iget-object v1, v0, Ll/c710;->r:Ll/bsf;

    .line 357
    .line 358
    invoke-interface {v1, v0}, Ll/bsf;->k(Ll/mke0;)V

    .line 359
    .line 360
    .line 361
    return-void
.end method

.method public final x(J)V
    .locals 13

    .line 1
    iget v0, p0, Ll/c710;->j:I

    .line 2
    .line 3
    const v1, 0x6d707664

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    new-instance v2, Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 9
    .line 10
    iget v0, p0, Ll/c710;->l:I

    .line 11
    .line 12
    int-to-long v3, v0

    .line 13
    add-long v9, p1, v3

    .line 14
    .line 15
    iget-wide v3, p0, Ll/c710;->k:J

    .line 16
    .line 17
    int-to-long v0, v0

    .line 18
    sub-long v11, v3, v0

    .line 19
    .line 20
    const-wide/16 v3, 0x0

    .line 21
    .line 22
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    move-wide v5, p1

    .line 28
    invoke-direct/range {v2 .. v12}, Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;-><init>(JJJJJ)V

    .line 29
    .line 30
    .line 31
    iput-object v2, p0, Ll/c710;->x:Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final y(Ll/asf;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/c710;->l:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p1, v0, v3, v2, v1}, Ll/asf;->b([BIIZ)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/c710;->u()V

    .line 22
    .line 23
    .line 24
    return v3

    .line 25
    :cond_0
    iput v2, p0, Ll/c710;->l:I

    .line 26
    .line 27
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Ll/ig60;->U(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/ig60;->J()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    iput-wide v4, p0, Ll/c710;->k:J

    .line 39
    .line 40
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/ig60;->q()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Ll/c710;->j:I

    .line 47
    .line 48
    :cond_1
    iget-wide v4, p0, Ll/c710;->k:J

    .line 49
    .line 50
    const-wide/16 v6, 0x1

    .line 51
    .line 52
    cmp-long v0, v4, v6

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p1, v0, v2, v2}, Ll/asf;->readFully([BII)V

    .line 63
    .line 64
    .line 65
    iget v0, p0, Ll/c710;->l:I

    .line 66
    .line 67
    add-int/2addr v0, v2

    .line 68
    iput v0, p0, Ll/c710;->l:I

    .line 69
    .line 70
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/ig60;->M()J

    .line 73
    .line 74
    .line 75
    move-result-wide v4

    .line 76
    iput-wide v4, p0, Ll/c710;->k:J

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const-wide/16 v6, 0x0

    .line 80
    .line 81
    cmp-long v0, v4, v6

    .line 82
    .line 83
    if-nez v0, :cond_4

    .line 84
    .line 85
    invoke-interface {p1}, Ll/asf;->getLength()J

    .line 86
    .line 87
    .line 88
    move-result-wide v4

    .line 89
    const-wide/16 v6, -0x1

    .line 90
    .line 91
    cmp-long v0, v4, v6

    .line 92
    .line 93
    if-nez v0, :cond_3

    .line 94
    .line 95
    iget-object v0, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Ll/f31$a;

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    iget-wide v4, v0, Ll/f31$a;->b:J

    .line 106
    .line 107
    :cond_3
    cmp-long v0, v4, v6

    .line 108
    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 112
    .line 113
    .line 114
    move-result-wide v6

    .line 115
    sub-long/2addr v4, v6

    .line 116
    iget v0, p0, Ll/c710;->l:I

    .line 117
    .line 118
    int-to-long v6, v0

    .line 119
    add-long/2addr v4, v6

    .line 120
    iput-wide v4, p0, Ll/c710;->k:J

    .line 121
    .line 122
    :cond_4
    :goto_0
    iget-wide v4, p0, Ll/c710;->k:J

    .line 123
    .line 124
    iget v0, p0, Ll/c710;->l:I

    .line 125
    .line 126
    int-to-long v6, v0

    .line 127
    cmp-long v0, v4, v6

    .line 128
    .line 129
    if-ltz v0, :cond_b

    .line 130
    .line 131
    iget v0, p0, Ll/c710;->j:I

    .line 132
    .line 133
    invoke-static {v0}, Ll/c710;->C(I)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_7

    .line 138
    .line 139
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 140
    .line 141
    .line 142
    move-result-wide v2

    .line 143
    iget-wide v4, p0, Ll/c710;->k:J

    .line 144
    .line 145
    add-long/2addr v2, v4

    .line 146
    iget v0, p0, Ll/c710;->l:I

    .line 147
    .line 148
    int-to-long v6, v0

    .line 149
    sub-long/2addr v2, v6

    .line 150
    int-to-long v6, v0

    .line 151
    cmp-long v0, v4, v6

    .line 152
    .line 153
    if-eqz v0, :cond_5

    .line 154
    .line 155
    iget v0, p0, Ll/c710;->j:I

    .line 156
    .line 157
    const v4, 0x6d657461

    .line 158
    .line 159
    .line 160
    if-ne v0, v4, :cond_5

    .line 161
    .line 162
    invoke-virtual {p0, p1}, Ll/c710;->s(Ll/asf;)V

    .line 163
    .line 164
    .line 165
    :cond_5
    iget-object p1, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 166
    .line 167
    new-instance v0, Ll/f31$a;

    .line 168
    .line 169
    iget v4, p0, Ll/c710;->j:I

    .line 170
    .line 171
    invoke-direct {v0, v4, v2, v3}, Ll/f31$a;-><init>(IJ)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    iget-wide v4, p0, Ll/c710;->k:J

    .line 178
    .line 179
    iget p1, p0, Ll/c710;->l:I

    .line 180
    .line 181
    int-to-long v6, p1

    .line 182
    cmp-long p1, v4, v6

    .line 183
    .line 184
    if-nez p1, :cond_6

    .line 185
    .line 186
    invoke-virtual {p0, v2, v3}, Ll/c710;->t(J)V

    .line 187
    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_6
    invoke-virtual {p0}, Ll/c710;->n()V

    .line 191
    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_7
    iget v0, p0, Ll/c710;->j:I

    .line 195
    .line 196
    invoke-static {v0}, Ll/c710;->D(I)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_a

    .line 201
    .line 202
    iget p1, p0, Ll/c710;->l:I

    .line 203
    .line 204
    if-ne p1, v2, :cond_8

    .line 205
    .line 206
    move p1, v1

    .line 207
    goto :goto_1

    .line 208
    :cond_8
    move p1, v3

    .line 209
    :goto_1
    invoke-static {p1}, Ll/w11;->g(Z)V

    .line 210
    .line 211
    .line 212
    iget-wide v4, p0, Ll/c710;->k:J

    .line 213
    .line 214
    const-wide/32 v6, 0x7fffffff

    .line 215
    .line 216
    .line 217
    cmp-long p1, v4, v6

    .line 218
    .line 219
    if-gtz p1, :cond_9

    .line 220
    .line 221
    move p1, v1

    .line 222
    goto :goto_2

    .line 223
    :cond_9
    move p1, v3

    .line 224
    :goto_2
    invoke-static {p1}, Ll/w11;->g(Z)V

    .line 225
    .line 226
    .line 227
    new-instance p1, Ll/ig60;

    .line 228
    .line 229
    iget-wide v4, p0, Ll/c710;->k:J

    .line 230
    .line 231
    long-to-int v0, v4

    .line 232
    invoke-direct {p1, v0}, Ll/ig60;-><init>(I)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/c710;->e:Ll/ig60;

    .line 236
    .line 237
    invoke-virtual {v0}, Ll/ig60;->e()[B

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-virtual {p1}, Ll/ig60;->e()[B

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    invoke-static {v0, v3, v4, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 246
    .line 247
    .line 248
    iput-object p1, p0, Ll/c710;->m:Ll/ig60;

    .line 249
    .line 250
    iput v1, p0, Ll/c710;->i:I

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :cond_a
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 254
    .line 255
    .line 256
    move-result-wide v2

    .line 257
    iget p1, p0, Ll/c710;->l:I

    .line 258
    .line 259
    int-to-long v4, p1

    .line 260
    sub-long/2addr v2, v4

    .line 261
    invoke-virtual {p0, v2, v3}, Ll/c710;->x(J)V

    .line 262
    .line 263
    .line 264
    const/4 p1, 0x0

    .line 265
    iput-object p1, p0, Ll/c710;->m:Ll/ig60;

    .line 266
    .line 267
    iput v1, p0, Ll/c710;->i:I

    .line 268
    .line 269
    :goto_3
    return v1

    .line 270
    :cond_b
    const-string p0, "Atom size less than header length (unsupported)."

    .line 271
    .line 272
    invoke-static {p0}, Lcom/google/android/exoplayer2/ParserException;->createForUnsupportedContainerFeature(Ljava/lang/String;)Lcom/google/android/exoplayer2/ParserException;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    throw p0
.end method

.method public final z(Ll/asf;Ll/ll80;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/c710;->k:J

    .line 2
    .line 3
    iget v2, p0, Ll/c710;->l:I

    .line 4
    .line 5
    int-to-long v2, v2

    .line 6
    sub-long/2addr v0, v2

    .line 7
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    add-long/2addr v2, v0

    .line 12
    iget-object v4, p0, Ll/c710;->m:Ll/ig60;

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    const/4 v6, 0x0

    .line 16
    if-eqz v4, :cond_1

    .line 17
    .line 18
    invoke-virtual {v4}, Ll/ig60;->e()[B

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget v7, p0, Ll/c710;->l:I

    .line 23
    .line 24
    long-to-int v0, v0

    .line 25
    invoke-interface {p1, p2, v7, v0}, Ll/asf;->readFully([BII)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Ll/c710;->j:I

    .line 29
    .line 30
    const p2, 0x66747970

    .line 31
    .line 32
    .line 33
    if-ne p1, p2, :cond_0

    .line 34
    .line 35
    invoke-static {v4}, Ll/c710;->v(Ll/ig60;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Ll/c710;->w:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p1, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    iget-object p1, p0, Ll/c710;->f:Ljava/util/ArrayDeque;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ll/f31$a;

    .line 57
    .line 58
    new-instance p2, Ll/f31$b;

    .line 59
    .line 60
    iget v0, p0, Ll/c710;->j:I

    .line 61
    .line 62
    invoke-direct {p2, v0, v4}, Ll/f31$b;-><init>(ILl/ig60;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p2}, Ll/f31$a;->e(Ll/f31$b;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const-wide/32 v7, 0x40000

    .line 70
    .line 71
    .line 72
    cmp-long v4, v0, v7

    .line 73
    .line 74
    if-gez v4, :cond_3

    .line 75
    .line 76
    long-to-int p2, v0

    .line 77
    invoke-interface {p1, p2}, Ll/asf;->o(I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_0
    move p1, v6

    .line 81
    goto :goto_1

    .line 82
    :cond_3
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 83
    .line 84
    .line 85
    move-result-wide v7

    .line 86
    add-long/2addr v7, v0

    .line 87
    iput-wide v7, p2, Ll/ll80;->a:J

    .line 88
    .line 89
    move p1, v5

    .line 90
    :goto_1
    invoke-virtual {p0, v2, v3}, Ll/c710;->t(J)V

    .line 91
    .line 92
    .line 93
    if-eqz p1, :cond_4

    .line 94
    .line 95
    iget p0, p0, Ll/c710;->i:I

    .line 96
    .line 97
    const/4 p1, 0x2

    .line 98
    if-eq p0, p1, :cond_4

    .line 99
    .line 100
    return v5

    .line 101
    :cond_4
    return v6
.end method
