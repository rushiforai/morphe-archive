.class public final Ll/lqf0;
.super Lcom/google/android/exoplayer2/c0;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final s:Ljava/lang/Object;

.field public static final t:Lcom/google/android/exoplayer2/n;


# instance fields
.field public final f:J

.field public final g:J

.field public final h:J

.field public final i:J

.field public final j:J

.field public final k:J

.field public final l:J

.field public final m:Z

.field public final n:Z

.field public final o:Z

.field public final p:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final q:Lcom/google/android/exoplayer2/n;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final r:Lcom/google/android/exoplayer2/n$g;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/lqf0;->s:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/exoplayer2/n$c;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$c;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "SinglePeriodTimeline"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/n$c;->c(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/n$c;->f(Landroid/net/Uri;)Lcom/google/android/exoplayer2/n$c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$c;->a()Lcom/google/android/exoplayer2/n;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Ll/lqf0;->t:Lcom/google/android/exoplayer2/n;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(JJJJJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/n$g;)V
    .locals 0
    .param p18    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p20    # Lcom/google/android/exoplayer2/n$g;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    invoke-direct {p0}, Lcom/google/android/exoplayer2/c0;-><init>()V

    .line 53
    iput-wide p1, p0, Ll/lqf0;->f:J

    .line 54
    iput-wide p3, p0, Ll/lqf0;->g:J

    .line 55
    iput-wide p5, p0, Ll/lqf0;->h:J

    .line 56
    iput-wide p7, p0, Ll/lqf0;->i:J

    .line 57
    iput-wide p9, p0, Ll/lqf0;->j:J

    .line 58
    iput-wide p11, p0, Ll/lqf0;->k:J

    .line 59
    iput-wide p13, p0, Ll/lqf0;->l:J

    .line 60
    iput-boolean p15, p0, Ll/lqf0;->m:Z

    move/from16 p1, p16

    .line 61
    iput-boolean p1, p0, Ll/lqf0;->n:Z

    move/from16 p1, p17

    .line 62
    iput-boolean p1, p0, Ll/lqf0;->o:Z

    move-object/from16 p1, p18

    .line 63
    iput-object p1, p0, Ll/lqf0;->p:Ljava/lang/Object;

    .line 64
    invoke-static/range {p19 .. p19}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/exoplayer2/n;

    iput-object p1, p0, Ll/lqf0;->q:Lcom/google/android/exoplayer2/n;

    move-object/from16 p1, p20

    .line 65
    iput-object p1, p0, Ll/lqf0;->r:Lcom/google/android/exoplayer2/n$g;

    return-void
.end method

.method public constructor <init>(JJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V
    .locals 21
    .param p12    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p13

    .line 2
    .line 3
    if-eqz p11, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lcom/google/android/exoplayer2/n;->d:Lcom/google/android/exoplayer2/n$g;

    .line 6
    .line 7
    :goto_0
    move-object/from16 v20, v1

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v1, 0x0

    .line 11
    goto :goto_0

    .line 12
    :goto_1
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    const/16 v17, 0x0

    .line 28
    .line 29
    move-wide/from16 v7, p1

    .line 30
    .line 31
    move-wide/from16 v9, p3

    .line 32
    .line 33
    move-wide/from16 v11, p5

    .line 34
    .line 35
    move-wide/from16 v13, p7

    .line 36
    .line 37
    move/from16 v15, p9

    .line 38
    .line 39
    move/from16 v16, p10

    .line 40
    .line 41
    move-object/from16 v18, p12

    .line 42
    .line 43
    move-object/from16 v19, v0

    .line 44
    .line 45
    move-object/from16 v0, p0

    .line 46
    .line 47
    invoke-direct/range {v0 .. v20}, Ll/lqf0;-><init>(JJJJJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;Lcom/google/android/exoplayer2/n$g;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public constructor <init>(JZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V
    .locals 14
    .param p6    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-wide v3, p1

    move-object v0, p0

    move-wide v1, p1

    move/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    move-object/from16 v12, p6

    move-object/from16 v13, p7

    .line 51
    invoke-direct/range {v0 .. v13}, Ll/lqf0;-><init>(JJJJZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V

    return-void
.end method


# virtual methods
.method public f(Ljava/lang/Object;)I
    .locals 0

    .line 1
    sget-object p0, Ll/lqf0;->s:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, -0x1

    .line 12
    return p0
.end method

.method public k(ILcom/google/android/exoplayer2/c0$b;Z)Lcom/google/android/exoplayer2/c0$b;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p1, v0, v1}, Ll/w11;->c(III)I

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/lqf0;->s:Ljava/lang/Object;

    .line 9
    .line 10
    :goto_0
    move-object v2, p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    iget-wide v4, p0, Ll/lqf0;->i:J

    .line 15
    .line 16
    iget-wide p0, p0, Ll/lqf0;->k:J

    .line 17
    .line 18
    neg-long v6, p0

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    move-object v0, p2

    .line 22
    invoke-virtual/range {v0 .. v7}, Lcom/google/android/exoplayer2/c0$b;->v(Ljava/lang/Object;Ljava/lang/Object;IJJ)Lcom/google/android/exoplayer2/c0$b;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public q(I)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    invoke-static {p1, p0, v0}, Ll/w11;->c(III)I

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/lqf0;->s:Ljava/lang/Object;

    .line 7
    .line 8
    return-object p0
.end method

.method public s(ILcom/google/android/exoplayer2/c0$d;J)Lcom/google/android/exoplayer2/c0$d;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    move/from16 v3, p1

    .line 6
    .line 7
    invoke-static {v3, v1, v2}, Ll/w11;->c(III)I

    .line 8
    .line 9
    .line 10
    iget-wide v1, v0, Ll/lqf0;->l:J

    .line 11
    .line 12
    iget-boolean v14, v0, Ll/lqf0;->n:Z

    .line 13
    .line 14
    if-eqz v14, :cond_1

    .line 15
    .line 16
    iget-boolean v3, v0, Ll/lqf0;->o:Z

    .line 17
    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    const-wide/16 v3, 0x0

    .line 21
    .line 22
    cmp-long v3, p3, v3

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget-wide v3, v0, Ll/lqf0;->j:J

    .line 27
    .line 28
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    cmp-long v7, v3, v5

    .line 34
    .line 35
    if-nez v7, :cond_0

    .line 36
    .line 37
    :goto_0
    move-wide/from16 v16, v5

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    add-long v1, v1, p3

    .line 41
    .line 42
    cmp-long v3, v1, v3

    .line 43
    .line 44
    if-lez v3, :cond_1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move-wide/from16 v16, v1

    .line 48
    .line 49
    :goto_1
    sget-object v4, Lcom/google/android/exoplayer2/c0$d;->r:Ljava/lang/Object;

    .line 50
    .line 51
    iget-object v5, v0, Ll/lqf0;->q:Lcom/google/android/exoplayer2/n;

    .line 52
    .line 53
    iget-object v6, v0, Ll/lqf0;->p:Ljava/lang/Object;

    .line 54
    .line 55
    iget-wide v7, v0, Ll/lqf0;->f:J

    .line 56
    .line 57
    iget-wide v9, v0, Ll/lqf0;->g:J

    .line 58
    .line 59
    iget-wide v11, v0, Ll/lqf0;->h:J

    .line 60
    .line 61
    iget-boolean v13, v0, Ll/lqf0;->m:Z

    .line 62
    .line 63
    iget-object v15, v0, Ll/lqf0;->r:Lcom/google/android/exoplayer2/n$g;

    .line 64
    .line 65
    iget-wide v1, v0, Ll/lqf0;->j:J

    .line 66
    .line 67
    const/16 v21, 0x0

    .line 68
    .line 69
    move-wide/from16 v18, v1

    .line 70
    .line 71
    iget-wide v0, v0, Ll/lqf0;->k:J

    .line 72
    .line 73
    const/16 v20, 0x0

    .line 74
    .line 75
    move-object/from16 v3, p2

    .line 76
    .line 77
    move-wide/from16 v22, v0

    .line 78
    .line 79
    invoke-virtual/range {v3 .. v23}, Lcom/google/android/exoplayer2/c0$d;->i(Ljava/lang/Object;Lcom/google/android/exoplayer2/n;Ljava/lang/Object;JJJZZLcom/google/android/exoplayer2/n$g;JJIIJ)Lcom/google/android/exoplayer2/c0$d;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    return-object v0
.end method

.method public t()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
